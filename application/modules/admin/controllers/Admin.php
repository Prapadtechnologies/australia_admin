<?php
(defined('BASEPATH')) or exit('No direct script access allowed');

/**
 *
 * @author Mehar
 *         Admin module
 */
class Admin extends MY_Controller
{

    function __construct()
    {
        parent::__construct();
        $this->template = 'template/admin/main';
        if (! $this->ion_auth->logged_in()) // || ! $this->ion_auth->is_admin()
            redirect('auth/login');

        
        $this->load->model('group_model');
        $this->load->model('user_model');
        $this->load->model('permission_model');
        $this->load->model('group_permission_model');
        $this->load->model('setting_model');
        $this->load->model('sliders_model');
        $this->load->model('advertisements_model');
    }

    public function index()
    {
        redirect('admin/dashboard');
    }

    /**
     * Employee Management
     *
     * @author Mehar
     * @param string $type
     */
    public function employee($type = 'r')
    {
        /* if (! $this->ion_auth_acl->has_permission('emp'))
            redirect('admin'); */

        if ($type == 'c') {
            $this->form_validation->set_rules($this->user_model->rules['creation']);
            if ($this->form_validation->run() == false) {
                $this->employee('r');
            }else{
                $email = strtolower($this->input->post('email'));
                $identity = ($this->config->item('identity', 'ion_auth') === 'email') ? $email : $this->input->post('identity');
                $password = $this->input->post('password');
                $additional_data = array(
                    'first_name' => $this->input->post('first_name'),
                    'last_name' => $this->input->post('last_name'),
                    'phone' => $this->input->post('phone'),
                    'active' => 1
                );
                $role_ids = $this->input->post('role');
                $groups = [];
                foreach ($role_ids as $id) {
                    array_push($groups, $this->group_model->where('id', $id)->get());
                }
                foreach ($groups as $group) {
                    if (min(array_column($groups, 'priority')) == $group['priority']) {
                        $additional_data['unique_id'] = generate_serial_no($group['code'], 4, $group['last_id']);
                        $this->group_model->update([
                            'last_id' => $group['last_id'] + 1
                        ], $group['id']);
                    }
                }
                $this->ion_auth->register($identity, $password, $email, $additional_data, $role_ids);
                redirect("employee/r", 'refresh');
            } 
        } elseif ($type == 'r') {
            $this->data['title'] = 'Category';
            $this->data['content'] = 'emp/employee';
            $this->data['users'] = $this->user_model->order_by('id', 'DESC')->with_groups('fields:name,id', 'where: name != \'vendor\' AND name != \'user\'')->get_all();
            $this->data['groups'] = $this->group_model->order_by('id', 'DESC')->get_all();
            $this->_render_page($this->template, $this->data);
        } elseif ($type == 'u') {
            $this->form_validation->set_rules($this->user_model->rules['update']);
            if ($this->form_validation->run() == FALSE) {
                echo validation_errors();
            } else {
                $this->user_model->update([
                    'first_name' => $this->input->post('first_name'),
                    'last_name' => $this->input->post('last_name'),
                    'email' => $this->input->post('email'),
                    'phone' => $this->input->post('phone')
                ], $this->input->post('id'));
                // Update the groups user belongs to
                $groupData = $this->input->post('role');
                if (isset($groupData) && ! empty($groupData)) {
                    $this->ion_auth->remove_from_group('', $this->input->post('id'));
                    foreach ($groupData as $grp) {
                        $this->ion_auth->add_to_group($grp, $this->input->post('id'));
                    }
                }
                redirect("employee/r", 'refresh');
            }
        } elseif ($type == 'd') {
            $this->user_model->update([
                'active' => 0
            ], $this->input->post('id'));
            echo $this->user_model->delete([
                'id' => $this->input->post('id')
            ]);
        } elseif ($type == 'edit') {
            $this->data['title'] = 'employee';
            $this->data['content'] = 'emp/edit';
            $this->data['type'] = 'user';
            $this->data['users'] = $this->user_model->with_groups('fields: name, id')
                ->where('id', $this->input->get('id'))
                ->get();
            $this->data['groups'] = $this->group_model->get_all();
            $this->_render_page($this->template, $this->data);
        }
    }

