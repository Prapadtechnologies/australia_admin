<?php

class Master extends MY_Controller
{

    public function __construct()
    {
        parent::__construct();
        $this->template = 'template/admin/main';
        if (! $this->ion_auth->logged_in())
            redirect('auth/login');
        
        $this->load->model('category_model');
        $this->load->model('sub_category_model');
        $this->load->model('amenity_model');
        $this->load->model('service_model');
        $this->load->model('state_model');
        $this->load->model('district_model');
        $this->load->model('constituency_model');
        $this->load->model('vendor_list_model');
        $this->load->model('user_model');
        $this->load->model('setting_model');
        $this->load->model('wallet_transaction_model');
        $this->load->model('permission_model');
        $this->load->model('brand_model');
        
        $this->load->library('pagination');
    }

    /**
     * Categories crud
     *
     * @author Mehar
     * @param string $type
     * @param string $target
     */
    public function category($type = 'r')
    {
        /* if (! $this->ion_auth_acl->has_permission('category'))
            redirect('admin'); */
        
            if ($type == 'c') {
            $this->form_validation->set_rules($this->category_model->rules);
            if (empty($_FILES['file']['name'])) {
                $this->form_validation->set_rules('file', 'Category Image', 'required');
            }
            if ($this->form_validation->run() == FALSE) {
                $this->category('r');
            } else {
                $id = $this->category_model->insert([
                    'name' => $this->input->post('name'),
                    'desc' => $this->input->post('desc'),
                    'terms' => $this->input->post('terms'),
                ]);
                foreach ($this->input->post('service_id') as $sid){
                    $this->db->insert('categories_services', ['cat_id' => $id, 'service_id' => $sid]);
                }
                
                foreach ($this->input->post('brand_id') as $bid){
                    $this->db->insert('categories_brands', ['cat_id' => $id, 'brand_id' => $bid]);
                }
                $path = $_FILES['file']['name'];
                $this->file_up("file", "category", $id, '', 'no');
                $this->file_up("coming_soon_file", "coming_soon", $id, '', 'no');
                redirect('category/r', 'refresh');
            }
        } elseif ($type == 'r') {
            $this->data['title'] = 'Category';
            $this->data['content'] = 'master/category';
            $this->data['categories'] = $this->category_model->with_brands('fields:id, name')->with_services('fields:name,desc')->with_amenities('fields:name, desc')->with_categories_services('fields:service_id')->get_all();
            $this->data['services'] = $this->service_model->order_by('id', 'DESC')->get_all();
            $this->data['brands'] = $this->brand_model->order_by('id', 'DESC')->get_all();
            $this->_render_page($this->template, $this->data);
        } elseif ($type == 'u') {
           
            $this->form_validation->set_rules($this->category_model->rules);
            if ($this->form_validation->run() == FALSE) {
                $this->category('r');
            } else {
                $this->category_model->update([
                    'id' => $this->input->post('id'),
                    'name' => $this->input->post('name'),
                    'desc' => $this->input->post('desc'),
                    'terms' => $this->input->post('terms')
                ],  $this->input->post('id'));
                $this->db->delete('categories_services', ['cat_id' => $this->input->post('id')]);
                if(! empty($this->input->post('service_id'))){foreach ($this->input->post('service_id') as $sid){
                     $this->db->insert('categories_services', ['cat_id' => $this->input->post('id'), 'service_id' => $sid]);
                }}
                
                $this->db->delete('categories_brands', ['cat_id' => $this->input->post('id')]);
                if(! empty($this->input->post('brand_id'))){foreach ($this->input->post('brand_id') as $bid){
                    $this->db->insert('categories_brands', ['cat_id' => $this->input->post('id'), 'brand_id' => $bid]);
                }}
                if ($_FILES['file']['name'] !== '') {
                    $path = $_FILES['file']['name'];
                    $ext = pathinfo($path, PATHINFO_EXTENSION);
                    unlink('uploads/' . 'category' . '_image/' . 'category' . '_' . $this->input->post('id') . '.jpg');
                    move_uploaded_file($_FILES['file']['tmp_name'], 'uploads/' . 'category' . '_image/' . 'category' . '_' . $this->input->post('id') . '.jpg');
                }
                if ($_FILES['coming_soon_file']['name'] !== '') {
                    if (!file_exists('uploads/' . 'coming_soon' . '_image/')) {
                        mkdir('uploads/' . 'coming_soon' . '_image/', 0777, true);
                    }
                    $path = $_FILES['coming_soon_file']['name'];
                    unlink('uploads/' . 'coming_soon' . '_image/' . 'coming_soon' . '_' . $this->input->post('id') . '.jpg');
                    move_uploaded_file($_FILES['coming_soon_file']['tmp_name'], 'uploads/' . 'coming_soon' . '_image/' . 'coming_soon' . '_' . $this->input->post('id') . '.jpg');
                }
                redirect('category/r', 'refresh');
            }
        } elseif ($type == 'm') {
            $manage=$this->db->get_where('manage_account',array('status'=>1))->result_array();
            $i=0;foreach ($manage as $ma) {
                $cat_name=$this->db->get_where('manage_account_names',array('status'=>1,'category_id'=>$this->input->post('id'),'acc_id'=>$ma['id']));
                if($cat_name->num_rows() == 0){
                    $this->db->insert('manage_account_names', 
                        [
                            'category_id' => $this->input->post('id'), 
                            'acc_id' => $ma['id'],
                            'name' => $this->input->post($ma['desc']),
                            'desc' => $ma['desc'],
                            'field_status' => $this->input->post('r'.$ma['desc'])]);
                }else{
                    $this->db->where('id',$cat_name->row()->id)->update('manage_account_names',array(
                        'name'=>$this->input->post($ma['desc']),
                        'desc'=>$ma['desc'],
                        'acc_id'=>$ma['id'],
                        'field_status' => $this->input->post('r'.$ma['desc'])
                    )
                );
                }
        $i++;}
                
                redirect('category/r', 'refresh');
           
        } elseif ($type == 'd') {
            echo $this->category_model->delete(['id' => $this->input->post('id')]);
        }elseif($type == 'edit'){
            $this->data['title'] = 'Edit Category';
            $this->data['content'] = 'master/edit';
            $this->data['type'] = 'category';
            $this->data['category'] = $this->category_model->where('id',$this->input->get('id'))->get();
            $this->data['i'] = $this->category_model->where('file',$this->input->get('file'))->get();
            $this->data['categories'] = $this->category_model->with_brands('fields: id, name')->with_services('fields:id, name')->where('id', $this->input->get('id'))
            ->get();
            $this->data['services'] = $this->service_model->get_all();
            $this->data['brands'] = $this->brand_model->order_by('id', 'DESC')->get_all();
            //print_array($this->data['categories']);
            $this->_render_page($this->template, $this->data);
        }elseif($type == 'change_status'){
            echo $this->category_model->update([
                'status' => ($this->input->post('is_checked') == 'true') ? 1 : 0
            ], $this->input->post('cat_id'));
        }
    }
    
