<?php if($type == 'user'){?>
<div class="row">
	<div class="col-12">
		<h4 class="ven">Edit Employee</h4>
		<form class="needs-validation" novalidate=""
			action="<?php echo base_url('employee/u');?>" method="post"
			enctype="multipart/form-data">
			<div class="card-header">
				<div class="form-row">
					<div class="form-group col-md-6">
						<label>First Name</label> <input type="text" name="first_name"
							class="form-control" required=""
							value="<?php echo $users['first_name'];?>">
						<div class="invalid-feedback">Enter First Name?</div>
					</div>
					<input type="hidden" name="id" value="<?php echo $users['id'] ; ?>"><br>
					<div class="form-group col-md-6">
						<label>Last Name</label> <input type="text" name="last_name"
							class="form-control" required=""
							value="<?php echo $users['last_name'];?>">
						<div class="invalid-feedback">Enter Last Name?</div>
					</div>
					<div class="form-group col-md-6">
						<label>Mobile No.</label> <input type="text" name="phone"
							class="form-control" required=""
							value="<?php echo $users['phone'];?>">
						<div class="invalid-feedback">Enter Mobile number?</div>
					</div>
					<div class="form-group col-md-6">
						<label>Email ID</label> <input type="email" name="email"
							class="form-control" required=""
							value="<?php echo $users['email'];?>">
						<div class="invalid-feedback">Enter Email ID?</div>
					</div>
					<div class="form-group col-md-6">
						<label>Role(Group)</label> <select id="example-getting-started" class="form-control"
							name="role[]" required="" 
							multiple>
                            <?php foreach ($groups as $group): ?>
                            		<option value="<?php echo $group['id'];?>" <?php echo (in_array($group['id'],array_column($users['groups'], 'id')))? 'selected': '';?>><?php echo $group['name']?></option>
                            <?php endforeach;?>
                            </select>
						<div class="invalid-feedback">Select the role for User?</div>
					</div>
					<div class="form-group col-md-12">
						<button type="submit" name="upload" id="upload" value="Apply"
							class="btn btn-primary mt-27 " id="btnSubmit">Update</button>
					</div>
				</div>


			</div>
		</form>
	</div>
</div>
<?php }elseif ($type == 'role'){?>

<!--Add Role(Group) And its list-->
<div class="row">
	<div class="col-12">
		<h4 class="ven">Add Role(Group)</h4>
		<form class="needs-validation" novalidate="" action="<?php echo base_url('role/u') ?>" method="post">
			<div class="card-header">

				<div class="form-row">
					<div class="form-group col-md-3">
						<label>Role(group) Name</label> <input type="text" name="name"
							class="form-control" required="" value="<?php echo $group['name'];?>">
						<div class="invalid-feedback">Enter role Name?</div>
					</div>
					<input type="hidden" name="id" value="<?php echo $group['id'] ; ?>"><br>
					<div class="form-group col-md-3">
						<label>ID Prefix</label> <input type="text" name="prefix"
							class="form-control" required="" value="<?php echo $group['code'];?>">
						<div class="invalid-feedback">Enter User Id Prefix?</div>
					</div>
					<div class="form-group col-md-3">
						<label>Priority</label> <input type="text" name="priority"
							class="form-control" required="" value="<?php echo $group['priority'];?>">
						<div class="invalid-feedback">Enter priority?</div>
					</div>
					<div class="form-group col-md-3">
						<label>Description</label> <input type="text" name="desc" class="form-control"
							required="" value="<?php echo $group['description'];?>">
						<div class="invalid-feedback">Type any Description?</div>
					</div>
					 <div class="form-group col-md-12" ><label>Terms And Conditions</label>
          				<textarea cols="80" id="role_terms" name="terms" class="ckeditor" rows="10" data-sample-short><?php echo $group['terms'];?></textarea>
          				<?php echo form_error('terms', '<div style="color:red">', '</div>');?>
        			</div>
        			<div class="form-group col-md-12" ><label>Privacy Policy</label>
          				<textarea id="role_privacy" class="ckeditor" name="privacy" rows="10" data-sample-short><?php echo $group['privacy'];?></textarea>
          				<?php echo form_error('privacy', '<div style="color:red">', '</div>');?>
        			</div>
					
				</div>
				<div class="form-row">
					<div class="card-body">
            			<div class="card">
            				<div class="card-header">
            					<h4 class="ven">List of Permissions</h4>
            				</div>
            				<div class="card-body">
            					<div class="table-responsive">
            						<table class="table table-striped table-hover" id=""
            							style="width: 100%;">
            							<thead>
            								<tr>
            									<th>Role Id</th>
            									<th>Allow</th>
            									<th>Deny</th>
            									<th>Ignore</th>
            								</tr>
            							</thead>
            							<tbody>
            							<?php if(!empty($permissions)) : ?>
                                            <?php foreach($permissions as $k => $v) : ?>
                                            <tr>
                                                <td><?php echo $v['name']; ?></td>
                                                <td><?php echo form_radio("perm_{$v['id']}", '1', set_radio("perm_{$v['id']}", '1', ( array_key_exists($v['key'], $group_permissions) && $group_permissions[$v['key']]['value'] === TRUE ) ? TRUE : FALSE)); ?></td>
                                                <td><?php echo form_radio("perm_{$v['id']}", '0', set_radio("perm_{$v['id']}", '0', ( array_key_exists($v['key'], $group_permissions) && $group_permissions[$v['key']]['value'] != TRUE ) ? TRUE : FALSE)); ?></td>
                                                <td><?php echo form_radio("perm_{$v['id']}", 'X', set_radio("perm_{$v['id']}", 'X', ( ! array_key_exists($v['key'], $group_permissions) ) ? TRUE : FALSE)); ?></td>
                                            </tr>
                                            <?php endforeach; ?>
                                        <?php else: ?>
                                            <tr>
                                                <td colspan="4">There are currently no permissions to manage, please add some permissions</td>
                                            </tr>
                                        <?php endif; ?>
            							</tbody>
            						</table>
            					</div>
            				</div>
            			</div>
            
            
            		</div>
				</div>
                    <div class="form-group col-md-12">
						<button class="btn btn-primary mt-27 " id="btnSubmit">Submit</button>
					</div>
			</div>
		</form>

	</div>
</div>

<?php }?>