    /**
     * Role Management
     *
     * @author Mehar
     * @param string $type
     */
    public function role($type = 'r')
    {
        /* if (! $this->ion_auth_acl->has_permission('role'))
            redirect('admin'); */

        if ($type == 'c') {
            $this->form_validation->set_rules($this->group_model->rules);
            if ($this->form_validation->run() == true) {
                $group_id = $this->group_model->insert([
                    'name' => $this->input->post('name'),
                    'code' => $this->input->post('prefix'),
                    'priority' => $this->input->post('priority'),
                    'description' => $this->input->post('desc'),
                    'terms' => $this->input->post('terms'),
                    'privacy' => $this->input->post('privacy')
                ]);
                if ($group_id > 0) {
                    foreach ($this->input->post() as $k => $v) {
                        if (substr($k, 0, 5) == 'perm_') {
                            $permission_id = str_replace("perm_", "", $k);
                            if ($v == "X")
                                $this->ion_auth_acl->remove_permission_from_group($group_id, $permission_id);
                            else
                                $this->ion_auth_acl->add_permission_to_group($group_id, $permission_id, $v);
                        }
                    }
                    redirect("role/r", 'refresh');
                } else {
                    echo 'internal server error';
                }
            } else {
                echo validation_errors();
            }
        } elseif ($type == 'r') {
            $this->data['title'] = 'Category';
            $this->data['content'] = 'emp/role';
            $this->data['groups'] = $this->group_model->order_by('id', 'DESC')->with_permissions('fields: perm_name, perm_key')->get_all();
            $this->data['permissions'] = $this->ion_auth_acl->permissions('full', 'perm_key', [
                //'parent_status' => 'parent'
            ]);
            $this->_render_page($this->template, $this->data);
        } elseif ($type == 'u') {
            $this->group_model->update([
                'name' => $this->input->post('name'),
                'code' => $this->input->post('prefix'),
                'priority' => $this->input->post('priority'),
                'description' => $this->input->post('desc'),
                'terms' => $this->input->post('terms'),
                'privacy' => $this->input->post('privacy')
            ], $this->input->post('id'));
            foreach ($this->input->post() as $k => $v) {
                if (substr($k, 0, 5) == 'perm_') {
                    $permission_id = str_replace("perm_", "", $k);
                    if ($v == "X")
                        $this->ion_auth_acl->remove_permission_from_group($this->input->post('id'), $permission_id);
                    else
                        $this->ion_auth_acl->add_permission_to_group($this->input->post('id'), $permission_id, $v);
                }
            }
            redirect("role/r", 'refresh');
        } elseif ($type == 'd') {
            echo $this->group_model->delete([
                'id' => $this->input->post('id')
            ]);
        } elseif ($type == 'edit') {
            $this->data['title'] = 'employee';
            $this->data['content'] = 'emp/edit';
            $this->data['type'] = 'role';
            $this->data['group'] = $this->group_model->order_by('id', 'DESC')->with_permissions('fields: perm_key, id')
                ->where('id', $this->input->get('id'))
                ->get();
            $this->data['permissions'] = $this->ion_auth_acl->permissions('full', 'perm_key', [
                //'parent_status' => 'parent'
            ]);
            $this->data['group_permissions'] = $this->ion_auth_acl->get_group_permissions($this->input->get('id'));
            $this->_render_page($this->template, $this->data);
        }
    }
    