    /**
     * E-Commerce brand crud
     *
     * @author Trupti
     * @desc To Manage Ecommerce Sub Categories
     * @param string $type
     */
    public function brands($type = 'r'){
        /* if (! $this->ion_auth_acl->has_permission('ecom'))
         redirect('admin'); */
        
        if ($type == 'c') {
            $this->form_validation->set_rules($this->brand_model->rules);
            if (empty($_FILES['file']['name'])) {
                $this->form_validation->set_rules('file', 'Brands Image', 'required');
            }
            if ($this->form_validation->run() == FALSE) {
                $this->ecom_categories('r');
            } else {
                $id = $this->brand_model->insert([
                    'name' => $this->input->post('name'),
                    'desc' => $this->input->post('desc'),
                ]);
                
                $path = $_FILES['file']['name'];
                $ext = pathinfo($path, PATHINFO_EXTENSION);
                //$this->file_up("file", "brands", $id, '', 'no');
                move_uploaded_file($_FILES['file']['tmp_name'], 'uploads/' . 'brands' . '_image/' . 'brands' . '_' . $id . '.jpg');
                redirect('brands/r', 'refresh');
            }
        } elseif ($type == 'r') {
            $this->data['title'] = 'Brands';
            $this->data['content'] = 'admin/master/brands';
            $this->data['ecom_brands'] = $this->brand_model->order_by('id', 'ASCE')->get_all();
            $this->_render_page($this->template, $this->data);
        }  elseif ($type == 'u') {
            $this->form_validation->set_rules($this->brand_model->rules);
            if ($this->form_validation->run() == FALSE) {
                echo validation_errors();
            } else {
                $this->brand_model->update([
                    'id' => $this->input->post('id'),
                    'name' => $this->input->post('name'),
                    'desc' => $this->input->post('desc'),
                ], 'id');
                
                if ($_FILES['file']['name'] !== '') {
                    $path = $_FILES['file']['name'];
                    $ext = pathinfo($path, PATHINFO_EXTENSION);
                    //$this->file_up("file", "brands", $this->input->post('id'), '', 'no');
                    unlink('uploads/' . 'brands' . '_image/' . 'brands' . '_' . $this->input->post('id') . '.jpg');
                    move_uploaded_file($_FILES['file']['tmp_name'], 'uploads/' . 'brands' . '_image/' . 'brands' . '_' . $this->input->post('id') . '.jpg');
                }
                redirect('brands/r', 'refresh');
            }
        }elseif ($type == 'd') {
            echo $this->brand_model->delete(['id' => $this->input->post('id')]);
        }elseif($type == 'edit'){
            $this->data['title'] = 'Edit E-Commerce Brands';
            $this->data['content'] = 'admin/master/edit';
            $this->data['type'] = 'brand';
            $this->data['i'] = $this->brand_model->where('file',$this->input->get('file'))->get();
            $this->data['ecom_brands'] = $this->brand_model->order_by('id', 'DESC')->where('id', $this->input->get('id'))->get();
            $this->_render_page($this->template, $this->data);
        }elseif($type == 'list'){
            $data = $this->ecom_sub_category_model->with_brands('fields:id, name, desc')->with_ecom_sub_sub_categories('fields:id, name, desc')->where(['id' =>$this->input->post('sub_cat_id')])->get_all();
            echo json_encode($data);
        }elseif($type == 'change_status'){
             echo $this->brand_model->update([
                 'status' => ($this->input->post('is_checked') == 'true') ? 1 : 2
             ], $this->input->post('brand_id'));
        }
    }  
    
