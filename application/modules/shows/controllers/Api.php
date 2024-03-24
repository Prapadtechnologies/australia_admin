<?php
require APPPATH . '/libraries/MY_REST_Controller.php';
require APPPATH . '/vendor/autoload.php';

use Firebase\JWT\JWT;

class Api extends MY_REST_Controller
{

    public function __construct()
    {
        parent::__construct();
        $this->load->model('user_model');
    }

    /**
     * To get states and relatd details
     *
     * @author Mehar
     * */

    public function venue_address_get()
    {
        //$this->validate_token($this->input->get_request_header('X_AUTH_TOKEN'));
        $target = $_GET['q'];
        if (strlen($target) > 0) {
            $where="lower('name') like '%".strtolower($target)."%'";
            $data = $this->db->select('id, name, addressLineOne')
                    ->like('name', $target, 'both')
                    ->or_like('addressLineOne', $target, 'both')
                    ->get('venue_address')
                    ->result_array();
        }else{
            $data = $this->db->select('id, name, addressLineOne')
                    ->get('venue_address')
                    ->result_array();
        }
        $this->set_response_simple(($data == FALSE) ? FALSE : $data, 'Success..!', REST_Controller::HTTP_OK, TRUE);
    }

    public function shows_list_get($tour_id='')
    {
        //$this->validate_token($this->input->get_request_header('X_AUTH_TOKEN'));
            //$where="lower('name') like '%".strtolower($target)."%'";
        $status=$this->input->get('status');
        if($tour_id == ''){
            $res=$this->db->order_by('tour_name','asc')->get('tour')->row();
            $tour_id=$res->id;
        }

                $this->db->select('*');
                $this->db->order_by('start_date','asc');
                $this->db->where('tour_id',$tour_id);
        $total = $this->db->get('shows');
        $total_count=$total->num_rows();
        $total_data=$total->result_array();

                $this->db->select('*');
                $this->db->order_by('start_date','asc');
                $this->db->where('tour_id',$tour_id);
                $this->db->where('start_date >=',date('Y-m-d'));
                $this->db->where('status','active');
        $left = $this->db->get('shows');
        $left_count=$left->num_rows();
        $left_data=$left->result_array();

                $this->db->select('*');
                $this->db->order_by('start_date','asc');
                $this->db->where('tour_id',$tour_id);
                $this->db->where('status','inactive');
        $cancelled = $this->db->get('shows');
        $cancelled_count=$cancelled->num_rows();
        $cancelled_data=$cancelled->result_array();

                $this->db->select('*');
                $this->db->order_by('start_date','asc');
                $this->db->where('tour_id',$tour_id);
                $this->db->where('end_date <',date('Y-m-d'));
                $this->db->where('status','active');
        $completed = $this->db->get('shows');
        $completed_count=$completed->num_rows();
        $completed_data=$completed->result_array();


        $data['shows_status']=[
            ['key'=>'total','label'=>'Total Shows','count'=>$total_count],
            ['key'=>'left','label'=>'Shows Left','count'=>$left_count],
            ['key'=>'cancelled','label'=>'Cancelled','count'=>$cancelled_count],
            ['key'=>'completed','label'=>'Completed','count'=>$completed_count]
        ];
        if($status == 'total' || $status == 'left' || $status == 'cancelled' || $status == 'completed'){
            $list_data=$$status->result_array();
        }else{
            $list_data=[];
        }
        $data['list']=$list_data;
        // $data['list']['total']=$total_data;
        // $data['list']['left']=$left_data;
        // $data['list']['cancelled']=$cancelled_data;
        // $data['list']['completed']=$completed_data;
        $this->set_response_simple(($data == FALSE) ? FALSE : $data, 'Success..!', REST_Controller::HTTP_OK, TRUE);
    }
    public function show_create_post()
    {
        //$token_data = $this->validate_token($this->input->get_request_header('X_AUTH_TOKEN'));
        $_POST = json_decode(file_get_contents("php://input"), TRUE);
        /*$this->form_validation->set_rules($this->users_address_model->rules);
        if ($this->form_validation->run() == false) {
            $this->set_response_simple(validation_errors(), 'Validation Error', REST_Controller::HTTP_NON_AUTHORITATIVE_INFORMATION, FALSE);
        } else {*/
            $raw_data=[
                "tour_id"=>$_POST['tour_id'],
                "start_date"=>$_POST['start_date'],
                "end_date"=>$_POST['end_date'],
                "note"=>$_POST['note'],
                "no_of_shows"=>$_POST['no_of_shows'],
                "venue_name"=>$_POST['venue_name'],
                "venue_address"=>$_POST['venue_address'],
                "show_type"=>$_POST['show_type'],
                "show_capacity"=>$_POST['show_capacity'],
                "tax_method"=>$_POST['tax_method'],
                "tax_apparel"=>$_POST['tax_apparel'],
                "tax_others"=>$_POST['tax_others'],
                "tax_music"=>$_POST['tax_music'],
                "venue_rep_name"=>$_POST['venue_rep_name'],
                "venue_rep_phone"=>$_POST['venue_rep_phone'],
                "venue_rep_email"=>$_POST['venue_rep_email'],
                "tax_id"=>$_POST['tax_id'],
                "concession_company"=>$_POST['concession_company'],
                "merchandise_company"=>$_POST['merchandise_company'],
                "merchandise_contact_name"=>$_POST['merchandise_contact_name'],
                "merchandise_contact_number"=>$_POST['merchandise_contact_number'],
                "created_at"=>date('Y-m-d H:i:s'),
                "created_by"=>$token_data->id
            ];
            $id = $this->db->insert('shows',$raw_data);
            $this->set_response_simple($id, 'Success..!', REST_Controller::HTTP_CREATED, TRUE);
        // }
    }
}

