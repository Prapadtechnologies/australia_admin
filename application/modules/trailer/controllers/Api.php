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


    public function trailer_list_get()
    {
        $token_data=$this->validate_token($this->input->get_request_header('X_AUTH_TOKEN'));
        $target = $_GET['q'];
            //$where="lower('name') like '%".strtolower($target)."%'";
        $data = $this->db->select('*')
                ->order_by('created_at','desc')
                ->where('user_id',$token_data->id)
                ->get('trailer')
                ->result_array();
        $this->set_response_simple(($data == FALSE) ? [] : $data, 'Success..!', REST_Controller::HTTP_OK, TRUE);
    }
    
    public function trailer_create_post()
    {
        $token_data = $this->validate_token($this->input->get_request_header('X_AUTH_TOKEN'));
        $_POST = json_decode(file_get_contents("php://input"), TRUE);
        /*$this->form_validation->set_rules($this->users_address_model->rules);
        if ($this->form_validation->run() == false) {
            $this->set_response_simple(validation_errors(), 'Validation Error', REST_Controller::HTTP_NON_AUTHORITATIVE_INFORMATION, FALSE);
        } else {*/
            $raw_data=[
                "user_id"=>$token_data->id,
                //"tour_id"=>$_POST['tour_id'],
                "trailer_name"=>$_POST['trailer_name'],
                "contact_person"=>$_POST['contact_person'],
                "phone_number"=>$_POST['phone_number'],
                "created_at"=>date('Y-m-d H:i:s'),
                "created_by"=>$token_data->id
            ];
            $id = $this->db->insert('trailer',$raw_data);
            $this->set_response_simple($id, 'Success..!', REST_Controller::HTTP_CREATED, TRUE);
        // }
    }

    public function trailer_edit_post($trailer_id)
    {
        $_POST = json_decode(file_get_contents("php://input"), TRUE);

        // Fetch token data and validate if necessary
        $token_data = $this->validate_token($this->input->get_request_header('X_AUTH_TOKEN'));

        $existing_trailer_data = $this->db->get_where('trailer', array('id' => $trailer_id))->row_array();

        if (!$existing_trailer_data) {
            $this->set_response_simple("Trailer not found", 'Error..!', REST_Controller::HTTP_OK, FALSE);
            return;
        }

        $updated_data  = array(
            "user_id"=>$token_data->id,
            //"tour_id" => isset($_POST['tour_id']) ? $_POST['tour_id'] : $existing_trailer_data['tour_id'],
            "trailer_name" => isset($_POST['trailer_name']) ? $_POST['trailer_name'] : $existing_trailer_data['trailer_name'],
            "contact_person" => isset($_POST['contact_person']) ? $_POST['contact_person'] : $existing_trailer_data['contact_person'],
            "phone_number" => isset($_POST['phone_number']) ? $_POST['phone_number'] : $existing_trailer_data['phone_number'],
            "updated_at" => date('Y-m-d H:i:s'),
            "updated_by" => $token_data->id
        );

        // Update the trailer record in the database
        $this->db->where('id', $trailer_id);
        $this->db->update('trailer', $updated_data );

        // Check if the update was successful
        if ($this->db->affected_rows() > 0) {
            /*if(count($_POST['tour_id']) > 0){
                $this->db->where_in('id', $_POST['tour_id']);
                $this->db->update('tour', ['trailer_id'=>$trailer_id]);
            }*/
             // Fetch the updated trailer data
            $updated_trailer_data = $this->db->get_where('trailer', array('id' => $trailer_id))->row_array();
            
            // Include the updated trailer data in the response
            $this->set_response_simple(($updated_trailer_data == FALSE) ? [] : $updated_trailer_data, 'Success..!', REST_Controller::HTTP_OK, TRUE);
            //$this->response($updated_trailer_data, REST_Controller::HTTP_OK);
        } else {
            $this->set_response_simple("Failed to update trailer", 'Error..!', REST_Controller::HTTP_OK, FALSE);
        }
    }

    public function trailer_delete_post($id)
    {
        $_POST = json_decode(file_get_contents("php://input"), TRUE);

        // Fetch token data and validate if necessary
        $token_data = $this->validate_token($this->input->get_request_header('X_AUTH_TOKEN'));

        $existing_trailer_data = $this->db->get_where('trailer', array('id' => $id))->row_array();

        if (!$existing_trailer_data) {
            $this->set_response_simple("Trailer not found", 'Error..!', REST_Controller::HTTP_OK, FALSE);
            return;
        }

        $updated_status  = array(
            "user_id"=>$token_data->id,
            "status" => isset($_POST['status']) ? $_POST['status'] : $existing_trailer_data['status'],//inactive
            "updated_at" => date('Y-m-d H:i:s'),
            "updated_by" => $token_data->id
        );

        // Update the trailer record in the database
        $this->db->where('id', $id);
        $this->db->update('trailer', $updated_status);

        // Check if the update was successful
        if ($this->db->affected_rows() > 0) {
            $updated_trailer_status = $this->db->get_where('trailer', array('id' => $id))->row_array();
            $this->set_response_simple(($existing_trailer_data == FALSE) ? [] : $existing_trailer_data, 'Success..!', REST_Controller::HTTP_OK, TRUE);
            //$this->response($existing_trailer_data, REST_Controller::HTTP_OK);
        } else {
            $this->set_response_simple("Failed to delete trailer", 'Error..!', REST_Controller::HTTP_OK, FALSE);
        }
    }

}

