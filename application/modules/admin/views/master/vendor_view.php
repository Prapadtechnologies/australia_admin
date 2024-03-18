<?php
/*
 * echo "<pre>";
 * print_r($vendor_list);
 */
/*
 * $v='{
 * "id": 1,
 * "vendor_user_id": 2,
 * "name": "Manikanta",
 * "email": "manikanta.grepthor@gmail.com",
 * "unique_id": "NCV0199",
 * "location_id": 1,
 * "executive_id": 1,
 * "constituency_id": 171,
 * "category_id": 4,
 * "no_of_banners": 4,
 * "address": "dno 6/5,kukatpally,hyd",
 * "landmark": "dno 2-6/2,kukatpally,hyd",
 * "pincode": 508541,
 * "everyday_open_time": null,
 * "everyday_close_time": null,
 * "holiday_open_time": "00:00:00",
 * "holiday_close_time": "00:00:00",
 * "sounds_like": "",
 * "created_user_id": null,
 * "updated_user_id": 1,
 * "created_at": "2019-11-18 08:11:46",
 * "updated_at": "2019-11-26 06:11:46",
 * "deleted_at": null,
 * "approved_by": 1,
 * "status": 1,
 * "location": {
 * "id": 1,
 * "address": "303, NEWMARK HOUSE, Patrika Nagar, HITEC City, Hyderabad, Telangana 500081, India",
 * "latitude": 17,
 * "longitude": 78
 * },
 * "category": {
 * "id": 4,
 * "name": "Food & Restaurants"
 * },
 * "constituency": {
 * "id": 171,
 * "name": "Serilingampally",
 * "state_id": 25,
 * "district_id": 571
 * },
 * "contacts": [
 * {
 * "list_id": 1,
 * "id": 1,
 * "std_code": 91,
 * "number": 9874155585,
 * "type": 1
 * },
 * {
 * "list_id": 1,
 * "id": 2,
 * "std_code": "",
 * "number": 0,
 * "type": 2
 * },
 * {
 * "list_id": 1,
 * "id": 3,
 * "std_code": 91,
 * "number": 9874556699,
 * "type": 3
 * },
 * {
 * "list_id": 1,
 * "id": 4,
 * "std_code": "",
 * "number": 0,
 * "type": 4
 * }
 * ],
 * "links": [
 * {
 * "list_id": 1,
 * "id": 1,
 * "url": "",
 * "type": 1
 * },
 * {
 * "list_id": 1,
 * "id": 2,
 * "url": "",
 * "type": 2
 * },
 * {
 * "list_id": 1,
 * "id": 3,
 * "url": "",
 * "type": 3
 * },
 * {
 * "list_id": 1,
 * "id": 4,
 * "url": "",
 * "type": 4
 * }
 * ],
 * "amenities": {
 * "29": {
 * "id": 29,
 * "list_id": 1,
 * "name": "Biryani"
 * },
 * "31": {
 * "id": 31,
 * "list_id": 1,
 * "name": "Multi Cuisine"
 * },
 * "32": {
 * "id": 32,
 * "list_id": 1,
 * "name": "starters"
 * },
 * "33": {
 * "id": 33,
 * "list_id": 1,
 * "name": "Main Course"
 * }
 * },
 * "services": {
 * "12": {
 * "id": 12,
 * "list_id": 1,
 * "name": "Home Delivery"
 * },
 * "24": {
 * "id": 24,
 * "list_id": 1,
 * "name": "Order Food"
 * },
 * "25": {
 * "id": 25,
 * "list_id": 1,
 * "name": "Book Table"
 * }
 * },
 * "holidays": null,
 * "banners": {
 * "1": "http://cineplant.com/nextclick/uploads/list_banner_image/list_banner_1_1.jpg",
 * "2": "http://cineplant.com/nextclick/uploads/list_banner_image/list_banner_1_2.jpg",
 * "3": "http://cineplant.com/nextclick/uploads/list_banner_image/list_banner_1_3.jpg",
 * "4": "http://cineplant.com/nextclick/uploads/list_banner_image/list_banner_1_4.jpg"
 * }
 * }';
 * $ve=json_decode($v);
 * echo "<pre>";
 * print_r($ve);
 */
