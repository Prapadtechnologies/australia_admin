<?php if($type == 'user_services'){?>

                <!--Edit State -->
                <div class="row">
                    <div class="col-12">
                        <h4 class="ven">Edit Service</h4>
                        <form class="needs-validation" novalidate="" action="<?php echo base_url('user_services/u');?> " method="post" enctype="multipart/form-data">
                            <div class="card-header">
                                <div class="form-row">
                                    <div class="form-group col-md-6">

                                        <label>Service Name</label>
                                        <input type="text" name="name" class="form-control" required="" value="<?php echo $services['name']; ?>">

                                        <div class="invalid-feedback">Enter Valid Service Name?</div>
                                        <input type="hidden" name="id" value="<?php echo $services['id'] ; ?>">
                                   
                                    </div>
                                    
                                    <div class="form-group col-md-6">
                                        <button class="btn btn-primary mt-27 ">Update</button>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                
                <?php } elseif($type == 'category_banner'){?>
                <div class="row">
                    <div class="col-12">
                        <h4 class="ven">Edit Banner</h4>
                        <form class="needs-validation" novalidate="" action="<?php echo base_url('category_banner/u');?> " method="post" enctype="multipart/form-data">
                            <div class="card-header">
                                <div class="form-row">
                                    <div class="form-group col-md-6">

                                          <div class="form-group col-md-6">
                        <label>Upload Image</label>
                        <input type="file" id='input1' name="file" class="form-control" onchange="readURL(this);" value="<?php echo base_url(); ?>uploads/cat_banners_image/cat_banners_<?php echo $category['id']; ?>.jpg">
                        <br><img id="imagepreview1" src="<?php echo base_url(); ?>uploads/cat_banners_image/cat_banners_<?php echo $_GET['cat_id']; ?>_<?php echo $_GET['id'];?>.jpg" style="width: 200px;" />

                        <img id="blah" src="#" alt="" style="width: 200px;" />
						<input type="hidden" name="banner_id" value="<?php echo $_GET['id']; ?>"/>
						<input type="hidden" name="cat_id" value="<?php echo $_GET['cat_id'];?>"/>
                        <div class="invalid-feedback">Upload Image?</div>
                    </div>
                                    <div class="form-group col-md-6">
                                        <button class="btn btn-primary mt-27 ">Update</button>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                
                  <?php }?>