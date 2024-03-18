
<!--Add Role(Group) And its list-->
<div class="row">
	<div class="col-12">
		<h4 class="ven">Add Role(Group)</h4>
		<form class="needs-validation" novalidate="" action="<?php echo base_url('role/c') ?>" method="post">
			<div class="card-header">

				<div class="form-row">
					<div class="form-group col-md-3">
						<label>Role(group) Name</label> <input type="text" name="name" placeholder="Role Name"
							class="form-control" required="">
						<div class="invalid-feedback">Enter role Name?</div>
					</div>
					<div class="form-group col-md-3">
						<label>ID Prefix</label> <input type="text" name="prefix" placeholder="ID Prefix"
							class="form-control" required="">
						<div class="invalid-feedback">Enter User Id Prefix?</div>
					</div>
					<div class="form-group col-md-3">
						<label>Priority</label> <input type="text" name="priority" placeholder="Priority"
							class="form-control" required="">
						<div class="invalid-feedback">Enter priority?</div>
					</div>
					<div class="form-group col-md-3">
						<label>Description</label> <input type="text" name="desc" class="form-control" placeholder="Description"
							required="">
						<div class="invalid-feedback">Type any Description?</div>
					</div>
					 <div class="form-group col-md-12" ><label>Terms And Conditions</label>
          				<textarea cols="80" id="role_terms" class="ckeditor" name="terms" rows="10" data-sample-short></textarea>
          				<?php echo form_error('terms', '<div style="color:red">', '</div>');?>
        			</div>
        			<div class="form-group col-md-12" ><label>Privacy Policy</label>
          				<textarea cols="80" id="role_privacy" class="ckeditor" name="privacy" rows="10" data-sample-short></textarea>
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
                                                <td><?php echo form_radio("perm_{$v['id']}", '1', set_radio("perm_{$v['id']}", '1', FALSE)); ?></td>
                                                <td><?php echo form_radio("perm_{$v['id']}", '0', set_radio("perm_{$v['id']}", '0', FALSE)); ?></td>
                                                <td><?php echo form_radio("perm_{$v['id']}", 'X', set_radio("perm_{$v['id']}", 'X', TRUE)); ?></td>
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

		<div class="card-body">
			<div class="card">
				<div class="card-header">
					<h4 class="ven">List of Roles</h4>
				</div>
				<div class="card-body">
					<div class="table-responsive">
						<table class="table table-striped table-hover" id="tableExport"
							style="width: 100%;">
							<thead>
								<tr>
									<th>Role Id</th>
									<th>Role</th>
									<th>Code</th>
									<th>Priority</th>
									<th>Description</th>
									<th>Permissions</th>
									<th>Actions</th>

								</tr>
							</thead>
							<tbody>
							<?php $i = 1;foreach ($groups as $group):?>
								<tr>
									<td><?php echo $i++;?></td>
									<td><?php echo $group['name'];?></td>
									<td><?php echo $group['code'];?></td>
									<td><?php echo $group['priority'];?></td>
									<td><?php echo $group['description'];?></td>
									<td>
										<ul>
										<?php if(isset($group['permissions'])){ foreach ($group['permissions'] as $permission):?>
											<li><?php echo $permission['perm_name'];?></li>
										<?php endforeach;}?>
										</ul>
									</td>


									<td><a href="<?php echo base_url()?>role/edit?id=<?php echo $group['id'];?>" class=" mr-2  "> <i class="fas fa-pencil-alt"></i>
									</a> <a href="#" class="mr-2  text-danger " onClick="delete_record(<?php echo $group['id'] ?>, 'role')"> <i
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