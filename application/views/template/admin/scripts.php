<!-- General JS Scripts -->
<script src="<?php echo base_url();?>assets/js/app.min.js"></script>
<!-- JS Libraies -->
<script src="<?php echo base_url();?>assets/bundles/chartjs/chart.min.js"></script>
<script src="<?php echo base_url();?>assets/bundles/apexcharts/apexcharts.min.js"></script>
<script src="<?php echo base_url();?>assets/bundles/bootstrap.min.cssbootstrap.min.css.sparkline.min.js"></script>
<script src="<?php echo base_url();?>assets/bundles/jqvmap/dist/jquery.vmap.min.js"></script>
<script src="<?php echo base_url();?>assets/bundles/jqvmap/dist/maps/jquery.vmap.world.js"></script>
<script src="<?php echo base_url();?>assets/bundles/jqvmap/dist/maps/jquery.vmap.indonesia.js"></script>
 <!--start Datatable with export js-->   
<script src="<?php echo base_url();?>assets/bundles/datatables/datatables.min.js"></script>
<script src="<?php echo base_url();?>assets/bundles/datatables/DataTables-1.10.16/js/dataTables.bootstrap4.min.js"></script>
<script src="<?php echo base_url();?>assets/bundles/datatables/export-tables/dataTables.buttons.min.js"></script>
<script src="<?php echo base_url();?>assets/bundles/datatables/export-tables/buttons.flash.min.js"></script>
<script src="<?php echo base_url();?>assets/bundles/datatables/export-tables/jszip.min.js"></script>
<script src="<?php echo base_url();?>assets/bundles/datatables/export-tables/pdfmake.min.js"></script>
<script src="<?php echo base_url();?>assets/bundles/datatables/export-tables/vfs_fonts.js"></script>
<script src="<?php echo base_url();?>assets/bundles/datatables/export-tables/buttons.print.min.js"></script>
<script src="<?php echo base_url();?>assets/js/page/datatables.js"></script>
<!--End of Datatable with export js--> 

<!--start editable datatable js  -->
<script src="<?php echo base_url()?>assets/bundles/editable-table/mindmup-editabletable.js"></script>

<script src="<?php echo base_url()?>assets/js/page/editable-table.js"></script>
<!--End editable datatable js  -->


<!-- Page Specific JS File -->
<script src="<?php echo base_url();?>assets/js/page/index2.js"></script>
<script src="<?php echo base_url();?>assets/js/page/todo.js"></script>

<script src="<?php echo base_url()?>assets/bundles/prism/prism.js"></script>
<!-- Template JS File -->
<script src="<?php echo base_url();?>assets/js/scripts.js"></script>
<!-- Custom JS File -->
<script src="<?php echo base_url();?>assets/js/custom.js"></script>
<!-- Master JS File -->
<script src="<?php echo base_url();?>assets/js/master.js"></script>
<!-- multiselect JS file -->
<script src="<?php echo base_url();?>assets/js/bootstrap-multiselect.js"></script>
<script src="<?php echo base_url();?>assets/js/init-multiselect.js"></script>

<!-- bootstrap min JS file -->
<script src="<?php echo base_url();?>assets/js/bootstrap-3.3.2.min.js"></script>

<!-- bootstrap toogle button -->
<script src="<?php echo base_url();?>assets/js/bootstrap4-toggle.min.js"></script>

<!-- Ckeditor library -->
<script src="<?php echo base_url();?>assets/bundles/ckeditor/ckeditor.js"></script>

<!-- <script src="https://cdn.ckeditor.com/4.13.0/standard-all/ckeditor.js"></script> -->
<script src="<?php echo base_url();?>assets/js/init-ckeditor.js?<?=time();?>"></script>

<!-- Drag and Drop image -->
<script src="<?php echo base_url();?>assets/js/dropzone.js"></script>

<!-- Gijgo Datepicker -->
<script src="<?php echo base_url();?>assets/js/gijgo-datepicker.js"></script>
<script src="<?php echo base_url();?>assets/js/init-datepicker.js?<?=time();?>"></script>

<script type="text/javascript">
	/*http://www.soundjay.com/misc/sounds/bell-ringing-01.mp3*/
var audioElement = document.createElement('audio');
    audioElement.setAttribute('src', '<?=base_url('assets/deduction.mp3');?>');
    
    audioElement.addEventListener('ended', function() {
        this.play();
    }, false);
    
    function order_bell() {
    	audioElement.play();
    }

    $(document).ready(function(){
    	deleteAllCookies();
		$('.pay_status').change(function(){
			var id = $(this).attr('id');
			var status = $(this).val();
            var txn_id = '';
            if(status == 1){
			 txn_id = prompt("Please enter Transaction Number");
            }
    		if ((txn_id != null && status == 1) || status == 2) {
    		    $.ajax({
    				url: base_url+'wallet_transactions/change_status',
    				type: 'post',
    				data:{id : id, status : status, txn_id : txn_id},
    				success: function(data){
    					window.location.reload();
    				}
    			});
    		}
		});
    });

    function deleteAllCookies() {
        var cookies = document.cookie.split(";");

        for (var i = 0; i < cookies.length; i++) {
            var cookie = cookies[i];
            var eqPos = cookie.indexOf("=");
            var name = eqPos > -1 ? cookie.substr(0, eqPos) : cookie;
            document.cookie = name + "=;expires=Thu, 01 Jan 1970 00:00:00 GMT";
        }
        return true;
    }
