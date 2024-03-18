<?php

class Payment extends MY_Controller
{

    public function __construct()
    {
        parent::__construct();
        $this->template = 'template/admin/main';
        $this->load->model('wallet_transaction_model');
        $this->load->model('user_model');
    }
    
    public function wallet_transactions($type = 'list'){
        if($type == 'list'){
            $this->data['title'] = 'Transactions List';
            $this->data['content'] = 'payment/list';
            if(isset($_GET['user_id']) && $_GET['user_id'] != ''){
                $this->data['transactions'] = $this->wallet_transaction_model->where(['user_id'=>$_GET['user_id']])->order_by('created_at','desc')->get_all();
            }else{ 
                $this->data['transactions'] = $this->wallet_transaction_model->order_by('created_at','desc')->get_all();
            }
            if(! empty($this->data['transactions'])){
                for ($i = 0; $i < count($this->data['transactions']) ; $i++){
                    $this->data['transactions'][$i]['unique_id'] = $this->user_model->get($this->data['transactions'][$i]['user_id'])['unique_id'];
                }
            }
            $this->_render_page($this->template, $this->data);
        }elseif ($type == 'change_status'){
            $this->db->where('id',$this->input->post('id'))->update('withdraw_requests',[
                    'id' => $this->input->post('id'),
                    'approved' => $this->input->post('status'),
                 ]);
            if($this->input->post('status') == 1){
                $my_with=$this->db->get_where('withdraw_requests',['id'=>$this->input->post('id')])->row();
                $amount = floatval($my_with->amount);
                $wallet = $this->user_model->where('id', $my_with->user_id)->fields('wallet')->as_array()->get();
                $id = $this->wallet_transaction_model->insert([
                    'user_id' => $my_with->user_id,
                    'debit' => $amount,
                    'balance' => floatval($wallet['wallet']) - $amount,
                    'transaction_id'=>$this->input->post('txn_id'),
                    'transaction_type' => 'withdrawal',
                    'title' => 'Withdraw Request Approved',
                    'reference' => '',
                    'description' => $my_with->transaction_note,
                ]);
                if($id){
                    $this->user_model->update([
                        'id' => $my_with->user_id,
                        'wallet' =>  floatval($wallet['wallet']) - $amount
                    ], 'id');
                    $this->session->set_flashdata('message', 'Request Approved');
                }else{
                    $this->session->set_flashdata('message', 'Something Went wrong');
                }
                /*echo $this->wallet_transaction_model->update([
                    'id' => $this->input->post('id'),
                    'txn_id' => $this->input->post('txn_id'),
                    'status' => $this->input->post('status'),
                ], 'id');*/
            }
/*                echo $this->wallet_transaction_model->update([
                    'id' => $this->input->post('id'),
                    'txn_id' => $this->input->post('txn_id'),
                    'status' => $this->input->post('status'),
                ], 'id');*/
        }
    }
    public function withdraw_list($type = 'list',$status='0')
    {
        if($type == 'list'){
            $this->data['title'] = 'Withdraw List';
            $this->data['content'] = 'payment/withdraw_list';
            $this->data['page_status'] = $status;
            if(isset($_GET['user_id']) && $_GET['user_id'] != ''){
                $this->data['transactions'] = $this->db->order_by('created_at','desc')->get_where('withdraw_requests',['approved'=>$status,'user_id'=>$_GET['user_id']])->result_array();
            }else{
                $this->data['transactions'] = $this->db->order_by('created_at','desc')->get_where('withdraw_requests',['approved'=>$status])->result_array();
            }
            if(! empty($this->data['transactions'])){
                for ($i = 0; $i < count($this->data['transactions']) ; $i++){
                    $this->data['transactions'][$i]['unique_id'] = $this->user_model->get($this->data['transactions'][$i]['user_id'])['unique_id'];
                }
            }
            $this->_render_page($this->template, $this->data);
        }
    }
}