    /**
     * Sub_Category crud
     *
     * @author Mehar
     * @param string $type
     * @param string $target
     */
    public function sub_category($type = 'r')
    {
        
        /* if (! $this->ion_auth_acl->has_permission('sub_category'))
            redirect('admin'); */
            
            if ($type == 'c') {
                
                $this->form_validation->set_rules($this->sub_category_model->rules);
               
                 if (empty($_FILES['file']['name'])) {
                     $this->form_validation->set_rules('file', 'sub_category Image', 'required'); 
                }
                if ($this->form_validation->run() == FALSE) {
                    $this->sub_category('r');
                } else {
                    $id = $this->sub_category_model->insert([
                        'cat_id' => $this->input->post('cat_id'),
                        'name' => $this->input->post('name'),
                        'desc' => $this->input->post('desc')
                    ]);
                    
                    $path = $_FILES['file']['name'];
                    //$this->file_up("file", "sub_category", $id, '', 'no');
                    move_uploaded_file($_FILES['file']['tmp_name'], 'uploads/' . 'sub_category' . '_image/' . 'sub_category' . '_' . $id. '.jpg');
                    redirect('sub_category/r', 'refresh');
                }
            } elseif ($type == 'r') {
                $this->data['title'] = 'Sub_Category';
                $this->data['content'] = 'master/sub_category';
                $this->data['categories'] = $this->category_model->get_all();
                $this->data['sub_categories'] = $this->sub_category_model->order_by('id', 'DESC')->get_all();
                $this->_render_page($this->template, $this->data);
                //echo json_encode($this->data);
            } elseif ($type == 'u') {
                $this->form_validation->set_rules($this->sub_category_model->rules);  
                if ($this->form_validation->run() == FALSE) {
                    echo validation_errors();
                } else {
                    $this->sub_category_model->update([
                        'cat_id' => $this->input->post('cat_id'),
                        'name' => $this->input->post('name'),
                        'desc' => $this->input->post('desc')
                    ], $this->input->post('id'));
                    if ($_FILES['file']['name'] !== '') {
                        $path = $_FILES['file']['name'];
                        $ext = pathinfo($path, PATHINFO_EXTENSION);
                        //$this->file_up("file", "sub_category", $this->input->post('id'), '', 'no');
                        unlink('uploads/' . 'sub_category' . '_image/' . 'sub_category' . '_' . $this->input->post('id') . '.jpg');
                        move_uploaded_file($_FILES['file']['tmp_name'], 'uploads/' . 'sub_category' . '_image/' . 'sub_category' . '_' . $this->input->post('id') . '.jpg');
                    }
                    redirect('sub_category/r', 'refresh');
                }
            } elseif ($type == 'd') {
                $this->sub_category_model->delete(['id' => $this->input->post('id')]);
            }elseif($type == 'edit'){
                $this->data['title'] = 'Edit sub_category';
                $this->data['content'] = 'master/edit';
                $this->data['type'] = 'sub_category';
                $this->data['sub_categories']=$this->sub_category_model->order_by('id', 'DESC')->where('id', $this->input->get('id'))->get();
                $this->data['categories'] = $this->category_model->order_by('id', 'DESC')->get_all();
                $this->_render_page($this->template, $this->data);
            }
    }
    
