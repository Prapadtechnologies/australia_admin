<div class="row">
    <div class="col-md-12" style="">
        <form id="form_site_settings" action="<?php echo base_url('add_sizes_types');?>" method="post" class="needs-validation reset" novalidate="" enctype="multipart/form-data">
            <section class="card">
                <header class="card-header">
                    <div class="card-actions">
                        <a href="#" class="card-action card-action-toggle" data-card-toggle=""></a>
                        <a href="#" class="card-action card-action-dismiss" data-card-dismiss=""></a>
                    </div>
                    <h2 class="card-title ven">Add Sizes</h2>
                </header>
                <div class="card-body">
                    <!-- Size Type -->
                    <div class="form-group row">
                        <label class="col-sm-3">Size Type<span class="required">*</span></label>
                        <div class="col-sm-9">
                            <input type="text" name="sizetype" class="form-control" required="">
                        </div>
                        <div class="invalid-feedback">Size Type?</div>
                        <?php echo form_error('name','<div style="color:red">','</div>');?>
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
