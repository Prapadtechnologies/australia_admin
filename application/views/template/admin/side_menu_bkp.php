<div class="main-sidebar sidebar-style-2">
                <aside id="sidebar-wrapper">
                    <div class="sidebar-brand">
                        <a href="<?php echo base_url()?>dashboard"> <img alt="image" src="<?php echo base_url()?>assets/img/logo.png" class="header-logo" /> 
                            <!--<span class="logo-name">Aegis</span>-->
                        </a>
                    </div>
                    <div class="sidebar-user">
                        <div class="sidebar-user-picture">
                            <img alt="image" src="<?php echo base_url()?>assets/img/userbig.png">
                        </div>
                        <div class="sidebar-user-details">
                            <div class="user-name"><?php echo $user->email;?></div>
                            <div class="user-role"><?php echo $user->first_name.''.$user->last_name;?></div>
                        </div>
                    </div>
                    <ul class="sidebar-menu">
                        <li class="menu-header">Main</li>
                        <li class="dropdown active"><a href="<?php echo base_url('dashboard');?>" class="nav-link "><i
                                    data-feather="monitor"></i><span>Dashboard</span>
                            </a>
                            
                        </li>
                        <?php if($this->ion_auth_acl->has_permission('withdrawal')):?>
                        <li class="dropdown "><a href="<?php echo base_url('wallet_transactions/list');?>" class="nav-link "><i
                                    data-feather="monitor"></i><span>Transactions</span>
                            </a>
                        </li>
                        <?php endif;?>
                        <?php if($this->ion_auth_acl->has_permission('vendor')):?>
                        <li class="dropdown "><a href="<?php echo base_url('user_services/r');?>" class="nav-link "><i
                                    data-feather="monitor"></i><span>Our Services</span>
                            </a>
                            
                        </li>
                        <?php endif;?>
                        <?php if($this->ion_auth_acl->has_permission('admin') || $this->ion_auth_acl->has_permission('hr')):?>
                        <li class="dropdown "><a href="<?php echo base_url('admin/master/vendors_filter/0');?>" class="nav-link "><i
                                    data-feather="monitor"></i><span>Our Vendors</span>
                            </a>
                            
                        </li>
                        <?php endif;?>
                        <?php if($this->ion_auth_acl->has_permission('admin') || $this->ion_auth_acl->has_permission('hr')):?>
                        <li class="dropdown">
                            <a href="#" class="nav-link has-dropdown">
                            <i data-feather="briefcase" class="metismenu-state-icon"></i><span>Vendors</span>
                            </a>
                            <ul class="dropdown-menu">
                                <li><a class="nav-link" href="<?php echo base_url('vendors/all');?>">All Vendors</a></li>
                                <li><a class="nav-link" href="<?php echo base_url('vendors/approved');?>">Approved Vendors</a></li>
                                <li><a class="nav-link" href="<?php echo base_url('vendors/pending');?>">Pending Vendors</a></li>
                                <li><a class="nav-link" href="<?php echo base_url('vendors/cancelled');?>">Cancelled Vendors</a></li>
                            </ul>
                        </li>
                        <?php endif;?>
                        
                        <?php if($this->ion_auth_acl->has_permission('admin')):?>
                            <li class="dropdown"><a href="#" class="nav-link has-dropdown"><i
                                        data-feather="command"></i><span>Listing Master Data</span></a>
                                <ul class="dropdown-menu">
                                    <?php if($this->ion_auth_acl->has_permission('list_master')):?>
                                        <li><a class="nav-link" href="<?php echo base_url('category/r');?>">Category</a></li>
                                    <?php endif;?>
                                    <?php if($this->ion_auth_acl->has_permission('list_master')):?>
                                        <li><a class="nav-link" href="<?php echo base_url('sub_category/r');?>">Sub Category</a></li>
                                    <?php endif;?>
                                    <!-- <?php if($this->ion_auth_acl->has_permission('list_master')):?>
                                        <li><a class="nav-link" href="<?php echo base_url('brands/r');?>">Brands</a></li>
                                    <?php endif;?> -->
                                    <?php if($this->ion_auth_acl->has_permission('list_master')):?>
                                        <li><a class="nav-link" href="<?php echo base_url('amenity/r');?>">Amenity</a></li>
                                    <?php endif;?>
                                    <?php if($this->ion_auth_acl->has_permission('list_master')):?>
                                        <li><a class="nav-link" href="<?php echo base_url('service/r');?>">Services</a></li>
                                    <?php endif;?>
                                    <?php if($this->ion_auth_acl->has_permission('list_master')):?>
                                        <li><a class="nav-link" href="<?php echo base_url('state/r');?>">States</a></li>
                                    <?php endif;?>
                                    <?php if($this->ion_auth_acl->has_permission('list_master')):?>
                                        <li><a class="nav-link" href="<?php echo base_url('district/r');?>">Districts</a></li>
                                    <?php endif;?>
                                    <?php if($this->ion_auth_acl->has_permission('list_master')):?>
                                        <li><a class="nav-link" href="<?php echo base_url('constituency/r');?>">Constituency</a></li>
                                    <?php endif;?>
                                </ul>
                            </li>
                        <?php endif;?>
                        <!-- <li class="dropdown"><a href="#" class="nav-link ">
                            <i data-feather="mail"></i><span>All Users</span></a>
                        </li> -->
                        <!--<li class="menu-header">UI Elements</li>-->
                        <?php if($this->ion_auth_acl->has_permission('admin') || $this->ion_auth_acl->has_permission('hr')):?>
                            <li class="dropdown"><a href="#" class="nav-link has-dropdown"><i
                                        data-feather="copy"></i><span>All Users</span></a>
                                <ul class="dropdown-menu">
                                    <?php if($this->ion_auth_acl->has_permission('emp') || $this->ion_auth_acl->has_permission('hr')):?>
                                        <li><a class="nav-link" href="<?php echo base_url('emp_list/users')?>">Users</a></li>
                                    <?php endif;?>
                                </ul>
                            </li>
                        <?php  endif;?>
                        <?php if($this->ion_auth_acl->has_permission('emp') || $this->ion_auth_acl->has_permission('hr')):?>
                            <li class="dropdown"><a href="#" class="nav-link has-dropdown"><i
                                        data-feather="copy"></i><span>Employees</span></a>
                                <ul class="dropdown-menu">
                                    <?php if($this->ion_auth_acl->has_permission('emp')):?>
                                        <li><a class="nav-link" href="<?php echo base_url('employee/r');?>">Add Employee</a></li>
                                        <li><a class="nav-link" href="<?php echo base_url('role/r');?>">Add Role</a></li>
                                    <?php endif;?>
                                    <?php if($this->ion_auth_acl->has_permission('emp') || $this->ion_auth_acl->has_permission('hr')):?>
                                        <li><a class="nav-link" href="<?php echo base_url('emp_list/executive')?>">Executives</a></li>
                                    <?php endif;?>
                                    <!-- <li><a class="nav-link" href="#">Delivery Boys</a></li>
                                    <li><a class="nav-link" href="#">Accountants</a></li>
                                    <li><a class="nav-link" href="#">HR's</a></li>
                                    <li><a class="nav-link" href="#">Controllers</a></li>
                                    <li><a class="nav-link" href="#">Co-ordinators</a></li>
                                    <li><a class="nav-link" href="#">Zonal Heads</a></li>
                                    <li><a class="nav-link" href="#">CEO's</a></li>
                                    <li><a class="nav-link" href="#">Managing Directors</a></li> -->
                                </ul>
                            </li>
                        <?php  endif;?>
                        <!-- <?php if($this->ion_auth_acl->has_permission('news')):?>
                            <li class="dropdown"><a href="#" class="nav-link has-dropdown"><i
                                        data-feather="copy"></i><span>SMTV</span></a>
                                <ul class="dropdown-menu">
                                    <?php if($this->ion_auth_acl->has_permission('news_categories')):?>
                                        <li><a class="nav-link" href="<?php echo base_url('news_categories/r');?>">Manage Categories</a></li>
                                    <?php endif;?>
                                    <?php if($this->ion_auth_acl->has_permission('manage_news')):?>
                                        <li><a class="nav-link" href="<?php echo base_url('news/r');?>">Manage News</a></li>
                                    <?php endif;?>
                                    <li><a class="nav-link" href="<?php echo base_url('local_news/r');?>">Local News</a></li>
                                </ul>
                            </li>
                        <?php endif;?> -->
                        <?php if($this->ion_auth_acl->has_permission('admin')): ?> 
                            <li>
                            <a href="<?=base_url('products_approve/r');?>">
                            <i data-feather="briefcase" class="metismenu-state-icon"></i><span>Products Approve</span>
                            </a>
                        </li>
                        <li>
                            <a href="<?=base_url('order_support/r');?>">
                            <i data-feather="briefcase" class="metismenu-state-icon"></i><span>Order Support</span>
                            </a>
                        </li>
                        <?php endif;?>
                         <?php if($this->ion_auth_acl->has_permission('leads')): ?> 
                          <li>
                            <a href="<?=base_url('vendor_leads/r');?>">
                            <i data-feather="briefcase" class="metismenu-state-icon"></i><span>Leads</span>
                            </a>
                        </li>
                        <?php endif;?>
                        <!-- Food Module Start -->
                        <?php if($this->ion_auth_acl->has_permission('food')):
                            $cat_id=$this->vendor_list_model->where('vendor_user_id', $this->ion_auth->get_user_id())->get();
