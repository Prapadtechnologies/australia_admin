<div class="row">
    <div class="col-md-12" style="">
        <form id="category_id" action="<?php echo base_url('admin/edit_countries?id='.$_GET['id']);?>" method="post" class="needs-validation reset" novalidate="" enctype="multipart/form-data">
            <section class="card">
                <div>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a class="breadcrumb-header" href="<?php echo base_url('/'); ?>">Home</a></li>
                        <li class="breadcrumb-item active" aria-current="page"><a href="<?php echo base_url('/Countries'); ?>" class="breadcrumb-header"> Countries</a></li>
                    </ol>
                </div>
                <header class="card-header">
                    <div class="card-actions">
                        <a href="#" class="card-action card-action-toggle" data-card-toggle=""></a>
                        <a href="#" class="card-action card-action-dismiss" data-card-dismiss=""></a>
                    </div>
                    <h2 class="card-title ven">Edit Countries</h2>
                </header>
                <div class="card-body">

                    <!-- Country Code -->
                    <div class="form-group row">
                        <label class="col-sm-3">Country Code <span class="required">*</span></label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="country_code" name="country_code" value="<?php echo $category['countrycode']; ?>">
                        </div>
                        <div class="invalid-feedback">Country Code?</div>
                        <?php echo form_error('country_code','<div style="color:red">','</div>');?>
                    </div>

                    <!-- Country Name -->
                    <div class="form-group row">
                        <label class="col-sm-3">Country Name <span class="required">*</span></label>
                        <div class="col-sm-9">
                            <?php echo form_error('country_name','<div style="color:red">','</div>');?>
                            <input type="text" class="form-control" id="country_name" name="country_name" value="<?php echo isset($category['countryname']) ? $category['countryname'] : ''; ?>">
                        </div>
                    </div>

                    <!-- Country ISO Code -->
                    <div class="form-group row">
                        <label class="col-sm-3">Code <span class="required">*</span></label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="code" name="code" value="<?php echo $category['code']; ?>">
                        </div>
                        <div class="invalid-feedback">Code?</div>
                        <?php echo form_error('code','<div style="color:red">','</div>');?>
                    </div>




                    <!-- Submit Button -->
                     <div class="row justify-content-end">
                        <div class="col-sm-9">
                            <button class="btn btn-primary">Update</button>
                            
                        </div>
                    </div>

                </div>
            </section>
        </form>
    </div>
</div>
