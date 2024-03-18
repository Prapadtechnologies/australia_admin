<?php if($type == 'all'):?>
<!--Add Category And its list-->
<div class="row">
	<div class="col-12">
		<h4 class="ven">All Vendors</h4>
		<a class="btn btn-outline-dark btn-lg col-2" href="<?php echo base_url('vendor_excel_import')?>"><i class="fa fa-plus" aria-hidden="true"></i> Add Vendor</a>
		<div class="card-body">
			<div class="card">
				<div class="card-header">
					<h4 class="ven">List of Vendors</h4>
				</div>
				<div class="card-body">
					<div class="table-responsive">
						<table class="table table-striped table-hover" id="tableExportNoPagination"
							style="width: 100%;">
							<thead>
								<tr>
									<th>Sno</th>
									<th>Executive Id</th>
									<th>Name</th>
									<th>Address</th>
									<th>Constituency</th>
									<th>Category</th>
									<th>Timings</th>
									<?php  //if( $this->ion_auth_acl->has_permission('vendor_approval')):?>
										<th>Approve</th>
									<?php //endif;?>
									<th>Actions</th>
								</tr>
							</thead>
							<tbody>
							<?php if(!empty($vendors)):?>
    							<?php $sno = 1; foreach ($vendors as $vendor):?>
    								<tr>
    									<td><?php echo $sno++;?></td>
    									<td><?php foreach ($executive as $ex): if($vendor['executive_id'] == $ex['id']):?>
    									<?php echo $ex['unique_id'];?>
    									<?php endif;endforeach;?></td>
    									<td><?php echo $vendor['name'];?></td>
    									<td><?php if(isset($vendor['location'])){
    									    echo $vendor['location']['address'];
    									}?></td>
    									<td><?php foreach ($constituency as $con): if($vendor['constituency_id'] == $con['id']):?>
    									<?php echo $con['name'];?>
    									<?php endif;endforeach;?></td>
    									<td><?php foreach ($categories as $category): if($vendor['category_id'] == $category['id']):?>
    									<?php echo $category['name'];?>
    									<?php endif;endforeach;?></td>
    									<td><?php echo $vendor['created_at'];?></td>
    									<?php  //if( $this->ion_auth_acl->has_permission('vendor_approval')):?>
    										<td><input type="checkbox" class="approve_toggle" vendor_id="<?php echo $vendor['id'];?>" user_id="<?php echo $this->session->userdata('user_id');?>" <?php echo ($vendor['status'] == 1) ? 'checked':'' ;?>  data-toggle="toggle" data-style="ios" data-on="Approved" data-off="Dispprove" data-onstyle="success" data-offstyle="danger"></td>
    									<?php //endif;?>
    									<td><!-- <a href="#" class=" mr-2  " type="category" > <i class="fas fa-pencil-alt"></i>
    									</a> --> <a href="#" class="mr-2  text-danger " onClick="delete_record(<?php echo $vendor['id'];?>, 'vendors')"> <i	class="far fa-trash-alt"></i>
    									</a>
    									<a href="<?php echo base_url();?>vendor_profile/edit?id=<?php echo $vendor['id']; ?>" class="mr-2  " > <i	class="fas fa-pencil-alt"></i>
    									</a>
    									<a href="<?=base_url('vendors/vendor?vendor_id=').$vendor['id'];?>" target="_blank" class=" mr-2  " type="category" > <i class="fas fa-eye"></i>
    									</a>
    									<a href="<?=base_url('vendor_payments/r?vendor_id=').$vendor['id']."&id=".$vendor['vendor_user_id'];?>" target="_blank" class=" mr-2  " type="category" > <i class="fa fa-book"></i>
    									</a>
    									</td>
    
    								</tr>
    							<?php endforeach;?>
							<?php else :?>
							<tr ><th colspan='8'><h3><center>No Vendor</center></h3></th></tr>
							<?php endif;?>
							</tbody>
						</table>
					</div>
				</div>
			</div>


		</div>

	</div>
