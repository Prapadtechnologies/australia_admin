<?php (defined('BASEPATH')) OR exit('No direct script access allowed');

/**
 * Dashboard.php
 *
 * @package     CI-ACL
 * @author      Steve Goodwin
 * @copyright   2015 Plumps Creative Limited
 */
class Payment extends MY_Controller
{
    function __construct()
    {
        parent::__construct();
        $this->template = 'template/admin/main';
        /*$this->load->model('Payment_Model', 'payment', true);
        $this->load->model('Invoice_Model', 'invoice', true);*/
         
         /*$this->config->load('custom');
         $this->load->library("paypal");*/
         //$this->load->library("CCAencrypt");
         
        if (! $this->ion_auth->logged_in())
            redirect('auth/login');

        $this->load->library("paypal");
        $this->load->helper('paytm');
           // $this->load->model('wallet_transaction_model');
    }
    public function index($type='payumoney')
    {
       /* $this->data['users_groups']           =   $this->ion_auth->get_users_groups()->result();
        $this->data['users_permissions']      =   $this->ion_auth_acl->build_acl();
        $this->data['title'] = 'Dashboard';
        $this->data['content'] = 'admin/dashboard';
        $this->_render_page($this->template, $this->data);*/
        $data=array();
                if($type == 'paypal'){
                    
                    $this->paypal($data); 
                    
                }elseif($type == 'stripe'){
                    
                    
                }elseif($type == 'payumoney'){
                    
                    $this->pay_u_money($data);  
                    
                }elseif($type == 'ccavenue'){
                    
                    $this->cc_avenue($data); 
                    
                }elseif($type == 'paytm'){
                    
                    $this->pay_tm($data);  
                    
                }
    }

    /* PayUMoney Payment Start */    
    
