<div class="row">
    <div class="col-12">
        <form id="category_id" action="<?php echo base_url('edit_currency?id='.$_GET['id']);?>" method="post" class="needs-validation reset" novalidate="" enctype="multipart/form-data">           
            <section class="card" >
                <div>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a class="breadcrumb-header" href="<?php echo base_url('/'); ?>">Home</a></li>
                        <li class="breadcrumb-item active" aria-current="page"><a href="<?php echo base_url('/Currency'); ?>" class="breadcrumb-header"> Currency</a></li>
                    </ol>
                </div>
                <header class="card-header">
                    <div class="card-actions">
                        <a href="#" class="card-action card-action-toggle" data-card-toggle=""></a>
                        <a href="#" class="card-action card-action-dismiss" data-card-dismiss=""></a>
                    </div>
                    <h2 class="card-title ven">Edit Currency </h2>
                </header>
                <div class="card-body">
                    <!-- Name -->
                    <div class="form-group row">
                        <label class="col-sm-3">Name <span class="required">*</span></label>
                        <div class="col-sm-9">
                            <input type="text" id="name" name="name" class="form-control"  value="<?php echo $category['name']; ?>"> 
                        </div>
                        <div class="invalid-feedback">Name?</div>
                        <?php echo form_error('name','<div style="color:red">','</div>');?>
                    </div>

                    <!-- Code -->
                    <div class="form-group row">
                        <label class="col-sm-3">Code <span class="required">*</span></label>
                        <div class="col-sm-9">
                            <input type="text" id="code" name="code" class="form-control"  value="<?php echo $category['code']; ?>">
                        </div>
                        <div class="invalid-feedback">Code?</div>
                        <?php echo form_error('code','<div style="color:red">','</div>');?>
                    </div>


                    <!-- Symbol -->
                    <div class="form-group row">
                        <label class="col-sm-3">Symbol <span class="required">*</span></label>
                        <div class="col-sm-9">
                            <input type="text" id="symbol" name="symbol" class="form-control" value="<?php echo $category['symbol']; ?>">
                        </div>
                        <div class="invalid-feedback">Symbol?</div>
                        <?php echo form_error('symbol','<div style="color:red">','</div>');?>
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