$vendor_category_id=$cat_id['category_id'];
                            ?>
                        <li class="dropdown"><a href="#" class="nav-link has-dropdown"><i data-feather="copy"></i><span>Manage Account</span></a>
                                <ul class="dropdown-menu">
                                    <?php if($this->ion_auth_acl->has_permission('food_menu')):?>
                                        <li><a class="nav-link" href="<?php echo base_url('food_menu/r');?>"><?=(($this->ion_auth->is_admin())? 'Menus' : $this->category_model->get_cat_desc_account_name($vendor_category_id,'menu_nav_label'));?></a></li>
                                    <?php endif;?>
                                    <?php if($this->ion_auth_acl->has_permission('food_items')):?>
                                        <li><a class="nav-link" href="<?php echo base_url('food_item/r');?>"><?=(($this->ion_auth->is_admin())? 'Items' : $this->category_model->get_cat_desc_account_name($vendor_category_id,'item_nav_label'));?></a></li>
                                    <?php endif;?>
                                    <?php if($this->ion_auth_acl->has_permission('food_extra_sections')):?>
                                        <li><a class="nav-link" href="<?php echo base_url('food_section/r');?>"><?=(($this->ion_auth->is_admin())? 'Extra Section' : $this->category_model->get_cat_desc_account_name($vendor_category_id,'sec_nav_label'));?></a></li>
                                    <?php endif;?>
                                    <?php if($this->ion_auth_acl->has_permission('food_section_items')):?>
                                        <li><a class="nav-link" href="<?php echo base_url('food_section_item/r');?>"><?=(($this->ion_auth->is_admin())? 'Section Items' : $this->category_model->get_cat_desc_account_name($vendor_category_id,'seci_nav_label'));?></a></li>
                                    <?php endif;?>
                                    <?php if(!$this->ion_auth_acl->has_permission('admin')): ?> 
                                  <!--   <?php if($this->ion_auth_acl->has_permission('food_settings')):?>
                                        <li><a class="nav-link" href="<?php echo base_url('food_settings/r');?>">Order Settings</a></li>
                                    <?php endif;?> -->
                                    <!-- <?php if($this->ion_auth_acl->has_permission('food')):?>
                                        <li><a class="nav-link" href="<?php echo base_url('vendor_profile/r');?>">Vendor Profile</a></li>
                                    <?php endif;?> -->
                                    <?php if($this->ion_auth_acl->has_permission('food_orders')):?>
                                        <li><a class="nav-link" href="<?php echo base_url('food_orders/r');?>"><?=(($this->ion_auth->is_admin())? 'Orders' : $this->category_model->get_cat_desc_account_name($vendor_category_id,'order_nav_label'));?></a></li>
                                    <?php endif;?>
                                    <!-- <?php if($this->ion_auth_acl->has_permission('leads')):?>
                                        <li><a class="nav-link" href="<?php echo base_url('vendor_leads/r');?>">Leads</a></li>
                                    <?php endif;?> -->
                                    <?php endif;?>
                                    <!-- <?php if($this->ion_auth_acl->has_permission('food_reports')):?>
                                        <li><a class="nav-link" href="#">Reports</a></li>
                                    <?php endif;?> -->
                                    
                                </ul>
                            </li>
                        <?php endif;?>
                            <li class="dropdown"><a href="#" class="nav-link has-dropdown"><i
                                        data-feather="copy"></i><span>Settings</span></a>
                                <ul class="dropdown-menu">
                                    <?php if($this->ion_auth_acl->has_permission('site_settings')):?>
                                        <li><a class="nav-link" href="<?php echo base_url('settings/r');?>">Site Settings</a></li>
                                    <?php endif;?>
                                    <?php if($this->ion_auth_acl->has_permission('site_settings')):?>
                                    <li><a class="nav-link" href="<?php echo base_url('promos/r');?>">Promo Codes</a></li>
                                    <!-- <li><a class="nav-link" href="<?php echo base_url('vendor_settings/r');?>">Vendor Settings</a></li> -->
                                    <?php endif;?>
                                    <?php if(!$this->ion_auth_acl->has_permission('admin') && $this->ion_auth_acl->has_permission('food')):?>
                                        <li><a class="nav-link" href="<?php echo base_url('vendor_profile/r');?>">Bank Details</a></li>
                                    <?php endif;?>
                                    <?php if($this->ion_auth_acl->has_permission('slider_settings')):?>
                                        <li><a class="nav-link" href="<?php echo base_url('sliders/r');?>">Manage Sliders</a></li>
                                    <?php endif;?>
                                    <?php if($this->ion_auth_acl->has_permission('slider_settings')):?>
                                        <li><a class="nav-link" href="<?php echo base_url('category_banner/r');?>">Manage Category Banner</a></li>
                                    <?php endif;?>
                                </ul>
                            </li>
                    </ul>
                </aside>
            </div>