    /**
     * Amenities crud
     *
     * @author Mehar
     * @param string $type
     * @param string $target
     */
    public function amenity($type = 'r')
    {
        /* if (! $this->ion_auth_acl->has_permission('amenity'))
            redirect('admin'); */
        
        if ($type == 'c') {
            $this->form_validation->set_rules($this->amenity_model->rules);
            if (empty($_FILES['file']['name'])) {
                $this->form_validation->set_rules('file', 'Amenity Image', 'required');
            }
            if ($this->form_validation->run() == FALSE) {
                $this->amenity('r');
            } else {
                $id = $this->amenity_model->insert([
                    'cat_id' => $this->input->post('cat_id'),
                    'name' => $this->input->post('name'),
                    'desc' => $this->input->post('desc')
                ]);
                
                $path = $_FILES['file']['name'];
                $ext = pathinfo($path, PATHINFO_EXTENSION);
                //$this->file_up("file", "amenity", $id, '', 'no');
                move_uploaded_file($_FILES['file']['tmp_name'], 'uploads/' . 'amenity' . '_image/' . 'amenity' . '_' . $id . '.jpg');
                redirect('amenity/r', 'refresh');
            }
        } elseif ($type == 'r') {
            $this->data['title'] = 'Amenity';
            $this->data['content'] = 'master/amenity';
            $this->data['categories'] = $this->category_model->get_all();
            $this->data['amenities'] = $this->amenity_model->order_by('id', 'DESC')->get_all();
            $this->_render_page($this->template, $this->data);
            //echo json_encode($this->data);
        } elseif ($type == 'u') {
            $this->form_validation->set_rules($this->amenity_model->rules);
            if ($this->form_validation->run() == FALSE) {
                echo validation_errors();
            } else {
                $this->amenity_model->update([
                    'id' => $this->input->post('id'),
                    'cat_id' => $this->input->post('cat_id'),
                    'name' => $this->input->post('name'),
                    'desc' => $this->input->post('desc')
                ], 'id');
                if ($_FILES['file']['name'] !== '') {
                    $path = $_FILES['file']['name'];
                    $ext = pathinfo($path, PATHINFO_EXTENSION);
                    //$this->file_up("file", "amenity", $this->input->post('id'), '', 'no');
                    unlink('uploads/' . 'amenity' . '_image/' . 'amenity' . '_' . $this->input->post('id') . '.jpg');
                    move_uploaded_file($_FILES['file']['tmp_name'], 'uploads/' . 'amenity' . '_image/' . 'amenity' . '_' . $this->input->post('id') . '.jpg');
                }
                redirect('amenity/r', 'refresh');
            }
        } elseif ($type == 'd') {
            $this->amenity_model->delete(['id' => $this->input->post('id')]);
        }elseif($type == 'edit'){
            $this->data['title'] = 'Edit Amenity';
            $this->data['content'] = 'master/edit';
            $this->data['type'] = 'amenity';
            $this->data['amenity']=$this->amenity_model->order_by('id', 'DESC')->where('id', $this->input->get('id'))->get();
            $this->data['categories'] = $this->category_model->order_by('id', 'DESC')->get_all();
            $this->_render_page($this->template, $this->data);
        }
    }

