<?php
if(! function_exists('generate_serial_no')){
    function generate_serial_no($prefix = 'EX', $no_of_zeros = 5, $last_serial_number = 1){
        return $prefix.str_pad($last_serial_number + 1, $no_of_zeros, 0, STR_PAD_LEFT);
    }
}

/****** Send Email ******/
if ( ! function_exists('sendEmail'))
{
    function sendEmail($from = null, $to = null, $sub = null, $msg = null, $reply_to = null, $cc = null, $bcc = null, $attachment = null)
    {//return TRUE;
        
        /*if(!filter_var($from, FILTER_VALIDATE_EMAIL) ) {
            return false;
        }*/
        
        $CI = & get_instance();
        if($msg != "") {
            
            $CI->load->library('email');
            $CI->load->model('setting_model');
            //$CI->email->clear();
            //$smtp_host = $smtp_port = $smtp_user = $smtp_password = $mandrill_api_key = '';
            $smtp_host = $CI->setting_model->where('key','smtp_host')->get()['value'];
            $smtp_port = $CI->setting_model->where('key','smtp_port')->get()['value'];
            $smtp_user = $CI->setting_model->where('key','smtp_username')->get()['value'];
            $smtp_password = $CI->setting_model->where('key','smtp_password')->get()['value'];
            $mandrill_api_key = '';
            
            $config = Array(
                'protocol' 	=> 'smtp',
                'smtp_host' => $smtp_host,
                'smtp_port' => $smtp_port,
                'smtp_user' => $smtp_user,
                'smtp_pass' => $smtp_password,
                'charset' 	=> 'utf-8',
                'mailtype' 	=> 'html',
                'newline' 	=> "\r\n",
                'wordwrap' 	=> TRUE
                );
            
            $CI->email->initialize($config);
            
            $CI->email->from($smtp_user, $CI->config->item('site_settings')->system_name);
            
            $CI->email->to($to);
            
            if($reply_to != "" && filter_var($reply_to, FILTER_VALIDATE_EMAIL))
                $CI->email->reply_to($reply_to);
                if($cc != "" && filter_var($cc, FILTER_VALIDATE_EMAIL))
                    $CI->email->cc($cc);
                    if($bcc != "" && filter_var($bcc, FILTER_VALIDATE_EMAIL))
                        $CI->email->bcc($bcc);
                        
                        if($attachment != "")
                            $CI->email->attach($attachment);
                            
                            $CI->email->subject($sub);
                            $CI->email->message($msg);
                            
                            if( $CI->email->send() )
                                return true;
                                
        }
        return false;
    }
    
}

//Get User Type
if( ! function_exists('getTemplate'))
{
    function getTemplate($user_id='')
    {
        $CI =& get_instance();
        $user_type='';
        $template='';
        if($user_id=='')
        {
            $user_id = getUserRec()->id;
        }
        $user_groups = $CI->ion_auth->get_users_groups($user_id)->result();
        switch($user_groups[0]->id)
        {
            case 1:
                $user_type='admin';
                $template = $user_type.'-template';
                break;
            case 2:
                $user_type='student';
                $template = 'site-template';
                break;
            case 3:
                $user_type='school';
                $template = 'site-template';
                break;
        }
        return $template;
    }
}

/*To print array  or object*/
if( !function_exists('print_array')){
    function print_array($data = []){
        echo "<pre>";print_r($data);exit();
    }
}

/**
 * Check for logged in uyser
 *
 * @access    public
 * @param    string
 * @return    string
 */
if ( ! function_exists('check_access'))
{
    function check_access( $type = 'admin')
    {
        $CI	=&	get_instance();
        
        if (!$CI->ion_auth->logged_in())
        {
            redirect(URL_AUTH_LOGIN, 'refresh');
        }
        elseif($type == 'admin')
        {
            if (!$CI->ion_auth->is_admin())
            {
                prepare_flashmessage('No Entry',2);
                redirect(SITEURL2);
            }
        }
        elseif($type == 'student')
        {
            if (!$CI->ion_auth->is_student())
            {
                prepare_flashmessage('No Entry',2);
                redirect(SITEURL2);
            }
        }
        elseif($type == 'school')
        {
            if (!$CI->ion_auth->is_school())
            {
                prepare_flashmessage('No Entry',2);
                redirect(SITEURL2);
            }
        }
    }
}

/**
 * Prepare message
 *
 */
