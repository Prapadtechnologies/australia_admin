<?php
require APPPATH . '/libraries/MY_REST_Controller.php';
require APPPATH . '/vendor/autoload.php';

use Firebase\JWT\JWT;

class Payment extends MY_REST_Controller
{
    public $checkSum;
    public function __construct()
    {
        parent::__construct();
        header("Pragma: no-cache");
        header("Cache-Control: no-cache");
        header("Expires: 0");
        $this->load->model('user_model');
        $this->load->model('wallet_transaction_model');
        $this->load->model('bank_details_model');
        $this->load->model('setting_model');
    }
    
    /**
     * @author Mehar
     * @desc To manage wallet amount
     * 
     */
    public function wallet_post($type = 'withdrawal'){
        $token_data = $this->validate_token($this->input->get_request_header('X_AUTH_TOKEN'));
        if($type == 'withdrawal'){
            $_POST = json_decode(file_get_contents('php://input'), TRUE);
            $data = $this->db->order_by('id', 'DESC')->where(['user_id'=> $token_data->id,'approved'=>0])->get('withdraw_requests')->result_array();
            if($data){
                $this->set_response(NULL, 'You have already requested for withdrawal.', REST_Controller::HTTP_OK, FALSE);
            }else{
                $amount = floatval($this->input->post('WITHDRAWAMOUNT'));
                $withdraw_req = $this->db->insert('withdraw_requests',[
                    'user_id' => $token_data->id,
                    'amount' => $amount,
                    'transaction_note' => 'User requested for withdrawal',
                    'bank_id' => $this->input->post('BANK_ID')
                ]);
                if($withdraw_req){
                    $this->set_response(NULL, 'Withdraw Requested Successfuly ', REST_Controller::HTTP_OK, TRUE);
                }else{
                    $this->set_response(NULL, 'Internal Error Occured', REST_Controller::HTTP_OK, FALSE);
                }
            }
        }else if($type == 'deposit'){
            $_POST = json_decode(file_get_contents('php://input'), TRUE);
            $amount = floatval($this->input->post('TXNAMOUNT'));
            $wallet = $this->user_model->where('id', $token_data->id)->fields('wallet')->as_array()->get();
            $user_wallet=floatval($wallet['wallet']);// + $amount;
            $id = $this->wallet_transaction_model->insert([
                'user_id' => $token_data->id,
                //'type' => 'CREDIT',
                'credit' => $amount,
                'balance' => $user_wallet,
                'transaction_id'=>$this->input->post('TRANSACTION_ID'),
                'transaction_type' => $this->input->post('TRANSACTION_TYPE'),
                'title' => $this->input->post('TITLE'),
                'reference' => $this->input->post('PLANID'),
                'description' => $this->input->post('DESC'),
            ]);
            if($id){
                /*$this->user_model->update([
                    'id' => $token_data->id,
                    'wallet' =>  floatval($wallet['wallet']) + $amount
                ], 'id');*/
                $this->set_response($user_wallet, 'Wallet Updated', REST_Controller::HTTP_OK, TRUE);
            }else{
                $this->set_response(NULL, 'Internal Error Occured', REST_Controller::HTTP_OK, FALSE);
            }
        }elseif($type == 'history'){
            $data = $this->wallet_transaction_model->order_by('id', 'DESC')->where(['user_id'=> $token_data->id,'transaction_type !='=>'order_place'])->get_all();
            if($data){
                for ($i=0; $i < count($data); $i++) {
                    //echo (($data[$i]['credit'] > 0)? float_val($data[$i]['credit']) : float_val($data[$i]['debit']));die;
                    $return[]=[
                        'id'=>$data[$i]['id'],
                        'user_id'=>$data[$i]['user_id'],
                        'transaction_id'=>$data[$i]['transaction_id'],
                        'cash'=>(float)(($data[$i]['credit'] > 0)? float_val($data[$i]['credit']) : float_val($data[$i]['debit'])),
                        'type'=>(($data[$i]['credit'] > 0)? 'CREDIT' : 'DEBIT'),
                        'balance'=>(float)$data[$i]['balance'],
                        'title'=>$data[$i]['title'],
                        'description'=>$data[$i]['description'],
                        'transaction_type'=>$data[$i]['transaction_type'],
                        'transaction_value'=>get_transaction_type($data[$i]['transaction_type']),
                        'created_at'=>date('M d,Y h:i A',strtotime($data[$i]['created_at']))
                    ];
                }
            }else{
                $return=FALSE;    
            }
            $this->set_response_simple(($return == FALSE)? FALSE : $return, 'Success..!', REST_Controller::HTTP_OK, TRUE);
        }elseif($type == 'withdrawal_list'){
            $data = $this->db->order_by('id', 'DESC')->where('user_id', $token_data->id)->get('withdraw_requests')->result_array();
            if($data){
                for ($i=0; $i < count($data); $i++) {
                    $return[]=[
                        'id'=>$data[$i]['id'],
                        'user_id'=>$data[$i]['user_id'],
                        'amount'=>(float)(float_val($data[$i]['amount'])),
                        'balance'=>(float)$data[$i]['balance'],
                        'transaction_note'=>$data[$i]['transaction_note'],
                        'status_text'=>($data[$i]['approved'] == 0 ? 'Waiting for Approval' : ($data[$i]['approved'] == 1 ? 'Approved' : 'Rejected')),
                        'status'=>$data[$i]['approved'],
                        'created_at'=>date('M d,Y h:i A',strtotime($data[$i]['created_at']))
                    ];
                }
            }else{
                $return=FALSE;    
            }
            $this->set_response_simple(($return == FALSE)? FALSE : $return, 'Success..!', REST_Controller::HTTP_OK, TRUE);
        }elseif ($type == 'plan_pay'){
            
        }
        
    }
    public function bankdetails_post($type = 'list'){
        $token_data = $this->validate_token($this->input->get_request_header('X_AUTH_TOKEN'));
        if($type == 'add'){
            $_POST = json_decode(file_get_contents('php://input'), TRUE);
            $source = $this->bank_details_model->insert([
                'user_id' => $token_data->id,
                'name' => $this->input->post('NAME'),
                'ac' => $this->input->post('AC'),
                'ifsc' => $this->input->post('IFSC'),
                'bank_name' => $this->input->post('BANK_NAME'),
            ]);
            $this->set_response_simple(null, 'Successfully bank details added..!', REST_Controller::HTTP_OK, TRUE);
        }elseif($type == 'list'){
            $data = $this->bank_details_model->order_by('id', 'DESC')->where('user_id', $token_data->id)->get_all();
            $this->set_response_simple(($data == FALSE)? FALSE : $data, 'Success..!', REST_Controller::HTTP_OK, TRUE);
        }
        
    }
    