    /**
     * Services crud
     *
     * @author Mehar
     * @param string $type
     * @param string $target
     */
    public function service($type = 'r')
    {
        /* if (! $this->ion_auth_acl->has_permission('service'))
            redirect('admin'); */
        
        if ($type == 'c') {
            $this->form_validation->set_rules($this->service_model->rules);
           /*  if (empty($_FILES['file']['name'])) {
                $this->form_validation->set_rules('file', 'Service Image', 'required');
            } */
            if ($this->form_validation->run() == FALSE) {
                $this->service('r');
            } else {
                $id = $this->service_model->insert([
                    'name' => $this->input->post('name'),
                    'permission_parent_ids' => implode(',', $this->input->post('perm_id'))
                ]);
                foreach ($this->input->post('perm_id') as $pid){
                    $child_permissions = $this->permission_model->where('parent_status', $pid)->get_all();
                    foreach($child_permissions as $permission){
                        $this->db->insert('services_permissions', ['service_id' => $id, 'perm_id' => $permission['id']]);
                    }
                    $this->db->insert('services_permissions', ['service_id' => $id, 'perm_id' => $pid]);
                }
                
                /* $path = $_FILES['file']['name'];
                $ext = pathinfo($path, PATHINFO_EXTENSION);
                $this->file_up("file", "service", $id, '', 'no'); */
                redirect('service/r', 'refresh');
            }
        } elseif ($type == 'r') {
            $this->data['title'] = 'Service';
            $this->data['content'] = 'master/service';
            $this->data['services'] = $this->service_model->order_by('id', 'DESC')->with_permissions('fields: perm_name, perm_key')->get_all();
            $this->data['permissions'] = $this->ion_auth_acl->permissions('full', 'perm_key', [
                'parent_status' => 'parent',
                'deleted_at'=>null
            ]);
            $this->_render_page($this->template, $this->data);
            //echo json_encode($this->data);
        } elseif ($type == 'u') {
            $this->form_validation->set_rules($this->service_model->rules);
            if ($this->form_validation->run() == FALSE) {
                echo validation_errors();
            } else {
                $this->service_model->update([
                    'id' => $this->input->post('id'),
                    'name' => $this->input->post('name'),
                    'permission_parent_ids' => implode(',', $this->input->post('perm_id'))
                ], 'id');
                
                $this->db->delete('services_permissions', ['service_id' => $this->input->post('id')]);
                 foreach ($this->input->post('perm_id') as $pid){
                    $child_permissions = $this->permission_model->where('parent_status', $pid)->get_all();
                    foreach($child_permissions as $permission){
                        $this->db->insert('services_permissions', ['service_id' => $this->input->post('id'), 'perm_id' => $permission['id']]);
                    }
                    $this->db->insert('services_permissions', ['service_id' => $this->input->post('id'), 'perm_id' => $pid]);
                } 
                
                /* if ($_FILES['file']['name'] !== '') {
                    $path = $_FILES['file']['name'];
                    $ext = pathinfo($path, PATHINFO_EXTENSION);
                    $this->file_up("file", "service", $this->input->post('id'), '', 'no');
                } */
                redirect('service/r', 'refresh');
            }
        } elseif ($type == 'd') {
            $this->service_model->delete(['id' => $this->input->post('id')]);
        }elseif($type == 'edit'){
            $this->data['title'] = 'Edit Service';
            $this->data['content'] = 'master/edit';
            $this->data['type'] = 'service';
            $this->data['services'] = $this->service_model->where('id', $this->input->get('id'))->get();
            $this->data['perm_ids'] = explode(',', $this->data['services']['permission_parent_ids']);
            $this->data['permissions'] = $this->ion_auth_acl->permissions('full', 'perm_key', [
                'parent_status' => 'parent'
            ]);
            //print_array( $this->data['services']);
            $this->_render_page($this->template, $this->data);
        }
    }

    /**
     * States crud
     *
     * @author Mehar
     * @param string $type
     * @param string $target
     */
    public function state($type = 'r')
    {
        /* if (! $this->ion_auth_acl->has_permission('state'))
            redirect('admin'); */
        
        if ($type == 'c') {
            $this->form_validation->set_rules($this->state_model->rules);
            if ($this->form_validation->run() == FALSE) {
               $this->state('r');
            } else {
                $id = $this->state_model->insert([
                    'name' => $this->input->post('name'),
                ]);
                redirect('state/r', 'refresh');
            }
        } elseif ($type == 'r') {
            $this->data['title'] = 'States';
            $this->data['content'] = 'master/state';
            $this->data['states'] = $this->state_model->order_by('id', 'DESC')->get_all();
            $this->_render_page($this->template, $this->data);
            //echo json_encode($this->data);
        } elseif ($type == 'u') {
            $this->form_validation->set_rules($this->state_model->rules);
            if ($this->form_validation->run() == FALSE) {
                echo validation_errors();
            } else {
                $this->state_model->update([
                    'id' => $this->input->post('id'),
                    'name' => $this->input->post('name'),
                ], 'id','name');
                redirect('state/r', 'refresh');
            }
        } elseif ($type == 'd') {
            $this->state_model->delete(['id' => $this->input->post('id')]);
        }elseif($type == 'edit'){
            $this->data['title'] = 'Edit State';
            $this->data['content'] = 'master/edit';
            $this->data['type'] = 'state';
            $this->data['state'] = $this->state_model->order_by('id', 'DESC')->where('id', $this->input->get('id'))->get();
            $this->_render_page($this->template, $this->data);
        }
    }

