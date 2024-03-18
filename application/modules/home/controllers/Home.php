<?php
class Home extends MY_Controller
{

    function __construct()
    {
        parent::__construct();
        $this->template = 'template/home/main';

    }
    public function index($type = 'r')
    {
        if ($type == 'r') {
                $this->data['title'] = 'Promo Codes';
                $this->data['content'] = 'home/home';
                $this->data['type'] = 'home';
                $this->_render_page($this->template, $this->data);
            }
    }
    
}