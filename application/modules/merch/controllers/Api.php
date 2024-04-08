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
        $this->set_response_simple(($data == FALSE) ? [] : $data, 'Success..!', REST_Controller::HTTP_OK, TRUE);
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

        $this->set_response_simple(($data == FALSE) ? [] : $data, 'Success..!', REST_Controller::HTTP_OK, TRUE);
    }
    public function merch_list_get()
    {
        $token_data=$this->validate_token($this->input->get_request_header('X_AUTH_TOKEN'));
        $stock_type=$this->input->get('stock_type');
        $stock_id=$this->input->get('stock_id');
        $merch_ids='';
        if($stock_type != '' && $stock_id != ''){
            $merch_ids=$this->db->select('merch_id')->get_where('merch_quantity',['stock_type'=>$stock_type,'stock_id'=>$stock_id])->result_array();
            if(count($merch_ids) > 0){
                $this->db->select('m.*,s.name,');
                $this->db->join('sub_categories as s','s.id = m.product_type');
                $this->db->order_by('m.updated_at','desc');
                $this->db->where('m.user_id',$token_data->id);
                $this->db->where_in('m.id',array_column($merch_ids,'merch_id'));
                $merch = $this->db->get('merch as m')->result_array();
            }else{
                $merch=[];
            }
        }else{
            $this->db->select('m.*,s.name,');
            $this->db->join('sub_categories as s','s.id = m.product_type');
            $this->db->order_by('m.updated_at','desc');
            $this->db->where('m.user_id',$token_data->id);
            $merch = $this->db->get('merch as m')->result_array();
        }
        foreach ($merch as $mer) {
            $child_data=$this->db->select('m.*,s.size_name,c.colour_name')->join('sizes as s','s.id = m.size')->join('colours as c','c.id = m.colour')->get_where('merch_child as m',['m.merch_id'=>$mer['id']])->result_array();
            $child_list_data=[];
            $total_quantity_count=0;
            $l_ordered=$l_warehouse_inbound=$l_warehouse_onhand=$l_trailer_inbound=$l_trailer_onhand=$l_total=$l_out_bound=$l_avg_cost=$sizes_list_api=[];
            foreach ($child_data as $qty_child) {
                if($stock_type != '' && $stock_id != ''){
                    $warehouse_where=['merch_id'=>$mer['id'],'merch_child_id'=>$qty_child['id'],'stock_type'=>'warehouse','stock_id'=>$stock_id];
                    $trailer_where=['merch_id'=>$mer['id'],'merch_child_id'=>$qty_child['id'],'stock_type'=>'trailer','stock_id'=>$stock_id];
                }else{
                    $warehouse_where=['merch_id'=>$mer['id'],'merch_child_id'=>$qty_child['id'],'stock_type'=>'warehouse'];
                    $trailer_where=['merch_id'=>$mer['id'],'merch_child_id'=>$qty_child['id'],'stock_type'=>'trailer'];
                }
                $warehouse_onhand=$this->db->select('SUM(quantity) as total_quantity')->get_where('merch_quantity',$warehouse_where)->row_array();

                $trailer_onhand=$this->db->select('SUM(quantity) as total_quantity')->get_where('merch_quantity',$trailer_where)->row_array();

                $warehouse_onhand_total=($warehouse_onhand['total_quantity'] != '')? $warehouse_onhand['total_quantity'] : 0;
                $trailer_onhand_total=($trailer_onhand['total_quantity'] != '')? $trailer_onhand['total_quantity'] : 0;
                $qty_total=$warehouse_onhand_total+$trailer_onhand_total;
                $qty_child['ordered']=0;
                $qty_child['warehouse_inbound']=0;
                $qty_child['warehouse_onhand']=$warehouse_onhand_total;
                $qty_child['trailer_inbound']=0;
                $qty_child['trailer_onhand']=$trailer_onhand_total;
                $qty_child['total']=$qty_total;                
                $child_list_data[]=$qty_child;
                $total_quantity_count=$total_quantity_count+$qty_total;

                $l_ordered[]=0;
                $l_warehouse_inbound[]=0;
                $l_warehouse_onhand[]=$warehouse_onhand_total;
                $l_trailer_inbound[]=0;
                $l_trailer_onhand[]=$trailer_onhand_total;
                $l_total[]=$qty_total;
                $l_out_bound[]=0;
                $l_avg_cost[]=$qty_child['cost'];
                $sizes_list_api[]=$qty_child['size_name'];
            }
            $mer['total_merch']=100;
            $mer['quantity_total']=$total_quantity_count;
            if($stock_type != '' && $stock_id != ''){
                $mer['warehouse']=[['title'=>'In Bound','data'=>$l_warehouse_inbound],['title'=>'On Hand','data'=>$l_warehouse_onhand],['title'=>'Out Bound','data'=>$l_out_bound]];
                $mer['trailer']=[['title'=>'In Bound','data'=>$l_trailer_inbound],['title'=>'On Hand','data'=>$l_trailer_onhand],['title'=>'Out Bound','data'=>$l_out_bound]];
                $mer['avg_cost']=['title'=>'Avg.Cost','data'=>$l_avg_cost];
            }else{
                $mer['ordered']=['title'=>'Ordered','data'=>$l_ordered];
                $mer['warehouse']=[['title'=>'In Bound','data'=>$l_warehouse_inbound],['title'=>'On Hand','data'=>$l_warehouse_onhand]];
                $mer['trailer']=[['title'=>'In Bound','data'=>$l_trailer_inbound],['title'=>'On Hand','data'=>$l_trailer_onhand]];
            }
            $mer['total']=['title'=>'Total','data'=>$l_total];
            
            $mer['graph']=[
                'min_limit'=>0,//min($l_total),
                'max_limit'=>500,//max($l_total),
                'Y_axis'=>$sizes_list_api,
                'graph_data'=>$l_total
            ];
            $mer['child_list']=$child_list_data;
            $data['merch_list'][]=$mer;
        }
              
        $this->set_response_simple(($data == FALSE) ? [] : $data, 'Success..!', REST_Controller::HTTP_OK, TRUE);
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

    public function merch_quantity_create_post()
    {
        $token_data = $this->validate_token($this->input->get_request_header('X_AUTH_TOKEN'));
        $_POST = json_decode(file_get_contents("php://input"), TRUE);
        /*$this->form_validation->set_rules($this->users_address_model->rules);
        if ($this->form_validation->run() == false) {
            $this->set_response_simple(validation_errors(), 'Validation Error', REST_Controller::HTTP_NON_AUTHORITATIVE_INFORMATION, FALSE);
        } else {*/
        for($i=0; $i < count($_POST); $i++){
            $qty_data=$_POST[$i];
            $raw_data=[
                "merch_id"=>$qty_data['merch_id'],
                "merch_child_id"=>$qty_data['merch_child_id'],
                "stock_type"=>$qty_data['stock_type'],
                "stock_id"=>$qty_data['stock_id'],
                "quantity"=>$qty_data['quantity'],
                "cost"=>$qty_data['cost'],
                "created_at"=>date('Y-m-d H:i:s'),
                "created_by"=>$token_data->id
            ];
            $this->db->insert('merch_quantity_log',$raw_data);
            $id = $this->db->insert_id();
            if($id){
                    $child_data=[
                        "merch_id"=>$qty_data['merch_id'],
                        "merch_child_id"=>$qty_data['merch_child_id'],
                        "stock_type"=>$qty_data['stock_type'],
                        "stock_id"=>$qty_data['stock_id']
                    ];
                    $getdata=$this->db->get_where('merch_quantity',$child_data)->row();
                    if($getdata){
                        $quantity=$getdata->quantity+$raw_data['quantity'];
                        $this->db->where($child_data)->update('merch_quantity',['quantity'=>$quantity]);
                    }else{
                        $this->db->insert('merch_quantity',$raw_data);
                    }
            }   
        }
         $this->set_response_simple($id, 'Success..!', REST_Controller::HTTP_CREATED, TRUE);
        // }
    }
}

