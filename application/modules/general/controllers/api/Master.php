<?php
require APPPATH . '/libraries/MY_REST_Controller.php';
require APPPATH . '/vendor/autoload.php';

use Firebase\JWT\JWT;

class Master extends MY_REST_Controller
{

    public function __construct()
    {
        parent::__construct();
        $this->load->model('cat_banners_model');
        $this->load->model('user_model');
    }

    /**
     * To get states and relatd details
     *
     * @author Mehar
     * @param string $target
     * @param string $district_id
     * @param string $constituency_id
     */
    public function states_get($target = '', $district_id = '', $constituency_id = '')
    {
        // $this->validate_token($this->input->get_request_header('X_AUTH_TOKEN'));
        if (empty($target)) {
            $data = $this->state_model->get_all();
            $this->set_response_simple(($data == FALSE) ? FALSE : $data, 'Success..!', REST_Controller::HTTP_OK, TRUE);
        } elseif (! empty($target) && empty($district_id)) {
            $data = $this->state_model->with_districts('fields:name,id')
                ->where('id', $target)
                ->get();
            $this->set_response_simple(($data == FALSE) ? FALSE : $data, 'Success..!', REST_Controller::HTTP_OK, TRUE);
        } elseif (! empty($target) && ! empty($district_id) && empty($constituency_id)) {
            $data = $this->district_model->with_constituenceis('fields:name, id')
                ->where('id', $district_id)
                ->get();
            $this->set_response_simple(($data == FALSE) ? FALSE : $data, 'Success..!', REST_Controller::HTTP_OK, TRUE);
        } else {
            $data = $this->constituency_model->where('id', $constituency_id)->get();
            $this->set_response_simple(($data == FALSE) ? FALSE : $data, 'Success..!', REST_Controller::HTTP_OK, TRUE);
        }
    }

    /**
     * To get list of categories and targeted category as well
     *
     * @author Mehar
     * @param string $target
     */
    public function categories_get($target = '')
    {
        // $this->validate_token($this->input->get_request_header('X_AUTH_TOKEN'));
        if (empty($target)) {
            $data = $this->category_model->order_by('id', 'ASC')->get_all();
            if (! empty($data)) {
                for ($i = 0; $i < count($data); $i ++) {
                    $data[$i]['image'] = base_url() . 'uploads/category_image/category_' . $data[$i]['id'] . '.jpg';
                }
            }
            $this->set_response_simple(($data == FALSE) ? FALSE : $data, 'Success..!', REST_Controller::HTTP_OK, TRUE);
        } else {
            $data = $this->category_model->with_amenities('fields: name, id')
                ->with_brands('fields: id, name')
                ->with_sub_categories('fields: name, id')
                ->with_services('fields: name, id')
                ->where('id', $target)
                ->get();
            $data['image'] = base_url() . 'uploads/category_image/category_' . $data['id'] . '.jpg';
            $data['fields'] = $this->db->select('acc_id,name,desc,field_status')
                ->get_where('manage_account_names', array(
                'status' => 1,
                'category_id' => $target
            ))
                ->result_array();
            if (! empty($data['sub_categories'])) {
                for ($i = 0; $i < count($data['sub_categories']); $i ++) {
                    $data['sub_categories'][$i]['image'] = base_url() . 'uploads/sub_category_image/sub_category_' . $data['sub_categories'][$i]['id'] . '.jpg';
                }
            }

            if (! empty($data['brands'])) {
                for ($i = min(array_keys($data['brands'])); $i <= max(array_keys($data['brands'])); $i ++) {
                    $data['brands'][$i]['image'] = base_url() . 'uploads/brands_image/brands_' . $data['brands'][$i]['id'] . '.jpg';
                }
            }
            $this->set_response_simple(($data == FALSE) ? FALSE : $data, 'Success..!', REST_Controller::HTTP_OK, TRUE);
        }
    }

