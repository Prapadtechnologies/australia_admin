-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 28, 2023 at 10:06 AM
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
(1, 'download (2).jpg', 'jpg', 1, NULL, '2020-07-27 12:57:45', NULL, '2023-08-18 10:08:19', 1),
(2, 'to_slider_covidheaderupdate.jpg', 'jpg', 1, NULL, '2020-07-27 12:57:54', NULL, '2023-08-18 10:08:23', 1),
(3, 'download.jpg', 'jpg', 1, NULL, '2020-07-27 12:58:02', NULL, '2023-08-18 10:08:28', 1),
(4, 'veg-1.jpeg', 'jpeg', 1, NULL, '2020-07-27 12:58:10', NULL, '2023-08-18 10:08:32', 1),
(5, '5ce5233969cb3.jpeg', 'jpeg', 1, NULL, '2020-07-27 12:58:33', NULL, '2023-08-18 10:08:36', 1),
(6, '10.jpg', 'jpg', 100240, NULL, '2020-09-11 18:24:15', NULL, '2022-08-26 08:26:28', 1),
(7, '10.jpg', 'jpg', 100240, NULL, '2020-09-11 18:28:22', NULL, '2023-08-18 10:08:41', 1),
(8, 'Why-do-you-need-savings-and-investment-plans.jpg', 'jpg', 1, NULL, '2023-08-18 10:08:57', NULL, NULL, 1),
(9, 'top-5-financial-advice-to-invest-and-save-money-717x404.webp', 'webp', 1, NULL, '2023-08-18 10:09:06', NULL, NULL, 1),
(10, 'Invest-to-get-return.webp', 'webp', 1, NULL, '2023-08-18 10:09:15', NULL, NULL, 1),
(11, 'BEST-HIGH-RETURN-INVESTMENT-PLANS-1.png', 'png', 1, NULL, '2023-08-18 10:09:24', NULL, NULL, 1),
(12, 'investment.jpg', 'jpg', 1, NULL, '2023-08-18 10:09:35', NULL, NULL, 1);

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
(20, 'user', 'User', 'DGU', 48, 6, '', '', 1, NULL, '2020-03-21 07:01:09', '2023-08-22 12:43:51', NULL, 1);

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
-- Table structure for table `plans`
--

