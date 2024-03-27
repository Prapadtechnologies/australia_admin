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
        //$this->validate_token($this->input->get_request_header('X_AUTH_TOKEN'));
        $target = $_GET['q'];
            //$where="lower('name') like '%".strtolower($target)."%'";
        $data = $this->db->select('*')
                ->order_by('created_at','desc')
                ->get('trailer')
                ->result_array();
        $this->set_response_simple(($data == FALSE) ? FALSE : $data, 'Success..!', REST_Controller::HTTP_OK, TRUE);
    }
    
    public function trailer_create_post()
    {
        //$token_data = $this->validate_token($this->input->get_request_header('X_AUTH_TOKEN'));
        $_POST = json_decode(file_get_contents("php://input"), TRUE);
        /*$this->form_validation->set_rules($this->users_address_model->rules);
        if ($this->form_validation->run() == false) {
            $this->set_response_simple(validation_errors(), 'Validation Error', REST_Controller::HTTP_NON_AUTHORITATIVE_INFORMATION, FALSE);
        } else {*/
            $raw_data=[
                "trailer_name"=>$_POST['trailer_name'],
                "contact_person"=>$_POST['contact_person'],
                "phone_number"=>$_POST['phone_number'],
                "tours"=>$_POST['tours'],
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
        //$token_data = $this->validate_token($this->input->get_request_header('X_AUTH_TOKEN'));

        $raw_data = array(
            "trailer_name" => $_POST['trailer_name'],
            "contact_person" => $_POST['contact_person'],
            "phone_number" => $_POST['phone_number'],
            "tours" => $_POST['tours'],
            "updated_at" => date('Y-m-d H:i:s'),
            // "updated_by" => $token_data->id
        );

        // Update the trailer record in the database
        $this->db->where('id', $trailer_id);
        $this->db->update('trailer', $raw_data);

        // Check if the update was successful
        if ($this->db->affected_rows() > 0) {
            $this->set_response_simple("Trailer updated successfully", 'Success..!', REST_Controller::HTTP_OK, TRUE);
        } else {
            $this->set_response_simple("Failed to update trailer", 'Error..!', REST_Controller::HTTP_BAD_REQUEST, FALSE);
        }
    }

}

