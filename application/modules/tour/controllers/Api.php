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
        $data['currency'] = $this->db->select('*')
                ->order_by('code','asc')
                ->get('currency')
                ->result_array();
        $data['tour_types']=['Headline','Support','Festival'];
        $this->set_response_simple(($data == FALSE) ? FALSE : $data, 'Success..!', REST_Controller::HTTP_OK, TRUE);
    }
    public function tour_list_get()
    {
        //$this->validate_token($this->input->get_request_header('X_AUTH_TOKEN'));
            //$where="lower('name') like '%".strtolower($target)."%'";
        $status=$this->input->get('status');
        $upcoming = $this->db->select('*')
                ->order_by('tour_name','asc')
                ->where('start_date >=',date('Y-m-d'))
                ->where('status','active')
                ->get('tour');
        $upcoming_count=$upcoming->num_rows();

        $completed = $this->db->select('*')
                ->order_by('tour_name','asc')
                ->where('end_date <',date('Y-m-d'))
                ->where('status','active')
                ->get('tour');
        $completed_count=$completed->num_rows();

        $closed = $this->db->select('*')
                ->order_by('tour_name','asc')
                ->where('status','inactive')
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
        $this->set_response_simple(($data == FALSE) ? FALSE : $data, 'Success..!', REST_Controller::HTTP_OK, TRUE);
    }
    
    public function tour_create_post()
    {
        //$token_data = $this->validate_token($this->input->get_request_header('X_AUTH_TOKEN'));
        $_POST = json_decode(file_get_contents("php://input"), TRUE);
        /*$this->form_validation->set_rules($this->users_address_model->rules);
        if ($this->form_validation->run() == false) {
            $this->set_response_simple(validation_errors(), 'Validation Error', REST_Controller::HTTP_NON_AUTHORITATIVE_INFORMATION, FALSE);
        } else {*/
            $raw_data=[
                "tour_name"=>$_POST['tour_name'],
                "tour_type"=>$_POST['tour_type'],
                "start_date"=>$_POST['start_date'],
                "end_date"=>$_POST['end_date'],
                "report_currency"=>$_POST['report_currency'],
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
        //$token_data = $this->validate_token($this->input->get_request_header('X_AUTH_TOKEN'));

        $raw_data = array(
            "tour_name" => $_POST['tour_name'],
            "tour_type" => $_POST['tour_type'],
            "start_date" => $_POST['start_date'],
            "end_date" => $_POST['end_date'],
            "report_currency" => $_POST['report_currency'],
            "updated_at" => date('Y-m-d H:i:s'),
            // "updated_by" => $token_data->id 
        );

        // Update the tour record in the database
        $this->db->where('id', $tour_id);
        $this->db->update('tour', $raw_data);

        // Check if the update was successful
        if ($this->db->affected_rows() > 0) {
            $this->set_response_simple("Tour updated successfully", 'Success..!', REST_Controller::HTTP_OK, TRUE);
        } else {
            $this->set_response_simple("Failed to update tour", 'Error..!', REST_Controller::HTTP_BAD_REQUEST, FALSE);
        }
    }
}