    /**
     * Districts crud
     *
     * @author Mehar
     * @param string $type
     * @param string $target
     */
    public function district($type = 'r')
    {
        /* if (! $this->ion_auth_acl->has_permission('district'))
            redirect('admin'); */
        
        if ($type == 'c') {
            $this->form_validation->set_rules($this->district_model->rules);
            if ($this->form_validation->run() == FALSE) {
                $this->district('r');
            } else {
                $id = $this->district_model->insert([
                    'state_id' => $this->input->post('state_id'),
                    'name' => $this->input->post('name'),
                ]);
                redirect('district/r', 'refresh');
            }
        } elseif ($type == 'r') {
            $this->data['title'] = 'District';
            $this->data['content'] = 'master/district';
            $this->data['states'] = $this->state_model->get_all();
            $this->data['districts'] = $this->district_model->order_by('id', 'DESC')->get_all();
            $this->_render_page($this->template, $this->data);
            //echo json_encode($this->data);
        } elseif ($type == 'u') {
            $this->form_validation->set_rules($this->district_model->rules);
            if ($this->form_validation->run() == FALSE) {
                echo validation_errors();
            } else {
                $this->district_model->update([
                    'id' => $this->input->post('id'),
                    'state_id' => $this->input->post('state_id'),
                    'name' => $this->input->post('name'),
                ], 'id');
                redirect('district/r', 'refresh');
            }
        } elseif ($type == 'd') {
            $this->district_model->delete(['id' => $this->input->post('id')]);
        }elseif($type == 'edit'){
            $this->data['title'] = 'Edit District';
            $this->data['content'] = 'master/edit';
            $this->data['type'] = 'district';
            $this->data['states'] = $this->state_model->get_all();
            $this->data['district'] = $this->district_model->order_by('id', 'DESC')->where('id',$this->input->get('id'))->get();
            $this->_render_page($this->template, $this->data);
        }
    }

    /**
     * Constituency crud
     *
     * @author Mehar
     * @param string $type
     * @param string $target
     */
    public function constituency($type = 'r')
    {
        /* if (! $this->ion_auth_acl->has_permission('constituency'))
            redirect('admin'); */
        
        if ($type == 'c') {
            $this->form_validation->set_rules($this->constituency_model->rules);
            if ($this->form_validation->run() == FALSE) {
               $this->constituency('r');
            } else {
                $id = $this->constituency_model->insert([
                    'state_id' => $this->input->post('state_id'),
                    'district_id' => $this->input->post('dist_id'),
                    'name' => $this->input->post('name'),
                    'pincode' => $this->input->post('pincode')
                ]);
                redirect('constituency/r', 'refresh');
            }
        } elseif ($type == 'r') {
            $this->data['title'] = 'Constituency';
            $this->data['content'] = 'master/constituency';
            $this->data['states'] = $this->state_model->get_all();
            $this->data['districts'] = $this->district_model->get_all();
            $this->data['constituencies'] = $this->constituency_model->order_by('id', 'DESC')->get_all();
            $this->_render_page($this->template, $this->data);
            //echo json_encode($this->data);
        } elseif ($type == 'u') {
            $this->form_validation->set_rules($this->constituency_model->rules);
            if ($this->form_validation->run() == FALSE) {
                echo validation_errors();
            } else {
                $this->constituency_model->update([
                    'id' => $this->input->post('id'),
                    'state_id' => $this->input->post('state_id'),
                    'district_id' => $this->input->post('dist_id'),
                    'name' => $this->input->post('name'),
                    'pincode' => $this->input->post('pincode')
                ], 'id');
                redirect('constituency/r', 'refresh');
            }
        } elseif ($type == 'd') {
            $this->constituency_model->delete(['id' => $this->input->post('id')]);
        }elseif($type == 'edit'){
            $this->data['title'] = 'Edit Constituency';
            $this->data['content'] = 'master/edit';
            $this->data['type'] = 'constituency';
            $this->data['districts'] = $this->district_model->get_all();
            $this->data['states'] = $this->state_model->get_all();
            $this->data['constituency']= $this->constituency_model->order_by('id', 'DESC')->where('id',$this->input->get('id'))->get();
            $this->_render_page($this->template, $this->data);
        }
    }
    
