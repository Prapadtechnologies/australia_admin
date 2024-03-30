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

    public function sizes_get()
    {
        $this->validate_token($this->input->get_request_header('X_AUTH_TOKEN'));
        $size_type=isset($_GET['size_type'])? $_GET['size_type'] : '';
        $this->db->select('id, size_type');
        if($size_type){
            $this->db->where('id',$size_type);
        }
        $size_types =  $this->db->get('size_types')->result_array();
        $data=[];
        foreach ($size_types as $size) {
            $size['size_list']=$this->db->select('id,size_type,size_name')->get_where('sizes',['size_type'=>$size['id']])->result_array();
            $data['size_types'][]=$size;
        }
        $this->set_response_simple(($data == FALSE) ? FALSE : $data, 'Success..!', REST_Controller::HTTP_OK, TRUE);
    }

    public function merch_data_get(){
        $token_data=$this->validate_token($this->input->get_request_header('X_AUTH_TOKEN'));
        
        $this->db->select('id, size_type');
        $size_types =  $this->db->get('size_types')->result_array();
        $data=[];
        $data['size_types']=$size_types;
        foreach ($size_types as $size) {
            $size['size_list']=$this->db->select('id,size_type,size_name')->get_where('sizes',['size_type'=>$size['id']])->result_array();
            $data['sizes'][]=$size;
        }
        $category=$this->db->select('id,name,status')->get('categories')->result_array();
        $data['categories']=$category;
        foreach ($category as $cat) {
            $cat['sub_cateogire_list']=$this->db->select('id,category_id,name')->get_where('sub_categories',['category_id'=>$cat['id']])->result_array();
            $data['sub_categories'][]=$cat;
        }
        $data['gender']=['Male','Female','Unisex'];
        $data['country']=$this->db->get('country')->result_array();
        $data['colours']=$this->db->get('colours')->result_array();

        $this->set_response_simple(($data == FALSE) ? FALSE : $data, 'Success..!', REST_Controller::HTTP_OK, TRUE);
    }
    public function merch_list_get()
    {
        $token_data=$this->validate_token($this->input->get_request_header('X_AUTH_TOKEN'));
        $merch = $this->db->select('*')
                ->order_by('updated_at','desc')
                ->where('user_id',$token_data->id)
                ->get('merch')
                ->result_array();
        foreach ($merch as $mer) {
            $mer['child_list']=$this->db->select('*')->get_where('merch_child',['merch_id'=>$mer['id']])->result_array();
            $data['merch_list'][]=$mer;
        }       
        $this->set_response_simple(($data == FALSE) ? FALSE : $data, 'Success..!', REST_Controller::HTTP_OK, TRUE);
    }
    public function merch_create_post()
    {
        $token_data = $this->validate_token($this->input->get_request_header('X_AUTH_TOKEN'));
        $_POST = json_decode(file_get_contents("php://input"), TRUE);
        /*$this->form_validation->set_rules($this->users_address_model->rules);
        if ($this->form_validation->run() == false) {
            $this->set_response_simple(validation_errors(), 'Validation Error', REST_Controller::HTTP_NON_AUTHORITATIVE_INFORMATION, FALSE);
        } else {*/
            $raw_data=[
                "user_id"=>$token_data->id,
                "product_name"=>$_POST['product_name'],
                "category"=>$_POST['category'],
                "category_id"=>$_POST['category_id'],
                "product_type"=>$_POST['product_type'],
                "gender"=>$_POST['gender'],
                "colour"=>$_POST['colour'],
                "sku"=>$_POST['sku'],
                "sale_price"=>$_POST['sale_price'],
                "cost"=>$_POST['cost'],
                "upc_1"=>$_POST['upc_1'],
                "upc_2"=>$_POST['upc_2'],
                "pre_order"=>$_POST['pre_order'],
                "release_date"=>$_POST['release_date'],
                "record_rep_mail"=>$_POST['record_rep_mail'],
                "supplier_name"=>$_POST['supplier_name'],
                "supplier_mobile"=>$_POST['supplier_mobile'],
                "supplier_mail"=>$_POST['supplier_mail'],
                "supplier_address"=>$_POST['supplier_address'],
                "printer_name"=>$_POST['printer_name'],
                "printer_mobile"=>$_POST['printer_mobile'],
                "printer_email"=>$_POST['printer_email'],
                "printer_address"=>$_POST['printer_address'],
                "printer_appartment"=>$_POST['printer_appartment'],
                "printer_city"=>$_POST['printer_city'],
                "printer_country"=>$_POST['printer_country'],
                "printer_zipcode"=>$_POST['printer_zipcode'],
                "created_at"=>date('Y-m-d H:i:s'),
                "created_by"=>$token_data->id,
                "updated_at"=>date('Y-m-d H:i:s'),
                "updated_by"=>$token_data->id
            ];
            $this->db->insert('merch',$raw_data);
            $id = $this->db->insert_id();
            if($id){
                $child=$_POST['child'];
                for($i=0; $i < count($child); $i++){
                    $child_data=[
                        "merch_id"=>$id,
                        "size_type"=>$child[$i]['size_type'],
                        "size"=>$child[$i]['size'],
                        "sku_code"=>$child[$i]['sku_code'],
                        "product_code"=>$child[$i]['product_code'],
                        "sale_price"=>$child[$i]['sale_price'],
                        "cost"=>$child[$i]['cost'],
                        "created_at"=>date('Y-m-d H:i:s'),
                        "created_by"=>$token_data->id
                    ];
                    $this->db->insert('merch_child',$child_data);
                }
            }
            $this->set_response_simple($id, 'Success..!', REST_Controller::HTTP_CREATED, TRUE);
        // }
    }
}

