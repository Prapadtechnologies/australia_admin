<script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
<!--Add User And its list-->
<div class="row">
	<div class="col-12">
		<h4 class="ven">Add Employee</h4>
		<form class="needs-validation" novalidate=""
			action="<?php echo base_url('employee/c'); ?>" method="post">
			<div class="card-header">
				<div class="form-row">
					<div class="form-group col-md-6">
						<label>First Name</label> <input type="text" name="first_name" placeholder="First Name"
							class="form-control" required="" >
						<div class="invalid-feedback">Enter First Name?</div>
						<?php echo form_error('first_name','<div style="color:red">','</div>')?>
					</div>
					<div class="form-group col-md-6">
						<label>Last Name</label> <input type="text" name="last_name" placeholder="Last Name"
							class="form-control" required="">
						<div class="invalid-feedback">Enter Last Name?</div>
						<?php echo form_error('last_name','<div style="color:red">','</div>')?>
					</div>
					<div class="form-group col-md-6">
						<label>Mobile No.</label> <input type="tel"  id="mobile" name="phone"  maxlength="10" placeholder="Mobile No"
							class="form-control" required="" >
						<div class="invalid-feedback">Enter Mobile number?</div>
						<?php echo form_error('phone','<div style="color:red">','</div>')?>
					</div>
					<div class="form-group col-md-6">
						<label>Email ID</label> <input type="email" name="email" placeholder="Email ID"
							class="form-control" required="">
						<div class="invalid-feedback">Enter Email ID?</div>
						<?php echo form_error('email','<div style="color:red">','</div>')?>
					</div>
					<div class="form-group col-md-6">
						<label>Password</label> <input type="password" class="form-control" placeholder="Password"
							name="password" id="Password" required="">
						<?php echo form_error('password','<div style="color:red">','</div>')?>
					</div>
					<div class="form-group col-md-6">
						<label>Confirm Password</label> <input type="password"
							class="form-control" name="confirm_password" id="ConfirmPassword" placeholder="Confirm Password"
							required="">
						<?php echo form_error('confirm_password','<div style="color:red">','</div>')?>
					</div>

					<div class="form-group col-md-6">
						<label>Role(Group)</label> <br>
						<select id="example-getting-started" class="form-control" multiple="multiple" name="role[]">
                                                    	<?php foreach ($groups as $group):?>
                                                        	<option 
                        								value="<?php echo $group['id'];?>"><?php echo $group['name']?></option>
                                                        <?php endforeach;?>
                        </select>
						<div class="invalid-feedback">Select the role for User?</div>
					</div>

					<div class="form-group col-md-12">

						<button class="btn btn-primary mt-27 " id="btnSubmit">Submit</button>
					</div>
				</div>


			</div>
		</form>

		<div class="card-body">
			<div class="card">
				<div class="card-header">
					<h4 class="ven">List of Employees</h4>
				</div>
				<div class="card-body">
					<div class="table-responsive">
						<table class="table table-striped table-hover" id="tableExport"
							style="width: 100%;">
							<thead>
								<tr>
									<th>S.no</th>
									<th>User Id</th>
									<th>User Name</th>
									<th>Mobile</th>
									<th>Email</th>
									<th>Role</th>

									<th>Actions</th>

								</tr>
							</thead>
							<tbody>
                        <?php $i = 1; foreach ($users as $user):?>
                          <tr>
									<td><?php echo $i++;?></td>
									<td><?php echo $user['unique_id'];?></td>
									<td><?php echo $user['first_name'].' '.$user['last_name'];?></td>
									<td><?php echo $user['phone'];?></td>
									<td><?php echo $user['email'];?></td>
									<td>
										<ul>
									<?php foreach ($user['groups'] as $group):?>
										<li><?php echo $group['name']?></li>
									<?php endforeach;?>
								</ul>
									</td>
									
									<td>
										<a href="<?=base_url('vendor_payments/r?id=').$user['id'];?>" target="_blank" class=" mr-2  " type="category" > <i class="fa fa-book"></i>
    									</a>
										<a href="<?php echo base_url()?>employee/edit?id=<?php echo $user['id'];?>" class=" mr-2  "> <i class="fas fa-pencil-alt"></i>
									</a> <a href="#" class="mr-2  text-danger " onClick="delete_record(<?php echo $user['id'] ?>, 'employee')"> <i
											class="far fa-trash-alt"></i>
									</a> <!-- <a href="#" class="mr-2   "> <i
											class="fas fa-align-justify"></i>
									</a> --></td>

								</tr>
                          <?php endforeach;?>
                          
                          
                        </tbody>
						</table>
					</div>
				</div>
			</div>


		</div>

	</div>
</div>
