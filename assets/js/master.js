function delete_record(id, uri){
	if(confirm('Do you want to delete..?')){
		$.ajax({
			url: base_url+uri+'/d',
			type: 'post',
			data: {id : id},
			success: function(data){
				window.location.reload();
			}
		});
	}
}

function admin_item_delete_record(id, uri){
    if(confirm('Do you want to delete..?')){
        $.ajax({
            url: base_url+uri+'/ven_item',
            type: 'post',
            data: {id : id},
            success: function(data){
                window.location.reload();
            }
        });
    }
}


$(() => {
    $('.approve_toggle').change(function() {
    	if(confirm('Do You Want To Change Approve Status..?')){
    		let vendor_id = $(this).attr('vendor_id');
    		let user_id = $(this).attr('user_id');
    		let is_checked = $(this).is(':checked');
    		$.ajax({
    			url: base_url+'vendors/change_status',
    			type: 'post',
    			dataType: 'json',
    			data: {vendor_id : vendor_id, user_id : user_id, is_checked : is_checked},
    			success: function(data){
    				console.log(data);
    			}
    		});
    	}
    })
  });

$(() => {
    $('.featured_brand_toggle').change(function() {
    	if(confirm('Do You Want To Add Featured Brand..?')){
    		let brand_id = $(this).attr('brand_id');
    		let is_checked = $(this).is(':checked');
    		$.ajax({
    			url: base_url+'brands/change_status',
    			type: 'post',
    			dataType: 'json',
    			data: {brand_id : brand_id, is_checked : is_checked},
    			success: function(data){
    				console.log(data);
    				location.reload();
    			}
    		});
    	}
    })
  });
$(() => {
    $('.coming_soon_toggle').change(function() {
    	if(confirm('Do You Want To Stop Woring..?')){
    		let cat_id = $(this).attr('cat_id');
    		let is_checked = $(this).is(':checked');
    		$.ajax({
    			url: base_url+'category/change_status',
    			type: 'post',
    			dataType: 'json',
    			data: {cat_id : cat_id, is_checked : is_checked},
    			success: function(data){
    				console.log(data);
    				location.reload();
    			}
    		});
    	}
    })
  });

$(() => {
    $('.approve_news').change(function() {
    	if(confirm('Do You Want To Change News Status..?')){
    		let user_id = $(this).attr('user_id');
    		let is_checked = $(this).is(':checked');
    		$.ajax({
    			url: base_url+'local_news/status',
    			type: 'post',
    			dataType: 'json',
    			data: {user_id : user_id, is_checked : is_checked},
    			success: function(data){
    				console.log(data);
    				//location.reload();
    			}
    		});
    	}
    })
  });

function state_changed(){
	var state_id = document.getElementById("state").value;
	var token = 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6IjEiLCJ1c2VyZGV0YWlsIjp7InVzZXJuYW1lIjoiYWRtaW5pc3RyYXRvciIsImVtYWlsIjoiYWRtaW5AYWRtaW4uY29tIiwicGhvbmUiOiIwIn0sInRpbWUiOjE1Njk1MDY5Njd9.-5N8CdYYitPW_eGE-U9FyZHSliaXspErZvb1wUhHWpY';
	$.ajax({
		url: base_url+'general/api/master/states/'+state_id,
		type: 'get',
		beforeSend: function(xhr){xhr.setRequestHeader('X_AUTH_TOKEN', token);},
		success: function(data){
			var options = '';
			for(var i = 0; i < data.data.districts.length; i++){
				options += '<option value="'+data.data.districts[i].id+'">'+data.data.districts[i].name+'</option>'
			}
			document.getElementById("district").innerHTML = options;
		}
	});
}

function category_changed(){
    var cat_id = document.getElementById("category").value;
    $.ajax({
        url: base_url+'ecom_sub_category/list',
        type: 'post',
        data: {cat_id : cat_id},
        dataType: 'json',
        success: function(data){
        	//console.log(data.length);
            var options = '<option value="0" selected disabled>--select--</option>';
            for(var i = 0; i < data.length; i++){
                options += '<option value="'+data[i].id+'">'+data[i].name+'</option>'
            }
            document.getElementById("sub_cat_id").innerHTML = options;
        }
    });
}


