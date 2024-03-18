<div class="row">
	<div class="col-12">
		<div class="card">
			<form class="needs-validation" novalidate=""
				action="<?php echo base_url('profile/u');?>" method="post"
				enctype="multipart/form-data">
				<div class="card-body">
					<h4 class="ven">Profile</h4>
					<div class="form-row">
						<div class="form-group col-md-6">
							<label>First Name</label> <input type="text"
								class="form-control" name="fname" required="" value=<?php echo $user->first_name?>>
							<div class="invalid-feedback">First Name?</div>
							<?php echo form_error('fname','<div style="color:red">','</div>');?>
							
						</div>
						<div class="form-group col-md-6">
							<label>Last Name</label> <input type="text"
								class="form-control" name="lname" required="" value=<?php echo $user->last_name?>>
							<div class="invalid-feedback">Last Name?</div>
							<?php echo form_error('lname','<div style="color:red">','</div>');?>
							
						</div>
						<div class="form-group col-md-6">
							<label>Email</label> <input type="text"
								class="form-control" name="email" required="" value=<?php echo $user->email?>>
							<div class="invalid-feedback">Email?</div>
							<?php echo form_error('email','<div style="color:red">','</div>');?>
							
						</div>
						<div class="form-group col-md-6">
							<label>Mobile Number</label> <input type="text"
								class="form-control" name="phone" required="" value=<?php echo $user->phone?>>
							<div class="invalid-feedback">Mobile Number?</div>
							<?php echo form_error('phone','<div style="color:red">','</div>');?>
							
						</div>
						<div class="form-group col-md-12">
							<button class="btn btn-primary mt-27 ">Update</button>
						</div>
					</div>
				</div>
			</form>
		</div>
		<div class="card">
			<form class="needs-validation" novalidate=""
				action="<?php echo base_url('profile/reset');?>" method="post"
				enctype="multipart/form-data">
				<div class="card-body">
					<h4 class="ven">Reset Password</h4>
					<?php echo $this->session->flashdata('message');?>
					<div class="form-row">
						<div class="form-group col-md-12">
							<label>Old Password</label> <input type="password"
								class="form-control" name="opass" required="" value=<?php echo set_value('opass')?>>
							<div class="invalid-feedback">Old Passoword?</div>
							<?php echo form_error('opass','<div style="color:red">','</div>');?>
							
						</div>
						<div class="form-group col-md-12">
							<label>New Password</label> <input type="text"
								class="form-control" name="npass" required="" value=<?php echo set_value('npass')?>>
							<div class="invalid-feedback">New Password?</div>
							<?php echo form_error('npass','<div style="color:red">','</div>');?>
							
						</div>
						<div class="form-group col-md-12">
							<label>Confirm Password</label> <input type="password"
								class="form-control" name="cpass" required="" value=<?php echo set_value('cpass')?>>
							<div class="invalid-feedback">Confirm Password?</div>
							<?php echo form_error('cpass','<div style="color:red">','</div>');?>
							
						</div>
						<div class="form-group col-md-12">
							<button class="btn btn-primary mt-27 ">Update</button>
						</div>


					</div>
				</div>
			</form>
		</div>
	</div>
</div>