    /*****************Function pay_u_money**********************************
    * @type            : Function
    * @function name   : pay_u_money
    * @description     : Payment processing using "Payumoney" payment gateway                  
    *                       
    * @param           : $data array() value
    * @return          : null 
    * ********************************************************** */
    public function pay_u_money($data) {

        /*if ($payment_setting->payumoney_demo == TRUE) {
            $api_link = "https://test.payu.in/_payment";
        } else {
            $api_link = "https://secure.payu.in/_payment";
        }*/
        //$api_link = "https://test.payu.in/_payment";
        $api_link = "https://secure.payu.in/_payment";
        
        $array['key'] = 'GKxskCIe'; 
        $array['salt'] = '06VDIlW31B'; 
        $array['payu_base_url'] = $api_link; // For Test
        $array['surl'] = base_url('accounting/payment/payumoney_success/' . '1');
        $array['furl'] = base_url('accounting/payment/payumoney_failed/' . '1');
        $array['txnid'] = substr(hash('sha256', mt_rand() . microtime()), 0, 20);
        $array['action'] = $api_link;
        $array['amount'] = '1';
        $array['firstname'] = 'mahi';
        $array['email'] = 'mahi';
        $array['phone'] = 'mahi';
        $array['productinfo'] = 'Invoice' . ': ' .'1';
        $array['hash'] = $this->_generate_hash($array);
//die;
        $this->load->view('payment/pay_u_money', $array);
    }

    
    /*****************Function _generate_hash**********************************
    * @type            : Function
    * @function name   : _generate_hash
    * @description     : generate hash id for payumoney peyment processing                  
    *                       
    * @param           : $array array() value
    * @return          : $hash string value
    * ********************************************************** */
    private function _generate_hash($array) {
        
        $hashSequence = "key|txnid|amount|productinfo|firstname|email|udf1|udf2|udf3|udf4|udf5|udf6|udf7|udf8|udf9|udf10";
        if (empty($array['key']) || empty($array['txnid']) || empty($array['amount']) || empty($array['firstname']) || empty($array['email']) || empty($array['phone']) || empty($array['productinfo']) || empty($array['surl']) || empty($array['furl'])) {
            return false;
        } else {
            
            /*
            $hash = '';
            $salt = $array['salt'];
            $hashVarsSeq = explode('|', $hashSequence);
            $hash_string = '';
            foreach ($hashVarsSeq as $hash_var) {
                $hash_string .= isset($array[$hash_var]) ? $array[$hash_var] : '';
                $hash_string .= '|';
            }
            $hash_string .= $salt;
            */
            
            $retHashSeq = $array['key']."|".$array['txnid']."|".$array['amount']."|".$array['productinfo']."|".$array['firstname']."|".$array['email']."|||||||||||".$array['salt'];
            $hash = strtolower(hash('sha512', $retHashSeq));
            return $hash;
        }
    }

    
    /*****************Function payumoney_failed**********************************
    * @type            : Function
    * @function name   : payumoney_failed
    * @description     : payumoney peyment processing failed url                 
    *                    load user interface with payment failed message   
    * @param           : null
    * @return          : null
    * ********************************************************** */
    public function payumoney_failed() {
        echo "failed";die;
        /*$invoice_id = $this->uri->segment(4);
        error($this->lang->line('payment_failed'));
        redirect('accounting/invoice/view/' . $invoice_id);*/
        
    }

    
    /*****************Function payumoney_success**********************************
    * @type            : Function
    * @function name   : payumoney_success
    * @description     : payumoney peyment processing success url                 
    *                    load user interface with payment success message   
    * @param           : null
    * @return          : null
    * ********************************************************** */
    public function payumoney_success() {
        echo "success";die;
        // print_r($_POST); die();
        
        //mail('yousuf361@gmail.com', 'PayUMoney', json_encode($_POST));
        
        $invoice_id = $this->uri->segment(4);
        $invoice = $this->invoice->get_single_invoice($invoice_id);
        $payment_setting   = $this->payment->get_single('payment_settings', array('status'=>1, 'school_id'=>$invoice->school_id));
        
        $status         = $_POST["status"];
        $firstname      = $_POST["firstname"];
        $amount         = $_POST["amount"];
        $txnid          = $_POST["txnid"];
        $posted_hash    = $_POST["hash"];
        $key            = $_POST["key"];
        $productinfo    = $_POST["productinfo"];
        $email          = $_POST["email"];
        $phone          = $_POST["phone"];
        $salt           = $payment_setting->payumoney_salt;
        
        /*
        If (isset($_POST["additionalCharges"])) {
            $additionalCharges = $_POST["additionalCharges"];
            $retHashSeq = $additionalCharges . '|' . $salt . '|' . $status . '|||||||||||' . $email . '|' . $firstname . '|' . $productinfo . '|' . $amount . '|' . $txnid . '|' . $key;
        } else {
            $retHashSeq = $salt . '|' . $status . '|||||||||||' . $email . '|' . $firstname . '|' . $productinfo . '|' . $amount . '|' . $txnid . '|' . $key;
        }*/
       
        $retHashSeq = $key."|".$txnid."|".$amount."|".$productinfo."|".$firstname."|".$email."|||||||||||".$salt;

        $hash = strtolower(hash("sha512", $retHashSeq));
       // mail('yousuf361@gmail.com', 'Hash PayUMoney', $hash);
                     
        if ($status === "success") {                
               
            $payment = $this->payment->get_invoice_amount($invoice_id);  

            $school = $this->payment->get_school_by_id($invoice->school_id);

            $data['school_id'] = $invoice->school_id;
            $data['invoice_id'] = $invoice_id;
            $data['amount'] = $invoice->temp_amount;
            $data['payment_method'] = 'PayUMoney';
            $data['transaction_id'] = $txnid;
            $data['pum_first_name'] = $firstname;
            $data['pum_email'] = $email;
            $data['pum_phone'] = $phone;
            $data['note'] = $productinfo;
            $data['status'] = 1;
            $data['academic_year_id'] = $school->academic_year_id;
            $data['payment_date'] = date('Y-m-d');
            $data['created_at'] = date('Y-m-d H:i:s');
            $data['created_by'] = logged_in_user_id(); 

            $this->payment->insert('transactions', $data);                
            $due_mount = $invoice->net_amount - $payment->paid_amount;

            if(floatval($amount) < floatval($due_mount)){
                $update = array('paid_status'=> 'partial');
            }else{
                $update = array('paid_status'=> 'paid', 'modified_at'=>date('Y-m-d H:i:s'));
            }                    
            $this->payment->update('invoices', $update, array('id'=>$invoice_id));

            success($this->lang->line('payment_success'));
            redirect('accounting/invoice/view/' . $invoice_id);

        } else {
            error($this->lang->line('payment_failed'));
            redirect('accounting/invoice/view/' . $invoice_id);
        }
        
    }
    
    
    public function payumoney_success_bk() {
        
        // print_r($_POST); die();
        
        mail('yousuf361@gmail.com', 'PayUMoney', json_encode($_POST));
        
        $invoice_id = $this->uri->segment(4);
        $invoice = $this->invoice->get_single_invoice($invoice_id);
        $payment_setting   = $this->payment->get_single('payment_settings', array('status'=>1, 'school_id'=>$invoice->school_id));
        
        $status         = $_POST["status"];
        $firstname      = $_POST["firstname"];
        $amount         = $_POST["amount"];
        $txnid          = $_POST["txnid"];
        $posted_hash    = $_POST["hash"];
        $key            = $_POST["key"];
        $productinfo    = $_POST["productinfo"];
        $email          = $_POST["email"];
        $phone          = $_POST["phone"];
        $salt           = $payment_setting->payumoney_salt;
        
        /*
        If (isset($_POST["additionalCharges"])) {
            $additionalCharges = $_POST["additionalCharges"];
            $retHashSeq = $additionalCharges . '|' . $salt . '|' . $status . '|||||||||||' . $email . '|' . $firstname . '|' . $productinfo . '|' . $amount . '|' . $txnid . '|' . $key;
        } else {
            $retHashSeq = $salt . '|' . $status . '|||||||||||' . $email . '|' . $firstname . '|' . $productinfo . '|' . $amount . '|' . $txnid . '|' . $key;
        }*/
       
        $retHashSeq = $key."|".$txnid."|".$amount."|".$productinfo."|".$firstname."|".$email."|||||||||||".$salt;

        $hash = strtolower(hash("sha512", $retHashSeq));
        mail('yousuf361@gmail.com', 'PayUMoney', $hash);
         
        if ($hash != $posted_hash) {
            
            error($this->lang->line('invalid_transaction_pls_try_again'));
            redirect('accounting/invoice/view/' . $invoice_id);
            
        } else {
            
            if ($status === "success") {                
               
                $payment = $this->payment->get_invoice_amount($invoice_id);  
                
                $school = $this->payment->get_school_by_id($invoice->school_id);
                         
                $data['school_id'] = $invoice->school_id;
                $data['invoice_id'] = $invoice_id;
                $data['amount'] = $amount;
                $data['payment_method'] = 'PayUMoney';
                $data['transaction_id'] = $txnid;
                $data['pum_first_name'] = $firstname;
                $data['pum_email'] = $email;
                $data['pum_phone'] = $phone;
                $data['note'] = $productinfo;
                $data['status'] = 1;
                $data['academic_year_id'] = $school->academic_year_id;
                $data['payment_date'] = date('Y-m-d');
                $data['created_at'] = date('Y-m-d H:i:s');
                $data['created_by'] = logged_in_user_id(); 
                
                $this->payment->insert('transactions', $data);                
                $due_mount = $invoice->net_amount - $payment->paid_amount;
                
                if(floatval($amount) < floatval($due_mount)){
                    $update = array('paid_status'=> 'partial');
                }else{
                    $update = array('paid_status'=> 'paid', 'modified_at'=>date('Y-m-d H:i:s'));
                }                    
                $this->payment->update('invoices', $update, array('id'=>$invoice_id));

                success($this->lang->line('payment_success'));
                redirect('accounting/invoice/view/' . $invoice_id);
               
            } else {
                error($this->lang->line('payment_failed'));
                redirect('accounting/invoice/view/' . $invoice_id);
            }
        }
    }
    /* PayUmoney Payment End */


