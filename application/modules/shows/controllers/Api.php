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
        $this->validate_token($this->input->get_request_header('X_AUTH_TOKEN'));
        $target = $_GET['q'];
        if (strlen($target) > 0) {
            $where="lower('name') like '%".strtolower($target)."%'";
            $data = $this->db->select('*')
                    ->like('name', $target, 'both')
                    ->or_like('addressLineOne', $target, 'both')
                    ->get('venue_address')
                    ->result_array();
        }else{
            $data = $this->db->select('*')
                    ->get('venue_address')
                    ->result_array();
        }
        $this->set_response_simple(($data == FALSE) ? [] : $data, 'Success..!', REST_Controller::HTTP_OK, TRUE);
    }

    public function venue_create_post()
    {
        $token_data=$this->validate_token($this->input->get_request_header('X_AUTH_TOKEN'));
        $_POST = json_decode(file_get_contents("php://input"), TRUE);
        $raw_data=[
                "user_id"=>$token_data->id,
                "name"=>$_POST['venue_name'],
                "venue_number"=>$_POST['venue_number'],
                "addressLineOne"=>$_POST['street'].', '.$_POST['city'].', '.$_POST['state'].', '.$_POST['zipcode'],
                "capacity"=>$_POST['unit'],
                "street"=>$_POST['street'],
                "city"=>$_POST['city'],
                "state"=>$_POST['state'],
                "zipcode"=>$_POST['zipcode'],
                "created_at"=>date('Y-m-d H:i:s'),
                "created_by"=>$token_data->id,
                "updated_at"=>date('Y-m-d H:i:s'),
                "updated_by"=>$token_data->id
            ];
            $id = $this->db->insert('venue_address',$raw_data);
            $this->set_response_simple($id, 'Success..!', REST_Controller::HTTP_CREATED, TRUE);
    }

    public function shows_list_get($tour_id='')
    {
        $token_data=$this->validate_token($this->input->get_request_header('X_AUTH_TOKEN'));
        check_completed_shows();
            //$where="lower('name') like '%".strtolower($target)."%'";
        $status=$this->input->get('status');
        /*if($tour_id == ''){
            $res=$this->db->order_by('tour_name','asc')->get('tour')->row();
            $tour_id=$res->id;
        }*/
        if($tour_id != '' && $tour_id != 'undefined'){
            $res=$this->db->order_by('tour_name','asc')->where('id',$tour_id)->get('tour')->row();
        }else{
            $res='';
        }
        //$tour_id=$res->id;
        if($res != ''){
           /*         $this->db->select('*');
                    $this->db->order_by('start_date','asc');
                    $this->db->where('tour_id',$tour_id);
            $total = $this->db->get('shows');
            $total_count=$total->num_rows();
            $total_data=$total->result_array();*/

                    $this->db->select('*');
                    $this->db->order_by('start_date','asc');
                    $this->db->where('tour_id',$tour_id);
                    //$this->db->where('start_date >=',date('Y-m-d'));
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
                    //$this->db->where('end_date <',date('Y-m-d'));
                    $this->db->where('status','completed');
            $completed = $this->db->get('shows');
            $completed_count=$completed->num_rows();
            $completed_data=$completed->result_array();
        }else{
            $left_count=$cancelled_count=$completed_count=0;
        }

        $data['shows_status']=[
            //['key'=>'total','label'=>'Total Shows','count'=>$total_count],
            ['key'=>'left','label'=>'Shows Left','count'=>$left_count],
            ['key'=>'cancelled','label'=>'Cancelled','count'=>$cancelled_count],
            ['key'=>'completed','label'=>'Completed','count'=>$completed_count]
        ];
        if($res != '' && ($status == 'total' || $status == 'left' || $status == 'cancelled' || $status == 'completed'))
        {
            $list_data=$$status->result_array();
        }else{
            $list_data=[];
        }
        $data['list']=$list_data;
        // $data['list']['total']=$total_data;
        // $data['list']['left']=$left_data;
        // $data['list']['cancelled']=$cancelled_data;
        // $data['list']['completed']=$completed_data;
        $this->set_response_simple(($data == FALSE) ? [] : $data, 'Success..!', REST_Controller::HTTP_OK, TRUE);
    }
    public function show_create_post()
    {
        $token_data = $this->validate_token($this->input->get_request_header('X_AUTH_TOKEN'));
        $_POST = json_decode(file_get_contents("php://input"), TRUE);
        /*$this->form_validation->set_rules($this->users_address_model->rules);
        if ($this->form_validation->run() == false) {
            $this->set_response_simple(validation_errors(), 'Validation Error', REST_Controller::HTTP_NON_AUTHORITATIVE_INFORMATION, FALSE);
        } else {*/
            $raw_data=[
                "user_id"=>$token_data->id,
                "tour_id"=>$_POST['tour_id'],
                "city"=>$_POST['city'],
                "state"=>$_POST['state'],
                "start_date"=>$_POST['start_date'],
                "end_date"=>$_POST['end_date'],
                "no_of_shows"=>$_POST['no_of_shows'],
                "show_type"=>$_POST['show_type'],
                "fee_apparel"=>$_POST['fee_apparel'],
                "fee_others"=>$_POST['fee_others'],
                "fee_music"=>$_POST['fee_music'],
                "promoter_name"=>$_POST['promoter_name'],
                "promoter_phone"=>$_POST['promoter_phone'],
                "promoter_email"=>$_POST['promoter_email'],
                "note"=>$_POST['note'],
                "venue_name"=>$_POST['venue_name'],
                "venue_address"=>$_POST['venue_address'],
                //"show_capacity"=>$_POST['show_capacity'],
                //"total_tickets"=>$_POST['total_tickets'],
                "venue_rep_name"=>$_POST['venue_rep_name'],
                "venue_rep_phone"=>$_POST['venue_rep_phone'],
                "venue_rep_email"=>$_POST['venue_rep_email'],
                //"tax_method"=>$_POST['tax_method'],
                "tax_apparel"=>$_POST['tax_apparel'],
                "tax_others"=>$_POST['tax_others'],
                "tax_music"=>$_POST['tax_music'],
                "tax_id"=>$_POST['tax_id'],
                //"concession_company"=>$_POST['concession_company'],
                "created_at"=>date('Y-m-d H:i:s'),
                "created_by"=>$token_data->id
            ];
            $id = $this->db->insert('shows',$raw_data);
            $this->set_response_simple($id, 'Success..!', REST_Controller::HTTP_CREATED, TRUE);
        // }
    }
    public function note_update_post($show_id)
    {
        $token_data = $this->validate_token($this->input->get_request_header('X_AUTH_TOKEN'));
        $_POST = json_decode(file_get_contents("php://input"), TRUE);

        $existing_show_data = $this->db->get_where('shows', array('id' => $show_id))->row_array();

        if (!$existing_show_data) {
            $this->set_response_simple("Show not found", 'Error..!', REST_Controller::HTTP_NOT_FOUND, FALSE);
            return;
        }
        $raw_data=[
            "note"=>$_POST['note'],
            "updated_at"=>date('Y-m-d H:i:s'),
            "updated_by"=>$token_data->id
        ];
        $id = $this->db->where('id',$show_id)->update('shows',$raw_data);
        if ($this->db->affected_rows() > 0) {
            $updated_show_data = $this->db->get_where('shows', array('id' => $show_id))->row_array();  
            $this->set_response_simple(($updated_show_data == FALSE) ? [] : $updated_show_data, 'Success..!', REST_Controller::HTTP_OK, TRUE);
        } else {
            $this->set_response_simple("Failed to Edit the Show", 'Error..!', REST_Controller::HTTP_BAD_REQUEST, FALSE);
        }
    }

    public function ticketsale_update_post($show_id)
    {
        $token_data = $this->validate_token($this->input->get_request_header('X_AUTH_TOKEN'));
        $_POST = json_decode(file_get_contents("php://input"), TRUE);

        $existing_show_data = $this->db->get_where('shows', array('id' => $show_id))->row_array();

        if (!$existing_show_data) {
            $this->set_response_simple("Show not found", 'Error..!', REST_Controller::HTTP_NOT_FOUND, FALSE);
            return;
        }
        $raw_data=[
            "total_tickets"=>$_POST['total_tickets'],
            "updated_at"=>date('Y-m-d H:i:s'),
            "updated_by"=>$token_data->id
        ];
        $id = $this->db->where('id',$show_id)->update('shows',$raw_data);
        if ($this->db->affected_rows() > 0) {
            $updated_show_data = $this->db->get_where('shows', array('id' => $show_id))->row_array();  
            $this->set_response_simple(($updated_show_data == FALSE) ? [] : $updated_show_data, 'Success..!', REST_Controller::HTTP_OK, TRUE);
        } else {
            $this->set_response_simple("Failed to Edit the Show", 'Error..!', REST_Controller::HTTP_BAD_REQUEST, FALSE);
        }
    }

    public function show_edit_post($show_id)
    {
        $_POST = json_decode(file_get_contents("php://input"), TRUE);
        $token_data = $this->validate_token($this->input->get_request_header('X_AUTH_TOKEN'));

        $existing_show_data = $this->db->get_where('shows', array('id' => $show_id))->row_array();

        if (!$existing_show_data) {
            $this->set_response_simple("Show not found", 'Error..!', REST_Controller::HTTP_NOT_FOUND, FALSE);
            return;
        }

        $updated_data  = array(
            "user_id"=>$token_data->id,
            "tour_id" => isset($_POST['tour_id']) ? $_POST['tour_id'] : $existing_show_data['tour_id'],
            "city"=>isset($_POST['city']) ? $_POST['city'] : $existing_show_data['city'],
            "state"=>isset($_POST['state']) ? $_POST['state'] : $existing_show_data['state'],
            "start_date" => isset($_POST['start_date']) ? date('Y-m-d', strtotime($_POST['start_date'])) : $existing_tour_data['start_date'],
            "end_date" => isset($_POST['end_date']) ? date('Y-m-d', strtotime($_POST['end_date'])) : $existing_tour_data['end_date'],
            "no_of_shows"=>isset($_POST['no_of_shows']) ? $_POST['no_of_shows'] : $existing_show_data['no_of_shows'],
            "show_type"=>isset($_POST['show_type']) ? $_POST['show_type'] : $existing_show_data['show_type'],
            "fee_apparel"=>isset($_POST['fee_apparel']) ? $_POST['fee_apparel'] : $existing_show_data['fee_apparel'],
            "fee_others"=>isset($_POST['fee_others']) ? $_POST['fee_others'] : $existing_show_data['fee_others'],
            "fee_music"=>isset($_POST['fee_music']) ? $_POST['fee_music'] : $existing_show_data['fee_music'],
            "promoter_name"=>isset($_POST['promoter_name']) ? $_POST['promoter_name'] : $existing_show_data['promoter_name'],
            "promoter_phone"=>isset($_POST['promoter_phone']) ? $_POST['promoter_phone'] : $existing_show_data['promoter_phone'],
            "promoter_email"=>isset($_POST['promoter_email']) ? $_POST['promoter_email'] : $existing_show_data['promoter_email'],
            "note" => isset($_POST['note']) ? $_POST['note'] : $existing_show_data['note'],
            "venue_name"=>isset($_POST['venue_name']) ? $_POST['venue_name'] : $existing_show_data['venue_name'],
            "venue_address"=>isset($_POST['venue_address']) ? $_POST['venue_address'] : $existing_show_data['venue_address'],
            //"show_capacity"=>isset($_POST['show_capacity']) ? $_POST['show_capacity'] : $existing_show_data['show_capacity'],
            //"total_tickets"=>isset($_POST['total_tickets']) ? $_POST['total_tickets'] : $existing_show_data['total_tickets'],
            "venue_rep_name"=>isset($_POST['venue_rep_name']) ? $_POST['venue_rep_name'] : $existing_show_data['venue_rep_name'],
            "venue_rep_phone"=>isset($_POST['venue_rep_phone']) ? $_POST['venue_rep_phone'] : $existing_show_data['venue_rep_phone'],
            "venue_rep_email"=>isset($_POST['venue_rep_email']) ? $_POST['venue_rep_email'] : $existing_show_data['venue_rep_email'],
            //"tax_method"=>isset($_POST['tax_method']) ? $_POST['tax_method'] : $existing_show_data['tax_method'],
            "tax_apparel"=>isset($_POST['tax_apparel']) ? $_POST['tax_apparel'] : $existing_show_data['tax_apparel'],
            "tax_others"=>isset($_POST['tax_others']) ? $_POST['tax_others'] : $existing_show_data['tax_others'],
            "tax_music"=>isset($_POST['tax_music']) ? $_POST['tax_music'] : $existing_show_data['tax_music'],
            "tax_id"=>isset($_POST['tax_id']) ? $_POST['tax_id'] : $existing_show_data['tax_id'],
            //"concession_company"=>isset($_POST['concession_company']) ? $_POST['concession_company'] : $existing_show_data['concession_company'],
            "updated_at" => date('Y-m-d H:i:s'),
            "updated_by" => $token_data->id
        );

        // Update the show record in the database
        $this->db->where('id', $show_id);
        $this->db->update('shows', $updated_data );

        // Check if the update was successful
        if ($this->db->affected_rows() > 0) {
            // Fetch the updated show data
            $updated_show_data = $this->db->get_where('shows', array('id' => $show_id))->row_array();  
            // Include the updated show data in the response
            //$this->response($updated_show_data, REST_Controller::HTTP_OK);
            $this->set_response_simple(($updated_show_data == FALSE) ? [] : $updated_show_data, 'Success..!', REST_Controller::HTTP_OK, TRUE);
        } else {
            $this->set_response_simple("Failed to Edit the Show", 'Error..!', REST_Controller::HTTP_BAD_REQUEST, FALSE);
        }
    }

    public function show_change_status_post($show_id)
    {
        $_POST = json_decode(file_get_contents("php://input"), TRUE);
        $token_data = $this->validate_token($this->input->get_request_header('X_AUTH_TOKEN'));

        $raw_data = array(
            "status" => $_POST['status'],//'inactive'
            "updated_at" => date('Y-m-d H:i:s'),
            "updated_by" => $token_data->id
        );

        // Change the show Status record in the database
        $this->db->where('id', $show_id);
        $this->db->update('shows', $raw_data);

        // Check if the update was successful
        if ($this->db->affected_rows() > 0) {
            $this->set_response_simple("Show Cancelled successfully", 'Success..!', REST_Controller::HTTP_OK, TRUE);
        } else {
            $this->set_response_simple("Failed to Cancel the Show", 'Error..!', REST_Controller::HTTP_BAD_REQUEST, FALSE);
        }
    }

    public function show_postponed_post($show_id)
    {
        $_POST = json_decode(file_get_contents("php://input"), TRUE);
        $token_data = $this->validate_token($this->input->get_request_header('X_AUTH_TOKEN'));

        $raw_data = array(
            "start_date"=>$_POST['start_date'],
            "end_date"=>$_POST['end_date'],
            "updated_at" => date('Y-m-d H:i:s'),
            "updated_by" => $token_data->id
        );

        // Postponed the show record in the database
        $this->db->where('id', $show_id);
        //$this->db->where('status','active');
        $this->db->update('shows', $raw_data);

        // Check if the update was successful
        if ($this->db->affected_rows() > 0) {
            $this->set_response_simple("Show Postponed successfully", 'Success..!', REST_Controller::HTTP_OK, TRUE);
        } else {
            $this->set_response_simple("Failed to Postponed the Show", 'Error..!', REST_Controller::HTTP_BAD_REQUEST, FALSE);
        }
    }
}