</div>
<?php elseif($type == 'approved') :?>
<!--Add Category And its list-->
<div class="row">
	<div class="col-12">
		<h4 class="ven">All Vendors</h4>
		<a class="btn btn-outline-dark btn-lg col-2" href="<?php echo base_url('vendor_excel_import')?>"><i class="fa fa-plus" aria-hidden="true"></i> Add Vendor</a>
		<div class="card-body">
			<div class="card">
				<div class="card-header">
					<h4 class="ven">List of Vendors</h4>
				</div>
				<div class="card-body">
					<div class="table-responsive">
						<table class="table table-striped table-hover" id="tableExportNoPagination"
							style="width: 100%;">
							<thead>
								<tr>
									<th>Sno</th>
									<th>Name</th>
									<th>Email</th>
									<th>Address</th>
									<?php  if( $this->ion_auth_acl->has_permission('vendor_approval')):?>
										<th>Category</th>
									<?php endif;?>
									<th>Approve</th>
									<th>Actions</th>
								</tr>
							</thead>
							<tbody>
							<?php if(!empty($vendors)):?>
    							<?php $sno = 1; foreach ($vendors as $vendor):?>
    								<tr>
    									<td><?php echo $sno++;?></td>
    									<td><?php echo $vendor['name'];?></td>
    									<td><?php echo $vendor['email'];?></td>
    									<td><?php if(isset($vendor['location'])){
    									    echo $vendor['location']['address'];
    									}?></td>
    									<td><?php foreach ($categories as $category): if($vendor['category_id'] == $category['id']):?>
    									<?php echo $category['name'];?>
    									<?php endif;endforeach;?></td>
    									<?php  if( $this->ion_auth_acl->has_permission('vendor_approval')):?>
    										<td><input type="checkbox" class="approve_toggle" vendor_id="<?php echo $vendor['id'];?>" user_id="<?php echo $this->session->userdata('user_id');?>" <?php echo ($vendor['status'] == 1) ? 'checked':'' ;?>  data-toggle="toggle" data-style="ios" data-on="Approved" data-off="Dispprove" data-onstyle="success" data-offstyle="danger"></td>
    									<?php endif;?>
    									<td><!-- <a href="#" class=" mr-2  " type="category" > <i class="fas fa-pencil-alt"></i>
    									</a> --> <a href="#" class="mr-2  text-danger " onClick="delete_record(<?php echo $vendor['id'] ?>, 'vendors')"> <i
    											class="far fa-trash-alt"></i>
    									</a>
    									<a href="<?=base_url('vendors/vendor?vendor_id=').$vendor['id'];?>" target="_blank" class=" mr-2  " type="category" > <i class="fas fa-eye"></i>
    									</a>
    								</td>
    
    								</tr>
    							<?php endforeach;?>
							<?php else :?>
							<tr ><th colspan='8'><h3><center>No Vendor</center></h3></th></tr>
							<?php endif;?>
							</tbody>
						</table>
					</div>
				</div>
			</div>


		</div>

	</div>
</div>
<?php elseif($type == 'pending') :?>
<!--Add Category And its list-->
<div class="row">
	<div class="col-12">
		<h4 class="ven">All Vendors</h4>
		<a class="btn btn-outline-dark btn-lg col-2" href="<?php echo base_url('vendor_excel_import')?>"><i class="fa fa-plus" aria-hidden="true"></i> Add Vendor</a>
		<div class="card-body">
			<div class="card">
				<div class="card-header">
					<h4 class="ven">List of Vendors</h4>
				</div>
				<div class="card-body">
					<div class="table-responsive">
						<table class="table table-striped table-hover" id="tableExportNoPagination"
							style="width: 100%;">
							<thead>
								<tr>
									<th>Sno</th>
									<th>Name</th>
									<th>Email</th>
									<th>Address</th>
									<th>Category</th>
									<?php  if( $this->ion_auth_acl->has_permission('vendor_approval')):?>
										<th>Approve</th>
									<?php endif;?>
									<th>Actions</th>
								</tr>
							</thead>
							<tbody>
							<?php if(!empty($vendors)):?>
    							<?php $sno = 1; foreach ($vendors as $vendor):?>
    								<tr>
    									<td><?php echo $sno++;?></td>
    									<td><?php echo $vendor['name'];?></td>
    									<td><?php echo $vendor['email'];?></td>
    									<td><?php if(isset($vendor['location'])){
    									    echo $vendor['location']['address'];
    									}?></td>
    									<td><?php foreach ($categories as $category): if($vendor['category_id'] == $category['id']):?>
    									<?php echo $category['name'];?>
    									<?php endif;endforeach;?></td>
    									<?php  if( $this->ion_auth_acl->has_permission('vendor_approval')):?>
    										<td><input type="checkbox" class="approve_toggle" vendor_id="<?php echo $vendor['id'];?>" user_id="<?php echo $this->session->userdata('user_id');?>" <?php echo ($vendor['status'] == 1) ? 'checked':'' ;?>  data-toggle="toggle" data-style="ios" data-on="Approved" data-off="Dispprove" data-onstyle="success" data-offstyle="danger"></td>
    									<?php endif;?>
    									<td><!-- <a href="#" class=" mr-2  " type="category" > <i class="fas fa-pencil-alt"></i>
    									</a> --> <a href="#" class="mr-2  text-danger " onClick="delete_record(<?php echo $vendor['id'] ?>, 'vendors')"> <i
    											class="far fa-trash-alt"></i>
    									</a>
    									<a href="<?=base_url('vendors/vendor?vendor_id=').$vendor['id'];?>" target="_blank" class=" mr-2  " type="category" > <i class="fas fa-eye"></i>
    									</a>
    								</td>
    
    								</tr>
    							<?php endforeach;?>
							<?php else :?>
							<tr ><th colspan='8'><h3><center>No Vendor</center></h3></th></tr>
							<?php endif;?>
							</tbody>
						</table>
					</div>
				</div>
			</div>


		</div>

	</div>
