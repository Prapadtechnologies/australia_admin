


<!--Add State And its list-->
<div class="row">
	<div class="col-12">
		<h4 class="ven">Add State</h4>
		<form class="needs-validation" novalidate=""
			action="<?php echo base_url('state/c');?>" method="post"
			enctype="multipart/form-data">
			<div class="card-header">
				<div class="form-row">
					<div class="form-group col-md-6">
						<label>State Name</label> <input type="text" name="name" value="<?php echo set_value('name')?>"
							class="form-control" placeholder="State Name" required="">
						<div class="invalid-feedback">New State Name?</div>
						<?php echo form_error('name','<div style="color:red">','</div>');?>
					</div>
					<div class="form-group col-md-6 mt-4 pt-3">
						<button class="btn btn-primary mt-27 ">Submit</button>
					</div>
				</div>
			</div>
		</form>

		<div class="card-body">
			<div class="card">
				<div class="card-header">
					<h4 class="ven">List of States</h4>
				</div>
				<div class="card-body">
					<div class="table-responsive">
						<table class="table table-striped table-hover" id="tableExport"
							style="width: 100%;">
							<thead>
								<tr>
									<th>Id</th>
									<th>State Name</th>
									<th>Actions</th>

								</tr>
							</thead>
							<tbody>
								<?php if(!empty($states)):?>
    							<?php $sno = 1; foreach ($states as $state):?>
    								<tr>
    									<td><?php echo $sno++;?></td>
    									<td><?php echo $state['name'];?></td>
    									<td><a href="<?php echo base_url()?>state/edit?id=<?php echo $state['id'] ?>" class=" mr-2  " type="category" > <i class="fas fa-pencil-alt"></i>
    									</a> <a href="#" class="mr-2  text-danger " onClick="delete_record(<?php echo $state['id'] ?>, 'state')"> <i
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