    /**
     * settings Management
     *
     * @author Mehar
     * @param string $type
     */
    public function settings($type = 'r')
    {
        /* if (! $this->ion_auth_acl->has_permission('settings'))
            redirect('admin'); */
        //$this->load->model('vendor_settings_model');
        if ($type == 'r') {
            $this->data['title'] = 'Settings';
            $this->data['content'] = 'admin/admin/settings';
            $this->data['settings'] = $this->setting_model->where('id', $this->input->get('id'))->get();
            $this->_render_page($this->template, $this->data);
        } elseif ($type == 'site') {
             $this->form_validation->set_rules($this->setting_model->rules['site']);
            if ($this->form_validation->run() == FALSE) {
                $this->settings();
            } else { 
                $this->setting_model->update([
                    'key' => 'system_name',
                    'value' => $this->input->post('system_name'),
                ],'key');
                $this->setting_model->update([
                    'key' => 'system_title',
                    'value' => $this->input->post('system_title'),
                ],'key');
                $this->setting_model->update([
                    'key' => 'mobile',
                    'value' => $this->input->post('mobile'),
                ],'key');
                $this->setting_model->update([
                    'key' => 'address',
                    'value' => $this->input->post('address'),
                ],'key');
                $this->setting_model->update([
                    'key' => 'facebook',
                    'value' => $this->input->post('facebook'),
                ],'key');
                $this->setting_model->update([
                    'key' => 'twiter',
                    'value' => $this->input->post('twiter'),
                ],'key');
                $this->setting_model->update([
                    'key' => 'youtube',
                    'value' => $this->input->post('youtube'),
                ],'key');
                $this->setting_model->update([
                   'key' => 'skype', 
                   'value' => $this->input->post('skype'),
                ],'key');
                $this->setting_model->update([
                    'key' => 'pinterest',
                    'value' => $this->input->post('pinterest'),
                ],'key');
                redirect('settings/r', 'refresh');
             } 
        } elseif ($type == 'sms'){
            $this->form_validation->set_rules($this->setting_model->rules['sms']);
            if ($this->form_validation->run() == FALSE) {
                $this->settings();
            } else {
                $this->setting_model->update([
                    'key' => 'sms_username',
                    'value' => $this->input->post('sms_username'),
                ],'key');
                $this->setting_model->update([
                    'key' => 'sms_sender',
                    'value' => $this->input->post('sms_sender'),
                ],'key');
                $this->setting_model->update([
                    'key' => 'sms_hash',
                    'value' => $this->input->post('sms_hash'),
                ],'key');
                redirect('settings/r', 'refresh');
            }
        } elseif ($type == 'smtp') {
            $this->form_validation->set_rules($this->setting_model->rules['smtp']);
            if ($this->form_validation->run() == FALSE) {
                $this->settings();
            } else {
                $this->setting_model->update([
                    'key' => 'smtp_port',
                    'value' => $this->input->post('smtp_port'),
                ],'key');
                $this->setting_model->update([
                    'key' => 'smtp_host',
                    'value' => $this->input->post('smtp_host'),
                ],'key');
                $this->setting_model->update([
                    'key' => 'smtp_username',
                    'value' => $this->input->post('smtp_username'),
                ],'key');
                $this->setting_model->update([
                    'key' => 'smtp_password',
                    'value' => $this->input->post('smtp_password'),
                ],'key');
                redirect('settings/r', 'refresh');
            }
        }elseif ($type == 'payment'){
            $this->setting_model->update([
                'key' => 'pay_per_referal',
                'value' => $this->input->post('pay_per_referal'),
            ],'key');
            $this->setting_model->update([
                'key' => 'commission_on_withdraw',
                'value' => $this->input->post('commission_on_withdraw'),
            ],'key');
            $this->setting_model->update([
                'key' => 'withdraw_days',
                'value' => $this->input->post('withdraw_days'),
            ],'key');
            $this->setting_model->update([
                'key' => 'min_withdraw',
                'value' => $this->input->post('min_withdraw'),
            ],'key');
            $this->setting_model->update([
                'key' => 'home_page',
                'value' => $this->input->post('home_page'),
            ],'key');
            redirect('settings/r', 'refresh');
        }
    }
    /**
     * Sliders Management
     *
     * @author Mahesh
     * @param string $type
     */
    public function sliders($type = 'r')
    {
        /* if (! $this->ion_auth_acl->has_permission('settings'))
            redirect('admin'); */
        
        if ($type == 'r') {
            $this->data['title'] = 'Slides';
            $this->data['content'] = 'admin/admin/sliders';
            $this->data['sliders'] = $this->sliders_model->get_all();
            $this->data['top'] = $this->advertisements_model->where('type','top')->get_all();
            $this->data['middle'] = $this->advertisements_model->where('type','middle')->get_all();
            $this->data['bottom'] = $this->advertisements_model->where('type','bottom')->get_all();
            $this->data['last'] = $this->advertisements_model->where('type','last')->get_all();
            $this->_render_page($this->template, $this->data);
        } elseif ($type == 'slide') {
            if ($_FILES['slide']['name'] !== '') {
                    $path = $_FILES['slide']['name'];
                    $ext = pathinfo($path, PATHINFO_EXTENSION);
            $slider_id = $this->sliders_model->insert([
                    'image' => $path,
                    'ext' => $ext
                ]);
            $this->file_up("slide", "sliders", $slider_id, '', 'no', '.' . $ext);
            }
            redirect('sliders/r', 'refresh');
        } elseif ($type == 'd') {
                $this->sliders_model->delete(['id' => $this->input->post('id')]);
        }
            
    }
    public function cat_ban_delete($type = 'd'){
        if ($type == 'd') {
            $this->cat_banners_model->delete(['id' => $this->input->post('id')]);
        }
    }
   