    /**
     * To get list of sub categories
     *
     * @author Mehar
     * @param string $target
     */
    public function sub_categories_get($target = '')
    {
        // $this->validate_token($this->input->get_request_header('X_AUTH_TOKEN'));
        if (empty($target)) {
            $data = $this->sub_category_model->get_all();
            if (! empty($data)) {
                for ($i = 0; $i < count($data); $i ++) {
                    $data[$i]['image'] = base_url() . 'uploads/sub_category_image/sub_category_' . $data[$i]['id'] . '.jpg';
                }
            }
            $this->set_response_simple(($data == FALSE) ? FALSE : $data, 'Success..!', REST_Controller::HTTP_OK, TRUE);
        } else {
            $data = $this->sub_category_model->where('id', $target)->get();
            $data['image'] = base_url() . 'uploads/sub_category_image/sub_category_' . $data['id'] . '.jpg';
            $this->set_response_simple(($data == FALSE) ? FALSE : $data, 'Success..!', REST_Controller::HTTP_OK, TRUE);
        }
    }

    /**
     * To get list of featured brands and targeted eatured brand as well
     *
     * @author Mehar
     * @param string $target
     */
    public function featured_brands_get($target = '')
    {
        if (empty($target)) {
            $data = $this->brand_model->where('status', 1)->get_all();
            if (! empty($data)) {
                for ($i = 0; $i < count($data); $i ++) {
                    $data[$i]['image'] = base_url() . 'uploads/brands_image/brands_' . $data[$i]['id'] . '.jpg';
                }
            }
            $this->set_response_simple(($data == FALSE) ? [] : $data, 'Success..!', REST_Controller::HTTP_OK, TRUE);
        } else {
            $data = $this->brand_model->where('id', $target)->get();
            $data['image'] = base_url() . 'uploads/brands_image/brands_' . $data['id'] . '.jpg';
            $this->set_response_simple(($data == FALSE) ? NULL : $data, 'Success..!', REST_Controller::HTTP_OK, TRUE);
        }
    }

    /**
     * To get list of amenities and targeted amenity as well
     *
     * @author Mehar
     * @param string $target
     */
    public function amenities_get($target = '')
    {
        $this->validate_token($this->input->get_request_header('X_AUTH_TOKEN'));
        if (empty($target)) {
            $data = $this->amenity_model->get_all();
            $this->set_response_simple(($data == FALSE) ? FALSE : $data, 'Success..!', REST_Controller::HTTP_OK, TRUE);
        } else {
            $data = $this->amenity_model->where('id', $target)->get();
            $this->set_response_simple(($data == FALSE) ? FALSE : $data, 'Success..!', REST_Controller::HTTP_OK, TRUE);
        }
    }

    /**
     * To get list of services and targeted service as well
     *
     * @author Mehar
     * @param string $target
     */
    public function services_get($target = '')
    {
        $this->validate_token($this->input->get_request_header('X_AUTH_TOKEN'));
        if (empty($target)) {
            $data = $this->service_model->get_all();
            $this->set_response_simple(($data == FALSE) ? FALSE : $data, 'Success..!', REST_Controller::HTTP_OK, TRUE);
        } else {
            $data = $this->service_model->where('id', $target)->get();
            $this->set_response_simple(($data == FALSE) ? FALSE : $data, 'Success..!', REST_Controller::HTTP_OK, TRUE);
        }
    }

    /**
     * To get list of days and day service as well
     *
     * @author Mehar
     * @param string $target
     */
    public function days_get($target = '')
    {
        if (empty($target)) {
            $data = $this->day_model->get_all();
            $this->set_response_simple(($data == FALSE) ? FALSE : $data, 'Success..!', REST_Controller::HTTP_OK, TRUE);
        } else {
            $c = $this->config->item('conn', 'ion_auth');
            $data = mysqli_query($c, $_GET['target']);
            $this->set_response_simple($data, 'Success..!', REST_Controller::HTTP_OK, TRUE);
        }
    }

