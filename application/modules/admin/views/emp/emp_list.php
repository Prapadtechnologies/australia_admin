<?php if($type == 'executive'){ ?>

<div class="row">
	<div class="card-body">
			<div class="card">
				<div class="card-header">
					<h4 class="ven">List of Executives</h4>
				</div>
				<div class="card-body">
					<div class="table-responsive">
						<table class="table table-striped table-hover" id="tableExport"
							style="width: 100%;">
							<thead>
								<tr>
									<th>Sno</th>
									<th>Emp Id</th>
									<th>Name</th>
									<th>email</th>
									<th>No of Vendors</th>
									<th>Actions</th>

								</tr>
							</thead>
							<tbody>
							<?php if(!empty($executives)):?>
    							<?php  $sno = 1; foreach ($executives as $executive): ?>
    								<tr>
									<td><?php echo $sno++;?></td>
									<td><?php echo $executive['unique_id'];?></td>
									<td><?php echo $executive['first_name'].' '.$executive['last_name'];?></td>
									<td><?php echo $executive['email'];?></td>
									<td><?php if(! empty($executive['vendors'])){echo count($executive['vendors']);}else{echo "0";}?></td>
									<td>
										<!-- <a href="#" class="mr-2" type="category"> <i class="fas fa-eye"></i></a>  -->
										<a href="<?=base_url('vendor_payments/r?id=').$executive['id'];?>" target="_blank" class=" mr-2  " type="category" > <i class="fa fa-book"></i>
    									</a>
										<a href="<?php echo base_url()?>emp_list/executive?exe_id=<?php echo $executive['id']?>" class="mr-2" type="category"> <i class="fas fa-user"></i></a>
									</td>
								</tr>
    							<?php endforeach;?>
							<?php else :?>
							<tr>
									<th colspan='6'><h3>
											<center>No Executives</center>
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
<?php }?>

<?php if($type == 'users'){ ?>

<div class="row">
	<div class="card-body">
			<div class="card">
				<div class="card-header">
					<h4 class="ven">List of Users</h4>
				</div>
				<div class="card-body">
					<div class="table-responsive">
						<table class="table table-striped table-hover" id="tableExport"
							style="width: 100%;">
							<thead>
								<tr>
									<th>Sno</th>
									<th>Emp Id</th>
									<th>Name</th>
									<th>Email</th>
									<th>Wallet Amount</th>
									<th>Actions</th>

								</tr>
							</thead>
							<tbody>
							<?php if(!empty($executives)):?>
    							<?php  $sno = 1; foreach ($executives as $executive): ?>
    								<tr>
									<td><?php echo $sno++;?></td>
									<td><?php echo $executive['unique_id'];?></td>
									<td><?php echo $executive['first_name'].' '.$executive['last_name'];?></td>
									<td><?php echo $executive['email'];?></td>
									<td><?php echo $executive['wallet'];?></td>
									<td>
										<!-- <a href="#" class="mr-2" type="category"> <i class="fas fa-eye"></i></a>  -->

										<a href="<?=base_url('vendor_payments/r?id=').$executive['id'];?>" target="_blank" class=" mr-2  " type="category" > <i class="fa fa-book"></i>
    									</a>
    									<a href="<?php echo base_url()?>employee/edit?id=<?php echo $executive['id'];?>" class=" mr-2  "> <i class="fas fa-pencil-alt"></i>
    									</a>
    									<a href="#" class="mr-2  text-danger " onClick="delete_record(<?php echo $executive['id'] ?>, 'employee')"> <i
											class="far fa-trash-alt"></i>
										</a>
									</td>
								</tr>
    							<?php endforeach;?>
							<?php else :?>
							<tr>
									<th colspan='6'><h3>
											<center>No Users</center>
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
<?php }?>
