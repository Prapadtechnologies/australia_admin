<?php
$vendor_id='all';
if($this->ion_auth->is_admin() && (isset($_GET['vendor']) && !empty($_GET['vendor']))){
    $vendor_id=$_GET['vendor'];
}elseif(!$this->ion_auth->is_admin()){
    $vendor_id=$this->ion_auth->get_user_id();
}

if($vendor_id != 'all'){
    $data=$this->db->get_where('food_settings',array('vendor_id'=>$vendor_id))->row_array();
}

?>

<div class="container">
    <div class="row">
        <div class="col-md-12" style="">
            <form id="form_site_settings" action="<?php echo base_url('vendor_settings/food');?>" method="post" class="needs-validation reset" novalidate="" enctype="multipart/form-data">
                <section class="card">
                    <header class="card-header">
                        <div class="card-actions">
                            <a href="#" class="card-action card-action-toggle" data-card-toggle=""></a>
                            <a href="#" class="card-action card-action-dismiss" data-card-dismiss=""></a>
                        </div>
                        <h2 class="card-title ven">Vendor Settings</h2>
                    </header>
                    <div class="card-body">
                        <?php
                        if($this->ion_auth->is_admin()){
                        ?>
                        <div class="form-group row">
                            <label class="col-sm-3">Category</label>
                            <div class="col-sm-9">
                                <select class="form-control" name="vendor_id" onchange="get_vendors(this.value)">
                                    <option value="">Select Category</option>
                                    <?php
                                    foreach ($categories as $row) {
                                        ?>
                                        <option value="<?=$row['id'];?>" <?=((isset($_GET['category_id']) && ($_GET['category_id'] == $row['id']))? 'selected' : '');?>><?=$row['name'];?></option>
                                        <?php
                                    }
                                    ?>
                                </select>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-3">Vendor</label>
                            <div class="col-sm-9">
                                <select class="form-control" name="vendor_id" onchange="get_vendor_details(this.value)">
                                    <option value="">Select Vendor</option>
                                    <option value="all" <?=(($vendor_id == 'all')? 'selected' : '');?>>All Vendors</option>
                                    <?php
                                    foreach ($vendors as $row) {
                                        ?>
                                        <option value="<?=$row['vendor_user_id'];?>" <?=(($vendor_id == $row['vendor_user_id'])? 'selected' : '');?>><?=$row['name'];?></option>
                                        <?php
                                    }
                                    ?>
                                </select>
                            </div>
                        </div>
                    <?php }else{?>
                        <input type="hidden" name="vendor_id" value="<?=$this->ion_auth->get_user_id();?>">
                    <?php }?>
                        <div class="form-group row">
                            <label class="col-sm-3">Min Order Price<span class="required">*</span></label>
                            <div class="col-sm-9">
                                <input type="number" class="form-control" name="min_order_price" placeholder="Min Order Price" required="" min="1" value="<?php if($vendor_id != 'all'){echo $data['min_order_price'];}else{echo $this->vendor_settings_model->where('key', 'min_order_price')->get()['value'];}?>">
                            </div>
                            <div class="invalid-feedback">Min Order Price ?</div>
                            <?php echo form_error('min_order_price','<div style="color:red">','</div>');?>
                                <input type="hidden" name="id" value="">
                                <br>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-3 ">Delivery Free Range (Km) <span class="required">*</span></label>
                            <div class="col-sm-9">
                                <input type="number" class="form-control" name="delivery_free_range" placeholder="Delivery Free Range (Km)" required="" min="0" value="<?php if($vendor_id != 'all'){echo $data['delivery_free_range'];}else{echo $this->vendor_settings_model->where('key','delivery_free_range')->get()['value'];}?>">
                            </div>
                            <div class="invalid-feedback">Delivery Free Range (Km) ?</div>
                            <?php echo form_error('delivery_free_range','<div style="color:red">','</div>');?>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-3 ">Min Delivery Fee<span class="required">*</span></label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" name="min_delivery_fee" placeholder="Min Delivery Feee" required="" value="<?php if($vendor_id != 'all'){echo $data['min_delivery_fee'];}else{echo $this->vendor_settings_model->where('key','min_delivery_fee')->get()['value'];}?>">
                            </div>
                            <div class="invalid-feedback">Min Delivery Fee ?</div>
                            <?php echo form_error('min_delivery_fee','<div style="color:red" "margin_left=100px">','</div>');?>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-3 ">Extra Delivery Fee (per km)<span class="required">*</span></label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" name="ext_delivery_fee" placeholder="Min Delivery Feee" required="" value="<?php if($vendor_id != 'all'){echo $data['ext_delivery_fee'];}else{echo $this->vendor_settings_model->where('key','ext_delivery_fee')->get()['value'];}?>">
                            </div>
                            <div class="invalid-feedback">Extra Delivery Fee (per km) ?</div>
                            <?php echo form_error('ext_delivery_fee','<div style="color:red" "margin_left=100px">','</div>');?>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-3 ">Tax (in %)</label>
                            <div class="col-sm-9">
                                <input type="number" required="" class="form-control" name="tax" placeholder="Tax" value="<?php if($vendor_id != 'all'){echo $data['tax'];}else{echo $this->vendor_settings_model->where('key','tax')->get()['value'];}?>" min="0">
                            </div>
                            <div class="invalid-feedback">Tax ?</div>
                            <?php echo form_error('tax','<div style="color:red" "margin_left=100px">','</div>');?>
                        </div>
                        <?php
                        if($this->ion_auth->is_admin() && $vendor_id != 'all'){
                        ?>
                        <div class="form-group row">
                            <label class="col-sm-3 ">Vendor Label</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" name="label" placeholder="Label" value="<?php if($vendor_id != 'all'){echo $data['label'];}?>">
                            </div>
                            <div class="invalid-feedback">Vendor Label ?</div>
                            <?php echo form_error('label','<div style="color:red" "margin_left=100px">','</div>');?>
                        </div>
                        <?php }elseif(!$this->ion_auth->is_admin()){?>
                        <input type="hidden" name="label" value="<?=$this->ion_auth->get_user_id();?>">
                    <?php }?>
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
        <?php
        if($this->ion_auth->is_admin()){
        ?>
        <!-- <div class="col-md-12" style="">
            <form id="form_site_settings" action="<?php echo base_url('vendor_settings/food_item_label');?>" method="post" class="needs-validation reset" novalidate="" enctype="multipart/form-data">
                <section class="card">
                    <header class="card-header">
                        <div class="card-actions">
                            <a href="#" class="card-action card-action-toggle" data-card-toggle=""></a>
                            <a href="#" class="card-action card-action-dismiss" data-card-dismiss=""></a>
                        </div>
                        <h2 class="card-title ven">Items Label</h2>
                    </header>
                    <div class="card-body">
                        <div class="form-group row">
                            <label class="col-sm-3">Category</label>
                            <div class="col-sm-9">
                                <select class="form-control" name="vendor_id" onchange="get_vendors(this.value)">
                                    <option value="">Select Category</option>
                                    <?php
                                    foreach ($categories as $row) {
                                        ?>
                                        <option value="<?=$row['id'];?>" <?=((isset($_GET['category_id']) && ($_GET['category_id'] == $row['id']))? 'selected' : '');?>><?=$row['name'];?></option>
                                        <?php
                                    }
                                    ?>
                                </select>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-3">Vendor</label>
                            <div class="col-sm-9">
                                <select class="form-control" name="vendor_id" onchange="get_menus_by_v(this.value);" required="">
                                    <option value="">Select Vendor</option>
                                    <?php
                                    foreach ($vendors as $row) {
                                        ?>
                                        <option value="<?=$row['vendor_user_id'];?>"><?=$row['name'];?></option>
                                        <?php
                                    }
                                    ?>
                                </select>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-3">Menus</label>
                            <div class="col-sm-9">
                                <select class="form-control" name="menu_id" id="menus_list" onchange="get_sub_item(this.value)" required="">
                                    <option value="">Select Menu</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-3">Items</label>
                            <div class="col-sm-9">
                            <select class="form-control" name="item_id"  id="sub_items" required="">
                                    <option value="">Select Items</option>
                                </select>
                            </div>
                            <div class="invalid-feedback">Item?</div>
                            <?php echo form_error('item_id','<div style="color:red" "margin_left=100px">','</div>');?>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-3 ">Item Label</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" name="label" placeholder="Label" value="" required="">
                            </div>
                            <div class="invalid-feedback">Item Label ?</div>
                            <?php echo form_error('label','<div style="color:red" "margin_left=100px">','</div>');?>
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
        </div> -->
    <?php }?>
    </div>
</div>
<style>
    #editor{
  padding: 0.4em 0.4em 0.4em 0;

}
</style>





<script type="text/javascript">
    function get_sub_item(item_id) {
         $.ajax({
            url: '<?php echo base_url();?>food/get_sub_item_list/' + item_id ,
            type: 'get',
            success: function(response)
            {
                $('#sub_items').html(response);
            }
        });
    }
    function get_menus_by_v(vendor_id) {
         $.ajax({
            url: '<?php echo base_url();?>food/get_food_menus/' + vendor_id ,
            type: 'get',
            success: function(response)
            {
                $('#menus_list').html(response);
            }
        });
    }

    function get_vendor_details(vendor_id) {
        var cat_id = '<?=$_GET['category_id'];?>'
        window.location.href = '<?php echo base_url('vendor_settings/r');?>?category_id='+cat_id+'&vendor='+vendor_id;
    }
    function get_vendors(cat_id) {
        window.location.href = '<?php echo base_url('vendor_settings/r');?>?category_id='+cat_id;
    }
</script>