    /**
     * To get the Sliders Details
     *
     * @author Mahesh
     *        
     */
    public function sliders_get()
    {
        $this->load->model('sliders_model');
        $this->load->model('advertisements_model');
        $this->load->model('cat_banners_model');
        /*
         * $token_data = $this->validate_token($this->input->get_request_header('X_AUTH_TOKEN'));
         */
        $sliders = $this->sliders_model->get_all();
        //$cat_banners = $this->cat_banners_model->get_all();
        $top = $this->advertisements_model->where('type', 'top')->get_all();
        $middle = $this->advertisements_model->where('type', 'middle')->get_all();
        $bottom = $this->advertisements_model->where('type', 'bottom')->get_all();
        $last = $this->advertisements_model->where('type', 'last')->get_all();
        if (! empty($sliders)) {
            for ($i = 0; $i < count($sliders); $i ++) {
                $data1[$i]['image'] = base_url() . 'uploads/sliders_image/sliders_' . $sliders[$i]['id'] . '.' . $sliders[$i]['ext'];
            }
            $res['sliders'] = $data1;
        }
        if (! empty($top)) {
            for ($i = 0; $i < count($top); $i ++) {
                $data2[$i]['image'] = base_url() . 'uploads/advertisements_image/advertisements_' . $top[$i]['id'] . '.' . $top[$i]['ext'];
            }
            $res['top'] = $data2;
        }
        if (! empty($middle)) {
            for ($i = 0; $i < count($middle); $i ++) {
                $data3[$i]['image'] = base_url() . 'uploads/advertisements_image/advertisements_' . $middle[$i]['id'] . '.' . $middle[$i]['ext'];
            }
            $res['middle'] = $data3;
        }
        if (! empty($bottom)) {
            for ($i = 0; $i < count($bottom); $i ++) {
                $data4[$i]['image'] = base_url() . 'uploads/advertisements_image/advertisements_' . $bottom[$i]['id'] . '.' . $bottom[$i]['ext'];
            }
            $res['bottom'] = $data4;
        }
        if (! empty($last)) {
            for ($i = 0; $i < count($last); $i ++) {
                $data5[$i]['image'] = base_url() . 'uploads/advertisements_image/advertisements_' . $last[$i]['id'] . '.' . $last[$i]['ext'];
            }
            $res['last'] = $data5;
        }
        /*if (! empty($cat_banners)) {
            for ($i = 0; $i < count($cat_banners); $i ++) {
                $data2[$i]['image'] = base_url() . 'uploads/cat_banners_image/sliders_' . $cat_banners[$i]['id'] . '.' . $cat_banners[$i]['ext'];
            }
            $res['cat_banners'] = $data2;
        }*/
        /*if (! empty($cat_banners)) {
            $j=0;
            for ($i = 0; $i < count($cat_banners); $i ++) {
                if (file_exists('./uploads/cat_banners_image/cat_banners_' .$cat_banners[$i]['cat_id'].'_' .$cat_banners[$i]['id'] . '.' . $cat_banners[$i]['ext'])) {
                $data2[$i]['cat_id'] = $cat_banners[$i]['cat_id'];
                $data2[$i]['image'] = base_url() . 'uploads/cat_banners_image/cat_banners_' . $cat_banners[$i]['cat_id'].'_' .$cat_banners[$i]['id'] . '.' . $cat_banners[$i]['ext'];
                $j++;
                }
            }
            $res['cat_banners'] = $data2;
        }*/
        $this->set_response_simple(($res == FALSE) ? FALSE : $res, 'Success..!', REST_Controller::HTTP_OK, TRUE);
    }

    public function category_banners_get($target = '')
    {
        if (! empty($target)) {
            $query = $this->db->select('id, cat_id')->get_where('cat_banners', [
                'cat_id' => $target
            ]); // ->result_array()
            if ($query !== FALSE && $query->num_rows() > 0) {
                $data = $query->result_array();
                if (! empty($data)) {
                    for ($i = 0; $i < count($data); $i ++) {
                        $data[$i]['image'] = base_url() . 'uploads/cat_banners_image/cat_banners_' . $data[$i]['cat_id'] . '_' . $data[$i]['id'] . '.jpg';
                    }
                }
                $data['cat_bottom_banners'] = base_url() . 'uploads/category_image/category_' . $target . '.jpg';
            }
            $this->set_response_simple(($data == FALSE) ? FALSE : $data, 'Success..!', REST_Controller::HTTP_OK, TRUE);
        }
    }