if ( ! function_exists('prepare_message'))
{
    function prepare_message($msg,$type = 2)
    {
        $returnmsg='';
        switch($type){
            case 0: $returnmsg = " <div class='col-md-12'>
    										<div class='alert alert-success'>
    											<a href='#' class='close' data-dismiss='alert'>&times;</a>
    											<strong>Scuccess..!</strong> ". $msg."
    										</div>
    									</div>";
            break;
            case 1: $returnmsg = " <div class='col-md-12'>
    										<div class='alert alert-danger'>
    											<a href='#' class='close' data-dismiss='alert'>&times;</a>
    											<strong>Error..!</strong> ". $msg."
    										</div>
    									</div>";
            break;
            case 2: $returnmsg = " <div class='col-md-12'>
    										<div class='alert alert-info'>
    											<a href='#' class='close' data-dismiss='alert'>&times;</a>
    											<strong>Info..!</strong> ". $msg."
    										</div>
    									</div>";
            break;
            case 3: $returnmsg = " <div class='col-md-12'>
    										<div class='alert alert-warning'>
    											<a href='#' class='close' data-dismiss='alert'>&times;</a>
    											<strong>Warning..!</strong> ". $msg."
    										</div>
    									</div>";
            break;
        }
        
        return $returnmsg;
    }
}
/**
 * Prepare flash message
 *
 */
if ( ! function_exists('prepare_flashmessage'))
{
    
    function prepare_flashmessage($msg,$type = 2)
    {
        $returnmsg='';
        switch($type){
            case 0: $returnmsg = " <!-- <div class='col-md-12'> -->
										<div class='alert alert-success'>
											<a href='#' class='close' data-dismiss='alert'>&times;</a>
											<strong>Success..!</strong> ". $msg."
										</div>
									<!-- </div> -->";
            break;
            case 1: $returnmsg = " <!-- <div class='col-md-12'> -->
										<div class='alert alert-danger'>
											<a href='#' class='close' data-dismiss='alert'>&times;</a>
											<strong>Error..!</strong> ". $msg."
										</div>
									<!-- </div> -->";
            break;
            case 2: $returnmsg = " <!-- <div class='col-md-12'> -->
										<div class='alert alert-info'>
											<a href='#' class='close' data-dismiss='alert'>&times;</a>
											<strong>Info..!</strong> ". $msg."
										</div>
									<!-- </div> -->";
            break;
            case 3: $returnmsg = " <!-- <div class='col-md-12'> -->
										<div class='alert alert-warning'>
											<a href='#' class='close' data-dismiss='alert'>&times;</a>
											<strong>Warning..!</strong> ". $msg."
										</div>
									<!-- </div> -->";
            break;
        }
        $CI =& get_instance();
        $CI->session->set_flashdata("message",$returnmsg);
    }
}
function float_val($foo)
{
    return number_format($foo, 2, '.', '');
}
function get_transaction_type($type)
{
    if($type == 'referrer'){
        $val='Referance';
    }else if($type == 'order_place'){
        $val='Plan Purchased';
    }else if($type == 'interest'){
        $val='Interest On Plan';
    }else if($type == 'withdrawal'){
        $val='Amount Withdrawal';
    }
    return $val;
}
function locked_amount($id,$wallet_amount='')
{
    $CI =&  get_instance();
    $CI->load->model('wallet_transaction_model');
    //$data = $this->db->where(['id'=> $id])->get('plans')->result();
    $wallet_tr=$CI->wallet_transaction_model->order_by('id', 'DESC')->where(['user_id'=> $id])->get_all();
    $locked_amount=$unlocked_amount=$withdrawal_amount=0.00;
    foreach ($wallet_tr as $wtr) {
        $diff=getdays($wtr['created_at'],date('Y-m-d H:i:s'));
        if($wtr['credit'] >0){
            if($wtr['transaction_type']=='order_place'){
                $data = $CI->db->where(['id'=> $wtr['reference']])->get('plans')->row();
                if($diff <= $data->plan_duration){
                    $locked_amount=$locked_amount+$wtr['credit'];
                }else{
                    $unlocked_amount=$unlocked_amount+$wtr['credit'];
                }    
            }else{
                $unlocked_amount=$unlocked_amount+$wtr['credit'];
            }
        }else{
            $withdrawal_amount=$withdrawal_amount+$wtr['debit'];
        }   
    }
    $result=[
        'wallet_amount'=>$wallet_amount,
        'locked_amount'=>$locked_amount,
        'unlocked_amount'=>$unlocked_amount,
        'withdrawal_amount'=>$withdrawal_amount,
    ];
    //echo $CI->db->last_query();die;
    return $result;
}
function getdays($start_date,$end_date)
{
    $date1 = new DateTime($start_date);
    $date2 = new DateTime($end_date);
    $interval = $date1->diff($date2);
    return $interval->days;
   /* $now = strtotime($end_date); // or your date as well
    $your_date = strtotime($start_date);
    $datediff = $now - $your_date;
    return round($datediff / (60 * 60 * 24));*/
}
