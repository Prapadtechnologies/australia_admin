<div class="row">
	<div class="col-xl-3  col-md-4 col-sm-4">
		<a href="<?php echo base_url('emp_list/executive');?>">
			<div class="card">
				<div class="card-bg">
					<div class="p-t-20 d-flex justify-content-between">
						<div class="col">
							<h6 class="mb-0">Executives</h6>
						</div>
						<!-- <i class="fas fa-address-card card-icon col-orange font-30 p-r-30"></i> -->
					</div>
					<!-- <canvas id="cardChart1" height="80"></canvas> -->
					<br/>
					<div class="alert alert-sm alert-primary "><center><i class="fas fa-user-circle card-icon font-20 p-r-30">  <?php echo $this->db->query('SELECT COUNT(*) AS `no_of_executives` FROM `users` as u LEFT JOIN users_groups as ug ON u.id = ug.user_id WHERE ug.group_id = (SELECT id FROM `groups` WHERE name = "executive")')->row()->no_of_executives;?></i></center></div>
				</div>
			</div>
		</a>
	</div>
	<div class="col-xl-3  col-md-4 col-sm-4">
		<a href="<?php echo base_url('wallet');?>">
			<div class="card">
				<div class="card-bg">
					<div class="p-t-20 d-flex justify-content-between">
						<div class="col">
							<h6 class="mb-0">Wallet</h6>
							<span class="font-weight-bold mb-0 font-20"></span>
						</div>
					</div>
					<!-- <canvas id="cardChart4" height="80"></canvas> -->
					<br/>
					<div class="alert alert-sm alert-primary "><center><i class="fas fa-hand-holding-usd card-icon font-20 p-r-30">  <?php echo $this->db->where('id', $this->ion_auth->get_user_id())->get('users')->row()->wallet;?>₹</i></center></div>
				</div>
			</div>
		</a>
	</div>
</div>
