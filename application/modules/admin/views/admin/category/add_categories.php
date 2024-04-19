<div class="row">
    <div class="col-md-12" style="">
        <form id="form_site_settings" action="<?php echo base_url('add_categories');?>" method="post" class="needs-validation reset" novalidate="" enctype="multipart/form-data">
            <section class="card">
                <div>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a class="breadcrumb-header" href="<?php echo base_url('/'); ?>">Home</a></li>
                        <li class="breadcrumb-item active" aria-current="page"><a href="<?php echo base_url('/Categories'); ?>" class="breadcrumb-header"> Categories</a></li>
                    </ol>
                </div>
                <header class="card-header">
                    <div class="card-actions">
                        <a href="#" class="card-action card-action-toggle" data-card-toggle=""></a>
                        <a href="#" class="card-action card-action-dismiss" data-card-dismiss=""></a>
                    </div>
                    <h2 class="card-title ven">Add Categories</h2>
                    <!--                 <div class="col-sm-10">
                    <a href="<?php echo base_url('/Categories'); ?>" class="btn btn-info float-right">Categories</a>
                </div> -->
                </header>

                <div class="card-body">
                    <!-- Category Name -->
                    <div class="form-group row">
                        <label class="col-sm-3">Category Name <span class="required">*</span></label>
                        <div class="col-sm-9">
                            <input type="text" name="category_name" class="form-control" required />
                            <div class="invalid-feedback">Please enter a category name.</div>
                        </div>
                    </div>

                    <!-- Category Description -->
                    <div class="form-group row">
                        <label class="col-sm-3">Description <span class="required">*</span></label>
                        <div class="col-sm-9">
                            <textarea name="description" class="form-control" required></textarea>
                            <div class="invalid-feedback">Please enter a description.</div>
                        </div>
                    </div>

                    <!-- Terms and Conditions -->
                    <div class="form-group row">
                        <label class="col-sm-3">Terms and Conditions <span class="required">*</span></label>
                        <div class="col-sm-9">
                            <textarea name="terms_conditions" class="form-control" required></textarea>
                            <div class="invalid-feedback">Please enter terms and conditions.</div>
                        </div>
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
