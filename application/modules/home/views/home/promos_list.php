
<!--Add Category And its list-->
<div class="row">
	<div class="col-12">
		<h4 class="ven">Promo Codes</h4>
		<form class="needs-validation" novalidate="" action="<?php echo base_url('promos/c');?>" method="post" enctype="multipart/form-data">
			<div class="card-header">
				<div class="form-row">
					<div class="form-group col-md-4">
						<label>Promo Title</label> <input type="text" name="promo_title"
							required="" value="<?php echo set_value('promo_title')?>"
							class="form-control">
						<div class="invalid-feedback">Promo Title?</div>
						<?php echo form_error('promo_title', '<div style="color:red">', '</div>');?>
					</div>
					<div class="form-group col-md-4">
						<label>Promo Code</label> <input type="text" name="promo_code"
							required="" value="<?php echo set_value('promo_code')?>"
							class="form-control">
						<div class="invalid-feedback">Promo Code?</div>
						<?php echo form_error('promo_code', '<div style="color:red">', '</div>');?>
					</div>
					<div class="form-group col-md-4">
						<label>Promo Type</label>
						<select class="form-control" name="promo_type" required=""  onchange="return promo_to_check(this.value)">
							<option value="1">Munchieez</option>
							<!-- <option value="2">All Vendors</option>
							<option value="3">Few Vendors</option> -->
						</select>
						<div class="invalid-feedback">Promo Type?</div>
						<?php echo form_error('promo_type','<div style="color:red>"','</div>');?>
					</div>
					<div class="form-group col-md-4" id="vendors_list" style="display:none;">
						<label>Vendors</label>
						<select id="brands_multiselect" class="form-control"
							name="vendors[]"  multiple>
    							 <?php
                                    foreach ($vendors as $row) {
                                        ?>
                                        <option value="<?=$row['vendor_user_id'];?>"><?=$row['name'];?></option>
                                        <?php
                                    }
                                    ?>
						</select>
						<div class="invalid-feedback">New Category Name?</div>
						<?php echo form_error('cat_id', '<div style="color:red">', '</div>');?>
					</div>
					<div class="form-group col-md-4">
						<label>Promo Label</label> <input type="text" name="promo_label"
							required="" value="<?php echo set_value('promo_label')?>"
							class="form-control">
						<div class="invalid-feedback">Promo Label?</div>
						<?php echo form_error('promo_label', '<div style="color:red">', '</div>');?>
					</div>
					<div class="form-group col-md-4">
						<label>Start Date</label> <input type="text" name="start_date"
							required="" value="<?php echo set_value('start_date')?>"
							class="form-control" id="start_date">
						<div class="invalid-feedback">Start Date?</div>
						<?php echo form_error('start_date', '<div style="color:red">', '</div>');?>
					</div>
					<div class="form-group col-md-4">
						<label>End Date</label> <input type="text" name="end_date"
							required="" value="<?php echo set_value('end_date')?>"
							class="form-control" id="end_date" >
						<div class="invalid-feedback">End Date?</div>
						<?php echo form_error('end_date', '<div style="color:red">', '</div>');?>
					</div>
					<div class="form-group col-md-4">
						<label>Discount Type</label>
						<select class="form-control" name="discount_type" required="" >
							<option value="2">Percentage</option>
							<option value="1">Amount</option>
						</select>
						<div class="invalid-feedback">Discount Type?</div>
						<?php echo form_error('discount_type','<div style="color:red>"','</div>');?>
					</div>
					<div class="form-group col-md-4">
						<label>Discount</label> <input type="number" name="discount"
							required="" value="<?php echo set_value('discount')?>"
							class="form-control" min="1">
						<div class="invalid-feedback">discount?</div>
						<?php echo form_error('discount', '<div style="color:red">', '</div>');?>
					</div>
					<div class="form-group col-md-4">
						<label>No.Of Uses</label> <input type="number" name="uses"
							required="" value="<?php echo set_value('uses')?>"
							class="form-control" min="1">
						<div class="invalid-feedback">Uses?</div>
						<?php echo form_error('uses', '<div style="color:red">', '</div>');?>
					</div>
					<div class="form-group col-md-4">
						<label>Promo Status</label>
						<select class="form-control" name="status" required="" >
							<option value="1">Active</option>
							<option value="2">Inactive</option>
						</select>
						<div class="invalid-feedback">Promo Status?</div>
						<?php echo form_error('status','<div style="color:red>"','</div>');?>
					</div>
					<div class="form-group col-md-12">
						<button type="submit" name="upload" id="upload" value="Apply"
							class="btn btn-primary mt-27 ">Submit</button>
					</div>
				</div>
			</div>
		</form>

		<div class="card-body">
			<div class="card">
				<div class="card-header">
					<h4 class="ven">List of Promos</h4>
				</div>
				<div class="card-body">
					<div class="table-responsive">
						<table class="table table-striped table-hover" id="tableExport"
							style="width: 100%;">
							<thead>
								<tr>
									<th>Sno</th>
									<th>Promo Title</th>
									<th>Promo Code</th>
									<th>Promo Type</th>
									<th>Promo Label</th>
									<th>Valid</th>
									<th>Discount Type</th>
									<th>Discount</th>
									<th>No.Of Uses</th>
									<th>Status</th>
									<th>Actions</th>
								</tr>
							</thead>
							<tbody>
							<?php if(!empty($promos)):?>
    							<?php  $sno = 1; foreach ($promos as $pro): ?>
    								<tr>
									<td><?php echo $sno++;?></td>
									<td><?=$pro['promo_title']?></td>
									<td><?=$pro['promo_code']?></td>
									<td><?php if($pro['promo_label']==1){echo 'Nextclick';}else{echo 'Not Available';} ;?><?=$pro['promo_type']?></td>
									<td><?=$pro['promo_label']?></td>
									<td><?=date('d M,Y',strtotime($pro['valid_from'])).' <br/>to<br/> '.date('d M,Y',strtotime($pro['valid_to']));?></td>
									<td><?=$pro['discount_type']?></td>
									<td><?=$pro['discount']?></td>
									<td><?=$pro['uses']?></td>
									<td><?=($pro['status']==1)? 'Available' : 'Not Available' ;?></td>
									<td>
									<!-- <a
										href="<?php echo base_url()?>food_menu/edit?id=<?php echo base64_encode(base64_encode($food_item['id'])); ?>"
										class=" mr-2  " type="ecom_category"> <i class="fas fa-pencil-alt"></i>
									</a> --> 
									<a href="#" class="mr-2  text-danger " onClick="delete_record(<?php echo $pro['id'] ?>, 'promos')"> <i
    											class="far fa-trash-alt"></i>
    									</a>
    								</td>

								</tr>
    							<?php endforeach;?>
							<?php else :?>
							<tr>
									<th colspan='11'><h3>
											<center>No Promos Available</center>
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
<script type="text/javascript">
    function promo_to_check(promo_type) {
        $('#vendors_list').hide();
        if(promo_type==3){
            $('#vendors_list').show();
        }
    }
</script>