    /* PAY TM Payment Start */    
    
    /*****************Function pay_tm**********************************
    * @type            : Function
    * @function name   : pay_tm
    * @description     : Payment processing using "pay_tm" payment gateway                  
    *                       
    * @param           : $data array() value
    * @return          : null 
    * ********************************************************** */
    public function pay_tm($data) {
  
       /* $payment_setting   = $this->payment->get_single('payment_settings', array('status'=>1, 'school_id'=>$data['school_id']));
        $invoice = $this->invoice->get_single_invoice($data['invoice_id']);
       
        $this->invoice->update('invoices', array('temp_amount'=>$data['amount']), array('id'=>$data['invoice_id']));
        $pay_amount = $data['amount'];
        if($payment_setting->paytm_extra_charge > 0){
            $pay_amount = $data['amount'] + ($payment_setting->paytm_extra_charge/100*$data['amount']);
        }*/
        
        $payment_setting = TRUE;
         if ($payment_setting == TRUE) {
             
            // Key in your staging and production MID available in your dashboard
            define("merchantMid", "rxazcv89315285244163");
            // Key in your staging and production merchant key available in your dashboard
            define("merchantKey", "gKpu7IKaLSbkchFS");
            /*define("mobileNo", $this->session->userdata('phone') ? $this->session->userdata('phone') : '7777777777' );
            define("email", define("email", $this->session->userdata('email') ? $this->session->userdata('email') : 'username@emailprovider.com' )); 
            define("website", "WEBSTAGING");*/
            define("industryTypeId", "Retail");
            $transactionURL = "https://securegw-stage.paytm.in/theia/processTransaction";
            
         }else{
             
            // Key in your staging and production MID available in your dashboard
             define("merchantMid", 'dfdfdfdfdf');
            // Key in your staging and production merchant key available in your dashboard
             define("merchantKey", 'dsdsdsdsds');
             /*define("mobileNo", $this->session->userdata('phone') ? $this->session->userdata('phone') : '7777777777' );
             define("email", define("mobileNo", $this->session->userdata('email') ? $this->session->userdata('email') : 'username@emailprovider.com' ));
             define("website", $payment_setting->paytm_merchant_website);*/
             define("industryTypeId", 'sdsdsd');
             $transactionURL = "https://securegw.paytm.in/theia/processTransaction"; //
            
         }
                
        define("orderId", "ORDS" . time().'1');
        define("channelId", "WEB");
        define("custId", 'CUST'.'1');
        define("txnAmount", '01');
        define("callbackUrl", base_url('accounting/payment/pay_tm_success/' . '1'));
       
     
        $paytmParams = array();
        $paytmParams["MID"] = merchantMid;
        $paytmParams["ORDER_ID"] = orderId;
        $paytmParams["CUST_ID"] = custId;
        $paytmParams["MOBILE_NO"] = '8121815502';
        $paytmParams["EMAIL"] = 'mahi@g.com';
        $paytmParams["CHANNEL_ID"] = channelId;
        $paytmParams["TXN_AMOUNT"] = txnAmount;
        $paytmParams["WEBSITE"] = 'dddd';
        $paytmParams["INDUSTRY_TYPE_ID"] = industryTypeId;
        $paytmParams["CALLBACK_URL"] = callbackUrl;
        $paytmChecksum = getChecksumFromArray($paytmParams, merchantKey);
       
               
        $data['paytmParams'] = $paytmParams;
        $data['paytmChecksum'] = $paytmChecksum;
        $data['transactionURL'] = $transactionURL;
        
        $this->load->view('payment/pay_tm', $data);
    }
    
    
     /*****************Function pay_tm_success**********************************
    * @type            : Function
    * @function name   : pay_tm_success
    * @description     : pay_tm peyment processing success url                
                         load user interface with success message 
     *                   while user succesully pay.   
    * @param           : null
    * @return          : null
    * ********************************************************** */
    public function pay_tm_success(){
        
       // mail('yousuf361@gmail.com', 'PAY TM Return', json_encode($_POST));
        
        $invoice_id = $this->uri->segment(4);
        $invoice = $this->invoice->get_single_invoice($invoice_id);
        $payment = $this->payment->get_invoice_amount($invoice_id);   
        $school = $this->payment->get_school_by_id($invoice->school_id);
        $payment_setting   = $this->payment->get_single('payment_settings', array('status'=>1, 'school_id'=>$invoice->school_id));
        
       
        $paytmParams = array();
        $isValidChecksum = "FALSE";        
        if ($payment_setting->paytm_demo == TRUE) {
            
            $merchantKey = "gKpu7IKaLSbkchFS";
            
        }else{
             $merchantKey = $payment_setting->paytm_merchant_key; 
        }  
       
        $paytmParams = $_POST;        
        $paytmChecksum = isset($_POST["CHECKSUMHASH"]) ? $_POST["CHECKSUMHASH"] : "";
    
        //Verify all parameters received from Paytm pg to your application. Like MID received from paytm pg is same as your application’s MID, TXN_AMOUNT and ORDER_ID are same as what was sent by you to Paytm PG for initiating transaction etc.
         $isValidChecksum = verifychecksum_e($paytmParams, $merchantKey, $paytmChecksum);
        
        if($isValidChecksum == "TRUE") {
            
            if ($_POST["STATUS"] == "TXN_SUCCESS") {
                
                
                $data['school_id'] = $invoice->school_id;
                $data['invoice_id'] = $invoice_id;
                $data['amount'] = $invoice->temp_amount;
                $data['payment_method'] = 'PayTM';
                $data['transaction_id'] = $_POST["TXNID"];            
                $data['note'] = $_POST["RESPMSG"]; 
                $data['status'] = 1;
                $data['academic_year_id'] = $school->academic_year_id;
                $data['payment_date'] = date('Y-m-d');
                $data['created_at'] = date('Y-m-d H:i:s');
                $data['created_by'] = logged_in_user_id(); 

                $this->payment->insert('transactions', $data);                
                $due_mount = $invoice->net_amount - $payment->paid_amount;

                if(floatval($data['amount']) < floatval($due_mount)){
                    $update = array('paid_status'=> 'partial');
                }else{
                    $update = array('paid_status'=> 'paid', 'modified_at'=>date('Y-m-d H:i:s'));
                }                    
                $this->payment->update('invoices', $update, array('id'=>$invoice_id));

                success($this->lang->line('payment_success'));
                redirect('accounting/invoice/view/' . $invoice_id);
                
            }else{
                error($this->lang->line('payment_failed'));
                redirect('accounting/invoice/view/' . $invoice_id); 
            }
        }else{
            error($this->lang->line('payment_failed'));
            redirect('accounting/invoice/view/' . $invoice_id); 
        }
     
    }
    
    
     /*****************Function pay_tm_cancel**********************************
    * @type            : Function
    * @function name   : pay_tm_cancel
    * @description     : pay_tm peyment processing cancel url                
                         load user interface with some cancel message 
     *                   while user cancel pay_tm paymnet 
    * @param           : null
    * @return          : null
    * ********************************************************** */
    public function pay_tm_cancel(){
        $invoice_id = $this->uri->segment(4);
        error($this->lang->line('payment_failed'));
        redirect('accounting/invoice/view/' . $invoice_id);
    }