    public function update_cat_bottom_banners()
    {
        $cat_id = $this->input->post('cat_id');
        if ($_FILES['cat_bottom_banners']['name'] !== '') {
            move_uploaded_file($_FILES['cat_bottom_banners']['tmp_name'], "./uploads/cat_bottom_banners_image/cat_bottom_banners_$cat_id.jpg");
        }
        redirect('sliders/r','refresh');
    }
    
    public function category_banner($type = 'r'){
        if ($type == 'r') {
            $this->data['title'] = 'Slides';
            $this->data['content'] = 'admin/admin/cat_banners';
            $this->data['categories'] = $this->category_model->get_all();
            $this->data['sliders'] = $this->sliders_model->get_all();
            $this->data['cat_banner'] = $this->cat_banners_model->get_all();
            $this->_render_page($this->template, $this->data);
        }elseif ($type == 'cat_banners'){
            if ($_FILES['cat_banners']['name'] !== '') {
                $path = $_FILES['cat_banners']['name'];
                $ext = pathinfo($path, PATHINFO_EXTENSION);
                $cat_id =  $this->input->post('cat_id');
                $catb_id = $this->cat_banners_model->insert([
                    'image' => $path,
                    'ext' => $ext,
                    'cat_id'=>$cat_id
                ]);
                //$this->file_up("cat_banners", "cat_banners", $catb_id, '', 'no', '.jpg');
                move_uploaded_file($_FILES['cat_banners']['tmp_name'], 'uploads/' . 'cat_banners' . '_image/' . 'cat_banners' . '_' . $cat_id .'_'.$catb_id.'.jpg');
            }
        redirect('category_banner/r', 'refresh');
        } elseif ($type == 'u'){
            if ($_FILES['file']['name'] !== '') {
                $path = $_FILES['file']['name'];
                $ext = pathinfo($path, PATHINFO_EXTENSION);
                $cat_id =  $this->input->post('cat_id');
                $this->cat_banners_model->update([
                    'id'=> $this->input->post('banner_id'),
                    'image' => $path,
                    'ext' => $ext,
                    'cat_id'=> $this->input->post('cat_id')
                ]);
                unlink('uploads/' . 'cat_banners' . '_image/' . 'cat_banners' . '_' . $this->input->post('cat_id') .'_'.$this->input->post('banner_id').'.jpg');
                move_uploaded_file($_FILES['file']['tmp_name'], 'uploads/' . 'cat_banners' . '_image/' . 'cat_banners' . '_' . $this->input->post('cat_id') .'_'.$this->input->post('banner_id').'.jpg');
                //$this->file_up("cat_banners", "cat_banners", $catb_id, '', 'no', '.jpg');
            }
            redirect('category_banner/r', 'refresh');
        }elseif ($type == 'd') {
            $this->cat_banners_model->delete(['id' => $this->input->post('id')]);
        }elseif($type == 'edit'){
            $this->data['title'] = 'Edit Category Banner';
            $this->data['content'] = 'admin/admin/edit';
            $this->data['type'] = 'category_banner';
            $this->data['category'] = $this->cat_banners_model->where('id',$this->input->get('id'))->get();
            $this->data['i'] = $this->cat_banners_model->where('file',$this->input->get('file'))->get();
            $this->data['categories'] = $this->cat_banners_model->where('id', $this->input->get('id'))
            ->get();
            $this->_render_page($this->template, $this->data);
        }
    }
    /**
     * Advertisements Management
     *
     * @author Mahesh
     * @param string $type
     */
    public function advertisements($type = 'r')
    {
        /* if (! $this->ion_auth_acl->has_permission('settings'))
            redirect('admin'); */
        
        if ($type == 'adver') {
            if ($_FILES['advertisement']['name'] !== '') {
                if ($_FILES['file']['name'] !== '') {   
                        $path = $_FILES['file']['name'];
                        $ext = pathinfo($path, PATHINFO_EXTENSION);
                        $this->file_up("file", "food_menu", $this->input->post('id'), '', 'no');
                    }
                    $path = $_FILES['advertisement']['name'];
                    $ext = pathinfo($path, PATHINFO_EXTENSION);
                    $slider_id = $this->advertisements_model->insert([
                    'type' => $this->input->post('type'),
                    'image' => $path,
                    'ext' => $ext
                ]);
                $this->file_up("advertisement", "advertisements", $slider_id, '', 'no', '.' . $ext);
            }
            redirect('sliders/r', 'refresh');
        } elseif ($type == 'd') {
                $this->advertisements_model->delete(['id' => $this->input->post('id')]);
            }
    }


