<style>
.list {
  display: table;
  border-spacing: 0 10px;
  padding: 0.5em 0;
}

.list > li {
  background-color: #e0e0e1;
  border-radius: 5px;
  color: #6c777f;
  display: table-row;
  width: 100%;
}
.list > li > label {
  border-bottom-left-radius: 5px;
  border-top-left-radius: 5px;
  background-color: #a1aab0;
  color: white;
  display: table-cell;
  min-width: 40%;
  padding: .5em;
  text-transform: capitalize;
}

.list > li > span {
  border-radius: 0 5px 5px 0;
  background-color: #e0e0e1;
  display: table-cell;
  padding: .5em;
}
</style>
<div class="card">
	<div class="card-header">
		<h4 class="ven">List of Pending Transactions</h4>
	</div>
	<div class="card-body">
		<div class="table-responsive">
			<table class="table table-striped table-hover" id="tableExport"
				style="width: 100%;">
				<thead>
					<tr>
						<th>S.no</th>
						<th>Transcation ID</th>
						<th>User</th>
						<th>Title</th>
						<th>Description</th>
						<th>Created At</th>
						<th>Debit</th>
						<th>Credit</th>
					</tr>
				</thead>
				<tbody>
					<?php if(!empty($transactions)):?>
						<?php $sno = 1; foreach ($transactions as $transaction):?>
							<tr>
								<td><?php echo $sno++;?></td>
								<td><?php echo $transaction['transaction_id'];?></td>
								<td><a href="<?php echo base_url('wallet_transactions/list?user_id='.$transaction['user_id']);?>"><?php echo $transaction['unique_id'];?></a></td>
								<td><?php echo $transaction['title'];?></td>
								<td><?php echo $transaction['description'];?></td>
								<td><?php echo $transaction['created_at'];?></td>
                <td><?php echo $transaction['debit'];?></td>
                <td><?php echo $transaction['credit'];?></td>
							</tr>
						<?php endforeach;?>
				<?php else :?>
				<tr ><th colspan='7'><h3><center>No Transactions</center></h3></th></tr>
				<?php endif;?>
				</tbody>
			</table>
		</div>
	</div>
</div>