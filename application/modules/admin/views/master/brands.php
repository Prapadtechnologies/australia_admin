<!--Add Category And its list-->
<div class="row">
	<div class="col-12">
		<h4 class="ven">Add Brands</h4>
		<form class="needs-validation" novalidate="" action="<?php echo base_url('brands/c');?>" method="post" enctype="multipart/form-data">
			<div class="card-header">
				<div class="form-row">
					<div class="form-group col-md-4">
						<label>Brand Name</label> <input type="text" name="name"
							required="" placeholder="Brand Name" value="<?php echo set_value('name')?>"
							class="form-control">
						<div class="invalid-feedback">New Category Name?</div>
						<?php echo form_error('name', '<div style="color:red">', '</div>');?>
					</div>
					<div class="form-group mb-0 col-md-4">
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
							src="#" alt="" >
						<div class="invalid-feedback">Upload Image?</div>
						<?php echo form_error('file', '<div style="color:red">', '</div>');?>
					</div>
					<div class="form-group col-md-2">
						<button type="submit" name="upload" id="upload" value="Apply"
							class="btn btn-primary mt-27 ">Submit</button>
					</div>
				</div>
			</div>
		</form>

		<div class="card-body">
			<div class="card">
				<div class="card-header">
					<h4 class="ven">List of Brands</h4>
				</div>
				<div class="card-body">
					<div class="table-responsive">
						<table class="table table-striped table-hover" id="tableExportNoPagination"
							style="width: 100%;">
							<thead>
								<tr>
									<th>Sno</th>
									<th>Brand Name</th>
									<th>Description</th>
									<th>Featured brnad</th>
									<th>Image</th>
									<th>Actions</th>

								</tr>
							</thead>
							<tbody>
							<?php if(!empty($ecom_brands)):?>
    							<?php  $sno = 1; foreach ($ecom_brands as $ecom_brand): ?>
    								<tr>
									<td><?php echo $sno++;?></td>
									<td><?php echo $ecom_brand['name'];?></td>
									<td><?php echo $ecom_brand['desc'];?></td>
									<td><input type="checkbox" class="featured_brand_toggle" brand_id="<?php echo $ecom_brand['id'];?>" <?php echo ($ecom_brand['status'] == 1) ? 'checked':'' ;?>  data-toggle="toggle" data-style="ios" data-on="Yes" data-off="No" data-onstyle="success" data-offstyle="danger"></td>
									<td width="15%"><img
										src="<?php echo base_url();?>uploads/brands_image/brands_<?php echo $ecom_brand['id'];?>.jpg?<?php echo time();?>"
										class="img-thumb"></td>
									<td><a
										href="<?php echo base_url()?>brands/edit?id=<?php echo $ecom_brand['id']; ?>"
										class=" mr-2  " type="ecom_brands"> <i class="fas fa-pencil-alt"></i>
									</a> <a href="#" class="mr-2  text-danger "
										onClick="delete_record(<?php echo $ecom_brand['id'] ?>, 'brands')">
											<i class="far fa-trash-alt"></i>
									</a></td>
								</tr>
    							<?php endforeach;?>
							<?php else :?>
							<tr>
									<th colspan='5'><h3>
											<center>No Brands</center>
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