    /* PAY TM Payment END */  



    /* Paypal payment start */
    
    
    /*****************Function paypal**********************************
    * @type            : Function
    * @function name   : paypal
    * @description     : Payment processing using "Paypal" payment gateway                  
    *                       
    * @param           : $data array() value
    * @return          : null 
    * ********************************************************** */
    public function paypal($data)
    {
       /* $payment_setting   = $this->payment->get_single('payment_settings', array('status'=>1, 'school_id'=>$data['school_id']));
        $invoice = $this->invoice->get_single_invoice($data['invoice_id']);
        
         
        $this->invoice->update('invoices', array('temp_amount'=>$data['amount']), array('id'=>$data['invoice_id']));
        $pay_amount = $data['amount'];
        if($payment_setting->paypal_extra_charge > 0){
            $pay_amount = $data['amount'] + ($payment_setting->paypal_extra_charge/100*$data['amount']);
        }*/
        
        $this->paypal->add_field('rm', 2);
        $this->paypal->add_field('no_note', 0);
        $this->paypal->add_field('item_name', 'Invoice');
        $this->paypal->add_field('amount', '01');
        $this->paypal->add_field('custom', '1');
        $this->paypal->add_field('business', 'mahi@g.com');
        $this->paypal->add_field('tax', 1);
        $this->paypal->add_field('quantity', 1);
        $this->paypal->add_field('currency_code', 'INR');

        $this->paypal->add_field('notify_url', base_url('accounting/gateway/paypal_notify'));
        $this->paypal->add_field('cancel_return', base_url('accounting/payment/paypal_cancel/' . '1'));
        $this->paypal->add_field('return', base_url('accounting/payment/paypal_success/' . '1'));
        
               
        
        if($payment_setting->paypal_demo){
            $this->paypal->paypal_url = 'https://www.sandbox.paypal.com/cgi-bin/webscr';
        } else {
            $this->paypal->paypal_url = 'https://www.paypal.com/cgi-bin/webscr';
        }
        
        $this->paypal->submit_paypal_post();
    }

    /*****************Function paypal_cancel**********************************
    * @type            : Function
    * @function name   : paypal_cancel
    * @description     : paypal peyment processing cancel url                
                         load user interface with some cancel message 
     *                   while user cancel paypal paymnet.   
    * @param           : null
    * @return          : null
    * ********************************************************** */
    public function paypal_cancel(){    
        $invoice_id = $this->uri->segment(4);
        error($this->lang->line('payment_failed'));
        redirect('accounting/invoice/view/' . $invoice_id);
    }

    
    /*****************Function paypal_success**********************************
    * @type            : Function
    * @function name   : paypal_success
    * @description     : paypal peyment processing success url                
                         load user interface with success message 
     *                   while user succesully pay.   
    * @param           : null
    * @return          : null
    * ********************************************************** */
    public function paypal_success(){ 
        $invoice_id = $this->uri->segment(4);
        success($this->lang->line('payment_success'));
        redirect('accounting/invoice/view/' . $invoice_id);
    }
 
    /* Paypal payment end */

}