    public function payment_settings_get()
    {
        $result['pay_per_referal'] = $this->setting_model->where('key', 'pay_per_referal')->get()['value'];
        $result['min_withdraw'] = $this->setting_model->where('key', 'min_withdraw')->get()['value'];
        $result['commission_on_withdraw'] = $this->setting_model->where('key', 'commission_on_withdraw')->get()['value'];
        $result['withdraw_days'] = $this->setting_model->where('key', 'withdraw_days')->get()['value'];
        $result['home_page'] = $this->setting_model->where('key', 'home_page')->get()['value'];
        $this->set_response_simple(($result == FALSE) ? FALSE : $result, 'Success..!', REST_Controller::HTTP_OK, TRUE);
    }
    public function plans_get($id='')
    {
        if(isset($_GET['id']) && $_GET['id'] != ''){
            $id=$_GET['id'];
        }
        if($id != ''){
            $data = $this->db->where(['id'=> $id,'status'=>1])->get('plans')->result();
        }else{
            $data = $this->db->where(['status'=>1])->get('plans')->result();  
        }
        if($data){
            for ($i=0; $i < count($data); $i++) { 
                $data[$i]->created_at=date('M d,Y h:i A',strtotime($data[$i]->created_at));
            }
        }
        $this->set_response_simple(($data == FALSE) ? FALSE : $data, 'Success..!', REST_Controller::HTTP_OK, TRUE); 
    }
}