function sub_category_changed(){
    var sub_cat_id = document.getElementById("sub_cat_id").value;
    $.ajax({
        url: base_url+'ecom_brands/list',
        type: 'post',
        data: {sub_cat_id : sub_cat_id},
        dataType: 'json',
        success: function(data){
        	console.log(data[0]);
        	let options = '<option value="0" selected disabled>--select--</option>';
        	$.each(data[0].brands, function(index, element) {
        		options += '<option value="'+element.id+'">'+element.name+'</option>';
        	});
            document.getElementById("brand_id").innerHTML = options;
            
            var options2 = '<option value="0" selected disabled>--select--</option>';
            for(var i = 0; i < data[0].ecom_sub_sub_categories.length; i++){
                options2 += '<option value="'+data[0].ecom_sub_sub_categories[i].id+'">'+data[0].ecom_sub_sub_categories[i].name+'</option>'
            }
            document.getElementById("sub_id").innerHTML = options2;
          
        }
    });
}


function category_changedsub(){
    var cat_id = document.getElementById("category").value;
    $.ajax({
        url: base_url+'ecom_sub_category/list',
        type: 'post',
        data: {cat_id : cat_id},
        dataType: 'json',
        success: function(data){
            var options = '<option value="0" selected disabled>--select--</option>';
            for(var i = 0; i < data.length; i++){
                options += '<option value="'+data[i].id+'">'+data[i].name+'</option>'
            }
            document.getElementById("subcat").innerHTML = options;
            
           
        }
    });
}
function sub_ocategory_changed(){
    var sub_cat_id = document.getElementById("sub_cat_id").value;
    $.ajax({
        url: base_url+'ecom_options/list',
        type: 'post',
        data: {sub_cat_id : sub_cat_id},
        dataType: 'json',
        success: function(data){
        	console.log(data[0]);
        	
            
            var options2 = '<option value="0" selected disabled>--select--</option>';
            for(var i = 0; i < data[0].ecom_sub_sub_categories.length; i++){
                options2 += '<option value="'+data[0].ecom_sub_sub_categories[i].id+'">'+data[0].ecom_sub_sub_categories[i].name+'</option>'
            }
            document.getElementById("sub_id").innerHTML = options2;
          
        }
    });
}


function gro_category_changed(cat_id){
    /*var cat_id = document.getElementById("category").value;*/
    $.ajax({
        url: base_url+'grocery_sub_category/list',
        type: 'post',
        data: {cat_id : cat_id},
        dataType: 'json',
        success: function(data){
            //console.log(data.length);
            var options = '<option value="0" selected disabled>--select--</option>';
            for(var i = 0; i < data.length; i++){
                options += '<option value="'+data[i].id+'">'+data[i].name+'</option>'
            }
            document.getElementById("gro_sub_cat_id").innerHTML = options;
        }
    });
}


function gro_sub_category_changed(sub_cat_id){
    /*var sub_cat_id = document.getElementById("sub_cat_id").value;*/
    $.ajax({
        url: base_url+'grocery_brands/list',
        type: 'post',
        data: {sub_cat_id : sub_cat_id},
        dataType: 'json',
        success: function(data){
            console.log(data[0]);
            let options = '<option value="0" selected disabled>--select--</option>';
            $.each(data[0].brands, function(index, element) {
                options += '<option value="'+element.id+'">'+element.name+'</option>';
            });
            document.getElementById("gro_brand_id").innerHTML = options;
            
       /*     var options2 = '<option value="0" selected disabled>--select--</option>';
            for(var i = 0; i < data[0].ecom_sub_sub_categories.length; i++){
                options2 += '<option value="'+data[0].ecom_sub_sub_categories[i].id+'">'+data[0].ecom_sub_sub_categories[i].name+'</option>'
            }
            document.getElementById("sub_id").innerHTML = options2;*/
          
        }
    });
}


function gro_category_changedsub(){
    var cat_id = document.getElementById("category").value;
    $.ajax({
        url: base_url+'grocery_sub_category/list',
        type: 'post',
        data: {cat_id : cat_id},
        dataType: 'json',
        success: function(data){
            var options = '<option value="0" selected disabled>--select--</option>';
            for(var i = 0; i < data.length; i++){
                options += '<option value="'+data[i].id+'">'+data[i].name+'</option>'
            }
            document.getElementById("gro_subcat").innerHTML = options;
        }
    });
}


