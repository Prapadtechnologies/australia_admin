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

    public function add_tours_data_get()
    {
        $token_data = $this->validate_token($this->input->get_request_header('X_AUTH_TOKEN'));
        $data['currency'] = $this->db->select('*')
                ->order_by('code','asc')
                ->get('currency')
                ->result_array();
        $data['tour_types']=['Headline','Support','Festival'];
        $this->set_response_simple(($data == FALSE) ? [] : $data, 'Success..!', REST_Controller::HTTP_OK, TRUE);
    }
    public function tour_list_get()
    {
        $token_data=$this->validate_token($this->input->get_request_header('X_AUTH_TOKEN'));
        check_completed_shows();
        defaultdataload($token_data);
        //$where="lower('name') like '%".strtolower($target)."%'";
        $status=$this->input->get('status');
        $upcoming = $this->db->select('*')
                ->order_by('tour_name','asc')
                //->where('start_date >=',date('Y-m-d'))
                ->where('status','active')
                ->where('user_id',$token_data->id)
                ->get('tour');
        $upcoming_count=$upcoming->num_rows();

        $completed = $this->db->select('*')
                ->order_by('tour_name','asc')
                //->where('end_date <',date('Y-m-d'))
                ->where('status','completed')
                ->where('user_id',$token_data->id)
                ->get('tour');
        $completed_count=$completed->num_rows();

        $closed = $this->db->select('*')
                ->order_by('tour_name','asc')
                ->where('status','inactive')
                ->where('user_id',$token_data->id)
                ->get('tour');
        $closed_count=$closed->num_rows();
        
        if($status == 'upcoming' || $status == 'completed' || $status == 'closed'){
            $list_data=$$status->result_array();
        }else{
            $list_data=[];
        }

        $data['tour_status']=[
            ['key'=>'upcoming','label'=>'Current & Upcoming Tours','count'=>$upcoming_count],
            ['key'=>'completed','label'=>'Completed Tours','count'=>$completed_count],
            ['key'=>'closed','label'=>'Closed Tours','count'=>$closed_count],
        ];
        $data['list']=$list_data;
        $this->set_response_simple(($data == FALSE) ? [] : $data, 'Success..!', REST_Controller::HTTP_OK, TRUE);
    }
    
    public function tour_create_post()
    {
        $token_data = $this->validate_token($this->input->get_request_header('X_AUTH_TOKEN'));
        $_POST = json_decode(file_get_contents("php://input"), TRUE);
        /*$this->form_validation->set_rules($this->users_address_model->rules);
        if ($this->form_validation->run() == false) {
            $this->set_response_simple(validation_errors(), 'Validation Error', REST_Controller::HTTP_NON_AUTHORITATIVE_INFORMATION, FALSE);
        } else {*/
            $start_date = ($_POST['start_date'] != '')? date('Y-m-d H:i:s', strtotime($_POST['start_date'])) : null;
            $end_date = ($_POST['end_date'] != '')?  date('Y-m-d H:i:s', strtotime($_POST['end_date'])) : null;

            $raw_data=[
                "user_id"=>$token_data->id,
                "tour_name"=>$_POST['tour_name'],
                "tour_type"=>$_POST['tour_type'],
                "start_date"=>$start_date,
                "end_date"=>$end_date,
                "report_currency"=>$_POST['report_currency'],
                "merchandise_company"=>$_POST['merchandise_company'],
                "merchandise_contact_name"=>$_POST['merchandise_contact_name'],
                "merchandise_contact_number"=>$_POST['merchandise_contact_number'],
                "vend_fee"=>$_POST['vend_fee'],
                "vend_percentage"=>$_POST['vend_percentage'],
                "vend_type"=>$_POST['vend_type'],
                "created_at"=>date('Y-m-d H:i:s'),
                "created_by"=>$token_data->id
            ];
            $id = $this->db->insert('tour',$raw_data);
            $this->set_response_simple($id, 'Success..!', REST_Controller::HTTP_CREATED, TRUE);
        // }
    }

    public function tour_edit_post($tour_id)
    {
        $_POST = json_decode(file_get_contents("php://input"), TRUE);

        // Fetch token data and validate if necessary
        $token_data = $this->validate_token($this->input->get_request_header('X_AUTH_TOKEN'));

        $existing_tour_data = $this->db->get_where('tour', array('id' => $tour_id))->row_array();

        if (!$existing_tour_data) {
            $this->set_response_simple("Tour not found", 'Error..!', REST_Controller::HTTP_NOT_FOUND, FALSE);
            return;
        }

        $updated_data  = array(
            "user_id"=>$token_data->id,
            "tour_name" => isset($_POST['tour_name']) ? $_POST['tour_name'] : $existing_tour_data['tour_name'],
            "tour_type" => isset($_POST['tour_type']) ? $_POST['tour_type'] : $existing_tour_data['tour_type'],
            "start_date" => isset($_POST['start_date']) ? date('Y-m-d', strtotime($_POST['start_date'])) : $existing_tour_data['start_date'],
            "end_date" => isset($_POST['end_date']) ? date('Y-m-d', strtotime($_POST['end_date'])) : $existing_tour_data['end_date'],
            "report_currency" => isset($_POST['report_currency']) ? $_POST['report_currency'] : $existing_tour_data['report_currency'],
            "merchandise_company" => isset($_POST['merchandise_company']) ? $_POST['merchandise_company'] : $existing_tour_data['merchandise_company'],
            "merchandise_contact_name" => isset($_POST['merchandise_contact_name']) ? $_POST['merchandise_contact_name'] : $existing_tour_data['merchandise_contact_name'],
            "merchandise_contact_number" => isset($_POST['merchandise_contact_number']) ? $_POST['merchandise_contact_number'] : $existing_tour_data['merchandise_contact_number'],
            "vend_fee" => isset($_POST['vend_fee']) ? $_POST['vend_fee'] : $existing_tour_data['vend_fee'],
            "vend_percentage" => isset($_POST['vend_percentage']) ? $_POST['vend_percentage'] : $existing_tour_data['vend_percentage'],
            "vend_type" => isset($_POST['vend_type']) ? $_POST['vend_type'] : $existing_tour_data['vend_type'],
            "updated_at" => date('Y-m-d H:i:s'),
            "updated_by" => $token_data->id 
        );

        // Update the tour record in the database
        $this->db->where('id', $tour_id);
        $this->db->update('tour', $updated_data );

        // Check if the update was successful
        if ($this->db->affected_rows() > 0) {
            $updated_tour_data = $this->db->get_where('tour', array('id' => $tour_id))->row_array();
            $this->set_response_simple(($existing_tour_data == FALSE) ? [] : $existing_tour_data, 'Success..!', REST_Controller::HTTP_OK, TRUE);
            //$this->response($existing_tour_data, REST_Controller::HTTP_OK);
        } else {
            $this->set_response_simple("Failed to update tour", 'Error..!', REST_Controller::HTTP_BAD_REQUEST, FALSE);
        }
    }

    public function tour_cancel_post($tour_id)
    {
        $_POST = json_decode(file_get_contents("php://input"), TRUE);

        // Fetch token data and validate if necessary
        $token_data = $this->validate_token($this->input->get_request_header('X_AUTH_TOKEN'));

        $existing_tour_data = $this->db->get_where('tour', array('id' => $tour_id))->row_array();

        if (!$existing_tour_data) {
            $this->set_response_simple("Tour not found", 'Error..!', REST_Controller::HTTP_NOT_FOUND, FALSE);
            return;
        }

        $updated_status  = array(
            "user_id"=>$token_data->id,
            "status" => isset($_POST['status']) ? $_POST['status'] : $existing_tour_data['status'],//inactive
            "updated_at" => date('Y-m-d H:i:s'),
            "updated_by" => $token_data->id
        );

        // Update the tour record in the database
        $this->db->where('id', $tour_id);
        $this->db->update('tour', $updated_status);

        // Check if the update was successful
        if ($this->db->affected_rows() > 0) {
            $updated_tour_status = $this->db->get_where('tour', array('id' => $tour_id))->row_array();
            $this->set_response_simple(($existing_tour_data == FALSE) ? [] : $existing_tour_data, 'Success..!', REST_Controller::HTTP_OK, TRUE);
            //$this->response($existing_tour_data, REST_Controller::HTTP_OK);
        } else {
            $this->set_response_simple("Failed to Cancel tour", 'Error..!', REST_Controller::HTTP_BAD_REQUEST, FALSE);
        }
    }
}

