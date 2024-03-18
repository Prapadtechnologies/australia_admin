

<!--Add Constituency And its list-->
<div class="row">
	<div class="col-12">
		<h4 class="ven">Add Constituency</h4>
		<form class="needs-validation" novalidate=""
			action="<?php echo base_url('constituency/c');?>" method="post"
			enctype="multipart/form-data">
			<div class="card-header">

				<div class="form-row">
					<div class="form-group col-md-3">
						<label>Constituency Name</label> <input type="text" name="name"
							class="form-control" placeholder="Constituency Name" required="" value="<?php echo set_value('name')?>">
						<div class="invalid-feedback">New Constituency Name?</div>
						<?php echo form_error('name','<div style="color:red">','</div>');?>
					</div>

					<div class="form-group col-md-3">
						<label>State</label> <select class="form-control" id='state' onchange="state_changed()" name="state_id" 
							required="">
								<option value="0" selected disabled>--select--</option>
    							<?php foreach ($states as $state):?>
    								<option value="<?php echo $state['id'];?>"><?php echo $state['name']?></option>
    							<?php endforeach;?>
						</select>
						<div class="invalid-feedback">Belongs to the state?</div>
						<?php echo form_error('state_id','<div style="color:red">','</div>');?>
					</div>

					<div class="form-group col-md-3">
						<label>District</label> <select id="district" class="form-control"
							name="dist_id" required="">
							<option value="0" selected >--select--</option>
							<?php foreach($districts as $district)?>
							<option value="<?php echo $district['id'];?>"><?php echo $district['name']?></option>
						</select>
						<div class="invalid-feedback">Belongs to the District?</div>
						<?php echo form_error('dist_id','<div style="color:red">','</div>');?>
					</div>

					<div class="form-group col-md-3">
						<label>Pincode</label> <input type="text" name="pincode" class="form-control"
							required="" placeholder="Pincode" value="<?php echo set_value('pincode')?>">
						<div class="invalid-feedback">Enter Pincode?</div>
						<?php echo form_error('pincode','<div style="color:red">','</div>');?>
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
					<h4>List of Constituencies</h4>
				</div>
				<div class="card-body">
					<div class="table-responsive">
						<table class="table table-striped table-hover" id="tableExport"
							style="width: 100%;">
							<thead>
								<tr>
									<th>Id</th>
									<th>Constituency Name</th>
									<th>District</th>
									<th>State</th>
									<th>Pincode</th>

									<th>Actions</th>

								</tr>
							</thead>
							<tbody>
								<?php if(!empty($constituencies)):?>
    							<?php $sno = 1; foreach ($constituencies as $constituency):?>
    								<tr>
    									<td><?php echo $sno++;?></td>
    									<td><?php echo $constituency['name'];?></td>
    									<?php foreach ($districts as $district):?>
    										<?php if($district['id'] == $constituency['district_id']):?>
    											<td><?php echo $district['name'];?></td>
    										<?php endif;?>
    									<?php endforeach;?>
    									<?php foreach ($states as $state):?>
    										<?php if($state['id'] == $constituency['state_id']):?>
    											<td><?php echo $state['name'];?></td>
    										<?php endif;?>
    									<?php endforeach;?>
    									<td><?php echo $constituency['pincode'];?></td>
    									<td><a href="<?php echo base_url()?>constituency/edit?id=<?php echo $constituency['id'];?>" class=" mr-2  " type="category" > <i class="fas fa-pencil-alt"></i>
    									</a> <a href="#" class="mr-2  text-danger " onClick="delete_record(<?php echo $constituency['id'] ?>, 'constituency')"> <i
    											class="far fa-trash-alt"></i>
    									</a></td>
    
    								</tr>
    							<?php endforeach;?>
							<?php else :?>
							<tr ><th colspan='5'><h3><center>No States</center></h3></th></tr>
							<?php endif;?>
							</tbody>
						</table>
					</div>
				</div>
			</div>


		</div>

	</div>
</div>

