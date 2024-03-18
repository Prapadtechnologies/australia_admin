<div class="card">
	<div class="card-header">
		<h4 class="ven">List of Transcations</h4>
	</div>
	<div class="card-body">
		<div class="table-responsive">
			<table class="table table-striped table-hover" id="tableExport"
				style="width: 100%;">
				<thead>
					<tr>
						<th>Id</th>
						<th>Type <br>(Debit/Credit)
						</th>
						<th>Amount</th>
						<th>Transcaction Id</th>
						<th>Order Id</th>
						<th>Bank Name</th>
						<th>Status</th>
					</tr>
				</thead>
				<tbody>
				<?php if(!empty($transactions)){ $i = 1;foreach ($transactions as $transaction):?>
							<tr>
						<td><?php echo $i++;?></td>
						<td><?php echo $transaction['type'];?></td>
						<td><?php echo $transaction['cash'];?></td>
						<td><?php echo $transaction['txn_id'];?></td>
						<td><?php echo $transaction['order_id'];?></td>
						<td><?php echo $transaction['bank_name'];?></td>
						<td><?php
                                if ($transaction['status'] == '0') {
                                    echo "Pending";
                                } elseif ($transaction['status'] == '1') {
                                    echo "Success";
                                } else {
                                    echo "Failed";
                                }
                            ?>
                        </td>
					</tr>
				<?php endforeach;}else{?>
				<tr>
						<th colspan='7'><h3>
								<center>No Transactions</center>
							</h3></th>
					</tr>
				<?php }?>
				</tbody>
			</table>
		</div>
	</div>
</div>