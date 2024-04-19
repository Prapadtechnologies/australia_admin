<?php
defined('BASEPATH') or exit('No direct script access allowed');
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
        if (!$this->ion_auth->logged_in()) {
            // || ! $this->ion_auth->is_admin()
            redirect('auth/login');
        }
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
            } else {
                $email = strtolower($this->input->post('email'));
                $identity = $this->config->item('identity', 'ion_auth') === 'email' ? $email : $this->input->post('identity');
                $password = $this->input->post('password');
                $additional_data = [
                    'first_name' => $this->input->post('first_name'),
                    'last_name' => $this->input->post('last_name'),
                    'phone' => $this->input->post('phone'),
                    'active' => 1,
                ];
                $role_ids = $this->input->post('role');
                $groups = [];
                foreach ($role_ids as $id) {
                    array_push($groups, $this->group_model->where('id', $id)->get());
                }
                foreach ($groups as $group) {
                    if (min(array_column($groups, 'priority')) == $group['priority']) {
                        $additional_data['unique_id'] = generate_serial_no($group['code'], 4, $group['last_id']);
                        $this->group_model->update(
                            [
                                'last_id' => $group['last_id'] + 1,
                            ],
                            $group['id']
                        );
                    }
                }
                $this->ion_auth->register($identity, $password, $email, $additional_data, $role_ids);
                redirect("employee/r", 'refresh');
            }
        } elseif ($type == 'r') {
            $this->data['title'] = 'Category';
            $this->data['content'] = 'emp/employee';
            $this->data['users'] = $this->user_model
                ->order_by('id', 'DESC')
                ->with_groups('fields:name,id', 'where: name != \'vendor\' AND name != \'user\'')
                ->get_all();
            $this->data['groups'] = $this->group_model->order_by('id', 'DESC')->get_all();
            $this->_render_page($this->template, $this->data);
        } elseif ($type == 'u') {
            $this->form_validation->set_rules($this->user_model->rules['update']);
            if ($this->form_validation->run() == false) {
                echo validation_errors();
            } else {
                $this->user_model->update(
                    [
                        'first_name' => $this->input->post('first_name'),
                        'last_name' => $this->input->post('last_name'),
                        'email' => $this->input->post('email'),
                        'phone' => $this->input->post('phone'),
                    ],
                    $this->input->post('id')
                );
                // Update the groups user belongs to
                $groupData = $this->input->post('role');
                if (isset($groupData) && !empty($groupData)) {
                    $this->ion_auth->remove_from_group('', $this->input->post('id'));
                    foreach ($groupData as $grp) {
                        $this->ion_auth->add_to_group($grp, $this->input->post('id'));
                    }
                }
                redirect("employee/r", 'refresh');
            }
        } elseif ($type == 'd') {
            $this->user_model->update(
                [
                    'active' => 0,
                ],
                $this->input->post('id')
            );
            echo $this->user_model->delete([
                'id' => $this->input->post('id'),
            ]);
        } elseif ($type == 'edit') {
            $this->data['title'] = 'employee';
            $this->data['content'] = 'emp/edit';
            $this->data['type'] = 'user';
            $this->data['users'] = $this->user_model
                ->with_groups('fields: name, id')
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
                    'privacy' => $this->input->post('privacy'),
                ]);
                if ($group_id > 0) {
                    foreach ($this->input->post() as $k => $v) {
                        if (substr($k, 0, 5) == 'perm_') {
                            $permission_id = str_replace("perm_", "", $k);
                            if ($v == "X") {
                                $this->ion_auth_acl->remove_permission_from_group($group_id, $permission_id);
                            } else {
                                $this->ion_auth_acl->add_permission_to_group($group_id, $permission_id, $v);
                            }
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
            $this->data['groups'] = $this->group_model
                ->order_by('id', 'DESC')
                ->with_permissions('fields: perm_name, perm_key')
                ->get_all();
            $this->data['permissions'] = $this->ion_auth_acl->permissions('full', 'perm_key', [
                //'parent_status' => 'parent'
            ]);
            $this->_render_page($this->template, $this->data);
        } elseif ($type == 'u') {
            $this->group_model->update(
                [
                    'name' => $this->input->post('name'),
                    'code' => $this->input->post('prefix'),
                    'priority' => $this->input->post('priority'),
                    'description' => $this->input->post('desc'),
                    'terms' => $this->input->post('terms'),
                    'privacy' => $this->input->post('privacy'),
                ],
                $this->input->post('id')
            );
            foreach ($this->input->post() as $k => $v) {
                if (substr($k, 0, 5) == 'perm_') {
                    $permission_id = str_replace("perm_", "", $k);
                    if ($v == "X") {
                        $this->ion_auth_acl->remove_permission_from_group($this->input->post('id'), $permission_id);
                    } else {
                        $this->ion_auth_acl->add_permission_to_group($this->input->post('id'), $permission_id, $v);
                    }
                }
            }
            redirect("role/r", 'refresh');
        } elseif ($type == 'd') {
            echo $this->group_model->delete([
                'id' => $this->input->post('id'),
            ]);
        } elseif ($type == 'edit') {
            $this->data['title'] = 'employee';
            $this->data['content'] = 'emp/edit';
            $this->data['type'] = 'role';
            $this->data['group'] = $this->group_model
                ->order_by('id', 'DESC')
                ->with_permissions('fields: perm_key, id')
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
            if ($this->form_validation->run() == false) {
                $this->settings();
            } else {
                $this->setting_model->update(
                    [
                        'key' => 'system_name',
                        'value' => $this->input->post('system_name'),
                    ],
                    'key'
                );
                $this->setting_model->update(
                    [
                        'key' => 'system_title',
                        'value' => $this->input->post('system_title'),
                    ],
                    'key'
                );
                $this->setting_model->update(
                    [
                        'key' => 'mobile',
                        'value' => $this->input->post('mobile'),
                    ],
                    'key'
                );
                $this->setting_model->update(
                    [
                        'key' => 'address',
                        'value' => $this->input->post('address'),
                    ],
                    'key'
                );
                $this->setting_model->update(
                    [
                        'key' => 'facebook',
                        'value' => $this->input->post('facebook'),
                    ],
                    'key'
                );
                $this->setting_model->update(
                    [
                        'key' => 'twiter',
                        'value' => $this->input->post('twiter'),
                    ],
                    'key'
                );
                $this->setting_model->update(
                    [
                        'key' => 'youtube',
                        'value' => $this->input->post('youtube'),
                    ],
                    'key'
                );
                $this->setting_model->update(
                    [
                        'key' => 'skype',
                        'value' => $this->input->post('skype'),
                    ],
                    'key'
                );
                $this->setting_model->update(
                    [
                        'key' => 'pinterest',
                        'value' => $this->input->post('pinterest'),
                    ],
                    'key'
                );
                redirect('settings/r', 'refresh');
            }
        } elseif ($type == 'sms') {
            $this->form_validation->set_rules($this->setting_model->rules['sms']);
            if ($this->form_validation->run() == false) {
                $this->settings();
            } else {
                $this->setting_model->update(
                    [
                        'key' => 'sms_username',
                        'value' => $this->input->post('sms_username'),
                    ],
                    'key'
                );
                $this->setting_model->update(
                    [
                        'key' => 'sms_sender',
                        'value' => $this->input->post('sms_sender'),
                    ],
                    'key'
                );
                $this->setting_model->update(
                    [
                        'key' => 'sms_hash',
                        'value' => $this->input->post('sms_hash'),
                    ],
                    'key'
                );
                redirect('settings/r', 'refresh');
            }
        } elseif ($type == 'smtp') {
            $this->form_validation->set_rules($this->setting_model->rules['smtp']);
            if ($this->form_validation->run() == false) {
                $this->settings();
            } else {
                $this->setting_model->update(
                    [
                        'key' => 'smtp_port',
                        'value' => $this->input->post('smtp_port'),
                    ],
                    'key'
                );
                $this->setting_model->update(
                    [
                        'key' => 'smtp_host',
                        'value' => $this->input->post('smtp_host'),
                    ],
                    'key'
                );
                $this->setting_model->update(
                    [
                        'key' => 'smtp_username',
                        'value' => $this->input->post('smtp_username'),
                    ],
                    'key'
                );
                $this->setting_model->update(
                    [
                        'key' => 'smtp_password',
                        'value' => $this->input->post('smtp_password'),
                    ],
                    'key'
                );
                redirect('settings/r', 'refresh');
            }
        } elseif ($type == 'payment') {
            $this->setting_model->update(
                [
                    'key' => 'pay_per_referal',
                    'value' => $this->input->post('pay_per_referal'),
                ],
                'key'
            );
            $this->setting_model->update(
                [
                    'key' => 'commission_on_withdraw',
                    'value' => $this->input->post('commission_on_withdraw'),
                ],
                'key'
            );
            $this->setting_model->update(
                [
                    'key' => 'withdraw_days',
                    'value' => $this->input->post('withdraw_days'),
                ],
                'key'
            );
            $this->setting_model->update(
                [
                    'key' => 'min_withdraw',
                    'value' => $this->input->post('min_withdraw'),
                ],
                'key'
            );
            $this->setting_model->update(
                [
                    'key' => 'home_page',
                    'value' => $this->input->post('home_page'),
                ],
                'key'
            );
            redirect('settings/r', 'refresh');
        }
    }
    /**
     * categories
     */
    public function categories()
    {
        if (!$this->ion_auth_acl->has_permission('admin')) {
            redirect('error_404');
        }
        $this->load->model('Categories_model');
        $data['categories'] = $this->Categories_model->get_categories();
        $data['title'] = 'Categories';
        $data['content'] = 'admin/admin/category/categories';
        $this->load->view($this->template, $data);
    }
    public function add_categories()
    {
        if (!$this->ion_auth_acl->has_permission('admin')) {
            redirect('error_404');
        }
        if ($this->input->post()) {
            // Set form validation rules
            $this->form_validation->set_rules('category_name', 'Category Name', 'trim|required');
            $this->form_validation->set_rules('description', 'Description', 'trim|required');
            $this->form_validation->set_rules('terms_conditions', 'Terms and Conditions', 'trim|required');
            if ($this->form_validation->run() == false) {
                $data['title'] = 'Add Categories';
                $data['content'] = 'admin/admin/category/add_categories';
                $this->load->view($this->template, $data);
            } else {
                // If validation succeeds, save data to the database
                $input_data = [
                    'name' => $this->input->post('category_name'),
                    'desc' => $this->input->post('description'),
                    'terms' => $this->input->post('terms_conditions'),
                ];
                $this->load->model('Categories_model');
                $res = $this->Categories_model->save_category_info($input_data);
                if ($res) {
                    $this->session->set_flashdata('success_message', 'Category added successfully');
                    redirect('Categories');
                } else {
                    $this->session->set_flashdata('error_message', 'Failed to add category');
                    redirect('add_categories');
                }
            }
        } else {
            // If form is not submitted, load the add categories view
            $data['title'] = 'Add Categories';
            $data['content'] = 'admin/admin/category/add_categories';
            $this->load->view($this->template, $data);
        }
    }
    public function edit_categories()
    {
        if (!$this->ion_auth_acl->has_permission('admin')) {
            redirect('Categories');
        }
        $category_id = $this->input->get('id');
        if (!$category_id) {
            redirect('Categories');
        }
        $this->load->model('Categories_model');
        $data['category'] = $this->Categories_model->get_categories_by_id($category_id);
        if (!$data['category']) {
            redirect('Categories');
        }
        if ($this->input->post()) {
            $update_data = [
                'name' => $this->input->post('category_name'),
                'desc' => $this->input->post('description'),
                'terms' => $this->input->post('terms_conditions'),
            ];
            $this->load->model('Categories_model');
            if ($this->Categories_model->update_category($category_id, $update_data)) {
                $this->session->set_flashdata('success_message', 'Category updated successfully');
                redirect('Categories');
            } else {
                $this->session->set_flashdata('error_message', 'Failed to update category');
                redirect('edit_categories');
            }
        }

        // Load the view for editing categories
        $data['title'] = 'Edit Categories';
        $data['content'] = 'admin/admin/category/edit_categories';
        $this->load->view($this->template, $data);
    }

    public function deleteCategory()
    {
        if ($this->input->is_ajax_request()) {
            $category_id = $this->input->post('category_id');
            if (!$category_id) {
                echo json_encode(['status' => 'error', 'message' => 'Invalid category ID']);
                return;
            }

            $this->load->model('Categories_model');
            if ($this->Categories_model->deleteCategory($category_id)) {
                echo json_encode(['status' => 'success', 'message' => 'Deleted successfully']);
            } else {
                echo json_encode(['status' => 'error', 'message' => 'Failed to delete']);
            }
        } else {
            echo json_encode(['status' => 'error', 'message' => 'Invalid request']);
        }
    }
    /**
     * subcategories
     */
    public function subcategories()
    {
        if (!$this->ion_auth_acl->has_permission('admin')) {
            redirect('error_404');
        }
        $this->load->model('SubCategories_model');
        $data['subcategories'] = $this->SubCategories_model->get_subcategories_with_categories();
        $data['title'] = 'SubCategories';
        $data['content'] = 'admin/admin/subcategory/subcategories';
        $this->load->view($this->template, $data);
    }
    public function add_sub_categories()
    {
        if (!$this->ion_auth_acl->has_permission('admin')) {
            redirect('error_404');
        }

        if ($this->input->post()) {
            // Set form validation rules
            $this->form_validation->set_rules('category_id', 'Category ID', 'trim|required');
            $this->form_validation->set_rules('category_name', 'Category Name', 'trim|required');
            $this->form_validation->set_rules('description', 'Description', 'trim|required');

            if ($this->form_validation->run() == false) {
                $data['title'] = 'Add SubCategories';
                $data['content'] = 'admin/admin/subcategory/add_sub_categories';
                $this->load->view($this->template, $data);
            } else {
                $input_data = [
                    'category_id' => $this->input->post('category_id'),
                    'name' => $this->input->post('category_name'),
                    'desc' => $this->input->post('description'),
                ];

                $this->load->model('SubCategories_model');
                $res = $this->SubCategories_model->save_subcategory_info($input_data);

                if ($res) {
                    $this->session->set_flashdata('success_message', 'Category added successfully');
                    redirect('SubCategories');
                } else {
                    $this->session->set_flashdata('error_message', 'Failed to add category');
                    redirect('add_sub_categories');
                }
            }
        } else {
            // If form is not submitted, load the add categories view
            $data['title'] = 'Add SubCategories';
            $data['content'] = 'admin/admin/subcategory/add_sub_categories';
            $this->load->view($this->template, $data);
        }
    }

    public function edit_subcategories()
    {
        // Check if the user has admin permission
        if (!$this->ion_auth_acl->has_permission('admin')) {
            redirect('SubCategories');
        }
        $subcategory_id = $this->input->get('id');
        if (!$subcategory_id) {
            redirect('SubCategories');
        }
        $this->load->model('SubCategories_model');
        $data['category'] = $this->SubCategories_model->get_subcategory_by_id($subcategory_id);
        if (!$data['category']) {
            redirect('SubCategories');
        }

        if ($this->input->post()) {
            $update_data = [
                'name' => $this->input->post('category_name'),
                'desc' => $this->input->post('description'),
            ];
            $this->load->model('SubCategories_model');
            $update_result = $this->SubCategories_model->update_subcategory($subcategory_id, $update_data);

            if ($update_result) {
                $this->session->set_flashdata('success_message', 'Subcategory updated successfully');
            } else {
                $this->session->set_flashdata('error_message', 'Failed to update subcategory');
            }

            redirect('SubCategories');
        }

        // Load the view for editing subcategories
        $data['title'] = 'Edit SubCategory';
        $data['content'] = 'admin/admin/subcategory/edit_subcategories';
        $data['type'] = 'category';
        $this->load->view($this->template, $data);
    }
    public function deletesubCategory()
    {
        if ($this->input->is_ajax_request()) {
            $category_id = $this->input->post('category_id');
            if (!$category_id) {
                echo json_encode(['status' => 'error', 'message' => 'Invalid category ID']);
                return;
            }

            $this->load->model('SubCategories_model');
            if ($this->SubCategories_model->deletesubCategory($category_id)) {
                echo json_encode(['status' => 'success', 'message' => 'Deleted successfully']);
            } else {
                echo json_encode(['status' => 'error', 'message' => 'Failed to delete']);
            }
        } else {
            echo json_encode(['status' => 'error', 'message' => 'Invalid request']);
        }
    }
    /**
     * colours
     */
    public function colours()
    {
        if (!$this->ion_auth_acl->has_permission('admin')) {
            redirect('error_404');
        }
        $this->load->model('Colours_model');
        $data['categories'] = $this->Colours_model->get_colours();
        $data['title'] = 'Colours';
        $data['content'] = 'admin/admin/colour/colours';
        $this->load->view($this->template, $data);
    }

    public function add_colours()
    {
        if (!$this->ion_auth_acl->has_permission('admin')) {
            redirect('error_404');
        }

        if ($this->input->post()) {
            $this->form_validation->set_rules('colorname', 'Color Name', 'trim|required');
            $this->form_validation->set_rules('colorcode', 'Color Code', 'trim|required');

            if ($this->form_validation->run() == false) {
                $data['title'] = 'Add Colour';
                $data['content'] = 'admin/admin/colour/add_colours';
                $this->load->view($this->template, $data);
            } else {
                $input_data = [
                    'colour_name' => $this->input->post('colorname'),
                    'colour_code' => $this->input->post('colorcode'),
                ];

                $this->load->model('Colours_model');
                $res = $this->Colours_model->save_color_info($input_data);

                if ($res) {
                    $this->session->set_flashdata('success_message', 'Colour added successfully');
                    redirect('Colours'); // Corrected redirect URL
                } else {
                    $this->session->set_flashdata('error_message', 'Failed to add colour');
                    redirect('add_colours');
                }
            }
        } else {
            // If form is not submitted, load the add colours view
            $data['title'] = 'Add Colour';
            $data['content'] = 'admin/admin/colour/add_colours';
            $this->load->view($this->template, $data);
        }
    }

    public function edit_colours()
    {
        if (!$this->ion_auth_acl->has_permission('admin')) {
            redirect('Colours');
        }
        $category_id = $this->input->get('id');
        if (!$category_id) {
            redirect('Colours');
        }
        $this->load->model('Colours_model');
        $data['category'] = $this->Colours_model->get_colours_by_id($category_id);
        if (!$data['category']) {
            redirect('Colours');
        }
        if ($this->input->post()) {
            $update_data = [
                'colour_name' => $this->input->post('colorname'),
                'colour_code' => $this->input->post('colorcode'),
            ];
            $this->load->model('Colours_model');
            if ($this->Colours_model->update_colour($category_id, $update_data)) {
                $this->session->set_flashdata('success_message', 'Colours updated successfully');
                redirect('Colours');
            } else {
                $this->session->set_flashdata('error_message', 'Failed to update Colours');
                redirect('edit_colours');
            }
        }
        // Load the view for editing categories
        $data['title'] = 'Edit Colours';
        $data['content'] = 'admin/admin/colour/edit_colours';
        $this->load->view($this->template, $data);
    }
    public function deleteColour()
    {
        if ($this->input->is_ajax_request()) {
            $category_id = $this->input->post('category_id');
            if (!$category_id) {
                echo json_encode(['status' => 'error', 'message' => 'Invalid category ID']);
                return;
            }

            $this->load->model('Colours_model');
            if ($this->Colours_model->deleteColour($category_id)) {
                echo json_encode(['status' => 'success', 'message' => 'Deleted successfully']);
            } else {
                echo json_encode(['status' => 'error', 'message' => 'Failed to delete']);
            }
        } else {
            echo json_encode(['status' => 'error', 'message' => 'Invalid request']);
        }
    }

    /**
     * countries
     */
    public function countries()
    {
        if (!$this->ion_auth_acl->has_permission('admin')) {
            redirect('error_404');
        }
        $this->load->model('Countries_model');
        $data['categories'] = $this->Countries_model->get_countries();
        $data['title'] = 'Countries';
        $data['content'] = 'admin/admin/country/countries';
        $this->load->view($this->template, $data);
    }
    public function add_countries()
    {
        if (!$this->ion_auth_acl->has_permission('admin')) {
            redirect('error_404');
        }

        if ($this->input->post()) {
            // Set form validation rules
            $this->form_validation->set_rules('country_code', 'Country Code', 'trim|required');
            $this->form_validation->set_rules('country_name', 'Country Name', 'trim|required');
            $this->form_validation->set_rules('code', 'Code', 'trim|required');

            if ($this->form_validation->run() == false) {
                $data['title'] = 'Add Countries';
                $data['content'] = 'admin/admin/country/add_countries';
                $this->load->view($this->template, $data);
            } else {
                $input_data = [
                    'countrycode' => $this->input->post('country_code'),
                    'countryname' => $this->input->post('country_name'),
                    'code' => $this->input->post('code'),
                ];

                $this->load->model('Countries_model');
                $res = $this->Countries_model->save_country_info($input_data);

                if ($res) {
                    $this->session->set_flashdata('success_message', 'Country added successfully');
                    redirect('Countries');
                } else {
                    $this->session->set_flashdata('error_message', 'Failed to add country');
                    redirect('add_countries');
                }
            }
        } else {
            // If form is not submitted, load the add countries view
            $data['title'] = 'Add Countries';
            $data['content'] = 'admin/admin/country/add_countries';
            $this->load->view($this->template, $data);
        }
    }
    public function edit_countries()
    {
        if (!$this->ion_auth_acl->has_permission('admin')) {
            redirect('Countries');
        }
        $country_id = $this->input->get('id');
        if (!$country_id) {
            redirect('Countries');
        }
        $this->load->model('Countries_model');
        $data['category'] = $this->Countries_model->get_countries_by_id($country_id);
        if (!$data['category']) {
            redirect('Countries');
        }
        if ($this->input->post()) {
            $update_data = [
                'countrycode' => $this->input->post('country_code'),
                'countryname' => $this->input->post('country_name'),
                'code' => $this->input->post('code'),
            ];
            $this->load->model('Countries_model');
            if ($this->Countries_model->update_country($country_id, $update_data)) {
                $this->session->set_flashdata('success_message', 'Category updated successfully');
                redirect('Countries');
            } else {
                $this->session->set_flashdata('error_message', 'Failed to update category');
                redirect('edit_countries');
            }
        }
        // Load the view for editing categories
        $data['title'] = 'Edit Countries';
        $data['content'] = 'admin/admin/country/edit_countries';
        $this->load->view($this->template, $data);
    }
    public function deletecountry()
    {
        if ($this->input->is_ajax_request()) {
            $category_id = $this->input->post('category_id');
            if (!$category_id) {
                echo json_encode(['status' => 'error', 'message' => 'Invalid category ID']);
                return;
            }

            $this->load->model('Countries_model');
            if ($this->Countries_model->deletecountry($category_id)) {
                echo json_encode(['status' => 'success', 'message' => 'Deleted successfully']);
            } else {
                echo json_encode(['status' => 'error', 'message' => 'Failed to delete']);
            }
        } else {
            echo json_encode(['status' => 'error', 'message' => 'Invalid request']);
        }
    }
    /**
     * currancy
     */
    public function currency()
    {
        if (!$this->ion_auth_acl->has_permission('admin')) {
            redirect('error_404');
        }
        $this->load->model('Currency_model');
        $data['categories'] = $this->Currency_model->get_currency();
        $data['title'] = 'Currency';
        $data['content'] = 'admin/admin/currency/currency';
        $this->load->view($this->template, $data);
    }
    public function add_currency()
    {
        if (!$this->ion_auth_acl->has_permission('admin')) {
            redirect('error_404');
        }

        if ($this->input->post()) {
            // Set form validation rules
            $this->form_validation->set_rules('name', 'Name', 'trim|required');
            $this->form_validation->set_rules('code', 'Code', 'trim|required');
            $this->form_validation->set_rules('symbol', 'Symbol', 'trim|required');

            if ($this->form_validation->run() == false) {
                $data['title'] = 'Add Currency';
                $data['content'] = 'admin/country/add_currency';
                $this->load->view($this->template, $data);
            } else {
                $input_data = [
                    'name' => $this->input->post('name'),
                    'code' => $this->input->post('code'),
                    'symbol' => $this->input->post('symbol'),
                ];

                $this->load->model('Currency_model');
                $res = $this->Currency_model->save_currency_info($input_data);

                if ($res) {
                    $this->session->set_flashdata('success_message', 'Country added successfully');
                    redirect('Currency');
                } else {
                    $this->session->set_flashdata('error_message', 'Failed to add country');
                    redirect('add_currency');
                }
            }
        } else {
            // If form is not submitted, load the add countries view
            $data['title'] = 'Add Currency';
            $data['content'] = 'admin/admin/currency/add_currency';
            $this->load->view($this->template, $data);
        }
    }

    public function edit_currency()
    {
        if (!$this->ion_auth_acl->has_permission('admin')) {
            redirect('Currency');
        }

        $currency_id = $this->input->get('id');

        if (!$currency_id) {
            redirect('Currency');
        }

        $this->load->model('Currency_model');
        $data['category'] = $this->Currency_model->get_currency_by_id($currency_id);

        if (!$data['category']) {
            redirect('Currency');
        }

        if ($this->input->post()) {
            $update_data = [
                'name' => $this->input->post('name'),
                'code' => $this->input->post('code'),
                'symbol' => $this->input->post('symbol'),
            ];

            $this->load->model('Currency_model');
            $update_result = $this->Currency_model->update_currency($currency_id, $update_data);

            if ($update_result) {
                $this->session->set_flashdata('success_message', 'Subcategory updated successfully');
            } else {
                $this->session->set_flashdata('error_message', 'Failed to update subcategory');
            }

            redirect('Currency');
        }

        // Load the view for editing subcategories
        $data['title'] = 'Edit Currency';
        $data['content'] = 'admin/admin/currency/edit_currency';
        $data['type'] = 'category';

        // Load the view passing the data
        $this->load->view($this->template, $data);
    }
    public function deletecurrency()
    {
        if ($this->input->is_ajax_request()) {
            $category_id = $this->input->post('category_id');
            if (!$category_id) {
                echo json_encode(['status' => 'error', 'message' => 'Invalid category ID']);
                return;
            }

            $this->load->model('Currency_model');
            if ($this->Currency_model->deletecurrency($category_id)) {
                echo json_encode(['status' => 'success', 'message' => 'Deleted successfully']);
            } else {
                echo json_encode(['status' => 'error', 'message' => 'Failed to delete']);
            }
        } else {
            echo json_encode(['status' => 'error', 'message' => 'Invalid request']);
        }
    }
    /**
     * Sizes
     */
    public function sizes()
    {
        if (!$this->ion_auth_acl->has_permission('admin')) {
            redirect('error_404');
        }

        $this->load->model('Size_model');
        $data['sizes'] = $this->Size_model->get_sizes_with_sizestypes();
        $data['title'] = 'Sizes';
        $data['content'] = 'admin/admin/size/sizes';

        // Load your view file with the data
        $this->load->view($this->template, $data);
    }

    public function add_sizes()
    {
        if (!$this->ion_auth_acl->has_permission('admin')) {
            redirect('error_404');
        }

        if ($this->input->post()) {
            // Set form validation rules
            $this->form_validation->set_rules('sizetype', 'Size Type', 'trim|required');
            $this->form_validation->set_rules('sizename', 'Size Name', 'trim|required');

            if ($this->form_validation->run() == false) {
                $data['title'] = 'Add Sizes';
                $data['content'] = 'admin/size/add_sizes';
                $this->load->view($this->template, $data);
            } else {
                $input_data = [
                    'size_type' => $this->input->post('sizetype'),
                    'size_name' => $this->input->post('sizename'),
                ];

                $this->load->model('Size_model');
                $res = $this->Size_model->save_size_info($input_data);

                if ($res) {
                    $this->session->set_flashdata('success_message', 'size added successfully');
                    redirect('Sizes');
                } else {
                    $this->session->set_flashdata('error_message', 'Failed to add size');
                    redirect('add_sizes');
                }
            }
        } else {
            $this->load->model('Sizes_types_model');
            // If form is not submitted, load the add countries view
            $data['sizestypes'] = $this->Sizes_types_model->get_sizes_types();
            $data['title'] = 'Add Sizes';
            $data['content'] = 'admin/admin/size/add_sizes';
            $this->load->view($this->template, $data);
        }
    }
    public function edit_sizes()
    {
        if (!$this->ion_auth_acl->has_permission('admin')) {
            redirect('Sizes');
        }

        $size_id = $this->input->get('id');

        if (!$size_id) {
            redirect('Sizes');
        }

        $this->load->model('Size_model');
        $data['category'] = $this->Size_model->get_size_by_id($size_id);

        if (!$data['category']) {
            redirect('Sizes');
        }

        if ($this->input->post()) {
            $update_data = [
                'size_type' => $this->input->post('sizetype'),
                'size_name' => $this->input->post('sizename'),
            ];

            $this->load->model('Size_model');
            $update_result = $this->Size_model->update_size($size_id, $update_data);

            if ($update_result) {
                $this->session->set_flashdata('success_message', 'Sizes updated successfully');
            } else {
                $this->session->set_flashdata('error_message', 'Failed to update Sizes');
            }

            redirect('Sizes');
        }

        // Load the view for editing subcategories
        $data['title'] = 'Edit Sizes';
        $data['content'] = 'admin/admin/size/edit_sizes';
        $data['type'] = 'category';

        // Load the view passing the data
        $this->load->view($this->template, $data);
    }
    public function deletesize()
    {
        if ($this->input->is_ajax_request()) {
            $category_id = $this->input->post('category_id');
            if (!$category_id) {
                echo json_encode(['status' => 'error', 'message' => 'Invalid category ID']);
                return;
            }

            $this->load->model('Size_model');
            if ($this->Size_model->deletesize($category_id)) {
                echo json_encode(['status' => 'success', 'message' => 'Deleted successfully']);
            } else {
                echo json_encode(['status' => 'error', 'message' => 'Failed to delete']);
            }
        } else {
            echo json_encode(['status' => 'error', 'message' => 'Invalid request']);
        }
    }

    /**
     * sizes_types
     */
    public function sizestypes()
    {
        if (!$this->ion_auth_acl->has_permission('admin')) {
            redirect('error_404');
        }
        $this->load->model('Sizes_types_model');
        $data['sizestypes'] = $this->Sizes_types_model->get_sizes_types();
        $data['title'] = 'SizesTypes';
        $data['content'] = 'admin/admin/sizetype/sizestypes';
        $this->load->view($this->template, $data);
    }
    public function add_sizes_types()
    {
        if (!$this->ion_auth_acl->has_permission('admin')) {
            redirect('error_404');
        }

        if ($this->input->post()) {
            // Set form validation rules
            $this->form_validation->set_rules('sizetype', 'Size Type', 'trim|required');

            if ($this->form_validation->run() == false) {
                $data['title'] = 'Add SizesTypes';
                $data['content'] = 'admin/admin/sizetype/add_sizes_types';
                $this->load->view($this->template, $data);
            } else {
                $input_data = [
                    'size_type' => $this->input->post('sizetype'),
                ];

                $this->load->model('Sizes_types_model');
                $res = $this->Sizes_types_model->save_size_types_info($input_data);

                if ($res) {
                    $this->session->set_flashdata('success_message', 'SizesTypes added successfully');
                    redirect('SizesTypes');
                } else {
                    $this->session->set_flashdata('error_message', 'Failed to add SizesTypes');
                    redirect('add_sizes_types');
                }
            }
        } else {
            // If form is not submitted, load the add countries view
            $data['title'] = 'Add SizesTypes';
            $data['content'] = 'admin/admin/sizetype/add_sizes_types';
            $this->load->view($this->template, $data);
        }
    }
    public function edit_sizes_types()
    {
        if (!$this->ion_auth_acl->has_permission('admin')) {
            redirect('SizesTypes');
        }

        $size_types_id = $this->input->get('id');

        if (!$size_types_id) {
            redirect('SizesTypes');
        }

        $this->load->model('Sizes_types_model');
        $data['category'] = $this->Sizes_types_model->get_size_types_by_id($size_types_id);

        if (!$data['category']) {
            redirect('SizesTypes');
        }

        if ($this->input->post()) {
            $update_data = [
                'size_type' => $this->input->post('sizetype'),
            ];

            $this->load->model('Sizes_types_model');
            $update_result = $this->Sizes_types_model->update_size_types($size_types_id, $update_data);

            if ($update_result) {
                $this->session->set_flashdata('success_message', 'Sizes updated successfully');
            } else {
                $this->session->set_flashdata('error_message', 'Failed to update Sizes');
            }

            redirect('SizesTypes');
        }

        // Load the view for editing subcategories
        $data['title'] = 'Edit SizesTypes';
        $data['content'] = 'admin/admin/sizetype/edit_sizes_types';
        $data['type'] = 'category';

        // Load the view passing the data
        $this->load->view($this->template, $data);
    }
    public function deletesize_types()
    {
        if ($this->input->is_ajax_request()) {
            $category_id = $this->input->post('category_id');
            if (!$category_id) {
                echo json_encode(['status' => 'error', 'message' => 'Invalid category ID']);
                return;
            }

            $this->load->model('Sizes_types_model');
            if ($this->Sizes_types_model->deletesize_types($category_id)) {
                echo json_encode(['status' => 'success', 'message' => 'Deleted successfully']);
            } else {
                echo json_encode(['status' => 'error', 'message' => 'Failed to delete']);
            }
        } else {
            echo json_encode(['status' => 'error', 'message' => 'Invalid request']);
        }
    }

    /**
     * users
     */
    public function users_admin()
    {
        if (!$this->ion_auth_acl->has_permission('admin')) {
            redirect('error_404');
        }
        $this->load->model('UserAdmin_model');
        $data['categories'] = $this->UserAdmin_model->get_users();
        $data['title'] = 'UsersAdmin';
        $data['content'] = 'admin/admin/user/users_admin';
        $this->load->view($this->template, $data);
    }
    public function add_users_admin()
    {
        if (!$this->ion_auth_acl->has_permission('admin')) {
            redirect('error_404');
        }

        if ($this->input->post()) {
            // Set form validation rules
            $this->form_validation->set_rules('referral_id', 'Referral ID', 'trim|required');
            $this->form_validation->set_rules('ip_address', 'IP Address', 'trim|required');
            $this->form_validation->set_rules('username', 'Username', 'trim|required');
            $this->form_validation->set_rules('unique_id', 'Unique ID', 'trim|required');
            $this->form_validation->set_rules('password', 'Password', 'trim|required');
            $this->form_validation->set_rules('salt', 'Salt', 'trim|required');
            $this->form_validation->set_rules('email', 'Email', 'trim|required|valid_email');
            $this->form_validation->set_rules('wallet', 'Wallet', 'trim|required');
            $this->form_validation->set_rules('activation_code', 'Activation Code', 'trim|required');
            $this->form_validation->set_rules('forgotten_password_code', 'Forgotten Password Code', 'trim|required');
            $this->form_validation->set_rules('forgotten_password_id', 'Forgotten Password ID', 'trim|required');
            $this->form_validation->set_rules('remember_code', 'Remember Code', 'trim|required');
            $this->form_validation->set_rules('created_on', 'Created On', 'trim|required');
            $this->form_validation->set_rules('last_login', 'Last Login', 'trim|required');
            $this->form_validation->set_rules('active', 'Active', 'trim|required');
            $this->form_validation->set_rules('list_id', 'List ID', 'trim|required');
            $this->form_validation->set_rules('firstname', 'Firstname', 'trim|required');
            $this->form_validation->set_rules('lastname', 'Lastname', 'trim|required');
            $this->form_validation->set_rules('company', 'Company', 'trim|required');
            $this->form_validation->set_rules('phone', 'Phone', 'trim|required');
            $this->form_validation->set_rules('create_user_id', 'Create User ID', 'trim|required');
            $this->form_validation->set_rules('update_user_id', 'Update User ID', 'trim|required');

            if ($this->form_validation->run() == false) {
                $data['title'] = 'Add UsersAdmin';
                $data['content'] = 'admin/admin/user/add_users_admin';
                $this->load->view($this->template, $data);
            } else {
                $input_data = [
                    'referal_id' => $this->input->post('referral_id'),
                    'ip_address' => $this->input->post('ip_address'),
                    'username' => $this->input->post('username'),
                    'unique_id' => $this->input->post('unique_id'),
                    'password' => $this->input->post('password'),
                    'salt' => $this->input->post('salt'),
                    'email' => $this->input->post('email'),
                    'wallet' => $this->input->post('wallet'),
                    'activation_code' => $this->input->post('activation_code'),
                    'forgotten_password_code' => $this->input->post('forgotten_password_code'),
                    'forgotten_password_id' => $this->input->post('forgotten_password_id'),
                    'remember_code' => $this->input->post('remember_code'),
                    'created_on' => $this->input->post('created_on'),
                    'last_login' => $this->input->post('last_login'),
                    'active' => $this->input->post('active'),
                    'list_id' => $this->input->post('list_id'),
                    'first_name' => $this->input->post('firstname'),
                    'last_name' => $this->input->post('lastname'),
                    'company' => $this->input->post('company'),
                    'phone' => $this->input->post('phone'),
                    'create_user_id' => $this->input->post('create_user_id'),
                    'update_user_id' => $this->input->post('update_user_id'),
                ];
                // print_r($_POST);
                // die();

                $this->load->model('UserAdmin_model');
                $res = $this->UserAdmin_model->save_user_admin_info($input_data);

                // Redirect based on the result
                if ($res) {
                    $this->session->set_flashdata('success_message', 'User added successfully');
                    redirect('UsersAdmin'); // Change 'Users' to your desired redirect route
                } else {
                    $this->session->set_flashdata('error_message', 'Failed to add user');
                    redirect('add_users_admin'); // Change 'add_user_admin' to your desired redirect route
                }
            }
        } else {
            // If form is not submitted, load the add users view
            $data['title'] = 'Add UsersAdmin';
            $data['content'] = 'admin/admin/user/add_users_admin';
            $this->load->view($this->template, $data);
        }
    }

    public function edit_users_admin()
    {
        if (!$this->ion_auth_acl->has_permission('admin')) {
            redirect('UsersAdmin');
        }

        $category_id = $this->input->get('id');

        if (!$category_id) {
            redirect('UsersAdmin');
        }

        $this->load->model('UserAdmin_model');
        $data['category'] = $this->UserAdmin_model->get_users_admin_by_id($category_id);
        if (!$data['category']) {
            redirect('UsersAdmin');
        }

        if ($this->input->post()) {
            $update_data = [
                'referal_id' => $this->input->post('referral_id'),
                'ip_address' => $this->input->post('ip_address'),
                'username' => $this->input->post('username'),
                'unique_id' => $this->input->post('unique_id'),
                'password' => $this->input->post('password'),
                'salt' => $this->input->post('salt'),
                'email' => $this->input->post('email'),
                'wallet' => $this->input->post('wallet'),
                'activation_code' => $this->input->post('activation_code'),
                'forgotten_password_code' => $this->input->post('forgotten_password_code'),
                'forgotten_password_id' => $this->input->post('forgotten_password_id'),
                'remember_code' => $this->input->post('remember_code'),
                'created_on' => $this->input->post('created_on'),
                'last_login' => $this->input->post('last_login'),
                'active' => $this->input->post('active'),
                'list_id' => $this->input->post('list_id'),
                'first_name' => $this->input->post('firstname'),
                'last_name' => $this->input->post('lastname'),
                'company' => $this->input->post('company'),
                'phone' => $this->input->post('phone'),
                'create_user_id' => $this->input->post('create_user_id'),
                'update_user_id' => $this->input->post('update_user_id'),
            ];
            // print_r($update_data);die;
            $this->load->model('UserAdmin_model');
            $update_result = $this->UserAdmin_model->update_users_admin($category_id, $update_data);

            if ($update_result) {
                $this->session->set_flashdata('success_message', 'UsersAdmin updated successfully');
            } else {
                $this->session->set_flashdata('error_message', 'Failed to update UsersAdmin');
            }

            redirect('UsersAdmin');
        }

        // Load the view for editing subcategories
        $data['title'] = 'Edit UsersAdmin';
        $data['content'] = 'admin/admin/user/edit_users_admin';

        // Load the view passing the data
        $this->load->view($this->template, $data);
    }
    public function deleteusers_admin()
    {
        if ($this->input->is_ajax_request()) {
            $category_id = $this->input->post('category_id');
            if (!$category_id) {
                echo json_encode(['status' => 'error', 'message' => 'Invalid category ID']);
                return;
            }

            $this->load->model('UserAdmin_model');
            if ($this->UserAdmin_model->deleteusers_admin($category_id)) {
                echo json_encode(['status' => 'success', 'message' => 'Category deleted successfully']);
            } else {
                echo json_encode(['status' => 'error', 'message' => 'Failed to delete category']);
            }
        } else {
            echo json_encode(['status' => 'error', 'message' => 'Invalid request']);
        }
    }
    /**
     * venue_address
     *
     */

    public function venue_address()
    {
        if (!$this->ion_auth_acl->has_permission('admin')) {
            redirect('error_404');
        }
        $this->load->model('VenueAddress_model');
        $data['categories'] = $this->VenueAddress_model->get_venue_address();
        $data['title'] = 'VenueAddress';
        $data['content'] = 'admin/admin/venue/venue_address';
        $this->load->view($this->template, $data);
    }
    public function add_venue_address()
    {
        if (!$this->ion_auth_acl->has_permission('admin')) {
            redirect('error_404');
        }

        if ($this->input->post()) {
            // Set form validation rules
            $this->form_validation->set_rules('name', 'Name', 'trim|required');
            $this->form_validation->set_rules('address_line_one', 'Address Line One', 'trim|required');
            $this->form_validation->set_rules('capacity', 'Capacity', 'trim|required|numeric');
            $this->form_validation->set_rules('city', 'City', 'trim|required');
            $this->form_validation->set_rules('phone', 'Phone', 'trim|required');
            $this->form_validation->set_rules('country', 'Country', 'trim|required');
            $this->form_validation->set_rules('postal_code', 'Postal Code', 'trim|required');
            $this->form_validation->set_rules('is_verified', 'Is Verified', 'trim|required');

            // Validate the form
            if ($this->form_validation->run() == false) {
                $data['title'] = 'Add VenueAddress';
                $data['content'] = 'admin/admin/venue/add_venue_address';
                $this->load->view($this->template, $data);
            } else {
                $data = [
                    'name' => $this->input->post('name'),
                    'addressLineOne' => $this->input->post('address_line_one'),
                    'addressLineTwo' => $this->input->post('address_line_two'),
                    'capacity' => $this->input->post('capacity'),
                    'city' => $this->input->post('city'),
                    'phone' => $this->input->post('phone'),
                    'stateProvince' => $this->input->post('state_province'),
                    'country' => $this->input->post('country'),
                    'postalCode' => $this->input->post('postal_code'),
                    'isVerified' => $this->input->post('is_verified'),
                ];
                $this->load->model('VenueAddress_model');
                $res = $this->VenueAddress_model->save_venue_address_info($data);
                if ($res) {
                    $this->session->set_flashdata('success_message', 'VenueAddress added successfully');
                    redirect('VenueAddress');
                } else {
                    $this->session->set_flashdata('error_message', 'Failed to add VenueAddress');
                    redirect('add_venue_address');
                }
            }
        } else {
            // If form is not submitted, load the add venue address view
            $data['title'] = 'Add VenueAddress';
            $data['content'] = 'admin/admin/venue/add_venue_address';
            $this->load->view($this->template, $data);
        }
    }
    public function edit_venue_address()
    {
        if (!$this->ion_auth_acl->has_permission('admin')) {
            redirect('VenueAddress');
        }

        $category_id = $this->input->get('id');

        if (!$category_id) {
            redirect('VenueAddress');
        }

        $this->load->model('VenueAddress_model');
        $data['category'] = $this->VenueAddress_model->get_venue_address_by_id($category_id);

        if (!$data['category']) {
            redirect('VenueAddress');
        }

        if ($this->input->post()) {
            $update_data = [
                'name' => $this->input->post('name'),
                'addressLineOne' => $this->input->post('address_line_one'),
                'addressLineTwo' => $this->input->post('address_line_two'),
                'capacity' => $this->input->post('capacity'),
                'city' => $this->input->post('city'),
                'phone' => $this->input->post('phone'),
                'stateProvince' => $this->input->post('state_province'),
                'country' => $this->input->post('country'),
                'postalCode' => $this->input->post('postal_code'),
                'isVerified' => $this->input->post('is_verified'),
            ];
            $this->load->model('VenueAddress_model');
            $update_result = $this->VenueAddress_model->update_venue_address($category_id, $update_data);

            if ($update_result) {
                $this->session->set_flashdata('success_message', 'VenueAddress updated successfully');
            } else {
                $this->session->set_flashdata('error_message', 'Failed to update VenueAddress');
            }

            redirect('VenueAddress'); // Redirect to the VenueAddress controller's index method
        }

        // Load the view for editing subcategories
        $data['title'] = 'Edit VenueAddress';
        $data['content'] = 'admin/admin/venue/edit_venue_address';
        // Load the view passing the data
        $this->load->view($this->template, $data);
    }
    public function deletevenue_address()
    {
        if ($this->input->is_ajax_request()) {
            $category_id = $this->input->post('category_id');
            if (!$category_id) {
                echo json_encode(['status' => 'error', 'message' => 'Invalid category ID']);
                return;
            }

            $this->load->model('VenueAddress_model');
            if ($this->VenueAddress_model->deletevenue_address($category_id)) {
                echo json_encode(['status' => 'success', 'message' => 'Deleted successfully']);
            } else {
                echo json_encode(['status' => 'error', 'message' => 'Failed to delete']);
            }
        } else {
            echo json_encode(['status' => 'error', 'message' => 'Invalid request']);
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
            $this->data['top'] = $this->advertisements_model->where('type', 'top')->get_all();
            $this->data['middle'] = $this->advertisements_model->where('type', 'middle')->get_all();
            $this->data['bottom'] = $this->advertisements_model->where('type', 'bottom')->get_all();
            $this->data['last'] = $this->advertisements_model->where('type', 'last')->get_all();
            $this->_render_page($this->template, $this->data);
        } elseif ($type == 'slide') {
            if ($_FILES['slide']['name'] !== '') {
                $path = $_FILES['slide']['name'];
                $ext = pathinfo($path, PATHINFO_EXTENSION);
                $slider_id = $this->sliders_model->insert([
                    'image' => $path,
                    'ext' => $ext,
                ]);
                $this->file_up("slide", "sliders", $slider_id, '', 'no', '.' . $ext);
            }
            redirect('sliders/r', 'refresh');
        } elseif ($type == 'd') {
            $this->sliders_model->delete(['id' => $this->input->post('id')]);
        }
    }
    public function cat_ban_delete($type = 'd')
    {
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
        redirect('sliders/r', 'refresh');
    }
    public function category_banner($type = 'r')
    {
        if ($type == 'r') {
            $this->data['title'] = 'Slides';
            $this->data['content'] = 'admin/admin/cat_banners';
            $this->data['categories'] = $this->category_model->get_all();
            $this->data['sliders'] = $this->sliders_model->get_all();
            $this->data['cat_banner'] = $this->cat_banners_model->get_all();
            $this->_render_page($this->template, $this->data);
        } elseif ($type == 'cat_banners') {
            if ($_FILES['cat_banners']['name'] !== '') {
                $path = $_FILES['cat_banners']['name'];
                $ext = pathinfo($path, PATHINFO_EXTENSION);
                $cat_id = $this->input->post('cat_id');
                $catb_id = $this->cat_banners_model->insert([
                    'image' => $path,
                    'ext' => $ext,
                    'cat_id' => $cat_id,
                ]);
                //$this->file_up("cat_banners", "cat_banners", $catb_id, '', 'no', '.jpg');
                move_uploaded_file($_FILES['cat_banners']['tmp_name'], 'uploads/' . 'cat_banners' . '_image/' . 'cat_banners' . '_' . $cat_id . '_' . $catb_id . '.jpg');
            }
            redirect('category_banner/r', 'refresh');
        } elseif ($type == 'u') {
            if ($_FILES['file']['name'] !== '') {
                $path = $_FILES['file']['name'];
                $ext = pathinfo($path, PATHINFO_EXTENSION);
                $cat_id = $this->input->post('cat_id');
                $this->cat_banners_model->update([
                    'id' => $this->input->post('banner_id'),
                    'image' => $path,
                    'ext' => $ext,
                    'cat_id' => $this->input->post('cat_id'),
                ]);
                unlink('uploads/' . 'cat_banners' . '_image/' . 'cat_banners' . '_' . $this->input->post('cat_id') . '_' . $this->input->post('banner_id') . '.jpg');
                move_uploaded_file($_FILES['file']['tmp_name'], 'uploads/' . 'cat_banners' . '_image/' . 'cat_banners' . '_' . $this->input->post('cat_id') . '_' . $this->input->post('banner_id') . '.jpg');
                //$this->file_up("cat_banners", "cat_banners", $catb_id, '', 'no', '.jpg');
            }
            redirect('category_banner/r', 'refresh');
        } elseif ($type == 'd') {
            $this->cat_banners_model->delete(['id' => $this->input->post('id')]);
        } elseif ($type == 'edit') {
            $this->data['title'] = 'Edit Category Banner';
            $this->data['content'] = 'admin/admin/edit';
            $this->data['type'] = 'category_banner';
            $this->data['category'] = $this->cat_banners_model->where('id', $this->input->get('id'))->get();
            $this->data['i'] = $this->cat_banners_model->where('file', $this->input->get('file'))->get();
            $this->data['categories'] = $this->cat_banners_model->where('id', $this->input->get('id'))->get();
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
                    'ext' => $ext,
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
        if ($type == 'logo') {
            if ($_FILES['file']['name'] !== '') {
                move_uploaded_file($_FILES["file"]["tmp_name"], "assets/img/logo.png");
            }
        }
        if ($type == 'favicon') {
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
            if ($this->form_validation->run() == false) {
                $this->profile();
            } else {
                $this->user_model->update(
                    [
                        'first_name' => $this->input->post('fname'),
                        'last_name' => $this->input->post('lname'),
                        'email' => $this->input->post('email'),
                        'phone' => $this->input->post('phone'),
                    ],
                    $this->session->userdata('user_id')
                );
                redirect('profile/r', 'refresh');
            }
        } elseif ($type == 'reset') {
            $this->form_validation->set_rules($this->user_model->rules['reset']);
            if (!$this->ion_auth->logged_in()) {
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
    public function emp_list($type = 'executive')
    {
        if ($type == 'users') {
            $this->data['title'] = 'Users';
            $this->data['content'] = 'emp/emp_list';
            $this->data['type'] = 'users';
            $this->data['executives'] = $this->user_model
                ->order_by('id', 'DESC')
                ->fields('id, first_name, last_name, email,wallet, unique_id')
                ->with_groups('fields: id, name', 'where: name = \'user\'')
                ->get_all();
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
        if ($this->input->post() && $this->input->post('cancel')) {
            redirect('admin/permissions', 'refresh');
        }
        $this->form_validation->set_rules('perm_key', 'key', 'required|trim');
        $this->form_validation->set_rules('perm_name', 'name', 'required|trim');
        $this->form_validation->set_rules('desc', 'Description', 'trim');
        $this->form_validation->set_rules('parent_status', 'Parent Status', 'trim');
        $this->form_validation->set_message('required', 'Please enter a %s');
        if ($this->form_validation->run() === false) {
            $data['message'] = $this->ion_auth_acl->errors() ? $this->ion_auth_acl->errors() : $this->session->flashdata('message');
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
        if ($this->input->post() && $this->input->post('cancel')) {
            redirect('admin/permissions', 'refresh');
        }
        $permission_id = $this->uri->segment(3);
        if (!$permission_id) {
            $this->session->set_flashdata('message', "No permission ID passed");
            redirect("admin/permissions", 'refresh');
        }
        $permission = $this->ion_auth_acl->permission($permission_id);
        $this->form_validation->set_rules('perm_key', 'key', 'required|trim');
        $this->form_validation->set_rules('perm_name', 'name', 'required|trim');
        $this->form_validation->set_message('required', 'Please enter a %s');
        if ($this->form_validation->run() === false) {
            $data['message'] = $this->ion_auth_acl->errors() ? $this->ion_auth_acl->errors() : $this->session->flashdata('message');
            $data['permission'] = $permission;
            $this->load->view('edit_permission', $data);
        } else {
            $additional_data = [
                'perm_name' => $this->input->post('perm_name'),
            ];
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
        if ($this->input->post() && $this->input->post('cancel')) {
            redirect('admin/permissions', 'refresh');
        }
        $permission_id = $this->uri->segment(3);
        if (!$permission_id) {
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
            $data['message'] = $this->ion_auth_acl->errors() ? $this->ion_auth_acl->errors() : $this->session->flashdata('message');
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
        if ($this->input->post() && $this->input->post('cancel')) {
            redirect('admin/groups', 'refresh');
        }
        $group_id = $this->uri->segment(3);
        if (!$group_id) {
            $this->session->set_flashdata('message', "No group ID passed");
            redirect("admin/groups", 'refresh');
        }
        if ($this->input->post() && $this->input->post('save')) {
            foreach ($this->input->post() as $k => $v) {
                if (substr($k, 0, 5) == 'perm_') {
                    $permission_id = str_replace("perm_", "", $k);
                    if ($v == "X") {
                        $this->ion_auth_acl->remove_permission_from_group($group_id, $permission_id);
                    } else {
                        $this->ion_auth_acl->add_permission_to_group($group_id, $permission_id, $v);
                    }
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
        if (!$user_id) {
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
        if (!$user_id) {
            $this->session->set_flashdata('message', "No user ID passed");
            redirect("admin/users", 'refresh');
        }
        if ($this->input->post() && $this->input->post('cancel')) {
            redirect("admin/manage-user/{$user_id}", 'refresh');
        }
        if ($this->input->post() && $this->input->post('save')) {
            foreach ($this->input->post() as $k => $v) {
                if (substr($k, 0, 5) == 'perm_') {
                    $permission_id = str_replace("perm_", "", $k);
                    if ($v == "X") {
                        $this->ion_auth_acl->remove_permission_from_user($user_id, $permission_id);
                    } else {
                        $this->ion_auth_acl->add_permission_to_user($user_id, $permission_id, $v);
                    }
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
            if ($this->form_validation->run() == false) {
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
            if ($this->form_validation->run() == false) {
                echo validation_errors();
            } else {
                $this->user_service_model->update(
                    [
                        'id' => $this->input->post('id'),
                        'name' => $this->input->post('name'),
                    ],
                    'id',
                    'name'
                );
                redirect('user_services/r', 'refresh');
            }
        } elseif ($type == 'd') {
            $this->user_service_model->delete(['id' => $this->input->post('id')]);
        } elseif ($type == 'edit') {
            $this->data['title'] = 'Edit State';
            $this->data['content'] = 'admin/admin/edit';
            $this->data['type'] = 'user_services';
            $this->data['services'] = $this->user_service_model
                ->order_by('id', 'DESC')
                ->where('id', $this->input->get('id'))
                ->get();
            $this->_render_page($this->template, $this->data);
        }
    }
    function popup($page_name = '', $param2 = '', $param3 = '')
    {
        $account_type = $this->session->userdata('login_type');
        $page_data['param2'] = $param2;
        $page_data['param3'] = $param3;
        $this->load->view('backend/main/' . $page_name . '.php', $page_data);
        echo '<script src="assets/js/neon-custom-ajax.js"></script>';
        echo '<script>$(".html5editor").wysihtml5();</script>';
    }
    public function my_test($value = '')
    {
        echo "string";
    }
}