</div>
<?php elseif($type == 'cancelled') :?>
<!--Add Category And its list-->
<div class="row">
	<div class="col-12">
		<h4 class="ven">All Vendors</h4>
		<a class="btn btn-outline-dark btn-lg col-2" href="<?php echo base_url('vendor_excel_import')?>"><i class="fa fa-plus" aria-hidden="true"></i> Add Vendor</a>
		<div class="card-body">
			<div class="card">
				<div class="card-header">
					<h4 class="ven">List of Vendors</h4>
				</div>
				<div class="card-body">
					<div class="table-responsive">
						<table class="table table-striped table-hover" id="tableExportNoPagination"
							style="width: 100%;">
							<thead>
								<tr>
									<th>Sno</th>
									<th>Name</th>
									<th>Email</th>
									<th>Address</th>
									<th>Category</th>
									<?php  if( $this->ion_auth_acl->has_permission('vendor_approval')):?>
										<th>Approve</th>
									<?php endif;?>
									<th>Actions</th>
								</tr>
							</thead>
							<tbody>
							<?php if(!empty($vendors)):?>
    							<?php $sno = 1; foreach ($vendors as $vendor):?>
    								<tr>
    									<td><?php echo $sno++;?></td>
    									<td><?php echo $vendor['name'];?></td>
    									<td><?php echo $vendor['email'];?></td>
    									<td><?php if(isset($vendor['location'])){
    									    echo $vendor['location']['address'];
    									}?></td>
    									<td><?php foreach ($categories as $category): if($vendor['category_id'] == $category['id']):?>
    									<?php echo $category['name'];?>
    									<?php endif;endforeach;?></td>
    									<?php  if( $this->ion_auth_acl->has_permission('vendor_approval')):?>
    										<td><input type="checkbox" class="approve_toggle" vendor_id="<?php echo $vendor['id'];?>" user_id="<?php echo $this->session->userdata('user_id');?>" <?php echo ($vendor['status'] == 1) ? 'checked':'' ;?>  data-toggle="toggle" data-style="ios" data-on="Approved" data-off="Dispprove" data-onstyle="success" data-offstyle="danger"></td>
    									<?php endif;?>
    									<td><!-- <a href="#" class=" mr-2  " type="category" > <i class="fas fa-pencil-alt"></i>
    									</a> --> <a href="#" class="mr-2  text-danger " onClick="delete_record(<?php echo $vendor['id'] ?>, 'vendors')" > <i
    											class="far fa-trash-alt"></i>
    									</a>
    									<a href="<?=base_url('vendors/vendor?vendor_id=').$vendor['id'];?>" target="_blank" class=" mr-2  " type="category" > <i class="fas fa-eye"></i>
    									</a>
    								</td>
    
    								</tr>
    							<?php endforeach;?>
							<?php else :?>
							<tr ><th colspan='8'><h3><center>No Vendor</center></h3></th></tr>
							<?php endif;?>
							</tbody>
						</table>
					</div>
				</div>
			</div>


		</div>

	</div>
</div>
<?php endif;?>


