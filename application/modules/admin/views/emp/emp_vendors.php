<div class="col-xl-3  col-md-4 col-sm-4">
	<a href="<?php echo base_url('vendors/all');?>">
		<div class="card">
			<div class="card-bg">
				<div class="p-t-20 d-flex justify-content-between">
					<div class="col">
						<h6 class="mb-0">Vendors</h6>
					</div>
				</div>
				<br/>
    			<div class="alert alert-sm alert-primary "><center><b><i class="fas fa-check-circle card-icon font-20 p-r-30"> <?php echo (isset($approved_count))? $approved_count: '0';?></i></b></<br><b><i class="fas fa-times-circle card-icon font-20 p-r-30"> <?php echo (isset($disapproved_count))? $disapproved_count: '0';?></i></b></center></div>
		   </div>
		</div></a>
</div>

		<h4 class="ven">All Vendors</h4>

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
    									<td><?php echo $vendor['name'];?></td>
    									<td><?php echo $vendor['email'];?></td>
    									<td><?php if(isset($vendor['location'])){
    									    echo $vendor['location']['address'];
    									}?></td>
    									<td><?php foreach ($categories as $category): if($vendor['category_id'] == $category['id']):?>
    									<?php echo $category['name'];?>
    									<?php endif;endforeach;?></td>
    									<td><?php echo $vendor['created_at'];?></td>
    									<?php  //if( $this->ion_auth_acl->has_permission('vendor_approval')):?>
    										<td><input type="checkbox" class="approve_toggle" vendor_id="<?php echo $vendor['id'];?>" disabled user_id="<?php echo $this->session->userdata('user_id');?>" <?php echo ($vendor['status'] == 1) ? 'checked':'' ;?>  data-toggle="toggle" data-style="ios" data-on="Approved" data-off="Dispprove" data-onstyle="success" data-offstyle="danger"></td>
    									<?php //endif;?>
    									<td><!-- <a href="#" class=" mr-2  " type="category" > <i class="fas fa-pencil-alt"></i>
    									</a> --> <a href="#" class="mr-2  text-danger " onClick="delete_record(<?php echo $vendor['id'];?>, 'vendors')"> <i	class="far fa-trash-alt"></i>
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

	