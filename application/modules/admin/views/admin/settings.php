<!-- <div class="container">
    <div class="row">
        <div class="col-md-12">
        <ul class="nav nav-tabs">
  <li class="nav-item">
    <a class="nav-link active" data-toggle="tab" href="#system_settings">System Settings</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" data-toggle="tab" href="#menu1">Menu 1</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" data-toggle="tab" href="#menu2">Menu 2</a>
  </li>
</ul>
<div class="tab-content">
  <div class="tab-pane container active" id="system_settings">
    <form id="form_site_settings" action="<?php echo base_url('settings/site');?>" method="post" class="needs-validation reset" novalidate="" enctype="multipart/form-data">
                <section class="card">
                    <header class="card-header">
                        <div class="card-actions">
                            <a href="#" class="card-action card-action-toggle" data-card-toggle=""></a>
                            <a href="#" class="card-action card-action-dismiss" data-card-dismiss=""></a>
                        </div>
                        <h2 class="card-title">System Settings</h2>
                    </header>
                    <div class="card-body">
                        
                        <div class="form-group row">
                            <label class="col-sm-3 ">System Name<span class="required">*</span></label>
                            <div class="col-sm-9">
                                <input type="text" name="system_name" class="form-control" placeholder="System Name" required="" value="<?php echo $this->setting_model->where('key', 'system_name')->get()['value'];?>">
                            </div>
                            <div class="invalid-feedback">System Name?</div>
                            <?php echo form_error('system_name','<div style="color:red">','</div>');?>
                                <input type="hidden" name="id" value="">
                                <br>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-3 ">System Title <span class="required">*</span></label>
                            <div class="col-sm-9">
                                <input type="text" name="system_title" class="form-control" placeholder="System Title " required="" value="<?php echo $this->setting_model->where('key','system_title')->get()['value'];?>">
                            </div>
                            <div class="invalid-feedback">System Title ?</div>
                            <?php echo form_error('system_title','<div style="color:red">','</div>');?>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-3 ">Mobile Number<span class="required">*</span></label>
                            <div class="col-sm-9">
                                <input type="number" name="mobile" class="form-control" placeholder="Mobile Number" required="" value="<?php echo $this->setting_model->where('key','mobile')->get()['value'];?>">
                            </div>
                            <div class="invalid-feedback">Mobile Number?</div>
                            <?php echo form_error('mobile','<div style="color:red" "margin_left=100px">','</div>');?>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-3 ">Address<span class="required">*</span></label>
                            <div class="col-sm-9 ">
                                <input type="text" class="form-control" style=" height: 70px " name="address" value=" <?php echo $this->setting_model->where('key','address')->get()['value'];?>" >
                               
                            </div>
                            <div class="invalid-feedback">Address?</div>
                            <?php echo form_error('address','<div style="color:red">','</div>');?>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-3 ">Facebook Link</label>
                            <div class="col-sm-9">
                                <input type="text" name="facebook" class="form-control" placeholder="Facebook Link" value="<?php echo $this->setting_model->where('key','facebook')->get()['value'];?>">
                            </div>
                            <div class="invalid-feedback">Facebook Link?</div>
                            <?php echo form_error('facebook','<div style="color:red ">','</div>');?>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-3 ">Twiter Link</label>
                            <div class="col-sm-9">
                                <input type="text" name="twiter" class="form-control" placeholder="Twiter Link" value="<?php echo $this->setting_model->where('key','twiter')->get()['value'];?>">
                            </div>
                            <div class="invalid-feedback">Twiter Link?</div>
                            <?php echo form_error('twiter','<div style="color:red">','</div>');?>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-3 ">Youtube Link</label>
                            <div class="col-sm-9">
                                <input type="text" name="youtube" class="form-control" placeholder="Youtube Link" value="<?php echo $this->setting_model->where('key','youtube')->get()['value'];?>">
                            </div>
                            <div class="invalid-feedback">Youtube Link?</div>
                            <?php echo form_error('youtube','<div style="color:red">','</div>');?>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-3 ">Skype Link</label>
                            <div class="col-sm-9">
                                <input type="text" name="skype" class="form-control" placeholder="Skype Link" value="<?php echo $this->setting_model->where('key','skype')->get()['value'];?>">
                            </div>
                            <div class="invalid-feedback">Skype Link?</div>
                            <?php echo form_error('skype','<div style="color:red">','</div>');?>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-3 ">Pinterest Link</label>
                            <div class="col-sm-9">
                                <input type="text" name="pinterest" class="form-control" placeholder="Pinterest Link"  value="<?php echo $this->setting_model->where('key','pinterest')->get()['value'];?>">
                            </div>
                            <div class="invalid-feedback">Pinterest Link</div>
                            <?php echo form_error('mobile','<div style="color:red">','</div>');?>
                        </div>

                        <div class="row justify-content-end">
                            <div class="col-sm-9">
                                <button class="btn btn-primary">Submit</button>
                                <input type="button" class="btn btn-default" onClick="clear_form('form_site_settings')" value="Reset" />
                            </div>
                        </div>

                    </div>
            
            </section>
            </form></div>
  <div class="tab-pane container fade" id="menu1">...</div>
  <div class="tab-pane container fade" id="menu2">...</div>
