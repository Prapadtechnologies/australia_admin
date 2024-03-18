<!--Add Amenity And its list-->
<div class="row">
	<div class="col-12">
		<h4 class="ven">Add Amenity</h4>
		<form class="needs-validation" novalidate=""
			action="<?php echo base_url('amenity/c');?>" method="post"
			enctype="multipart/form-data">
			<div class="card-header">

				<div class="form-row">
					<div class="form-group col-md-3">
						<label>Amenity Name</label> <input type="text"
							class="form-control" name="name" placeholder="Amenity Name" required="" value=<?php echo set_value('name')?>>
						<div class="invalid-feedback">New Amenity Name?</div>
						<?php echo form_error('name','<div style="color:red">','</div>');?>
						
					</div>

					<div class="form-group col-md-3">
						<label>Category</label>
						<!-- <input type="file" class="form-control" required="">-->
						<select class="form-control" name="cat_id" required="">
								<option value="0" selected disabled>--select--</option>
    							<?php foreach ($categories as $category):?>
    								<option value="<?php echo $category['id'];?>"><?php echo $category['name']?></option>
    							<?php endforeach;?>
						</select>
						<div class="invalid-feedback">New Category Name?</div>
						<?php echo form_error('cat_id', '<div style="color:red">', '</div>');?>
					</div>


					<div class="form-group mb-0 col-md-3">
						<label>Description</label> <input type="text" class="form-control"
							name="desc" required="" placeholder="Description" <?php set_value('desc')?>>
						<div class="invalid-feedback">Give some Description</div>
						<?php echo form_error('desc','<div style="color:red">','</div>');?>
					</div>

					<div class="form-group col-md-3">
						<label>Upload Image</label> <input type="file"
							class="form-control" name="file" required="" value="<?php echo set_value('file')?>">
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
					<h4 class="ven">List of Amenities</h4>
				</div>
				<div class="card-body">
					<div class="table-responsive">
						<table class="table table-striped table-hover" id="tableExport"
							style="width: 100%;">
							<thead>
								<tr>
									<th>Id</th>
									<th>Amenity Name</th>
									<th>Category</th>
									<th>Description</th>
									<th>Image</th>
									<th>Actions</th>

								</tr>
							</thead>
							<tbody>
								<?php if(!empty($amenities)):?>
    							<?php $sno = 1; foreach ($amenities as $amenity):?>
    								<tr>
    									<td><?php echo $sno++;?></td>
    									<td><?php echo $amenity['name'];?></td>
    									<td><?php foreach ($categories as $category):?>
    									<?php echo ($category['id'] == $amenity['cat_id'])? $category['name']:'';?>
    									<?php endforeach;?></td>
    									<td><?php echo $amenity['desc'];?></td>
    									<td><img
    										src="<?php echo base_url();?>uploads/amenity_image/amenity_<?php echo $amenity['id'];?>.jpg"
    										class="img-thumb"></td>
    									<td><a href="<?php echo base_url()?>amenity/edit?id=<?php echo $amenity['id'];?>" class=" mr-2  "  > <i class="fas fa-pencil-alt"></i>
    									</a> <a href="#" class="mr-2  text-danger " onClick="delete_record(<?php echo $amenity['id'] ?>, 'amenity')"> <i
    											class="far fa-trash-alt"></i>
    									</a></td>
    
    								</tr>
    							<?php endforeach;?>
							<?php else :?>
							<tr ><th colspan='5'><h3><center>No Amenities</center></h3></th></tr>
							<?php endif;?>
							</tbody>
						</table>
					</div>
				</div>
			</div>


		</div>

	</div>
</div>

