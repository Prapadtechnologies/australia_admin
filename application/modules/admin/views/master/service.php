
<!--Add Service And its list-->
<div class="row">
	<div class="col-12">
		<h4 class="ven">Add Service</h4>
		<form class="needs-validation" novalidate=""
			action="<?php echo base_url('service/c');?>" method="post"
			enctype="multipart/form-data">
			<div class="card-header">

				<div class="form-row">
					<div class="form-group col-md-5">
						<label>Service Name</label> <input type="text" name="name"
							class="form-control" placeholder="Service Name" required="" value="<?php echo set_value('name')?>">
						<div class="invalid-feedback">New Service Name?</div>
						<?php echo form_error('name','<div style="color:red">','</div>');?>
					</div>


					<!--<div class="form-group mb-0 col-md-4">
						<label>Description</label> <input type="text" name="desc"
							class="form-control" placeholder="Description" required="" value="<?php echo set_value('desc')?>">
						<div class="invalid-feedback">Give some Description</div>
						<?php //echo form_error('desc','<div style="color:red">','</div>')?>
					</div>

					  <div class="form-group col-md-2">
						<label>Upload Image</label> <input type="file" name="file"
							class="form-control" required="" value="<?php echo set_value('file')?>">
						<div class="invalid-feedback">Upload Image?</div>
						<?php //echo form_error('file','<div style="color:red">','</div>')?>
					</div>-->
					<div class="form-row">
					<div class="form-group col-md-5">
						<label>Permissions</label>
						<!-- <input type="file" class="form-control" required="">-->
						<select id="services_multiselect" class="form-control"
							name="perm_id[]" multiple>
								<?php foreach ($permissions as $per):?>
                                  <option value="<?php echo $per['id'];?>"><?php echo $per['name']?></option>
                                <?php endforeach;?>
    							
						</select>
						<div class="invalid-feedback">New Category Name?</div>
						<?php echo form_error('cat_id', '<div style="color:red">', '</div>');?>
					</div>
					</div>
					<div class="form-group col-md-2 mt-4 pt-2">

						<button class="btn btn-primary mt-27 ">Submit</button>
					</div>


				</div>


			</div>
		</form>

		<div class="card-body">
			<div class="card">
				<div class="card-header">
					<h4 class="ven">List of Services</h4>
				</div>
				<div class="card-body">
					<div class="table-responsive">
						<table class="table table-striped table-hover" id="tableExport"
							style="width: 100%;">
							<thead>
								<tr>
									<th>Id</th>
									<th>Service Name</th>
									<!-- <th>Description</th> -->
									<th>Permissions</th>
									<!-- <th>Image</th> -->
									<th>Actions</th>

								</tr>
							</thead>
							<tbody>
								<?php if(!empty($services)):?>
    							<?php $sno = 1; foreach ($services as $service):?>
    								<tr>
    									<td><?php echo $sno++;?></td>
    									<td><?php echo $service['name'];?></td>
    									<!-- <td><?php //echo $service['desc'];?></td>  -->
    									<td>
										<ul>
										<?php if(isset($service['permissions'])){ foreach ($service['permissions'] as $permission):?>
											<li><?php echo $permission['perm_name'];?></li>
										<?php endforeach;}?>
										</ul></td>
    									<!-- <td><img
    										src="<?php //echo base_url();?>uploads/service_image/service_<?php //echo $service['id'];?>.jpg"
    										class="img-thumb"></td> -->
    									<td><a href="<?php echo base_url()?>service/edit?id=<?php echo $service['id']?>" class=" mr-2  " > <i class="fas fa-pencil-alt"></i>
    									</a> <a href="#" class="mr-2  text-danger " onClick="delete_record(<?php echo $service['id'] ?>, 'service')"> <i
    											class="far fa-trash-alt"></i>
    									</a></td>
    
    								</tr>
    							<?php endforeach;?>
							<?php else :?>
							<tr ><th colspan='7'><h3><center>No Services</center></h3></th></tr>
							<?php endif;?>
							</tbody>
						</table>
					</div>
				</div>
			</div>


		</div>

	</div>
</div>