</div>
</div>
    </div>
</div> -->
<div class="container">
    <div class="row">
        <div class="col-md-12" style="">
            <form id="form_site_settings" action="<?php echo base_url('settings/site');?>" method="post" class="needs-validation reset" novalidate="" enctype="multipart/form-data">
                <section class="card">
                    <header class="card-header">
                        <div class="card-actions">
                            <a href="#" class="card-action card-action-toggle" data-card-toggle=""></a>
                            <a href="#" class="card-action card-action-dismiss" data-card-dismiss=""></a>
                        </div>
                        <h2 class="card-title ven">System Settings</h2>
                    </header>
                    <div class="card-body">

                        <div class="form-group row">
                            <label class="col-sm-3 ">System Name<span class="required">*</span></label>
                            <div class="col-sm-9">
                                <input type="text" name="system_name" class="form-control" placeholder="System Name" required="" value="<?php echo $this->setting_model->where('key', 'system_name')->get()['value'];?>">
                            </div>
                            <div class="invalid-feedback">System Name?</div>
                            <?php echo form_error('system_name','<div style="color:red">','</div>');?>
                                <input type="hidden" name="id" value="">
                                <br>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-3 ">System Title <span class="required">*</span></label>
                            <div class="col-sm-9">
                                <input type="text" name="system_title" class="form-control" placeholder="System Title " required="" value="<?php echo $this->setting_model->where('key','system_title')->get()['value'];?>">
                            </div>
                            <div class="invalid-feedback">System Title ?</div>
                            <?php echo form_error('system_title','<div style="color:red">','</div>');?>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-3 ">Mobile Number<span class="required">*</span></label>
                            <div class="col-sm-9">
                                <input type="number" name="mobile" class="form-control" placeholder="Mobile Number" required="" value="<?php echo $this->setting_model->where('key','mobile')->get()['value'];?>">
                            </div>
                            <div class="invalid-feedback">Mobile Number?</div>
                            <?php echo form_error('mobile','<div style="color:red" "margin_left=100px">','</div>');?>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-3 ">Address<span class="required">*</span></label>
                            <div class="col-sm-9 ">
                                <input type="text" class="form-control" style=" height: 70px " name="address" value=" <?php echo $this->setting_model->where('key','address')->get()['value'];?>" >
                               
                            </div>
                            <div class="invalid-feedback">Address?</div>
                            <?php echo form_error('address','<div style="color:red">','</div>');?>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-3 ">Facebook Link</label>
                            <div class="col-sm-9">
                                <input type="text" name="facebook" class="form-control" placeholder="Facebook Link" value="<?php echo $this->setting_model->where('key','facebook')->get()['value'];?>">
                            </div>
                            <div class="invalid-feedback">Facebook Link?</div>
                            <?php echo form_error('facebook','<div style="color:red ">','</div>');?>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-3 ">Twiter Link</label>
                            <div class="col-sm-9">
                                <input type="text" name="twiter" class="form-control" placeholder="Twiter Link" value="<?php echo $this->setting_model->where('key','twiter')->get()['value'];?>">
                            </div>
                            <div class="invalid-feedback">Twiter Link?</div>
                            <?php echo form_error('twiter','<div style="color:red">','</div>');?>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-3 ">Youtube Link</label>
                            <div class="col-sm-9">
                                <input type="text" name="youtube" class="form-control" placeholder="Youtube Link" value="<?php echo $this->setting_model->where('key','youtube')->get()['value'];?>">
                            </div>
                            <div class="invalid-feedback">Youtube Link?</div>
                            <?php echo form_error('youtube','<div style="color:red">','</div>');?>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-3 ">Skype Link</label>
                            <div class="col-sm-9">
                                <input type="text" name="skype" class="form-control" placeholder="Skype Link" value="<?php echo $this->setting_model->where('key','skype')->get()['value'];?>">
                            </div>
                            <div class="invalid-feedback">Skype Link?</div>
                            <?php echo form_error('skype','<div style="color:red">','</div>');?>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-3 ">Pinterest Link</label>
                            <div class="col-sm-9">
                                <input type="text" name="pinterest" class="form-control" placeholder="Pinterest Link"  value="<?php echo $this->setting_model->where('key','pinterest')->get()['value'];?>">
                            </div>
                            <div class="invalid-feedback">Pinterest Link</div>
                            <?php echo form_error('mobile','<div style="color:red">','</div>');?>
                        </div>

                        <div class="row justify-content-end">
                            <div class="col-sm-9">
                                <button class="btn btn-primary">Submit</button>
                                <input type="button" class="btn btn-default" onClick="clear_form('form_site_settings')" value="Reset" />
                            </div>
                        </div>

                    </div>
            
            </section>
            </form>
        </div>
        <div class="col-md-6">
            <form id="form_sms" action="<?php echo base_url('settings/sms');?>" class="needs-validation" novalidate="" method="post" enctype="multipart/form-data">
                <section class="card">
                    <header class="card-header">
                        <div class="card-actions">
                            <a href="#" class="card-action card-action-toggle" data-card-toggle=""></a>
                            <a href="#" class="card-action card-action-dismiss" data-card-dismiss=""></a>
                        </div>
                        <h2 class="card-title ven">SMS Settings</h2>
                    </header>
                    <br>
                    <div class="card-body">

                        <div class="form-group row">
                            <label class="col-sm-3 ">Username <span class="required">*</span></label>
                            <div class="col-sm-9">
                                <input type="text" name="sms_username" class="form-control" placeholder="Username" required="" value="<?php echo $this->setting_model->where('key','sms_username')->get()['value'];?>">
                            </div>
                            <div class="invalid-feedback">sms_username?</div>
                            <?php echo form_error('sms_username','<div style="color:red">','</div>');?>
                        </div>
                        <br>
                        <div class="form-group row">
                            <label class="col-sm-3 ">Sender <span class="required">*</span></label>
                            <div class="col-sm-9">
                                <input type="text" name="sms_sender" class="form-control" placeholder="Sender" required="" value="<?php echo $this->setting_model->where('key','sms_sender')->get()['value'];?>">
                            </div>
                            <div class="invalid-feedback">sms_sender?</div>
                            <?php echo form_error('sms_sender','<div style="color:red">','</div>');?>
                        </div>
                        <br>
                        <div class="form-group row">
                            <label class="col-sm-3 ">Hash Key <span class="required">*</span></label>
                            <div class="col-sm-9">
                                <input type="text" name="sms_hash" class="form-control" placeholder="Hash Key" required="" value="<?php echo $this->setting_model->where('key','sms_hash')->get()['value'];?>">
                            </div>
                            <div class="invalid-feedback">Hash Key?</div>
                            <?php echo form_error('sms_hash','<div style="color:red">','</div>');?>
                        </div>

                        <div class="row justify-content-end">
                            <div class="col-sm-9">
                                <button class="btn btn-primary">Submit</button>
                                <input type="button" class="btn btn-default" onClick="clear_form('form_sms')" value="Reset" />
                            </div>
                        </div>
                    </div>
            
            </section>
        </form>
        </div>

        <div class="col-md-6">
            <form id="form-smtp" action="<?php echo base_url('settings/smtp');?>" class="needs-validation form" novalidate="" method="post" enctype="multipart/form-data">
                <section class="card">
                    <header class="card-header">
                        <div class="card-actions">
                            <a href="#" class="card-action card-action-toggle" data-card-toggle=""></a>
                            <a href="#" class="card-action card-action-dismiss" data-card-dismiss=""></a>
                        </div>
                        <h2 class="card-title ven">SMTP Settings</h2>
                    </header>
                    <div class="card-body">
                        <div class="form-group row">
                            <label class="col-sm-3 ">SMTP Port <span class="required">*</span></label>
                            <div class="col-sm-9">
                                <input type="text" name="smtp_port" class="form-control" placeholder="SMTP Port" required="" value="<?php echo $this->setting_model->where('key','smtp_port')->get()['value']?>">
                            </div>
                            <div class="invalid-feedback">smtp_port?</div>
                            <?php echo form_error('smtp_port','<div style="color:red">','</div>');?>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-3 ">SMTP Host<span class="required">*</span></label>
                            <div class="col-sm-9">
                                <input type="text" name="smtp_host" class="form-control" placeholder="SMTP Host" required="" value="<?php echo $this->setting_model->where('key','smtp_host')->get()['value']?>">
                            </div>
                            <div class="invalid-feedback">smtp_host?</div>
                            <?php echo form_error('smtp_host','<div style="color:red">','</div>');?>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-3 ">SMTP Username<span class="required">*</span></label>
                            <div class="col-sm-9">
                                <input type="text" name="smtp_username" class="form-control" placeholder="SMTP Username" required="" value="<?php echo $this->setting_model->where('key','smtp_username')->get()['value']?>">
                            </div>
                            <div class="invalid-feedback">smtp_username?</div>
                            <?php echo form_error('smtp_username','<div style="color:red">','</div>');?>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-3 ">SMTP Password<span class="required">*</span></label>
                            <div class="col-sm-9">
                                <input type="text" name="smtp_password" class="form-control" placeholder="SMTP Password" required="" value="<?php echo $this->setting_model->where('key','smtp_password')->get()['value']?>">
                            </div>
                            <div class="invalid-feedback">smtp_password?</div>
                            <?php echo form_error('smtp_password','<div style="color:red">','</div>');?>
                        </div>

                        <div class="row justify-content-end">
                            <div class="col-sm-9">
                                <button class="btn btn-primary">Submit</button>
                                <input type="button" class="btn btn-default" onClick="clear_form('form-smtp')" value="Reset" />
                            </div>
                        </div>
                    </div>
            
            </section></form>
        </div>
        <div class="col-md-6">
            <form id="form-smtp" action="<?php echo base_url('site_logo/logo');?>" class="needs-validation form" novalidate="" method="post" enctype="multipart/form-data">
                <section class="card">
                    <header class="card-header">
                        <div class="card-actions">
                            <a href="#" class="card-action card-action-toggle" data-card-toggle=""></a>
                            <a href="#" class="card-action card-action-dismiss" data-card-dismiss=""></a>
                        </div>
                        <h2 class="card-title ven">Logo</h2>
                    </header>
                    <div class="card-body">
                        <div class="form-group row">
                            <label class="col-sm-3 ">Logo</label>
                            <div class="col-sm-9">
                            <input type='file' name="file" class="form-control" onchange="news_image(this);" />
                       <?php echo form_error('file', '<div style="color:red">', '</div>');?>
                       <br><br/>
                          <img id="blah" src="<?php echo base_url(); ?>assets/img/logo.png" style="height: 50px;width: 250px;" alt="Logo" />
                        </div>
                    </div>
                        <div class="row justify-content-end">
                            <div class="col-sm-9">
                                <button class="btn btn-primary">Submit</button>
                                <input type="button" class="btn btn-default" onClick="clear_form('form-smtp')" value="Reset" />
                            </div>
                        </div>
                    </div>
            
            </section></form>
        </div>
        <div class="col-md-6">
            <form id="form-smtp" action="<?php echo base_url('site_logo/favicon');?>" class="needs-validation form" novalidate="" method="post" enctype="multipart/form-data">
                <section class="card">
                    <header class="card-header">
                        <div class="card-actions">
                            <a href="#" class="card-action card-action-toggle" data-card-toggle=""></a>
                            <a href="#" class="card-action card-action-dismiss" data-card-dismiss=""></a>
                        </div>
                        <h2 class="card-title ven">Favicon</h2>
                    </header>
                    <div class="card-body">
                        <div class="form-group row">
                            <label class="col-sm-3 ">Favicon</label>
                            <div class="col-sm-9">
                            <input type='file' name="file" class="form-control" onchange="news_image(this);" />
                       <?php echo form_error('file', '<div style="color:red">', '</div>');?>
                       <br><br/>
                          <img id="blah" src="<?php echo base_url(); ?>assets/img/favicon.png" style="height: 30px;width: 30px !important;" alt="Favicon" />
                        </div>
                        </div>
                        <div class="row justify-content-end">
                            <div class="col-sm-9">
                                <button class="btn btn-primary">Submit</button>
                                <input type="button" class="btn btn-default" onClick="clear_form('form-smtp')" value="Reset" />
                            </div>
                        </div>
                    
                    </div>
            
            </section></form>
        </div>
    </div>
    <div class="row">
    	<div class="col-md-12">
            <form id="form-smtp" action="<?php echo base_url('settings/payment');?>" class="needs-validation form" novalidate="" method="post" enctype="multipart/form-data">
                <section class="card">
                    <header class="card-header">
                        <div class="card-actions">
                            <a href="#" class="card-action card-action-toggle" data-card-toggle=""></a>
                            <a href="#" class="card-action card-action-dismiss" data-card-dismiss=""></a>
                        </div>
                        <h2 class="card-title ven">Payment Settings</h2>
                    </header>
                    <div class="card-body">
                        <div class="form-group row">
                            <label class="col-sm-6 ">Pay per referal (in rupees)<span class="required">*</span></label>
                            <div class="col-sm-6">
                                <input type="number" name="pay_per_referal" class="form-control" placeholder="Pay per vendor" required="" value="<?php echo $this->setting_model->where('key','pay_per_referal')->get()['value']?>">
                            </div>
                            <div class="invalid-feedback">Pay per referal?</div>
                            <?php echo form_error('pay_per_referal','<div style="color:red">','</div>');?>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-6 ">Minimum withdraw (in rupees)<span class="required">*</span></label>
                            <div class="col-sm-6">
                                <input type="number" name="min_withdraw" class="form-control" placeholder="Minimum Withdraw Amount" required="" value="<?php echo $this->setting_model->where('key','min_withdraw')->get()['value']?>">
                            </div>
                            <div class="invalid-feedback">Minimum withdraw?</div>
                            <?php echo form_error('min_withdraw','<div style="color:red">','</div>');?>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-6 ">Commission on withdraw (in percentage)<span class="required">*</span></label>
                            <div class="col-sm-6">
                                <input type="number" name="commission_on_withdraw" class="form-control" placeholder="Commission on withdraw" required="" value="<?php echo $this->setting_model->where('key','commission_on_withdraw')->get()['value']?>">
                            </div>
                            <div class="invalid-feedback">Commission on withdraw?</div>
                            <?php echo form_error('commission_on_withdraw','<div style="color:red">','</div>');?>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-6 ">Withdraw days (in days)<span class="required">*</span></label>
                            <div class="col-sm-6">
                                <input type="number" name="withdraw_days" class="form-control" placeholder="Vendor validation count" required="" value="<?php echo $this->setting_model->where('key','withdraw_days')->get()['value']?>">
                            </div>
                            <div class="invalid-feedback">Withdraw days?</div>
                            <?php echo form_error('withdraw_days','<div style="color:red">','</div>');?>
                        </div>

                    <div class="form-group col-md-12">
                        <label>Home Page Description</label> <br/>
                        <?php echo $this->setting_model->where('key','home_page')->get()['value'];?>
                        <textarea class="form-control ckeditor"  name="home_page" data-sample-short placeholder="Home Page Details" required=""><?php echo $this->setting_model->where('key','home_page')->get()['value'];?></textarea>
                    </div>
                        <div class="row justify-content-end">
                            <div class="col-sm-9">
                                <button class="btn btn-primary">Submit</button>
                                <input type="button" class="btn btn-default" onClick="clear_form('form-smtp')" value="Reset" />
                            </div>
                        </div>
                    </div>
            
            </section></form>
        </div>
        <!-- <div class="col-md-6">
            <form id="form-smtp" action="<?php echo base_url('settings/order_payment');?>" class="needs-validation form" novalidate="" method="post" enctype="multipart/form-data">
                <section class="card">
                    <header class="card-header">
                        <div class="card-actions">
                            <a href="#" class="card-action card-action-toggle" data-card-toggle=""></a>
                            <a href="#" class="card-action card-action-dismiss" data-card-dismiss=""></a>
                        </div>
                        <h2 class="card-title ven">Orders Payment Settings</h2>
                    </header>
                    <div class="card-body">
                        <div class="form-group row">
                            <label class="col-sm-3 ">Pay per Order<span class="required">*</span></label>
                            <div class="col-sm-9">
                                <input type="text" name="pay_per_order" class="form-control" placeholder="Pay Per Order" required="" value="<?php echo $this->setting_model->where('key','pay_per_order')->get()['value']?>">
                            </div>
                            <div class="invalid-feedback">Pay Per Order?</div>
                            <?php echo form_error('pay_per_order','<div style="color:red">','</div>');?>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-3 ">Order Validation Count<span class="required">*</span></label>
                            <div class="col-sm-9">
                                <input type="text" name="order_validation" class="form-control" placeholder="Order Validation Count" required="" value="<?php echo $this->setting_model->where('key','order_validation')->get()['value']?>">
                            </div>
                            <div class="invalid-feedback">Order Validation Count?</div>
                            <?php echo form_error('order_validation','<div style="color:red">','</div>');?>
                        </div>

                        <div class="row justify-content-end">
                            <div class="col-sm-9">
                                <button class="btn btn-primary">Submit</button>
                                <input type="button" class="btn btn-default" onClick="clear_form('form-smtp')" value="Reset" />
                            </div>
                        </div>
                    </div>
            
            </section></form>
        </div> -->
        <!--      <div class="col-md-6">
            <form id="form-news" action="<?php echo base_url('settings/news');?>" class="needs-validation form" novalidate="" method="post" enctype="multipart/form-data">
                <section class="card">
                    <header class="card-header">
                        <div class="card-actions">
                            <a href="#" class="card-action card-action-toggle" data-card-toggle=""></a>
                            <a href="#" class="card-action card-action-dismiss" data-card-dismiss=""></a>
                        </div>
                        <h2 class="card-title ven">News Payment Settings</h2>
                    </header>
                    <div class="card-body">
                        <div class="form-group row">
                            <label class="col-sm-3 ">Pay per News<span class="required">*</span></label>
                            <div class="col-sm-9">
                                <input type="text" name="pay_per_news" class="form-control" placeholder="Pay Per News" required="" value="<?php echo $this->setting_model->where('key','pay_per_news')->get()['value']?>">
                            </div>
                            <div class="invalid-feedback">Pay Per Order?</div>
                            <?php echo form_error('pay_per_news','<div style="color:red">','</div>');?>
                        </div>
                        <div class="row justify-content-end">
                            <div class="col-sm-9">
                                <button class="btn btn-primary">Submit</button>
                                <input type="button" class="btn btn-default" onClick="clear_form('form-news')" value="Reset" />
                            </div>
                        </div>
                    </div>
            
            </section></form>
        </div> -->
    </div>
</div>
<style>
    #editor{
  padding: 0.4em 0.4em 0.4em 0;

}
</style>