</script>


    <script type="text/javascript">
    function showAjaxModal(url)
    {
        // SHOWING AJAX PRELOADER IMAGE
        jQuery('#modal_ajax .modal-body').html('<div style="text-align:center;margin-top:200px;"><img src="assets/images/preloader.gif" style="height:25px;" /></div>');
        
        // LOADING THE AJAX MODAL
        jQuery('#modal_ajax').modal('show', {backdrop: 'true'});
        
        // SHOW AJAX RESPONSE ON REQUEST SUCCESS
        $.ajax({
            url: url,
            success: function(response)
            {
                jQuery('#modal_ajax .modal-body').html(response);
            }
        });
    }
    </script>
    
    <!-- (Ajax Modal)-->

    <div class="modal fade" id="modal_ajax">
        <div class="modal-dialog">
            <div class="modal-content" style="margin-top:100px;">
                <header class="card-header">
                                                <h2 class="card-title"><?php echo $system_name;?><button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button></h2>
                                            </header>
                                            <div class="card-body">
                                                <div class="modal-body" style="height:400px; overflow:auto;">
                                                </div>
                                                <div class="modal-wrapper">
                                                    <div class="modal-icon">
                                                        <i class="fas fa-question-circle"></i>
                                                    </div>
                                                    <div class="modal-text">
                                                        <h4>Are you sure want to Update this information.?</h4>
                                                    </div>
                                                </div>
                                            </div>
                <div class="modal-footer" style="margin:0px; border-top:0px; text-align:center;">
                    <button type="button" class="btn btn-info" data-dismiss="modal"><?php echo 'Cancel';?></button>
                </div>
            </div>
        </div>
    </div>
<!--      <div class="modal fade" id="modal_ajax">
    <div class="modal-dialog">
      <div class="modal-content">
      
        <div class="modal-header">
          <h4 class="modal-title">Modal Heading</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        <div class="modal-body">
          Modal body..
        </div>
        
        <div class="modal-footer">
          <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
        </div>
        
      </div>
    </div>
  </div> -->

  <script>
    function printDiv(divName) {
     var printContents = document.getElementById(divName).innerHTML;
     var originalContents = document.body.innerHTML;

     document.body.innerHTML = printContents;

     window.print();

     document.body.innerHTML = originalContents;
}
</script>


<script type="text/javascript">
    var chat_body_u_id='';
get_user_list();
function get_user_list() {
        $.ajax({
            url         : '<?php echo base_url();?>food/food/get_support_chat',
            type        : 'POST', // form submit method get/post
            success: function(data) {
                $('#my_support_list').html(data);
                if(chat_body_u_id!=''){
                    /*if(chat_body_u_id != '<?=$this->session->userdata('user_id');?>'){*/

                 update_sms_read_tick(chat_body_u_id);
                /*}*/
                 set_active();
                }
                //location.reload();
            }
        });    
}
function update_sms_read_tick(id) {
     $.ajax({
            url         : '<?php echo base_url();?>food/food/update_sms_read_tick/'+id,
            type        : 'GET', // form submit method get/post
            success: function(data) {
                /*$('#chat_body_content'+id).html(data);*/
            }
        });
}
//setInterval("get_user_list()", 1000);

function user_chat_support(id) {
    chat_body_u_id=id;
    set_active();
     $.ajax({
            url         : '<?php echo base_url();?>food/food/get_support_chat_box/'+id,
            type        : 'POST', // form submit method get/post
            success: function(data) {
                $('#user_chat_support').html(data);
                $('#chat_body_content'+id).html('<img src="<?=base_url('assets/img/')?>fidget-spinner-loading.gif" width="100%" />');
                setTimeout(function(){ chat_body_content(id); }, 2000);
                
            }
        });
}
function chat_body_content(id) {
     $.ajax({
            url         : '<?php echo base_url();?>food/food/chat_body_content/'+id,
            type        : 'POST', // form submit method get/post
            success: function(data) {
                $('#chat_body_content'+id).html(data);
            }
        });
}
//setInterval("chat_body_content(chat_body_u_id)", 5000);

function send_chat_sms() {
    var sms=$('#my_chat_sms').val();
    if(sms !=''){
        $.ajax({
            url         : '<?php echo base_url();?>food/food/send_chat_sms/',
            type        : 'POST', // form submit method get/post
            data        : {'message':sms,'to_id':chat_body_u_id},
            success: function(data) {
                chat_body_content(chat_body_u_id);
                //$('#my_chat_sms').value('');
                document.getElementById('my_chat_sms').value = "";
                /*document.getElementById("my_chat_sms").reset();*/
                //$('#chat_body_content'+id).html(data);
            }
        });
    }
}
function set_active() {
    $('#active_chat_user'+chat_body_u_id).attr('class','active');
}
</script>

<script src='https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false'> </script>
<script type="text/javascript">
function initialize() {
	if (navigator.geolocation) {
	    navigator.geolocation.getCurrentPosition(function (p) {
	        var LatLng = new google.maps.LatLng(p.coords.latitude, p.coords.longitude);
	        $("#latitude").val(p.coords.latitude);
	        $("#logitude").val(p.coords.longitude);
	        $("#location_name").val(p.coords.latitude+', '+p.coords.longitude);
	    });
	} else {
	    alert('Geo Location feature is not supported in this browser.');
	}
}

var geocoder = new google.maps.Geocoder;

function geocodeLatLng(lat, lng) {

	  var latlng = {
	    lat: lat,
	    lng: lng
	  };

	  geocoder.geocode({
	    'location': latlng
	  }, function(results, status) {
	    if (status === 'OK') {
		    console.log(result);
	      if (results[0]) {

	        //This is yout formatted address
	        window.alert(results[0].formatted_address);

	      } else {
	        window.alert('No results found');
	      }
	    } else {
	      window.alert('Geocoder failed due to: ' + status);
	    }
	  });

	}


</script>