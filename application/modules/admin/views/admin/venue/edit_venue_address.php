<div class="row">
<div class="col-md-12" style="">
   <form id="category_id" action="<?php echo base_url('edit_venue_address?id=' . $_GET['id']); ?>" method="post" class="needs-validation reset" novalidate="" enctype="multipart/form-data">
      <section class="card-section">
         <header class="card-header">
            <div class="card-actions">
               <a href="#" class="card-action card-action-toggle" data-card-toggle=""></a>
               <a href="#" class="card-action card-action-dismiss" data-card-dismiss=""></a>
            </div>
            <h2 class="card-title ven">Edit VenueAddress</h2>
         </header>
         <div class="card-body">
            <!-- Name -->
            <div class="form-group row">
               <label class="col-sm-3" for="name">Name<span class="required">*</span></label>
               <div class="col-sm-9">
                  <input type="text" id="name" name="name" class="form-control" required="" value="<?php echo $category['name']; ?>">
               </div>
               <div class="invalid-feedback">Name?</div>
               <?php echo form_error('name', '<div style="color:red">', '</div>'); ?>
            </div>
            <!-- Address Line One -->
            <div class="form-group row">
               <label class="col-sm-3" for="address_line_one">Address Line One<span class="required">*</span></label>
               <div class="col-sm-9">
                  <input type="text" id="address_line_one" name="address_line_one" class="form-control" required="" value="<?php echo $category['addressLineOne']; ?>">
               </div>
               <div class="invalid-feedback">Address Line One?</div>
               <?php echo form_error('address_line_one', '<div style="color:red">', '</div>'); ?>
            </div>
            <!-- Address Line Two -->
            <div class="form-group row">
               <label class="col-sm-3" for="address_line_two">Address Line Two</label>
               <div class="col-sm-9">
                  <input type="text" id="address_line_two" name="address_line_two" class="form-control" value="<?php echo $category['addressLineTwo']; ?>">
               </div>
            </div>
            <!-- Capacity -->
            <div class="form-group row">
               <label class="col-sm-3" for="capacity">Capacity<span class="required">*</span></label>
               <div class="col-sm-9">
                  <input type="text" id="capacity" name="capacity" class="form-control" required="" value="<?php echo $category['capacity']; ?>">
               </div>
               <div class="invalid-feedback">Capacity?</div>
               <?php echo form_error('capacity', '<div style="color:red">', '</div>'); ?>
            </div>
            <!-- City -->
            <div class="form-group row">
               <label class="col-sm-3" for="city">City<span class="required">*</span></label>
               <div class="col-sm-9">
                  <input type="text" id="city" name="city" class="form-control" required="" value="<?php echo $category['city']; ?>">
               </div>
               <div class="invalid-feedback">City?</div>
               <?php echo form_error('city', '<div style="color:red">', '</div>'); ?>
            </div>
            <!-- Phone -->
            <div class="form-group row">
               <label class="col-sm-3" for="phone">Phone<span class="required">*</span></label>
               <div class="col-sm-9">
                  <input type="text" id="phone" name="phone" class="form-control" required="" value="<?php echo $category['phone']; ?>">
               </div>
               <div class="invalid-feedback">Phone?</div>
               <?php echo form_error('phone', '<div style="color:red">', '</div>'); ?>
            </div>
            <!-- State/Province -->
            <div class="form-group row">
               <label class="col-sm-3" for="state_province">State/Province</label>
               <div class="col-sm-9">
                  <input type="text" id="state_province" name="state_province" class="form-control" value="<?php echo $category['stateProvince']; ?>">
               </div>
            </div>
            <!-- Country -->
            <div class="form-group row">
               <label class="col-sm-3" for="country">Country<span class="required">*</span></label>
               <div class="col-sm-9">
                  <input type="text" id="country" name="country" class="form-control" required="" value="<?php echo $category['country']; ?>">
               </div>
               <div class="invalid-feedback">Country?</div>
               <?php echo form_error('country', '<div style="color:red">', '</div>'); ?>
            </div>
            <!-- Postal Code -->
            <div class="form-group row">
               <label class="col-sm-3" for="postal_code">Postal Code<span class="required">*</span></label>
               <div class="col-sm-9">
                  <input type="text" id="postal_code" name="postal_code" class="form-control" required="" value="<?php echo $category['postalCode']; ?>">
               </div>
               <div class="invalid-feedback">Postal Code?</div>
               <?php echo form_error('postal_code', '<div style="color:red">', '</div>'); ?>
            </div>
            <!-- Is Verified -->
            <div class="form-group row">
               <label class="col-sm-3" for="is_verified">Is Verified<span class="required">*</span></label>
               <div class="col-sm-9">
                  <select name="is_verified" id="is_verified" class="form-control" required="" >
                     <option value="1">Yes</option>
                     <option value="0">No</option>
                  </select>
               </div>
               <div class="invalid-feedback">Is Verified?</div>
               <?php echo form_error('is_verified', '<div style="color:red">', '</div>'); ?>
            </div>
            <!-- Submit Button -->
            <div class="row justify-content-end">
               <div class="col-sm-9">
                  <button class="btn btn-primary">update</button>
               </div>
            </div>
         </div>
      </section>
   </form>
</div>