CREATE TABLE `plans` (
  `id` bigint(20) NOT NULL,
  `plan_name` varchar(200) NOT NULL,
  `plan_duration` int(11) NOT NULL,
  `min_amount` int(11) NOT NULL,
  `interest` int(11) NOT NULL,
  `interest_for` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '0 = deleted, 1 = Active, 2 = Inactive'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `plans`
--

INSERT INTO `plans` (`id`, `plan_name`, `plan_duration`, `min_amount`, `interest`, `interest_for`, `created_at`, `updated_at`, `deleted_at`, `status`) VALUES
(1, 'Plan 1', 30, 5000, 3, 30, '2023-08-18 08:53:15', NULL, NULL, 1),
(2, 'Plan test', 40, 6000, 4, 90, '2023-08-18 09:15:46', NULL, NULL, 1),
(3, 'Plan 11', 45, 5000, 5, 90, '2023-08-18 09:16:25', NULL, NULL, 1);

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
(1, 'system_name', 'Daily Grows', 0, '2019-04-30 15:41:07', 1, '2023-08-18 12:36:36', NULL, 1),
(2, 'system_title', 'People Investments', 0, '2019-04-30 15:41:07', 1, '2023-08-18 12:36:36', NULL, 1),
(3, 'address', 'Hyderabad', 0, '2019-04-30 15:41:07', 1, '2023-08-18 12:36:36', NULL, 1),
(4, 'mobile', '8121815439', 0, '2019-04-30 15:41:07', 1, '2023-08-18 12:36:36', NULL, 1),
(5, 'system_email', 'info@gmail.com', 0, '2019-04-30 15:41:07', 1, '2019-10-17 10:36:40', NULL, 1),
(6, 'email_password', '123123', 0, '2019-04-30 15:41:07', 1, '2019-10-17 10:36:40', NULL, 1),
(7, 'sms_username', '123', 0, '2019-04-30 15:41:07', 1, '2019-10-17 10:22:46', NULL, 1),
(8, 'sms_sender', 'TRAI', 0, '2019-04-30 15:41:07', 1, '2019-10-17 10:22:46', NULL, 1),
(9, 'sms_hash', 'HASH', 0, '2019-04-30 15:41:07', 1, '2019-10-17 10:22:46', NULL, 1),
(10, 'privacy', '<h1 style=\"text-align: center;\"><span style=\"color:#008000\"><u><span style=\"font-size:22px\"><span style=\"font-family:lucida sans unicode,lucida grande,sans-serif\"><var><strong><em>MyPulse</em></strong></var></span></span></u></span></h1>\r\n', 0, '2019-04-30 15:41:07', NULL, '0000-00-00 00:00:00', NULL, 1),
(11, 'terms', '<p>hi this is for testing</p>\r\n', 0, '2019-04-30 15:41:07', NULL, '0000-00-00 00:00:00', NULL, 1),
(12, 'facebook', 'https://www.facebook.com/', 0, '2019-07-22 14:05:08', 1, '2023-08-18 12:36:36', NULL, 1),
(13, 'twiter', 'https://www.twiter.com/', 0, '2019-07-22 14:05:08', 1, '2023-08-18 12:36:36', NULL, 1),
(14, 'youtube', 'https://www.youtube.com/', 0, '2019-07-22 14:05:08', 1, '2023-08-18 12:36:36', NULL, 1),
(15, 'skype', 'http://skype.com/', 0, '2019-10-16 09:49:33', 1, '2023-08-18 12:36:36', NULL, 1),
(16, 'pinterest', 'http://pinterest.com/', 0, '2019-10-16 09:50:50', 1, '2023-08-18 12:36:36', NULL, 1),
(17, 'smtp_port', '587', 0, '2019-10-16 11:06:00', 1, '2023-08-19 18:28:00', NULL, 1),
(18, 'smtp_host', 'smtp.hostinger.in', 0, '2019-10-16 11:06:00', 1, '2023-08-19 18:28:00', NULL, 1),
(19, 'smtp_username', 'info@prapadtechnologies.com', 0, '2019-10-16 11:06:42', 1, '2023-08-19 18:28:00', NULL, 1),
(20, 'smtp_password', 'Prapad@123', 0, '2019-10-16 11:06:42', 1, '2023-08-19 18:28:00', NULL, 1),
(21, 'pay_per_referal', '11', 0, '2019-12-04 15:21:36', 1, '2023-08-21 12:27:58', NULL, 1),
(22, 'commission_on_withdraw', '3', 0, '2019-12-04 15:21:36', 1, '2023-08-21 12:27:58', NULL, 1),
(23, 'withdraw_days', '4', 0, '2020-03-30 09:20:04', 1, '2023-08-21 12:27:58', NULL, 1),
(24, 'min_withdraw', '500', 0, '2020-03-30 09:20:14', 1, '2023-08-21 12:27:58', NULL, 1),
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
  `referal_id` int(11) DEFAULT NULL,
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

INSERT INTO `users` (`id`, `referal_id`, `ip_address`, `username`, `unique_id`, `password`, `salt`, `email`, `wallet`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `list_id`, `first_name`, `last_name`, `company`, `phone`, `created_user_id`, `updated_user_id`, `created_at`, `updated_at`, `deleted_at`, `status`) VALUES
(1, NULL, '192.168.1.28', 'administrator', 'NCA0101', '$2y$08$pu1H.lRnZpAdIFyJfqHRuuraA1ORbGdTjHVJXb4.vcjYBnGVs7SGq', '', 'admin@admin.com', '9899.88', '', 'k2XbH2mOA7h8g9wQ2EdRHe36a51b7bfacd0a67f2', 1604757210, NULL, 1268889823, 1693202138, 1, 0, 'Mahesh', 'BT', 'ADMIN', '2134657895', NULL, NULL, '2019-09-20 16:59:05', '2023-08-23 08:11:03', NULL, 1),
(14, NULL, '::1', 'mahi123@g.com', 'DGU0028', '$2y$08$EdOYdt9KN9MoPCqccIhse.tNI5SA9P4auMNzjF6aS6zUq9PFhrp5C', NULL, 'mahi123@g.com', '0.00', NULL, NULL, NULL, NULL, 1692449564, NULL, 1, 0, 'mahesh', NULL, NULL, '123456789', NULL, NULL, '2023-08-19 18:22:44', '2023-08-23 08:11:03', NULL, 1),
(15, NULL, '::1', 'mahi@g.com', 'DGU0029', '$2y$08$wQ6XLD4RXbHjfPzIiHk01OTMh7DxMSpXcYuOwS5YPsFMUjHXU.P6W', NULL, 'mahi@g.com', '0.00', NULL, NULL, NULL, NULL, 1692449648, NULL, 1, 0, 'mahesh', NULL, NULL, '123456789', NULL, NULL, '2023-08-19 18:24:08', '2023-08-23 08:11:03', NULL, 1),
(16, NULL, '::1', 'mahi1@g.com', 'DGU0030', '$2y$08$5nxVdWXBUykrS0pQZG7Da.3W00CR9TT8xdTlVxL2myhX.b4Jwermy', NULL, 'mahi1@g.com', '0.00', 'd8cbd1bc44d12884f215e3eaac24f78ee91e6f2d', NULL, NULL, NULL, 1692449768, NULL, 0, 0, 'mahesh', NULL, NULL, '123456789', NULL, NULL, '2023-08-19 18:26:08', '2023-08-23 08:11:03', NULL, 1),
(17, NULL, '::1', 'mahi12@g.com', 'DGU0032', '$2y$08$2x9W7h3y1NUg.q80sOq1re0yOfftj..jpGr2sNGe.ltIIGeGf0QwS', NULL, 'mahi12@g.com', '0.00', '10b24b9cdab8411bbdfa048a906b735bb28de3f1', NULL, NULL, NULL, 1692449854, NULL, 0, 0, 'mahesh', NULL, NULL, '123456789', NULL, NULL, '2023-08-19 18:27:34', '2023-08-23 08:11:03', NULL, 1),
(18, NULL, '::1', 'mahi1234@g.com', 'DGU0034', '$2y$08$BJExE9WzZH4LPkQPincQ2ukZIUikZ95WMqJsZUThw2UafzqAwuTEe', NULL, 'mahi1234@g.com', '0.00', 'da7048fc6b009c736b6c32655ed16d65f0b3523a', NULL, NULL, NULL, 1692449896, 1692450093, 1, 0, 'mahesh', NULL, NULL, '123456789', NULL, NULL, '2023-08-19 18:28:16', '2023-08-23 08:11:03', NULL, 1),
(19, NULL, '::1', 'maheshb1t8@gmail.com', 'DGU0035', '$2y$08$TTCvvhUhs1fKPH.Ht5f2TOfzrDF26SPWHbNcOcwFWJ2VA7qBc/xR2', NULL, 'maheshb1t8@gmail.com', '0.00', '34443841c6b92d53bf4e9347808adabbffb121f5', NULL, NULL, NULL, 1692449948, 1692450113, 1, 0, 'mahesh', NULL, NULL, '123456789', NULL, NULL, '2023-08-19 18:29:08', '2023-08-23 08:11:03', NULL, 1),
(20, NULL, '::1', 'maheshb2t8@gmail.com', 'DGU0037', '$2y$08$LNuPvITaPirEyidX6XSBI.ay6EvJ6yG4jnlFFS6GzHBzf5AcCY8Ee', NULL, 'maheshbt28@gmail.com', '0.00', NULL, NULL, NULL, NULL, 1692451045, NULL, 1, 0, 'mahesh', NULL, NULL, '123456789', NULL, NULL, '2023-08-19 18:47:25', '2023-08-23 08:11:03', NULL, 1),
(21, NULL, '::1', 'maheshb2t8@gmail.com', 'DGU0039', '$2y$08$3HNGHpzEDgwZHz9D5EoxZec31zN3F9oCg.q7fo025tvra4VjqXRYi', NULL, 'maheshbt18@gmail.com', '0.00', NULL, NULL, NULL, NULL, 1692451538, NULL, 1, 0, 'mahesh', NULL, NULL, '123456789', NULL, NULL, '2023-08-19 18:55:38', '2023-08-23 08:11:03', NULL, 1),
(22, NULL, '::1', 'maheshbt8@gmail.com', 'DGU0041', '$2y$08$p3wFtuljCL7qJOjY5Vq8EerWeKW.QXL/kDR6GdF7URvU1oA4BcL.O', NULL, 'maheshbt38@gmail.com', '0.00', NULL, NULL, NULL, NULL, 1692451668, NULL, 1, 0, 'mahesh', NULL, NULL, '123456789', NULL, NULL, '2023-08-19 18:57:48', '2023-08-23 08:11:03', NULL, 1),
(23, NULL, '::1', 'maheshbt8@gmail.com', 'DGU0042', '$2y$08$A8x8m1HwWq9KoKYTuLPemeOoefN77GcooFOZIePglDqLAWEitybGO', NULL, 'sss@gmail.com', '0.00', NULL, NULL, NULL, NULL, 1692451840, NULL, 1, 0, 'mahesh', NULL, NULL, '123456789', NULL, NULL, '2023-08-19 19:00:40', '2023-08-23 08:11:03', NULL, 1),
(24, NULL, '::1', 'maheshbt8@gmail.com', 'DGU0043', '$2y$08$dgrLBANpOt..vVesVMJoLexjFZLpvpdK5CYTKTvc9kOafg/Lqb9qi', NULL, 'mahessshbt8s@gmail.com', '0.00', NULL, NULL, NULL, NULL, 1692452065, NULL, 1, 0, 'mahesh', NULL, NULL, '123456789', NULL, NULL, '2023-08-19 19:04:25', '2023-08-23 08:11:03', NULL, 1),
(25, NULL, '::1', 'maheshbt8@gmail.com', 'DGU0044', '$2y$08$42oyrABrReieHgDso0VPC.YDrFGB4eMzeYopQsvneTd0TJ1PkiFkS', NULL, 'dd', '0.00', NULL, NULL, NULL, NULL, 1692452258, NULL, 1, 0, 'mahesh', NULL, NULL, '123456789', NULL, NULL, '2023-08-19 19:07:38', '2023-08-23 08:11:03', NULL, 1),
(26, NULL, '::1', 'maheshbt8@gmail.com', 'DGU0045', '$2y$08$RWTeouMq5mA/ItW5ApIl9eLMqBvwF7qDEqS4KE4TnD9uvfriSy8cq', NULL, 'maheshbtss8@gmail.com', '0.00', NULL, NULL, NULL, NULL, 1692452330, 1692678522, 1, 0, 'mahesh', NULL, NULL, '123456789', NULL, NULL, '2023-08-19 19:08:50', '2023-08-23 08:11:03', NULL, 1),
(27, NULL, '::1', 'maheshbt81@gmail.com', 'DGU0046', '$2y$08$AIGHJCsTb.jNr4k6Z3wPbu5oEg5Y4fQSQ2EcF0WNQODsK3IFSDP8e', NULL, 'maheshbt81@gmail.com', '0.00', NULL, NULL, NULL, NULL, 1692603305, NULL, 1, 0, 'mahesh', NULL, NULL, '123456789', NULL, NULL, '2023-08-21 13:05:05', '2023-08-23 08:11:03', NULL, 1),
(28, NULL, '::1', 'maheshbt8@gmail.com', 'DGU0047', '$2y$08$Lqw.ST8OAlRSuo7CiCRsdO1OIOQmMKy521N/pu/cMcKucvUrTu3Nm', NULL, 'maheshbt8@gmail.com', '0.00', NULL, NULL, NULL, NULL, 1692679169, NULL, 1, 0, 'mahesh', NULL, NULL, '', NULL, NULL, '2023-08-22 10:09:29', '2023-08-23 08:11:03', NULL, 1),
(29, NULL, '::1', 'test1@gmail.com', 'DGU0048', '$2y$08$S7o6jSI6tqXpoyRwKoxjUOHFhu5O2eTJJCUdFyA2Z8PGfAQgHCUa6', NULL, 'test1@gmail.com', '0.00', NULL, NULL, NULL, NULL, 1692688431, 1692758974, 1, 0, 'mahesh', NULL, NULL, '', NULL, NULL, '2023-08-22 12:43:51', '2023-08-23 08:11:03', NULL, 1);

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
(29, 14, 20),
(30, 15, 20),
(31, 16, 20),
(32, 17, 20),
(33, 18, 20),
(34, 19, 20),
(35, 20, 20),
(36, 21, 20),
(37, 22, 20),
(38, 23, 20),
(39, 24, 20),
(40, 25, 20),
(41, 26, 20),
(42, 27, 20),
(43, 28, 20),
(44, 29, 20);

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
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `transaction_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `credit` decimal(24,3) NOT NULL DEFAULT 0.000,
  `debit` decimal(24,3) NOT NULL DEFAULT 0.000,
  `admin_bonus` decimal(24,3) NOT NULL DEFAULT 0.000,
  `balance` decimal(24,3) NOT NULL DEFAULT 0.000,
  `transaction_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wallet_transactions`
--

INSERT INTO `wallet_transactions` (`id`, `user_id`, `transaction_id`, `credit`, `debit`, `admin_bonus`, `balance`, `transaction_type`, `reference`, `title`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, '8367122e-07a9-4d5b-ad38-422f349ced0e', '50.000', '0.000', '0.000', '50.000', 'referrer', '+918109058870', 'Testing', '2022-11-10 16:45:01', '2022-11-10 16:45:01', NULL),
(2, 1, '63bbebfa-ec85-4773-a05d-e42430b676ab', '50.000', '0.000', '0.000', '100.000', 'referrer', '+916268488922', 'Testing', '2022-11-11 10:22:47', '2022-11-11 10:22:47', NULL),
(3, 1, 'adc486dd-0c75-4800-b1a6-b9d7f97e1bff', '0.000', '100.000', '0.000', '0.000', 'order_place', '100030', 'Testing', '2022-11-11 10:27:12', '2022-11-11 10:27:12', NULL),
(4, 1, '2729732f-1f7f-4a16-8657-7afaa86912c3', '50.000', '0.000', '0.000', '50.000', 'referrer', '+917987508246', 'Testing', '2022-11-11 10:35:44', '2022-11-11 10:35:44', NULL),
(5, 1, '8c4259c5-5a38-4b21-a455-09631af4f65a', '50.000', '0.000', '0.000', '100.000', 'referrer', '+916261781570', 'Testing', '2022-11-12 08:50:03', '2022-11-12 08:50:03', NULL),
(6, 1, '5baba422-bdc3-45d3-b461-54215f60479d', '50.000', '0.000', '0.000', '150.000', 'referrer', '+916261725647', 'Testing', '2022-11-12 09:57:38', '2022-11-12 09:57:38', NULL),
(7, 1, '27148c9e-6f15-4c10-aa11-d0bceefdaebd', '50.000', '0.000', '0.000', '50.000', 'referrer', '+917828637117', 'Testing', '2022-11-12 10:58:07', '2022-11-12 10:58:07', NULL),
(8, 1, 'd6ee9c10-7676-44b2-ae7c-78adbeab96c9', '50.000', '0.000', '0.000', '200.000', 'referrer', '+917999920620', 'Testing', '2022-11-12 11:27:51', '2022-11-12 11:27:51', NULL),
(9, 1, '7b785993-cd8f-4bcc-9110-79d12f2f07de', '50.000', '0.000', '0.000', '250.000', 'referrer', '+919098883411', 'Testing', '2022-11-12 11:50:37', '2022-11-12 11:50:37', NULL),
(10, 1, '02bf1f45-a472-47e7-ad18-119569b4b4e7', '50.000', '0.000', '0.000', '300.000', 'referrer', '+916266902689', 'Testing', '2022-11-12 12:00:55', '2022-11-12 12:00:55', NULL),
(11, 1, '5e2ec39a-95ae-4149-b8aa-f49380d35ba0', '50.000', '0.000', '0.000', '50.000', 'referrer', '+918103003813', 'Testing', '2022-11-12 12:12:48', '2022-11-12 12:12:48', NULL),
(12, 1, '0e83a9a6-c91a-4483-9ab7-9e0002f14cdd', '50.000', '0.000', '0.000', '100.000', 'referrer', '+917974876455', 'Testing', '2022-11-12 12:24:48', '2022-11-12 12:24:48', NULL),
(13, 1, 'ffe61499-8b34-47eb-b893-0ab1341ac197', '0.000', '300.000', '0.000', '0.000', 'order_place', '100008', 'Testing', '2022-11-12 12:47:53', '2022-11-12 12:47:53', NULL),
(14, 1, '323a2326-f539-4b8a-ba9e-3c9e6df68081', '50.000', '0.000', '0.000', '50.000', 'referrer', '+917067405308', 'Testing', '2022-11-12 12:51:18', '2022-11-12 12:51:18', NULL),
(15, 1, 'fca532ef-d436-4fe8-a2d4-9469dd238a46', '50.000', '0.000', '0.000', '150.000', 'referrer', '+917987466875', 'Testing', '2022-11-12 13:08:44', '2022-11-12 13:08:44', NULL),
(16, 1, '42641443-d95d-466d-b279-7524aac84320', '50.000', '0.000', '0.000', '50.000', 'referrer', '+919981178349', 'Testing', '2022-11-12 14:11:45', '2022-11-12 14:11:45', NULL),
(17, 1, 'fe0d0ce4-76cd-4110-800d-a5097319d5bf', '50.000', '0.000', '0.000', '100.000', 'referrer', '+919343638664', 'Testing', '2022-11-12 15:09:18', '2022-11-12 15:09:18', NULL),
(18, 1, 'e34ba470-a56d-46fa-a06f-51387200ad3d', '10.000', '0.000', '0.000', '60.000', 'referrer', '+918120503449', 'Testing', '2022-11-14 14:34:19', '2022-11-14 14:34:19', NULL),
(19, 1, 'c5ff7ba8-22c9-4e09-b69c-8e06e2a7bc2c', '10.000', '0.000', '0.000', '160.000', 'referrer', '+916264599104', 'Testing', '2022-11-20 12:39:43', '2022-11-20 12:39:43', NULL),
(20, 1, 'ac867b1e-f53c-475a-85b3-514ce679ff7f', '0.000', '150.000', '0.000', '10.000', 'order_place', '100121', 'Testing', '2022-11-20 17:21:09', '2022-11-20 17:21:09', NULL),
(21, 1, '68083609-2233-4347-a24a-681c19b459a1', '10.000', '0.000', '0.000', '10.000', 'referrer', '+917067791667', 'Testing', '2022-12-07 12:47:35', '2022-12-07 12:47:35', NULL),
(22, 1, 'a1e2f0d4-208a-492f-aeb3-03f1f8507167', '10.000', '0.000', '0.000', '20.000', 'referrer', '+919589736702', 'Testing', '2022-12-08 12:54:59', '2022-12-08 12:54:59', NULL),
(23, 1, '147755e8-4ad3-487c-8dfc-069deab4369d', '10.000', '0.000', '0.000', '10.000', 'referrer', '+919630610870', 'Testing', '2022-12-08 22:23:04', '2022-12-08 22:23:04', NULL),
(24, 1, 'cca049ba-de3b-4341-883e-82679b8644d9', '400.000', '0.000', '0.000', '400.000', 'add_fund_by_admin', NULL, 'Testing', '2023-04-10 15:43:43', '2023-04-10 15:43:43', NULL),
(25, 1, 'e9051edb-18ef-456c-99c1-685adf8fbeeb', '50.000', '0.000', '0.000', '50.000', 'add_fund_by_admin', 'ref 33455676878', 'Testing', '2023-04-14 18:20:48', '2023-04-14 18:20:48', NULL),
(26, 1, '267a810d-4456-4b74-b57d-69a691958a75', '0.000', '44.000', '0.000', '6.000', 'order_place', '100484', 'Testing', '2023-04-14 18:24:26', '2023-04-14 18:24:26', NULL),
(27, 1, 'b89a6174-bc42-4718-8aa3-c3fdf7f75027', '44.000', '0.000', '0.000', '50.000', 'withdrawal', '100484', 'Testing', '2023-04-14 18:25:00', '2023-04-14 18:25:00', NULL),
(28, 1, '1ea168b2-7934-40f5-96c2-1d13c2332c65', '10.000', '0.000', '0.000', '410.000', 'add_fund_by_admin', NULL, 'Testing', '2023-05-06 10:49:32', '2023-05-06 10:49:32', NULL),
(29, 1, '13ac67d6-060f-42c6-b8d8-4b97fdc74960', '10.000', '0.000', '0.000', '10.000', 'referrer', '+919039909500', 'Testing', '2023-05-24 18:12:59', '2023-05-24 18:12:59', NULL),
(30, 1, 'caeace89-ffe3-4ca5-a56b-fd799758fc87', '10.000', '0.000', '0.000', '10.000', 'referrer', '+918918763488', 'Testing', '2023-05-30 20:06:47', '2023-05-30 20:06:47', NULL),
(31, 1, 'eab93183-89c6-4e4b-9eb5-2d1164e610bf', '10.000', '0.000', '0.000', '10.000', 'referrer', '+917470330696', 'Testing', '2023-06-17 19:49:18', '2023-06-17 19:49:18', NULL),
(32, 1, '274d3169-d495-4cb7-a897-9ca39c49f4f0', '10.000', '0.000', '0.000', '10.000', 'referrer', '+919669910400', 'Testing', '2023-06-21 21:21:40', '2023-06-21 21:21:40', NULL),
(33, 1, '6f6d3666-2f32-4cf3-bdda-d339f55df2ac', '10.000', '0.000', '0.000', '20.000', 'referrer', '+918962266654', 'Testing', '2023-07-03 16:50:31', '2023-07-03 16:50:31', NULL),
(34, 1, 'd15de5aa-81c6-4801-837d-f2e120e5caaf', '10.000', '0.000', '0.000', '30.000', 'referrer', '+916307537269', 'Testing', '2023-07-04 13:37:18', '2023-07-04 13:37:18', NULL),
(35, 1, 'f7e9597e-5089-4a76-ac0a-3f4f7cbd5700', '10.000', '0.000', '0.000', '10.000', 'referrer', '+919755747636', 'Testing', '2023-07-05 15:40:11', '2023-07-05 15:40:11', NULL),
(36, 1, '753c0328-9b0a-4e1f-bf3c-f9ba91dd69eb', '10.000', '0.000', '0.000', '10.000', 'referrer', '+918518997748', 'Testing', '2023-07-15 17:07:44', '2023-07-15 17:07:44', NULL),
(37, 1, '35b040d6-00f4-4569-9a17-1dcd82fffdd8', '250000.000', '0.000', '0.000', '250050.000', 'add_fund_by_admin', NULL, 'Testing', '2023-07-22 12:57:57', '2023-07-22 12:57:57', NULL),
(38, 1, '42e91068-60b5-4faa-8f35-9f8be50d7c44', '250000.000', '0.000', '0.000', '250000.000', 'add_fund_by_admin', 'Sponsored', 'Testing', '2023-07-22 13:00:25', '2023-07-22 13:00:25', NULL),
(39, 1, '5a0a1991-7dda-41c2-a740-d5a479cc4611', '0.000', '50.000', '0.000', '250000.000', 'order_place', '101819', 'Testing', '2023-07-22 13:03:45', '2023-07-22 13:03:45', NULL),
(40, 1, 'bfcc9062-9276-4a95-9636-53daef9e2153', '200000.000', '0.000', '0.000', '200000.000', 'add_fund_by_admin', 'Invest', 'Testing', '2023-07-22 13:16:38', '2023-07-22 13:16:38', NULL),
(41, 1, '70f3e9cf-6c76-41f9-9305-9be1f390ebbd', '200000.000', '0.000', '0.000', '200000.000', 'add_fund_by_admin', NULL, 'Testing', '2023-07-22 13:17:31', '2023-07-22 13:17:31', NULL),
(42, 1, '1a7ac9b7-f0cb-49c8-9772-c6784649c985', '50.000', '0.000', '0.000', '250050.000', 'withdrawal', '101819', 'Testing', '2023-07-22 13:34:33', '2023-07-22 13:34:33', NULL),
(43, 1, '52f079e3-07ae-4adb-b4fc-f85e460c34f2', '10.000', '0.000', '0.000', '20.000', 'referrer', '+919754918829', 'Testing', '2023-07-24 14:03:12', '2023-07-24 14:03:12', NULL),
(44, 1, 'b3bbf1c6-951f-4da5-8f98-7e081fc543b3', '10.000', '0.000', '0.000', '30.000', 'referrer', '+919907807467', 'Testing', '2023-08-01 15:42:14', '2023-08-01 15:42:14', NULL),
(45, 1, '03693841-ed73-435c-8d2e-88d9ecdd0459', '0.000', '581.000', '0.000', '249469.000', 'order_place', '102224', 'Testing', '2023-08-25 12:44:38', '2023-08-25 12:44:38', NULL),
(46, 1, '0a34a21a-54aa-4563-9c90-433bcb18797b', '581.000', '0.000', '0.000', '250050.000', 'withdrawal', '102224', 'Testing', '2023-08-25 12:49:00', '2023-08-25 12:49:00', NULL),
(47, 1, '20625238-256f-4458-ade7-44116c26aee3', '0.000', '581.000', '0.000', '249469.000', 'order_place', '102225', 'Testing', '2023-08-25 12:50:55', '2023-08-25 12:50:55', NULL),
(48, 1, 'ae77b54c-2863-446b-bd00-fe2b4f628677', '0.000', '541.000', '0.000', '248928.000', 'order_place', '102226', 'Testing', '2023-08-25 12:58:39', '2023-08-25 12:58:39', NULL),
(49, 1, '5b01a689-3089-4d57-adb1-f0a446b5eb4b', '0.000', '131.000', '0.000', '248797.000', 'order_place', '102227', 'Testing', '2023-08-25 13:03:27', '2023-08-25 13:03:27', NULL),
(50, 1, '2006257c-802c-4c2f-aba0-b509cf6fe5eb', '0.000', '433.000', '0.000', '248364.000', 'order_place', '102229', 'Testing', '2023-08-25 13:08:49', '2023-08-25 13:08:49', NULL),
(51, 1, 'f5dec123-5548-4e2e-bd2a-44d34f689ea7', '0.000', '408.000', '0.000', '247956.000', 'order_place', '102231', 'Testing', '2023-08-25 14:41:14', '2023-08-25 14:41:14', NULL),
(52, 1, '75f2249b-e401-42ff-8cb5-f27e2d7e71d9', '0.000', '75.000', '0.000', '247881.000', 'order_place', '102232', 'Testing', '2023-08-25 14:48:58', '2023-08-25 14:48:58', NULL),
(53, 1, '0f0d9af9-3b98-4504-a994-65b8c3dc9b28', '581.000', '0.000', '0.000', '248462.000', 'withdrawal', '102225', 'Testing', '2023-08-25 17:35:39', '2023-08-25 17:35:39', NULL),
(54, 1, '9cf1408f-0078-4536-a8bd-047fe596d34b', '541.000', '0.000', '0.000', '249003.000', 'withdrawal', '102226', 'Testing', '2023-08-25 17:35:57', '2023-08-25 17:35:57', NULL),
(55, 1, '0d825d9b-cc17-4be7-8a19-d7cb1c6ea90e', '408.000', '0.000', '0.000', '249411.000', 'withdrawal', '102231', 'Testing', '2023-08-25 17:41:15', '2023-08-25 17:41:15', NULL),
(56, 1, '2aa3fccf-fe99-4211-822f-0283ae25bef1', '75.000', '0.000', '0.000', '249486.080', 'withdrawal', '102232', 'Testing', '2023-08-25 17:41:42', '2023-08-25 17:41:42', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `wallet_transactions_old`
--

CREATE TABLE `wallet_transactions_old` (
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

--
-- Dumping data for table `wallet_transactions_old`
--

INSERT INTO `wallet_transactions_old` (`id`, `type`, `user_id`, `cash`, `balance`, `txn_id`, `bank_txn_id`, `order_id`, `resp_msg`, `bank_name`, `description`, `created_at`, `updated_at`, `deleted_at`, `status`, `paytm`, `bank_id`, `upi`, `payment_reference`) VALUES
(1, 'DEBIT', 1, '100.00', '9899.88', '123456', '', 'order1', '', NULL, 'sdfsjdfjds', '2023-08-19 09:50:54', '2023-08-19 09:58:01', NULL, 1, '8522808784', NULL, 'ande.mehar@ybl', NULL);

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

-- --------------------------------------------------------

--
-- Table structure for table `withdraw_requests`
--

CREATE TABLE `withdraw_requests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `vendor_id` bigint(20) UNSIGNED NOT NULL,
  `admin_id` bigint(20) UNSIGNED DEFAULT NULL,
  `transaction_note` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` decimal(23,3) NOT NULL DEFAULT 0.000,
  `approved` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `withdraw_requests`
--

INSERT INTO `withdraw_requests` (`id`, `vendor_id`, `admin_id`, `transaction_note`, `amount`, `approved`, `created_at`, `updated_at`) VALUES
(1, 8, NULL, '77656423', '198.000', 1, '2022-09-28 15:17:44', '2022-09-28 15:21:13'),
(2, 69, NULL, NULL, '100.000', 1, '2022-11-11 10:28:27', '2022-11-12 19:24:06'),
(3, 69, NULL, NULL, '300.000', 1, '2022-11-12 12:49:04', '2022-11-12 19:23:54'),
(4, 8, NULL, 'Transaction iD\r\nT2211130758195482803304', '100.000', 1, '2022-11-13 07:54:57', '2022-11-13 07:59:26'),
(5, 64, NULL, 'ref 234306797749', '60.000', 1, '2022-11-13 08:07:42', '2022-12-09 06:25:34'),
(6, 70, NULL, NULL, '50.000', 1, '2022-11-13 19:31:09', '2022-11-13 19:31:57'),
(7, 64, NULL, 'ref 234306797749', '90.000', 1, '2022-11-15 16:00:45', '2022-12-09 06:25:12'),
(8, 69, NULL, '234306805787', '150.000', 1, '2022-11-20 17:41:03', '2022-12-09 06:35:48'),
(9, 3, NULL, 'cash payout from vijay verma', '140.000', 1, '2022-11-27 09:34:02', '2022-11-27 09:34:50'),
(10, 70, NULL, 'ref 234306799675', '90.000', 1, '2022-11-27 09:40:00', '2022-12-09 06:30:23'),
(11, 8, NULL, 'Online', '250.000', 1, '2022-11-27 09:57:30', '2022-11-28 10:19:23'),
(12, 64, NULL, 'ref 234306797749', '300.000', 1, '2022-12-05 13:25:30', '2022-12-09 06:24:48'),
(13, 8, NULL, 'ref 1008579997', '280.000', 1, '2022-12-05 14:30:55', '2022-12-09 06:27:57'),
(14, 3, NULL, 'ref 1008581213', '49.000', 1, '2022-12-06 22:10:44', '2022-12-09 06:29:32'),
(15, 8, NULL, 'ref 1008579997', '54.000', 1, '2022-12-06 22:12:00', '2022-12-09 06:27:43'),
(16, 5, NULL, 'ref 1008580721', '249.000', 1, '2022-12-06 22:15:21', '2022-12-09 06:28:49'),
(17, 8, NULL, 'ref 1008579997\r\nold payouts 750 is done', '70.000', 1, '2022-12-09 05:48:35', '2022-12-09 06:27:10'),
(18, 64, NULL, 'ref 234306797749', '815.000', 1, '2022-12-09 05:50:33', '2022-12-09 06:24:10'),
(19, 64, NULL, 'ref no. 310213642118', '800.000', 1, '2022-12-17 17:04:59', '2023-04-12 13:53:55'),
(20, 750, NULL, 'ref id 302109400749', '140.000', 1, '2023-01-20 12:46:43', '2023-01-21 10:00:11'),
(21, 750, NULL, 'Ref=302320193398', '350.000', 1, '2023-01-22 22:28:32', '2023-01-23 20:05:26'),
(22, 902, NULL, 'REF ID - 302609169644', '24.000', 1, '2023-01-26 09:38:18', '2023-01-26 09:39:24'),
(23, 750, NULL, 'reference id - 302714084609', '300.000', 1, '2023-01-26 17:28:56', '2023-01-27 14:32:01'),
(24, 956, NULL, 'Transaction ref No. 3044123899252', '60.000', 1, '2023-02-13 12:36:54', '2023-02-13 12:55:31'),
(25, 958, NULL, 'ref No. 304618079091', '150.000', 1, '2023-02-13 16:20:56', '2023-02-15 18:43:55'),
(26, 750, NULL, 'ref id - 304810986481', '330.000', 1, '2023-02-15 14:05:19', '2023-02-17 11:53:49'),
(27, 809, NULL, 'ref no. 304618102154', '70.000', 1, '2023-02-15 18:35:45', '2023-02-15 18:48:22'),
(28, 902, NULL, 'ref no 305021718607', '380.000', 1, '2023-02-19 18:46:59', '2023-02-19 21:19:57'),
(29, 750, NULL, 'ref no. 305122328146', '90.000', 1, '2023-02-19 21:46:24', '2023-02-20 22:29:48'),
(30, 750, NULL, 'ref no. 305301006775', '180.000', 1, '2023-02-20 17:06:33', '2023-02-22 01:06:40'),
(31, 956, NULL, 'ref no. 305507622916', '435.000', 1, '2023-02-21 21:52:44', '2023-02-24 07:12:28'),
(32, 809, NULL, 'ref no. 305507624889', '160.000', 1, '2023-02-22 01:07:41', '2023-02-24 07:14:25'),
(33, 921, NULL, 'paid by qrcode /phone pay', '40.000', 1, '2023-02-22 17:51:23', '2023-03-11 11:47:21'),
(34, 956, NULL, 'paid by qrcode to store', '150.000', 1, '2023-02-25 09:24:00', '2023-03-11 11:45:16'),
(35, 750, NULL, 'Qr code pay for kamlesh sahu', '394.000', 1, '2023-02-28 22:39:10', '2023-03-06 17:47:49'),
(36, 956, NULL, 'paid by qrcode 285', '285.000', 1, '2023-03-01 10:12:10', '2023-03-11 11:48:33'),
(37, 902, NULL, 'paid by qrcode/phone pay 130', '130.000', 1, '2023-03-04 22:45:27', '2023-03-11 11:49:41'),
(38, 750, NULL, 'same order in time', '324.000', 2, '2023-03-06 17:52:28', '2023-03-15 17:46:37'),
(39, 956, NULL, 'paid by qrcode /phone pay 245', '245.000', 1, '2023-03-07 18:28:05', '2023-03-11 11:52:17'),
(40, 750, NULL, 'paid by qrcode phone pay 144', '144.000', 1, '2023-03-09 23:24:39', '2023-03-11 11:53:01'),
(41, 750, NULL, 'PAID BY STORE QR-CODE PHONE PAY', '260.000', 1, '2023-03-14 22:37:00', '2023-03-16 12:40:32'),
(42, 750, NULL, 'PAID BY STORE QRCODE PHONE PAY', '20.000', 1, '2023-03-14 22:39:03', '2023-03-16 12:41:00'),
(43, 920, NULL, 'Vshopp oder paid qrcode', '80.000', 1, '2023-03-15 18:14:20', '2023-03-18 07:15:49'),
(44, 750, NULL, 'Paid Store Qrcode by Phone pay', '140.000', 1, '2023-03-25 08:55:02', '2023-03-27 11:34:15'),
(45, 902, NULL, 'Vshopp order paid by qrcode', '580.000', 1, '2023-03-27 19:16:07', '2023-03-28 15:15:23'),
(46, 943, NULL, 'vshopp order paid by qr code', '499.000', 1, '2023-03-29 19:25:41', '2023-03-31 10:42:06'),
(47, 956, NULL, 'vshopp order 100413 date28-3-23  paid in ac bob', '225.000', 1, '2023-03-31 10:47:02', '2023-03-31 15:54:28'),
(48, 902, NULL, 'REF NO. 309516476787', '510.000', 1, '2023-04-05 15:54:09', '2023-04-05 16:22:44'),
(49, 956, NULL, 'Ref no. 310112613157', '260.000', 1, '2023-04-10 18:24:25', '2023-04-11 12:19:46'),
(50, 734, NULL, 'payout sucessfully', '410.000', 1, '2023-04-12 12:26:31', '2023-04-12 12:27:12'),
(51, 734, NULL, 'ref no.310280740722', '170.000', 1, '2023-04-12 12:26:37', '2023-04-12 12:32:48'),
(52, 902, NULL, 'ref no. 310212639767', '670.000', 1, '2023-04-12 12:35:35', '2023-04-12 12:38:00'),
(53, 64, NULL, 'ref no. 310213642118', '10.000', 1, '2023-04-12 13:43:27', '2023-04-12 13:54:31'),
(54, 956, NULL, 'ref no. 310417696519', '275.000', 1, '2023-04-12 20:47:17', '2023-04-14 17:42:20'),
(55, 734, NULL, 'ref no. 310417696449', '40.000', 1, '2023-04-14 17:37:57', '2023-04-14 17:41:17'),
(56, 845, NULL, '310417696666', '753.000', 1, '2023-04-14 17:44:32', '2023-04-14 17:48:29'),
(57, 901, NULL, '310514713943', '25.000', 1, '2023-04-14 18:16:41', '2023-04-15 14:30:43'),
(58, 757, NULL, 'cash paid by delevery men', '170.000', 1, '2023-04-17 15:55:07', '2023-04-18 11:23:00'),
(59, 956, NULL, 'Ref no. 310720763885', '430.000', 1, '2023-04-17 18:12:19', '2023-04-17 20:04:52'),
(60, 956, NULL, 'ref no. 310919813994', '190.000', 1, '2023-04-18 22:13:15', '2023-04-19 19:49:59'),
(61, 750, NULL, 'Ref no. 311017834964', '290.000', 1, '2023-04-19 15:19:40', '2023-04-20 17:01:31'),
(62, 902, NULL, 'Ref no 311111849895', '515.000', 1, '2023-04-20 15:43:08', '2023-04-21 11:28:54'),
(63, 845, NULL, 'Ref no 311021841438', '159.000', 1, '2023-04-20 15:55:55', '2023-04-20 21:02:56'),
(64, 750, NULL, 'Ref no. 311113854008', '180.000', 1, '2023-04-20 21:01:48', '2023-04-21 13:35:00'),
(65, 1053, NULL, 'ref no. 311212875792', '300.000', 1, '2023-04-21 14:07:39', '2023-04-22 12:30:08'),
(66, 956, NULL, 'ref no. 311212875874', '620.000', 1, '2023-04-22 09:21:31', '2023-04-22 12:33:02'),
(67, 750, NULL, 'Ref no 311312893427', '570.000', 1, '2023-04-22 20:36:42', '2023-04-23 12:35:15'),
(68, 845, NULL, 'Ref no. 311411908963', '318.000', 1, '2023-04-23 21:58:51', '2023-04-24 11:36:34'),
(69, 968, NULL, 'ref no. 311522953957', '480.000', 1, '2023-04-25 11:23:31', '2023-04-25 22:34:52'),
(70, 956, NULL, 'ref no. 311522953974', '248.000', 1, '2023-04-25 22:18:02', '2023-04-25 22:36:13'),
(71, 734, NULL, 'ref no 311818025091', '660.000', 1, '2023-04-26 14:53:28', '2023-04-28 18:27:14'),
(72, 1053, NULL, 'ref no. 311709982555', '150.000', 1, '2023-04-26 15:10:04', '2023-04-27 09:42:48'),
(73, 1090, NULL, 'Ref no 311821029775', '100.000', 1, '2023-04-28 10:03:42', '2023-04-28 21:33:53'),
(74, 1090, NULL, 'ref no. 311920056450', '400.000', 1, '2023-04-28 15:21:41', '2023-04-29 21:00:00'),
(75, 775, NULL, 'Ref no. 311821029862', '340.000', 1, '2023-04-28 16:13:10', '2023-04-28 21:39:50'),
(76, 813, NULL, 'ref 3159200008928', '488.000', 1, '2023-04-28 16:47:12', '2023-06-08 20:20:20'),
(77, 896, NULL, 'Ref no 311822030308', '90.000', 1, '2023-04-28 19:35:50', '2023-04-28 22:09:10'),
(78, 1090, NULL, 'ref no. 311921057142', '370.000', 1, '2023-04-28 19:59:12', '2023-04-29 21:48:23'),
(79, 968, NULL, 'ref no. 311921057022', '230.000', 1, '2023-04-29 10:16:43', '2023-04-29 21:39:00'),
(80, 1090, NULL, 'ref no. 311921057090', '100.000', 1, '2023-04-29 15:18:19', '2023-04-29 21:45:01'),
(81, 1090, NULL, 'ref no. 311921057116', '20.000', 1, '2023-04-29 15:19:11', '2023-04-29 21:46:12'),
(82, 1090, NULL, 'ref no. 311921057127', '50.000', 1, '2023-04-29 16:46:14', '2023-04-29 21:47:17'),
(83, 1090, NULL, 'ref no 312210109701', '340.000', 1, '2023-04-30 21:00:46', '2023-05-02 10:08:18'),
(84, 901, NULL, 'ref no 312212114769', '40.000', 1, '2023-05-01 13:18:16', '2023-05-02 12:30:22'),
(85, 281, NULL, 'ref no 312210109868', '577.000', 1, '2023-05-01 15:48:04', '2023-05-02 10:12:45'),
(86, 1053, NULL, 'ref no 312210110220', '600.000', 1, '2023-05-01 18:35:10', '2023-05-02 10:23:44'),
(87, 968, NULL, 'ref no. 312515201445', '4.000', 1, '2023-05-02 10:28:48', '2023-05-05 15:35:40'),
(88, 968, NULL, 'ref no 312515201445', '36.000', 1, '2023-05-02 10:28:58', '2023-05-05 15:35:27'),
(89, 1073, NULL, 'cash paid', '25.000', 1, '2023-05-02 18:35:50', '2023-05-03 20:23:50'),
(90, 1090, NULL, 'ref no 312515201385', '125.000', 1, '2023-05-02 19:55:48', '2023-05-05 15:34:05'),
(91, 1090, NULL, 'ref no 312515201385', '320.000', 1, '2023-05-03 15:03:42', '2023-05-05 15:33:51'),
(92, 1090, NULL, 'ref no. 312515201385', '140.000', 1, '2023-05-04 16:12:50', '2023-05-05 15:33:28'),
(93, 1052, NULL, 'ref no 312515201310', '751.000', 1, '2023-05-05 11:55:25', '2023-05-05 15:30:42'),
(94, 56, NULL, 'ref no 312518205538', '1596.000', 1, '2023-05-05 17:41:42', '2023-05-05 18:03:08'),
(95, 1090, NULL, 'ref no. 312623235032', '284.000', 1, '2023-05-06 06:42:05', '2023-05-06 23:56:05'),
(96, 845, NULL, 'ref no 312623235026', '89.000', 1, '2023-05-06 17:56:07', '2023-05-06 23:55:03'),
(97, 1052, NULL, 'ref no 312623235017', '165.000', 1, '2023-05-06 18:57:56', '2023-05-06 23:53:37'),
(98, 732, NULL, 'ref no,. 312623235010', '540.000', 1, '2023-05-06 20:50:28', '2023-05-06 23:52:29'),
(99, 750, NULL, 'Ref no 312811259212', '260.000', 1, '2023-05-06 23:56:13', '2023-05-08 11:46:18'),
(100, 281, NULL, 'Ref 312811259282', '90.000', 1, '2023-05-07 10:22:13', '2023-05-08 11:48:43'),
(101, 845, NULL, 'ref no 312910282464', '118.000', 1, '2023-05-07 12:55:07', '2023-05-09 10:27:33'),
(102, 734, NULL, 'ref no. 312910282509', '130.000', 1, '2023-05-07 22:06:05', '2023-05-09 10:28:34'),
(103, 902, NULL, 'ref no. 312910282545', '230.000', 1, '2023-05-08 09:29:05', '2023-05-09 10:30:06'),
(104, 956, NULL, 'ref no. 312910282572', '1210.000', 1, '2023-05-08 11:42:52', '2023-05-09 10:31:05'),
(105, 845, NULL, 'ref no. 312910282599', '118.000', 1, '2023-05-08 19:14:47', '2023-05-09 10:32:09'),
(106, 1053, NULL, 'ref no. 312910282627', '420.000', 1, '2023-05-09 06:08:47', '2023-05-09 10:33:00'),
(107, 956, NULL, 'ref no 313017321973', '150.000', 1, '2023-05-09 23:47:41', '2023-05-10 17:56:37'),
(108, 56, NULL, 'ref no 313014316754', '842.000', 1, '2023-05-10 11:24:15', '2023-05-10 14:44:13'),
(109, 1053, NULL, 'transfer order', '270.000', 1, '2023-05-10 12:41:11', '2023-05-10 12:41:36'),
(110, 1048, NULL, 'Testing Order', '100.000', 1, '2023-05-10 12:43:39', '2023-05-10 12:44:58'),
(111, 14, NULL, NULL, '484.000', 1, '2023-05-10 14:30:34', '2023-05-11 13:57:10'),
(112, 1058, NULL, 'ref no. 313017321929', '773.000', 1, '2023-05-10 15:01:01', '2023-05-10 17:55:06'),
(113, 1051, NULL, 'Ref no. 313113339562', '485.000', 1, '2023-05-10 17:39:04', '2023-05-11 13:57:00'),
(114, 1081, NULL, 'Ref no. 313114339675', '135.000', 1, '2023-05-11 12:25:52', '2023-05-11 14:02:37'),
(115, 968, NULL, 'Ref no 313114339737', '540.000', 1, '2023-05-11 12:38:36', '2023-05-11 14:04:22'),
(116, 902, NULL, 'ref no 313209353887', '540.000', 1, '2023-05-11 18:42:39', '2023-05-12 09:28:24'),
(117, 750, NULL, 'ref no. 313209353918', '150.000', 1, '2023-05-11 18:55:29', '2023-05-12 09:29:29'),
(118, 1091, NULL, 'ref no. 313209354026', '220.000', 1, '2023-05-11 22:21:53', '2023-05-12 09:33:20'),
(119, 896, NULL, 'ref no 313209354050', '110.000', 1, '2023-05-12 09:08:50', '2023-05-12 09:34:22'),
(120, 813, NULL, 'ref 3159200008928', '60.000', 1, '2023-05-12 09:45:59', '2023-06-08 20:19:32'),
(121, 1091, NULL, 'Ref no 313508414006', '150.000', 1, '2023-05-12 11:09:54', '2023-05-15 08:38:08'),
(122, 744, NULL, 'ref no 313521436835', '75.000', 1, '2023-05-12 20:17:08', '2023-05-15 21:40:14'),
(123, 958, NULL, 'ref no 313620459779', '910.000', 1, '2023-05-13 17:47:05', '2023-05-16 20:47:29'),
(124, 757, NULL, 'ref 3135188432893', '400.000', 1, '2023-05-14 12:32:01', '2023-05-15 18:55:41'),
(125, 56, NULL, 'ref no. 313518432789', '2213.000', 1, '2023-05-14 13:42:26', '2023-05-15 18:52:44'),
(126, 1090, NULL, 'ref no. 313518432859', '334.000', 1, '2023-05-14 16:24:47', '2023-05-15 18:54:32'),
(127, 1073, NULL, 'Transferd Order', '140.000', 1, '2023-05-15 19:19:59', '2023-05-15 19:21:27'),
(128, 968, NULL, 'ref no. 313620459804', '80.000', 1, '2023-05-16 09:32:59', '2023-05-16 20:48:48'),
(129, 1085, NULL, 'ref no 313620459915', '395.000', 1, '2023-05-16 17:47:01', '2023-05-16 20:54:39'),
(130, 1058, NULL, 'Ref no. 313813495453', '1.000', 1, '2023-05-16 23:28:40', '2023-05-18 13:09:10'),
(131, 1058, NULL, 'Ref no 313813495453', '1000.000', 1, '2023-05-17 11:13:58', '2023-05-18 13:08:26'),
(132, 281, NULL, 'Ref no 313721484817', '200.000', 1, '2023-05-17 12:55:10', '2023-05-17 22:00:43'),
(133, 281, NULL, 'Ref no. 313721484817', '200.000', 1, '2023-05-17 13:23:21', '2023-05-17 21:59:52'),
(134, 281, NULL, 'Ref no 313815499407', '200.000', 1, '2023-05-17 20:37:01', '2023-05-18 15:58:58'),
(135, 1090, NULL, 'Ref no 314009535466', '140.000', 1, '2023-05-18 19:06:38', '2023-05-20 09:35:27'),
(136, 56, NULL, 'ref no 313919529196', '574.000', 1, '2023-05-19 13:11:56', '2023-05-19 19:46:50'),
(137, 902, NULL, 'Ref no. 314022554464', '110.000', 1, '2023-05-20 09:58:14', '2023-05-20 22:10:15'),
(138, 968, NULL, 'Ref no. 314022554438', '440.000', 1, '2023-05-20 13:09:16', '2023-05-20 22:08:26'),
(139, 956, NULL, 'ref no. 314311602948', '816.000', 1, '2023-05-21 11:23:02', '2023-05-23 12:09:06'),
(140, 1052, NULL, 'Ref no 314208573763', '965.000', 1, '2023-05-21 18:02:19', '2023-05-22 08:43:25'),
(141, 281, NULL, 'ref no. 314219591515', '100.000', 1, '2023-05-22 18:20:54', '2023-05-22 19:04:23'),
(142, 896, NULL, 'ref no. 314412628114', '56.000', 1, '2023-05-23 16:34:29', '2023-05-24 12:49:28'),
(143, 1088, NULL, 'ref no. 314412628237', '536.000', 1, '2023-05-23 18:09:55', '2023-05-24 12:53:23'),
(144, 1090, NULL, 'Ref no 314516659191', '190.000', 1, '2023-05-24 19:08:35', '2023-05-25 16:45:07'),
(145, 750, NULL, 'Ref no 314516659131', '300.000', 1, '2023-05-24 21:41:21', '2023-05-25 16:43:35'),
(146, 1094, NULL, 'Ref no 314516659365', '270.000', 1, '2023-05-25 14:06:28', '2023-05-25 16:50:57'),
(147, 1089, NULL, 'ref no. 314623691503', '75.000', 1, '2023-05-25 16:53:00', '2023-05-26 23:00:14'),
(148, 1088, NULL, 'ref no. 314622691429', '150.000', 1, '2023-05-25 18:09:12', '2023-05-26 22:52:09'),
(149, 750, NULL, 'ref no. 314622691449', '160.000', 1, '2023-05-25 21:48:33', '2023-05-26 22:54:30'),
(150, 56, NULL, 'ref no 314622691438', '927.000', 1, '2023-05-26 14:15:51', '2023-05-26 22:53:10'),
(151, 775, NULL, 'ref no. 314622691458', '703.000', 1, '2023-05-26 16:33:51', '2023-05-26 22:55:35'),
(152, 732, NULL, 'order manual delivery', '131.600', 1, '2023-05-26 18:56:01', '2023-05-26 18:56:26'),
(153, 750, NULL, 'ref no. 314622691395', '910.000', 1, '2023-05-26 21:32:26', '2023-05-26 22:49:48'),
(154, 902, NULL, 'ref no. 314622691413', '290.000', 1, '2023-05-26 22:08:27', '2023-05-26 22:50:56'),
(155, 1089, NULL, 'ref no. 314721710249', '390.000', 1, '2023-05-27 10:11:41', '2023-05-27 21:34:43'),
(156, 920, NULL, 'ref no. 314721710304', '118.000', 1, '2023-05-27 13:51:38', '2023-05-27 21:38:55'),
(157, 1058, NULL, 'ref no. 314722710954', '1800.000', 1, '2023-05-27 21:43:06', '2023-05-27 22:34:44'),
(158, 734, NULL, 'Ref no 314809714788', '376.000', 1, '2023-05-28 02:39:50', '2023-05-28 09:58:29'),
(159, 734, NULL, 'Ref no. 315008753011', '216.000', 1, '2023-05-28 16:57:55', '2023-05-30 08:57:46'),
(160, 902, NULL, 'Ref no. 315008752978', '240.000', 1, '2023-05-29 08:40:32', '2023-05-30 08:56:08'),
(161, 1090, NULL, 'Ref 315008753025', '130.000', 1, '2023-05-29 18:19:00', '2023-05-30 08:58:54'),
(162, 1088, NULL, 'ref no. 315022774943', '300.000', 1, '2023-05-30 12:55:16', '2023-05-30 22:54:20'),
(163, 1094, NULL, 'ref no. 315022774923', '135.000', 1, '2023-05-30 13:00:26', '2023-05-30 22:52:35'),
(164, 1052, NULL, 'ref no. 315022774915', '220.000', 1, '2023-05-30 16:09:58', '2023-05-30 22:51:01'),
(165, 1058, NULL, 'ref no. 315022774911', '300.000', 1, '2023-05-30 19:15:20', '2023-05-30 22:49:58'),
(166, 1088, NULL, 'ref no 315200802441', '30.000', 1, '2023-05-31 12:44:33', '2023-06-01 00:57:33'),
(167, 968, NULL, 'ref no 315200802435', '210.000', 1, '2023-05-31 13:02:50', '2023-06-01 00:55:10'),
(168, 968, NULL, 'ref no. 315411868537', '210.000', 1, '2023-06-01 13:43:24', '2023-06-03 11:57:24'),
(169, 734, NULL, 'ref 315523903808', '122.000', 1, '2023-06-03 01:07:28', '2023-06-04 23:06:36'),
(170, 775, NULL, 'ref 315523903794', '103.000', 1, '2023-06-03 12:34:25', '2023-06-04 23:04:13'),
(171, 813, NULL, 'ref 3159200008928', '40.000', 1, '2023-06-03 15:32:14', '2023-06-08 20:18:13'),
(172, 902, NULL, 'ref 315511891664', '570.000', 1, '2023-06-04 08:52:09', '2023-06-04 11:11:30'),
(173, 1089, NULL, 'ref 315523903789', '395.000', 1, '2023-06-04 13:59:23', '2023-06-04 23:03:07'),
(174, 1053, NULL, 'ref 315523903776', '141.000', 1, '2023-06-04 20:21:10', '2023-06-04 23:02:10'),
(175, 1089, NULL, 'ref 315523903762', '122.000', 1, '2023-06-04 22:22:10', '2023-06-04 23:00:40'),
(176, 1088, NULL, 'Ref 315722955720', '100.000', 1, '2023-06-05 13:31:41', '2023-06-06 22:37:41'),
(177, 968, NULL, 'REF 315700931338', '150.000', 1, '2023-06-05 13:37:06', '2023-06-06 00:09:41'),
(178, 1089, NULL, 'REF NO. 315700931330', '301.000', 1, '2023-06-05 21:59:56', '2023-06-06 00:08:38'),
(179, 734, NULL, 'Ref 315722959705', '400.000', 1, '2023-06-06 10:44:04', '2023-06-06 22:36:00'),
(180, 734, NULL, 'Ref 315722959705', '30.000', 1, '2023-06-06 10:44:16', '2023-06-06 22:36:22'),
(181, 968, NULL, 'Ref 315722959674', '460.000', 1, '2023-06-06 11:53:47', '2023-06-06 22:33:37'),
(182, 1159, NULL, 'Rwf 315722959626', '200.000', 1, '2023-06-06 16:38:02', '2023-06-06 22:30:34'),
(183, 902, NULL, 'ref 315823986964', '430.000', 1, '2023-06-07 08:00:21', '2023-06-07 23:36:31'),
(184, 968, NULL, 'ref 3158239986958', '200.000', 1, '2023-06-07 12:19:03', '2023-06-07 23:35:29'),
(185, 775, NULL, 'ref no 315823986951', '470.000', 1, '2023-06-07 14:31:56', '2023-06-07 23:34:37'),
(186, 813, NULL, 'ref no. 315920008928', '100.000', 1, '2023-06-07 19:13:14', '2023-06-08 20:17:36'),
(187, 968, NULL, 'ref 315920009227', '260.000', 1, '2023-06-08 11:23:05', '2023-06-08 20:29:38'),
(188, 281, NULL, 'ref 315920009202', '300.000', 1, '2023-06-08 12:54:39', '2023-06-08 20:28:15'),
(189, 1052, NULL, 'ref 315920009172', '270.000', 1, '2023-06-08 15:17:59', '2023-06-08 20:26:59'),
(190, 968, NULL, 'ref 316022036292', '130.000', 1, '2023-06-09 12:46:09', '2023-06-09 22:01:14'),
(191, 757, NULL, 'ref 316022036277', '900.000', 1, '2023-06-09 12:47:00', '2023-06-09 22:00:18'),
(192, 813, NULL, 'ref no. 316021036236', '245.000', 1, '2023-06-09 13:37:11', '2023-06-09 21:58:14'),
(193, 813, NULL, 'ref 316216069722', '19.000', 1, '2023-06-10 12:28:13', '2023-06-11 16:55:26'),
(194, 1167, NULL, 'Ref 316122058713', '120.000', 1, '2023-06-10 19:07:23', '2023-06-10 22:10:35'),
(195, 1052, NULL, 'ref 316216069698', '68.000', 1, '2023-06-10 20:40:41', '2023-06-11 16:53:32'),
(196, 968, NULL, 'ref 316216069677', '330.000', 1, '2023-06-11 14:05:24', '2023-06-11 16:52:32'),
(197, 1088, NULL, 'ref 316216069658', '140.000', 1, '2023-06-11 14:56:52', '2023-06-11 16:51:38'),
(198, 1094, NULL, 'ref 316216069638', '135.000', 1, '2023-06-11 14:57:09', '2023-06-11 16:50:38'),
(199, 1091, NULL, 'ref 316216069623', '235.000', 1, '2023-06-11 14:57:21', '2023-06-11 16:49:38'),
(200, 775, NULL, 'ref 316216069607', '550.000', 1, '2023-06-11 15:27:02', '2023-06-11 16:48:39'),
(201, 775, NULL, 'ref 316216069574', '23.000', 1, '2023-06-11 15:27:17', '2023-06-11 16:46:41'),
(202, 1055, NULL, 'ref 316216069551', '1184.000', 1, '2023-06-11 15:36:19', '2023-06-11 16:45:03'),
(203, 896, NULL, 'ref 316216069474', '120.000', 1, '2023-06-11 16:38:01', '2023-06-11 16:40:55'),
(204, 1089, NULL, 'payout success', '310.000', 1, '2023-06-13 00:04:48', '2023-06-13 22:45:31'),
(205, 956, NULL, 'ref 316422123413', '2100.000', 1, '2023-06-13 12:08:52', '2023-06-13 22:46:30'),
(206, 968, NULL, 'ref 316422123423', '270.000', 1, '2023-06-13 12:30:39', '2023-06-13 22:47:32'),
(207, 743, NULL, 'cash paid Trf order', '146.000', 1, '2023-06-13 13:55:16', '2023-06-13 13:57:14'),
(208, 734, NULL, 'ref 316422123441', '580.000', 1, '2023-06-13 17:45:35', '2023-06-13 22:49:19'),
(209, 734, NULL, 'ref 316422123441', '5.000', 1, '2023-06-13 17:45:52', '2023-06-13 22:49:32'),
(210, 902, NULL, 'ref 316722194147', '120.000', 1, '2023-06-14 00:01:36', '2023-06-16 22:48:42'),
(211, 1091, NULL, 'ref no 316722194182', '226.000', 1, '2023-06-14 12:12:26', '2023-06-16 22:52:50'),
(212, 1056, NULL, 'ref 316518143456', '400.000', 1, '2023-06-14 13:36:20', '2023-06-14 19:01:44'),
(213, 968, NULL, 'ref 316518143342', '230.000', 1, '2023-06-14 14:13:17', '2023-06-14 18:54:40'),
(214, 1150, NULL, 'ref 316723194245', '180.000', 1, '2023-06-15 17:08:11', '2023-06-16 23:02:09'),
(215, 743, NULL, 'ref 316723194273', '395.000', 1, '2023-06-15 20:01:02', '2023-06-16 23:05:54'),
(216, 968, NULL, 'ref 316723194277', '70.000', 1, '2023-06-15 22:11:33', '2023-06-16 23:06:56'),
(217, 1080, NULL, 'ref 316723194302', '19999.000', 1, '2023-06-16 15:02:49', '2023-06-16 23:10:02'),
(218, 750, NULL, 'ref 316821215914', '72.000', 1, '2023-06-16 22:47:04', '2023-06-17 21:53:55'),
(219, 281, NULL, 'ref 316821215927', '170.000', 1, '2023-06-17 14:02:51', '2023-06-17 21:54:50'),
(220, 958, NULL, 'ref 316821215940', '2500.000', 1, '2023-06-17 15:19:03', '2023-06-17 21:55:54'),
(221, 1082, NULL, 'ref 316822216042', '50.000', 1, '2023-06-17 15:54:50', '2023-06-17 22:06:02'),
(222, 281, NULL, 'ref 316821215894', '200.000', 1, '2023-06-17 17:00:09', '2023-06-17 21:52:17'),
(223, 281, NULL, '317216295292', '100.000', 1, '2023-06-18 19:13:33', '2023-06-21 16:58:26'),
(224, 1058, NULL, NULL, '1.000', 1, '2023-06-18 21:29:23', '2023-06-24 17:32:53'),
(225, 1150, NULL, 'Ref 317217295430', '200.000', 1, '2023-06-19 15:53:36', '2023-06-21 17:03:17'),
(226, 1150, NULL, NULL, '10.000', 1, '2023-06-19 15:53:46', '2023-06-24 17:31:43'),
(227, 1078, NULL, 'Ref no 317217295591', '865.000', 1, '2023-06-19 18:10:10', '2023-06-21 17:09:30'),
(228, 1090, NULL, NULL, '1.000', 1, '2023-06-20 11:33:47', '2023-06-24 17:33:34'),
(229, 281, NULL, 'Ref no 317217296653', '70.000', 1, '2023-06-20 15:18:19', '2023-06-21 17:48:26'),
(230, 734, NULL, 'Rwf 317217296704', '254.000', 1, '2023-06-20 20:45:01', '2023-06-21 17:50:57'),
(231, 1091, NULL, 'Payout', '122.000', 1, '2023-06-20 21:58:57', '2023-06-23 17:16:13'),
(232, 968, NULL, 'ref 317517361693', '150.000', 1, '2023-06-21 12:13:57', '2023-06-24 17:08:19'),
(233, 1058, NULL, 'ref 317517361731', '200.000', 1, '2023-06-21 22:37:15', '2023-06-24 17:09:16'),
(234, 1109, NULL, NULL, '84.000', 0, '2023-06-22 12:49:54', '2023-06-22 12:49:54'),
(235, 968, NULL, 'ref 317517361771', '70.000', 1, '2023-06-22 12:53:39', '2023-06-24 17:10:40'),
(236, 56, NULL, 'ref 317517361798', '2000.000', 1, '2023-06-22 16:10:52', '2023-06-24 17:11:42'),
(237, 1058, NULL, 'ref 317517361826', '1000.000', 1, '2023-06-22 18:13:05', '2023-06-24 17:12:40'),
(238, 732, NULL, 'ref 317517361857', '360.000', 1, '2023-06-22 20:09:40', '2023-06-24 17:13:39'),
(239, 732, NULL, 'ref no. 3117517362239', '6.000', 1, '2023-06-22 20:09:53', '2023-06-24 17:28:08'),
(240, 956, NULL, 'ref 317517361888', '1000.000', 1, '2023-06-22 21:39:19', '2023-06-24 17:14:39'),
(241, 750, NULL, 'ref 317517361912', '210.000', 1, '2023-06-22 22:07:40', '2023-06-24 17:15:37'),
(242, 1055, NULL, 'ref no 317517361959', '649.000', 1, '2023-06-23 11:49:45', '2023-06-24 17:17:24'),
(243, 902, NULL, 'ref 317517361986', '330.000', 1, '2023-06-23 21:28:56', '2023-06-24 17:18:20'),
(244, 281, NULL, 'ref 317517362008', '190.000', 1, '2023-06-24 00:21:14', '2023-06-24 17:19:17'),
(245, 281, NULL, 'ref 317517362031', '7.000', 1, '2023-06-24 00:21:53', '2023-06-24 17:20:17'),
(246, 1078, NULL, NULL, '220.000', 1, '2023-06-24 12:23:25', '2023-06-24 17:22:03'),
(247, 290, NULL, 'ref no 317517362194', '345.000', 1, '2023-06-24 12:56:51', '2023-06-24 17:26:26'),
(248, 1088, NULL, 'ref no. 317517362217', '110.000', 1, '2023-06-24 16:51:02', '2023-06-24 17:27:18'),
(249, 750, NULL, 'ref 317620383553', '150.000', 1, '2023-06-24 21:48:18', '2023-06-25 20:50:02'),
(250, 734, NULL, 'ref 317620383576', '122.000', 1, '2023-06-24 22:32:05', '2023-06-25 20:50:54'),
(251, 1103, NULL, 'ref 317620383505', '1000.000', 1, '2023-06-25 16:49:01', '2023-06-25 20:47:02'),
(252, 750, NULL, 'ref 317620383553', '160.000', 1, '2023-06-25 19:00:47', '2023-06-25 20:49:38'),
(253, 1058, NULL, 'Ref 317713395616', '1000.000', 1, '2023-06-25 21:13:55', '2023-06-26 13:42:23'),
(254, 734, NULL, 'ref 317820435171', '273.000', 1, '2023-06-26 13:21:58', '2023-06-27 20:21:51'),
(255, 968, NULL, 'ref 317820435193', '490.000', 1, '2023-06-27 12:00:26', '2023-06-27 20:22:41'),
(256, 1088, NULL, 'ref 317820435213', '100.000', 1, '2023-06-27 12:21:07', '2023-06-27 20:23:35'),
(257, 1094, NULL, 'ref 317820435239', '135.000', 1, '2023-06-27 12:23:05', '2023-06-27 20:24:51'),
(258, 813, NULL, 'ref 317820435269', '60.000', 1, '2023-06-27 12:58:14', '2023-06-27 20:25:41'),
(259, 813, NULL, 'ref 317820435291', '60.000', 1, '2023-06-27 17:43:13', '2023-06-27 20:26:34'),
(260, 956, NULL, NULL, '1000.000', 1, '2023-06-27 21:32:32', '2023-06-30 23:29:06'),
(261, 896, NULL, NULL, '87.000', 1, '2023-06-28 10:22:38', '2023-06-30 23:30:34'),
(262, 1150, NULL, NULL, '223.000', 1, '2023-06-28 11:22:58', '2023-06-30 23:32:45'),
(263, 775, NULL, NULL, '574.000', 1, '2023-06-28 11:44:04', '2023-06-30 23:35:45'),
(264, 813, NULL, NULL, '68.000', 1, '2023-06-28 12:48:00', '2023-06-30 23:39:30'),
(265, 1166, NULL, NULL, '160.000', 1, '2023-06-28 22:54:13', '2023-07-02 12:17:52'),
(266, 968, NULL, NULL, '160.000', 1, '2023-06-29 11:42:05', '2023-07-02 12:18:41'),
(267, 902, NULL, NULL, '310.000', 1, '2023-06-29 14:03:41', '2023-07-02 12:19:58'),
(268, 1048, NULL, 'TRF order', '37.000', 1, '2023-06-29 17:24:01', '2023-06-29 17:25:44'),
(269, 845, NULL, NULL, '512.000', 1, '2023-06-29 17:27:08', '2023-07-02 12:20:44'),
(270, 734, NULL, 'ref 319312815577', '600.000', 1, '2023-06-29 23:44:03', '2023-07-12 12:52:15'),
(271, 1058, NULL, NULL, '500.000', 1, '2023-06-30 20:06:55', '2023-07-02 12:21:43'),
(272, 1091, NULL, NULL, '141.000', 1, '2023-07-01 11:55:27', '2023-07-05 14:53:21'),
(273, 1164, NULL, 'ref 318312559159', '132.000', 1, '2023-07-01 12:21:29', '2023-07-02 12:26:30'),
(274, 734, NULL, 'ref 319312815577', '227.000', 1, '2023-07-01 19:00:23', '2023-07-12 12:51:48'),
(275, 1089, NULL, NULL, '395.000', 1, '2023-07-02 14:20:49', '2023-07-05 14:54:18'),
(276, 290, NULL, NULL, '115.000', 1, '2023-07-02 16:37:09', '2023-07-05 14:55:50'),
(277, 1056, NULL, NULL, '300.000', 1, '2023-07-02 16:40:28', '2023-07-06 18:10:50'),
(278, 902, NULL, NULL, '170.000', 1, '2023-07-03 10:39:32', '2023-07-05 14:57:20'),
(279, 943, NULL, '319321829945', '270.000', 1, '2023-07-03 12:43:41', '2023-07-12 21:09:45'),
(280, 968, NULL, NULL, '180.000', 1, '2023-07-03 12:58:54', '2023-07-06 18:06:04'),
(281, 1159, NULL, 'ref 319311812504', '1093.000', 1, '2023-07-03 13:40:06', '2023-07-12 11:24:03'),
(282, 750, NULL, NULL, '360.000', 1, '2023-07-03 21:44:31', '2023-07-05 14:58:38'),
(283, 775, NULL, 'ref 319311812620', '216.000', 1, '2023-07-04 11:42:09', '2023-07-12 11:26:57'),
(284, 1091, NULL, NULL, '122.000', 1, '2023-07-04 16:16:53', '2023-07-06 18:08:22'),
(285, 968, NULL, '319011739268', '400.000', 1, '2023-07-05 12:25:43', '2023-07-09 11:15:30'),
(286, 56, NULL, 'ref 23193159514', '1000.000', 1, '2023-07-06 12:45:35', '2023-07-12 12:50:35'),
(287, 1055, NULL, '319011739095', '600.000', 1, '2023-07-06 22:06:54', '2023-07-09 11:07:50'),
(288, 1055, NULL, '319011739095', '50.000', 1, '2023-07-06 22:07:09', '2023-07-09 11:08:05'),
(289, 1055, NULL, '319011739095', '20.000', 1, '2023-07-06 22:07:20', '2023-07-09 11:08:30'),
(290, 1058, NULL, '319011739249', '600.000', 1, '2023-07-07 09:25:32', '2023-07-09 11:14:11'),
(291, 968, NULL, '319011739989', '300.000', 1, '2023-07-07 20:15:23', '2023-07-09 11:50:32'),
(292, 1150, NULL, 'ref 319312815458', '500.000', 1, '2023-07-07 20:41:30', '2023-07-12 12:48:45'),
(293, 1150, NULL, '319011739293', '130.000', 1, '2023-07-07 20:41:45', '2023-07-09 11:16:39'),
(294, 813, NULL, '319011739320', '30.000', 1, '2023-07-08 13:01:58', '2023-07-09 11:17:36'),
(295, 1103, NULL, 'ref 319312815300', '1000.000', 1, '2023-07-08 14:45:24', '2023-07-12 12:44:16'),
(296, 290, NULL, '319011739967', '207.000', 1, '2023-07-08 15:31:17', '2023-07-09 11:49:44'),
(297, 1086, NULL, NULL, '90.000', 1, '2023-07-08 20:19:47', '2023-07-09 11:12:09'),
(298, 1086, NULL, 'Cash order pick for delivery boy', '154.400', 1, '2023-07-09 11:24:29', '2023-07-09 11:25:22'),
(299, 902, NULL, 'ref 319312815248', '100.000', 1, '2023-07-09 13:10:14', '2023-07-12 12:42:42'),
(300, 1162, NULL, '319321829823', '258.000', 1, '2023-07-09 13:34:52', '2023-07-12 21:02:32'),
(301, 775, NULL, 'ref 319312814846', '442.000', 1, '2023-07-09 15:53:23', '2023-07-12 12:31:37'),
(302, 1157, NULL, '319321829883', '100.000', 1, '2023-07-10 10:40:50', '2023-07-12 21:05:41'),
(303, 281, NULL, 'ref 319311812561', '700.000', 1, '2023-07-10 21:54:43', '2023-07-12 11:25:12'),
(304, 1088, NULL, 'ref 319312814730', '193.000', 1, '2023-07-11 15:55:15', '2023-07-12 12:28:45'),
(305, 1091, NULL, '319321829960', '54.000', 1, '2023-07-12 15:41:22', '2023-07-12 21:10:42'),
(306, 813, NULL, '319321829978', '177.000', 1, '2023-07-12 15:45:11', '2023-07-12 21:11:41'),
(307, 734, NULL, '319321829995', '290.000', 1, '2023-07-12 20:45:31', '2023-07-12 21:13:27'),
(308, 1178, NULL, 'order cash', '338.000', 1, '2023-07-13 15:23:13', '2023-07-14 19:39:50'),
(309, 1159, NULL, 'ref 319711911011\r\nDate : 16.07.2023 \r\n11:35:16', '1072.000', 1, '2023-07-13 16:54:23', '2023-07-16 11:35:45'),
(310, 1089, NULL, 'ref 319821945789', '60.000', 1, '2023-07-13 20:26:27', '2023-07-17 21:18:57'),
(311, 1224, NULL, '319614892874', '340.000', 1, '2023-07-14 11:15:07', '2023-07-15 14:03:32'),
(312, 750, NULL, 'ref 319711910988', '366.000', 1, '2023-07-14 17:28:44', '2023-07-16 11:34:29'),
(313, 734, NULL, 'ref 319821945821', '594.000', 1, '2023-07-15 10:25:03', '2023-07-17 21:20:36'),
(314, 281, NULL, 'ref 319711911061', '240.000', 1, '2023-07-15 18:00:07', '2023-07-16 11:37:20'),
(315, 902, NULL, 'ref 319821945829', '300.000', 1, '2023-07-15 18:22:25', '2023-07-17 21:21:24'),
(316, 968, NULL, 'ref 319821945843', '290.000', 1, '2023-07-15 18:55:15', '2023-07-17 21:22:14'),
(317, 845, NULL, 'ref 319711911095', '176.000', 1, '2023-07-15 20:14:37', '2023-07-16 11:38:28'),
(318, 1178, NULL, 'ref 319821945892', '823.000', 1, '2023-07-16 07:38:43', '2023-07-17 21:25:32'),
(319, 968, NULL, 'ref 319821945919', '100.000', 1, '2023-07-16 12:56:29', '2023-07-17 21:26:38'),
(320, 775, NULL, '319821945934', '150.000', 1, '2023-07-16 16:12:29', '2023-07-17 21:27:41'),
(321, 1206, NULL, 'ref 319821945961', '240.000', 1, '2023-07-16 19:38:21', '2023-07-17 21:30:22'),
(322, 1178, NULL, 'ref 319821945972', '541.000', 1, '2023-07-17 01:43:24', '2023-07-17 21:31:11'),
(323, 896, NULL, 'ref 319821945997', '37.000', 1, '2023-07-17 13:09:14', '2023-07-17 21:32:50'),
(324, 1088, NULL, 'ref 319821946014', '141.000', 1, '2023-07-17 13:10:39', '2023-07-17 21:33:42'),
(325, 968, NULL, 'ref 319821945919', '280.000', 1, '2023-07-17 13:18:29', '2023-07-17 21:26:46'),
(326, 1171, NULL, 'ref 319921970715', '60.000', 1, '2023-07-17 22:45:09', '2023-07-18 21:41:58'),
(327, 813, NULL, 'ref 319921970740', '338.000', 1, '2023-07-18 12:25:29', '2023-07-18 21:42:50'),
(328, 1150, NULL, 'ref 319921970754', '120.000', 1, '2023-07-18 13:01:38', '2023-07-18 21:43:35'),
(329, 1103, NULL, 'ref 320819174715', '1000.000', 1, '2023-07-19 13:47:38', '2023-07-27 19:36:27'),
(330, 968, NULL, 'ref 320021994355', '460.000', 1, '2023-07-19 20:33:35', '2023-07-19 21:06:18'),
(331, 1055, NULL, 'ref 320711134737', '280.000', 1, '2023-07-19 21:38:43', '2023-07-26 11:12:00'),
(332, 318, NULL, 'ref 320923206752', '50.000', 1, '2023-07-20 18:34:39', '2023-07-28 23:36:33'),
(333, 734, NULL, 'ref 320711134493', '263.000', 1, '2023-07-22 12:49:23', '2023-07-26 11:01:50'),
(334, 968, NULL, 'ref 320711134535', '410.000', 1, '2023-07-22 18:15:39', '2023-07-26 11:03:39'),
(335, 968, NULL, 'ref 320711134535', '220.000', 1, '2023-07-22 18:45:46', '2023-07-26 11:04:04'),
(336, 1082, NULL, 'ref 320711134569', '90.000', 1, '2023-07-24 12:50:59', '2023-07-26 11:04:55'),
(337, 1088, NULL, 'ref 320711134591', '300.000', 1, '2023-07-24 15:36:34', '2023-07-26 11:05:40'),
(338, 902, NULL, '320711134616', '150.000', 1, '2023-07-24 16:31:40', '2023-07-26 11:06:36'),
(339, 1206, NULL, 'ref 320711134643', '280.000', 1, '2023-07-26 00:07:59', '2023-07-26 11:08:01'),
(340, 902, NULL, 'ref 320819174763', '225.000', 1, '2023-07-26 17:48:00', '2023-07-27 19:37:47'),
(341, 750, NULL, 'ref 320819174801', '180.000', 1, '2023-07-26 22:22:49', '2023-07-27 19:38:42'),
(342, 1166, NULL, 'ref 32092320676', '840.000', 1, '2023-07-27 11:42:17', '2023-07-28 23:33:21'),
(343, 1088, NULL, 'ref 320819174830', '125.000', 1, '2023-07-27 16:56:27', '2023-07-27 19:39:38'),
(344, 1170, NULL, 'ref 321021229300', '450.000', 1, '2023-07-27 17:26:27', '2023-07-29 21:40:44'),
(345, 1224, NULL, 'ref 321021229313', '343.000', 1, '2023-07-28 09:26:57', '2023-07-29 21:41:40'),
(346, 956, NULL, 'ref 321721417690', '3000.000', 1, '2023-07-28 10:57:26', '2023-08-05 21:46:20'),
(347, 1161, NULL, 'ref 321021229342', '300.000', 1, '2023-07-28 12:21:08', '2023-07-29 21:45:18'),
(348, 1161, NULL, 'ref 321021229342', '90.000', 1, '2023-07-28 12:21:21', '2023-07-29 21:45:43'),
(349, 958, NULL, NULL, '1000.000', 1, '2023-07-28 14:00:04', '2023-08-05 21:48:16'),
(350, 1207, NULL, 'ref 321012215215', '180.000', 1, '2023-07-28 14:11:09', '2023-07-29 12:28:14'),
(351, 1058, NULL, 'ref 321021229370', '2000.000', 1, '2023-07-28 17:36:26', '2023-07-29 21:46:59'),
(352, 1231, NULL, 'ref 320923206766', '138.000', 1, '2023-07-28 18:06:10', '2023-07-28 23:40:20'),
(353, 1166, NULL, 'ref 321021229379', '160.000', 1, '2023-07-28 18:59:07', '2023-07-29 21:47:55'),
(354, 1192, NULL, 'ref testing', '843.000', 1, '2023-07-28 19:47:33', '2023-07-28 20:00:48'),
(355, 1048, NULL, 'ref 321722417974', '320.000', 1, '2023-07-28 19:47:49', '2023-08-05 22:06:13'),
(356, 1206, NULL, 'Ref 321721417739', '720.000', 1, '2023-07-29 00:30:24', '2023-08-05 21:50:03'),
(357, 1207, NULL, 'ref 321418333058', '170.000', 1, '2023-07-29 14:24:51', '2023-08-02 18:48:48'),
(358, 956, NULL, 'ref 321419333490', '1000.000', 1, '2023-07-29 14:32:34', '2023-08-02 19:00:43'),
(359, 1089, NULL, 'ref 321418333108', '81.000', 1, '2023-07-29 19:25:13', '2023-08-02 18:50:36'),
(360, 750, NULL, 'ref 321418333019', '140.000', 1, '2023-07-29 19:29:58', '2023-08-02 18:47:17'),
(361, 1205, NULL, NULL, '460.000', 0, '2023-07-30 17:25:11', '2023-07-30 17:25:11'),
(362, 1162, NULL, 'Ref 321921463582', '480.000', 1, '2023-07-30 21:34:04', '2023-08-07 21:24:14'),
(363, 1088, NULL, 'ref 321418333328', '112.000', 1, '2023-07-31 12:42:46', '2023-08-02 18:56:40'),
(364, 775, NULL, 'ref 321722418204', '1290.000', 1, '2023-07-31 12:43:00', '2023-08-05 22:23:03'),
(365, 1150, NULL, 'ref 321418333445', '110.000', 1, '2023-07-31 19:38:34', '2023-08-02 18:59:21'),
(366, 902, NULL, 'ref 321418333412', '180.000', 1, '2023-08-01 08:33:13', '2023-08-02 18:58:39'),
(367, 290, NULL, 'ref 321418333376', '667.000', 1, '2023-08-01 15:00:07', '2023-08-02 18:57:45'),
(368, 1082, NULL, 'ref 321722418218', '90.000', 1, '2023-08-01 16:35:05', '2023-08-05 22:24:12'),
(369, 1058, NULL, 'ref 321519361895', '500.000', 1, '2023-08-01 16:47:57', '2023-08-03 19:43:28'),
(370, 1112, NULL, 'ref 321519361844', '97.000', 1, '2023-08-02 10:48:21', '2023-08-03 19:41:51'),
(371, 1159, NULL, 'Ref 321815429270', '702.000', 1, '2023-08-02 20:21:03', '2023-08-06 15:54:50'),
(372, 1087, NULL, 'Ref success', '1220.000', 1, '2023-08-02 20:46:55', '2023-08-06 11:33:17'),
(373, 1162, NULL, NULL, '1.000', 1, '2023-08-03 16:56:19', '2023-08-25 07:52:20'),
(374, 1094, NULL, 'Rwf 321811424207', '405.000', 1, '2023-08-03 19:13:36', '2023-08-06 11:29:07'),
(375, 1247, NULL, NULL, '330.000', 1, '2023-08-05 22:53:14', '2023-08-25 07:52:46'),
(376, 750, NULL, 'Ref no. 321921463526', '320.000', 1, '2023-08-06 01:23:15', '2023-08-07 21:21:01'),
(377, 1088, NULL, 'Ref 322213526618', '325.000', 1, '2023-08-07 14:00:21', '2023-08-10 13:50:47'),
(378, 734, NULL, NULL, '592.000', 0, '2023-08-07 23:03:21', '2023-08-07 23:03:21'),
(379, 1058, NULL, 'Ref sucess', '900.000', 1, '2023-08-08 12:02:59', '2023-08-10 23:58:29'),
(380, 56, NULL, 'Ref 3225145552338', '4500.000', 1, '2023-08-08 17:29:04', '2023-08-11 14:19:46'),
(381, 902, NULL, 'ref 322821670848', '340.000', 1, '2023-08-10 11:16:50', '2023-08-16 21:51:01'),
(382, 1082, NULL, 'Ref 323707862692', '86.000', 1, '2023-08-10 17:43:07', '2023-08-25 07:55:04'),
(383, 813, NULL, NULL, '94.000', 1, '2023-08-10 17:51:34', '2023-08-25 07:56:56'),
(384, 968, NULL, '323797862447', '530.000', 1, '2023-08-12 17:08:15', '2023-08-25 07:58:52'),
(385, 1244, NULL, 'ref 322821670768', '391.000', 1, '2023-08-12 20:39:57', '2023-08-16 21:44:23'),
(386, 968, NULL, NULL, '170.000', 0, '2023-08-13 12:55:20', '2023-08-13 12:55:20'),
(387, 1244, NULL, 'ref 322821670742', '449.000', 1, '2023-08-13 13:37:22', '2023-08-16 21:42:09'),
(388, 968, NULL, NULL, '310.000', 0, '2023-08-13 19:21:40', '2023-08-13 19:21:40'),
(389, 1170, NULL, NULL, '600.000', 0, '2023-08-13 22:01:15', '2023-08-13 22:01:15'),
(390, 956, NULL, NULL, '1000.000', 0, '2023-08-14 10:21:02', '2023-08-14 10:21:02'),
(391, 290, NULL, NULL, '115.000', 0, '2023-08-14 17:49:37', '2023-08-14 17:49:37'),
(392, 1058, NULL, NULL, '300.000', 0, '2023-08-16 17:42:08', '2023-08-16 17:42:08'),
(393, 1091, NULL, NULL, '78.000', 0, '2023-08-16 19:06:22', '2023-08-16 19:06:22'),
(394, 968, NULL, NULL, '310.000', 0, '2023-08-17 22:22:21', '2023-08-17 22:22:21'),
(395, 1244, NULL, NULL, '414.000', 0, '2023-08-18 01:16:05', '2023-08-18 01:16:05'),
(396, 750, NULL, 'Ref 323708862788', '210.000', 1, '2023-08-18 21:57:08', '2023-08-25 08:02:04'),
(397, 1091, NULL, NULL, '170.000', 0, '2023-08-19 16:50:39', '2023-08-19 16:50:39'),
(398, 968, NULL, NULL, '180.000', 0, '2023-08-20 11:52:17', '2023-08-20 11:52:17'),
(399, 1087, NULL, NULL, '1457.000', 0, '2023-08-20 11:54:11', '2023-08-20 11:54:11'),
(400, 1166, NULL, NULL, '1130.000', 0, '2023-08-20 19:52:45', '2023-08-20 19:52:45'),
(401, 1055, NULL, NULL, '140.000', 0, '2023-08-21 11:10:17', '2023-08-21 11:10:17'),
(402, 968, NULL, NULL, '60.000', 0, '2023-08-21 12:10:59', '2023-08-21 12:10:59'),
(403, 968, NULL, NULL, '140.000', 0, '2023-08-21 19:09:33', '2023-08-21 19:09:33'),
(404, 902, NULL, NULL, '145.000', 0, '2023-08-22 10:45:34', '2023-08-22 10:45:34'),
(405, 968, NULL, NULL, '80.000', 0, '2023-08-22 14:52:14', '2023-08-22 14:52:14'),
(406, 750, NULL, 'Note\r\n:\r\nRef 323708862788', '120.000', 1, '2023-08-22 14:58:51', '2023-08-25 08:02:26'),
(407, 750, NULL, NULL, '300.000', 0, '2023-08-22 17:12:27', '2023-08-22 17:12:27'),
(408, 968, NULL, NULL, '150.000', 0, '2023-08-23 11:14:41', '2023-08-23 11:14:41'),
(409, 1088, NULL, NULL, '770.000', 0, '2023-08-23 15:01:53', '2023-08-23 15:01:53'),
(410, 290, NULL, NULL, '115.000', 0, '2023-08-24 15:30:35', '2023-08-24 15:30:35'),
(411, 1167, NULL, NULL, '850.000', 0, '2023-08-24 17:19:03', '2023-08-24 17:19:03'),
(412, 1091, NULL, NULL, '356.000', 0, '2023-08-25 10:52:10', '2023-08-25 10:52:10');

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
-- Indexes for table `plans`
--
ALTER TABLE `plans`
  ADD PRIMARY KEY (`id`);

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
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wallet_transactions_old`
--
ALTER TABLE `wallet_transactions_old`
  ADD PRIMARY KEY (`id`),
  ADD KEY `users_id` (`user_id`);

--
-- Indexes for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `withdraw_requests`
--
ALTER TABLE `withdraw_requests`
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
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

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
-- AUTO_INCREMENT for table `plans`
--
ALTER TABLE `plans`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `users_groups`
--
ALTER TABLE `users_groups`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `users_permissions`
--
ALTER TABLE `users_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `wallet_transactions`
--
ALTER TABLE `wallet_transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `wallet_transactions_old`
--
ALTER TABLE `wallet_transactions_old`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `withdraw_requests`
--
ALTER TABLE `withdraw_requests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=413;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