function clear_form(id) {
	$('#'+id).find('input:text, input:password, input:file, select, textarea').val('');
	$("#"+id).find('input:radio, input:checkbox').removeAttr('checked').removeAttr('selected');
}

$(function () {
    $("#btnSubmit").click(function () {
        var password = $("#Password").val();
        var confirmPassword = $("#ConfirmPassword").val();
        if (password != confirmPassword) {
            alert("Passwords do not match.");
            return false;
        }
        return true;
    });
});

function readURL(input, width, height) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function(e) {
            $('#blah')
                .attr('src', e.target.result)
                .width(width)
                .height(height);
        };
        reader.readAsDataURL(input.files[0]);
    }
}

$(document).ready(function() {
    $('#upload_form').on('submit', function(e) {
        e.preventDefault();
        if ($('#userfile').val() == '') {
            alert("Please Select the File");
        } else {
            $.ajax({
                url: "<?php echo base_url(); ?>master",
                method: "POST",
                data: new FormData(this),
                contentType: false,
                cache: false,
                processData: false,
                dataType: 'json',
                success: function(data) {
                    if (data.success == true) {
                        $('#result').find('img').attr('src', data.file);
                    } else {
                        alert(data.msg);
                    }
                }
            });
        }
    });
   
    /*Mobile Number validation*/
    $("#mobile").keypress(function (e) {
        if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
           return false;
       }
	});
    
    /*news module post type*/
    if(url == '' || url == undefined || url == null){
    	$(".link").hide();
    }else{
    	$("#link").val(url);
    	$(".link").show();
    }
    $("#type").change(function(){
    	let type = $(this).val();
    	if(type ==  2){
    		if(url == '' || url == undefined || url == null){
    			$("#link").val('');
    	    }else{
    	    	$("#link").val(url);
    	    }
    		$(".link").show();
    	}else{
    		$("#link").val('');
    		$(".link").hide();
    	}
    });
});
///*option values add delete functionality*/
//
// 
// $('#insert_form').on('submit', function(event){
//  event.preventDefault();
//  var error = '';
//  $('.item_name').each(function(){
//   var count = 1;
//   if($(this).val() == '')
//   {
//    error += "<p>Enter Item Name at "+count+" Row</p>";
//    return false;
//   }
//   count = count + 1;
//  });
//  
//  $('.item_quantity').each(function(){
//   var count = 1;
//   if($(this).val() == '')
//   {
//    error += "<p>Enter Item Quantity at "+count+" Row</p>";
//    return false;
//   }
//   count = count + 1;
//  });
//  
//  $('.item_unit').each(function(){
//   var count = 1;
//   if($(this).val() == '')
//   {
//    error += "<p>Select Unit at "+count+" Row</p>";
//    return false;
//   }
//   count = count + 1;
//  });
//  var form_data = $(this).serialize();
//  if(error == '')
//  {
//   $.ajax({
//    url:"insert.php",
//    method:"POST",
//    data:form_data,
//    success:function(data)
//    {
//     if(data == 'ok')
//     {
//      $('#item_table').find("tr:gt(0)").remove();
//      $('#error').html('<div class="alert alert-success">Item Details Saved</div>');
//     }
//    }
//   });
//  }
//  else
//  {
//   $('#error').html('<div class="alert alert-danger">'+error+'</div>');
//  }
// });
//
//});
//$(document).on('click', '.add', function(){
//      var html = '';
//      html += '<tr>';
//      html += '<td><input type="text" name="item_name[]" class="form-control item_name" /></td>';
//      html += '<td><input type="text" name="item_quantity[]" class="form-control item_quantity" /></td>';
////      html += '<td><select name="item_unit[]" class="form-control item_unit"><option value="">Select Unit</option><?php echo fill_unit_select_box($connect); ?></select></td>';
//      html += '<td><button type="button" name="remove" class="btn btn-danger btn-sm remove">
//    <span class="fa fa-minus p-2"></span></button></td></tr>';
//      $('#item_table').append(html);
// });
// 
// $(document).on('click', '.remove', function(){
//  $(this).closest('tr').remove();
// });

