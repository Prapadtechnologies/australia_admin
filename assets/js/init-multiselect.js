$(document).ready(function() {
		/*Employee page Multiselect*/
        $('#example-getting-started').multiselect({
        	 buttonWidth: '100%',
        	 includeSelectAllOption: true,
        	 enableFiltering: true,
        	 buttonClass: 'btn buttons-pdf',
        	 filterPlaceholder: 'Search Role'
        });

        $('#services_multiselect').multiselect({
       	 buttonWidth: '300px',
       	 includeSelectAllOption: true,
       	 enableFiltering: true,
       	 buttonClass: 'btn buttons-pdf',
       	 filterPlaceholder: 'Search Role',
       	 maxHeight: 250
       });
        $('#brands_multiselect').multiselect({
          	 buttonWidth: '300px',
          	 includeSelectAllOption: true,
          	 enableFiltering: true,
          	 buttonClass: 'btn buttons-pdf',
          	 filterPlaceholder: 'Search Role',
          	 maxHeight: 250
          });
        
        $('#sub_id').multiselect({
          	 buttonWidth: '300px',
          	 includeSelectAllOption: true,
          	 enableFiltering: true,
          	 buttonClass: 'btn buttons-pdf',
          	 filterPlaceholder: 'Search Role',
          	 maxHeight: 300
          });
        $('#food_items_multiselect').multiselect({
             buttonWidth: '300px',
             includeSelectAllOption: true,
             enableFiltering: true,
             buttonClass: 'btn buttons-pdf',
             filterPlaceholder: 'Search Role',
             maxHeight: 250
          });
          
          $('#profile_sub_categories').multiselect({
           	 buttonWidth: '300px',
           	 includeSelectAllOption: true,
           	 enableFiltering: true,
           	 buttonClass: 'btn buttons-pdf',
           	 filterPlaceholder: 'Search Role',
           	 maxHeight: 300
           });
          
          $('#profile_amenities').multiselect({
            	 buttonWidth: '300px',
            	 includeSelectAllOption: true,
            	 enableFiltering: true,
            	 buttonClass: 'btn buttons-pdf',
            	 filterPlaceholder: 'Search Role',
            	 maxHeight: 300
            });
          
          $('#profile_services').multiselect({
            	 buttonWidth: '300px',
            	 includeSelectAllOption: true,
            	 enableFiltering: true,
            	 buttonClass: 'btn buttons-pdf',
            	 filterPlaceholder: 'Search Role',
            	 maxHeight: 300
            });
            
            $('#profile_brands').multiselect({
           	 buttonWidth: '300px',
           	 includeSelectAllOption: true,
           	 enableFiltering: true,
           	 buttonClass: 'btn buttons-pdf',
           	 filterPlaceholder: 'Search Role',
           	 maxHeight: 300
           });
    });