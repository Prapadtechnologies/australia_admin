<div class="row">
    <div class="col-md-12" style="">
        <form id="form_site_settings" action="<?php echo base_url('add_venue_address');?>" method="post" class="needs-validation reset" novalidate="" enctype="multipart/form-data">
            <section class="card">
                <header class="card-header">
                    <div class="card-actions">
                        <a href="#" class="card-action card-action-toggle" data-card-toggle=""></a>
                        <a href="#" class="card-action card-action-dismiss" data-card-dismiss=""></a>
                    </div>
                    <h2 class="card-title ven">Add VenueAddress</h2>
                </header>
                <div class="card-body">


                    <!-- Name -->
                    <div class="form-group row">
                        <label class="col-sm-3">Name<span class="required">*</span></label>
                        <div class="col-sm-9">
                            <input type="text" name="name" class="form-control" required="">
                        </div>
                        <div class="invalid-feedback">Name?</div>
                        <?php echo form_error('name','<div style="color:red">','</div>');?>
                    </div>

                    <!-- Address Line One -->
                    <div class="form-group row">
                        <label class="col-sm-3">Address Line One<span class="required">*</span></label>
                        <div class="col-sm-9">
                            <input type="text" name="address_line_one" class="form-control" required="">
                        </div>
                        <div class="invalid-feedback">Address Line One?</div>
                        <?php echo form_error('address_line_one','<div style="color:red">','</div>');?>
                    </div>

                    <!-- Address Line Two -->
                    <div class="form-group row">
                        <label class="col-sm-3">Address Line Two</label>
                        <div class="col-sm-9">
                            <input type="text" name="address_line_two" class="form-control">
                        </div>
                    </div>

                    <!-- Capacity -->
                    <div class="form-group row">
                        <label class="col-sm-3">Capacity<span class="required">*</span></label>
                        <div class="col-sm-9">
                            <input type="text" name="capacity" class="form-control" required="">
                        </div>
                        <div class="invalid-feedback">Capacity?</div>
                        <?php echo form_error('capacity','<div style="color:red">','</div>');?>
                    </div>

                    <!-- City -->
                    <div class="form-group row">
                        <label class="col-sm-3">City<span class="required">*</span></label>
                        <div class="col-sm-9">
                            <input type="text" name="city" class="form-control" required="">
                        </div>
                        <div class="invalid-feedback">City?</div>
                        <?php echo form_error('city','<div style="color:red">','</div>');?>
                    </div>

                    <!-- Phone -->
                    <div class="form-group row">
                        <label class="col-sm-3">Phone<span class="required">*</span></label>
                        <div class="col-sm-9">
                            <input type="text" name="phone" class="form-control" required="" maxlength="10">
                        </div>
                        <div class="invalid-feedback">Phone?</div>
                        <?php echo form_error('phone','<div style="color:red">','</div>');?>
                    </div>

                    <!-- State/Province -->
                    <div class="form-group row">
                        <label class="col-sm-3">State/Province</label>
                        <div class="col-sm-9">
                            <input type="text" name="state_province" class="form-control">
                        </div>
                    </div>

                    <!-- Country -->
                    <div class="form-group row">
                        <label class="col-sm-3">Country<span class="required">*</span></label>
                        <div class="col-sm-9">
                            <input type="text" name="country" class="form-control" required="">
                        </div>
                        <div class="invalid-feedback">Country?</div>
                        <?php echo form_error('country','<div style="color:red">','</div>');?>
                    </div>

                    <!-- Postal Code -->
                    <div class="form-group row">
                        <label class="col-sm-3">Postal Code<span class="required">*</span></label>
                        <div class="col-sm-9">
                            <input type="text" name="postal_code" class="form-control" required="">
                        </div>
                        <div class="invalid-feedback">Postal Code?</div>
                        <?php echo form_error('postal_code','<div style="color:red">','</div>');?>
                    </div>
                    <!-- Is Verified -->
                    <div class="form-group row">
                        <label class="col-sm-3">Is Verified<span class="required">*</span></label>
                        <div class="col-sm-9">
                            <select name="is_verified" class="form-control" required="">
                                <option value="1">Yes</option>
                                <option value="0">No</option>
                            </select>
                        </div>
                        <div class="invalid-feedback">Is Verified?</div>
                        <?php echo form_error('is_verified','<div style="color:red">','</div>');?>
                    </div>


                    <!-- Submit Button -->
                    <div class="row justify-content-end">
                        <div class="col-sm-9">
                            <button class="btn btn-primary">Submit</button>
                            
                        </div>
                    </div>

                </div>
            </section>
        </form>
    </div>
</div>
