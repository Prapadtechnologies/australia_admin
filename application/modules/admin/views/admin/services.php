


<!--Add State And its list-->
<div class="row">
	<div class="col-12">
		<h4 class="ven">Add Service</h4>
		<form class="needs-validation" novalidate=""
			action="<?php echo base_url('user_services/c');?>" method="post"
			enctype="multipart/form-data">
			<div class="card-header">
				<div class="form-row">
					<div class="form-group col-md-6">
						<label>Service Name</label> <input type="text" name="name" value="<?php echo set_value('name')?>"
							class="form-control" placeholder="Service Name" required="">
						<div class="invalid-feedback">New State Name?</div>
						<?php echo form_error('name','<div style="color:red">','</div>');?>
					</div>
					<div class="form-group col-md-6">
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
									<th>Actions</th>

								</tr>
							</thead>
							<tbody>
								<?php if(!empty($services)):?>
    							<?php $sno = 1; foreach ($services as $s):?>
    								<tr>
    									<td><?php echo $sno++;?></td>
    									<td><?php echo $s['name'];?></td>
    									<td><a href="<?php echo base_url()?>user_services/edit?id=<?php echo $s['id'] ?>" class=" mr-2  " type="user_services" > <i class="fas fa-pencil-alt"></i>
    									</a> <a href="#" class="mr-2  text-danger " onClick="delete_record(<?php echo $s['id'] ?>, 'user_services')"> <i
    											class="far fa-trash-alt"></i>
    									</a></td>
    
    								</tr>
    							<?php endforeach;?>
							<?php else :?>
							<tr ><th colspan='5'><h3><center>No Services</center></h3></th></tr>
							<?php endif;?>
							</tbody>
						</table>
					</div>
				</div>
			</div>


		</div>

	</div>
</div>

