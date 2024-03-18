<script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
<!--Add User And its list-->
<div class="row">
	<div class="col-12">
		<div class="card">
			<h4 class="ven">Add Plan</h4>
			<form class="needs-validation" novalidate=""
				action="<?php echo base_url('addplan'); ?>" method="post">
				<div class="card-body">
					<div class="form-row">
						<div class="form-group col-md-3">
							<label>Plan Name</label> <input type="text" name="plan_name" placeholder="Plan Name"
								class="form-control" required="" value="<?php echo set_value('plan_name');?>" >
							<div class="invalid-feedback">Enter Plan Name?</div>
							<?php echo form_error('plan_name','<div style="color:red">','</div>')?>
						</div>
						<div class="form-group col-md-3">
							<label>Plan duration (in days)</label> <input type="number" name="plan_duration" placeholder="Plan Duration"
								class="form-control" required="" value="<?php echo set_value('plan_duration');?>">
							<div class="invalid-feedback">Enter plan duration?</div>
							<?php echo form_error('plan_duration','<div style="color:red">','</div>')?>
						</div>
						<div class="form-group col-md-2">
							<label>Min Amount</label> <input type="number"  id="min_amount" name="min_amount" placeholder="Min Amount" class="form-control" required="" value="<?php echo set_value('min_amount');?>">
							<div class="invalid-feedback">Enter Min Amount?</div>
							<?php echo form_error('min_amount','<div style="color:red">','</div>')?>
						</div>
						<div class="form-group col-md-2">
							<label>Interest (%)</label> <input type="number" name="interest" placeholder="Interest (%)"
								class="form-control" required="" value="<?php echo set_value('interest');?>">
							<div class="invalid-feedback">Enter Interest?</div>
							<?php echo form_error('interest','<div style="color:red">','</div>')?>
						</div>
						<div class="form-group col-md-2">
							<label>Interest for</label> <br>
							<select class="form-control" name="interest_for" required="">
								<option value="1" <?php echo ((set_value('interest_for') == '1')? 'selected':'');?>>1 Day</option>
								<option value="30" <?php echo ((set_value('interest_for') == '30')? 'selected':'');?>>30 Day</option>
								<option value="90" <?php echo ((set_value('interest_for') == '90')? 'selected':'');?>>90 Day</option>
								<option value="365" <?php echo ((set_value('interest_for') == '365')? 'selected':'');?>>365 Day</option>
	                        </select>
							<div class="invalid-feedback">Select the role for User?</div>
						</div>

						<div class="form-group col-md-12">

							<button class="btn btn-primary mt-27 " id="btnSubmit">Submit</button>
						</div>
					</div>


				</div>
			</form>
		</div>
		<div class="card">
			<div class="card-header">
				<h4 class="ven">List of Plans</h4>
			</div>
			<div class="card-body">
				<div class="table-responsive">
					<table class="table table-striped table-hover" id="tableExport"
						style="width: 100%;">
						<thead>
							<tr>
								<th>S.no</th>
								<th>Plan Name</th>
								<th>Plan Duration</th>
								<th>Min Amount</th>
								<th>Interest</th>
								<th>Interest For</th>
								<th>Actions</th>
							</tr>
						</thead>
						<tbody>
                    <?php $i = 1; foreach ($plans as $plan):?>
                      <tr>
								<td><?php echo $i++;?></td>
								<td><?php echo $plan['plan_name'];?></td>
								<td><?php echo $plan['plan_duration'].' Days';?></td>
								<td><?php echo $plan['min_amount'];?></td>
								<td><?php echo $plan['interest'].'(%)';?></td>
								<td><?php echo $plan['interest_for'].' Days';?></td>
								<td>
									<a href="<?php echo base_url()?>employee/edit?id=<?php echo $plan['id'];?>" class=" mr-2  "> <i class="fas fa-pencil-alt"></i>
									</a> 
									<a href="#" class="mr-2  text-danger " onClick="delete_record(<?php echo $plan['id'] ?>, 'employee')"> <i
										class="far fa-trash-alt"></i>
									</a>
								</td>

							</tr>
                      <?php endforeach;?>
                      
                      
                    </tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>
