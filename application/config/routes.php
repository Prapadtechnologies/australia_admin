<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/*
| -------------------------------------------------------------------------
| URI ROUTING
| -------------------------------------------------------------------------
| This file lets you re-map URI requests to specific controller functions.
|
| Typically there is a one-to-one relationship between a URL string
| and its corresponding controller class/method. The segments in a
| URL normally follow this pattern:
|
|	example.com/class/method/id/
|
| In some instances, however, you may want to remap this relationship
| so that a different class/function is called than the one
| corresponding to the URL.
|
| Please see the user guide for complete details:
|
|	https://codeigniter.com/user_guide/general/routing.html
|
| -------------------------------------------------------------------------
| RESERVED ROUTES
| -------------------------------------------------------------------------
|
| There are three reserved routes:
|
|	$route['default_controller'] = 'welcome';
|
| This route indicates which controller class should be loaded if the
| URI contains no data. In the above example, the "welcome" class
| would be loaded.
|
|	$route['404_override'] = 'errors/page_missing';
|
| This route will tell the Router which controller/method to use if those
| provided in the URL cannot be matched to a valid route.
|
|	$route['translate_uri_dashes'] = FALSE;
|
| This is not exactly a route, but allows you to automatically route
| controller and method names that contain dashes. '-' isn't a valid
| class or method name character, so it requires translation.
| When you set this option to TRUE, it will replace ALL dashes in the
| controller and method URI segments.
|
| Examples:	my-controller/index	-> my_controller/index
|		my-controller/my-method	-> my_controller/my_method
*/
$route['default_controller'] = 'home';
$route['404_override'] = '';
$route['translate_uri_dashes'] = FALSE;

/*
 * Auth
 */
$route['category/(:any)'] = 'admin/master/category/$1';

/*
 *Admin 
 */
$route['dashboard'] = 'admin/dashboard';
$route['plans'] = 'admin/plans';
$route['addplan'] = 'admin/plans/addplan';
$route['sample'] = 'admin/dashboard/sample';
$route['settings/(:any)'] = 'admin/settings/$1';
$route['vendor_settings/(:any)'] = 'admin/vendor_settings/$1';
$route['sliders/(:any)'] = 'admin/sliders/$1';
$route['category_banner/(:any)'] = 'admin/category_banner/$1';
$route['cat_ban_delete/(:any)'] = 'admin/cat_ban_delete/$1';
$route['cat_bottom_banners/(:any)'] = 'admin/cat_bottom_banners/$1';
$route['site_logo/(:any)'] = 'admin/site_logo/$1';
$route['advertisements/(:any)'] = 'admin/advertisements/$1';
$route['profile/(:any)'] = 'admin/profile/$1';
$route['user_services/(:any)'] = 'admin/user_services/$1';
$route['wallet'] = 'admin/dashboard/wallet';

/*Categories*/
$route['category/(:any)'] = 'admin/master/category/$1';
$route['amenity/(:any)'] = 'admin/master/amenity/$1';
$route['sub_category/(:any)']='admin/master/sub_category/$1';
$route['service/(:any)'] = 'admin/master/service/$1';
$route['state/(:any)'] = 'admin/master/state/$1';
$route['district/(:any)'] = 'admin/master/district/$1';
$route['constituency/(:any)'] = 'admin/master/constituency/$1';
$route['brands/(:any)'] = 'admin/master/brands/$1';

/*Employees*/
$route['employee/(:any)'] = 'admin/employee/$1';
$route['role/(:any)'] = 'admin/role/$1';
$route['emp_list/(:any)'] = 'admin/emp_list/$1';



/*Food*/
$route['food_menu/(:any)'] = 'food/food_menu/$1';
$route['food_item/(:any)'] = 'food/food_item/$1';
$route['food_section/(:any)'] = 'food/food_section/$1';
$route['food_section_item/(:any)'] = 'food/food_section_item/$1';
$route['food_orders/(.+)'] = 'food/food_orders/$1';
$route['food_settings/(:any)'] = 'food/food_settings/$1';
$route['food_order_status/(.+)'] = 'food/food_order_status/$1';
$route['vendor_profile/(.+)'] = 'vendor/vendor_profile/$1';
$route['vendor_leads/(.+)'] = 'food/VendorLeads/$1';
$route['vendor_lead_status/(.+)'] = 'food/vendor_lead_status/$1';
$route['view_order'] = 'food/view_order';
$route['products_approve/(:any)'] = 'food/products_approve/$1';
$route['order_support/(:any)'] = 'food/order_support/$1';
/*Promo Codes*/
$route['promos/(.+)'] = 'promos/index/$1';

/*Payment*/
$route['wallet_transactions/(:any)'] = 'payment/wallet_transactions/$1';
$route['withdraw_list/(.+)'] = 'payment/withdraw_list/$1';
