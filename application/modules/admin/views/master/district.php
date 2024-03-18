<!--Add District And its list-->
<div class="row">
	<div class="col-12">
		<h4 class="ven">Add District</h4>
		<form class="needs-validation" novalidate=""
			action="<?php echo base_url('district/c');?>" method="post"
			enctype="multipart/form-data">
			<div class="card-header">
				<div class="form-row">
					<div class="form-group col-md-5">
						<label>District Name</label> <input type="text" name="name" value="<?php echo set_value('name')?>"
							class="form-control" placeholder="District Name" required="">
						<div class="invalid-feedback">New District Name?</div>
						<?php echo form_error('name','<div style="color:red">','</div>');?>
					</div>

					<div class="form-group col-md-5">
						<label>State</label>
<!-- 						 <input type="file" class="form-control" required=""> -->
					<select class="form-control" name="state_id" required=""> 
								<option value="0" selected disabled>--select--</option>
    							<?php foreach ($states as $state):?>
    							
    								<option value="<?php echo $state['id'];?>"><?php echo $state['name']?></option>
    							<?php endforeach;?>
					</select> 
						<div class="invalid-feedback">Belongs to the state?</div>
						<?php echo form_error('state_id','<div style="color:red">','</div>');?>
					</div>
					<div class="form-group col-md-2 mt-4 pt-3">
						<button class="btn btn-primary mt-27 ">Submit</button>
					</div>
				</div>
			</div>
		</form>

		<div class="card-body">
			<div class="card">
				<div class="card-header">
					<h4 class="ven">List of Districts</h4>
				</div>
				<div class="card-body">
					<div class="table-responsive">
						<table class="table table-striped table-hover" id="tableExport"
							style="width: 100%;">
							<thead>
								<tr>
									<th>Id</th>
									<th>District Name</th>
									<th>State</th>
									<th>Actions</th>
								</tr>
							</thead>
							<tbody>
								<?php if(!empty($districts)):?>
    							<?php $sno = 1; foreach ($districts as $district):?>
    								<tr>
    									<td><?php echo $sno++;?></td>
    									<td><?php echo $district['name'];?></td>
    									<td><?php foreach ($states as $state):?>
    										<?php if($state['id'] == $district['state_id']):?>
    											<?php echo $state['name'];?>
    										<?php endif;?>
    									<?php endforeach;?></td>
    									<td><a href="<?php echo base_url()?>district/edit?id=<?php echo $district['id'];?>" class=" mr-2  " type="category" > <i class="fas fa-pencil-alt" ></i>
    									</a> <a href="#" class="mr-2  text-danger " onClick="delete_record(<?php echo $district['id'] ?>, 'district')"> <i
    											class="far fa-trash-alt"></i>
    									</a></td>
    								</tr>
    							<?php endforeach;?>
							<?php else :?>
							<tr ><th colspan='5'><h3><center>No Districts</center></h3></th></tr>
							<?php endif;?>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