   /**
     * Logo & fave Favicon
     *
     * @author Mahesh
     * @param string $type
     */
   public function site_logo($type)
   {
       if($type == 'logo'){
            if ($_FILES['file']['name'] !== '') {
                move_uploaded_file($_FILES["file"]["tmp_name"], "assets/img/logo.png");
            }
       }
       if($type == 'favicon'){
            if ($_FILES['file']['name'] !== '') {
                move_uploaded_file($_FILES["file"]["tmp_name"], "assets/img/favicon.png");
            }
       }
       redirect('settings/r');
   }
    /**
     * Profile Management
     *
     * @author Mehar
     * @param string $type
     */
    public function profile($type = 'r')
    {
        if ($type == 'u') {
            $this->form_validation->set_rules($this->user_model->rules['profile']);
            if ($this->form_validation->run() == FALSE) {
                $this->profile();
            } else {
                $this->user_model->update([
                    'first_name' => $this->input->post('fname'),
                    'last_name' => $this->input->post('lname'),
                    'email' => $this->input->post('email'),
                    'phone' => $this->input->post('phone')
                ], $this->session->userdata('user_id'));
                redirect('profile/r', 'refresh');
            }
        } elseif ($type == 'reset') {
            $this->form_validation->set_rules($this->user_model->rules['reset']);
            if (! $this->ion_auth->logged_in()) {
                redirect('auth/login', 'refresh');
            }

            if ($this->form_validation->run() == false) {
                $this->profile();
            } else {
                $identity = $this->session->userdata('identity');
                $change = $this->ion_auth->change_password($identity, $this->input->post('opass'), $this->input->post('npass'));
                if ($change) {
                    $this->prepare_flashmessage($this->ion_auth->messages(), 2);
                    redirect('auth/logout', 'refresh');
                } else {
                    $this->prepare_flashmessage($this->ion_auth->errors(), 1);
                    redirect('profile/r', 'refresh');
                }
            }
        } elseif ($type == 'r') {
            $this->data['title'] = 'Profile';
            $this->data['content'] = 'admin/admin/profile';
            $this->data['user'] = $this->ion_auth->user()->row();
            $this->_render_page($this->template, $this->data);
        }
    }
    
    public function emp_list($type = 'executive'){
        if($type == 'users'){
            $this->data['title'] = 'Users';
                $this->data['content'] = 'emp/emp_list';
                $this->data['type'] = 'users';
                $this->data['executives'] = $this->user_model->order_by('id', 'DESC')->fields('id, first_name, last_name, email,wallet, unique_id')->with_groups('fields: id, name', 'where: name = \'user\'')->get_all();
                $this->_render_page($this->template, $this->data);
        }
    }

    public function manage()
    {
        $this->load->view('manage');
    }

    public function permissions()
    {
        $data['permissions'] = $this->ion_auth_acl->permissions('full');

        $this->load->view('permissions', $data);
    }