    /**
     * vendors crud
     *
     * @author Mehar
     * @param string $type
     * @param string $target
     */
    public function vendors($type = 'all')
    {
        /* if (! $this->ion_auth_acl->has_permission('vendor_list'))
            redirect('admin'); */

            if ($type == 'all') {
                $this->data['title'] = 'All Vendors';
                $this->data['content'] = 'master/vendor_list';
                $this->data['type'] = 'all';
                $this->data['categories'] = $this->category_model->get_all();
                $this->data['executive'] = $this->user_model->get_all();
                $this->data['constituency'] = $this->constituency_model->get_all();
                $this->data['vendors'] = $this->vendor_list_model->order_by('id', 'DESC')->with_location('fields:id, address')->with_trashed()->get_all();
                $this->_render_page($this->template, $this->data);
            } elseif ($type == 'approved') {
                $this->data['title'] = 'Approved Vendors';
                $this->data['content'] = 'master/vendor_list';
                $this->data['type'] = 'approved';
                $this->data['categories'] = $this->category_model->get_all();
                $this->data['vendors'] = $this->vendor_list_model->order_by('id', 'DESC')->with_location('fields:id, address')->where(['status'=> 1])->get_all();
                $this->_render_page($this->template, $this->data);
            } elseif ($type == 'pending') {
                $this->data['title'] = 'Pending Vendors';
                $this->data['content'] = 'master/vendor_list';
                $this->data['type'] = 'pending';
                $this->data['categories'] = $this->category_model->get_all();
                $this->data['vendors'] = $this->vendor_list_model->order_by('id', 'DESC')->with_location('fields:id, address')->where(['status'=> 2])->get_all();
                $this->_render_page($this->template, $this->data);
            } elseif($type == 'vendor'){
                if(!empty($_GET['vendor_id'])){
                $this->data['title'] = 'Vendor Details';
                $this->data['content'] = 'master/vendor_view';
                $this->data['type'] = 'vendor_view';
                $this->data['vendor_list'] = $this->vendor_list_model
                    ->with_location('fields: id, address, latitude, longitude') 
                    ->with_category('fields: id, name')
                    ->with_constituency('fields: id, name, state_id, district_id')
                    ->with_contacts('fields: id, std_code, number, type')
                    ->with_links('fields: id,   url, type')
                    ->with_amenities('fields: id, name')
                    ->with_services('fields: id, name')
                    ->with_holidays('fields: id')
                    ->with_executive('fields:id,unique_id')
                    ->where('id', $_GET['vendor_id'])->get();

                $this->_render_page($this->template, $this->data);
            }

            }elseif ($type == 'd') {
                $this->vendor_list_model->delete(['id' => $this->input->post('id')]);
                $this->db->where('id', $this->input->post('id'));
                echo $this->db->update('vendors_list', ['status' => 0]);
            }elseif($type == 'cancelled'){
                $this->data['title'] = 'Cancelled Vendors';
                $this->data['content'] = 'master/vendor_list';
                $this->data['type'] = 'cancelled';
                $this->data['categories'] = $this->category_model->get_all();
                $this->data['vendors'] = $this->vendor_list_model->order_by('id', 'DESC')->with_location('fields:id, address')->only_trashed()->get_all();
                $this->_render_page($this->template, $this->data);
            }elseif($type == 'change_status'){
                /* if(! $this->ion_auth_acl->has_permission('vendor_approval'))
                    redirect('admin/dashboard', 'refresh'); */
                
                 /* $groups = $this->user_model->with_groups('fields: id, priority')->where('id', $this->input->post('user_id'))->get()['groups'];
                 $highest_priority = min(array_column($groups, 'priority'));
                 $group = array();
                 foreach($groups as $a){
                     if($a['priority'] == $highest_priority)
                         $group[]=$a;
                 }
                 if($group[0]['id'] == 1){
                     $approved_by = 3;
                     $status = ($this->input->post('is_checked') == 'true') ? 1 : 2;
                 }elseif ($group[0]['id'] == 2){
                     $approved_by = 2;
                     $status = 2;
                 }elseif ($group[0]['id'] == 3){
                     $approved_by = 1;
                     $status = 2;
                 } */
                     
                 $this->vendor_list_model->update([
                     'status' => ($this->input->post('is_checked') == 'true') ? 1 : 2
                 ], $this->input->post('vendor_id'));
                 $exe = $this->vendor_list_model->with_executive('fields: id, wallet')->where('id', $this->input->post('vendor_id'))->as_array()->get();
                  $this->user_model->update([
                     'id' => $exe['executive']['id'],
                      'wallet' => ($this->input->post('is_checked') == 'true') ? $exe['executive']['wallet'] + floatval($this->setting_model->where('key','pay_per_vendor')->get()['value']) : $exe['executive']['wallet']
                 ], 'id');
                 if($_POST['is_checked'] == 'true'){
                      $id = $this->wallet_transaction_model->insert([
                          'user_id' => $exe['executive']['id'],
                          'type' => 'CREDIT',
                          'cash' => floatval($this->setting_model->where('key','pay_per_vendor')->get()['value']),
                          'description' => $exe['name'],
                          'status' => 1
                      ]);
                      echo json_encode($exe);
                 }
            }elseif ($type == 'cover_update'){
                $user_id = $this->input->post('id');
                if ($_FILES['cover']['name'] !== '') {
                    move_uploaded_file($_FILES['cover']['tmp_name'], "./uploads/list_cover_image/list_cover_$user_id.jpg");
                }
                redirect('vendors/vendor?vendor_id='.$user_id);
            }
    }
    
    
    public function vendors_filter($rowno=0,$per_page=10){
        $this->data['title'] = 'All Vendors';
        $this->data['content'] = 'master/vendor_filter';
        $this->data['categories'] = $this->category_model->get_all();
        $this->data['executive'] = $this->user_model->get_all();
        $this->data['constituency'] = $this->constituency_model->get_all();
        
        // Search text
        $search_text = $exe_text =  $mobile_text = "";
        if($this->input->post('submit') != NULL ){
            $search_text = $this->input->post('q');
            $exe_text = $this->input->post('exe');
            $mobile_text = $this->input->post('mobile');
            $this->session->set_userdata(array("q"=>$search_text, 'exe' => $exe_text, 'mobile' => $mobile_text));
        }else{
            if($this->session->userdata('q') != NULL || $this->session->userdata('exe') != NULL || $this->session->userdata('mobile') != NULL){
                $search_text = $this->session->userdata('q');
                $exe_text = $this->session->userdata('exe');
                $mobile_text = $this->session->userdata('mobile');
            }
        }
        
        //print_array($search_text.', '.$exe_text.', '.$mobile_text);
        
        // Row per page
        $rowperpage = $per_page;
        
        // Row position
        if($rowno != 0){
            $rowno = ($rowno-1) * $rowperpage;
        }
        
       
        
        // All records count 
        $allcount = $this->vendor_list_model->vendor_count(NULL, NULL, NULL, NULL, $search_text, $exe_text, $mobile_text);
        
        // Get records
        $users_record = $this->vendor_list_model->get_vendors($rowperpage, $rowno, NULL, NULL, NULL, NULL,  $search_text, $exe_text, $mobile_text);
        // echo "<pre>";
        // print_r($users_record);die;
        // Pagination Configuration
        $config['full_tag_open'] = "<ul class='pagination'>";
        $config['full_tag_close'] ="</ul>";
        $config['num_tag_open'] = '<li class="page-item">';
        $config['num_tag_close'] = '</li>';
        $config['cur_tag_open'] = "<li class='page-item active'><a href='#'>";
        $config['cur_tag_close'] = "<span class='sr-only'></span></a></li>";
        $config['next_tag_open'] = '<li class="page-item">';
        $config['next_tagl_close'] = "</li>";
        $config['prev_tag_open'] = '<li class="page-item">';
        $config['prev_tagl_close'] = "</li>";
        $config['first_tag_open'] = '<li class="page-item">';
        $config['first_tagl_close'] = "</li>";
        $config['last_tag_open'] = '<li class="page-item">';
        $config['last_tagl_close'] = "</li>";
        $config['base_url'] = base_url().'admin/master/vendors_filter';
        $config['use_page_numbers'] = TRUE;
        $config['total_rows'] = $allcount;
        $config['per_page'] = $rowperpage;
        
        // Initialize
        $this->pagination->initialize($config);
        
        $this->data['pagination'] = $this->pagination->create_links();
        $this->data['vendors'] = $users_record;
        $this->data['row'] = $rowno;
        $this->data['per_page'] = $rowperpage;
        $this->data['q'] = $search_text;
        $this->data['exe'] = $exe_text;
        $this->data['mobile'] = $mobile_text;
        $this->_render_page($this->template, $this->data);
    }
    
        

}

