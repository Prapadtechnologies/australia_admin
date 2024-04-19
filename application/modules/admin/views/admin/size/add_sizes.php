<div class="row">
    <div class="col-md-12" style="">
        <form id="form_site_settings" action="<?php echo base_url('add_sizes');?>" method="post" class="needs-validation reset" novalidate="" enctype="multipart/form-data">
            <section class="card">
                <div>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a class="breadcrumb-header" href="<?php echo base_url('/'); ?>">Home</a></li>
                        <li class="breadcrumb-item active" aria-current="page"><a href="<?php echo base_url('/Sizes'); ?>" class="breadcrumb-header"> Sizes</a></li>
                    </ol>
                </div>
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
                        <label class="col-sm-3">Choose Size Type:</label>
                        <div class="col-sm-9">
                            <select class="form-control" name="sizetype" required="">
                                <option value="">-- Select Size Type --</option>
                                <?php foreach ($sizestypes as $sizetype) { ?>
                                    <option value="<?php echo $sizetype['id']; ?>"><?php echo $sizetype['size_type']; ?></option>
                                <?php } ?>
                            </select>
                            <div class="invalid-feedback">Please select a size type.</div>
                            <?php echo form_error('sizetype', '<div style="color:red">', '</div>'); ?>
                        </div>
                    </div>



                    <!-- Size Name -->
                    <div class="form-group row">
                        <label class="col-sm-3">Size Name<span class="required">*</span></label>
                        <div class="col-sm-9">
                            <input type="text" name="sizename" class="form-control" required="">
                            <div class="invalid-feedback">Please enter the size name.</div>
                        </div>
                        <?php echo form_error('sizename','<div style="color:red">','</div>');?>
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
