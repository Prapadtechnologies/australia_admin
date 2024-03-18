<!--Add Category And its list-->
<div class="row">
	<div class="col-12">
		<h4 class="ven">Add Category</h4>
		  
		<form class="needs-validation" novalidate="" action="<?php echo base_url('category/c');?>" method="post" enctype="multipart/form-data">
			<div class="card-header">

				<div class="form-group row">
					<div class="form-group col-md-4">
						<label>Category Name</label> <input type="text" name="name"
							required="" placeholder="Category Name" value="<?php echo set_value('name')?>"
							class="form-control">
						<div class="invalid-feedback">New Category Name?</div>
						<?php echo form_error('name', '<div style="color:red">', '</div>');?>
					

</div>

					<div class="form-group col-md-4">
						<label>Description</label> <input type="text" name="desc"
							required="" placeholder="Description" value="<?php echo set_value('desc')?>"
							class="form-control">
						<div class="invalid-feedback">Give some Description</div>
						<?php echo form_error('desc', '<div style="color:red">', '</div>');?>
					</div>
				<div class="form-group col-md-4">
						<label>Upload Image</label> <input type="file" name="file"
							required="" value="<?php echo set_value('file')?>"
							class="form-control" onchange="readURL(this);"> <br> <img id="blah"
							src="#" alt="">
						<div class="invalid-feedback">Upload Image?</div>
						<?php echo form_error('file', '<div style="color:red">', '</div>');?>
					</div>
					<div class="form-group col-md-4">
						<label>Coming Soon Image</label> <input type="file" name="coming_soon_file"
							 value="<?php echo set_value('file')?>"
							class="form-control" onchange="readURL(this);"> <br> <img id="blah"
							src="#" alt="">
						<div class="invalid-feedback">Coming soon Image?</div>
						<?php echo form_error('coming_soon_file', '<div style="color:red">', '</div>');?>
					</div>
					<div class="form-group col-md-4">
						<label>Services</label>
						<!-- <input type="file" class="form-control" required="">-->
						<select id="services_multiselect" class="form-control"
							name="service_id[]" required="" multiple>
    							<?php  foreach ($services as $service): ?>
    								<option value="<?php echo $service['id'];?>"><?php echo $service['name']?></option>
    							<?php endforeach;?>
						</select>
						<div class="invalid-feedback">New Category Name?</div>
						<?php echo form_error('cat_id', '<div style="color:red">', '</div>');?>
					</div>
					
					<div class="form-group col-md-4">
						<label>Brands</label>
						<!-- <input type="file" class="form-control" required="">-->
						<select id="brands_multiselect" class="form-control"
							name="brand_id[]"  multiple>
    							<?php  foreach ($brands as $brand): ?>
    								<option value="<?php echo $brand['id'];?>"><?php echo $brand['name']?></option>
    							<?php endforeach;?>
						</select>
						<div class="invalid-feedback">New Category Name?</div>
						<?php echo form_error('cat_id', '<div style="color:red">', '</div>');?>
					</div>
				
					
					
					 <div class="col col-sm col-md-12 ven2" ><label>Terms And Conditions</label>
          				<textarea id="cat_terms" class="ckeditor" name="terms" rows="10" data-sample-short>Terms And Conditions</textarea>
          				<?php echo form_error('terms', '<div style="color:red">', '</div>');?>
        			</div>
        			
					<div class="form-group col-md-2 mt-4">
						<button type="submit" name="upload" id="upload" value="Apply"
							class="btn btn-primary mt-27 ">Submit</button>
					</div>


				</div>

</div>
			
		</form>

		<div class="card-body">
			<div class="card">
				<div class="card-header">
					<h4 class="ven">List of Categories</h4>
				</div>
				<div class="card-body">
					<div class="table-responsive">
						<table class="table table-striped table-hover" id="tableExport"
							style="width: 100%;">
							<thead>
								<tr>
									<th>Sno</th>
									<th>Category Name</th>
									<th>Description</th>
									<th>Brands</th>
									<th>Services</th>
									<th>Image</th>
									<th>Coming soon</th>
									<th>Is working?</th>
									<th>Actions</th>

								</tr>
							</thead>
							<tbody>
							<?php if(!empty($categories)):?>
    							<?php  $sno = 1; foreach ($categories as $category): ?>
    								<tr>
									<td><?php echo $sno++;?></td>
									<td><?php echo $category['name'];?></td>
									<td><?php echo $category['desc'];?></td>
									<td>
										<ul>
										<?php if(isset($category['brands'])){ foreach ($category['brands'] as $brand):?>
											<li><?php echo $brand['name'];?></li>
										<?php endforeach;}?>
										</ul>
									</td>
									<td>
										<ul>
										<?php if(isset($category['services'])){ foreach ($category['services'] as $services):?>
											<li><?php echo $services['name'];?></li>
										<?php endforeach;}?>
										</ul>
									</td>
									<td><img
										src="<?php echo base_url();?>uploads/category_image/category_<?php echo $category['id'];?>.jpg?<?php echo time();?>"
										class="img-thumb"></td>
									<td><img
									src="<?php echo base_url();?>uploads/coming_soon_image/coming_soon_<?php echo $category['id'];?>.jpg?<?php echo time();?>"
										class="img-thumb"></td>
									<td><input type="checkbox" class="coming_soon_toggle" cat_id="<?php echo $category['id'];?>" <?php echo ($category['status'] == 1) ? 'checked':'' ;?>  data-toggle="toggle" data-style="ios" data-on="Yes" data-off="No" data-onstyle="success" data-offstyle="danger"></td>
									<td><a
										href="<?php echo base_url()?>category/edit?id=<?php echo $category['id']; ?>"
										class=" mr-2  " type="category"> <i class="fas fa-pencil-alt"></i>
									</a> <a href="#" class="mr-2  text-danger "
										onClick="delete_record(<?php echo $category['id'] ?>, 'category')">
											<i class="far fa-trash-alt"></i>
									</a></td>

								</tr>
    							<?php endforeach;?>
							<?php else :?>
							<tr>
									<th colspan='5'><h3>
											<center>No Categories</center>
										</h3></th>
								</tr>
							<?php endif;?>
							</tbody>
						</table>
					</div>
				</div>
			</div>


		</div>

	</div>
</div>
