-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 10, 2023 at 09:35 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `trading`
--

-- --------------------------------------------------------

--
-- Table structure for table `advertisements`
--

CREATE TABLE `advertisements` (
  `id` int(50) NOT NULL,
  `type` enum('top','middle','bottom','last') NOT NULL,
  `image` varchar(100) NOT NULL,
  `ext` varchar(20) NOT NULL,
  `created_user_id` bigint(20) DEFAULT NULL,
  `updated_user_id` bigint(20) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '0=deleted,1=Active,2=Inactive'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `advertisements`
--

INSERT INTO `advertisements` (`id`, `type`, `image`, `ext`, `created_user_id`, `updated_user_id`, `created_at`, `updated_at`, `deleted_at`, `status`) VALUES
(1, 'middle', '29.jpg', 'jpg', 100240, NULL, '2020-09-11 18:21:42', NULL, '2022-08-26 08:26:02', 1),
(2, 'middle', '1.jpg', 'jpg', 100240, NULL, '2020-09-11 18:22:08', NULL, '2022-08-26 08:26:11', 1),
(3, 'middle', '24.jpg', 'jpg', 100240, NULL, '2020-09-11 18:22:27', NULL, '2022-08-26 08:26:06', 1),
(4, 'bottom', '10.jpg', 'jpg', 100240, NULL, '2020-09-11 18:22:45', NULL, '2022-08-26 08:26:16', 1),
(5, 'bottom', '16.jpg', 'jpg', 100240, NULL, '2020-09-11 18:23:08', NULL, '2022-08-26 08:26:21', 1),
(6, 'last', '26.jpg', 'jpg', 100240, NULL, '2020-09-11 18:23:33', NULL, '2022-08-26 08:25:56', 1),
(7, 'last', '33.jpg', 'jpg', 100240, NULL, '2020-09-11 18:24:02', NULL, '2022-08-26 08:25:52', 1),
(8, 'top', 'fullstack course.jpg', 'jpg', 1, NULL, '2023-08-08 08:11:36', NULL, NULL, 1),
(9, 'top', 'fullstack course.jpg', 'jpg', 1, NULL, '2023-08-08 08:13:54', NULL, '2023-08-08 08:14:19', 1),
(10, 'top', 'fullstack course.jpg', 'jpg', 1, NULL, '2023-08-08 08:14:09', NULL, '2023-08-08 08:14:15', 1);

-- --------------------------------------------------------

--
-- Table structure for table `app_sliders`
--

CREATE TABLE `app_sliders` (
  `id` int(50) NOT NULL,
  `image` varchar(100) NOT NULL,
  `ext` varchar(20) NOT NULL,
  `created_user_id` bigint(20) DEFAULT NULL,
  `updated_user_id` bigint(20) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '0=deleted,1=Active,2=Inactive'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `app_sliders`
--

INSERT INTO `app_sliders` (`id`, `image`, `ext`, `created_user_id`, `updated_user_id`, `created_at`, `updated_at`, `deleted_at`, `status`) VALUES
(1, 'download (2).jpg', 'jpg', 1, NULL, '2020-07-27 12:57:45', NULL, NULL, 1),
(2, 'to_slider_covidheaderupdate.jpg', 'jpg', 1, NULL, '2020-07-27 12:57:54', NULL, NULL, 1),
(3, 'download.jpg', 'jpg', 1, NULL, '2020-07-27 12:58:02', NULL, NULL, 1),
(4, 'veg-1.jpeg', 'jpeg', 1, NULL, '2020-07-27 12:58:10', NULL, NULL, 1),
(5, '5ce5233969cb3.jpeg', 'jpeg', 1, NULL, '2020-07-27 12:58:33', NULL, NULL, 1),
(6, '10.jpg', 'jpg', 100240, NULL, '2020-09-11 18:24:15', NULL, '2022-08-26 08:26:28', 1),
(7, '10.jpg', 'jpg', 100240, NULL, '2020-09-11 18:28:22', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `bank_details`
--

CREATE TABLE `bank_details` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `name` varchar(25) NOT NULL,
  `bank_name` varchar(25) NOT NULL,
  `ac` varchar(30) NOT NULL,
  `ifsc` varchar(20) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '0 = deleted, 1 = Active, 2 = Inactive'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` bigint(20) NOT NULL,
  `list_id` bigint(20) NOT NULL,
  `std_code` varchar(10) NOT NULL,
  `number` bigint(20) NOT NULL,
  `type` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1 = main, 2 = landline, 3 = whatsapp, 4 =  Helpline',
  `created_user_id` bigint(20) DEFAULT NULL,
  `updated_user_id` bigint(20) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '0 = deleted, 1 = Active, 2 = Inactive'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`id`, `list_id`, `std_code`, `number`, `type`, `created_user_id`, `updated_user_id`, `created_at`, `updated_at`, `deleted_at`, `status`) VALUES
(1, 1, '', 0, 1, 1, 1, '2020-09-26 12:32:10', '2020-09-26 13:35:27', NULL, 1),
(2, 1, '', 0, 2, 1, 1, '2020-09-26 12:32:10', '2020-09-26 13:35:27', NULL, 1),
(3, 1, '', 0, 3, 1, 1, '2020-09-26 12:32:10', '2020-09-26 13:35:27', NULL, 1),
(4, 1, '', 0, 4, 1, 1, '2020-09-26 12:32:10', '2020-09-26 13:35:27', NULL, 1),
(5, 0, '', 0, 1, 1, NULL, '2020-09-26 13:28:12', NULL, NULL, 1),
(6, 0, '', 0, 2, 1, NULL, '2020-09-26 13:28:12', NULL, NULL, 1),
(7, 0, '', 0, 3, 1, NULL, '2020-09-26 13:28:12', NULL, NULL, 1),
(8, 0, '', 0, 4, 1, NULL, '2020-09-26 13:28:12', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE `groups` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL,
  `code` varchar(10) NOT NULL,
  `last_id` bigint(20) NOT NULL DEFAULT 100,
  `priority` smallint(6) NOT NULL,
  `terms` text NOT NULL,
  `privacy` text NOT NULL,
  `created_user_id` bigint(20) DEFAULT NULL,
  `updated_user_id` bigint(20) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '0 = deleted, 1 = Active, 2 = Inactive'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`id`, `name`, `description`, `code`, `last_id`, `priority`, `terms`, `privacy`, `created_user_id`, `updated_user_id`, `created_at`, `updated_at`, `deleted_at`, `status`) VALUES
(1, 'admin', 'Admin', 'NCA', 1, 1, '', '', NULL, 1, '0000-00-00 00:00:00', '2020-06-30 13:18:47', NULL, 1),
(2, 'executive', 'Executive', 'NCE', 0, 4, '', '', NULL, 1, '0000-00-00 00:00:00', '2020-09-11 23:41:50', NULL, 1),
(17, 'vendor', 'Vendor', 'NCV', 1, 5, '', '', 1, 1, '2019-10-24 13:50:36', '2020-09-30 12:49:26', NULL, 1),
(18, 'hr', 'HR', 'NCHR', 0, 2, '', '', 1, 1, '2020-01-07 08:28:52', '2020-09-13 17:50:38', NULL, 1),
(19, 'dh', 'Divisional Head', 'NCDH', 0, 3, '<p>sdfa</p>\r\n', '<p>sdaf</p>\r\n', 1, 1, '2020-03-21 06:01:49', '2020-03-21 12:13:41', NULL, 1),
(20, 'user', 'User', 'NCU', 2, 6, '', '', 1, NULL, '2020-03-21 07:01:09', '2020-12-19 22:00:35', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `groups_permissions`
--

CREATE TABLE `groups_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `perm_id` int(11) NOT NULL,
  `value` tinyint(4) DEFAULT 0 COMMENT '0 = Deny, 1 = Allow',
  `created_user_id` bigint(20) DEFAULT NULL,
  `updated_user_id` bigint(20) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `groups_permissions`
--

INSERT INTO `groups_permissions` (`id`, `group_id`, `perm_id`, `value`, `created_user_id`, `updated_user_id`, `created_at`, `updated_at`) VALUES
(300, 1, 57, 1, NULL, NULL, 1575722997, 1575722997),
(302, 1, 62, 1, NULL, NULL, 1575722997, 1575722997),
(303, 1, 72, 1, NULL, NULL, 1575722997, 1575722997),
(304, 1, 69, 1, NULL, NULL, 1575722997, 1575722997),
(312, 1, 65, 1, NULL, NULL, 1575722997, 1575722997),
(315, 17, 57, 1, NULL, NULL, 1575958850, 1575958850),
(316, 17, 62, 1, NULL, NULL, 1575958850, 1575958850),
(317, 17, 72, 1, NULL, NULL, 1575958850, 1575958850),
(318, 17, 69, 1, NULL, NULL, 1575958850, 1575958850),
(319, 17, 48, 1, NULL, NULL, 1575958850, 1575958850),
(363, 1, 27, 1, NULL, NULL, 1576162185, 1576162185),
(364, 1, 29, 1, NULL, NULL, 1576162185, 1576162185),
(365, 1, 28, 1, NULL, NULL, 1576162185, 1576162185),
(366, 1, 13, 1, NULL, NULL, 1576162185, 1576162185),
(367, 1, 10, 1, NULL, NULL, 1576162185, 1576162185),
(368, 1, 24, 1, NULL, NULL, 1576162185, 1576162185),
(369, 1, 12, 1, NULL, NULL, 1576162185, 1576162185),
(370, 1, 22, 1, NULL, NULL, 1576162185, 1576162185),
(371, 1, 23, 1, NULL, NULL, 1576162185, 1576162185),
(372, 1, 11, 1, NULL, NULL, 1576162185, 1576162185),
(382, 1, 16, 1, NULL, NULL, 1576162185, 1576162185),
(383, 1, 14, 1, NULL, NULL, 1576162185, 1576162185),
(384, 1, 30, 1, NULL, NULL, 1576162185, 1576162185),
(385, 1, 32, 1, NULL, NULL, 1576162185, 1576162185),
(386, 1, 31, 1, NULL, NULL, 1576162185, 1576162185),
(387, 1, 15, 1, NULL, NULL, 1576162185, 1576162185),
(388, 1, 44, 1, NULL, NULL, 1576162185, 1576162185),
(389, 1, 19, 1, NULL, NULL, 1576162185, 1576162185),
(390, 1, 43, 1, NULL, NULL, 1576162185, 1576162185),
(391, 1, 26, 1, NULL, NULL, 1576162185, 1576162185),
(392, 1, 25, 1, NULL, NULL, 1576162185, 1576162185),
(401, 1, 18, 1, NULL, NULL, 1576162185, 1576162185),
(402, 1, 17, 1, NULL, NULL, 1576162185, 1576162185),
(403, 1, 42, 1, NULL, NULL, 1576162185, 1576162185),
(404, 1, 41, 1, NULL, NULL, 1576162185, 1576162185),
(503, 18, 1, 1, NULL, NULL, 1584773985, 1584773985),
(504, 18, 5, 1, NULL, NULL, 1584773985, 1584773985),
(505, 18, 4, 1, NULL, NULL, 1584773985, 1584773985),
(506, 2, 2, 1, NULL, NULL, 1584774016, 1584774016),
(508, 1, 1, 1, NULL, NULL, 1593503329, 1593503329),
(509, 1, 5, 1, NULL, NULL, 1593503329, 1593503329),
(510, 1, 36, 1, NULL, NULL, 1593503329, 1593503329),
(511, 1, 35, 1, NULL, NULL, 1593503329, 1593503329),
(512, 1, 34, 1, NULL, NULL, 1593503329, 1593503329),
(513, 1, 39, 1, NULL, NULL, 1593503329, 1593503329),
(514, 1, 40, 1, NULL, NULL, 1593503329, 1593503329),
(515, 1, 37, 1, NULL, NULL, 1593503329, 1593503329),
(516, 1, 38, 1, NULL, NULL, 1593503329, 1593503329),
(517, 1, 4, 1, NULL, NULL, 1593503329, 1593503329),
(518, 1, 33, 1, NULL, NULL, 1593503329, 1593503329),
(519, 1, 21, 1, NULL, NULL, 1593503329, 1593503329),
(520, 1, 9, 1, NULL, NULL, 1593503329, 1593503329),
(521, 1, 20, 1, NULL, NULL, 1593503329, 1593503329),
(522, 1, 48, 1, NULL, NULL, 1593503329, 1593503329),
(523, 1, 45, 1, NULL, NULL, 1593503329, 1593503329),
(524, 1, 2, 1, NULL, NULL, 1593503329, 1593503329),
(525, 1, 6, 1, NULL, NULL, 1593503329, 1593503329),
(526, 1, 7, 1, NULL, NULL, 1593503329, 1593503329),
(527, 1, 8, 1, NULL, NULL, 1593503329, 1593503329),
(528, 1, 3, 1, NULL, NULL, 1593503329, 1593503329);

-- --------------------------------------------------------

--
-- Table structure for table `login_attempts`
--

CREATE TABLE `login_attempts` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(15) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `manage_account`
--

CREATE TABLE `manage_account` (
  `id` int(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `desc` varchar(50) NOT NULL,
  `field_status` varchar(100) DEFAULT NULL,
  `created_user_id` bigint(20) DEFAULT NULL,
  `updated_user_id` bigint(20) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '0=deleted,1=Active,2=Inactive'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `manage_account`
--

INSERT INTO `manage_account` (`id`, `name`, `desc`, `field_status`, `created_user_id`, `updated_user_id`, `created_at`, `updated_at`, `deleted_at`, `status`) VALUES
(1, 'Menu Navbar Label', 'menu_nav_label', NULL, NULL, NULL, '2020-02-20 11:17:11', NULL, NULL, 1),
(2, 'Menu Label', 'menu_label', NULL, NULL, NULL, '2020-02-20 11:17:11', NULL, NULL, 1),
(3, 'Menu Name', 'menu_name', NULL, NULL, NULL, '2020-02-20 11:17:11', NULL, NULL, 1),
(4, 'Menu Description', 'menu_desc', NULL, NULL, NULL, '2020-02-20 11:17:11', NULL, NULL, 1),
(5, 'Menu Image', 'menu_image', NULL, NULL, NULL, '2020-02-20 11:17:11', NULL, NULL, 1),
(6, 'Item Navbar Label', 'item_nav_label', NULL, NULL, NULL, '2020-02-20 11:17:11', NULL, NULL, 1),
(7, 'Item Label', 'item_label', NULL, NULL, NULL, '2020-02-20 11:17:11', NULL, NULL, 1),
(8, 'Item Menu', 'item_menu', NULL, NULL, NULL, '2020-02-20 11:17:11', NULL, NULL, 1),
(9, 'Item Name', 'item_name', NULL, NULL, NULL, '2020-02-20 11:17:11', NULL, NULL, 1),
(10, 'Item Price', 'item_price', NULL, NULL, NULL, '2020-02-20 11:17:11', NULL, NULL, 1),
(11, 'Item Quantity', 'item_quantity', NULL, NULL, NULL, '2020-02-20 11:17:11', NULL, NULL, 1),
(12, 'Item Veg/Non-Veg', 'item_veg_non_veg', '1-Show / 0-Hide', NULL, NULL, '2020-02-20 13:19:53', NULL, NULL, 1),
(13, 'Item Status', 'item_status', NULL, NULL, NULL, '2020-02-20 11:17:11', NULL, NULL, 1),
(14, 'Item Discount', 'item_discount', NULL, NULL, NULL, '2020-02-20 11:17:11', NULL, NULL, 1),
(15, 'Item Image', 'item_image', NULL, NULL, NULL, '2020-02-20 11:17:11', NULL, NULL, 1),
(16, 'Item Description', 'item_desc', NULL, NULL, NULL, '2020-02-20 11:17:11', NULL, NULL, 1),
(17, 'Section Navbar Label', 'sec_nav_label', NULL, NULL, NULL, '2020-02-20 11:17:11', NULL, NULL, 1),
(18, 'Section Label', 'sec_label', NULL, NULL, NULL, '2020-02-20 11:17:11', NULL, NULL, 1),
(19, 'Section Menu', 'sec_menu', NULL, NULL, NULL, '2020-02-20 11:17:11', NULL, NULL, 1),
(20, 'Section Item', 'sec_item', NULL, NULL, NULL, '2020-02-20 11:17:11', NULL, NULL, 1),
(21, 'Section Name', 'sec_name', NULL, NULL, NULL, '2020-02-20 11:17:11', NULL, NULL, 1),
(22, 'Section Field (Radio / Checkbox)', 'sec_field', '1-Radio / 2-Checkbox / 3-Both', NULL, NULL, '2020-02-20 11:17:11', NULL, NULL, 1),
(23, 'Section Required', 'sec_required', '1-Required / 0-Not Required / 2-Optional', NULL, NULL, '2020-02-20 11:17:11', NULL, NULL, 1),
(24, 'Section Item Navbar Label', 'seci_nav_label', NULL, NULL, NULL, '2020-02-20 11:17:11', NULL, NULL, 1),
(25, 'Section Item Label', 'seci_label', NULL, NULL, NULL, '2020-02-20 11:17:11', NULL, NULL, 1),
(26, 'Section Item Menu', 'seci_menu', NULL, NULL, NULL, '2020-02-20 11:17:11', NULL, NULL, 1),
(27, 'Section Item-Item', 'seci_item', NULL, NULL, NULL, '2020-02-20 11:17:11', NULL, NULL, 1),
(28, 'Section Item-Section', 'seci_sec', NULL, NULL, NULL, '2020-02-20 11:17:11', NULL, NULL, 1),
(29, 'Section Item Name', 'seci_name', NULL, NULL, NULL, '2020-02-20 11:17:11', NULL, NULL, 1),
(30, 'Section Item Price', 'seci_price', NULL, NULL, NULL, '2020-02-20 11:17:11', NULL, NULL, 1),
(31, 'Section Item Description', 'seci_desc', NULL, NULL, NULL, '2020-02-20 11:17:11', NULL, NULL, 1),
(32, 'Section Item Status', 'seci_status', NULL, NULL, NULL, '2020-02-27 19:14:23', NULL, NULL, 1),
(33, 'Orders Navbar Label', 'order_nav_label', NULL, NULL, NULL, '2020-02-26 18:58:47', NULL, NULL, 1),
(34, 'Order Label', 'order_label', NULL, NULL, NULL, '2020-02-26 19:00:08', NULL, NULL, 1),
(35, 'Order Rejected', 'order_rejected', NULL, NULL, NULL, '2020-02-26 18:58:47', NULL, NULL, 1),
(36, 'Order Received', 'order_received', NULL, NULL, NULL, '2020-02-26 18:58:47', NULL, NULL, 1),
(37, 'Order Accepted', 'order_accepted', NULL, NULL, NULL, '2020-02-26 18:58:47', NULL, NULL, 1),
(38, 'Order Preparing', 'order_preparing', '1-Show / 0-Hide', NULL, NULL, '2020-02-26 18:58:47', NULL, NULL, 1),
(39, 'Order Out For Delivery', 'order_out_delivery', '1-Show / 0-Hide', NULL, NULL, '2020-02-26 18:58:47', NULL, NULL, 1),
(40, 'Order On The Way', 'order_on_way', '1-Show / 0-Hide', NULL, NULL, '2020-02-26 18:58:47', NULL, NULL, 1),
(41, 'Order Completed', 'order_completed', NULL, NULL, NULL, '2020-02-26 18:58:47', NULL, NULL, 1),
(42, 'Order Canceled', 'order_canceled', NULL, NULL, NULL, '2020-02-26 18:58:47', NULL, NULL, 1),
(43, 'Order Rejected Button', 'order_rejected_btn', NULL, NULL, NULL, '2020-02-27 16:44:52', NULL, NULL, 1),
(44, 'Order Received Button', 'order_received_btn', NULL, NULL, NULL, '2020-02-27 16:44:52', NULL, NULL, 1),
(45, 'Order Accepted Button', 'order_accepted_btn', NULL, NULL, NULL, '2020-02-27 16:44:52', NULL, NULL, 1),
(46, 'Order Preparing Button', 'order_preparing_btn', NULL, NULL, NULL, '2020-02-27 16:44:52', NULL, NULL, 1),
(47, 'Order Out For Delivery Buttton', 'order_out_delivery_btn', NULL, NULL, NULL, '2020-02-27 16:44:52', NULL, NULL, 1),
(48, 'Order On The Way Button', 'order_on_way_btn', NULL, NULL, NULL, '2020-02-27 16:44:52', NULL, NULL, 1),
(49, 'Order Completed Button', 'order_completed_btn', NULL, NULL, NULL, '2020-02-27 16:44:52', NULL, NULL, 1),
(50, 'Order Canceled Button', 'order_canceled_btn', NULL, NULL, NULL, '2020-02-27 16:44:52', NULL, NULL, 1),
(51, 'App Order Label', 'app_ord_label', NULL, NULL, NULL, '2020-03-16 14:05:46', NULL, NULL, 1),
(52, 'App Order Quantity', 'app_ord_quantity', '1-Show / 0-Hide', NULL, NULL, '2020-03-16 14:05:46', NULL, NULL, 1),
(53, 'App Order Address', 'app_ord_address', '1-Show / 0-Hide', NULL, NULL, '2020-03-16 14:05:46', NULL, NULL, 1),
(54, 'Section Price', 'sec_price', NULL, NULL, NULL, '2020-04-12 06:20:48', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `manage_account_names`
--

CREATE TABLE `manage_account_names` (
  `id` int(50) NOT NULL,
  `category_id` bigint(20) NOT NULL,
  `acc_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `desc` varchar(50) NOT NULL,
  `field_status` tinyint(1) DEFAULT NULL,
  `created_user_id` bigint(20) DEFAULT NULL,
  `updated_user_id` bigint(20) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '0=deleted,1=Active,2=Inactive'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `manage_account_names`
--

INSERT INTO `manage_account_names` (`id`, `category_id`, `acc_id`, `name`, `desc`, `field_status`, `created_user_id`, `updated_user_id`, `created_at`, `updated_at`, `deleted_at`, `status`) VALUES
(1, 5, 1, 'Menus', 'menu_nav_label', NULL, NULL, NULL, '2020-02-29 12:59:48', NULL, NULL, 1),
(2, 5, 2, 'Add Menu', 'menu_label', NULL, NULL, NULL, '2020-02-29 12:59:48', NULL, NULL, 1),
(3, 5, 3, ' Menu Name', 'menu_name', NULL, NULL, NULL, '2020-02-29 12:59:48', NULL, NULL, 1),
(4, 5, 4, 'Description', 'menu_desc', NULL, NULL, NULL, '2020-02-29 12:59:48', NULL, NULL, 1),
(5, 5, 5, 'Upload Image', 'menu_image', NULL, NULL, NULL, '2020-02-29 12:59:48', NULL, NULL, 1),
(6, 5, 6, 'Items', 'item_nav_label', NULL, NULL, NULL, '2020-02-29 12:59:48', NULL, NULL, 1),
(7, 5, 7, 'Add Item', 'item_label', NULL, NULL, NULL, '2020-02-29 12:59:48', NULL, NULL, 1),
(8, 5, 8, ' Menu', 'item_menu', NULL, NULL, NULL, '2020-02-29 12:59:48', NULL, NULL, 1),
(9, 5, 9, 'Item Name', 'item_name', NULL, NULL, NULL, '2020-02-29 12:59:48', NULL, NULL, 1),
(10, 5, 10, 'Price', 'item_price', NULL, NULL, NULL, '2020-02-29 12:59:48', NULL, NULL, 1),
(11, 5, 11, 'Quantity', 'item_quantity', NULL, NULL, NULL, '2020-02-29 12:59:48', NULL, NULL, 1),
(12, 5, 12, 'Veg/Non-Veg', 'item_veg_non_veg', 1, NULL, NULL, '2020-02-29 12:59:48', NULL, NULL, 1),
(13, 5, 13, 'Status', 'item_status', NULL, NULL, NULL, '2020-02-29 12:59:48', NULL, NULL, 1),
(14, 5, 14, ' Discount', 'item_discount', NULL, NULL, NULL, '2020-02-29 12:59:48', NULL, NULL, 1),
(15, 5, 15, 'Upload Image', 'item_image', NULL, NULL, NULL, '2020-02-29 12:59:48', NULL, NULL, 1),
(16, 5, 16, 'Description', 'item_desc', NULL, NULL, NULL, '2020-02-29 12:59:48', NULL, NULL, 1),
(17, 5, 17, 'Extra Section', 'sec_nav_label', NULL, NULL, NULL, '2020-02-29 12:59:48', NULL, NULL, 1),
(18, 5, 18, 'Add Extra Section', 'sec_label', NULL, NULL, NULL, '2020-02-29 12:59:48', NULL, NULL, 1),
(19, 5, 19, 'Menu', 'sec_menu', NULL, NULL, NULL, '2020-02-29 12:59:48', NULL, NULL, 1),
(20, 5, 20, 'Item', 'sec_item', NULL, NULL, NULL, '2020-02-29 12:59:48', NULL, NULL, 1),
(21, 5, 21, 'Name', 'sec_name', NULL, NULL, NULL, '2020-02-29 12:59:48', NULL, NULL, 1),
(22, 5, 22, ' Item Field', 'sec_field', 3, NULL, NULL, '2020-02-29 12:59:48', NULL, NULL, 1),
(23, 5, 23, 'Required', 'sec_required', 2, NULL, NULL, '2020-02-29 12:59:48', NULL, NULL, 1),
(24, 5, 24, 'Section Item', 'seci_nav_label', NULL, NULL, NULL, '2020-02-29 12:59:48', NULL, NULL, 1),
(25, 5, 25, 'Add Section Item ', 'seci_label', NULL, NULL, NULL, '2020-02-29 12:59:48', NULL, NULL, 1),
(26, 5, 26, 'Select Menu', 'seci_menu', NULL, NULL, NULL, '2020-02-29 12:59:48', NULL, NULL, 1),
(27, 5, 27, 'Select Item', 'seci_item', NULL, NULL, NULL, '2020-02-29 12:59:48', NULL, NULL, 1),
(28, 5, 28, 'Select Section', 'seci_sec', NULL, NULL, NULL, '2020-02-29 12:59:48', NULL, NULL, 1),
(29, 5, 29, 'Section Item Name', 'seci_name', NULL, NULL, NULL, '2020-02-29 12:59:48', NULL, NULL, 1),
(30, 5, 30, 'Price', 'seci_price', NULL, NULL, NULL, '2020-02-29 12:59:48', NULL, NULL, 1),
(31, 5, 31, 'Description', 'seci_desc', NULL, NULL, NULL, '2020-02-29 12:59:48', NULL, NULL, 1),
(32, 5, 32, 'Section Item Status', 'seci_status', NULL, NULL, NULL, '2020-02-29 12:59:48', NULL, NULL, 1),
(33, 5, 33, 'Orders', 'order_nav_label', NULL, NULL, NULL, '2020-02-29 12:59:48', NULL, NULL, 1),
(34, 5, 34, 'Order', 'order_label', NULL, NULL, NULL, '2020-02-29 12:59:48', NULL, NULL, 1),
(35, 5, 35, 'Order Rejected', 'order_rejected', NULL, NULL, NULL, '2020-02-29 12:59:48', NULL, NULL, 1),
(36, 5, 36, 'Order Received', 'order_received', NULL, NULL, NULL, '2020-02-29 12:59:48', NULL, NULL, 1),
(37, 5, 37, 'Order Accepted', 'order_accepted', NULL, NULL, NULL, '2020-02-29 12:59:48', NULL, NULL, 1),
(38, 5, 38, 'Food Preparing', 'order_preparing', 1, NULL, NULL, '2020-02-29 12:59:48', NULL, NULL, 1),
(39, 5, 39, 'Out For Delivery', 'order_out_delivery', 1, NULL, NULL, '2020-02-29 12:59:48', NULL, NULL, 1),
(40, 5, 40, 'On The Way', 'order_on_way', 1, NULL, NULL, '2020-02-29 12:59:48', NULL, NULL, 1),
(41, 5, 41, 'Order Completed', 'order_completed', NULL, NULL, NULL, '2020-02-29 12:59:48', NULL, NULL, 1),
(42, 5, 42, 'Order Canceled', 'order_canceled', NULL, NULL, NULL, '2020-02-29 12:59:48', NULL, NULL, 1),
(43, 5, 43, 'Rejected Button', 'order_rejected_btn', NULL, NULL, NULL, '2020-02-29 12:59:48', NULL, NULL, 1),
(44, 5, 44, 'Received Button', 'order_received_btn', NULL, NULL, NULL, '2020-02-29 12:59:48', NULL, NULL, 1),
(45, 5, 45, 'Accepted Button', 'order_accepted_btn', NULL, NULL, NULL, '2020-02-29 12:59:48', NULL, NULL, 1),
(46, 5, 46, 'Preparing Button', 'order_preparing_btn', NULL, NULL, NULL, '2020-02-29 12:59:48', NULL, NULL, 1),
(47, 5, 47, 'Out For Delivery Buttton', 'order_out_delivery_btn', NULL, NULL, NULL, '2020-02-29 12:59:48', NULL, NULL, 1),
(48, 5, 48, 'On The Way Button', 'order_on_way_btn', NULL, NULL, NULL, '2020-02-29 12:59:48', NULL, NULL, 1),
(49, 5, 49, 'Completed Button', 'order_completed_btn', NULL, NULL, NULL, '2020-02-29 12:59:48', NULL, NULL, 1),
(50, 5, 50, 'Canceled Button', 'order_canceled_btn', NULL, NULL, NULL, '2020-02-29 12:59:48', NULL, NULL, 1),
(51, 4, 1, 'Category', 'menu_nav_label', NULL, NULL, NULL, '2020-02-29 12:59:54', NULL, NULL, 1),
(52, 4, 2, 'Add Category', 'menu_label', NULL, NULL, NULL, '2020-02-29 12:59:54', NULL, NULL, 1),
(53, 4, 3, 'Category Name', 'menu_name', NULL, NULL, NULL, '2020-02-29 12:59:54', NULL, NULL, 1),
(54, 4, 4, 'Description', 'menu_desc', NULL, NULL, NULL, '2020-02-29 12:59:54', NULL, NULL, 1),
(55, 4, 5, 'Upload Image', 'menu_image', NULL, NULL, NULL, '2020-02-29 12:59:54', NULL, NULL, 1),
(56, 4, 6, 'Product', 'item_nav_label', NULL, NULL, NULL, '2020-02-29 12:59:54', NULL, NULL, 1),
(57, 4, 7, 'Add Product', 'item_label', NULL, NULL, NULL, '2020-02-29 12:59:54', NULL, NULL, 1),
(58, 4, 8, 'Select Category', 'item_menu', NULL, NULL, NULL, '2020-02-29 12:59:54', NULL, NULL, 1),
(59, 4, 9, 'Product Name', 'item_name', NULL, NULL, NULL, '2020-02-29 12:59:54', NULL, NULL, 1),
(60, 4, 10, 'Price', 'item_price', NULL, NULL, NULL, '2020-02-29 12:59:54', NULL, NULL, 1),
(61, 4, 11, 'Quantity', 'item_quantity', NULL, NULL, NULL, '2020-02-29 12:59:54', NULL, NULL, 1),
(62, 4, 12, '', 'item_veg_non_veg', 0, NULL, NULL, '2020-02-29 12:59:54', NULL, NULL, 1),
(63, 4, 13, 'Status', 'item_status', NULL, NULL, NULL, '2020-02-29 12:59:54', NULL, NULL, 1),
(64, 4, 14, 'Discount', 'item_discount', NULL, NULL, NULL, '2020-02-29 12:59:54', NULL, NULL, 1),
(65, 4, 15, 'Upload Image', 'item_image', NULL, NULL, NULL, '2020-02-29 12:59:54', NULL, NULL, 1),
(66, 4, 16, 'Description', 'item_desc', NULL, NULL, NULL, '2020-02-29 12:59:54', NULL, NULL, 1),
(67, 4, 17, 'Extra Section', 'sec_nav_label', NULL, NULL, NULL, '2020-02-29 12:59:54', NULL, NULL, 1),
(68, 4, 18, 'Add Extra Section', 'sec_label', NULL, NULL, NULL, '2020-02-29 12:59:54', NULL, NULL, 1),
(69, 4, 19, 'Select Menu', 'sec_menu', NULL, NULL, NULL, '2020-02-29 12:59:54', NULL, NULL, 1),
(70, 4, 20, 'Select Item', 'sec_item', NULL, NULL, NULL, '2020-02-29 12:59:54', NULL, NULL, 1),
(71, 4, 21, 'Section Name', 'sec_name', NULL, NULL, NULL, '2020-02-29 12:59:54', NULL, NULL, 1),
(72, 4, 22, 'Section Field (Radio / Checkbox)', 'sec_field', 3, NULL, NULL, '2020-02-29 12:59:54', NULL, NULL, 1),
(73, 4, 23, 'Section Required', 'sec_required', 1, NULL, NULL, '2020-02-29 12:59:54', NULL, NULL, 1),
(74, 4, 24, 'Section Item', 'seci_nav_label', NULL, NULL, NULL, '2020-02-29 12:59:54', NULL, NULL, 1),
(75, 4, 25, 'Add Section Item', 'seci_label', NULL, NULL, NULL, '2020-02-29 12:59:54', NULL, NULL, 1),
(76, 4, 26, 'Menu', 'seci_menu', NULL, NULL, NULL, '2020-02-29 12:59:54', NULL, NULL, 1),
(77, 4, 27, 'Item', 'seci_item', NULL, NULL, NULL, '2020-02-29 12:59:54', NULL, NULL, 1),
(78, 4, 28, 'Section', 'seci_sec', NULL, NULL, NULL, '2020-02-29 12:59:54', NULL, NULL, 1),
(79, 4, 29, 'Section Item Name', 'seci_name', NULL, NULL, NULL, '2020-02-29 12:59:54', NULL, NULL, 1),
(80, 4, 30, 'Price', 'seci_price', NULL, NULL, NULL, '2020-02-29 12:59:54', NULL, NULL, 1),
(81, 4, 31, 'Description', 'seci_desc', NULL, NULL, NULL, '2020-02-29 12:59:54', NULL, NULL, 1),
(82, 4, 32, 'Status', 'seci_status', NULL, NULL, NULL, '2020-02-29 12:59:54', NULL, NULL, 1),
(83, 4, 33, 'Orders', 'order_nav_label', NULL, NULL, NULL, '2020-02-29 12:59:54', NULL, NULL, 1),
(84, 4, 34, 'Order', 'order_label', NULL, NULL, NULL, '2020-02-29 12:59:54', NULL, NULL, 1),
(85, 4, 35, 'Rejected', 'order_rejected', NULL, NULL, NULL, '2020-02-29 12:59:54', NULL, NULL, 1),
(86, 4, 36, 'Received', 'order_received', NULL, NULL, NULL, '2020-02-29 12:59:54', NULL, NULL, 1),
(87, 4, 37, 'Accepted', 'order_accepted', NULL, NULL, NULL, '2020-02-29 12:59:54', NULL, NULL, 1),
(88, 4, 38, '', 'order_preparing', 0, NULL, NULL, '2020-02-29 12:59:54', NULL, NULL, 1),
(89, 4, 39, 'Out For Delivery', 'order_out_delivery', 1, NULL, NULL, '2020-02-29 12:59:54', NULL, NULL, 1),
(90, 4, 40, 'On The Way', 'order_on_way', 1, NULL, NULL, '2020-02-29 12:59:54', NULL, NULL, 1),
(91, 4, 41, 'Completed', 'order_completed', NULL, NULL, NULL, '2020-02-29 12:59:54', NULL, NULL, 1),
(92, 4, 42, 'Canceled', 'order_canceled', NULL, NULL, NULL, '2020-02-29 12:59:54', NULL, NULL, 1),
(93, 4, 43, 'Rejected', 'order_rejected_btn', NULL, NULL, NULL, '2020-02-29 12:59:54', NULL, NULL, 1),
(94, 4, 44, 'Received', 'order_received_btn', NULL, NULL, NULL, '2020-02-29 12:59:54', NULL, NULL, 1),
(95, 4, 45, 'Accepted', 'order_accepted_btn', NULL, NULL, NULL, '2020-02-29 12:59:54', NULL, NULL, 1),
(96, 4, 46, '', 'order_preparing_btn', NULL, NULL, NULL, '2020-02-29 12:59:54', NULL, NULL, 1),
(97, 4, 47, 'Out For Delivery', 'order_out_delivery_btn', NULL, NULL, NULL, '2020-02-29 12:59:54', NULL, NULL, 1),
(98, 4, 48, 'On the Way', 'order_on_way_btn', NULL, NULL, NULL, '2020-02-29 12:59:54', NULL, NULL, 1),
(99, 4, 49, 'Completed', 'order_completed_btn', NULL, NULL, NULL, '2020-02-29 12:59:54', NULL, NULL, 1),
(100, 4, 50, 'Canceled', 'order_canceled_btn', NULL, NULL, NULL, '2020-02-29 12:59:54', NULL, NULL, 1),
(101, 6, 1, 'Specialization', 'menu_nav_label', NULL, NULL, NULL, '2020-02-29 13:00:17', NULL, NULL, 1),
(102, 6, 2, 'Add Specialization', 'menu_label', NULL, NULL, NULL, '2020-02-29 13:00:17', NULL, NULL, 1),
(103, 6, 3, 'Specialization Name', 'menu_name', NULL, NULL, NULL, '2020-02-29 13:00:17', NULL, NULL, 1),
(104, 6, 4, 'Description', 'menu_desc', NULL, NULL, NULL, '2020-02-29 13:00:17', NULL, NULL, 1),
(105, 6, 5, 'Upload Image', 'menu_image', NULL, NULL, NULL, '2020-02-29 13:00:17', NULL, NULL, 1),
(106, 6, 6, 'Doctor', 'item_nav_label', NULL, NULL, NULL, '2020-02-29 13:00:17', NULL, NULL, 1),
(107, 6, 7, 'Add Doctor', 'item_label', NULL, NULL, NULL, '2020-02-29 13:00:17', NULL, NULL, 1),
(108, 6, 8, 'Select Category', 'item_menu', NULL, NULL, NULL, '2020-02-29 13:00:17', NULL, NULL, 1),
(109, 6, 9, 'Doctor Name', 'item_name', NULL, NULL, NULL, '2020-02-29 13:00:17', NULL, NULL, 1),
(110, 6, 10, 'Price', 'item_price', NULL, NULL, NULL, '2020-02-29 13:00:17', NULL, NULL, 1),
(111, 6, 11, 'Experience', 'item_quantity', NULL, NULL, NULL, '2020-02-29 13:00:17', NULL, NULL, 1),
(112, 6, 12, '', 'item_veg_non_veg', 0, NULL, NULL, '2020-02-29 13:00:17', NULL, NULL, 1),
(113, 6, 13, 'Status', 'item_status', NULL, NULL, NULL, '2020-02-29 13:00:17', NULL, NULL, 1),
(114, 6, 14, 'Discount', 'item_discount', NULL, NULL, NULL, '2020-02-29 13:00:17', NULL, NULL, 1),
(115, 6, 15, 'Upload Image', 'item_image', NULL, NULL, NULL, '2020-02-29 13:00:17', NULL, NULL, 1),
(116, 6, 16, 'Description', 'item_desc', NULL, NULL, NULL, '2020-02-29 13:00:17', NULL, NULL, 1),
(117, 6, 17, 'Extra Section', 'sec_nav_label', NULL, NULL, NULL, '2020-02-29 13:00:17', NULL, NULL, 1),
(118, 6, 18, 'Add Extra Section', 'sec_label', NULL, NULL, NULL, '2020-02-29 13:00:17', NULL, NULL, 1),
(119, 6, 19, 'Select Menu', 'sec_menu', NULL, NULL, NULL, '2020-02-29 13:00:17', NULL, NULL, 1),
(120, 6, 20, 'Select Item', 'sec_item', NULL, NULL, NULL, '2020-02-29 13:00:17', NULL, NULL, 1),
(121, 6, 21, 'Section Name', 'sec_name', NULL, NULL, NULL, '2020-02-29 13:00:17', NULL, NULL, 1),
(122, 6, 22, 'Section Field (Radio / Checkbox)', 'sec_field', 3, NULL, NULL, '2020-02-29 13:00:17', NULL, NULL, 1),
(123, 6, 23, 'Section Required', 'sec_required', 1, NULL, NULL, '2020-02-29 13:00:17', NULL, NULL, 1),
(124, 6, 24, 'Section Item', 'seci_nav_label', NULL, NULL, NULL, '2020-02-29 13:00:17', NULL, NULL, 1),
(125, 6, 25, 'Add Section Item', 'seci_label', NULL, NULL, NULL, '2020-02-29 13:00:17', NULL, NULL, 1),
(126, 6, 26, 'Menu', 'seci_menu', NULL, NULL, NULL, '2020-02-29 13:00:17', NULL, NULL, 1),
(127, 6, 27, 'Item', 'seci_item', NULL, NULL, NULL, '2020-02-29 13:00:17', NULL, NULL, 1),
(128, 6, 28, 'Section', 'seci_sec', NULL, NULL, NULL, '2020-02-29 13:00:17', NULL, NULL, 1),
(129, 6, 29, 'Section Item Name', 'seci_name', NULL, NULL, NULL, '2020-02-29 13:00:17', NULL, NULL, 1),
(130, 6, 30, 'Price', 'seci_price', NULL, NULL, NULL, '2020-02-29 13:00:17', NULL, NULL, 1),
(131, 6, 31, 'Description', 'seci_desc', NULL, NULL, NULL, '2020-02-29 13:00:17', NULL, NULL, 1),
(132, 6, 32, 'Status', 'seci_status', NULL, NULL, NULL, '2020-02-29 13:00:17', NULL, NULL, 1),
(133, 6, 33, 'Orders', 'order_nav_label', NULL, NULL, NULL, '2020-02-29 13:00:17', NULL, NULL, 1),
(134, 6, 34, 'Order', 'order_label', NULL, NULL, NULL, '2020-02-29 13:00:17', NULL, NULL, 1),
(135, 6, 35, 'Rejected', 'order_rejected', NULL, NULL, NULL, '2020-02-29 13:00:17', NULL, NULL, 1),
(136, 6, 36, 'Received', 'order_received', NULL, NULL, NULL, '2020-02-29 13:00:17', NULL, NULL, 1),
(137, 6, 37, 'Accepted', 'order_accepted', NULL, NULL, NULL, '2020-02-29 13:00:17', NULL, NULL, 1),
(138, 6, 38, '', 'order_preparing', 0, NULL, NULL, '2020-02-29 13:00:17', NULL, NULL, 1),
(139, 6, 39, '', 'order_out_delivery', 0, NULL, NULL, '2020-02-29 13:00:17', NULL, NULL, 1),
(140, 6, 40, '', 'order_on_way', 0, NULL, NULL, '2020-02-29 13:00:17', NULL, NULL, 1),
(141, 6, 41, 'Completed', 'order_completed', NULL, NULL, NULL, '2020-02-29 13:00:17', NULL, NULL, 1),
(142, 6, 42, 'Canceled', 'order_canceled', NULL, NULL, NULL, '2020-02-29 13:00:17', NULL, NULL, 1),
(143, 6, 43, 'Rejected', 'order_rejected_btn', NULL, NULL, NULL, '2020-02-29 13:00:17', NULL, NULL, 1),
(144, 6, 44, 'Received', 'order_received_btn', NULL, NULL, NULL, '2020-02-29 13:00:17', NULL, NULL, 1),
(145, 6, 45, 'Accepted', 'order_accepted_btn', NULL, NULL, NULL, '2020-02-29 13:00:17', NULL, NULL, 1),
(146, 6, 46, '', 'order_preparing_btn', NULL, NULL, NULL, '2020-02-29 13:00:17', NULL, NULL, 1),
(147, 6, 47, '', 'order_out_delivery_btn', NULL, NULL, NULL, '2020-02-29 13:00:17', NULL, NULL, 1),
(148, 6, 48, '', 'order_on_way_btn', NULL, NULL, NULL, '2020-02-29 13:00:17', NULL, NULL, 1),
(149, 6, 49, 'Completed', 'order_completed_btn', NULL, NULL, NULL, '2020-02-29 13:00:17', NULL, NULL, 1),
(150, 6, 50, 'Canceled', 'order_canceled_btn', NULL, NULL, NULL, '2020-02-29 13:00:17', NULL, NULL, 1),
(151, 7, 1, 'Category', 'menu_nav_label', NULL, NULL, NULL, '2020-02-29 13:00:38', NULL, NULL, 1),
(152, 7, 2, 'Add Category', 'menu_label', NULL, NULL, NULL, '2020-02-29 13:00:38', NULL, NULL, 1),
(153, 7, 3, 'Category Name', 'menu_name', NULL, NULL, NULL, '2020-02-29 13:00:38', NULL, NULL, 1),
(154, 7, 4, 'Description', 'menu_desc', NULL, NULL, NULL, '2020-02-29 13:00:38', NULL, NULL, 1),
(155, 7, 5, 'Upload Image', 'menu_image', NULL, NULL, NULL, '2020-02-29 13:00:38', NULL, NULL, 1),
(156, 7, 6, 'Product', 'item_nav_label', NULL, NULL, NULL, '2020-02-29 13:00:38', NULL, NULL, 1),
(157, 7, 7, 'Add Product', 'item_label', NULL, NULL, NULL, '2020-02-29 13:00:38', NULL, NULL, 1),
(158, 7, 8, 'Select Category', 'item_menu', NULL, NULL, NULL, '2020-02-29 13:00:38', NULL, NULL, 1),
(159, 7, 9, 'Product Name', 'item_name', NULL, NULL, NULL, '2020-02-29 13:00:38', NULL, NULL, 1),
(160, 7, 10, 'Price', 'item_price', NULL, NULL, NULL, '2020-02-29 13:00:38', NULL, NULL, 1),
(161, 7, 11, 'Quantity', 'item_quantity', NULL, NULL, NULL, '2020-02-29 13:00:38', NULL, NULL, 1),
(162, 7, 12, '', 'item_veg_non_veg', 0, NULL, NULL, '2020-02-29 13:00:38', NULL, NULL, 1),
(163, 7, 13, 'Status', 'item_status', NULL, NULL, NULL, '2020-02-29 13:00:38', NULL, NULL, 1),
(164, 7, 14, 'Discount', 'item_discount', NULL, NULL, NULL, '2020-02-29 13:00:38', NULL, NULL, 1),
(165, 7, 15, 'Upload Image', 'item_image', NULL, NULL, NULL, '2020-02-29 13:00:38', NULL, NULL, 1),
(166, 7, 16, 'Description', 'item_desc', NULL, NULL, NULL, '2020-02-29 13:00:38', NULL, NULL, 1),
(167, 7, 17, 'Extra Section', 'sec_nav_label', NULL, NULL, NULL, '2020-02-29 13:00:38', NULL, NULL, 1),
(168, 7, 18, 'Add Extra Section', 'sec_label', NULL, NULL, NULL, '2020-02-29 13:00:38', NULL, NULL, 1),
(169, 7, 19, 'Select Menu', 'sec_menu', NULL, NULL, NULL, '2020-02-29 13:00:38', NULL, NULL, 1),
(170, 7, 20, 'Select Item', 'sec_item', NULL, NULL, NULL, '2020-02-29 13:00:38', NULL, NULL, 1),
(171, 7, 21, 'Section Name', 'sec_name', NULL, NULL, NULL, '2020-02-29 13:00:38', NULL, NULL, 1),
(172, 7, 22, 'Section Field (Radio / Checkbox)', 'sec_field', 3, NULL, NULL, '2020-02-29 13:00:38', NULL, NULL, 1),
(173, 7, 23, 'Section Required', 'sec_required', 1, NULL, NULL, '2020-02-29 13:00:38', NULL, NULL, 1),
(174, 7, 24, 'Section Item', 'seci_nav_label', NULL, NULL, NULL, '2020-02-29 13:00:38', NULL, NULL, 1),
(175, 7, 25, 'Add Section Item', 'seci_label', NULL, NULL, NULL, '2020-02-29 13:00:38', NULL, NULL, 1),
(176, 7, 26, 'Menu', 'seci_menu', NULL, NULL, NULL, '2020-02-29 13:00:38', NULL, NULL, 1),
(177, 7, 27, 'Item', 'seci_item', NULL, NULL, NULL, '2020-02-29 13:00:38', NULL, NULL, 1),
(178, 7, 28, 'Section', 'seci_sec', NULL, NULL, NULL, '2020-02-29 13:00:38', NULL, NULL, 1),
(179, 7, 29, 'Section Item Name', 'seci_name', NULL, NULL, NULL, '2020-02-29 13:00:38', NULL, NULL, 1),
(180, 7, 30, 'Price', 'seci_price', NULL, NULL, NULL, '2020-02-29 13:00:38', NULL, NULL, 1),
(181, 7, 31, 'Description', 'seci_desc', NULL, NULL, NULL, '2020-02-29 13:00:38', NULL, NULL, 1),
(182, 7, 32, 'Status', 'seci_status', NULL, NULL, NULL, '2020-02-29 13:00:38', NULL, NULL, 1),
(183, 7, 33, 'Orders', 'order_nav_label', NULL, NULL, NULL, '2020-02-29 13:00:38', NULL, NULL, 1),
(184, 7, 34, 'Order', 'order_label', NULL, NULL, NULL, '2020-02-29 13:00:38', NULL, NULL, 1),
(185, 7, 35, 'Rejected', 'order_rejected', NULL, NULL, NULL, '2020-02-29 13:00:38', NULL, NULL, 1),
(186, 7, 36, 'Received', 'order_received', NULL, NULL, NULL, '2020-02-29 13:00:38', NULL, NULL, 1),
(187, 7, 37, 'Accepted', 'order_accepted', NULL, NULL, NULL, '2020-02-29 13:00:38', NULL, NULL, 1),
(188, 7, 38, '', 'order_preparing', 0, NULL, NULL, '2020-02-29 13:00:38', NULL, NULL, 1),
(189, 7, 39, 'Out For Delivery', 'order_out_delivery', 1, NULL, NULL, '2020-02-29 13:00:38', NULL, NULL, 1),
(190, 7, 40, 'On The Way', 'order_on_way', 1, NULL, NULL, '2020-02-29 13:00:38', NULL, NULL, 1),
(191, 7, 41, 'Completed', 'order_completed', NULL, NULL, NULL, '2020-02-29 13:00:38', NULL, NULL, 1),
(192, 7, 42, 'Canceled', 'order_canceled', NULL, NULL, NULL, '2020-02-29 13:00:38', NULL, NULL, 1),
(193, 7, 43, 'Rejected', 'order_rejected_btn', NULL, NULL, NULL, '2020-02-29 13:00:38', NULL, NULL, 1),
(194, 7, 44, 'Received', 'order_received_btn', NULL, NULL, NULL, '2020-02-29 13:00:38', NULL, NULL, 1),
(195, 7, 45, 'Accepted', 'order_accepted_btn', NULL, NULL, NULL, '2020-02-29 13:00:38', NULL, NULL, 1),
(196, 7, 46, '', 'order_preparing_btn', NULL, NULL, NULL, '2020-02-29 13:00:38', NULL, NULL, 1),
(197, 7, 47, 'Out For Delivery', 'order_out_delivery_btn', NULL, NULL, NULL, '2020-02-29 13:00:38', NULL, NULL, 1),
(198, 7, 48, 'On the Way', 'order_on_way_btn', NULL, NULL, NULL, '2020-02-29 13:00:38', NULL, NULL, 1),
(199, 7, 49, 'Completed', 'order_completed_btn', NULL, NULL, NULL, '2020-02-29 13:00:38', NULL, NULL, 1),
(200, 7, 50, 'Canceled', 'order_canceled_btn', NULL, NULL, NULL, '2020-02-29 13:00:38', NULL, NULL, 1),
(201, 8, 1, 'Category', 'menu_nav_label', NULL, NULL, NULL, '2020-02-29 13:00:59', NULL, NULL, 1),
(202, 8, 2, 'Add Category', 'menu_label', NULL, NULL, NULL, '2020-02-29 13:00:59', NULL, NULL, 1),
(203, 8, 3, 'Category Name', 'menu_name', NULL, NULL, NULL, '2020-02-29 13:00:59', NULL, NULL, 1),
(204, 8, 4, 'Description', 'menu_desc', NULL, NULL, NULL, '2020-02-29 13:00:59', NULL, NULL, 1),
(205, 8, 5, 'Upload Image', 'menu_image', NULL, NULL, NULL, '2020-02-29 13:00:59', NULL, NULL, 1),
(206, 8, 6, 'Event ', 'item_nav_label', NULL, NULL, NULL, '2020-02-29 13:00:59', NULL, NULL, 1),
(207, 8, 7, 'Add Event ', 'item_label', NULL, NULL, NULL, '2020-02-29 13:00:59', NULL, NULL, 1),
(208, 8, 8, 'Select Category', 'item_menu', NULL, NULL, NULL, '2020-02-29 13:00:59', NULL, NULL, 1),
(209, 8, 9, 'Event  Name', 'item_name', NULL, NULL, NULL, '2020-02-29 13:00:59', NULL, NULL, 1),
(210, 8, 10, 'Price', 'item_price', NULL, NULL, NULL, '2020-02-29 13:00:59', NULL, NULL, 1),
(211, 8, 11, 'Quantity', 'item_quantity', NULL, NULL, NULL, '2020-02-29 13:00:59', NULL, NULL, 1),
(212, 8, 12, '', 'item_veg_non_veg', 0, NULL, NULL, '2020-02-29 13:00:59', NULL, NULL, 1),
(213, 8, 13, 'Status', 'item_status', NULL, NULL, NULL, '2020-02-29 13:00:59', NULL, NULL, 1),
(214, 8, 14, 'Discount', 'item_discount', NULL, NULL, NULL, '2020-02-29 13:00:59', NULL, NULL, 1),
(215, 8, 15, 'Upload Image', 'item_image', NULL, NULL, NULL, '2020-02-29 13:00:59', NULL, NULL, 1),
(216, 8, 16, 'Description', 'item_desc', NULL, NULL, NULL, '2020-02-29 13:00:59', NULL, NULL, 1),
(217, 8, 17, 'Extra Section', 'sec_nav_label', NULL, NULL, NULL, '2020-02-29 13:00:59', NULL, NULL, 1),
(218, 8, 18, 'Add Extra Section', 'sec_label', NULL, NULL, NULL, '2020-02-29 13:00:59', NULL, NULL, 1),
(219, 8, 19, 'Select Menu', 'sec_menu', NULL, NULL, NULL, '2020-02-29 13:00:59', NULL, NULL, 1),
(220, 8, 20, 'Select Item', 'sec_item', NULL, NULL, NULL, '2020-02-29 13:00:59', NULL, NULL, 1),
(221, 8, 21, 'Section Name', 'sec_name', NULL, NULL, NULL, '2020-02-29 13:00:59', NULL, NULL, 1),
(222, 8, 22, 'Section Field (Radio / Checkbox)', 'sec_field', 3, NULL, NULL, '2020-02-29 13:00:59', NULL, NULL, 1),
(223, 8, 23, 'Section Required', 'sec_required', 1, NULL, NULL, '2020-02-29 13:00:59', NULL, NULL, 1),
(224, 8, 24, 'Section Item', 'seci_nav_label', NULL, NULL, NULL, '2020-02-29 13:00:59', NULL, NULL, 1),
(225, 8, 25, 'Add Section Item', 'seci_label', NULL, NULL, NULL, '2020-02-29 13:00:59', NULL, NULL, 1),
(226, 8, 26, 'Menu', 'seci_menu', NULL, NULL, NULL, '2020-02-29 13:00:59', NULL, NULL, 1),
(227, 8, 27, 'Item', 'seci_item', NULL, NULL, NULL, '2020-02-29 13:00:59', NULL, NULL, 1),
(228, 8, 28, 'Section', 'seci_sec', NULL, NULL, NULL, '2020-02-29 13:00:59', NULL, NULL, 1),
(229, 8, 29, 'Section Item Name', 'seci_name', NULL, NULL, NULL, '2020-02-29 13:00:59', NULL, NULL, 1),
(230, 8, 30, 'Price', 'seci_price', NULL, NULL, NULL, '2020-02-29 13:00:59', NULL, NULL, 1),
(231, 8, 31, 'Description', 'seci_desc', NULL, NULL, NULL, '2020-02-29 13:00:59', NULL, NULL, 1),
(232, 8, 32, 'Section Item Status', 'seci_status', NULL, NULL, NULL, '2020-02-29 13:00:59', NULL, NULL, 1),
(233, 8, 33, 'Orders', 'order_nav_label', NULL, NULL, NULL, '2020-02-29 13:00:59', NULL, NULL, 1),
(234, 8, 34, 'Order Label', 'order_label', NULL, NULL, NULL, '2020-02-29 13:00:59', NULL, NULL, 1),
(235, 8, 35, 'Order Rejected', 'order_rejected', NULL, NULL, NULL, '2020-02-29 13:00:59', NULL, NULL, 1),
(236, 8, 36, 'Order Received', 'order_received', NULL, NULL, NULL, '2020-02-29 13:00:59', NULL, NULL, 1),
(237, 8, 37, 'Order Accepted', 'order_accepted', NULL, NULL, NULL, '2020-02-29 13:00:59', NULL, NULL, 1),
(238, 8, 38, '', 'order_preparing', 0, NULL, NULL, '2020-02-29 13:00:59', NULL, NULL, 1),
(239, 8, 39, '', 'order_out_delivery', 0, NULL, NULL, '2020-02-29 13:00:59', NULL, NULL, 1),
(240, 8, 40, '', 'order_on_way', 0, NULL, NULL, '2020-02-29 13:00:59', NULL, NULL, 1),
(241, 8, 41, '', 'order_completed', NULL, NULL, NULL, '2020-02-29 13:00:59', NULL, NULL, 1),
(242, 8, 42, '', 'order_canceled', NULL, NULL, NULL, '2020-02-29 13:00:59', NULL, NULL, 1),
(243, 8, 43, '', 'order_rejected_btn', NULL, NULL, NULL, '2020-02-29 13:00:59', NULL, NULL, 1),
(244, 8, 44, '', 'order_received_btn', NULL, NULL, NULL, '2020-02-29 13:00:59', NULL, NULL, 1),
(245, 8, 45, '', 'order_accepted_btn', NULL, NULL, NULL, '2020-02-29 13:00:59', NULL, NULL, 1),
(246, 8, 46, '', 'order_preparing_btn', NULL, NULL, NULL, '2020-02-29 13:00:59', NULL, NULL, 1),
(247, 8, 47, '', 'order_out_delivery_btn', NULL, NULL, NULL, '2020-02-29 13:00:59', NULL, NULL, 1),
(248, 8, 48, '', 'order_on_way_btn', NULL, NULL, NULL, '2020-02-29 13:00:59', NULL, NULL, 1),
(249, 8, 49, 'Order Completed Button', 'order_completed_btn', NULL, NULL, NULL, '2020-02-29 13:00:59', NULL, NULL, 1),
(250, 8, 50, 'Order Canceled Button', 'order_canceled_btn', NULL, NULL, NULL, '2020-02-29 13:00:59', NULL, NULL, 1),
(251, 9, 1, 'Category', 'menu_nav_label', NULL, NULL, NULL, '2020-02-29 13:01:18', NULL, NULL, 1),
(252, 9, 2, 'Add Category', 'menu_label', NULL, NULL, NULL, '2020-02-29 13:01:18', NULL, NULL, 1),
(253, 9, 3, 'Category Name', 'menu_name', NULL, NULL, NULL, '2020-02-29 13:01:18', NULL, NULL, 1),
(254, 9, 4, 'Description', 'menu_desc', NULL, NULL, NULL, '2020-02-29 13:01:18', NULL, NULL, 1),
(255, 9, 5, 'Upload Image', 'menu_image', NULL, NULL, NULL, '2020-02-29 13:01:18', NULL, NULL, 1),
(256, 9, 6, 'Service', 'item_nav_label', NULL, NULL, NULL, '2020-02-29 13:01:18', NULL, NULL, 1),
(257, 9, 7, 'Add Service', 'item_label', NULL, NULL, NULL, '2020-02-29 13:01:18', NULL, NULL, 1),
(258, 9, 8, 'Select Category', 'item_menu', NULL, NULL, NULL, '2020-02-29 13:01:18', NULL, NULL, 1),
(259, 9, 9, 'Service Name', 'item_name', NULL, NULL, NULL, '2020-02-29 13:01:18', NULL, NULL, 1),
(260, 9, 10, 'Price', 'item_price', NULL, NULL, NULL, '2020-02-29 13:01:18', NULL, NULL, 1),
(261, 9, 11, 'Quantity', 'item_quantity', NULL, NULL, NULL, '2020-02-29 13:01:18', NULL, NULL, 1),
(262, 9, 12, '', 'item_veg_non_veg', 0, NULL, NULL, '2020-02-29 13:01:18', NULL, NULL, 1),
(263, 9, 13, 'Status', 'item_status', NULL, NULL, NULL, '2020-02-29 13:01:18', NULL, NULL, 1),
(264, 9, 14, 'Discount', 'item_discount', NULL, NULL, NULL, '2020-02-29 13:01:18', NULL, NULL, 1),
(265, 9, 15, 'Upload Image', 'item_image', NULL, NULL, NULL, '2020-02-29 13:01:18', NULL, NULL, 1),
(266, 9, 16, 'Description', 'item_desc', NULL, NULL, NULL, '2020-02-29 13:01:18', NULL, NULL, 1),
(267, 9, 17, 'Extra Section', 'sec_nav_label', NULL, NULL, NULL, '2020-02-29 13:01:18', NULL, NULL, 1),
(268, 9, 18, 'Add Extra Section', 'sec_label', NULL, NULL, NULL, '2020-02-29 13:01:18', NULL, NULL, 1),
(269, 9, 19, 'Select Menu', 'sec_menu', NULL, NULL, NULL, '2020-02-29 13:01:18', NULL, NULL, 1),
(270, 9, 20, 'Select Item', 'sec_item', NULL, NULL, NULL, '2020-02-29 13:01:18', NULL, NULL, 1),
(271, 9, 21, 'Section Name', 'sec_name', NULL, NULL, NULL, '2020-02-29 13:01:18', NULL, NULL, 1),
(272, 9, 22, 'Section Field (Radio / Checkbox)', 'sec_field', 3, NULL, NULL, '2020-02-29 13:01:18', NULL, NULL, 1),
(273, 9, 23, 'Section Required', 'sec_required', 1, NULL, NULL, '2020-02-29 13:01:18', NULL, NULL, 1),
(274, 9, 24, 'Section Item', 'seci_nav_label', NULL, NULL, NULL, '2020-02-29 13:01:18', NULL, NULL, 1),
(275, 9, 25, 'Add Section Item', 'seci_label', NULL, NULL, NULL, '2020-02-29 13:01:18', NULL, NULL, 1),
(276, 9, 26, 'Menu', 'seci_menu', NULL, NULL, NULL, '2020-02-29 13:01:18', NULL, NULL, 1),
(277, 9, 27, 'Item', 'seci_item', NULL, NULL, NULL, '2020-02-29 13:01:18', NULL, NULL, 1),
(278, 9, 28, 'Section', 'seci_sec', NULL, NULL, NULL, '2020-02-29 13:01:18', NULL, NULL, 1),
(279, 9, 29, 'Section Item Name', 'seci_name', NULL, NULL, NULL, '2020-02-29 13:01:18', NULL, NULL, 1),
(280, 9, 30, 'Price', 'seci_price', NULL, NULL, NULL, '2020-02-29 13:01:18', NULL, NULL, 1),
(281, 9, 31, 'Description', 'seci_desc', NULL, NULL, NULL, '2020-02-29 13:01:18', NULL, NULL, 1),
(282, 9, 32, 'Section Item Status', 'seci_status', NULL, NULL, NULL, '2020-02-29 13:01:18', NULL, NULL, 1),
(283, 9, 33, 'Orders', 'order_nav_label', NULL, NULL, NULL, '2020-02-29 13:01:18', NULL, NULL, 1),
(284, 9, 34, 'Order Label', 'order_label', NULL, NULL, NULL, '2020-02-29 13:01:18', NULL, NULL, 1),
(285, 9, 35, 'Order Rejected', 'order_rejected', NULL, NULL, NULL, '2020-02-29 13:01:18', NULL, NULL, 1),
(286, 9, 36, '', 'order_received', NULL, NULL, NULL, '2020-02-29 13:01:18', NULL, NULL, 1),
(287, 9, 37, '', 'order_accepted', NULL, NULL, NULL, '2020-02-29 13:01:18', NULL, NULL, 1),
(288, 9, 38, '', 'order_preparing', 0, NULL, NULL, '2020-02-29 13:01:18', NULL, NULL, 1),
(289, 9, 39, '', 'order_out_delivery', 0, NULL, NULL, '2020-02-29 13:01:18', NULL, NULL, 1),
(290, 9, 40, '', 'order_on_way', 0, NULL, NULL, '2020-02-29 13:01:18', NULL, NULL, 1),
(291, 9, 41, '', 'order_completed', NULL, NULL, NULL, '2020-02-29 13:01:18', NULL, NULL, 1),
(292, 9, 42, '', 'order_canceled', NULL, NULL, NULL, '2020-02-29 13:01:18', NULL, NULL, 1),
(293, 9, 43, '', 'order_rejected_btn', NULL, NULL, NULL, '2020-02-29 13:01:18', NULL, NULL, 1),
(294, 9, 44, '', 'order_received_btn', NULL, NULL, NULL, '2020-02-29 13:01:18', NULL, NULL, 1),
(295, 9, 45, '', 'order_accepted_btn', NULL, NULL, NULL, '2020-02-29 13:01:18', NULL, NULL, 1),
(296, 9, 46, '', 'order_preparing_btn', NULL, NULL, NULL, '2020-02-29 13:01:18', NULL, NULL, 1),
(297, 9, 47, '', 'order_out_delivery_btn', NULL, NULL, NULL, '2020-02-29 13:01:18', NULL, NULL, 1),
(298, 9, 48, '', 'order_on_way_btn', NULL, NULL, NULL, '2020-02-29 13:01:18', NULL, NULL, 1),
(299, 9, 49, 'Order Completed Button', 'order_completed_btn', NULL, NULL, NULL, '2020-02-29 13:01:18', NULL, NULL, 1),
(300, 9, 50, 'Order Canceled Button', 'order_canceled_btn', NULL, NULL, NULL, '2020-02-29 13:01:18', NULL, NULL, 1),
(301, 10, 1, 'Bus Category', 'menu_nav_label', NULL, NULL, NULL, '2020-02-29 13:01:38', NULL, NULL, 1),
(302, 10, 2, 'Add Bus Category', 'menu_label', NULL, NULL, NULL, '2020-02-29 13:01:38', NULL, NULL, 1),
(303, 10, 3, 'Bus Category Name', 'menu_name', NULL, NULL, NULL, '2020-02-29 13:01:38', NULL, NULL, 1),
(304, 10, 4, 'Description', 'menu_desc', NULL, NULL, NULL, '2020-02-29 13:01:38', NULL, NULL, 1),
(305, 10, 5, 'Upload Image', 'menu_image', NULL, NULL, NULL, '2020-02-29 13:01:38', NULL, NULL, 1),
(306, 10, 6, 'Bus', 'item_nav_label', NULL, NULL, NULL, '2020-02-29 13:01:38', NULL, NULL, 1),
(307, 10, 7, 'Add Bus', 'item_label', NULL, NULL, NULL, '2020-02-29 13:01:38', NULL, NULL, 1),
(308, 10, 8, 'Select Category', 'item_menu', NULL, NULL, NULL, '2020-02-29 13:01:38', NULL, NULL, 1),
(309, 10, 9, 'Bus Name', 'item_name', NULL, NULL, NULL, '2020-02-29 13:01:38', NULL, NULL, 1),
(310, 10, 10, 'Price', 'item_price', NULL, NULL, NULL, '2020-02-29 13:01:38', NULL, NULL, 1),
(311, 10, 11, 'Quantity', 'item_quantity', NULL, NULL, NULL, '2020-02-29 13:01:38', NULL, NULL, 1),
(312, 10, 12, '', 'item_veg_non_veg', 0, NULL, NULL, '2020-02-29 13:01:38', NULL, NULL, 1),
(313, 10, 13, 'Status', 'item_status', NULL, NULL, NULL, '2020-02-29 13:01:38', NULL, NULL, 1),
(314, 10, 14, 'Discount', 'item_discount', NULL, NULL, NULL, '2020-02-29 13:01:38', NULL, NULL, 1),
(315, 10, 15, 'Upload Image', 'item_image', NULL, NULL, NULL, '2020-02-29 13:01:38', NULL, NULL, 1),
(316, 10, 16, 'Description', 'item_desc', NULL, NULL, NULL, '2020-02-29 13:01:38', NULL, NULL, 1),
(317, 10, 17, 'Extra Section', 'sec_nav_label', NULL, NULL, NULL, '2020-02-29 13:01:38', NULL, NULL, 1),
(318, 10, 18, 'Add Extra Section', 'sec_label', NULL, NULL, NULL, '2020-02-29 13:01:38', NULL, NULL, 1),
(319, 10, 19, 'Select Menu', 'sec_menu', NULL, NULL, NULL, '2020-02-29 13:01:38', NULL, NULL, 1),
(320, 10, 20, 'Select Item', 'sec_item', NULL, NULL, NULL, '2020-02-29 13:01:38', NULL, NULL, 1),
(321, 10, 21, 'Section Name', 'sec_name', NULL, NULL, NULL, '2020-02-29 13:01:38', NULL, NULL, 1),
(322, 10, 22, 'Section Field (Radio / Checkbox)', 'sec_field', 3, NULL, NULL, '2020-02-29 13:01:38', NULL, NULL, 1),
(323, 10, 23, 'Section Required', 'sec_required', 1, NULL, NULL, '2020-02-29 13:01:38', NULL, NULL, 1),
(324, 10, 24, 'Section Item', 'seci_nav_label', NULL, NULL, NULL, '2020-02-29 13:01:38', NULL, NULL, 1),
(325, 10, 25, 'Add Section Item', 'seci_label', NULL, NULL, NULL, '2020-02-29 13:01:38', NULL, NULL, 1),
(326, 10, 26, 'Menu', 'seci_menu', NULL, NULL, NULL, '2020-02-29 13:01:38', NULL, NULL, 1),
(327, 10, 27, 'Item', 'seci_item', NULL, NULL, NULL, '2020-02-29 13:01:38', NULL, NULL, 1),
(328, 10, 28, 'Section', 'seci_sec', NULL, NULL, NULL, '2020-02-29 13:01:38', NULL, NULL, 1),
(329, 10, 29, 'Section Item Name', 'seci_name', NULL, NULL, NULL, '2020-02-29 13:01:38', NULL, NULL, 1),
(330, 10, 30, 'Price', 'seci_price', NULL, NULL, NULL, '2020-02-29 13:01:38', NULL, NULL, 1),
(331, 10, 31, 'Description', 'seci_desc', NULL, NULL, NULL, '2020-02-29 13:01:38', NULL, NULL, 1),
(332, 10, 32, 'Section Item Status', 'seci_status', NULL, NULL, NULL, '2020-02-29 13:01:38', NULL, NULL, 1),
(333, 10, 33, 'Orders', 'order_nav_label', NULL, NULL, NULL, '2020-02-29 13:01:38', NULL, NULL, 1),
(334, 10, 34, 'Order Label', 'order_label', NULL, NULL, NULL, '2020-02-29 13:01:38', NULL, NULL, 1),
(335, 10, 35, 'Order Rejected', 'order_rejected', NULL, NULL, NULL, '2020-02-29 13:01:38', NULL, NULL, 1),
(336, 10, 36, '', 'order_received', NULL, NULL, NULL, '2020-02-29 13:01:38', NULL, NULL, 1),
(337, 10, 37, '', 'order_accepted', NULL, NULL, NULL, '2020-02-29 13:01:38', NULL, NULL, 1),
(338, 10, 38, '', 'order_preparing', 0, NULL, NULL, '2020-02-29 13:01:38', NULL, NULL, 1),
(339, 10, 39, '', 'order_out_delivery', 0, NULL, NULL, '2020-02-29 13:01:38', NULL, NULL, 1),
(340, 10, 40, '', 'order_on_way', 0, NULL, NULL, '2020-02-29 13:01:38', NULL, NULL, 1),
(341, 10, 41, '', 'order_completed', NULL, NULL, NULL, '2020-02-29 13:01:38', NULL, NULL, 1),
(342, 10, 42, '', 'order_canceled', NULL, NULL, NULL, '2020-02-29 13:01:38', NULL, NULL, 1),
(343, 10, 43, '', 'order_rejected_btn', NULL, NULL, NULL, '2020-02-29 13:01:38', NULL, NULL, 1),
(344, 10, 44, '', 'order_received_btn', NULL, NULL, NULL, '2020-02-29 13:01:38', NULL, NULL, 1),
(345, 10, 45, '', 'order_accepted_btn', NULL, NULL, NULL, '2020-02-29 13:01:38', NULL, NULL, 1),
(346, 10, 46, '', 'order_preparing_btn', NULL, NULL, NULL, '2020-02-29 13:01:38', NULL, NULL, 1),
(347, 10, 47, '', 'order_out_delivery_btn', NULL, NULL, NULL, '2020-02-29 13:01:38', NULL, NULL, 1),
(348, 10, 48, '', 'order_on_way_btn', NULL, NULL, NULL, '2020-02-29 13:01:38', NULL, NULL, 1),
(349, 10, 49, 'Order Completed Button', 'order_completed_btn', NULL, NULL, NULL, '2020-02-29 13:01:38', NULL, NULL, 1),
(350, 10, 50, 'Order Canceled Button', 'order_canceled_btn', NULL, NULL, NULL, '2020-02-29 13:01:38', NULL, NULL, 1),
(351, 11, 1, 'Category', 'menu_nav_label', NULL, NULL, NULL, '2020-02-29 13:01:59', NULL, NULL, 1),
(352, 11, 2, 'Add Category', 'menu_label', NULL, NULL, NULL, '2020-02-29 13:01:59', NULL, NULL, 1),
(353, 11, 3, 'Category Name', 'menu_name', NULL, NULL, NULL, '2020-02-29 13:01:59', NULL, NULL, 1),
(354, 11, 4, 'Description', 'menu_desc', NULL, NULL, NULL, '2020-02-29 13:01:59', NULL, NULL, 1),
(355, 11, 5, 'Upload Image', 'menu_image', NULL, NULL, NULL, '2020-02-29 13:01:59', NULL, NULL, 1),
(356, 11, 6, 'Courier Service', 'item_nav_label', NULL, NULL, NULL, '2020-02-29 13:01:59', NULL, NULL, 1),
(357, 11, 7, 'Add Courier Service', 'item_label', NULL, NULL, NULL, '2020-02-29 13:01:59', NULL, NULL, 1),
(358, 11, 8, 'Select Category', 'item_menu', NULL, NULL, NULL, '2020-02-29 13:01:59', NULL, NULL, 1),
(359, 11, 9, 'Courier Service Name', 'item_name', NULL, NULL, NULL, '2020-02-29 13:01:59', NULL, NULL, 1),
(360, 11, 10, 'Price', 'item_price', NULL, NULL, NULL, '2020-02-29 13:01:59', NULL, NULL, 1),
(361, 11, 11, 'Quantity', 'item_quantity', NULL, NULL, NULL, '2020-02-29 13:01:59', NULL, NULL, 1),
(362, 11, 12, '', 'item_veg_non_veg', 0, NULL, NULL, '2020-02-29 13:01:59', NULL, NULL, 1),
(363, 11, 13, 'Status', 'item_status', NULL, NULL, NULL, '2020-02-29 13:01:59', NULL, NULL, 1),
(364, 11, 14, 'Discount', 'item_discount', NULL, NULL, NULL, '2020-02-29 13:01:59', NULL, NULL, 1),
(365, 11, 15, 'Upload Image', 'item_image', NULL, NULL, NULL, '2020-02-29 13:01:59', NULL, NULL, 1),
(366, 11, 16, 'Description', 'item_desc', NULL, NULL, NULL, '2020-02-29 13:01:59', NULL, NULL, 1),
(367, 11, 17, 'Extra Section', 'sec_nav_label', NULL, NULL, NULL, '2020-02-29 13:01:59', NULL, NULL, 1),
(368, 11, 18, 'Add Extra Section', 'sec_label', NULL, NULL, NULL, '2020-02-29 13:01:59', NULL, NULL, 1),
(369, 11, 19, 'Select Menu', 'sec_menu', NULL, NULL, NULL, '2020-02-29 13:01:59', NULL, NULL, 1),
(370, 11, 20, 'Select Item', 'sec_item', NULL, NULL, NULL, '2020-02-29 13:01:59', NULL, NULL, 1),
(371, 11, 21, 'Section Name', 'sec_name', NULL, NULL, NULL, '2020-02-29 13:01:59', NULL, NULL, 1),
(372, 11, 22, 'Section Field (Radio / Checkbox)', 'sec_field', 3, NULL, NULL, '2020-02-29 13:01:59', NULL, NULL, 1),
(373, 11, 23, 'Section Required', 'sec_required', 1, NULL, NULL, '2020-02-29 13:01:59', NULL, NULL, 1),
(374, 11, 24, 'Section Item', 'seci_nav_label', NULL, NULL, NULL, '2020-02-29 13:01:59', NULL, NULL, 1),
(375, 11, 25, 'Add Section Item', 'seci_label', NULL, NULL, NULL, '2020-02-29 13:01:59', NULL, NULL, 1),
(376, 11, 26, 'Menu', 'seci_menu', NULL, NULL, NULL, '2020-02-29 13:01:59', NULL, NULL, 1),
(377, 11, 27, 'Item', 'seci_item', NULL, NULL, NULL, '2020-02-29 13:01:59', NULL, NULL, 1),
(378, 11, 28, 'Section', 'seci_sec', NULL, NULL, NULL, '2020-02-29 13:01:59', NULL, NULL, 1),
(379, 11, 29, 'Section Item Name', 'seci_name', NULL, NULL, NULL, '2020-02-29 13:01:59', NULL, NULL, 1),
(380, 11, 30, 'Price', 'seci_price', NULL, NULL, NULL, '2020-02-29 13:01:59', NULL, NULL, 1),
(381, 11, 31, 'Description', 'seci_desc', NULL, NULL, NULL, '2020-02-29 13:01:59', NULL, NULL, 1),
(382, 11, 32, 'Section Item Status', 'seci_status', NULL, NULL, NULL, '2020-02-29 13:01:59', NULL, NULL, 1),
(383, 11, 33, 'Orders', 'order_nav_label', NULL, NULL, NULL, '2020-02-29 13:01:59', NULL, NULL, 1),
(384, 11, 34, 'Order Label', 'order_label', NULL, NULL, NULL, '2020-02-29 13:01:59', NULL, NULL, 1),
(385, 11, 35, 'Order Rejected', 'order_rejected', NULL, NULL, NULL, '2020-02-29 13:01:59', NULL, NULL, 1),
(386, 11, 36, 'Order Received', 'order_received', NULL, NULL, NULL, '2020-02-29 13:01:59', NULL, NULL, 1),
(387, 11, 37, 'Order Accepted', 'order_accepted', NULL, NULL, NULL, '2020-02-29 13:01:59', NULL, NULL, 1),
(388, 11, 38, 'Preparing', 'order_preparing', 1, NULL, NULL, '2020-02-29 13:01:59', NULL, NULL, 1),
(389, 11, 39, 'Out For Delivery', 'order_out_delivery', 1, NULL, NULL, '2020-02-29 13:01:59', NULL, NULL, 1),
(390, 11, 40, 'On The Way', 'order_on_way', 1, NULL, NULL, '2020-02-29 13:01:59', NULL, NULL, 1),
(391, 11, 41, 'Completed', 'order_completed', NULL, NULL, NULL, '2020-02-29 13:01:59', NULL, NULL, 1),
(392, 11, 42, 'Canceled', 'order_canceled', NULL, NULL, NULL, '2020-02-29 13:01:59', NULL, NULL, 1),
(393, 11, 43, 'Order Rejected Button', 'order_rejected_btn', NULL, NULL, NULL, '2020-02-29 13:01:59', NULL, NULL, 1),
(394, 11, 44, 'Order Received Button', 'order_received_btn', NULL, NULL, NULL, '2020-02-29 13:01:59', NULL, NULL, 1),
(395, 11, 45, 'Order Accepted Button', 'order_accepted_btn', NULL, NULL, NULL, '2020-02-29 13:01:59', NULL, NULL, 1),
(396, 11, 46, 'Order Packing', 'order_preparing_btn', NULL, NULL, NULL, '2020-02-29 13:01:59', NULL, NULL, 1),
(397, 11, 47, 'Out For Delivery ', 'order_out_delivery_btn', NULL, NULL, NULL, '2020-02-29 13:01:59', NULL, NULL, 1),
(398, 11, 48, 'Order On The Way', 'order_on_way_btn', NULL, NULL, NULL, '2020-02-29 13:01:59', NULL, NULL, 1),
(399, 11, 49, 'Completed ', 'order_completed_btn', NULL, NULL, NULL, '2020-02-29 13:01:59', NULL, NULL, 1),
(400, 11, 50, 'Canceled ', 'order_canceled_btn', NULL, NULL, NULL, '2020-02-29 13:01:59', NULL, NULL, 1),
(401, 12, 1, 'Category', 'menu_nav_label', NULL, NULL, NULL, '2020-02-29 13:02:20', NULL, NULL, 1),
(402, 12, 2, 'Add Category', 'menu_label', NULL, NULL, NULL, '2020-02-29 13:02:20', NULL, NULL, 1),
(403, 12, 3, 'Category Name', 'menu_name', NULL, NULL, NULL, '2020-02-29 13:02:20', NULL, NULL, 1),
(404, 12, 4, 'Description', 'menu_desc', NULL, NULL, NULL, '2020-02-29 13:02:20', NULL, NULL, 1),
(405, 12, 5, 'Upload Image', 'menu_image', NULL, NULL, NULL, '2020-02-29 13:02:20', NULL, NULL, 1),
(406, 12, 6, 'Candidate', 'item_nav_label', NULL, NULL, NULL, '2020-02-29 13:02:20', NULL, NULL, 1),
(407, 12, 7, 'Add Candidate', 'item_label', NULL, NULL, NULL, '2020-02-29 13:02:20', NULL, NULL, 1),
(408, 12, 8, 'Select Category', 'item_menu', NULL, NULL, NULL, '2020-02-29 13:02:20', NULL, NULL, 1),
(409, 12, 9, 'Candidate Name', 'item_name', NULL, NULL, NULL, '2020-02-29 13:02:20', NULL, NULL, 1),
(410, 12, 10, 'Price', 'item_price', NULL, NULL, NULL, '2020-02-29 13:02:20', NULL, NULL, 1),
(411, 12, 11, 'Number of Candidates', 'item_quantity', NULL, NULL, NULL, '2020-02-29 13:02:20', NULL, NULL, 1),
(412, 12, 12, '', 'item_veg_non_veg', 0, NULL, NULL, '2020-02-29 13:02:20', NULL, NULL, 1),
(413, 12, 13, 'Status', 'item_status', NULL, NULL, NULL, '2020-02-29 13:02:20', NULL, NULL, 1),
(414, 12, 14, 'Discount', 'item_discount', NULL, NULL, NULL, '2020-02-29 13:02:20', NULL, NULL, 1),
(415, 12, 15, 'Upload Image', 'item_image', NULL, NULL, NULL, '2020-02-29 13:02:20', NULL, NULL, 1),
(416, 12, 16, 'Description', 'item_desc', NULL, NULL, NULL, '2020-02-29 13:02:20', NULL, NULL, 1),
(417, 12, 17, 'Extra Section', 'sec_nav_label', NULL, NULL, NULL, '2020-02-29 13:02:20', NULL, NULL, 1),
(418, 12, 18, 'Add Extra Section', 'sec_label', NULL, NULL, NULL, '2020-02-29 13:02:20', NULL, NULL, 1),
(419, 12, 19, 'Select Menu', 'sec_menu', NULL, NULL, NULL, '2020-02-29 13:02:20', NULL, NULL, 1),
(420, 12, 20, 'Select Item', 'sec_item', NULL, NULL, NULL, '2020-02-29 13:02:20', NULL, NULL, 1),
(421, 12, 21, 'Section Name', 'sec_name', NULL, NULL, NULL, '2020-02-29 13:02:20', NULL, NULL, 1),
(422, 12, 22, 'Section Field (Radio / Checkbox)', 'sec_field', 3, NULL, NULL, '2020-02-29 13:02:20', NULL, NULL, 1),
(423, 12, 23, 'Section Required', 'sec_required', 1, NULL, NULL, '2020-02-29 13:02:20', NULL, NULL, 1),
(424, 12, 24, 'Section Item', 'seci_nav_label', NULL, NULL, NULL, '2020-02-29 13:02:20', NULL, NULL, 1),
(425, 12, 25, 'Add Section Item', 'seci_label', NULL, NULL, NULL, '2020-02-29 13:02:20', NULL, NULL, 1),
(426, 12, 26, 'Menu', 'seci_menu', NULL, NULL, NULL, '2020-02-29 13:02:20', NULL, NULL, 1),
(427, 12, 27, 'Item', 'seci_item', NULL, NULL, NULL, '2020-02-29 13:02:20', NULL, NULL, 1),
(428, 12, 28, 'Section', 'seci_sec', NULL, NULL, NULL, '2020-02-29 13:02:20', NULL, NULL, 1),
(429, 12, 29, 'Section Item Name', 'seci_name', NULL, NULL, NULL, '2020-02-29 13:02:20', NULL, NULL, 1),
(430, 12, 30, 'Price', 'seci_price', NULL, NULL, NULL, '2020-02-29 13:02:20', NULL, NULL, 1),
(431, 12, 31, 'Description', 'seci_desc', NULL, NULL, NULL, '2020-02-29 13:02:20', NULL, NULL, 1),
(432, 12, 32, 'Section Item Status', 'seci_status', NULL, NULL, NULL, '2020-02-29 13:02:20', NULL, NULL, 1),
(433, 12, 33, 'Orders', 'order_nav_label', NULL, NULL, NULL, '2020-02-29 13:02:20', NULL, NULL, 1),
(434, 12, 34, '', 'order_label', NULL, NULL, NULL, '2020-02-29 13:02:20', NULL, NULL, 1),
(435, 12, 35, '', 'order_rejected', NULL, NULL, NULL, '2020-02-29 13:02:20', NULL, NULL, 1),
(436, 12, 36, '', 'order_received', NULL, NULL, NULL, '2020-02-29 13:02:20', NULL, NULL, 1),
(437, 12, 37, '', 'order_accepted', NULL, NULL, NULL, '2020-02-29 13:02:20', NULL, NULL, 1),
(438, 12, 38, '', 'order_preparing', 0, NULL, NULL, '2020-02-29 13:02:20', NULL, NULL, 1),
(439, 12, 39, '', 'order_out_delivery', 0, NULL, NULL, '2020-02-29 13:02:20', NULL, NULL, 1),
(440, 12, 40, '', 'order_on_way', 0, NULL, NULL, '2020-02-29 13:02:20', NULL, NULL, 1),
(441, 12, 41, '', 'order_completed', NULL, NULL, NULL, '2020-02-29 13:02:20', NULL, NULL, 1),
(442, 12, 42, '', 'order_canceled', NULL, NULL, NULL, '2020-02-29 13:02:20', NULL, NULL, 1),
(443, 12, 43, '', 'order_rejected_btn', NULL, NULL, NULL, '2020-02-29 13:02:20', NULL, NULL, 1),
(444, 12, 44, '', 'order_received_btn', NULL, NULL, NULL, '2020-02-29 13:02:20', NULL, NULL, 1),
(445, 12, 45, '', 'order_accepted_btn', NULL, NULL, NULL, '2020-02-29 13:02:20', NULL, NULL, 1),
(446, 12, 46, '', 'order_preparing_btn', NULL, NULL, NULL, '2020-02-29 13:02:20', NULL, NULL, 1),
(447, 12, 47, '', 'order_out_delivery_btn', NULL, NULL, NULL, '2020-02-29 13:02:20', NULL, NULL, 1),
(448, 12, 48, '', 'order_on_way_btn', NULL, NULL, NULL, '2020-02-29 13:02:20', NULL, NULL, 1),
(449, 12, 49, 'Order Completed Button', 'order_completed_btn', NULL, NULL, NULL, '2020-02-29 13:02:20', NULL, NULL, 1),
(450, 12, 50, 'Order Canceled Button', 'order_canceled_btn', NULL, NULL, NULL, '2020-02-29 13:02:20', NULL, NULL, 1),
(451, 13, 1, 'Category', 'menu_nav_label', NULL, NULL, NULL, '2020-02-29 13:02:40', NULL, NULL, 1),
(452, 13, 2, 'Add Category', 'menu_label', NULL, NULL, NULL, '2020-02-29 13:02:40', NULL, NULL, 1),
(453, 13, 3, 'Category Name', 'menu_name', NULL, NULL, NULL, '2020-02-29 13:02:40', NULL, NULL, 1),
(454, 13, 4, 'Description', 'menu_desc', NULL, NULL, NULL, '2020-02-29 13:02:40', NULL, NULL, 1),
(455, 13, 5, 'Upload Image', 'menu_image', NULL, NULL, NULL, '2020-02-29 13:02:40', NULL, NULL, 1),
(456, 13, 6, 'Event', 'item_nav_label', NULL, NULL, NULL, '2020-02-29 13:02:40', NULL, NULL, 1),
(457, 13, 7, 'Add Event', 'item_label', NULL, NULL, NULL, '2020-02-29 13:02:40', NULL, NULL, 1),
(458, 13, 8, 'Select Category', 'item_menu', NULL, NULL, NULL, '2020-02-29 13:02:40', NULL, NULL, 1),
(459, 13, 9, 'Event Name', 'item_name', NULL, NULL, NULL, '2020-02-29 13:02:40', NULL, NULL, 1),
(460, 13, 10, 'Price', 'item_price', NULL, NULL, NULL, '2020-02-29 13:02:40', NULL, NULL, 1),
(461, 13, 11, 'Quantity', 'item_quantity', NULL, NULL, NULL, '2020-02-29 13:02:40', NULL, NULL, 1),
(462, 13, 12, '', 'item_veg_non_veg', 0, NULL, NULL, '2020-02-29 13:02:40', NULL, NULL, 1),
(463, 13, 13, 'Status', 'item_status', NULL, NULL, NULL, '2020-02-29 13:02:40', NULL, NULL, 1),
(464, 13, 14, 'Discount', 'item_discount', NULL, NULL, NULL, '2020-02-29 13:02:40', NULL, NULL, 1),
(465, 13, 15, 'Upload Image', 'item_image', NULL, NULL, NULL, '2020-02-29 13:02:40', NULL, NULL, 1),
(466, 13, 16, 'Description', 'item_desc', NULL, NULL, NULL, '2020-02-29 13:02:40', NULL, NULL, 1),
(467, 13, 17, 'Extra Section', 'sec_nav_label', NULL, NULL, NULL, '2020-02-29 13:02:40', NULL, NULL, 1),
(468, 13, 18, 'Add Extra Section', 'sec_label', NULL, NULL, NULL, '2020-02-29 13:02:40', NULL, NULL, 1),
(469, 13, 19, 'Select Menu', 'sec_menu', NULL, NULL, NULL, '2020-02-29 13:02:40', NULL, NULL, 1),
(470, 13, 20, 'Select Item', 'sec_item', NULL, NULL, NULL, '2020-02-29 13:02:40', NULL, NULL, 1),
(471, 13, 21, 'Section Name', 'sec_name', NULL, NULL, NULL, '2020-02-29 13:02:40', NULL, NULL, 1),
(472, 13, 22, 'Section Field (Radio / Checkbox)', 'sec_field', 3, NULL, NULL, '2020-02-29 13:02:40', NULL, NULL, 1),
(473, 13, 23, 'Section Required', 'sec_required', 1, NULL, NULL, '2020-02-29 13:02:40', NULL, NULL, 1),
(474, 13, 24, 'Section Item', 'seci_nav_label', NULL, NULL, NULL, '2020-02-29 13:02:40', NULL, NULL, 1),
(475, 13, 25, 'Add Section Item', 'seci_label', NULL, NULL, NULL, '2020-02-29 13:02:40', NULL, NULL, 1),
(476, 13, 26, 'Menu', 'seci_menu', NULL, NULL, NULL, '2020-02-29 13:02:40', NULL, NULL, 1),
(477, 13, 27, 'Item', 'seci_item', NULL, NULL, NULL, '2020-02-29 13:02:40', NULL, NULL, 1),
(478, 13, 28, 'Section', 'seci_sec', NULL, NULL, NULL, '2020-02-29 13:02:40', NULL, NULL, 1),
(479, 13, 29, 'Section Item Name', 'seci_name', NULL, NULL, NULL, '2020-02-29 13:02:40', NULL, NULL, 1),
(480, 13, 30, 'Price', 'seci_price', NULL, NULL, NULL, '2020-02-29 13:02:40', NULL, NULL, 1),
(481, 13, 31, 'Description', 'seci_desc', NULL, NULL, NULL, '2020-02-29 13:02:40', NULL, NULL, 1),
(482, 13, 32, 'Section Item Status', 'seci_status', NULL, NULL, NULL, '2020-02-29 13:02:40', NULL, NULL, 1),
(483, 13, 33, 'Orders', 'order_nav_label', NULL, NULL, NULL, '2020-02-29 13:02:40', NULL, NULL, 1),
(484, 13, 34, 'Order Label', 'order_label', NULL, NULL, NULL, '2020-02-29 13:02:40', NULL, NULL, 1),
(485, 13, 35, 'Order Rejected', 'order_rejected', NULL, NULL, NULL, '2020-02-29 13:02:40', NULL, NULL, 1),
(486, 13, 36, 'Order Received', 'order_received', NULL, NULL, NULL, '2020-02-29 13:02:40', NULL, NULL, 1),
(487, 13, 37, 'Order Accepted', 'order_accepted', NULL, NULL, NULL, '2020-02-29 13:02:40', NULL, NULL, 1),
(488, 13, 38, '', 'order_preparing', 0, NULL, NULL, '2020-02-29 13:02:40', NULL, NULL, 1),
(489, 13, 39, '', 'order_out_delivery', 0, NULL, NULL, '2020-02-29 13:02:40', NULL, NULL, 1),
(490, 13, 40, '', 'order_on_way', 0, NULL, NULL, '2020-02-29 13:02:40', NULL, NULL, 1),
(491, 13, 41, '', 'order_completed', NULL, NULL, NULL, '2020-02-29 13:02:40', NULL, NULL, 1),
(492, 13, 42, '', 'order_canceled', NULL, NULL, NULL, '2020-02-29 13:02:40', NULL, NULL, 1),
(493, 13, 43, '', 'order_rejected_btn', NULL, NULL, NULL, '2020-02-29 13:02:40', NULL, NULL, 1),
(494, 13, 44, '', 'order_received_btn', NULL, NULL, NULL, '2020-02-29 13:02:40', NULL, NULL, 1),
(495, 13, 45, '', 'order_accepted_btn', NULL, NULL, NULL, '2020-02-29 13:02:40', NULL, NULL, 1),
(496, 13, 46, '', 'order_preparing_btn', NULL, NULL, NULL, '2020-02-29 13:02:40', NULL, NULL, 1),
(497, 13, 47, '', 'order_out_delivery_btn', NULL, NULL, NULL, '2020-02-29 13:02:40', NULL, NULL, 1),
(498, 13, 48, '', 'order_on_way_btn', NULL, NULL, NULL, '2020-02-29 13:02:40', NULL, NULL, 1),
(499, 13, 49, 'Order Completed Button', 'order_completed_btn', NULL, NULL, NULL, '2020-02-29 13:02:40', NULL, NULL, 1),
(500, 13, 50, 'Order Canceled Button', 'order_canceled_btn', NULL, NULL, NULL, '2020-02-29 13:02:40', NULL, NULL, 1),
(501, 14, 1, 'Category', 'menu_nav_label', NULL, NULL, NULL, '2020-02-29 13:03:02', NULL, NULL, 1),
(502, 14, 2, 'Add Category', 'menu_label', NULL, NULL, NULL, '2020-02-29 13:03:02', NULL, NULL, 1),
(503, 14, 3, 'Category Name', 'menu_name', NULL, NULL, NULL, '2020-02-29 13:03:02', NULL, NULL, 1),
(504, 14, 4, 'Description', 'menu_desc', NULL, NULL, NULL, '2020-02-29 13:03:02', NULL, NULL, 1),
(505, 14, 5, 'Upload Image', 'menu_image', NULL, NULL, NULL, '2020-02-29 13:03:02', NULL, NULL, 1),
(506, 14, 6, 'Product', 'item_nav_label', NULL, NULL, NULL, '2020-02-29 13:03:02', NULL, NULL, 1),
(507, 14, 7, 'Add Product', 'item_label', NULL, NULL, NULL, '2020-02-29 13:03:02', NULL, NULL, 1),
(508, 14, 8, 'Select Category', 'item_menu', NULL, NULL, NULL, '2020-02-29 13:03:02', NULL, NULL, 1),
(509, 14, 9, 'Product Name', 'item_name', NULL, NULL, NULL, '2020-02-29 13:03:02', NULL, NULL, 1);
INSERT INTO `manage_account_names` (`id`, `category_id`, `acc_id`, `name`, `desc`, `field_status`, `created_user_id`, `updated_user_id`, `created_at`, `updated_at`, `deleted_at`, `status`) VALUES
(510, 14, 10, 'Price', 'item_price', NULL, NULL, NULL, '2020-02-29 13:03:02', NULL, NULL, 1),
(511, 14, 11, 'Quantity', 'item_quantity', NULL, NULL, NULL, '2020-02-29 13:03:02', NULL, NULL, 1),
(512, 14, 12, '', 'item_veg_non_veg', 0, NULL, NULL, '2020-02-29 13:03:02', NULL, NULL, 1),
(513, 14, 13, 'Status', 'item_status', NULL, NULL, NULL, '2020-02-29 13:03:02', NULL, NULL, 1),
(514, 14, 14, 'Discount', 'item_discount', NULL, NULL, NULL, '2020-02-29 13:03:02', NULL, NULL, 1),
(515, 14, 15, 'Upload Image', 'item_image', NULL, NULL, NULL, '2020-02-29 13:03:02', NULL, NULL, 1),
(516, 14, 16, 'Description', 'item_desc', NULL, NULL, NULL, '2020-02-29 13:03:02', NULL, NULL, 1),
(517, 14, 17, 'Extra Section', 'sec_nav_label', NULL, NULL, NULL, '2020-02-29 13:03:02', NULL, NULL, 1),
(518, 14, 18, 'Add Extra Section', 'sec_label', NULL, NULL, NULL, '2020-02-29 13:03:02', NULL, NULL, 1),
(519, 14, 19, 'Select Menu', 'sec_menu', NULL, NULL, NULL, '2020-02-29 13:03:02', NULL, NULL, 1),
(520, 14, 20, 'Select Item', 'sec_item', NULL, NULL, NULL, '2020-02-29 13:03:02', NULL, NULL, 1),
(521, 14, 21, 'Section Name', 'sec_name', NULL, NULL, NULL, '2020-02-29 13:03:02', NULL, NULL, 1),
(522, 14, 22, 'Section Field (Radio / Checkbox)', 'sec_field', 3, NULL, NULL, '2020-02-29 13:03:02', NULL, NULL, 1),
(523, 14, 23, 'Section Required', 'sec_required', 1, NULL, NULL, '2020-02-29 13:03:02', NULL, NULL, 1),
(524, 14, 24, 'Section Item', 'seci_nav_label', NULL, NULL, NULL, '2020-02-29 13:03:02', NULL, NULL, 1),
(525, 14, 25, 'Add Section Item', 'seci_label', NULL, NULL, NULL, '2020-02-29 13:03:02', NULL, NULL, 1),
(526, 14, 26, 'Menu', 'seci_menu', NULL, NULL, NULL, '2020-02-29 13:03:02', NULL, NULL, 1),
(527, 14, 27, 'Item', 'seci_item', NULL, NULL, NULL, '2020-02-29 13:03:02', NULL, NULL, 1),
(528, 14, 28, 'Section', 'seci_sec', NULL, NULL, NULL, '2020-02-29 13:03:02', NULL, NULL, 1),
(529, 14, 29, 'Section Item Name', 'seci_name', NULL, NULL, NULL, '2020-02-29 13:03:02', NULL, NULL, 1),
(530, 14, 30, 'Price', 'seci_price', NULL, NULL, NULL, '2020-02-29 13:03:02', NULL, NULL, 1),
(531, 14, 31, 'Description', 'seci_desc', NULL, NULL, NULL, '2020-02-29 13:03:02', NULL, NULL, 1),
(532, 14, 32, 'Section Item Status', 'seci_status', NULL, NULL, NULL, '2020-02-29 13:03:02', NULL, NULL, 1),
(533, 14, 33, 'Orders', 'order_nav_label', NULL, NULL, NULL, '2020-02-29 13:03:02', NULL, NULL, 1),
(534, 14, 34, 'Order Label', 'order_label', NULL, NULL, NULL, '2020-02-29 13:03:02', NULL, NULL, 1),
(535, 14, 35, 'Order Rejected', 'order_rejected', NULL, NULL, NULL, '2020-02-29 13:03:02', NULL, NULL, 1),
(536, 14, 36, 'Order Received', 'order_received', NULL, NULL, NULL, '2020-02-29 13:03:02', NULL, NULL, 1),
(537, 14, 37, 'Order Accepted', 'order_accepted', NULL, NULL, NULL, '2020-02-29 13:03:02', NULL, NULL, 1),
(538, 14, 38, '', 'order_preparing', 0, NULL, NULL, '2020-02-29 13:03:02', NULL, NULL, 1),
(539, 14, 39, 'Out For Delivery', 'order_out_delivery', 1, NULL, NULL, '2020-02-29 13:03:02', NULL, NULL, 1),
(540, 14, 40, 'On The Way', 'order_on_way', 1, NULL, NULL, '2020-02-29 13:03:02', NULL, NULL, 1),
(541, 14, 41, 'Completed', 'order_completed', NULL, NULL, NULL, '2020-02-29 13:03:02', NULL, NULL, 1),
(542, 14, 42, 'Canceled', 'order_canceled', NULL, NULL, NULL, '2020-02-29 13:03:02', NULL, NULL, 1),
(543, 14, 43, 'Rejected', 'order_rejected_btn', NULL, NULL, NULL, '2020-02-29 13:03:02', NULL, NULL, 1),
(544, 14, 44, 'Received', 'order_received_btn', NULL, NULL, NULL, '2020-02-29 13:03:02', NULL, NULL, 1),
(545, 14, 45, 'Accepted', 'order_accepted_btn', NULL, NULL, NULL, '2020-02-29 13:03:02', NULL, NULL, 1),
(546, 14, 46, '', 'order_preparing_btn', NULL, NULL, NULL, '2020-02-29 13:03:02', NULL, NULL, 1),
(547, 14, 47, 'Out For Delivery', 'order_out_delivery_btn', NULL, NULL, NULL, '2020-02-29 13:03:02', NULL, NULL, 1),
(548, 14, 48, 'On the Way', 'order_on_way_btn', NULL, NULL, NULL, '2020-02-29 13:03:02', NULL, NULL, 1),
(549, 14, 49, 'Order Completed Button', 'order_completed_btn', NULL, NULL, NULL, '2020-02-29 13:03:02', NULL, NULL, 1),
(550, 14, 50, 'Order Canceled Button', 'order_canceled_btn', NULL, NULL, NULL, '2020-02-29 13:03:02', NULL, NULL, 1),
(551, 15, 1, 'Category', 'menu_nav_label', NULL, NULL, NULL, '2020-02-29 13:03:24', NULL, NULL, 1),
(552, 15, 2, 'Add Category', 'menu_label', NULL, NULL, NULL, '2020-02-29 13:03:24', NULL, NULL, 1),
(553, 15, 3, 'Category Name', 'menu_name', NULL, NULL, NULL, '2020-02-29 13:03:24', NULL, NULL, 1),
(554, 15, 4, 'Description', 'menu_desc', NULL, NULL, NULL, '2020-02-29 13:03:24', NULL, NULL, 1),
(555, 15, 5, 'Upload Image', 'menu_image', NULL, NULL, NULL, '2020-02-29 13:03:24', NULL, NULL, 1),
(556, 15, 6, 'Service', 'item_nav_label', NULL, NULL, NULL, '2020-02-29 13:03:24', NULL, NULL, 1),
(557, 15, 7, 'Add Service', 'item_label', NULL, NULL, NULL, '2020-02-29 13:03:24', NULL, NULL, 1),
(558, 15, 8, 'Select Category', 'item_menu', NULL, NULL, NULL, '2020-02-29 13:03:24', NULL, NULL, 1),
(559, 15, 9, 'Service Name', 'item_name', NULL, NULL, NULL, '2020-02-29 13:03:24', NULL, NULL, 1),
(560, 15, 10, 'Price', 'item_price', NULL, NULL, NULL, '2020-02-29 13:03:24', NULL, NULL, 1),
(561, 15, 11, 'Quantity', 'item_quantity', NULL, NULL, NULL, '2020-02-29 13:03:24', NULL, NULL, 1),
(562, 15, 12, '', 'item_veg_non_veg', 0, NULL, NULL, '2020-02-29 13:03:24', NULL, NULL, 1),
(563, 15, 13, 'Status', 'item_status', NULL, NULL, NULL, '2020-02-29 13:03:24', NULL, NULL, 1),
(564, 15, 14, 'Discount', 'item_discount', NULL, NULL, NULL, '2020-02-29 13:03:24', NULL, NULL, 1),
(565, 15, 15, 'Upload Image', 'item_image', NULL, NULL, NULL, '2020-02-29 13:03:24', NULL, NULL, 1),
(566, 15, 16, 'Description', 'item_desc', NULL, NULL, NULL, '2020-02-29 13:03:24', NULL, NULL, 1),
(567, 15, 17, 'Extra Section', 'sec_nav_label', NULL, NULL, NULL, '2020-02-29 13:03:24', NULL, NULL, 1),
(568, 15, 18, 'Add Extra Section', 'sec_label', NULL, NULL, NULL, '2020-02-29 13:03:24', NULL, NULL, 1),
(569, 15, 19, 'Select Menu', 'sec_menu', NULL, NULL, NULL, '2020-02-29 13:03:24', NULL, NULL, 1),
(570, 15, 20, 'Select Item', 'sec_item', NULL, NULL, NULL, '2020-02-29 13:03:24', NULL, NULL, 1),
(571, 15, 21, 'Section Name', 'sec_name', NULL, NULL, NULL, '2020-02-29 13:03:24', NULL, NULL, 1),
(572, 15, 22, 'Section Field (Radio / Checkbox)', 'sec_field', 3, NULL, NULL, '2020-02-29 13:03:24', NULL, NULL, 1),
(573, 15, 23, 'Section Required', 'sec_required', 1, NULL, NULL, '2020-02-29 13:03:24', NULL, NULL, 1),
(574, 15, 24, 'Section Item', 'seci_nav_label', NULL, NULL, NULL, '2020-02-29 13:03:24', NULL, NULL, 1),
(575, 15, 25, 'Add Section Item', 'seci_label', NULL, NULL, NULL, '2020-02-29 13:03:24', NULL, NULL, 1),
(576, 15, 26, 'Menu', 'seci_menu', NULL, NULL, NULL, '2020-02-29 13:03:24', NULL, NULL, 1),
(577, 15, 27, 'Item', 'seci_item', NULL, NULL, NULL, '2020-02-29 13:03:24', NULL, NULL, 1),
(578, 15, 28, 'Section', 'seci_sec', NULL, NULL, NULL, '2020-02-29 13:03:24', NULL, NULL, 1),
(579, 15, 29, 'Section Item Name', 'seci_name', NULL, NULL, NULL, '2020-02-29 13:03:24', NULL, NULL, 1),
(580, 15, 30, 'Price', 'seci_price', NULL, NULL, NULL, '2020-02-29 13:03:24', NULL, NULL, 1),
(581, 15, 31, 'Description', 'seci_desc', NULL, NULL, NULL, '2020-02-29 13:03:24', NULL, NULL, 1),
(582, 15, 32, 'Section Item Status', 'seci_status', NULL, NULL, NULL, '2020-02-29 13:03:24', NULL, NULL, 1),
(583, 15, 33, 'Orders', 'order_nav_label', NULL, NULL, NULL, '2020-02-29 13:03:24', NULL, NULL, 1),
(584, 15, 34, 'Order Label', 'order_label', NULL, NULL, NULL, '2020-02-29 13:03:24', NULL, NULL, 1),
(585, 15, 35, 'Order Rejected', 'order_rejected', NULL, NULL, NULL, '2020-02-29 13:03:24', NULL, NULL, 1),
(586, 15, 36, 'Order Received', 'order_received', NULL, NULL, NULL, '2020-02-29 13:03:24', NULL, NULL, 1),
(587, 15, 37, 'Order Accepted', 'order_accepted', NULL, NULL, NULL, '2020-02-29 13:03:24', NULL, NULL, 1),
(588, 15, 38, '', 'order_preparing', 0, NULL, NULL, '2020-02-29 13:03:24', NULL, NULL, 1),
(589, 15, 39, 'Out For Delivery', 'order_out_delivery', 1, NULL, NULL, '2020-02-29 13:03:24', NULL, NULL, 1),
(590, 15, 40, 'On The Way', 'order_on_way', 1, NULL, NULL, '2020-02-29 13:03:24', NULL, NULL, 1),
(591, 15, 41, 'Completed', 'order_completed', NULL, NULL, NULL, '2020-02-29 13:03:24', NULL, NULL, 1),
(592, 15, 42, 'Canceled', 'order_canceled', NULL, NULL, NULL, '2020-02-29 13:03:24', NULL, NULL, 1),
(593, 15, 43, 'Rejected', 'order_rejected_btn', NULL, NULL, NULL, '2020-02-29 13:03:24', NULL, NULL, 1),
(594, 15, 44, 'Received', 'order_received_btn', NULL, NULL, NULL, '2020-02-29 13:03:24', NULL, NULL, 1),
(595, 15, 45, 'Accepted', 'order_accepted_btn', NULL, NULL, NULL, '2020-02-29 13:03:24', NULL, NULL, 1),
(596, 15, 46, '', 'order_preparing_btn', NULL, NULL, NULL, '2020-02-29 13:03:24', NULL, NULL, 1),
(597, 15, 47, 'Out For Delivery', 'order_out_delivery_btn', NULL, NULL, NULL, '2020-02-29 13:03:24', NULL, NULL, 1),
(598, 15, 48, 'On the Way', 'order_on_way_btn', NULL, NULL, NULL, '2020-02-29 13:03:24', NULL, NULL, 1),
(599, 15, 49, 'Order Completed Button', 'order_completed_btn', NULL, NULL, NULL, '2020-02-29 13:03:24', NULL, NULL, 1),
(600, 15, 50, 'Order Canceled Button', 'order_canceled_btn', NULL, NULL, NULL, '2020-02-29 13:03:24', NULL, NULL, 1),
(601, 16, 1, 'Specialization', 'menu_nav_label', NULL, NULL, NULL, '2020-02-29 13:03:50', NULL, NULL, 1),
(602, 16, 2, 'Add Specialization', 'menu_label', NULL, NULL, NULL, '2020-02-29 13:03:50', NULL, NULL, 1),
(603, 16, 3, 'Specialization Name', 'menu_name', NULL, NULL, NULL, '2020-02-29 13:03:50', NULL, NULL, 1),
(604, 16, 4, 'Description', 'menu_desc', NULL, NULL, NULL, '2020-02-29 13:03:50', NULL, NULL, 1),
(605, 16, 5, 'Upload Image', 'menu_image', NULL, NULL, NULL, '2020-02-29 13:03:50', NULL, NULL, 1),
(606, 16, 6, 'Test', 'item_nav_label', NULL, NULL, NULL, '2020-02-29 13:03:50', NULL, NULL, 1),
(607, 16, 7, 'Add Test', 'item_label', NULL, NULL, NULL, '2020-02-29 13:03:50', NULL, NULL, 1),
(608, 16, 8, 'Select Category', 'item_menu', NULL, NULL, NULL, '2020-02-29 13:03:50', NULL, NULL, 1),
(609, 16, 9, 'Test Name', 'item_name', NULL, NULL, NULL, '2020-02-29 13:03:50', NULL, NULL, 1),
(610, 16, 10, 'Price', 'item_price', NULL, NULL, NULL, '2020-02-29 13:03:50', NULL, NULL, 1),
(611, 16, 11, 'Experience', 'item_quantity', NULL, NULL, NULL, '2020-02-29 13:03:50', NULL, NULL, 1),
(612, 16, 12, '', 'item_veg_non_veg', 0, NULL, NULL, '2020-02-29 13:03:50', NULL, NULL, 1),
(613, 16, 13, 'Status', 'item_status', NULL, NULL, NULL, '2020-02-29 13:03:50', NULL, NULL, 1),
(614, 16, 14, 'Discount', 'item_discount', NULL, NULL, NULL, '2020-02-29 13:03:50', NULL, NULL, 1),
(615, 16, 15, 'Upload Image', 'item_image', NULL, NULL, NULL, '2020-02-29 13:03:50', NULL, NULL, 1),
(616, 16, 16, 'Description', 'item_desc', NULL, NULL, NULL, '2020-02-29 13:03:50', NULL, NULL, 1),
(617, 16, 17, 'Extra Section', 'sec_nav_label', NULL, NULL, NULL, '2020-02-29 13:03:50', NULL, NULL, 1),
(618, 16, 18, 'Add Extra Section', 'sec_label', NULL, NULL, NULL, '2020-02-29 13:03:50', NULL, NULL, 1),
(619, 16, 19, 'Select Menu', 'sec_menu', NULL, NULL, NULL, '2020-02-29 13:03:50', NULL, NULL, 1),
(620, 16, 20, 'Select Item', 'sec_item', NULL, NULL, NULL, '2020-02-29 13:03:50', NULL, NULL, 1),
(621, 16, 21, 'Section Name', 'sec_name', NULL, NULL, NULL, '2020-02-29 13:03:50', NULL, NULL, 1),
(622, 16, 22, 'Section Field (Radio / Checkbox)', 'sec_field', 3, NULL, NULL, '2020-02-29 13:03:50', NULL, NULL, 1),
(623, 16, 23, 'Section Required', 'sec_required', 1, NULL, NULL, '2020-02-29 13:03:50', NULL, NULL, 1),
(624, 16, 24, 'Section Item', 'seci_nav_label', NULL, NULL, NULL, '2020-02-29 13:03:50', NULL, NULL, 1),
(625, 16, 25, 'Add Section Item', 'seci_label', NULL, NULL, NULL, '2020-02-29 13:03:50', NULL, NULL, 1),
(626, 16, 26, 'Menu', 'seci_menu', NULL, NULL, NULL, '2020-02-29 13:03:50', NULL, NULL, 1),
(627, 16, 27, 'Item', 'seci_item', NULL, NULL, NULL, '2020-02-29 13:03:50', NULL, NULL, 1),
(628, 16, 28, 'Section', 'seci_sec', NULL, NULL, NULL, '2020-02-29 13:03:50', NULL, NULL, 1),
(629, 16, 29, 'Section Item Name', 'seci_name', NULL, NULL, NULL, '2020-02-29 13:03:50', NULL, NULL, 1),
(630, 16, 30, 'Price', 'seci_price', NULL, NULL, NULL, '2020-02-29 13:03:50', NULL, NULL, 1),
(631, 16, 31, 'Description', 'seci_desc', NULL, NULL, NULL, '2020-02-29 13:03:50', NULL, NULL, 1),
(632, 16, 32, 'Section Item Status', 'seci_status', NULL, NULL, NULL, '2020-02-29 13:03:50', NULL, NULL, 1),
(633, 16, 33, 'Orders', 'order_nav_label', NULL, NULL, NULL, '2020-02-29 13:03:50', NULL, NULL, 1),
(634, 16, 34, 'Order Label', 'order_label', NULL, NULL, NULL, '2020-02-29 13:03:50', NULL, NULL, 1),
(635, 16, 35, 'Order Rejected', 'order_rejected', NULL, NULL, NULL, '2020-02-29 13:03:50', NULL, NULL, 1),
(636, 16, 36, 'Order Received', 'order_received', NULL, NULL, NULL, '2020-02-29 13:03:50', NULL, NULL, 1),
(637, 16, 37, 'Order Accepted', 'order_accepted', NULL, NULL, NULL, '2020-02-29 13:03:50', NULL, NULL, 1),
(638, 16, 38, '', 'order_preparing', 0, NULL, NULL, '2020-02-29 13:03:50', NULL, NULL, 1),
(639, 16, 39, '', 'order_out_delivery', 0, NULL, NULL, '2020-02-29 13:03:50', NULL, NULL, 1),
(640, 16, 40, '', 'order_on_way', 0, NULL, NULL, '2020-02-29 13:03:50', NULL, NULL, 1),
(641, 16, 41, 'Completed', 'order_completed', NULL, NULL, NULL, '2020-02-29 13:03:50', NULL, NULL, 1),
(642, 16, 42, 'Canceled', 'order_canceled', NULL, NULL, NULL, '2020-02-29 13:03:50', NULL, NULL, 1),
(643, 16, 43, 'Rejected', 'order_rejected_btn', NULL, NULL, NULL, '2020-02-29 13:03:50', NULL, NULL, 1),
(644, 16, 44, 'Received', 'order_received_btn', NULL, NULL, NULL, '2020-02-29 13:03:50', NULL, NULL, 1),
(645, 16, 45, 'Accepted', 'order_accepted_btn', NULL, NULL, NULL, '2020-02-29 13:03:50', NULL, NULL, 1),
(646, 16, 46, '', 'order_preparing_btn', NULL, NULL, NULL, '2020-02-29 13:03:50', NULL, NULL, 1),
(647, 16, 47, '', 'order_out_delivery_btn', NULL, NULL, NULL, '2020-02-29 13:03:50', NULL, NULL, 1),
(648, 16, 48, '', 'order_on_way_btn', NULL, NULL, NULL, '2020-02-29 13:03:50', NULL, NULL, 1),
(649, 16, 49, 'Order Completed Button', 'order_completed_btn', NULL, NULL, NULL, '2020-02-29 13:03:50', NULL, NULL, 1),
(650, 16, 50, 'Order Canceled Button', 'order_canceled_btn', NULL, NULL, NULL, '2020-02-29 13:03:50', NULL, NULL, 1),
(651, 17, 1, 'Category', 'menu_nav_label', NULL, NULL, NULL, '2020-02-29 13:04:10', NULL, NULL, 1),
(652, 17, 2, 'Add Category', 'menu_label', NULL, NULL, NULL, '2020-02-29 13:04:10', NULL, NULL, 1),
(653, 17, 3, 'Category Name', 'menu_name', NULL, NULL, NULL, '2020-02-29 13:04:10', NULL, NULL, 1),
(654, 17, 4, 'Description', 'menu_desc', NULL, NULL, NULL, '2020-02-29 13:04:10', NULL, NULL, 1),
(655, 17, 5, 'Upload Image', 'menu_image', NULL, NULL, NULL, '2020-02-29 13:04:10', NULL, NULL, 1),
(656, 17, 6, 'Product', 'item_nav_label', NULL, NULL, NULL, '2020-02-29 13:04:10', NULL, NULL, 1),
(657, 17, 7, 'Add Product', 'item_label', NULL, NULL, NULL, '2020-02-29 13:04:10', NULL, NULL, 1),
(658, 17, 8, 'Select Category', 'item_menu', NULL, NULL, NULL, '2020-02-29 13:04:10', NULL, NULL, 1),
(659, 17, 9, 'Product Name', 'item_name', NULL, NULL, NULL, '2020-02-29 13:04:10', NULL, NULL, 1),
(660, 17, 10, 'Price', 'item_price', NULL, NULL, NULL, '2020-02-29 13:04:10', NULL, NULL, 1),
(661, 17, 11, 'Quantity', 'item_quantity', NULL, NULL, NULL, '2020-02-29 13:04:10', NULL, NULL, 1),
(662, 17, 12, '', 'item_veg_non_veg', 0, NULL, NULL, '2020-02-29 13:04:10', NULL, NULL, 1),
(663, 17, 13, 'Status', 'item_status', NULL, NULL, NULL, '2020-02-29 13:04:10', NULL, NULL, 1),
(664, 17, 14, 'Discount', 'item_discount', NULL, NULL, NULL, '2020-02-29 13:04:10', NULL, NULL, 1),
(665, 17, 15, 'Upload Image', 'item_image', NULL, NULL, NULL, '2020-02-29 13:04:10', NULL, NULL, 1),
(666, 17, 16, 'Description', 'item_desc', NULL, NULL, NULL, '2020-02-29 13:04:10', NULL, NULL, 1),
(667, 17, 17, 'Extra Section', 'sec_nav_label', NULL, NULL, NULL, '2020-02-29 13:04:10', NULL, NULL, 1),
(668, 17, 18, 'Add Extra Section', 'sec_label', NULL, NULL, NULL, '2020-02-29 13:04:10', NULL, NULL, 1),
(669, 17, 19, 'Select Menu', 'sec_menu', NULL, NULL, NULL, '2020-02-29 13:04:10', NULL, NULL, 1),
(670, 17, 20, 'Select Item', 'sec_item', NULL, NULL, NULL, '2020-02-29 13:04:10', NULL, NULL, 1),
(671, 17, 21, 'Section Name', 'sec_name', NULL, NULL, NULL, '2020-02-29 13:04:10', NULL, NULL, 1),
(672, 17, 22, 'Section Field (Radio / Checkbox)', 'sec_field', 3, NULL, NULL, '2020-02-29 13:04:10', NULL, NULL, 1),
(673, 17, 23, 'Section Required', 'sec_required', 1, NULL, NULL, '2020-02-29 13:04:10', NULL, NULL, 1),
(674, 17, 24, 'Section Item', 'seci_nav_label', NULL, NULL, NULL, '2020-02-29 13:04:10', NULL, NULL, 1),
(675, 17, 25, 'Add Section Item', 'seci_label', NULL, NULL, NULL, '2020-02-29 13:04:10', NULL, NULL, 1),
(676, 17, 26, 'Menu', 'seci_menu', NULL, NULL, NULL, '2020-02-29 13:04:10', NULL, NULL, 1),
(677, 17, 27, 'Item', 'seci_item', NULL, NULL, NULL, '2020-02-29 13:04:10', NULL, NULL, 1),
(678, 17, 28, 'Section', 'seci_sec', NULL, NULL, NULL, '2020-02-29 13:04:10', NULL, NULL, 1),
(679, 17, 29, 'Section Item Name', 'seci_name', NULL, NULL, NULL, '2020-02-29 13:04:10', NULL, NULL, 1),
(680, 17, 30, 'Price', 'seci_price', NULL, NULL, NULL, '2020-02-29 13:04:10', NULL, NULL, 1),
(681, 17, 31, 'Description', 'seci_desc', NULL, NULL, NULL, '2020-02-29 13:04:10', NULL, NULL, 1),
(682, 17, 32, 'Section Item Status', 'seci_status', NULL, NULL, NULL, '2020-02-29 13:04:10', NULL, NULL, 1),
(683, 17, 33, 'Orders', 'order_nav_label', NULL, NULL, NULL, '2020-02-29 13:04:10', NULL, NULL, 1),
(684, 17, 34, 'Order Label', 'order_label', NULL, NULL, NULL, '2020-02-29 13:04:10', NULL, NULL, 1),
(685, 17, 35, 'Order Rejected', 'order_rejected', NULL, NULL, NULL, '2020-02-29 13:04:10', NULL, NULL, 1),
(686, 17, 36, 'Order Received', 'order_received', NULL, NULL, NULL, '2020-02-29 13:04:10', NULL, NULL, 1),
(687, 17, 37, 'Order Accepted', 'order_accepted', NULL, NULL, NULL, '2020-02-29 13:04:10', NULL, NULL, 1),
(688, 17, 38, '', 'order_preparing', 0, NULL, NULL, '2020-02-29 13:04:10', NULL, NULL, 1),
(689, 17, 39, 'Out For Delivery', 'order_out_delivery', 1, NULL, NULL, '2020-02-29 13:04:10', NULL, NULL, 1),
(690, 17, 40, 'On The Way', 'order_on_way', 1, NULL, NULL, '2020-02-29 13:04:10', NULL, NULL, 1),
(691, 17, 41, 'Completed', 'order_completed', NULL, NULL, NULL, '2020-02-29 13:04:10', NULL, NULL, 1),
(692, 17, 42, 'Canceled', 'order_canceled', NULL, NULL, NULL, '2020-02-29 13:04:10', NULL, NULL, 1),
(693, 17, 43, 'Rejected', 'order_rejected_btn', NULL, NULL, NULL, '2020-02-29 13:04:10', NULL, NULL, 1),
(694, 17, 44, 'Received', 'order_received_btn', NULL, NULL, NULL, '2020-02-29 13:04:10', NULL, NULL, 1),
(695, 17, 45, 'Accepted', 'order_accepted_btn', NULL, NULL, NULL, '2020-02-29 13:04:10', NULL, NULL, 1),
(696, 17, 46, '', 'order_preparing_btn', NULL, NULL, NULL, '2020-02-29 13:04:10', NULL, NULL, 1),
(697, 17, 47, 'Out For Delivery', 'order_out_delivery_btn', NULL, NULL, NULL, '2020-02-29 13:04:10', NULL, NULL, 1),
(698, 17, 48, 'On the Way', 'order_on_way_btn', NULL, NULL, NULL, '2020-02-29 13:04:10', NULL, NULL, 1),
(699, 17, 49, 'Completed', 'order_completed_btn', NULL, NULL, NULL, '2020-02-29 13:04:10', NULL, NULL, 1),
(700, 17, 50, 'Canceled', 'order_canceled_btn', NULL, NULL, NULL, '2020-02-29 13:04:10', NULL, NULL, 1),
(701, 18, 1, 'Category', 'menu_nav_label', NULL, NULL, NULL, '2020-02-29 13:04:32', NULL, NULL, 1),
(702, 18, 2, 'Add Category', 'menu_label', NULL, NULL, NULL, '2020-02-29 13:04:32', NULL, NULL, 1),
(703, 18, 3, 'Category Name', 'menu_name', NULL, NULL, NULL, '2020-02-29 13:04:32', NULL, NULL, 1),
(704, 18, 4, 'Description', 'menu_desc', NULL, NULL, NULL, '2020-02-29 13:04:32', NULL, NULL, 1),
(705, 18, 5, 'Upload Image', 'menu_image', NULL, NULL, NULL, '2020-02-29 13:04:32', NULL, NULL, 1),
(706, 18, 6, 'Product', 'item_nav_label', NULL, NULL, NULL, '2020-02-29 13:04:32', NULL, NULL, 1),
(707, 18, 7, 'Add Product', 'item_label', NULL, NULL, NULL, '2020-02-29 13:04:32', NULL, NULL, 1),
(708, 18, 8, 'Select Category', 'item_menu', NULL, NULL, NULL, '2020-02-29 13:04:32', NULL, NULL, 1),
(709, 18, 9, 'Product Name', 'item_name', NULL, NULL, NULL, '2020-02-29 13:04:32', NULL, NULL, 1),
(710, 18, 10, 'Price', 'item_price', NULL, NULL, NULL, '2020-02-29 13:04:32', NULL, NULL, 1),
(711, 18, 11, 'Quantity', 'item_quantity', NULL, NULL, NULL, '2020-02-29 13:04:32', NULL, NULL, 1),
(712, 18, 12, '', 'item_veg_non_veg', 0, NULL, NULL, '2020-02-29 13:04:32', NULL, NULL, 1),
(713, 18, 13, 'Status', 'item_status', NULL, NULL, NULL, '2020-02-29 13:04:32', NULL, NULL, 1),
(714, 18, 14, 'Discount', 'item_discount', NULL, NULL, NULL, '2020-02-29 13:04:32', NULL, NULL, 1),
(715, 18, 15, 'Upload Image', 'item_image', NULL, NULL, NULL, '2020-02-29 13:04:32', NULL, NULL, 1),
(716, 18, 16, 'Description', 'item_desc', NULL, NULL, NULL, '2020-02-29 13:04:32', NULL, NULL, 1),
(717, 18, 17, 'Extra Section', 'sec_nav_label', NULL, NULL, NULL, '2020-02-29 13:04:32', NULL, NULL, 1),
(718, 18, 18, 'Add Extra Section', 'sec_label', NULL, NULL, NULL, '2020-02-29 13:04:32', NULL, NULL, 1),
(719, 18, 19, 'Select Menu', 'sec_menu', NULL, NULL, NULL, '2020-02-29 13:04:32', NULL, NULL, 1),
(720, 18, 20, 'Select Item', 'sec_item', NULL, NULL, NULL, '2020-02-29 13:04:32', NULL, NULL, 1),
(721, 18, 21, 'Section Name', 'sec_name', NULL, NULL, NULL, '2020-02-29 13:04:32', NULL, NULL, 1),
(722, 18, 22, 'Section Field (Radio / Checkbox)', 'sec_field', 3, NULL, NULL, '2020-02-29 13:04:32', NULL, NULL, 1),
(723, 18, 23, 'Section Required', 'sec_required', 1, NULL, NULL, '2020-02-29 13:04:32', NULL, NULL, 1),
(724, 18, 24, 'Section Item', 'seci_nav_label', NULL, NULL, NULL, '2020-02-29 13:04:32', NULL, NULL, 1),
(725, 18, 25, 'Add Section Item', 'seci_label', NULL, NULL, NULL, '2020-02-29 13:04:32', NULL, NULL, 1),
(726, 18, 26, 'Menu', 'seci_menu', NULL, NULL, NULL, '2020-02-29 13:04:32', NULL, NULL, 1),
(727, 18, 27, 'Item', 'seci_item', NULL, NULL, NULL, '2020-02-29 13:04:32', NULL, NULL, 1),
(728, 18, 28, 'Section', 'seci_sec', NULL, NULL, NULL, '2020-02-29 13:04:32', NULL, NULL, 1),
(729, 18, 29, 'Section Item Name', 'seci_name', NULL, NULL, NULL, '2020-02-29 13:04:32', NULL, NULL, 1),
(730, 18, 30, 'Price', 'seci_price', NULL, NULL, NULL, '2020-02-29 13:04:32', NULL, NULL, 1),
(731, 18, 31, 'Description', 'seci_desc', NULL, NULL, NULL, '2020-02-29 13:04:32', NULL, NULL, 1),
(732, 18, 32, 'Status', 'seci_status', NULL, NULL, NULL, '2020-02-29 13:04:32', NULL, NULL, 1),
(733, 18, 33, 'Orders', 'order_nav_label', NULL, NULL, NULL, '2020-02-29 13:04:32', NULL, NULL, 1),
(734, 18, 34, 'Order Label', 'order_label', NULL, NULL, NULL, '2020-02-29 13:04:32', NULL, NULL, 1),
(735, 18, 35, 'Order Rejected', 'order_rejected', NULL, NULL, NULL, '2020-02-29 13:04:32', NULL, NULL, 1),
(736, 18, 36, 'Order Received', 'order_received', NULL, NULL, NULL, '2020-02-29 13:04:32', NULL, NULL, 1),
(737, 18, 37, 'Order Accepted', 'order_accepted', NULL, NULL, NULL, '2020-02-29 13:04:32', NULL, NULL, 1),
(738, 18, 38, '', 'order_preparing', 0, NULL, NULL, '2020-02-29 13:04:32', NULL, NULL, 1),
(739, 18, 39, 'Order Out For Delivery', 'order_out_delivery', 1, NULL, NULL, '2020-02-29 13:04:32', NULL, NULL, 1),
(740, 18, 40, 'Order On The Way', 'order_on_way', 1, NULL, NULL, '2020-02-29 13:04:32', NULL, NULL, 1),
(741, 18, 41, 'Order Completed', 'order_completed', NULL, NULL, NULL, '2020-02-29 13:04:32', NULL, NULL, 1),
(742, 18, 42, 'Order Canceled', 'order_canceled', NULL, NULL, NULL, '2020-02-29 13:04:32', NULL, NULL, 1),
(743, 18, 43, 'Order Rejected Button', 'order_rejected_btn', NULL, NULL, NULL, '2020-02-29 13:04:32', NULL, NULL, 1),
(744, 18, 44, 'Order Received Button', 'order_received_btn', NULL, NULL, NULL, '2020-02-29 13:04:32', NULL, NULL, 1),
(745, 18, 45, 'Order Accepted Button', 'order_accepted_btn', NULL, NULL, NULL, '2020-02-29 13:04:32', NULL, NULL, 1),
(746, 18, 46, 'Order Preparing Button', 'order_preparing_btn', NULL, NULL, NULL, '2020-02-29 13:04:32', NULL, NULL, 1),
(747, 18, 47, 'Order Out For Delivery Button', 'order_out_delivery_btn', NULL, NULL, NULL, '2020-02-29 13:04:32', NULL, NULL, 1),
(748, 18, 48, 'Order On The Way Button', 'order_on_way_btn', NULL, NULL, NULL, '2020-02-29 13:04:32', NULL, NULL, 1),
(749, 18, 49, 'Order Completed Button', 'order_completed_btn', NULL, NULL, NULL, '2020-02-29 13:04:32', NULL, NULL, 1),
(750, 18, 50, 'Order Canceled Button', 'order_canceled_btn', NULL, NULL, NULL, '2020-02-29 13:04:32', NULL, NULL, 1),
(751, 1, 1, 'Category', 'menu_nav_label', NULL, NULL, NULL, '2020-03-01 06:22:22', NULL, NULL, 1),
(752, 1, 2, 'Add Category', 'menu_label', NULL, NULL, NULL, '2020-03-01 06:22:22', NULL, NULL, 1),
(753, 1, 3, 'Category Name', 'menu_name', NULL, NULL, NULL, '2020-03-01 06:22:22', NULL, NULL, 1),
(754, 1, 4, 'Description', 'menu_desc', NULL, NULL, NULL, '2020-03-01 06:22:22', NULL, NULL, 1),
(755, 1, 5, 'Upload Image', 'menu_image', NULL, NULL, NULL, '2020-03-01 06:22:22', NULL, NULL, 1),
(756, 1, 6, 'Product', 'item_nav_label', NULL, NULL, NULL, '2020-03-01 06:22:22', NULL, NULL, 1),
(757, 1, 7, 'Add Product', 'item_label', NULL, NULL, NULL, '2020-03-01 06:22:22', NULL, NULL, 1),
(758, 1, 8, 'Select Category', 'item_menu', NULL, NULL, NULL, '2020-03-01 06:22:22', NULL, NULL, 1),
(759, 1, 9, 'Product Name', 'item_name', NULL, NULL, NULL, '2020-03-01 06:22:22', NULL, NULL, 1),
(760, 1, 10, 'Price', 'item_price', NULL, NULL, NULL, '2020-03-01 06:22:22', NULL, NULL, 1),
(761, 1, 11, 'Quantity', 'item_quantity', NULL, NULL, NULL, '2020-03-01 06:22:22', NULL, NULL, 1),
(762, 1, 12, '', 'item_veg_non_veg', 0, NULL, NULL, '2020-03-01 06:22:22', NULL, NULL, 1),
(763, 1, 13, 'Status', 'item_status', NULL, NULL, NULL, '2020-03-01 06:22:22', NULL, NULL, 1),
(764, 1, 14, 'Discount', 'item_discount', NULL, NULL, NULL, '2020-03-01 06:22:22', NULL, NULL, 1),
(765, 1, 15, 'Upload Image', 'item_image', NULL, NULL, NULL, '2020-03-01 06:22:22', NULL, NULL, 1),
(766, 1, 16, 'Description', 'item_desc', NULL, NULL, NULL, '2020-03-01 06:22:22', NULL, NULL, 1),
(767, 1, 17, 'Extra Section', 'sec_nav_label', NULL, NULL, NULL, '2020-03-01 06:22:22', NULL, NULL, 1),
(768, 1, 18, 'Add Extra Section', 'sec_label', NULL, NULL, NULL, '2020-03-01 06:22:22', NULL, NULL, 1),
(769, 1, 19, 'Select Menu', 'sec_menu', NULL, NULL, NULL, '2020-03-01 06:22:22', NULL, NULL, 1),
(770, 1, 20, 'Select Item', 'sec_item', NULL, NULL, NULL, '2020-03-01 06:22:22', NULL, NULL, 1),
(771, 1, 21, 'Section Name', 'sec_name', NULL, NULL, NULL, '2020-03-01 06:22:22', NULL, NULL, 1),
(772, 1, 22, 'Section Field (Radio / Checkbox)', 'sec_field', 3, NULL, NULL, '2020-03-01 06:22:22', NULL, NULL, 1),
(773, 1, 23, 'Section Required', 'sec_required', 1, NULL, NULL, '2020-03-01 06:22:22', NULL, NULL, 1),
(774, 1, 24, 'Section Item', 'seci_nav_label', NULL, NULL, NULL, '2020-03-01 06:22:22', NULL, NULL, 1),
(775, 1, 25, 'Add Section Item', 'seci_label', NULL, NULL, NULL, '2020-03-01 06:22:22', NULL, NULL, 1),
(776, 1, 26, 'Menu', 'seci_menu', NULL, NULL, NULL, '2020-03-01 06:22:22', NULL, NULL, 1),
(777, 1, 27, 'Item', 'seci_item', NULL, NULL, NULL, '2020-03-01 06:22:22', NULL, NULL, 1),
(778, 1, 28, 'Section', 'seci_sec', NULL, NULL, NULL, '2020-03-01 06:22:22', NULL, NULL, 1),
(779, 1, 29, 'Section Item Name', 'seci_name', NULL, NULL, NULL, '2020-03-01 06:22:22', NULL, NULL, 1),
(780, 1, 30, 'Price', 'seci_price', NULL, NULL, NULL, '2020-03-01 06:22:22', NULL, NULL, 1),
(781, 1, 31, 'Description', 'seci_desc', NULL, NULL, NULL, '2020-03-01 06:22:22', NULL, NULL, 1),
(782, 1, 32, 'Status', 'seci_status', NULL, NULL, NULL, '2020-03-01 06:22:22', NULL, NULL, 1),
(783, 1, 33, 'Orders', 'order_nav_label', NULL, NULL, NULL, '2020-03-01 06:22:22', NULL, NULL, 1),
(784, 1, 34, 'Order', 'order_label', NULL, NULL, NULL, '2020-03-01 06:22:22', NULL, NULL, 1),
(785, 1, 35, 'Order', 'order_rejected', NULL, NULL, NULL, '2020-03-01 06:22:22', NULL, NULL, 1),
(786, 1, 36, 'Order Received', 'order_received', NULL, NULL, NULL, '2020-03-01 06:22:22', NULL, NULL, 1),
(787, 1, 37, 'Order Accepted', 'order_accepted', NULL, NULL, NULL, '2020-03-01 06:22:22', NULL, NULL, 1),
(788, 1, 38, 'Preparing', 'order_preparing', 0, NULL, NULL, '2020-03-01 06:22:22', NULL, NULL, 1),
(789, 1, 39, 'Out For Delivery', 'order_out_delivery', 1, NULL, NULL, '2020-03-01 06:22:22', NULL, NULL, 1),
(790, 1, 40, 'On The Way', 'order_on_way', 1, NULL, NULL, '2020-03-01 06:22:22', NULL, NULL, 1),
(791, 1, 41, 'Completed', 'order_completed', NULL, NULL, NULL, '2020-03-01 06:22:22', NULL, NULL, 1),
(792, 1, 42, 'Canceled', 'order_canceled', NULL, NULL, NULL, '2020-03-01 06:22:22', NULL, NULL, 1),
(793, 1, 43, 'Rejected', 'order_rejected_btn', NULL, NULL, NULL, '2020-03-01 06:22:22', NULL, NULL, 1),
(794, 1, 44, 'Received', 'order_received_btn', NULL, NULL, NULL, '2020-03-01 06:22:22', NULL, NULL, 1),
(795, 1, 45, 'Accepted', 'order_accepted_btn', NULL, NULL, NULL, '2020-03-01 06:22:22', NULL, NULL, 1),
(796, 1, 46, '', 'order_preparing_btn', NULL, NULL, NULL, '2020-03-01 06:22:22', NULL, NULL, 1),
(797, 1, 47, 'Out For Delivery', 'order_out_delivery_btn', NULL, NULL, NULL, '2020-03-01 06:22:22', NULL, NULL, 1),
(798, 1, 48, 'On the Way', 'order_on_way_btn', NULL, NULL, NULL, '2020-03-01 06:22:22', NULL, NULL, 1),
(799, 1, 49, 'Completed', 'order_completed_btn', NULL, NULL, NULL, '2020-03-01 06:22:22', NULL, NULL, 1),
(800, 1, 50, 'Canceled', 'order_canceled_btn', NULL, NULL, NULL, '2020-03-01 06:22:22', NULL, NULL, 1),
(801, 2, 1, 'Vehicle Category', 'menu_nav_label', NULL, NULL, NULL, '2020-03-01 07:20:38', NULL, NULL, 1),
(802, 2, 2, 'Add Vehicle Category ', 'menu_label', NULL, NULL, NULL, '2020-03-01 07:20:38', NULL, NULL, 1),
(803, 2, 3, 'Vehicle Category Name', 'menu_name', NULL, NULL, NULL, '2020-03-01 07:20:38', NULL, NULL, 1),
(804, 2, 4, 'Description', 'menu_desc', NULL, NULL, NULL, '2020-03-01 07:20:38', NULL, NULL, 1),
(805, 2, 5, 'Upload Image', 'menu_image', NULL, NULL, NULL, '2020-03-01 07:20:38', NULL, NULL, 1),
(806, 2, 6, 'Vehicle', 'item_nav_label', NULL, NULL, NULL, '2020-03-01 07:20:38', NULL, NULL, 1),
(807, 2, 7, 'Add Vehicle', 'item_label', NULL, NULL, NULL, '2020-03-01 07:20:38', NULL, NULL, 1),
(808, 2, 8, 'Select Category', 'item_menu', NULL, NULL, NULL, '2020-03-01 07:20:38', NULL, NULL, 1),
(809, 2, 9, 'Vehicle Name', 'item_name', NULL, NULL, NULL, '2020-03-01 07:20:38', NULL, NULL, 1),
(810, 2, 10, 'Price', 'item_price', NULL, NULL, NULL, '2020-03-01 07:20:38', NULL, NULL, 1),
(811, 2, 11, 'Seats', 'item_quantity', NULL, NULL, NULL, '2020-03-01 07:20:38', NULL, NULL, 1),
(812, 2, 12, '', 'item_veg_non_veg', 0, NULL, NULL, '2020-03-01 07:20:38', NULL, NULL, 1),
(813, 2, 13, 'Status', 'item_status', NULL, NULL, NULL, '2020-03-01 07:20:38', NULL, NULL, 1),
(814, 2, 14, 'Discount', 'item_discount', NULL, NULL, NULL, '2020-03-01 07:20:38', NULL, NULL, 1),
(815, 2, 15, 'Upload Image', 'item_image', NULL, NULL, NULL, '2020-03-01 07:20:38', NULL, NULL, 1),
(816, 2, 16, 'Description', 'item_desc', NULL, NULL, NULL, '2020-03-01 07:20:38', NULL, NULL, 1),
(817, 2, 17, 'Extra Section', 'sec_nav_label', NULL, NULL, NULL, '2020-03-01 07:20:38', NULL, NULL, 1),
(818, 2, 18, 'Add Extra Section', 'sec_label', NULL, NULL, NULL, '2020-03-01 07:20:38', NULL, NULL, 1),
(819, 2, 19, 'Select Menu', 'sec_menu', NULL, NULL, NULL, '2020-03-01 07:20:38', NULL, NULL, 1),
(820, 2, 20, 'Select Item', 'sec_item', NULL, NULL, NULL, '2020-03-01 07:20:38', NULL, NULL, 1),
(821, 2, 21, 'Section Name', 'sec_name', NULL, NULL, NULL, '2020-03-01 07:20:38', NULL, NULL, 1),
(822, 2, 22, 'Section Field (Radio / Checkbox)', 'sec_field', 3, NULL, NULL, '2020-03-01 07:20:38', NULL, NULL, 1),
(823, 2, 23, 'Section Required', 'sec_required', 1, NULL, NULL, '2020-03-01 07:20:38', NULL, NULL, 1),
(824, 2, 24, 'Section Item', 'seci_nav_label', NULL, NULL, NULL, '2020-03-01 07:20:38', NULL, NULL, 1),
(825, 2, 25, 'Add Section Item', 'seci_label', NULL, NULL, NULL, '2020-03-01 07:20:38', NULL, NULL, 1),
(826, 2, 26, 'Menu', 'seci_menu', NULL, NULL, NULL, '2020-03-01 07:20:38', NULL, NULL, 1),
(827, 2, 27, 'Item', 'seci_item', NULL, NULL, NULL, '2020-03-01 07:20:38', NULL, NULL, 1),
(828, 2, 28, 'Section', 'seci_sec', NULL, NULL, NULL, '2020-03-01 07:20:38', NULL, NULL, 1),
(829, 2, 29, 'Section Item Name', 'seci_name', NULL, NULL, NULL, '2020-03-01 07:20:38', NULL, NULL, 1),
(830, 2, 30, 'Price', 'seci_price', NULL, NULL, NULL, '2020-03-01 07:20:38', NULL, NULL, 1),
(831, 2, 31, 'Description', 'seci_desc', NULL, NULL, NULL, '2020-03-01 07:20:38', NULL, NULL, 1),
(832, 2, 32, 'Status', 'seci_status', NULL, NULL, NULL, '2020-03-01 07:20:38', NULL, NULL, 1),
(833, 2, 33, 'Orders', 'order_nav_label', NULL, NULL, NULL, '2020-03-01 07:20:38', NULL, NULL, 1),
(834, 2, 34, 'Order', 'order_label', NULL, NULL, NULL, '2020-03-01 07:20:38', NULL, NULL, 1),
(835, 2, 35, 'Rejected', 'order_rejected', NULL, NULL, NULL, '2020-03-01 07:20:38', NULL, NULL, 1),
(836, 2, 36, 'Received', 'order_received', NULL, NULL, NULL, '2020-03-01 07:20:38', NULL, NULL, 1),
(837, 2, 37, 'Accepted', 'order_accepted', NULL, NULL, NULL, '2020-03-01 07:20:38', NULL, NULL, 1),
(838, 2, 38, '', 'order_preparing', 0, NULL, NULL, '2020-03-01 07:20:38', NULL, NULL, 1),
(839, 2, 39, '', 'order_out_delivery', 0, NULL, NULL, '2020-03-01 07:20:38', NULL, NULL, 1),
(840, 2, 40, '', 'order_on_way', 0, NULL, NULL, '2020-03-01 07:20:38', NULL, NULL, 1),
(841, 2, 41, 'Completed', 'order_completed', NULL, NULL, NULL, '2020-03-01 07:20:38', NULL, NULL, 1),
(842, 2, 42, 'Canceled', 'order_canceled', NULL, NULL, NULL, '2020-03-01 07:20:38', NULL, NULL, 1),
(843, 2, 43, 'Rejected', 'order_rejected_btn', NULL, NULL, NULL, '2020-03-01 07:20:38', NULL, NULL, 1),
(844, 2, 44, 'Received', 'order_received_btn', NULL, NULL, NULL, '2020-03-01 07:20:38', NULL, NULL, 1),
(845, 2, 45, 'Accepted', 'order_accepted_btn', NULL, NULL, NULL, '2020-03-01 07:20:38', NULL, NULL, 1),
(846, 2, 46, '', 'order_preparing_btn', NULL, NULL, NULL, '2020-03-01 07:20:38', NULL, NULL, 1),
(847, 2, 47, '', 'order_out_delivery_btn', NULL, NULL, NULL, '2020-03-01 07:20:38', NULL, NULL, 1),
(848, 2, 48, '', 'order_on_way_btn', NULL, NULL, NULL, '2020-03-01 07:20:38', NULL, NULL, 1),
(849, 2, 49, 'Completed', 'order_completed_btn', NULL, NULL, NULL, '2020-03-01 07:20:38', NULL, NULL, 1),
(850, 2, 50, 'Canceled', 'order_canceled_btn', NULL, NULL, NULL, '2020-03-01 07:20:38', NULL, NULL, 1),
(851, 3, 1, 'Category', 'menu_nav_label', NULL, NULL, NULL, '2020-03-01 07:24:30', NULL, NULL, 1),
(852, 3, 2, 'Add Category', 'menu_label', NULL, NULL, NULL, '2020-03-01 07:24:30', NULL, NULL, 1),
(853, 3, 3, 'Medicene Category Name', 'menu_name', NULL, NULL, NULL, '2020-03-01 07:24:30', NULL, NULL, 1),
(854, 3, 4, 'Description', 'menu_desc', NULL, NULL, NULL, '2020-03-01 07:24:30', NULL, NULL, 1),
(855, 3, 5, 'Upload Image', 'menu_image', NULL, NULL, NULL, '2020-03-01 07:24:30', NULL, NULL, 1),
(856, 3, 6, 'Medicine', 'item_nav_label', NULL, NULL, NULL, '2020-03-01 07:24:30', NULL, NULL, 1),
(857, 3, 7, 'Add Medicine', 'item_label', NULL, NULL, NULL, '2020-03-01 07:24:30', NULL, NULL, 1),
(858, 3, 8, 'Select Category', 'item_menu', NULL, NULL, NULL, '2020-03-01 07:24:30', NULL, NULL, 1),
(859, 3, 9, 'Medicine Name', 'item_name', NULL, NULL, NULL, '2020-03-01 07:24:30', NULL, NULL, 1),
(860, 3, 10, 'Price', 'item_price', NULL, NULL, NULL, '2020-03-01 07:24:30', NULL, NULL, 1),
(861, 3, 11, 'Quantity', 'item_quantity', NULL, NULL, NULL, '2020-03-01 07:24:30', NULL, NULL, 1),
(862, 3, 12, '', 'item_veg_non_veg', 0, NULL, NULL, '2020-03-01 07:24:30', NULL, NULL, 1),
(863, 3, 13, 'Status', 'item_status', NULL, NULL, NULL, '2020-03-01 07:24:30', NULL, NULL, 1),
(864, 3, 14, 'Discount', 'item_discount', NULL, NULL, NULL, '2020-03-01 07:24:30', NULL, NULL, 1),
(865, 3, 15, 'Upload Image', 'item_image', NULL, NULL, NULL, '2020-03-01 07:24:30', NULL, NULL, 1),
(866, 3, 16, 'Description', 'item_desc', NULL, NULL, NULL, '2020-03-01 07:24:30', NULL, NULL, 1),
(867, 3, 17, 'Extra Section', 'sec_nav_label', NULL, NULL, NULL, '2020-03-01 07:24:30', NULL, NULL, 1),
(868, 3, 18, 'Add Extra Section', 'sec_label', NULL, NULL, NULL, '2020-03-01 07:24:30', NULL, NULL, 1),
(869, 3, 19, 'Select Menu', 'sec_menu', NULL, NULL, NULL, '2020-03-01 07:24:30', NULL, NULL, 1),
(870, 3, 20, 'Select Item', 'sec_item', NULL, NULL, NULL, '2020-03-01 07:24:30', NULL, NULL, 1),
(871, 3, 21, 'Section Name', 'sec_name', NULL, NULL, NULL, '2020-03-01 07:24:30', NULL, NULL, 1),
(872, 3, 22, 'Section Field (Radio / Checkbox)', 'sec_field', 3, NULL, NULL, '2020-03-01 07:24:30', NULL, NULL, 1),
(873, 3, 23, 'Section Required', 'sec_required', 1, NULL, NULL, '2020-03-01 07:24:30', NULL, NULL, 1),
(874, 3, 24, 'Section Item', 'seci_nav_label', NULL, NULL, NULL, '2020-03-01 07:24:30', NULL, NULL, 1),
(875, 3, 25, 'Add Section Item', 'seci_label', NULL, NULL, NULL, '2020-03-01 07:24:30', NULL, NULL, 1),
(876, 3, 26, 'Menu', 'seci_menu', NULL, NULL, NULL, '2020-03-01 07:24:30', NULL, NULL, 1),
(877, 3, 27, 'Item', 'seci_item', NULL, NULL, NULL, '2020-03-01 07:24:30', NULL, NULL, 1),
(878, 3, 28, 'Section', 'seci_sec', NULL, NULL, NULL, '2020-03-01 07:24:30', NULL, NULL, 1),
(879, 3, 29, 'Section Item Name', 'seci_name', NULL, NULL, NULL, '2020-03-01 07:24:30', NULL, NULL, 1),
(880, 3, 30, 'Price', 'seci_price', NULL, NULL, NULL, '2020-03-01 07:24:30', NULL, NULL, 1),
(881, 3, 31, 'Description', 'seci_desc', NULL, NULL, NULL, '2020-03-01 07:24:30', NULL, NULL, 1),
(882, 3, 32, 'Status', 'seci_status', NULL, NULL, NULL, '2020-03-01 07:24:30', NULL, NULL, 1),
(883, 3, 33, 'Orders', 'order_nav_label', NULL, NULL, NULL, '2020-03-01 07:24:30', NULL, NULL, 1),
(884, 3, 34, 'Order', 'order_label', NULL, NULL, NULL, '2020-03-01 07:24:30', NULL, NULL, 1),
(885, 3, 35, 'Rejected', 'order_rejected', NULL, NULL, NULL, '2020-03-01 07:24:30', NULL, NULL, 1),
(886, 3, 36, 'Received', 'order_received', NULL, NULL, NULL, '2020-03-01 07:24:30', NULL, NULL, 1),
(887, 3, 37, 'Accepted', 'order_accepted', NULL, NULL, NULL, '2020-03-01 07:24:30', NULL, NULL, 1),
(888, 3, 38, '', 'order_preparing', 0, NULL, NULL, '2020-03-01 07:24:30', NULL, NULL, 1),
(889, 3, 39, 'Out For Delivery', 'order_out_delivery', 1, NULL, NULL, '2020-03-01 07:24:30', NULL, NULL, 1),
(890, 3, 40, 'On The Way', 'order_on_way', 1, NULL, NULL, '2020-03-01 07:24:30', NULL, NULL, 1),
(891, 3, 41, 'Completed', 'order_completed', NULL, NULL, NULL, '2020-03-01 07:24:30', NULL, NULL, 1),
(892, 3, 42, 'Canceled', 'order_canceled', NULL, NULL, NULL, '2020-03-01 07:24:30', NULL, NULL, 1),
(893, 3, 43, 'Rejected', 'order_rejected_btn', NULL, NULL, NULL, '2020-03-01 07:24:30', NULL, NULL, 1),
(894, 3, 44, 'Received', 'order_received_btn', NULL, NULL, NULL, '2020-03-01 07:24:30', NULL, NULL, 1),
(895, 3, 45, 'Accepted', 'order_accepted_btn', NULL, NULL, NULL, '2020-03-01 07:24:30', NULL, NULL, 1),
(896, 3, 46, '', 'order_preparing_btn', NULL, NULL, NULL, '2020-03-01 07:24:30', NULL, NULL, 1),
(897, 3, 47, 'Out For Delivery', 'order_out_delivery_btn', NULL, NULL, NULL, '2020-03-01 07:24:30', NULL, NULL, 1),
(898, 3, 48, 'On the Way', 'order_on_way_btn', NULL, NULL, NULL, '2020-03-01 07:24:30', NULL, NULL, 1),
(899, 3, 49, 'Completed', 'order_completed_btn', NULL, NULL, NULL, '2020-03-01 07:24:30', NULL, NULL, 1),
(900, 3, 50, 'Canceled', 'order_canceled_btn', NULL, NULL, NULL, '2020-03-01 07:24:30', NULL, NULL, 1),
(901, 5, 51, 'Order Now', 'app_ord_label', NULL, NULL, NULL, '2020-03-16 14:11:50', NULL, NULL, 1),
(902, 5, 52, '', 'app_ord_quantity', 1, NULL, NULL, '2020-03-16 14:11:50', NULL, NULL, 1),
(903, 5, 53, '', 'app_ord_address', 1, NULL, NULL, '2020-03-16 14:11:50', NULL, NULL, 1),
(904, 1, 51, 'Shop Now', 'app_ord_label', NULL, NULL, NULL, '2020-03-21 10:59:42', NULL, NULL, 1),
(905, 1, 52, '', 'app_ord_quantity', 1, NULL, NULL, '2020-03-21 10:59:42', NULL, NULL, 1),
(906, 1, 53, '', 'app_ord_address', 1, NULL, NULL, '2020-03-21 10:59:42', NULL, NULL, 1),
(907, 2, 51, 'Book Now', 'app_ord_label', NULL, NULL, NULL, '2020-03-24 06:52:08', NULL, NULL, 1),
(908, 2, 52, '', 'app_ord_quantity', 0, NULL, NULL, '2020-03-24 06:52:08', NULL, NULL, 1),
(909, 2, 53, '', 'app_ord_address', 1, NULL, NULL, '2020-03-24 06:52:08', NULL, NULL, 1),
(910, 3, 51, 'Book Now', 'app_ord_label', NULL, NULL, NULL, '2020-03-24 06:54:27', NULL, NULL, 1),
(911, 3, 52, '', 'app_ord_quantity', 1, NULL, NULL, '2020-03-24 06:54:27', NULL, NULL, 1),
(912, 3, 53, '', 'app_ord_address', 1, NULL, NULL, '2020-03-24 06:54:27', NULL, NULL, 1),
(913, 4, 51, 'Book Now', 'app_ord_label', NULL, NULL, NULL, '2020-03-24 06:56:37', NULL, NULL, 1),
(914, 4, 52, '', 'app_ord_quantity', 0, NULL, NULL, '2020-03-24 06:56:37', NULL, NULL, 1),
(915, 4, 53, '', 'app_ord_address', 0, NULL, NULL, '2020-03-24 06:56:37', NULL, NULL, 1),
(916, 6, 51, 'Book Now', 'app_ord_label', NULL, NULL, NULL, '2020-03-24 06:58:53', NULL, NULL, 1),
(917, 6, 52, '', 'app_ord_quantity', 0, NULL, NULL, '2020-03-24 06:58:53', NULL, NULL, 1),
(918, 6, 53, '', 'app_ord_address', 0, NULL, NULL, '2020-03-24 06:58:53', NULL, NULL, 1),
(919, 7, 51, 'Shop Now', 'app_ord_label', NULL, NULL, NULL, '2020-03-24 07:00:28', NULL, NULL, 1),
(920, 7, 52, '', 'app_ord_quantity', 0, NULL, NULL, '2020-03-24 07:00:28', NULL, NULL, 1),
(921, 7, 53, '', 'app_ord_address', 0, NULL, NULL, '2020-03-24 07:00:28', NULL, NULL, 1),
(922, 8, 51, 'Book Now', 'app_ord_label', NULL, NULL, NULL, '2020-03-24 07:01:53', NULL, NULL, 1),
(923, 8, 52, '', 'app_ord_quantity', 0, NULL, NULL, '2020-03-24 07:01:53', NULL, NULL, 1),
(924, 8, 53, '', 'app_ord_address', 0, NULL, NULL, '2020-03-24 07:01:53', NULL, NULL, 1),
(925, 9, 51, 'Book Now', 'app_ord_label', NULL, NULL, NULL, '2020-03-24 07:03:08', NULL, NULL, 1),
(926, 9, 52, '', 'app_ord_quantity', 0, NULL, NULL, '2020-03-24 07:03:08', NULL, NULL, 1),
(927, 9, 53, '', 'app_ord_address', 1, NULL, NULL, '2020-03-24 07:03:08', NULL, NULL, 1),
(928, 10, 51, 'Book Now', 'app_ord_label', NULL, NULL, NULL, '2020-03-24 07:03:56', NULL, NULL, 1),
(929, 10, 52, '', 'app_ord_quantity', 0, NULL, NULL, '2020-03-24 07:03:56', NULL, NULL, 1),
(930, 10, 53, '', 'app_ord_address', 0, NULL, NULL, '2020-03-24 07:03:56', NULL, NULL, 1),
(931, 11, 51, 'Book Now', 'app_ord_label', NULL, NULL, NULL, '2020-03-24 07:05:11', NULL, NULL, 1),
(932, 11, 52, '', 'app_ord_quantity', 0, NULL, NULL, '2020-03-24 07:05:11', NULL, NULL, 1),
(933, 11, 53, '', 'app_ord_address', 1, NULL, NULL, '2020-03-24 07:05:11', NULL, NULL, 1),
(934, 12, 51, 'Book Now', 'app_ord_label', NULL, NULL, NULL, '2020-03-24 07:07:20', NULL, NULL, 1),
(935, 12, 52, '', 'app_ord_quantity', 0, NULL, NULL, '2020-03-24 07:07:20', NULL, NULL, 1),
(936, 12, 53, '', 'app_ord_address', 0, NULL, NULL, '2020-03-24 07:07:20', NULL, NULL, 1),
(937, 14, 51, 'Book Now', 'app_ord_label', NULL, NULL, NULL, '2020-03-24 07:09:34', NULL, NULL, 1),
(938, 14, 52, '', 'app_ord_quantity', 0, NULL, NULL, '2020-03-24 07:09:34', NULL, NULL, 1),
(939, 14, 53, '', 'app_ord_address', 0, NULL, NULL, '2020-03-24 07:09:34', NULL, NULL, 1),
(940, 15, 51, 'Book Now', 'app_ord_label', NULL, NULL, NULL, '2020-03-24 07:10:59', NULL, NULL, 1),
(941, 15, 52, '', 'app_ord_quantity', 0, NULL, NULL, '2020-03-24 07:10:59', NULL, NULL, 1),
(942, 15, 53, '', 'app_ord_address', 1, NULL, NULL, '2020-03-24 07:10:59', NULL, NULL, 1),
(943, 16, 51, 'Book Now', 'app_ord_label', NULL, NULL, NULL, '2020-03-24 07:12:05', NULL, NULL, 1),
(944, 16, 52, '', 'app_ord_quantity', 0, NULL, NULL, '2020-03-24 07:12:05', NULL, NULL, 1),
(945, 16, 53, '', 'app_ord_address', 0, NULL, NULL, '2020-03-24 07:12:05', NULL, NULL, 1),
(946, 17, 51, 'Shop Now', 'app_ord_label', NULL, NULL, NULL, '2020-03-24 07:13:14', NULL, NULL, 1),
(947, 17, 52, '', 'app_ord_quantity', 0, NULL, NULL, '2020-03-24 07:13:14', NULL, NULL, 1),
(948, 17, 53, '', 'app_ord_address', 0, NULL, NULL, '2020-03-24 07:13:14', NULL, NULL, 1),
(949, 18, 51, 'Shop Now', 'app_ord_label', NULL, NULL, NULL, '2020-03-24 07:14:20', NULL, NULL, 1),
(950, 18, 52, '', 'app_ord_quantity', 1, NULL, NULL, '2020-03-24 07:14:20', NULL, NULL, 1),
(951, 18, 53, '', 'app_ord_address', 1, NULL, NULL, '2020-03-24 07:14:20', NULL, NULL, 1),
(952, 19, 1, '', 'menu_nav_label', NULL, NULL, NULL, '2020-04-08 08:06:05', NULL, NULL, 1),
(953, 19, 2, '', 'menu_label', NULL, NULL, NULL, '2020-04-08 08:06:05', NULL, NULL, 1),
(954, 19, 3, '', 'menu_name', NULL, NULL, NULL, '2020-04-08 08:06:05', NULL, NULL, 1),
(955, 19, 4, '', 'menu_desc', NULL, NULL, NULL, '2020-04-08 08:06:05', NULL, NULL, 1),
(956, 19, 5, '', 'menu_image', NULL, NULL, NULL, '2020-04-08 08:06:05', NULL, NULL, 1),
(957, 19, 6, '', 'item_nav_label', NULL, NULL, NULL, '2020-04-08 08:06:05', NULL, NULL, 1),
(958, 19, 7, '', 'item_label', NULL, NULL, NULL, '2020-04-08 08:06:05', NULL, NULL, 1),
(959, 19, 8, '', 'item_menu', NULL, NULL, NULL, '2020-04-08 08:06:05', NULL, NULL, 1),
(960, 19, 9, '', 'item_name', NULL, NULL, NULL, '2020-04-08 08:06:05', NULL, NULL, 1),
(961, 19, 10, '', 'item_price', NULL, NULL, NULL, '2020-04-08 08:06:05', NULL, NULL, 1),
(962, 19, 11, '', 'item_quantity', NULL, NULL, NULL, '2020-04-08 08:06:05', NULL, NULL, 1),
(963, 19, 12, '', 'item_veg_non_veg', 0, NULL, NULL, '2020-04-08 08:06:05', NULL, NULL, 1),
(964, 19, 13, '', 'item_status', NULL, NULL, NULL, '2020-04-08 08:06:05', NULL, NULL, 1),
(965, 19, 14, '', 'item_discount', NULL, NULL, NULL, '2020-04-08 08:06:05', NULL, NULL, 1),
(966, 19, 15, '', 'item_image', NULL, NULL, NULL, '2020-04-08 08:06:05', NULL, NULL, 1),
(967, 19, 16, '', 'item_desc', NULL, NULL, NULL, '2020-04-08 08:06:05', NULL, NULL, 1),
(968, 19, 17, '', 'sec_nav_label', NULL, NULL, NULL, '2020-04-08 08:06:05', NULL, NULL, 1),
(969, 19, 18, '', 'sec_label', NULL, NULL, NULL, '2020-04-08 08:06:05', NULL, NULL, 1),
(970, 19, 19, '', 'sec_menu', NULL, NULL, NULL, '2020-04-08 08:06:05', NULL, NULL, 1),
(971, 19, 20, '', 'sec_item', NULL, NULL, NULL, '2020-04-08 08:06:05', NULL, NULL, 1),
(972, 19, 21, '', 'sec_name', NULL, NULL, NULL, '2020-04-08 08:06:05', NULL, NULL, 1),
(973, 19, 22, '', 'sec_field', 3, NULL, NULL, '2020-04-08 08:06:05', NULL, NULL, 1),
(974, 19, 23, '', 'sec_required', 2, NULL, NULL, '2020-04-08 08:06:05', NULL, NULL, 1),
(975, 19, 24, '', 'seci_nav_label', NULL, NULL, NULL, '2020-04-08 08:06:05', NULL, NULL, 1),
(976, 19, 25, '', 'seci_label', NULL, NULL, NULL, '2020-04-08 08:06:05', NULL, NULL, 1),
(977, 19, 26, '', 'seci_menu', NULL, NULL, NULL, '2020-04-08 08:06:05', NULL, NULL, 1),
(978, 19, 27, '', 'seci_item', NULL, NULL, NULL, '2020-04-08 08:06:05', NULL, NULL, 1),
(979, 19, 28, '', 'seci_sec', NULL, NULL, NULL, '2020-04-08 08:06:05', NULL, NULL, 1),
(980, 19, 29, '', 'seci_name', NULL, NULL, NULL, '2020-04-08 08:06:05', NULL, NULL, 1),
(981, 19, 30, '', 'seci_price', NULL, NULL, NULL, '2020-04-08 08:06:05', NULL, NULL, 1),
(982, 19, 31, '', 'seci_desc', NULL, NULL, NULL, '2020-04-08 08:06:05', NULL, NULL, 1),
(983, 19, 32, '', 'seci_status', NULL, NULL, NULL, '2020-04-08 08:06:05', NULL, NULL, 1),
(984, 19, 33, '', 'order_nav_label', NULL, NULL, NULL, '2020-04-08 08:06:05', NULL, NULL, 1),
(985, 19, 34, '', 'order_label', NULL, NULL, NULL, '2020-04-08 08:06:05', NULL, NULL, 1),
(986, 19, 35, '', 'order_rejected', NULL, NULL, NULL, '2020-04-08 08:06:05', NULL, NULL, 1),
(987, 19, 36, '', 'order_received', NULL, NULL, NULL, '2020-04-08 08:06:05', NULL, NULL, 1),
(988, 19, 37, '', 'order_accepted', NULL, NULL, NULL, '2020-04-08 08:06:05', NULL, NULL, 1),
(989, 19, 38, '', 'order_preparing', 0, NULL, NULL, '2020-04-08 08:06:05', NULL, NULL, 1),
(990, 19, 39, '', 'order_out_delivery', 0, NULL, NULL, '2020-04-08 08:06:05', NULL, NULL, 1),
(991, 19, 40, '', 'order_on_way', 0, NULL, NULL, '2020-04-08 08:06:05', NULL, NULL, 1),
(992, 19, 41, '', 'order_completed', NULL, NULL, NULL, '2020-04-08 08:06:05', NULL, NULL, 1),
(993, 19, 42, '', 'order_canceled', NULL, NULL, NULL, '2020-04-08 08:06:05', NULL, NULL, 1),
(994, 19, 43, '', 'order_rejected_btn', NULL, NULL, NULL, '2020-04-08 08:06:05', NULL, NULL, 1),
(995, 19, 44, '', 'order_received_btn', NULL, NULL, NULL, '2020-04-08 08:06:05', NULL, NULL, 1),
(996, 19, 45, '', 'order_accepted_btn', NULL, NULL, NULL, '2020-04-08 08:06:05', NULL, NULL, 1),
(997, 19, 46, '', 'order_preparing_btn', NULL, NULL, NULL, '2020-04-08 08:06:05', NULL, NULL, 1),
(998, 19, 47, '', 'order_out_delivery_btn', NULL, NULL, NULL, '2020-04-08 08:06:05', NULL, NULL, 1),
(999, 19, 48, '', 'order_on_way_btn', NULL, NULL, NULL, '2020-04-08 08:06:05', NULL, NULL, 1),
(1000, 19, 49, '', 'order_completed_btn', NULL, NULL, NULL, '2020-04-08 08:06:05', NULL, NULL, 1),
(1001, 19, 50, '', 'order_canceled_btn', NULL, NULL, NULL, '2020-04-08 08:06:05', NULL, NULL, 1),
(1002, 19, 51, 'Book Now', 'app_ord_label', NULL, NULL, NULL, '2020-04-08 08:06:05', NULL, NULL, 1),
(1003, 19, 52, '', 'app_ord_quantity', 0, NULL, NULL, '2020-04-08 08:06:05', NULL, NULL, 1),
(1004, 19, 53, '', 'app_ord_address', 1, NULL, NULL, '2020-04-08 08:06:05', NULL, NULL, 1),
(1005, 1, 54, '', 'sec_price', NULL, NULL, NULL, '2020-05-04 16:42:51', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `payment_methods`
--

CREATE TABLE `payment_methods` (
  `id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `description` text NOT NULL,
  `created_user_id` int(11) NOT NULL,
  `updated_user_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '0 = deleted, 1 = Active, 2 = Inactive'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` int(11) NOT NULL,
  `perm_key` varchar(30) NOT NULL,
  `perm_name` varchar(100) NOT NULL,
  `parent_status` varchar(100) DEFAULT 'parent',
  `description` longtext NOT NULL,
  `created_user_id` bigint(20) DEFAULT NULL,
  `updated_user_id` bigint(20) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '0 = deleted, 1 = Active, 2 = Inactive'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `perm_key`, `perm_name`, `parent_status`, `description`, `created_user_id`, `updated_user_id`, `created_at`, `updated_at`, `deleted_at`, `status`) VALUES
(1, 'admin', 'Admin Module', 'parent', '', NULL, NULL, '2019-12-10 16:20:12', NULL, NULL, 1),
(2, 'withdrawal', 'Payment Withdrawal Management', '1', '', NULL, NULL, '2019-12-10 16:22:39', NULL, NULL, 1),
(3, 'vendors_list', 'Vendor Management', '1', '', NULL, NULL, '2019-12-10 16:23:32', NULL, NULL, 1),
(4, 'list_master', 'Listing Master Data Mangement', '1', '', NULL, NULL, '2019-12-10 16:23:58', NULL, NULL, 1),
(5, 'emp', 'Employee Mangement', '1', '', NULL, NULL, '2019-12-10 16:24:39', NULL, NULL, 1),
(6, 'role', 'Role Management', '1', '', NULL, NULL, '2019-12-10 16:24:54', NULL, NULL, 1),
(7, 'site_settings', 'Site Settings', '1', '', NULL, NULL, '2019-12-10 16:25:21', NULL, NULL, 1),
(8, 'slider_settings', 'Slider Settings', '1', '', NULL, NULL, '2019-12-10 16:25:41', NULL, NULL, 1),
(9, 'news_categories', 'News Category Mangement', '1', '', NULL, NULL, '2019-12-10 16:26:06', NULL, NULL, 1),
(20, 'news', 'News Module', 'parent', '', NULL, NULL, '2019-12-10 16:37:36', NULL, '2020-07-07 15:31:24', 1),
(21, 'manage_news', 'Manage News', '20', '', NULL, NULL, '2019-12-10 16:38:41', NULL, NULL, 1),
(33, 'food', 'Manage Account', 'parent', '', NULL, NULL, '2019-12-10 16:43:42', NULL, NULL, 1),
(34, 'food_menu', 'Food Menu Management', '33', '', NULL, NULL, '2019-12-10 16:44:06', NULL, NULL, 1),
(35, 'food_items', 'Food Items Management', '33', '', NULL, NULL, '2019-12-10 16:44:25', NULL, NULL, 1),
(36, 'food_extra_sections', 'Food Extra Section Management', '33', '', NULL, NULL, '2019-12-10 16:44:56', NULL, NULL, 1),
(37, 'food_section_items', 'Food Section Items Management', '33', '', NULL, NULL, '2019-12-10 16:45:27', NULL, NULL, 1),
(38, 'food_settings', 'Food Settings', '33', '', NULL, NULL, '2019-12-10 16:46:02', NULL, NULL, 1),
(39, 'food_orders', 'Food Orders Management', '33', '', NULL, NULL, '2019-12-10 16:46:24', NULL, NULL, 1),
(40, 'food_reports', 'Food Reports', '33', '', NULL, NULL, '2019-12-10 16:46:46', NULL, NULL, 1),
(45, 'order_delivery', 'Order-Delivery', 'parent', '', NULL, NULL, '2020-02-25 14:11:50', NULL, NULL, 1),
(46, 'order_courier', 'Order-Courier', 'parent', '', NULL, NULL, '2020-02-25 14:17:56', NULL, NULL, 1),
(47, 'order_booking', 'Order Booking', 'parent', '', NULL, NULL, '2020-02-26 18:02:47', NULL, NULL, 1),
(48, 'order_selfpickup', 'Order Self Pickup', 'parent', '', NULL, NULL, '2020-02-27 15:55:49', NULL, NULL, 0),
(49, 'leads', 'Leads', 'parent', '', NULL, NULL, '2020-06-29 05:57:54', NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(11) NOT NULL,
  `key` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `value` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `created_user_id` bigint(15) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_user_id` bigint(20) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '0-Deleted 1-Active 2-Inactive'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `key`, `value`, `created_user_id`, `created_at`, `updated_user_id`, `updated_at`, `deleted_at`, `status`) VALUES
(1, 'system_name', 'PWTS', 0, '2019-04-30 15:41:07', 1, '2022-08-26 08:39:06', NULL, 1),
(2, 'system_title', 'Invest you Share', 0, '2019-04-30 15:41:07', 1, '2022-08-26 08:39:06', NULL, 1),
(3, 'address', 'Hyderabad', 0, '2019-04-30 15:41:07', 1, '2022-08-26 08:39:06', NULL, 1),
(4, 'mobile', '8121815502', 0, '2019-04-30 15:41:07', 1, '2022-08-26 08:39:06', NULL, 1),
(5, 'system_email', 'info@gmail.com', 0, '2019-04-30 15:41:07', 1, '2019-10-17 10:36:40', NULL, 1),
(6, 'email_password', '123123', 0, '2019-04-30 15:41:07', 1, '2019-10-17 10:36:40', NULL, 1),
(7, 'sms_username', '123', 0, '2019-04-30 15:41:07', 1, '2019-10-17 10:22:46', NULL, 1),
(8, 'sms_sender', 'TRAI', 0, '2019-04-30 15:41:07', 1, '2019-10-17 10:22:46', NULL, 1),
(9, 'sms_hash', 'HASH', 0, '2019-04-30 15:41:07', 1, '2019-10-17 10:22:46', NULL, 1),
(10, 'privacy', '<h1 style=\"text-align: center;\"><span style=\"color:#008000\"><u><span style=\"font-size:22px\"><span style=\"font-family:lucida sans unicode,lucida grande,sans-serif\"><var><strong><em>MyPulse</em></strong></var></span></span></u></span></h1>\r\n', 0, '2019-04-30 15:41:07', NULL, '0000-00-00 00:00:00', NULL, 1),
(11, 'terms', '<p>hi this is for testing</p>\r\n', 0, '2019-04-30 15:41:07', NULL, '0000-00-00 00:00:00', NULL, 1),
(12, 'facebook', 'https://www.facebook.com/', 0, '2019-07-22 14:05:08', 1, '2022-08-26 08:39:06', NULL, 1),
(13, 'twiter', 'https://www.twiter.com/', 0, '2019-07-22 14:05:08', 1, '2022-08-26 08:39:06', NULL, 1),
(14, 'youtube', 'https://www.youtube.com/', 0, '2019-07-22 14:05:08', 1, '2022-08-26 08:39:06', NULL, 1),
(15, 'skype', 'http://skype.com/', 0, '2019-10-16 09:49:33', 1, '2022-08-26 08:39:06', NULL, 1),
(16, 'pinterest', 'http://pinterest.com/', 0, '2019-10-16 09:50:50', 1, '2022-08-26 08:39:06', NULL, 1),
(17, 'smtp_port', '587', 0, '2019-10-16 11:06:00', 1, '2020-06-12 19:12:40', NULL, 1),
(18, 'smtp_host', 'smtp.hostinger.in', 0, '2019-10-16 11:06:00', 1, '2020-06-12 19:12:40', NULL, 1),
(19, 'smtp_username', 'info@integritysoftsolutions.in', 0, '2019-10-16 11:06:42', 1, '2020-06-12 19:12:40', NULL, 1),
(20, 'smtp_password', 'Integritysoftsolutions@123', 0, '2019-10-16 11:06:42', 1, '2020-06-12 19:12:40', NULL, 1),
(21, 'pay_per_vendor', '10', 0, '2019-12-04 15:21:36', 1, '2019-12-27 16:13:47', NULL, 1),
(22, 'vendor_validation', '1500', 0, '2019-12-04 15:21:36', 1, '2019-12-27 16:13:47', NULL, 1),
(23, 'pay_per_order', '10', 0, '2020-03-30 09:20:04', NULL, NULL, NULL, 1),
(24, 'order_validation', '100', 0, '2020-03-30 09:20:14', NULL, NULL, NULL, 1),
(25, 'google_api_key', 'AIzaSyD_6d-CD-H_C09XPJ2V4PFTTv-szusSKmg', 0, '2020-09-15 00:53:59', NULL, NULL, NULL, 1),
(26, 'otplogin', '1', 0, '2020-09-20 08:44:13', NULL, NULL, NULL, 1),
(27, 'delivery_range', '10', 0, '2020-09-22 02:52:27', NULL, NULL, NULL, 1),
(28, 'vendor_range', '5', 0, '2020-09-22 02:52:27', NULL, NULL, NULL, 1),
(29, 'app_notification_status', '0', 0, '2020-09-22 02:52:27', NULL, NULL, NULL, 1),
(30, 'app_notification', ' Starting From 01-10-2020', 0, '2020-09-22 02:52:27', NULL, NULL, NULL, 1),
(31, 'app_version', '0.1', 0, '2020-09-22 02:52:27', NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `social`
--

CREATE TABLE `social` (
  `id` bigint(20) NOT NULL,
  `list_id` bigint(20) NOT NULL,
  `url` varchar(250) NOT NULL,
  `type` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1 = facebook, 2 = twitter, 3 = instagram, 4 = website',
  `created_user_id` bigint(20) DEFAULT NULL,
  `updated_user_id` bigint(20) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '0 = deleted, 1 = Active, 2 = Inactive'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `social_auth`
--

CREATE TABLE `social_auth` (
  `id` bigint(20) NOT NULL,
  `unique_id` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `auth_id` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `auth_token` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `mail` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `unique_id` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `salt` varchar(255) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `wallet` decimal(14,2) NOT NULL,
  `activation_code` varchar(40) DEFAULT NULL,
  `forgotten_password_code` varchar(40) DEFAULT NULL,
  `forgotten_password_time` int(11) UNSIGNED DEFAULT NULL,
  `remember_code` varchar(40) DEFAULT NULL,
  `created_on` int(11) UNSIGNED NOT NULL,
  `last_login` int(11) UNSIGNED DEFAULT NULL,
  `active` tinyint(1) UNSIGNED DEFAULT 1,
  `list_id` bigint(20) NOT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `created_user_id` bigint(20) DEFAULT NULL,
  `updated_user_id` bigint(20) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '0 = deleted, 1 = Active, 2 = Inactive'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `ip_address`, `username`, `unique_id`, `password`, `salt`, `email`, `wallet`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `list_id`, `first_name`, `last_name`, `company`, `phone`, `created_user_id`, `updated_user_id`, `created_at`, `updated_at`, `deleted_at`, `status`) VALUES
(1, '192.168.1.28', 'administrator', 'NCA0101', '$2y$08$pu1H.lRnZpAdIFyJfqHRuuraA1ORbGdTjHVJXb4.vcjYBnGVs7SGq', '', 'admin@admin.com', '0.00', '', 'k2XbH2mOA7h8g9wQ2EdRHe36a51b7bfacd0a67f2', 1604757210, NULL, 1268889823, 1688707122, 1, 0, 'Mahesh', 'BT', 'ADMIN', '2134657895', NULL, 1, '2019-09-20 16:59:05', '2021-12-22 11:49:18', NULL, 1),
(2, '223.238.24.242', '8121815502', 'NCU0001', '$2y$08$r95eePlGtOKynIhCV8hnKuMt.a7qnqNEsMUD3ShWFT86.ksnpFbUO', NULL, '', '0.00', NULL, NULL, NULL, NULL, 1601109504, NULL, 1, 0, NULL, NULL, NULL, '8121815502', NULL, NULL, '2020-09-26 08:38:24', NULL, NULL, 1),
(3, '146.196.36.39', 'NCV0001', 'NCV0001', '$2y$08$pu1H.lRnZpAdIFyJfqHRuuraA1ORbGdTjHVJXb4.vcjYBnGVs7SGq', NULL, 'punjabidhaba@flymengo.com', '0.00', NULL, NULL, NULL, NULL, 1601450366, 1622533332, 1, 0, 'punjabi dhaba', NULL, NULL, NULL, NULL, NULL, '2020-09-30 07:19:26', NULL, NULL, 1),
(4, '157.48.183.22', '7036375558', 'NCU0002', '$2y$08$IPnqLx.y3JVV6HOguc5EneweGhqo6sZB2Vvx2K9A62t2Cp3AIsx2m', NULL, '', '0.00', NULL, NULL, NULL, NULL, 1608395436, NULL, 1, 0, NULL, NULL, NULL, '7036375558', NULL, NULL, '2020-12-19 16:30:36', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `users_groups`
--

CREATE TABLE `users_groups` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `group_id` mediumint(8) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users_groups`
--

INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 2, 20),
(4, 3, 17),
(5, 4, 20);

-- --------------------------------------------------------

--
-- Table structure for table `users_permissions`
--

CREATE TABLE `users_permissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `perm_id` int(11) NOT NULL,
  `value` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 = Deny, 1 = Allow',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users_permissions`
--

INSERT INTO `users_permissions` (`id`, `user_id`, `perm_id`, `value`, `created_at`, `updated_at`) VALUES
(21, 1, 34, 1, 0, 0),
(22, 1, 35, 1, 0, 0),
(23, 1, 36, 1, 0, 0),
(24, 1, 37, 1, 0, 0),
(25, 1, 38, 1, 0, 0),
(26, 1, 39, 1, 0, 0),
(27, 1, 40, 1, 0, 0),
(28, 1, 33, 1, 0, 0),
(29, 1, 45, 1, 0, 0),
(30, 1, 48, 1, 0, 0),
(31, 3, 34, 1, 0, 0),
(32, 3, 35, 1, 0, 0),
(33, 3, 36, 1, 0, 0),
(34, 3, 37, 1, 0, 0),
(35, 3, 38, 1, 0, 0),
(36, 3, 39, 1, 0, 0),
(37, 3, 40, 1, 0, 0),
(38, 3, 33, 1, 0, 0),
(39, 3, 45, 1, 0, 0),
(40, 3, 48, 1, 0, 0),
(41, 3, 49, 1, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `wallet_transactions`
--

CREATE TABLE `wallet_transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` enum('CREDIT','DEBIT','REFUND','DEDUCT') NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `cash` decimal(14,2) NOT NULL,
  `balance` decimal(14,2) NOT NULL,
  `txn_id` varchar(50) NOT NULL,
  `bank_txn_id` varchar(25) NOT NULL,
  `order_id` varchar(50) NOT NULL,
  `resp_msg` varchar(200) NOT NULL,
  `bank_name` varchar(100) DEFAULT NULL,
  `description` varchar(255) NOT NULL COMMENT 'note',
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0 = Pending, 1 = Success, 2 = Failed',
  `paytm` varchar(15) DEFAULT NULL,
  `bank_id` bigint(20) DEFAULT NULL,
  `upi` varchar(25) DEFAULT NULL,
  `payment_reference` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `id` int(11) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `list_id` bigint(20) NOT NULL,
  `created_user_id` bigint(20) DEFAULT NULL,
  `updated_user_id` bigint(20) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `advertisements`
--
ALTER TABLE `advertisements`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `app_sliders`
--
ALTER TABLE `app_sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bank_details`
--
ALTER TABLE `bank_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `groups_permissions`
--
ALTER TABLE `groups_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roleID_2` (`group_id`,`perm_id`);

--
-- Indexes for table `login_attempts`
--
ALTER TABLE `login_attempts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `manage_account`
--
ALTER TABLE `manage_account`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `manage_account_names`
--
ALTER TABLE `manage_account_names`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_methods`
--
ALTER TABLE `payment_methods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permKey` (`perm_key`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `social`
--
ALTER TABLE `social`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `social_auth`
--
ALTER TABLE `social_auth`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users_groups`
--
ALTER TABLE `users_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uc_users_groups` (`user_id`,`group_id`),
  ADD KEY `fk_users_groups_users1_idx` (`user_id`),
  ADD KEY `fk_users_groups_groups1_idx` (`group_id`);

--
-- Indexes for table `users_permissions`
--
ALTER TABLE `users_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `userID` (`user_id`,`perm_id`);

--
-- Indexes for table `wallet_transactions`
--
ALTER TABLE `wallet_transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `users_id` (`user_id`);

--
-- Indexes for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `advertisements`
--
ALTER TABLE `advertisements`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `app_sliders`
--
ALTER TABLE `app_sliders`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `bank_details`
--
ALTER TABLE `bank_details`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `groups`
--
ALTER TABLE `groups`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `groups_permissions`
--
ALTER TABLE `groups_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=530;

--
-- AUTO_INCREMENT for table `login_attempts`
--
ALTER TABLE `login_attempts`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `manage_account`
--
ALTER TABLE `manage_account`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `manage_account_names`
--
ALTER TABLE `manage_account_names`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1006;

--
-- AUTO_INCREMENT for table `payment_methods`
--
ALTER TABLE `payment_methods`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `social`
--
ALTER TABLE `social`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `social_auth`
--
ALTER TABLE `social_auth`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users_groups`
--
ALTER TABLE `users_groups`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users_permissions`
--
ALTER TABLE `users_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `wallet_transactions`
--
ALTER TABLE `wallet_transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