    public function add_permission()
    {
        if ($this->input->post() && $this->input->post('cancel'))
            redirect('admin/permissions', 'refresh');

        $this->form_validation->set_rules('perm_key', 'key', 'required|trim');
        $this->form_validation->set_rules('perm_name', 'name', 'required|trim');
        $this->form_validation->set_rules('desc', 'Description', 'trim');
        $this->form_validation->set_rules('parent_status', 'Parent Status', 'trim');
        $this->form_validation->set_message('required', 'Please enter a %s');

        if ($this->form_validation->run() === FALSE) {
            $data['message'] = ($this->ion_auth_acl->errors() ? $this->ion_auth_acl->errors() : $this->session->flashdata('message'));
            $data['permissions'] = $this->permission_model->where('parent_status', 'parent')->get_all();

            $this->load->view('add_permission', $data);
        } else {
            $parent_status = $this->input->post('parent_status');
            if ($this->input->post('parent_status') == null) {
                $parent_status = 'parent';
            }
            $new_permission_id = $this->ion_auth_acl->create_permission($this->input->post('perm_key'), $this->input->post('perm_name'), $parent_status, $this->input->post('desc'));
            if ($new_permission_id) {
                // check to see if we are creating the permission
                // redirect them back to the admin page
                $this->session->set_flashdata('message', $this->ion_auth->messages());
                redirect("admin/permissions", 'refresh');
            }
        }
    }

    public function update_permission()
    {
        if ($this->input->post() && $this->input->post('cancel'))
            redirect('admin/permissions', 'refresh');

        $permission_id = $this->uri->segment(3);

        if (! $permission_id) {
            $this->session->set_flashdata('message', "No permission ID passed");
            redirect("admin/permissions", 'refresh');
        }

        $permission = $this->ion_auth_acl->permission($permission_id);

        $this->form_validation->set_rules('perm_key', 'key', 'required|trim');
        $this->form_validation->set_rules('perm_name', 'name', 'required|trim');

        $this->form_validation->set_message('required', 'Please enter a %s');

        if ($this->form_validation->run() === FALSE) {
            $data['message'] = ($this->ion_auth_acl->errors() ? $this->ion_auth_acl->errors() : $this->session->flashdata('message'));
            $data['permission'] = $permission;

            $this->load->view('edit_permission', $data);
        } else {
            $additional_data = array(
                'perm_name' => $this->input->post('perm_name')
            );

            $update_permission = $this->ion_auth_acl->update_permission($permission_id, $this->input->post('perm_key'), $additional_data);
            if ($update_permission) {
                // check to see if we are creating the permission
                // redirect them back to the admin page
                $this->session->set_flashdata('message', $this->ion_auth->messages());
                redirect("admin/permissions", 'refresh');
            }
        }
    }

    public function delete_permission()
    {
        if ($this->input->post() && $this->input->post('cancel'))
            redirect('admin/permissions', 'refresh');

        $permission_id = $this->uri->segment(3);

        if (! $permission_id) {
            $this->session->set_flashdata('message', "No permission ID passed");
            redirect("admin/permissions", 'refresh');
        }

        if ($this->input->post() && $this->input->post('delete')) {
            if ($this->ion_auth_acl->remove_permission($permission_id)) {
                $this->session->set_flashdata('message', $this->ion_auth->messages());
                redirect("admin/permissions", 'refresh');
            } else {
                echo $this->ion_auth_acl->messages();
            }
        } else {
            $data['message'] = ($this->ion_auth_acl->errors() ? $this->ion_auth_acl->errors() : $this->session->flashdata('message'));

            $this->load->view('delete_permission', $data);
        }
    }

    public function groups()
    {
        $data['groups'] = $this->ion_auth->groups()->result();

        $this->load->view('groups', $data);
    }

    public function group_permissions()
    {
        if ($this->input->post() && $this->input->post('cancel'))
            redirect('admin/groups', 'refresh');

        $group_id = $this->uri->segment(3);

        if (! $group_id) {
            $this->session->set_flashdata('message', "No group ID passed");
            redirect("admin/groups", 'refresh');
        }

        if ($this->input->post() && $this->input->post('save')) {
            foreach ($this->input->post() as $k => $v) {
                if (substr($k, 0, 5) == 'perm_') {
                    $permission_id = str_replace("perm_", "", $k);

                    if ($v == "X")
                        $this->ion_auth_acl->remove_permission_from_group($group_id, $permission_id);
                    else
                        $this->ion_auth_acl->add_permission_to_group($group_id, $permission_id, $v);
                }
            }

            redirect('admin/groups', 'refresh');
        }

        $data['permissions'] = $this->ion_auth_acl->permissions('full', 'perm_key');
        $data['group_permissions'] = $this->ion_auth_acl->get_group_permissions($group_id);

        $this->load->view('group_permissions', $data);
    }

