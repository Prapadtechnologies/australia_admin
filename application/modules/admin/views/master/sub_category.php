<!--Add Sub_Category And its list-->
<div class="row">
	<div class="col-12">
		<h4 class="ven">Add Sub_Category</h4>
		<form class="needs-validation" novalidate=""
			action="<?php echo base_url('sub_category/c');?>" method="post"
			enctype="multipart/form-data">
			<div class="card-header">

				<div class="form-row">
					<div class="form-group col-md-3">
						<label>Sub_Category Name</label> <input type="text"
							class="form-control" name="name" placeholder="Sub Category Name" required="" value="<?php echo set_value('name')?>">
						<div class="invalid-feedback">New Sub_Category Name?</div>
						<?php echo form_error('name','<div style="color:red">','</div>')?>
					</div>

					<div class="form-group col-md-3">
						<label>Category</label>
						<!-- <input type="file" class="form-control" required="">-->
						<select required class="form-control" name="cat_id"  >
								<option value="0" selected disabled>--select--</option>
    							<?php foreach ($categories as $category):?>
    								<option value="<?php echo $category['id'];?>"><?php echo $category['name']?></option>
    							<?php endforeach;?>
						</select>
						<div class="invalid-feedback">New Category Name?</div>
						<?php echo form_error('cat_id','<div style="color:red>"','</div>');?>
					</div>


					<div class="form-group mb-0 col-md-3">
						<label>Description</label> <input type="text" class="form-control"
							name="desc" required="" placeholder="Description" <?php echo set_value('desc')?>>
						<div class="invalid-feedback">Give some Description</div>
						<?php echo form_error('desc','<div style="color:red">','</div>');?>
					</div>
					<div class="form-group col-md-3">
						<label>Upload Image</label> 
						
						<input type="file" name="file" required="" value="<?php echo set_value('file')?>"
							class="form-control" onchange="readURL(this);">
<!-- 							<img id="blah" src="#" alt="" > -->
						<div class="invalid-feedback">Upload Image?</div>
						<?php echo form_error('file', '<div style="color:red">', '</div>');?>
					</div>

					<div class="form-group col-md-12">

						<button class="btn btn-primary mt-27 ">Submit</button>
					</div>


				</div>


			</div>
		</form>

		<div class="card-body">
			<div class="card">
				<div class="card-header">
					<h4 class="ven">List of Sub_Categories</h4>
				</div>
				<div class="card-body">
					<div class="table-responsive">
						<table class="table table-striped table-hover" id="tableExport"
							style="width: 100%;">
							<thead>
								<tr>
									<th>Id</th>
									<th>Sub_Category Name</th>
									<th>Category</th>
									<th>Description</th>
									<th>Image</th>
									<th>Actions</th>

								</tr>
							</thead>
							<tbody>
								<?php if(!empty($sub_categories)):?>
    							<?php $sno = 1; foreach ($sub_categories as $sub_cat):?>
    								<tr>
    									<td><?php echo $sno++;?></td>
    									<td><?php echo $sub_cat['name'];?></td>
    									<td><?php foreach ($categories as $category):?>
    										<?php echo ($category['id'] == $sub_cat['cat_id'])? $category['name']:'';?>
    									<?php endforeach;?></td>
    									<td><?php echo $sub_cat['desc'];?></td>
    									<td width="15%"><img
    										src="<?php echo base_url();?>uploads/sub_category_image/sub_category_<?php echo $sub_cat['id'];?>.jpg?<?php echo time();?>"
    										width="50px"></td>
    									<td><a href="<?php echo base_url()?>sub_category/edit?id=<?php echo $sub_cat['id'];?>" class=" mr-2  "  > <i class="fas fa-pencil-alt"></i>
    									</a> <a href="#" class="mr-2  text-danger " onClick="delete_record(<?php echo $sub_cat['id'] ?>, 'sub_category')"> <i
    											class="far fa-trash-alt"></i>
    									</a></td>
    
    								</tr>
    							<?php endforeach;?>
							<?php else :?>
							<tr ><th colspan='6'><h3><center>No Sub_Category</center></h3></th></tr>
							<?php endif;?>
							</tbody>
						</table>
					</div>
				</div>
			</div>


		</div>

	</div>
</div>

<script type="text/javascript">
    function Validate() {
        var ddlFruits = document.getElementById("ddlFruits");
        if (ddlFruits.value == "") {
            //If the "Please Select" option is selected display error.
            alert("Please select an option!");
            return false;
        }
        return true;
    }
</script>