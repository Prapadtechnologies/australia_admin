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
        $merch_ids=[];
        $data=[];
        if($stock_type != '' && $stock_id != ''){
            $merch_ids=$this->db->select('merch_id')->get_where('merch_quantity',['stock_type'=>$stock_type,'stock_id'=>$stock_id])->result_array();
            if(count($merch_ids) > 0){
                $this->db->select('m.*,s.name,c.colour_name');
                $this->db->join('sub_categories as s','s.id = m.product_type','left');
                $this->db->join('colours as c','c.id = m.colour','left');
                $this->db->order_by('m.updated_at','desc');
                $this->db->where('m.user_id',$token_data->id);
                $this->db->where_in('m.id',array_column($merch_ids,'merch_id'));
                $merch = $this->db->get('merch as m')->result_array();
            }else{
                $merch=[];
            }
        }else{
            $this->db->select('m.*,s.name,c.colour_name');
            $this->db->join('sub_categories as s','s.id = m.product_type','left');
            $this->db->join('colours as c','c.id = m.colour','left');
            $this->db->order_by('m.updated_at','desc');
            $this->db->where('m.user_id',$token_data->id);
            $merch = $this->db->get('merch as m')->result_array();
        }
        foreach ($merch as $mer) {
            $child_data=$this->db->select('m.*,s.size_name')->join('sizes as s','s.id = m.size','left')->get_where('merch_child as m',['m.merch_id'=>$mer['id']])->result_array();
            //print_r($child_data);die;
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

            if (file_exists('./uploads/merch_image/merch_1_'.$mer['id'].'.png')) {
                $mer['image1']=base_url('uploads/merch_image/merch_1_'.$mer['id'].'.png');
            }else{
                //$mer['image1']=base_url('uploads/merch_image/default.png');
                $mer['image1']='';
            }

            if (file_exists('./uploads/merch_image/merch_2_'.$mer['id'].'.png')) {
                $mer['image2']=base_url('uploads/merch_image/merch_2_'.$mer['id'].'.png');
            }else{
                //$mer['image2']=base_url('uploads/merch_image/default.png');
                $mer['image2']='';
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
                if($raw_data['category'] == 'Apparel'){
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
                }else{
                    $child_data=[
                        "merch_id"=>$id,
                        "sku_code"=>$raw_data['sku'],
                        "sale_price"=>$raw_data['sale_price'],
                        "cost"=>$raw_data['cost'],
                        "created_at"=>date('Y-m-d H:i:s'),
                        "created_by"=>$token_data->id
                    ];
                    $this->db->insert('merch_child',$child_data);
                }
                if (!file_exists('./uploads/merch_image')) {
                    mkdir('./uploads/merch_image', 0777, true);
                }
                if($this->input->post('image1')){
                    file_put_contents("./uploads/merch_image/merch_1_".$id.".png", base64_decode($this->input->post('image1')));
                }
                if($this->input->post('image2')){
                    file_put_contents("./uploads/merch_image/merch_2_".$id.".png", base64_decode($this->input->post('image2')));
                }

            }
            $this->set_response_simple($id, 'Success..!', REST_Controller::HTTP_CREATED, TRUE);
        // }
    }
    public function merchimage_post(){
        $token_data = $this->validate_token($this->input->get_request_header('X_AUTH_TOKEN'));
        $_POST = json_decode(file_get_contents("php://input"), TRUE);
        //print_r($this->input->post('image1'));die;

        if (!file_exists('./uploads/merch_image')) {
            mkdir('./uploads/merch_image', 0777, true);
        }
        if($this->input->post('image1')){
            file_put_contents("./uploads/merch_image/merch_".$this->input->post('merch_id').".png", base64_decode($this->input->post('image1')));
        }
        if($is_updated){
            $this->set_response_simple(($is_updated == FALSE) ? FALSE : $is_updated, 'Success..!', REST_Controller::HTTP_ACCEPTED, TRUE);
        }else {
            $this->set_response_simple(($is_updated == FALSE) ? FALSE : $is_updated, 'Failed..!', REST_Controller::HTTP_NON_AUTHORITATIVE_INFORMATION, TRUE);
        }
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
                        $this->db->where($child_data)->update('merch_quantity',['quantity'=>$quantity,'updated_by'=>$token_data->id,'updated_at'=>date('Y-m-d H:i:s')]);
                    }else{
                        $this->db->insert('merch_quantity',$raw_data);
                    }
            }   
        }
        $this->set_response_simple($id, 'Success..!', REST_Controller::HTTP_CREATED, TRUE);
        // }
    }
    public function merch_move_inventory_post()
    {
        $token_data = $this->validate_token($this->input->get_request_header('X_AUTH_TOKEN'));
        $_POST = json_decode(file_get_contents("php://input"), TRUE);
        $inventory_type=$_POST['inventory_type'];
        for($i=0; $i < count($_POST['inventory_data']); $i++){
            $qty_data=$_POST['inventory_data'][$i];
            $raw_data=[
                "merch_id"=>$qty_data['merch_id'],
                "merch_child_id"=>$qty_data['merch_child_id'],
                "inventory_type"=>$inventory_type,
                "from_stock_type"=>$qty_data['from_stock_type'],
                "from_stock_id"=>$qty_data['from_stock_id'],
                "to_stock_type"=>$qty_data['to_stock_type'],
                "to_stock_id"=>$qty_data['to_stock_id'],
                "quantity"=>$qty_data['quantity'],
                "created_at"=>date('Y-m-d H:i:s'),
                "created_by"=>$token_data->id
            ];
            if($inventory_type == 'transfer'){
                $raw_data['inventory_status']='processed';  
            }
            $this->db->insert('merch_move_inventory_log',$raw_data);
            $move_id=$this->db->insert_id();
            if($inventory_type == 'transfer'){
                if($move_id > 0){
                    $raw_qty_data=[[
                        "merch_id"=>$qty_data['merch_id'],
                        "merch_child_id"=>$qty_data['merch_child_id'],
                        "qty_type"=>'debit',
                        "stock_type"=>$qty_data['from_stock_type'],
                        "stock_id"=>$qty_data['from_stock_id'],
                        "quantity"=>$qty_data['quantity'],
                        "created_at"=>date('Y-m-d H:i:s'),
                        "created_by"=>$token_data->id
                    ],[
                        "merch_id"=>$qty_data['merch_id'],
                        "merch_child_id"=>$qty_data['merch_child_id'],
                        "qty_type"=>'credit',
                        "stock_type"=>$qty_data['to_stock_type'],
                        "stock_id"=>$qty_data['to_stock_id'],
                        "quantity"=>$qty_data['quantity'],
                        "created_at"=>date('Y-m-d H:i:s'),
                        "created_by"=>$token_data->id
                    ]];
                    $this->db->insert_batch('merch_quantity_log',$raw_qty_data);
                    $id = $this->db->insert_id();
                    if($id){
                        $from_child_data=[
                            "merch_id"=>$qty_data['merch_id'],
                            "merch_child_id"=>$qty_data['merch_child_id'],
                            "stock_type"=>$qty_data['from_stock_type'],
                            "stock_id"=>$qty_data['from_stock_id']
                        ];
                        $to_child_data=[
                            "merch_id"=>$qty_data['merch_id'],
                            "merch_child_id"=>$qty_data['merch_child_id'],
                            "stock_type"=>$qty_data['to_stock_type'],
                            "stock_id"=>$qty_data['to_stock_id']
                        ];
                        $getdata=$this->db->get_where('merch_quantity',$from_child_data)->row();
                        if($getdata){
                            $quantity=$getdata->quantity-$raw_data['quantity'];
                            $this->db->where($from_child_data)->update('merch_quantity',['quantity'=>$quantity]);
                        }

                        $to_getdata=$this->db->get_where('merch_quantity',$to_child_data)->row();
                        if($to_getdata){
                            $quantity=$to_getdata->quantity+$raw_data['quantity'];
                            $this->db->where($from_child_data)->update('merch_quantity',['quantity'=>$quantity]);
                        }else{
                            $sale_price=$this->db->select('sale_price')->get_where('merch_child',['id'=>$raw_data['merch_child_id'],'id'=>$raw_data['merch_id']])->row_array();            
                            $to_child_data['cost']=$sale_price['sale_price'];
                            $to_child_data['quantity']=$raw_data['quantity'];            
                            $to_child_data["created_at"]=date('Y-m-d H:i:s');
                            $to_child_data["created_by"]=$token_data->id;
                            $this->db->insert('merch_quantity',$to_child_data);
                        }
                    }   
                }
            }
        }
        $this->set_response_simple($move_id, 'Success..!', REST_Controller::HTTP_CREATED, TRUE);
    }
    public function merch_counts_get()
    {
        $token_data=$this->validate_token($this->input->get_request_header('X_AUTH_TOKEN'));
        $show_id=$this->input->get('show_id');
        $tour_id=$this->input->get('tour_id');
        $stand_type=$this->input->get('stand_type') ?? 1;
        $merch_ids=[];
        $data=[];
        
        $trailer_ids=$this->db->select('id')->get_where('trailer',['tour_id'=>$tour_id])->row_array();
        if($trailer_ids != '' && count($trailer_ids) > 0){
            $merch_ids=$this->db->select('merch_id')->get_where('merch_quantity',['stock_type'=>'trailer','stock_id'=>$trailer_ids['id']])->result_array();
        }

        if($merch_ids != '' && count($merch_ids) > 0){
            $this->db->select('m.*,s.name,c.colour_name');
            $this->db->join('sub_categories as s','s.id = m.product_type','left');
            $this->db->join('colours as c','c.id = m.colour','left');
            $this->db->order_by('m.updated_at','desc');
            //$this->db->where('m.user_id',$token_data->id);
            $this->db->where_in('m.id',array_column($merch_ids,'merch_id'));
            $merch = $this->db->get('merch as m')->result_array();

            $stand_type_list=$this->db->select('id,stand_type')->get_where('merch_count_stands',['tour_id'=>$tour_id,'show_id'=>$show_id])->result_array();
            $data['stand_type_list']=$stand_type_list;
            //$show_info=$this->db->select('*')->get_where('merch_count_shows',['tour_id'=>$tour_id,'show_id'=>$show_id])->row_array();
            //if(count($show_info) > 0){
            $show_info=$this->db->select('*')->get_where('shows',['tour_id'=>$tour_id,'id'=>$show_id])->row_array();
            //}
            $data['shows_data']=[
                'tax_method'=>$show_info['tax_method'],
                'tax_apparel'=>$show_info['tax_apparel'],
                'tax_others'=>$show_info['tax_others'],
                'tax_music'=>$show_info['tax_music']
            ];
            //print_r($merch);
        }else{
            $merch=[];
        }
        
        foreach ($merch as $mer) {
            $child_data=$this->db->select('m.*,s.size_name')->join('sizes as s','s.id = m.size','left')->get_where('merch_child as m',['m.merch_id'=>$mer['id']])->result_array();
            $child_list_data=[];
            $total_quantity_count=0;
            $l_trailer_inbound=$l_trailer_onhand=$l_total=$l_avg_cost=$sizes_list_api=$l_qty_id=$l_in_stock=$l_adds=$l_adds1=$l_adds2=$l_adds3=$l_comps=$l_out_stock=[];
            $d_in_stock=$d_adds=$d_adds1=$d_adds2=$d_adds3=$d_comps=$d_out_stock=0;
            foreach ($child_data as $qty_child) {
                $qty_sale_cost=$qty_child['sale_price'];
                $total_where=['merch_id'=>$mer['id'],'merch_child_id'=>$qty_child['id']];
                $trailer_where=['merch_id'=>$mer['id'],'merch_child_id'=>$qty_child['id'],'stock_type'=>'trailer','stock_id'=>$trailer_ids['id']];
                $total_onhand=$this->db->select('SUM(quantity) as total_quantity')->get_where('merch_quantity',$total_where)->row_array();
                //$trailer_onhand=$this->db->select('SUM(quantity) as total_quantity')->get_where('merch_quantity',$trailer_where)->row_array();
                $trailer_onhand=$this->db->select('id as qty_id,cost as qty_sale_cost,quantity as total_quantity')->get_where('merch_quantity',$trailer_where)->row_array();

                //echo $this->db->last_query();die;
                //print_r($trailer_onhand);die;
                $total_onhand_total=$trailer_onhand_total=$qty_id=0;
                if($trailer_onhand != ''){
                    $qty_sale_cost=$trailer_onhand['qty_sale_cost'];
                    $total_onhand_total=($total_onhand['total_quantity'] != '')? $total_onhand['total_quantity'] : 0;
                    $trailer_onhand_total=($trailer_onhand['total_quantity'] != '')? $trailer_onhand['total_quantity'] : 0;
                    $qty_id=($trailer_onhand['qty_id'] != '')? $trailer_onhand['qty_id'] : 0;
                }
                if($qty_id > 0){
                    $check_where=['tour_id'=>$tour_id,'show_id'=>$show_id,'stand_type'=>$stand_type,'qty_id'=>$qty_id];
                    $getdata=$this->db->get_where('merch_counts',$check_where)->row();
                    if($getdata != ''){
                        $qty_sale_cost=$getdata->sale_price;
                    }
                    $d_in_stock=$getdata->in_stock ?? 0;
                    $d_adds1=$getdata->adds1 ?? 0;
                    $d_adds2=$getdata->adds2 ?? 0;
                    $d_adds3=$getdata->adds3 ?? 0;
                    $d_adds=$d_adds1+$d_adds2+$d_adds3;
                    $d_comps=$getdata->comps ?? 0;
                    $d_out_stock=$getdata->out_stock ?? 0;
                }
                $qty_total=$total_onhand_total;
                $qty_child['ordered']=0;
                $qty_child['trailer_inbound']=0;
                $qty_child['trailer_onhand']=$trailer_onhand_total;
                $qty_child['qty_ids']=$qty_id;
                $qty_child['global']=$qty_total;                
                $child_list_data[]=$qty_child;
                $total_quantity_count=$total_quantity_count+$qty_total;

                $l_trailer_onhand[]=$trailer_onhand_total;
                $l_total[]=$qty_total;
                $l_avg_cost[]=$qty_sale_cost;//$qty_child['cost'];
                $sizes_list_api[]=$qty_child['size_name'];
                $l_qty_id[]=$qty_id;
                $l_in_stock[]=$d_in_stock;
                $l_adds[]=$d_adds;
                $l_adds1[]=$d_adds1;
                $l_adds2[]=$d_adds2;
                $l_adds3[]=$d_adds3;
                $l_comps[]=$d_comps;
                $l_out_stock[]=$d_out_stock;
            }

            if (file_exists('./uploads/merch_image/merch_1_'.$mer['id'].'.png')) {
                $mer['image1']=base_url('uploads/merch_image/merch_1_'.$mer['id'].'.png');
            }else{
                //$mer['image1']=base_url('uploads/merch_image/default.png');
                $mer['image1']='';
            }

            if (file_exists('./uploads/merch_image/merch_2_'.$mer['id'].'.png')) {
                $mer['image2']=base_url('uploads/merch_image/merch_2_'.$mer['id'].'.png');
            }else{
                //$mer['image2']=base_url('uploads/merch_image/default.png');
                $mer['image2']='';
            }
            
            
            $mer['quantity_total']=$total_quantity_count;
            $mer['global']   = ['title'=>'Global','data'=>$l_total];
            $mer['trailer']  = [['title'=>'TRLR Stock','data'=>$l_trailer_onhand],['title'=>'Price','data'=>$l_avg_cost]];
            $mer['in_stock']  = [['title'=>'Incount','data'=>$l_in_stock],['title'=>'adds','data'=>$l_adds],['title'=>'adds1','data'=>$l_adds1],['title'=>'adds2','data'=>$l_adds2],['title'=>'adds3','data'=>$l_adds3]];
            $mer['out_stock']  = [['title'=>'Comps','data'=>$l_comps],['title'=>'Out','data'=>$l_out_stock]];
            
            $mer['graph']=[
                'min_limit'=>0,//min($l_total),
                'max_limit'=>500,//max($l_total),
                'Y_axis'=>$sizes_list_api,
                'graph_data'=>$l_total
            ];
            $mer['child_list']=$child_list_data;
            $merch_show_info=$this->db->select('*')->get_where('merch_count_shows',['tour_id'=>$tour_id,'show_id'=>$show_id,'merch_id'=>$mer['id']])->row_array();
            if($merch_show_info && count($merch_show_info) > 0){
                $mer['merch_tax']=$merch_show_info['tax_'.strtolower($mer['category'])];
            }else{
                $mer['merch_tax']=$show_info['tax_'.strtolower($mer['category'])];
            }
            $data['merch_list'][]=$mer;
        }  
        $this->set_response_simple(($data == FALSE) ? [] : $data, 'Success..!', REST_Controller::HTTP_OK, TRUE);
    }
    public function merch_counts_total_get()
    {
        $token_data=$this->validate_token($this->input->get_request_header('X_AUTH_TOKEN'));
        $show_id=$this->input->get('show_id');
        $tour_id=$this->input->get('tour_id');
        $merch_ids=[];
        $data=[];
        
        $trailer_ids=$this->db->select('id')->get_where('trailer',['tour_id'=>$tour_id])->row_array();

        if($trailer_ids != '' && count($trailer_ids) > 0){
            $merch_ids=$this->db->select('merch_id')->get_where('merch_quantity',['stock_type'=>'trailer','stock_id'=>$trailer_ids['id']])->result_array();
        }

        if($merch_ids != '' && count($merch_ids) > 0){
            $this->db->select('m.*,s.name,c.colour_name');
            $this->db->join('sub_categories as s','s.id = m.product_type','left');
            $this->db->join('colours as c','c.id = m.colour','left');
            $this->db->order_by('m.updated_at','desc');
            //$this->db->where('m.user_id',$token_data->id);
            $this->db->where_in('m.id',array_column($merch_ids,'merch_id'));
            $merch = $this->db->get('merch as m')->result_array();

            $stand_type_list=$this->db->select('id,stand_type')->get_where('merch_count_stands',['tour_id'=>$tour_id,'show_id'=>$show_id])->result_array();
            $data['stand_type_list']=$stand_type_list;
            //$show_info=$this->db->select('*')->get_where('merch_count_shows',['tour_id'=>$tour_id,'show_id'=>$show_id])->row_array();
            //if(count($show_info) > 0){
            $show_info=$this->db->select('*')->get_where('shows',['tour_id'=>$tour_id,'id'=>$show_id])->row_array();
            //}
            $tax_method=$show_info['tax_method'];
            $data['shows_data']=[
                'tax_method'=>$show_info['tax_method'],
                'tax_apparel'=>$show_info['tax_apparel'],
                'tax_others'=>$show_info['tax_others'],
                'tax_music'=>$show_info['tax_music']
            ];
            //print_r($merch);
        }else{
            $merch=[];
        }
        $a_gross_in_total=$a_gross_value_add_total=$a_gross_in_add_total=$a_comp_value_total=$a_gross_sales_man_stand=0;
        $o_gross_in_total=$o_gross_value_add_total=$o_gross_in_add_total=$o_comp_value_total=$o_gross_sales_man_stand=0;
        $m_gross_in_total=$m_gross_value_add_total=$m_gross_in_add_total=$m_comp_value_total=$m_gross_sales_man_stand=0;
        $final_total=0;
        $all_stands['stand1']=['total_units'=>0,'gross_total'=>0];
        if(count($stand_type_list) > 0){
            for ($i=0; $i < count($stand_type_list); $i++) { 
                $all_stands['stand'.$stand_type_list[$i]['stand_type']]=['total_units'=>0,'gross_total'=>0];
            }
        }
        $stand_type_val=1;
        foreach ($merch as $mer) {
            $merch_show_info=$this->db->select('*')->get_where('merch_count_shows',['tour_id'=>$tour_id,'show_id'=>$show_id,'merch_id'=>$mer['id']])->row_array();
            if($merch_show_info && count($merch_show_info) > 0){
                $merch_tax=$merch_show_info['tax_'.strtolower($mer['category'])];
            }else{
                $merch_tax=$show_info['tax_'.strtolower($mer['category'])];
            }
            $child_data=$this->db->select('m.*,s.size_name')->join('sizes as s','s.id = m.size','left')->get_where('merch_child as m',['m.merch_id'=>$mer['id']])->result_array();
            $total_quantity_count=0;
            $d_in_stock=$d_adds=$d_adds1=$d_adds2=$d_adds3=$d_comps=$d_out_stock=0;
            foreach ($child_data as $qty_child) {
                $qty_sale_cost=$qty_child['sale_price'];
                $total_where=['merch_id'=>$mer['id'],'merch_child_id'=>$qty_child['id']];
                $trailer_where=['merch_id'=>$mer['id'],'merch_child_id'=>$qty_child['id'],'stock_type'=>'trailer','stock_id'=>$trailer_ids['id']];
                $total_onhand=$this->db->select('SUM(quantity) as total_quantity')->get_where('merch_quantity',$total_where)->row_array();
                $trailer_onhand=$this->db->select('id as qty_id,cost as qty_sale_cost,quantity as total_quantity')->get_where('merch_quantity',$trailer_where)->row_array();

                //echo $this->db->last_query();die;
                //print_r($trailer_onhand);die;
                $total_onhand_total=$trailer_onhand_total=$qty_id=0;
                if($trailer_onhand != ''){
                    $qty_sale_cost=$trailer_onhand['qty_sale_cost'];
                    $total_onhand_total=($total_onhand['total_quantity'] != '')? $total_onhand['total_quantity'] : 0;
                    $trailer_onhand_total=($trailer_onhand['total_quantity'] != '')? $trailer_onhand['total_quantity'] : 0;
                    $qty_id=($trailer_onhand['qty_id'] != '')? $trailer_onhand['qty_id'] : 0;
                }
                if($qty_id > 0){
                    $check_where=['tour_id'=>$tour_id,'show_id'=>$show_id,'qty_id'=>$qty_id];
                    $getdata=$this->db->get_where('merch_counts',$check_where)->row();
                    if($getdata != ''){
                        $qty_sale_cost=$getdata->sale_price;
                        $stand_type_val=$getdata->stand_type;
                    }
                    $d_in_stock=$getdata->in_stock ?? 0;
                    $d_adds1=$getdata->adds1 ?? 0;
                    $d_adds2=$getdata->adds2 ?? 0;
                    $d_adds3=$getdata->adds3 ?? 0;
                    $d_adds=$d_adds1+$d_adds2+$d_adds3;
                    $d_comps=$getdata->comps ?? 0;
                    $d_out_stock=$getdata->out_stock ?? 0;
                }
                $qty_total=$total_onhand_total;
                $total_quantity_count=$total_quantity_count+$qty_total;
                $final_cost=$qty_sale_cost;
                //echo $mer['category'];
                if($tax_method == 'exclusive'){
                    $final_cost=$qty_sale_cost+($qty_sale_cost*$merch_tax)/100;
                }
                $final_in_stock=$d_in_stock*$final_cost;
                $final_adds=($d_adds)*$final_cost;
                $final_gross_in_add=$final_in_stock+$final_adds;
                $final_comps=$d_comps*$final_cost;
                $final_sold_stock=$d_in_stock+$d_adds;
                $total_sold_stock=($d_in_stock+$d_adds-$d_comps-$d_out_stock);
                if($mer['category'] == 'Apparel'){
                    $a_gross_in_total=$a_gross_in_total+$final_in_stock;
                    $a_gross_value_add_total=$a_gross_value_add_total+$final_adds;
                    $a_gross_in_add_total=$a_gross_in_add_total+$final_gross_in_add;
                    $a_comp_value_total=$a_comp_value_total+$final_comps;
                    $a_gross_sales_man_stand=0;
                }elseif($mer['category'] == 'Music'){
                    $m_gross_in_total=$m_gross_in_total+$final_in_stock;
                    $m_gross_value_add_total=$m_gross_value_add_total+$final_adds;
                    $m_gross_in_add_total=$m_gross_in_add_total+$final_gross_in_add;
                    $m_comp_value_total=$m_comp_value_total+$final_comps;
                    $m_gross_sales_man_stand=0;
                }else{
                    $o_gross_in_total=$o_gross_in_total+$final_in_stock;
                    $o_gross_value_add_total=$o_gross_value_add_total+$final_adds;
                    $o_gross_in_add_total=$o_gross_in_add_total+$final_gross_in_add;
                    $o_comp_value_total=$o_comp_value_total+$final_comps;
                    $o_gross_sales_man_stand=0;
                }

                $all_stands['stand'.$stand_type_val]['total_units']=$all_stands['stand'.$stand_type_val]['total_units']+$total_sold_stock;
                $all_stands['stand'.$stand_type_val]['gross_total']=$all_stands['stand'.$stand_type_val]['gross_total']+($total_sold_stock*$final_cost);

                // echo $qty_sale_cost.", ";
                // //echo $total_onhand_total.", ";
                // echo $merch_tax.", ";
                // echo $trailer_onhand_total.", ";
                // echo $d_in_stock.", ";
                // echo $d_adds1.", ";
                // echo $d_adds2.", ";
                // echo $d_adds3.", ";
                // echo $d_comps.", ";
                // echo $d_out_stock.", ";
                // die;
            }
        }  
        $data['merch_counts']  = [
            ['title'=>'Apparel','data'=>[$a_gross_in_total, $a_gross_value_add_total, $a_gross_in_add_total, $a_comp_value_total, $a_gross_sales_man_stand]],
            ['title'=>'Others','data'=>[$o_gross_in_total, $o_gross_value_add_total, $o_gross_in_add_total, $o_comp_value_total, $o_gross_sales_man_stand]],
            ['title'=>'Music','data'=>[$m_gross_in_total, $m_gross_value_add_total, $m_gross_in_add_total, $m_comp_value_total, $m_gross_sales_man_stand]]
        ];
        $main_gross_in_total=($a_gross_in_total+$o_gross_in_total+$m_gross_in_total);
        $main_gross_value_add_total=($a_gross_value_add_total+$o_gross_value_add_total+$m_gross_value_add_total);
        $main_gross_in_add_total=($a_gross_in_add_total+$o_gross_in_add_total+$m_gross_in_add_total);
        $main_comp_value_total=($a_comp_value_total+$o_comp_value_total+$m_comp_value_total);
        $main_gross_sales_man_stand=($a_gross_sales_man_stand+$o_gross_sales_man_stand+$m_gross_sales_man_stand);
        $data['total']   = ['title'=>'Total','data'=>[$main_gross_in_total,$main_gross_value_add_total,$main_gross_in_add_total,$main_comp_value_total,$main_gross_sales_man_stand]];
        $data['gross_total']=$main_gross_in_total+$main_gross_value_add_total+$main_gross_in_add_total+$main_comp_value_total+$main_gross_sales_man_stand;
        foreach ($all_stands as $standKey => $standValue) {
            $standValue['stand'] = $standKey; // Optionally, you can keep the stand key in each item
            $resultArray[] = $standValue;
        }
        $data['stands']= $resultArray;
        $this->set_response_simple(($data == FALSE) ? [] : $data, 'Success..!', REST_Controller::HTTP_OK, TRUE);
    }
    
    public function merch_count_create_post()
    {
        $token_data = $this->validate_token($this->input->get_request_header('X_AUTH_TOKEN'));
        $_POST = json_decode(file_get_contents("php://input"), TRUE);
        $qty_data=$_POST;
        $raw_data=[
            // "merch_id"=>$qty_data['merch_id'],
            // "merch_child_id"=>$qty_data['merch_child_id'],
            "tour_id"=>$qty_data['tour_id'],
            "show_id"=>$qty_data['show_id'],
            "qty_id"=>$qty_data['qty_id'],
            //"cost"=>$qty_data['cost'],
            "stand_type"=>$qty_data['stand_type'] ?? 1,
            "sale_price"=>$qty_data['sale_price'],
            "in_stock"=>$qty_data['in_stock'],
            "adds1"=>$qty_data['adds1'],
            "adds2"=>$qty_data['adds2'],
            "adds3"=>$qty_data['adds3'],
            "comps"=>$qty_data['comps'],
            "out_stock"=>$qty_data['out_stock']
        ];
        $check_where=['tour_id'=>$qty_data['tour_id'],'show_id'=>$qty_data['show_id'],'stand_type'=>$raw_data['stand_type'],'qty_id'=>$qty_data['qty_id']];
        $getdata=$this->db->get_where('merch_counts',$check_where)->row_array();

        $trailer_onhand=$this->db->get_where('merch_quantity',['id'=>$qty_data['qty_id']])->row_array();
        //echo $this->db->last_query();die;
        $total_quantity=$trailer_onhand['quantity'];
 
        /* echo "<pre/>";
        print_r($getdata);
        print_r($trailer_onhand);die;*/
        
        if($getdata){
            $raw_data["updated_at"]=date('Y-m-d H:i:s');
            $raw_data["updated_by"]=$token_data->id;
            $up_res=$this->db->where($check_where)->update('merch_counts',$raw_data);

            $final_quantity=$total_quantity;
            if($qty_data['in_stock'] > $getdata['in_stock']){
                $final_quantity=$final_quantity - ($qty_data['in_stock'] - $getdata['in_stock']);
            }else if($qty_data['in_stock'] < $getdata['in_stock']){
                $final_quantity=($getdata['in_stock'] - $qty_data['in_stock']) + $final_quantity;
            }else{
                $less_total_quantity=0;
            }

            if($qty_data['adds1'] > $getdata['adds1']){
                $final_quantity=$final_quantity - ($qty_data['adds1'] - $getdata['adds1']);
            }else if($qty_data['adds1'] < $getdata['adds1']){
                $final_quantity=($getdata['adds1'] - $qty_data['adds1']) + $final_quantity;
            }else{
                $adds1_total_quantity=0;
            }

            if($qty_data['adds2'] > $getdata['adds2']){
                $final_quantity=$final_quantity - ($qty_data['adds2'] - $getdata['adds2']);
            }else if($qty_data['adds2'] < $getdata['adds2']){
                $final_quantity=($getdata['adds2'] - $qty_data['adds2']) + $final_quantity;
            }else{
                $adds2_total_quantity=0;
            }

            if($qty_data['adds3'] > $getdata['adds3']){
                $final_quantity=$final_quantity - ($qty_data['adds3'] - $getdata['adds3']);
            }else if($qty_data['adds3'] < $getdata['adds3']){
                $final_quantity=($getdata['adds3'] - $qty_data['adds3']) + $final_quantity;
            }else{
                $adds3_total_quantity=0;
            }

            /*if($qty_data['comps'] > $getdata['comps']){
                $comps_total_quantity=$total_quantity - $qty_data['comps'];
            }else if($qty_data['comps'] < $getdata['comps']){
                $comps_total_quantity=$getdata['comps'] - $qty_data['comps'] + $total_quantity;
            }else{
                $comps_total_quantity=0;
            }*/

            /*if($less_total_quantity != 0){
                $final_quantity=$less_total_quantity;
            }elseif($adds1_total_quantity != 0){
                $final_quantity=$adds1_total_quantity;
            }elseif($adds2_total_quantity != 0){
                $final_quantity=$adds2_total_quantity;
            }elseif($adds3_total_quantity != 0){
                $final_quantity=$adds3_total_quantity;
            }elseif($comps_total_quantity != 0){
                $final_quantity=$comps_total_quantity;
            }else{
                $final_quantity=0;
            }*/
            if($final_quantity != 0){
                $this->db->where(['id'=>$qty_data['qty_id']])->update('merch_quantity',['quantity'=>$final_quantity]);
            }
        }else{
            $raw_data["created_at"]=date('Y-m-d H:i:s');
            $raw_data["created_by"]=$token_data->id;
            $up_res=$this->db->insert('merch_counts',$raw_data);
            $less_total_quantity=$total_quantity - $qty_data['in_stock'] - $qty_data['adds1'] - $qty_data['adds2'] - $qty_data['adds3'] - $qty_data['comps'];
            $this->db->where(['id'=>$qty_data['qty_id']])->update('merch_quantity',['quantity'=>$less_total_quantity]);
        }   
        $stand_data=[
            "tour_id"=>$raw_data['tour_id'],
            "show_id"=>$raw_data['show_id'],
            "stand_type"=>$raw_data['stand_type']
        ]; 
        $getstanddata=$this->db->get_where('merch_count_stands',$stand_data)->row();
        if($getstanddata == ''){           
            $stand_data["created_at"]=date('Y-m-d H:i:s');
            $stand_data["created_by"]=$token_data->id;
            $this->db->insert('merch_count_stands',$stand_data);
        }
        $this->set_response_simple($id, 'Success..!', REST_Controller::HTTP_CREATED, TRUE);
    }
    public function counts_change_price_post()
    {
        $token_data = $this->validate_token($this->input->get_request_header('X_AUTH_TOKEN'));
        $_POST = json_decode(file_get_contents("php://input"), TRUE);
        $tour_id=$_POST['tour_id'];
        $show_id=$_POST['show_id'];
        $stand_type=$_POST['stand_type'] ?? 1;
        for($i=0; $i < count($_POST['prices']); $i++){
            $qty_id=$_POST['prices'][$i]['qty_id'];
            $cost=$_POST['prices'][$i]['cost'];
            $sale_price=$_POST['prices'][$i]['sale_price'];
            $raw_data=[
                "tour_id"=>$tour_id,
                "show_id"=>$show_id,
                "stand_type"=>$stand_type,
                "qty_id"=>$qty_id,
                "cost"=>$cost,
                "sale_price"=>$sale_price,
            ];
            $check_where=['tour_id'=>$tour_id,'show_id'=>$show_id,'stand_type'=>$stand_type,'qty_id'=>$qty_id];
            $getdata=$this->db->get_where('merch_counts',$check_where)->row();
            if($getdata){
                $raw_data["updated_at"]=date('Y-m-d H:i:s');
                $raw_data["updated_by"]=$token_data->id;
                $this->db->where($check_where)->update('merch_counts',$raw_data);
            }else{
                $raw_data["created_at"]=date('Y-m-d H:i:s');
                $raw_data["created_by"]=$token_data->id;
                $this->db->insert('merch_counts',$raw_data);
            }   
        }
        $this->set_response_simple($id, 'Success..!', REST_Controller::HTTP_CREATED, TRUE);
    }
    public function counts_change_tax_post()
    {
        $token_data = $this->validate_token($this->input->get_request_header('X_AUTH_TOKEN'));
        $_POST = json_decode(file_get_contents("php://input"), TRUE);
        $tour_id=$_POST['tour_id'];
        $show_id=$_POST['show_id'];
        $merch_id=$_POST['merch_id'];
        $category=$_POST['category'];
        $tax_per=$_POST['tax_per'];
        $raw_data=[
            "tour_id"=>$tour_id,
            "show_id"=>$show_id,
            "merch_id"=>$merch_id,
            "tax_".strtolower($category)=>$tax_per
        ];   
        $check_where=['tour_id'=>$tour_id,'show_id'=>$show_id,'merch_id'=>$merch_id];
        $getdata=$this->db->get_where('merch_count_shows',$check_where)->row();
        if($getdata){
            $raw_data["updated_at"]=date('Y-m-d H:i:s');
            $raw_data["updated_by"]=$token_data->id;
            $this->db->where($check_where)->update('merch_count_shows',$raw_data);
        }else{
            $raw_data["created_at"]=date('Y-m-d H:i:s');
            $raw_data["created_by"]=$token_data->id;
            $this->db->insert('merch_count_shows',$raw_data);
        }          
        $this->set_response_simple($id, 'Success..!', REST_Controller::HTTP_CREATED, TRUE);
    }
    public function change_tax_method_post()
    {
        $token_data = $this->validate_token($this->input->get_request_header('X_AUTH_TOKEN'));
        $_POST = json_decode(file_get_contents("php://input"), TRUE);
        $tour_id=$_POST['tour_id'];
        $show_id=$_POST['show_id'];
        $tax_method=$_POST['tax_method'];
        $raw_data=[
            "tax_method"=>$tax_method
        ];   
        $check_where=['tour_id'=>$tour_id,'id'=>$show_id];
        $raw_data["updated_at"]=date('Y-m-d H:i:s');
        $raw_data["updated_by"]=$token_data->id;
        $this->db->where($check_where)->update('shows',$raw_data);          
        $this->set_response_simple($id, 'Success..!', REST_Controller::HTTP_CREATED, TRUE);
    }
    public function add_stand_type_post()
    {
        $token_data = $this->validate_token($this->input->get_request_header('X_AUTH_TOKEN'));
        $_POST = json_decode(file_get_contents("php://input"), TRUE);
        $tour_id=$_POST['tour_id'];
        $show_id=$_POST['show_id'];
        $stand_type=$_POST['stand_type'];
        $raw_data=[
            "tour_id"=>$tour_id,
            "show_id"=>$show_id,
            "stand_type"=>$stand_type
        ];            
        $raw_data["created_at"]=date('Y-m-d H:i:s');
        $raw_data["created_by"]=$token_data->id;
        $this->db->insert('merch_count_stands',$raw_data);  
        $this->set_response_simple($id, 'Success..!', REST_Controller::HTTP_CREATED, TRUE);
    }
}

