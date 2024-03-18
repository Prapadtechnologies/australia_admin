
<div class="container">
    <div class="row">
        <div class="col-md-12">
                <section class="card">
                    <header class="card-header">
                        <div class="card-actions">
                            <a href="#" class="card-action card-action-toggle" data-card-toggle=""></a>
                            <a href="#" class="card-action card-action-dismiss" data-card-dismiss=""></a>
                        </div>
                        <h2 class="card-title ven">Category Banners</h2>
                    </header>
                    <div class="card-body">
                         <form id="form_cover" action="<?php echo base_url('category_banner/cat_banners');?>" class="needs-validation" novalidate="" method="post" enctype="multipart/form-data">
                        <div class="form-group row">
                            <div class="col-md-6 form-group">
                            <label>Upload Image</label> 
                            <input type="file" name="cat_banners" required="" value="<?php echo set_value('cat_banners')?>"
                            class="form-control" onchange="readURL(this);">
                            <img id="blah" src="#" alt=""> </div>
                            <div class="col-md-6 form-group">
                            <label>Category</label>
						<!-- <input type="file" class="form-control" required="">-->
						<select required class="form-control" name="cat_id"  >
								<option value="0" selected disabled>--select--</option>
    							<?php foreach ($categories as $category):?>
    								<option value="<?php echo $category['id'];?>"><?php echo $category['name']?></option>
    							<?php endforeach;?>
						</select>
						</div>
                            <div class="col-sm-9">
                                <button class="btn btn-primary">Submit</button>
                            </div>
                        </div>
                    </form>
                    <hr/>
                       
                    </div>
            
                </section>
        </div>

    </div>
</div>
	<div class="card-body">
			<div class="card">
				<div class="card-header">
					<h4 class="ven">List of Category Banners</h4>
				</div>
				<div class="card-body">
					<div class="table-responsive">
						<table class="table table-striped table-hover" id="tableExport"
							style="width: 100%;">
							<thead>
								<tr>
									<th>Id</th>
									<th>Category</th>
									<th>Image</th>
									<th>Actions</th>

								</tr>
							</thead>
							<tbody>
								<?php if(!empty($cat_banner)):?>
    							<?php $sno = 1; foreach ($cat_banner as $cat):?>
    								<tr>
    									<td><?php echo $sno++;?></td>
    									<td><?php foreach ($categories as $category):?>
    										<?php echo ($category['id'] == $cat['cat_id'])? $category['name']:'';?>
    									<?php endforeach;?></td>
    									<td width="15%"><img
    										src="<?php echo base_url();?>uploads/cat_banners_image/cat_banners_<?php echo $cat['cat_id'];?>_<?php echo $cat['id'];?>.jpg?<?php echo time();?>"
    										width="50px"></td>
    									<td><a href="<?php echo base_url()?>category_banner/edit?id=<?php echo $cat['id'];?>&cat_id=<?php echo $cat['cat_id']?>" class=" mr-2  "  > <i class="fas fa-pencil-alt"></i>
    									</a> <a class="mr-2  text-danger " onClick="delete_record(<?php echo $cat['id'] ?>, 'category_banner')"> <i
    											class="far fa-trash-alt"></i>
    									</a></td>
    
    								</tr>
    							<?php endforeach;?>
							<?php else :?>
							<tr ><th colspan='6'><h3><center>No Banners</center></h3></th></tr>
							<?php endif;?>
							</tbody>
						</table>
					</div>
				</div>
			</div>


		</div>