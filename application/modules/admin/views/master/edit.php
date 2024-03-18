
<?php if($type == 'category'){?>

    <!--Edit Category -->
    <div class="row">
    <div class="col-12">
        <h4 class="ven">Edit Category</h4>
        <form class="needs-validation" novalidate="" action="<?php echo base_url('category/u');?>" method="post" enctype="multipart/form-data">
            <div class="card-header">

                <div class="form-group row">
                    <div class="form-group col-md-4">
                        <label>Category Name</label>
                        <input type="text" name="name" class="form-control" required="" value="<?php echo $category['name'];?>">
                        <div class="invalid-feedback">Enter Valid Category Name?</div>
                    </div>
                    <input type="hidden" name="id" value="<?php echo $category['id'] ; ?>">

                    <div class="form-group col-md-4">
                        <label>Description</label>
                        <input type="text" name="desc" class="form-control" required="" value="<?php echo $category['desc'];?>">
                        <div class="invalid-feedback">Give some Description</div>
                    </div>
                    <div class="form-group col-md-4">
                        <label>Upload Image</label>
                        <input type="file" id='input1' name="file" class="form-control" onchange="readURL(this);" value="<?php echo base_url(); ?>uploads/category_image/category_<?php echo $category['id']; ?>.jpg" >
                        <br>
                        <img id="blah" src="<?php echo base_url(); ?>uploads/category_image/category_<?php echo $category['id']; ?>.jpg?<?php echo time();?>" style="width: 200px;" />

                        <div class="invalid-feedback">Upload Image?</div>
                    </div>
                    <div class="form-group col-md-4">
                        <label>Coming Soon Image</label>
                        <input type="file" id='input1' name="coming_soon_file" class="form-control" onchange="readURL(this);" value="<?php echo base_url(); ?>uploads/coming_soon_image/coming_soon_<?php echo $category['id']; ?>.jpg" >
                        <br>
                        <img id="blah" src="<?php echo base_url(); ?>uploads/coming_soon_image/coming_soon_<?php echo $category['id']; ?>.jpg?<?php echo time();?>" style="width: 200px;" />

                        <div class="invalid-feedback">Upload Image?</div>
                    </div>
                    <div class="form-group col-md-4">
                        <label>Services</label>
                        <!-- <input type="file" class="form-control" required="">-->
                        <select id="services_multiselect" class="form-control " name="service_id[]" required="" multiple>
                            <?php foreach ($services as $service): ?>
                                <option value="<?php echo $service['id'];?>" <?php echo (is_array($categories[ 'services']) && in_array($service[ 'id'],array_column($categories[ 'services'], 'id')))? 'selected': '';?>>
                                    <?php echo $service['name']?>
                                </option>
                                <?php endforeach;?>
                        </select>
                        <div class="invalid-feedback">Select Category Name?</div>
                    </div>
                    
                    <div class="form-group col-md-4">
                        <label>Brands</label>
                        <!-- <input type="file" class="form-control" required="">-->
                        <select id="brands_multiselect" class="form-control" name="brand_id[]"  multiple>
                            <?php foreach ($brands as $brand): ?>
                                <option value="<?php echo $brand['id'];?>" <?php echo (is_array($categories[ 'brands']) && in_array($brand[ 'id'],array_column($categories[ 'brands'], 'id')))? 'selected': '';?>>
                                    <?php echo $brand['name']?>
                                </option>
                                <?php endforeach;?>
                        </select>
                        <div class="invalid-feedback">Select Category Name?</div>
                    </div>

                    

                    <div class="col-12 col-sm-12 col-md-12 ven2">
                        <label>Terms And Conditions</label>
                        <textarea id="cat_terms"  class="ckeditor" name="terms" rows="10" data-sample-short>
                            <?php echo $category['terms'];?>
                        </textarea>
                        <?php echo form_error('terms', '<div style="color:red">', '</div>');?>
                    </div>
                    <div class="form-group col-md-12 mt-4">
                        <!--                             <button type="submit" name="upload" id="upload" value="Apply" class="btn btn-primary mt-27 ">Update</button> -->
                        <button class="btn btn-primary mt-27 ">Update</button>

                    </div>
                </div>
            </div>

        </form>
    </div>
</div>
<?php
if(isset($_GET['mode']) && $_GET['mode']=='developer'){
    ?>
    <div class="row">
    <div class="col-12">
        <h4 class="ven">Manage <?=$categories['name'];?> Category Account</h4>
        <form class="needs-validation" novalidate="" action="<?php echo base_url('category/m');?>" method="post" enctype="multipart/form-data">
            <div class="card-header">

                <div class="form-group row">
                    <?php
                    $manage=$this->db->get_where('manage_account',array('status'=>1))->result_array();
                    $cat_name=$this->db->get_where('manage_account_names',array('status'=>1,'category_id'=>$categories['id']))->result_array();
                    $i=0;foreach ($manage as $ma) {
                    ?>
                    <div class="form-group col-md-4">
                        <label><?=$ma['name'];?></label>
                        <input type="text" name="<?=$ma['desc'];?>" class="form-control"  value="<?=$cat_name[$i]['name'];?>">
                        <div class="invalid-feedback">Enter <?=$ma['name'];?>?</div>
                    </div>
                    
                    <div class="form-group col-md-8">
                        <?php if($ma['field_status']!=''){?>
                        <label>Check</label>
                        <div  class="form-control">
                            <?php
                            $che=explode('/',$ma['field_status']);
                            for ($f=0; $f <count($che) ; $f++) { 
                                $fa=explode('-', $che[$f]);
                            ?>
                        <label><input type="radio" name="r<?=$ma['desc'];?>" class="" required="" value="<?=$fa[0];?>"  <?=($fa[0] == $cat_name[$i]['field_status'] || $cat_name[$i]['field_status']=='')? 'checked' : '';?>><?=$fa[1];?>&nbsp;&nbsp;&nbsp;</label>
                    <?php }?>
                        </div>
                        <div class="invalid-feedback">Select <?=$ma['name'];?>?</div>
                        <?php }?>
                    </div>
                
                <?php $i++;}?>
                <input type="hidden" name="id" value="<?php echo $category['id'] ; ?>">
                    <div class="form-group col-md-12 mt-4">
                        <!--                             <button type="submit" name="upload" id="upload" value="Apply" class="btn btn-primary mt-27 ">Update</button> -->
                        <button class="btn btn-primary mt-27 ">Update</button>

                    </div>
                </div>
            </div>

        </form>
    </div>
</div>
<?php }?>
      <?php }elseif ($type == 'sub_category'){?>

        <!--sub_category Edit-->
        <div class="row">
            <div class="col-12">
                <h4 class="ven">Edit sub_category</h4>
                <form class="needs-validation" novalidate="" action="<?php echo base_url('sub_category/u');?>" method="post" enctype="multipart/form-data">
                    <div class="card-header">

                        <div class="form-row">
                            <div class="form-group col-md-3">
                                <label>sub_categories</label>
                                <input type="text" class="form-control" name="name" required="" value="<?php echo $sub_categories['name'];?>">
                                <div class="invalid-feedback">Enter valid  Name?</div>
                            </div>
                            <input type="hidden" name="id" value="<?php echo $sub_categories['id'] ; ?>">
                            </br>
                            <div class="form-group col-md-3">
                                <label>Category</label>
                                <!-- <input type="file" class="form-control" required="">-->
                                <select class="form-control" name="cat_id" required="">
                                    <option value="0" selected disabled>select</option>
                                    <?php foreach ($categories as $category):?>
                                      <option value="<?php echo $category['id'];?>" <?php echo ($category['id'] == $sub_categories['cat_id'])? 'selected': '';?>><?php echo $category['name']?></option>
                                    <?php endforeach;?>
                                </select>
                                <div class="invalid-feedback">Select Category Name?</div>
                            </div>

                            <div class="form-group mb-0 col-md-3">
                                <label>Description</label>
                                <input type="text" class="form-control" name="desc" required="" value="<?php echo $sub_categories['desc']?>">
                                <div class="invalid-feedback">Give some Description</div>
                            </div>

                            <div class="form-group col-md-3">
                                <label>Upload Image</label>
                                <input type="file" name="file" class="form-control" onchange="readURL(this);" value="<?php echo base_url(); ?>uploads/sub_category_image/sub_category_<?php echo $sub_categories['id']; ?>.jpg">
                            <br><img src="<?php echo base_url(); ?>uploads/sub_category_image/sub_category_<?php echo $sub_categories['id']; ?>.jpg?<?php echo time();?>" style="width: 200px;" />
                                
<!--                                 <input type="file" class="form-control" name="file"> -->
                                <div class="invalid-feedback">Upload Image?</div>
                            </div>

<!--                             <div class="form-group col-md-6"> -->
<!--                                 <img src="" width="80px"> -->
<!--                             </div> -->

                            <div class="form-group col-md-12">

                                <button class="btn btn-primary mt-27 ">Update</button>
                            </div>

                        </div>

                    </div>
                </form>

            </div>
        </div>
    

    <?php }elseif ($type == 'amenity'){?>

        <!--Amenity Edit-->
        <div class="row">
            <div class="col-12">
                <h4 class="ven">Edit Amenity</h4>
                <form class="needs-validation" novalidate="" action="<?php echo base_url('amenity/u');?>" method="post" enctype="multipart/form-data">
                    <div class="card-header">

                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label>Amenity Name</label>
                                <input type="text" class="form-control" name="name" required="" value="<?php echo $amenity['name'];?>">
                                <div class="invalid-feedback">Enter valid Amenity Name?</div>
                            </div>
                            <input type="hidden" name="id" value="<?php echo $amenity['id'] ; ?>">
                            </br>
                            <div class="form-group col-md-6">
                                <label>Category</label>
                                <!-- <input type="file" class="form-control" required="">-->
                                <select class="form-control" name="cat_id" required="">
                                    <option value="0" selected>--select--</option>
                                    <?php foreach ($categories as $category):?>
                                      <option value="<?php echo $category['id'];?>" <?php echo ($category['id'] == $amenity['cat_id'])? 'selected': '';?>><?php echo $category['name']?></option>
                                        <?php echo $category['name']?>
                                        </option>
                                        <?php endforeach;?>
                                </select>
                                <div class="invalid-feedback">Select Category Name?</div>
                            </div>

                            <div class="form-group mb-0 col-md-6">
                                <label>Description</label>
                                <input type="text" class="form-control" name="desc" required="" value="<?php echo $amenity['desc']?>">
                                <div class="invalid-feedback">Give some Description</div>
                            </div>

                            <div class="form-group col-md-6">
                                <label>Upload Image</label>
                                <input type="file" name="file" class="form-control" onchange="readURL(this);" value="<?php echo base_url(); ?>uploads/amenity_image/amenity_<?php echo $amenity['id']; ?>.jpg"><br>
                            <img src="<?php echo base_url(); ?>uploads/amenity_image/amenity_<?php echo $amenity['id']; ?>.jpg?<?php echo time();?>" style="width: 200px;"/>
 
                                <div class="invalid-feedback">Upload Image?</div>
                            </div>

<!--                             <div class="form-group col-md-6"> -->
<!--                                 <img src="" width="80px"> -->
<!--                             </div> -->

                            <div class="form-group col-md-12">

                                <button class="btn btn-primary mt-27 ">Update</button>
                            </div>

                        </div>

                    </div>
                </form>

            </div>
        </div>

        <?php }elseif ($type == 'service'){?>

            <!--edit Service -->
            <div class="row">
                <div class="col-12">
                    <h4 class="ven">Edit Service</h4>
                    <form class="needs-validation" novalidate="" action="<?php echo base_url('service/u');?>" method="post" enctype="multipart/form-data">
                        <div class="card-header">

                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label>Service Name</label>
                                    <input type="text" name="name" class="form-control" required="" value="<?php echo $services['name'];?>">
                                    <div class="invalid-feedback">Enter Valid Service Name?</div>
                                </div>

                                <input type="hidden" name="id" value="<?php echo $services['id'] ; ?>">
                                </br>
                                <!-- <div class="form-group mb-0 col-md-6">
                                    <label>Description</label>
                                    <input type="text" name="desc" class="form-control" required=" " value="<?php //echo $services['desc'];?>">
                                    <div class="invalid-feedback">Give some Description</div>
                                </div> -->
                                <!--<div class="form-group col-md-6">
                                	<label>Permissions</label>
                                		 <input type="file" class="form-control" required="">
                                		<select id="services_multiselect" class="form-control" name="perm_id[]" multiple>

                                		 <?php foreach ($permissions as $permission){?>
                                		 	<?php if(!empty($services['permissions'])){ 
                                		 	    foreach ($services['permissions'] as $sp){
                                		 	    if($sp['id'] == $permission['id']){
                                 		 	?>
                                		 	<option value="<?php echo $permission['id']?>" <?php echo ($permission['id'] == $sp['id'])? 'selected': '';?>><?php echo $permission['name']?></option>
                                		 	<?php }else{?>
                                		 	<option value="<?php echo $permission['id']?>" ><?php echo $permission['name']?></option>
                                		 	<?php }?>
                                		 <?php }}else{?>
                                		 	<option value="<?php echo $permission['id']?>" ><?php echo $permission['name']?></option>
                                		 <?php }}?>

    									</select> 
					                  </div>-->
					                   <div class="form-row">
    					                  <div class="form-group col-md-6">
                                        		<label>Permissions</label>
                                        		 <!-- <input type="file" class="form-control" required=""> -->
                                        		<select id="services_multiselect" class="form-control" name="perm_id[]" multiple>
                                            		<?php  if(isset($perm_ids)):   foreach ($permissions as $permission): ?>
                                                        <option value="<?php echo $permission['id'];?>" <?php echo (in_array($permission['id'] ,$perm_ids )) ? 'selected':''; ?>>
                                                            <?php echo $permission['name']?>
                                                        </option>
                                                    <?php endforeach;endif;?>
            									</select> 
    					                  </div>
					                  </div>
					               
                                <!-- <div class="form-group col-md-6">
                                    <label>Upload Image</label>
                                   <input type="file" name="file" class="form-control" onchange="readURL(this);" value="<?php //echo base_url(); ?>uploads/service_image/service_<?php //echo $services['id']; ?>.jpg"><br>
                            	   <img src="<?php //echo base_url(); ?>uploads/service_image/service_<?php //echo $services['id']; ?>.jpg" style="width: 200px;"/>

                                    <div class="invalid-feedback">Upload Image?</div>
                                </div> -->

<!--                                 <div class="form-group col-md-6"> -->
<!--                                     <img src="app.png" width="80px"> -->
<!--                                 </div> -->
                                <div class="form-group col-md-12">

                                    <button class="btn btn-primary mt-27 ">Submit</button>
                                </div>

                            </div>

                        </div>
                    </form>

                </div>
            </div>

            <?php }elseif ($type == 'state'){ ?>

                <!--Edit State -->
                <div class="row">
                    <div class="col-12">
                        <h4 class="ven">Edit State</h4>
                        <form class="needs-validation" novalidate="" action="<?php echo base_url('state/u');?> " method="post" enctype="multipart/form-data">
                            <div class="card-header">
                                <div class="form-row">
                                    <div class="form-group col-md-6">

                                        <label>State Name</label>
                                        <input type="text" name="name" class="form-control" required="" value="<?php echo $state['name']; ?>">

                                        <div class="invalid-feedback">Enter Valid State Name?</div>
                                    </div>
                                    <input type="hidden" name="id" value="<?php echo $state['id'] ; ?>">
                                    </br>
                                    <div class="form-group col-md-6 mt-4 pt-3">
                                        <button class="btn btn-primary mt-27 ">Update</button>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>

                <?php }elseif ($type == 'district'){?>

                    <!--Edit District-->
                    <div class="row">
                        <div class="col-12">
                            <h4 class="ven">Edit District</h4>
                            <form class="needs-validation" novalidate="" action="<?php echo base_url('district/u');?>" method="post" enctype="multipart/form-data">
                                <div class="card-header">
                                    <div class="form-row">
                                        <div class="form-group col-md-5">
                                            <label>District Name</label>
                                            <input type="text" name="name" class="form-control" required="" value="<?php echo $district['name'];?>">
                                            <div class="invalid-feedback">Enter Valid District Name?</div>
                                        </div>
                                        <input type="hidden" name="id" value="<?php echo $district['id'] ; ?>">
                                        </br>
                                        <div class="form-group col-md-5">
                                            <label>State</label>

                                            <!-- 						<select class="form-control" name="state_id" required=""> -->
                                            <!-- 								<option value="">state1</option> -->
                                            <!-- 								<option value="" >state1</option> -->
                                            <!-- 								<option value="" selected >state1</option> -->
                                            <!-- 								<option value=""  >state1</option> -->

                                            <!-- 						</select> -->
                                            <select class="form-control" id='state' onchange="state_changed()" name="state_id" required="">
                                                <option value="0" selected disabled>--select--</option>
                                                <?php foreach ($states as $state):?>
                                                    <option value="<?php echo $state['id'];?>" <?php echo ($state['id'] == $district['state_id'])? 'selected': '';?>><?php echo $state['name']?></option>
														 <?php echo $state['name']?>
                                                    </option>
                                                    <?php endforeach;?>
                                            </select>
                                            <div class="invalid-feedback">Belongs to the state?</div>
                                        </div>
                                        <div class="form-group col-md-2 mt-4 pt-3">
                                            <button class="btn btn-primary mt-27 ">Update</button>
                                        </div>
                                    </div>
                                </div>
                            </form>

                        </div>
                    </div>

                    <?php }elseif ($type == 'constituency'){ ?>

                        <!-- Edit Constituency -->
                        <div class="row">
                            <div class="col-12">
                                <h4 class="ven">Edit Constituency</h4>
                                <form class="needs-validation" novalidate="" action="<?php echo base_url('constituency/u');?>" method="post" enctype="multipart/form-data">
                                    <div class="card-header">

                                        <div class="form-row">
                                            <div class="form-group col-md-3">
                                                <label>Constituency Name</label>
                                                <input type="text" name="name" class="form-control" required="" value="<?php echo $constituency['name']?>">
                                                <div class="invalid-feedback">Enter Valid Constituency Name?</div>
                                            </div>
                                            <input type="hidden" name="id" value="<?php echo $constituency['id'] ; ?>">
                                            </br>
                                            <div class="form-group col-md-3">
                                                <label>State</label>
                                                <!-- <select class="form-control" id='state' onchange="state_changed()" name="state_id"  -->
                                                <!-- 							required=""> -->
                                                <!-- 								<option value="">state1</option> -->
                                                <!-- 								<option value="">state2</option> -->
                                                <!-- 								<option value="" selected>state3</option> -->

                                                <!-- 						</select> -->
                                                <select class="form-control" id='state' onchange="state_changed()" name="state_id" required="">
                                                    <option value="0" selected disabled>--select--</option>

                                                    <?php foreach ($states as $state):?>
                                                        <option value="<?php echo $state['id'];?>" <?php echo ($state['id'] == $constituency['state_id'])? 'selected': '';?>><?php echo $state['name']?></option>
                                                        <?php echo $state['name']?>
                                                        </option>
                                                    <?php endforeach;?>
                                                </select>
                                                <div class="invalid-feedback">Select valid state?</div>
                                            </div>

                                            <div class="form-group col-md-3">
                                                <label>District</label>
                                                <select id="district" class="form-control" name="dist_id" required="">
                                                    <option value="0" selected disabled>--select--</option>
                                                    <?php foreach ($districts as $district): ?>
                                                        <?php if ($district['state_id'] == $constituency['state_id']):?>
                                                           <option value="<?php echo $district['id'];?>" <?php echo ($district['id'] == $constituency['district_id'])? 'selected': '';?>><?php echo $district['name']?></option>
														<?php echo $district['name']?>
                                                            </option>
                                                        <?php endif;?>
                                                            <?php endforeach;?>
                                                </select>
                                                <div class="invalid-feedback">Belongs to the District?</div>
                                            </div>

                                            <div class="form-group col-md-3">
                                                <label>Pincode</label>
                                                <input type="text" name="pincode" class="form-control" required="" value="<?php echo $constituency['pincode']?>">
                                                <div class="invalid-feedback">Enter Pincode?</div>
                                            </div>

                                            <div class="form-group col-md-2 mt-4 pt-2">

                                                <button class="btn btn-primary mt-27 ">Update</button>
                                            </div>

                                        </div>

                                    </div>
                                </form>

                            </div>
                        </div>

           <?php }elseif ($type == 'brand'){?>
           	<div class="row">
                    <div class="col-12">
                        <h4 class="ven">Edit Brands</h4>
                        <form class="needs-validation" novalidate=""  action="<?php echo base_url('brands/u');?>" method="post" enctype="multipart/form-data">
                       <div class="card-header">
                       <div class="form-row">
                        <div class="form-group col-md-4">
                                        <label>Brand Name</label>
                                        <input type="text" name="name" class="form-control" required="" value="<?php echo $ecom_brands['name']?>" >
                                        <div class="invalid-feedback">Enter Valid Brand Name?</div>
                                         <input type="hidden" name="id" value="<?php echo $ecom_brands['id'] ; ?>">
                                    </div>
                                   
                                     
                                     <div class="form-group mb-0 col-md-4">
                                        <label>Description</label>
                                        <input type="text" name="desc" class="form-control" required="" value="<?php echo $ecom_brands['desc']?>">
                                        <div class="invalid-feedback">Give some Description</div>
                                    </div>
                                    <div class="form-group col-md-4">
                                        <label>Upload Image</label>
                                        <input type="file" name="file" class="form-control" onchange="readURL(this);" value="<?php echo base_url(); ?>uploads/ecom_brands_image/ecom_brands_<?php echo $ecom_brands['id']; ?>.jpg">
                                        <br><img src="<?php echo base_url(); ?>uploads/brands_image/brands_<?php echo $ecom_brands['id']; ?>.jpg?<?php echo time();?>" style="width: 200px;" />
                                         
                                        <img id="blah" src="#" alt="" />
            
                                        <div class="invalid-feedback">Upload Image?</div>
                                    </div>
                                     <div class="form-group col-md-12">
                                     <button type="submit" name="upload" id="upload" value="Apply" class="btn btn-primary mt-27 ">Update</button> 
            <!--                              <button class="btn btn-primary mt-27 ">Update</button> -->
                                       
                                    </div>
                       
                        </div>
                        </div>
                        </form>
            
                    </div>
                </div>
           <?php }?>
                        
                        
                      
