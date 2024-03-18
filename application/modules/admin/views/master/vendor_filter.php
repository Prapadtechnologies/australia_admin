<style>
.page-item >a {
    position: relative;
    display: block;
    padding: .5rem .75rem;
    margin-left: -1px;
    line-height: 1.25;
    color: #007bff;
    background-color: #fff;
    border: 1px solid #dee2e6;
}
a {
    color: #007bff;
    text-decoration: none;
    background-color: transparent;
}

.pagination>li.active>a {
  background-color: orange !important;
}
.dataTables_filter {
display: none;
}
</style>
<!--Add Category And its list-->

			
<div class="row">
	<div class="col-12">
		<h4 class="ven">All Vendors</h4>
		<div class="card-body">
			<div class="card">
				<div class="card-header">
					<h4 class="ven">List of Vendors</h4>
					<a class="btn btn-outline-dark btn-lg col-2 pull-right" href="<?php echo base_url('vendor_excel_import')?>"><i class="fa fa-plus" aria-hidden="true"></i> Add Vendor</a>
					<form class="needs-validation justify-content-center" novalidate="" action="<?php echo base_url('vendors_filter/0');?>" method="post" enctype="multipart/form-data">
                    			
                						<input type="hidden" name="q"  placeholder="Search" value="" class="form-control">
                						<button type="submit" name="submit" id="upload" value="Apply"
                							class="btn btn-outline-primary btn-lg">All Vendors</button>
                					</div>
                    		</form>
				</div>
				<div class="card-body">
    				<div class="row ">
                    	<div class="col-12">
                    		  
                    		<form class=" form-inline" novalidate="" action="<?php echo base_url('vendors_filter/0');?>" method="post" enctype="multipart/form-data">
                    			<div class="card-header">
                    
                    				<div class="form-group">
                						<input type="text" name="q"  placeholder="Name" value="<?php echo $q;?>" class="form-control">
                						<b>OR</b>
                						<input type="text" name="exe"  placeholder="Executive" value="<?php echo $exe;?>" class="form-control">
                						<b>OR</b>
                						<input type="text" name="mobile"  placeholder="Mobile" value="<?php echo $mobile;?>" class="form-control">
                						<button type="submit" name="submit" id="upload" value="Apply"
                							class="btn btn-primary mt-27 ">Search</button>
                					</div>
                    		</form>
                    	</div>
                    </div>
					<div class="table-responsive">
						<table class="table table-striped table-hover" id="tableExportNoPagination"
							style="width: 100%;">
							<thead>
								<tr>
									<th>Sno</th>
									<th>Executive Id</th>
									<th>Name</th>
                                    <th>Phone</th>
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
                                        <td><?php echo $vendor['number'];?></td>
    									<td><?php echo $vendor['location_address'];?></td>
    									<td><?php foreach ($constituency as $con): if($vendor['constituency_id'] == $con['id']):?>
    									<?php echo $con['name'];?>
    									<?php endif;endforeach;?></td>
    									<td><?php foreach ($categories as $category): if($vendor['category_id'] == $category['id']):?>
    									<?php echo $category['name'];?>
    									<?php endif;endforeach;?></td>
    									<td><?php echo $vendor['created_at'];?></td>
    									<td><input type="checkbox" class="approve_toggle" vendor_id="<?php echo $vendor['id'];?>" user_id="<?php echo $this->session->userdata('user_id');?>" <?php echo ($vendor['status'] == 1) ? 'checked':'' ;?>  data-toggle="toggle" data-style="ios" data-on="Approved" data-off="Dispprove" data-onstyle="success" data-offstyle="danger"></td>
    									<td><!-- <a href="#" class=" mr-2  " type="category" > <i class="fas fa-pencil-alt"></i>
    									</a> --> <a href="#" class="mr-2  text-danger " onClick="delete_record(<?php echo $vendor['id'];?>, 'vendors')"> <i	class="far fa-trash-alt"></i>
    									</a>
    									<a href="<?php echo base_url();?>vendor_profile/edit?id=<?php echo $vendor['id']; ?>" class="mr-2  " > <i	class="fas fa-pencil-alt"></i>
    									</a>
<!--     									<a href="<?php //base_url('vendors/vendor?vendor_id=').$vendor['id'];?>" target="_blank" class=" mr-2  " type="category" > <i class="fas fa-eye"></i> -->    									</a>
    									<a href="<?=base_url('vendor_payments/r?vendor_id=').$vendor['id']."&id=".$vendor['vendor_user_id'];?>" target="_blank" class=" mr-2  " type="category" > <i class="fa fa-book"></i>
    									</a>
    									</td>
    
    								</tr>
    							<?php endforeach;?>
							<?php else :?>
							<tr ><th colspan='9'><h3><center>No Vendor</center></h3></th></tr>
							<?php endif;?>
							</tbody>
						</table>
					</div>
					 <!-- Paginate -->
                     <div>
                         <select onchange="my_list(this.value)">
                             <option value="10" <?=(($per_page == 10)? 'selected' : '');?>>10</option>
                             <option value="25" <?=(($per_page == 25)? 'selected' : '');?>>25</option>
                             <option value="50" <?=(($per_page == 50)? 'selected' : '');?>>50</option>
                             <option value="100" <?=(($per_page == 100)? 'selected' : '');?>>100</option>
                             <option value="250" <?=(($per_page == 250)? 'selected' : '');?>>250</option>
                             <option value="500" <?=(($per_page == 500)? 'selected' : '');?>>500</option>
                             <option value="1000" <?=(($per_page == 1000)? 'selected' : '');?>>1000</option>
                         </select>
                     </div>
					 <div class="row  justify-content-center">
					 	<div class=" col-12" style='margin-top: 10px;'>
                           <?= $pagination; ?>
                        </div>
					 </div>
                   
				</div>
			</div>

		</div>

	</div>
</div>

<script type="text/javascript">
    function my_list(per_page) {
        window.location.href = '<?php echo base_url('admin/master/vendors_filter/0/');?>'+per_page;
    }
</script>