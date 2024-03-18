<style type="text/css">
.thumbnail {
    position:relative;
}

.thumbnail img {
    max-width:100%;
    max-height:100%;
}

.thumbnail a {
    width: 35px;
    height: 35px;
    position: absolute;
    border-radius: 0px 0px 0px 50px;
    top: 0px;
    right: 6px;
    background: #fff;
    px 0px 0px 45px: ;
    background: #fff;
}
.thumbnail i.fa.fa-trash {
    right: 10px;
    position: absolute;
    top: 6px;
}
</style>
<div class="row">
    <div class="col-md-12">
            <section class="card">
                <header class="card-header">
                    <div class="card-actions">
                        <a href="#" class="card-action card-action-toggle" data-card-toggle=""></a>
                        <a href="#" class="card-action card-action-dismiss" data-card-dismiss=""></a>
                    </div>
                    <h2 class="card-title ven">Slides</h2>
                </header>
                <div class="card-body">
                    <form id="form_cover" action="<?php echo base_url('sliders/slide');?>" class="needs-validation" novalidate="" method="post" enctype="multipart/form-data">
                        <div class="row">
                            <div class="col-md-6 form-group">
                            <label>Upload Image</label> 
                            <input type="file" name="slide" required="" value="<?php echo set_value('slide')?>"
                            class="form-control" onchange="readURL(this);">
                            <img id="blah" src="#" alt=""> 
                            <div class="col-sm-9">
                                <button class="btn btn-primary">Submit</button>
                            </div>
                        </div>
                    </form>
              
                    <div class="container">
                    <div class="row">
                        
                        <?php
                        if(! empty($sliders)){ foreach ($sliders as $slide) {
                        ?>
                        <div class="col-md-4 thumbnail">
                            <img src="<?php echo base_url(); ?>uploads/sliders_image/sliders_<?php echo $slide['id']; ?>.<?=$slide['ext'];?>?<?php echo time();?>" alt="slider image" class="img-thumbnail">
                            <a class="text-danger" onClick="delete_record(<?php echo $slide['id'] ?>, 'sliders')"> <i class="fa fa-trash"></i>
                                    </a>
                        </div>
                        <?php }}?>
                    </div>
                </div>
                </div>
        
            </section>
    </div>

</div>


<!-- <div class="container">
    <div class="row">
        <div class="col-md-12">
                <section class="card">
                    <header class="card-header">
                        <div class="card-actions">
                            <a href="#" class="card-action card-action-toggle" data-card-toggle=""></a>
                            <a href="#" class="card-action card-action-dismiss" data-card-dismiss=""></a>
                        </div>
                        <h2 class="card-title ven">Advertisements</h2>
                    </header>
                    <div class="card-body">
                         <form id="form_cover" action="<?php echo base_url('advertisements/adver');?>" class="needs-validation" novalidate="" method="post" enctype="multipart/form-data">
                        <div class="row">
                            <div class="col-md-6 form-group">
                            <label>Select Place to Upload</label> 
                            <select class="form-control" name="type" required="">
                                <option value="">Select Type</option>
                                <option value="top">Top</option>
                                <option value="middle">Middle</option>
                                <option value="bottom">Bottom</option>
                                <option value="last">Footer</option>
                            </select>
                            </div>
                            <div class="col-md-6 form-group">
                            <label>Upload Image</label> 
                            <input type="file" name="advertisement" required="" value="<?php echo set_value('advertisement')?>"
                            class="form-control" onchange="readURL(this);">
                            <img id="blah" src="#" alt=""> 
                            <div class="invalid-feedback">Upload Image?</div>
                            <?php echo form_error('advertisement', '<div style="color:red">', '</div>');?>
                            </div>
                            <div class="col-sm-9">
                                <button class="btn btn-primary">Submit</button>
                            </div>
                        </div>
                    </form>
                    <hr/>

                        <div class="row">
                            <?php

                        if(!empty($top)){
                            ?>
                            <div class="col-md-12">
                            <h4 class="card-title ven1">Top</h4>
                            </div>
                            <?php
                            foreach ($top as $t) {
                            ?>
                            <div class="col-md-4" style="margin-top: 20px;">
                                <a class="mr-2  text-danger " onClick="delete_record(<?php echo $t['id'] ?>, 'advertisements')"> <div class="deleteIcon"><i
                                                class="fa fa-trash"></i></div>
                                        </a>
                                <img src="<?php echo base_url(); ?>uploads/advertisements_image/advertisements_<?php echo $t['id']; ?>.<?=$t['ext'];?>?<?php echo time();?>" alt="advertisement image" class="img-thumbnail">
                            </div>
                        <?php }}

                        if(!empty($middle)){
                        ?>
                         <div class="col-md-12">
                            <h4 class="card-title ven1">Middle</h4>
                            </div>
                            <?php
                            foreach ($middle as $m) {
                            ?>
                            <div class="col-md-4" style="margin-top: 20px;">
                                <a class="mr-2  text-danger " onClick="delete_record(<?php echo $m['id'] ?>, 'advertisements')"> <div class="deleteIcon"><i
                                                class="fa fa-trash"></i></div>
                                        </a>
                                <img src="<?php echo base_url(); ?>uploads/advertisements_image/advertisements_<?php echo $m['id']; ?>.<?=$m['ext'];?>?<?php echo time();?>" alt="advertisement image" class="img-thumbnail">
                            </div>
                        <?php }}
                        if(!empty($bottom)){
                        ?>
                         <div class="col-md-12">
                            <h4 class="card-title ven1">Bottom</h4>
                            </div>
                            <?php
                            foreach ($bottom as $b) {
                            ?>
                            <div class="col-md-4" style="margin-top: 20px;">
                                <a class="mr-2  text-danger " onClick="delete_record(<?php echo $b['id'] ?>, 'advertisements')"> <div class="deleteIcon"><i
                                                class="fa fa-trash"></i></div>
                                        </a>
                                <img src="<?php echo base_url(); ?>uploads/advertisements_image/advertisements_<?php echo $b['id']; ?>.<?=$b['ext'];?>?<?php echo time();?>" alt="advertisement image" class="img-thumbnail">
                            </div>
                        <?php }}
                        if(!empty($last)){
                        ?>
                         <div class="col-md-12">
                            <h4 class="card-title ven1">Footer</h4>
                            </div>
                            <?php
                            foreach ($last as $l) {
                            ?>
                            <div class="col-md-4" style="margin-top: 20px;">
                                <a class="mr-2  text-danger " onClick="delete_record(<?php echo $l['id'] ?>, 'advertisements')"> <div class="deleteIcon"><i
                                                class="fa fa-trash"></i></div>
                                        </a>
                                <img src="<?php echo base_url(); ?>uploads/advertisements_image/advertisements_<?php echo $l['id']; ?>.<?=$l['ext'];?>?<?php echo time();?>" alt="advertisement image" class="img-thumbnail">
                            </div>
                        <?php }}?>
                        </div>
                    </div>
            
                </section>
        </div>

    </div>
</div> -->