    public function users()
    {
        $data['users'] = $this->ion_auth->users()->result();

        $this->load->view('users', $data);
    }

    public function manage_user()
    {
        $user_id = $this->uri->segment(3);

        if (! $user_id) {
            $this->session->set_flashdata('message', "No user ID passed");
            redirect("admin/users", 'refresh');
        }

        $data['user'] = $this->ion_auth->user($user_id)->row();
        $data['user_groups'] = $this->ion_auth->get_users_groups($user_id)->result();
        $data['user_acl'] = $this->ion_auth_acl->build_acl($user_id);

        $this->load->view('manage_user', $data);
    }

    public function user_permissions()
    {
        $user_id = $this->uri->segment(3);

        if (! $user_id) {
            $this->session->set_flashdata('message', "No user ID passed");
            redirect("admin/users", 'refresh');
        }

        if ($this->input->post() && $this->input->post('cancel'))
            redirect("admin/manage-user/{$user_id}", 'refresh');

        if ($this->input->post() && $this->input->post('save')) {
            foreach ($this->input->post() as $k => $v) {
                if (substr($k, 0, 5) == 'perm_') {
                    $permission_id = str_replace("perm_", "", $k);

                    if ($v == "X")
                        $this->ion_auth_acl->remove_permission_from_user($user_id, $permission_id);
                    else
                        $this->ion_auth_acl->add_permission_to_user($user_id, $permission_id, $v);
                }
            }

            redirect("admin/manage-user/{$user_id}", 'refresh');
        }

        $user_groups = $this->ion_auth_acl->get_user_groups($user_id);

        $data['user_id'] = $user_id;
        $data['permissions'] = $this->ion_auth_acl->permissions('full', 'perm_key');
        $data['group_permissions'] = $this->ion_auth_acl->get_group_permissions($user_groups);
        $data['users_permissions'] = $this->ion_auth_acl->build_acl($user_id);

        $this->load->view('user_permissions', $data);
    }
    
    /**
     * user_services crud
     *
     * @author Trupti
     * @param string $type
     * @param string $target
     */
    public function user_services($type = 'r')
    {
        /*if (! $this->ion_auth_acl->has_permission('state'))
            redirect('admin');*/
            
            if ($type == 'c') {
                $this->form_validation->set_rules($this->user_service_model->rules);
                if ($this->form_validation->run() == FALSE) {
                    $this->state('r');
                } else {
                    $id = $this->user_service_model->insert([
                        'vendor_id' => $this->input->post('vendor_id'),
                        'name' => $this->input->post('name'),
                    ]);
                    redirect('user_services/r', 'refresh');
                }
            } elseif ($type == 'r') {
                $this->data['title'] = 'Services';
                $this->data['content'] = 'admin/admin/services';
                $this->data['services'] = $this->user_service_model->order_by('id', 'DESC')->get_all();
                $this->_render_page($this->template, $this->data);
                //echo json_encode($this->data);
            } elseif ($type == 'u') {
                $this->form_validation->set_rules($this->user_service_model->rules);
                if ($this->form_validation->run() == FALSE) {
                    echo validation_errors();
                } else {
                    $this->user_service_model->update([
                        'id' => $this->input->post('id'),
                        'name' => $this->input->post('name'),
                    ], 'id','name');
                    redirect('user_services/r', 'refresh');
                }
            } elseif ($type == 'd') {
                $this->user_service_model->delete(['id' => $this->input->post('id')]);
            }elseif($type == 'edit'){
                $this->data['title'] = 'Edit State';
                $this->data['content'] = 'admin/admin/edit';
                $this->data['type'] = 'user_services';
                $this->data['services'] = $this->user_service_model->order_by('id', 'DESC')->where('id', $this->input->get('id'))->get();
                $this->_render_page($this->template, $this->data);
            }
    }


    function popup($page_name = '' , $param2 = '' , $param3 = '')
    {
        
        $account_type               =   $this->session->userdata('login_type');
        $page_data['param2']        =   $param2;
        $page_data['param3']        =   $param3;
        $this->load->view( 'backend/main/'.$page_name.'.php' ,$page_data);
        
        echo '<script src="assets/js/neon-custom-ajax.js"></script>';
                echo '<script>$(".html5editor").wysihtml5();</script>';
    }
    public function my_test($value='')
    {
        echo "string";
    }
    
}