?>
<style>
.img-thumbnail{
    width: 150px !important; 
    height: 150px !important;
}
</style>
<div class="row">
	<div class="col-12">
		<h4 class="ven">Vendor Details</h4>

		<div class="card-body">
			<div class="card">
				<div class="card-header">
					<div class="col-md-8">
						<h4>Name :<?=ucwords($vendor_list['name']);?></h4>
						
						<img src="<?php echo base_url("uploads/list_cover_image/list_cover_".$_GET['vendor_id'].".jpg");?>" class="img-thumbnail" alt="Cinque Terre" width="150" height="150">
						<form class="mt-4 pt-2" action="<?php echo base_url();?>vendors/cover_update" enctype='multipart/form-data' method="post">
							<input type="file" class="btn btn-secondary btn-sm" name="cover" style="width: 108px;" />
							<input type="hidden" name="id" value="<?php echo $_GET['vendor_id'];?>" />
							<button class="btn btn-success btn-sm">update</button>
						</form>
					</div>
					
					<div class="col-md-4">
						<ul style="list-style: none">
							<li>Vendor Id: <b><?=$vendor_list['unique_id'];?></b></li>
							<li>Timings : <b><?=$vendor_list['created_at']?></b></li>
							<li>Executive Id : <b><?=$vendor_list['executive']['unique_id'];?></b></li>
							<li>Address : <b><?=$vendor_list['location']['address']?></b></li>
						</ul>
					</div>
				</div>
				<div class="card-body">
					<p class="h5 mb-1 text-dark font-weight-semibold ven1">
						User Details:<br />
					</p>
					<table class="table table-responsive-md invoice-items">


						<tbody>
							<tr class="text-dark">
								<th class="text-dark">Contact:</th>
								<th class="text-dark">
									<ul>
                                        <?php
                                        if(isset($vendor_list['contacts'])){foreach ($vendor_list['contacts'] as $sv) {
                                            echo '<li>' . $sv['number'] . '</li>';
                                        }}
                                        ?>
            						</ul>
								</th>
							</tr>
							<tr class="text-dark">
								<th class="text-dark">Constituency:</th>
								<th class="text-dark"> <?=$vendor_list['constituency']['name'];?></th>
							</tr>
							<tr class="text-dark">
								<th class="text-dark">Category:</th>
								<th class="text-dark"> <?=$vendor_list['category']['name'];?></th>
							</tr>
							<tr class="text-dark">
								<th class="text-dark">Services:</th>
								<th class="text-dark">
									<ul>
                            			<?php
                            			if(isset($vendor_list['services'])){foreach ($vendor_list['services'] as $sv) {
                                            echo '<li>' . $sv['name'] . '</li>';
                            			}}
                                        ?>
                        			</ul>
								</th>
							</tr>
							<tr class="text-dark">
								<th class="text-dark">Amenities:</th>
								<th class="text-dark">
									<ul>
                        			<?php
                        			if(isset($vendor_list['amenities'])){foreach ($vendor_list['amenities'] as $am) {
                                            echo '<li>' . $am['name'] . '</li>';
                        			}}
                                    ?>
                        			</ul>
								</th>
							</tr>
							<tr class="text-dark">
								<th class="text-dark">Everyday Timings:</th>
								<th class="text-dark"> <?=$vendor_list['everyday_open_time'].' - '.$vendor_list['everyday_close_time'];?></th>
							</tr>
							<tr class="text-dark">
								<th class="text-dark">Holiday Timings:</th>
								<th class="text-dark"> <?=$vendor_list['holiday_open_time'].' - '.$vendor_list['holiday_close_time'];?></th>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>
<style>

.grid-container {
  display: grid;
  grid-template-columns: 400px 300px 300px;
  grid-gap: 40px;

  padding: 10px;
}

.grid-container > div {
  background-color: rgba(255, 255, 255, 0.8);
  text-align: center;
  
  font-size: 20px;
}

.item1 {
  grid-column-start: 2;
}
</style>
