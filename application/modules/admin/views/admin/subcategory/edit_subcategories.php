<div class="row">
    <div class="col-md-12" style="">
        <form id="category_id" action="<?php echo base_url('admin/edit_subcategories?id='.$_GET['id']);?>" method="post" class="needs-validation reset" novalidate="" enctype="multipart/form-data">
            <section class="card">
                <div>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a class="breadcrumb-header" href="<?php echo base_url('/'); ?>">Home</a></li>
                        <li class="breadcrumb-item active" aria-current="page"><a href="<?php echo base_url('/SubCategories'); ?>" class="breadcrumb-header"> SubCategories</a></li>
                    </ol>
                </div>
                <header class="card-header">
                    <div class="card-actions">
                        <a href="#" class="card-action card-action-toggle" data-card-toggle=""></a>
                        <a href="#" class="card-action card-action-dismiss" data-card-dismiss=""></a>
                    </div>
                    <h2 class="card-title ven">Edit Sub_Categories</h2>
                </header>
                <div class="card-body">
                                        <!-- Category ID -->
                    <div class="form-group row">
                        <label class="col-sm-3">Category ID <span class="required">*</span></label>
                        <div class="col-sm-9">
                            <input type="text" name="category_id" class="form-control" required="" value="<?php echo $category['category_id']; ?>">
                        </div>
                        <div class="invalid-feedback">Category ID?</div>
                        <?php echo form_error('category_id','<div style="color:red">','</div>');?>
                    </div>

                    <!-- Category Name -->
                    <div class="form-group row">
                        <label class="col-sm-3 ">Category Name <span class="required">*</span></label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="category_name" name="category_name" value="<?php echo $category['name']; ?>">
                        </div>
                        <div class="invalid-feedback">Category Name?</div>
                        <?php echo form_error('category_name','<div style="color:red">','</div>');?>
                    </div>

                    <!-- Category Description -->
                    <div class="form-group row">
                        <label class="col-sm-3">Description <span class="required">*</span></label>
                        <div class="col-sm-9">
                            <textarea name="description" class="form-control"><?php echo $category['desc']; ?></textarea>
                        </div>
                        <div class="invalid-feedback">Category Description?</div>
                        <?php echo form_error('description','<div style="color:red">','</div>');?>
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
