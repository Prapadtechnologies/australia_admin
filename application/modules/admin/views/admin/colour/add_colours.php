<div class="row">
    <div class="col-md-12" style="">
        <!-- <form id="form_site_settings" action="<?php echo base_url('add_colours');?>" method="post" class="needs-validation reset" novalidate="" enctype="multipart/form-data"> -->
            <form id="category_id" action="<?php echo base_url('add_colours');?>" method="post" class="needs-validation reset" novalidate="" enctype="multipart/form-data">
            <section class="card">
                <header class="card-header">
                    <div class="card-actions">
                        <a href="#" class="card-action card-action-toggle" data-card-toggle=""></a>
                        <a href="#" class="card-action card-action-dismiss" data-card-dismiss=""></a>
                    </div>
                    <h2 class="card-title ven">Add Colours</h2>
                </header>
                <div class="card-body">
                    <!-- Color Name -->
                    <div class="form-group row">
                        <label class="col-sm-3">Color Name <span class="required">*</span></label>
                        <div class="col-sm-9">
                            <input type="text" name="colorname" class="form-control" required="">
                        </div>
                        <div class="invalid-feedback">Color Name?</div>
                        <?php echo form_error('color_name','<div style="color:red">','</div>');?>
                    </div>

                    <!-- Color Code -->
                    <div class="form-group row">
                        <label class="col-sm-3">Color Code <span class="required">*</span></label>
                        <div class="col-sm-9">
                            <input type="text" name="colorcode" class="form-control" required="">
                        </div>
                        <div class="invalid-feedback">Color Code?</div>
                        <?php echo form_error('color_code','<div style="color:red">','</div>');?>
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