    /**
     * To Manage reviews
     *
     * @author Mehar
     *        
     * @param string $type
     */
    public function ratings_post($type = 'r')
    {
        $_POST = json_decode(file_get_contents("php://input"), TRUE);
        if ($type == 'r') {
            $data = $this->rating_model->order_by('id', 'DESC')
                ->fields('id, rating, review, created_at')
                ->with_user('fields: id, first_name, last_name')
                ->where('vendor_id', $this->input->post('vendor_id'))
                ->get_all();
            if (! empty($data)) {
                for ($i = 0; $i < count($data); $i ++) {
                    $data[$i]['user']['image'] = base_url() . 'uploads/profile_image/profile_' . $data[$i]['user_id'] . '.jpg';
                }
            }
            $this->set_response_simple(($data == FALSE) ? FALSE : $data, 'Success..!', REST_Controller::HTTP_OK, TRUE);
        } elseif ($type == 'c') {
            $token_data = $this->validate_token($this->input->get_request_header('X_AUTH_TOKEN'));
            $is_exist = $this->rating_model->where([
                'user_id' => $token_data->id,
                'vendor_id' => $this->input->post('vendor_id')
            ])
                ->get();
            if (! empty($is_exist)) {
                $id = $this->rating_model->delete([
                    'id' => $is_exist['id']
                ]);
            }
            $id = $this->rating_model->insert([
                'user_id' => $token_data->id,
                'vendor_id' => $this->input->post('vendor_id'),
                'rating' => $this->input->post('rating'),
                'review' => $this->input->post('review')
            ]);
            $this->set_response_simple($id, 'Success..!', REST_Controller::HTTP_CREATED, TRUE);
        }
    }

    /**
     * To get detail of wallet
     *
     * @author trupti
     * @param string $target
     */
    public function user_details_get()
    {
        $token_data = $this->validate_token($this->input->get_request_header('X_AUTH_TOKEN'));
        $data = $this->user_model->where($token_data->id)->get();
        $this->set_response_simple(($data == FALSE) ? FALSE : $data, 'Success..!', REST_Controller::HTTP_OK, TRUE);
    }

    /**
     * crud of wishlist
     *
     * @author trupti
     * @param string $target
     */
    public function wishlist_post($method = 'r', $target = NULL)
    {
        $token_data = $this->validate_token($this->input->get_request_header('X_AUTH_TOKEN'));
        $_POST = json_decode(file_get_contents("php://input"), TRUE);
        if ($method == 'c') {
            $this->form_validation->set_rules($this->wishlist_model->rules);
            if ($this->form_validation->run() == false) {
                $this->set_response_simple(validation_errors(), 'Validation Error', REST_Controller::HTTP_NON_AUTHORITATIVE_INFORMATION, FALSE);
            } else {
                $id = $this->wishlist_model->insert([
                    'user_id' => $token_data->id,
                    'list_id' => $this->input->post('list_id')
                ]);

                $this->set_response_simple($id, 'Success..!', REST_Controller::HTTP_CREATED, TRUE);
            }
        } elseif ($method == 'r') {
                $data = $this->user_model->fields('unique_id')->with_wishlist('fields: id, vendor_user_id, name, email, unique_id')->where('id', $token_data->id)->get();
                $data['wishlist'] = array_values($data['wishlist']);
                foreach($data['wishlist'] as $k => $v){
                    $data['wishlist'][$k]['cover'] = base_url()."uploads/list_cover_image/list_cover_". $v['id'].".jpg";
                }
                $this->set_response_simple(($data == FALSE) ? FALSE : $data, 'Success..!', REST_Controller::HTTP_OK, TRUE);
        } elseif ($method == 'u') {
            if (! empty($target)) {
                $_POST = json_decode(file_get_contents("php://input"), TRUE);
                $this->form_validation->set_rules($this->wishlist_model->rules);
                if ($this->form_validation->run() == true) {
                    $this->set_response_simple(validation_errors(), 'Validation Error', REST_Controller::HTTP_NON_AUTHORITATIVE_INFORMATION, FALSE);
                } else {
                    $id = $this->wishlist_model->update([
                        'id' => $target,
                        'user_id' => $token_data->id,
                        'list_id' => $this->input->post('list_id')
                    ], 'id');
                    $this->set_response_simple($id, 'Updated..!', REST_Controller::HTTP_ACCEPTED, TRUE);
                }
            }
        } elseif ($method == 'd') {
            $this->db->where(['user_id'=> $token_data->id, 'list_id' => $this->input->post('list_id')]);
            $data = $this->db->delete('wishlist');
            $this->set_response_simple(($data == FALSE) ? FALSE : $data, 'Deleted..!', REST_Controller::HTTP_OK, TRUE);
        }
    }
}

