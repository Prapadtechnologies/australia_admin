-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Aug 20, 2022 at 05:29 AM
-- Server version: 10.5.12-MariaDB-cll-lve
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `u206694750_nextclick`
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
(1, 'middle', '29.jpg', 'jpg', 100240, NULL, '2020-09-11 18:21:42', NULL, NULL, 1),
(2, 'middle', '1.jpg', 'jpg', 100240, NULL, '2020-09-11 18:22:08', NULL, NULL, 1),
(3, 'middle', '24.jpg', 'jpg', 100240, NULL, '2020-09-11 18:22:27', NULL, NULL, 1),
(4, 'bottom', '10.jpg', 'jpg', 100240, NULL, '2020-09-11 18:22:45', NULL, NULL, 1),
(5, 'bottom', '16.jpg', 'jpg', 100240, NULL, '2020-09-11 18:23:08', NULL, NULL, 1),
(6, 'last', '26.jpg', 'jpg', 100240, NULL, '2020-09-11 18:23:33', NULL, NULL, 1),
(7, 'last', '33.jpg', 'jpg', 100240, NULL, '2020-09-11 18:24:02', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `amenities`
--

CREATE TABLE `amenities` (
  `id` int(11) NOT NULL,
  `cat_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `desc` varchar(200) NOT NULL,
  `created_user_id` bigint(20) DEFAULT NULL,
  `updated_user_id` bigint(20) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '0 = deleted, 1 = Active, 2 = Inactive'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
(6, '10.jpg', 'jpg', 100240, NULL, '2020-09-11 18:24:15', NULL, NULL, 1),
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
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` int(50) NOT NULL,
  `vendor_id` bigint(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `desc` varchar(50) NOT NULL,
  `created_user_id` bigint(20) DEFAULT NULL,
  `updated_user_id` bigint(20) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '0=deleted,1=Active,2=Inactive'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `desc` varchar(200) NOT NULL,
  `terms` text NOT NULL,
  `created_user_id` bigint(20) DEFAULT NULL,
  `updated_user_id` bigint(20) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '0 = deleted, 1 = Active, 2 = Inactive'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `desc`, `terms`, `created_user_id`, `updated_user_id`, `created_at`, `updated_at`, `deleted_at`, `status`) VALUES
(1, 'GROCERIES', 'Groceries', '<p>grocery</p>\r\n', 1, 1, '2019-10-07 10:19:22', '2020-09-12 08:56:42', NULL, 1),
(2, 'Travels', 'Book Local Rides,Rent Cars', '', 1, 1, '2019-10-07 10:27:09', '2020-06-15 12:14:40', '2020-08-21 10:08:44', 1),
(3, 'Medicines', 'Medicines', '', 1, 1, '2019-10-07 10:30:48', '2020-09-12 09:08:18', NULL, 1),
(4, 'Beauty Zone', 'Beauty & Accessories', '', 1, 1, '2019-10-07 10:38:18', '2020-09-12 09:12:16', NULL, 1),
(5, 'Food & Restaurants', 'Food & Restaurants', '', 1, 1, '2019-10-07 10:46:29', '2020-06-15 12:16:19', NULL, 1),
(6, 'Hospitals', 'Hospitals', '', 1, 1, '2019-10-07 10:49:59', '2020-06-15 12:16:49', NULL, 1),
(7, 'Agriculture', 'Agriculture', '', 1, 1, '2019-10-07 10:58:44', '2020-06-15 12:17:26', NULL, 1),
(8, 'Function Halls', 'Function Halls & Caterers', '', 1, 1, '2019-10-07 11:00:46', '2020-08-21 10:00:53', NULL, 1),
(9, 'On Demand Service', 'On Demand Service', '<p>Terms And Conditions</p>\r\n', 1, 1, '2020-01-11 11:06:48', '2020-08-21 10:01:01', NULL, 1),
(10, 'Bus Tickets', 'Tickets', '<p>Terms And Conditions</p>\r\n', 1, 1, '2020-01-11 11:10:55', '2020-08-21 10:04:06', '2020-08-20 10:23:23', 0),
(11, 'Courier', 'Courier', '<p>Terms And Conditions</p>\r\n', 1, 1, '2020-01-11 11:20:46', '2020-06-15 12:23:53', '2020-08-21 10:09:32', 0),
(12, 'Hire Anything', 'Hire Anything', '<p>Terms And Conditions</p>\r\n', 1, 1, '2020-01-11 11:21:17', '2020-06-15 12:24:39', '2020-08-21 10:09:43', 0),
(13, 'Event management', 'Event management', '<p>Terms And Conditions</p>\r\n', 1, NULL, '2020-01-11 11:22:00', NULL, NULL, 0),
(14, 'Automobiles', 'Automobiles', '<p>Terms And Conditions</p>\r\n', 1, 1, '2020-01-11 11:22:37', '2020-06-15 12:26:30', NULL, 0),
(15, 'Packers & movers', 'Packers & movers', '<p>Terms And Conditions</p>\r\n', 1, 1, '2020-01-11 11:23:10', '2020-06-15 12:27:09', NULL, 0),
(16, 'Diagnostic Centres', 'All types of services', '<p>Terms And Conditions</p>\r\n', 1, 1, '2020-01-11 11:23:50', '2020-06-15 12:27:39', '2020-08-21 10:10:50', 0),
(17, 'Flowers', 'Flowers', '<p>Terms And Conditions</p>\r\n', 1, 1, '2020-01-11 11:24:33', '2020-06-15 12:28:45', NULL, 0),
(18, 'E-Commerce', 'E-Commerce Products', '<p>Terms And Conditions</p>\r\n', 1, 1, '2020-01-12 15:13:41', '2020-05-03 19:57:24', NULL, 0),
(54, 'FLOWER', 'FRESH', '<p>Terms And Conditions</p>\r\n', 1, NULL, '2020-09-12 00:09:33', NULL, NULL, 1),
(55, 'BONDAM', 'FLY', '<p>Terms And Conditions</p>\r\n', 1, NULL, '2020-09-12 19:51:38', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `categories_brands`
--

CREATE TABLE `categories_brands` (
  `id` int(11) NOT NULL,
  `cat_id` int(11) NOT NULL,
  `brand_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `categories_services`
--

CREATE TABLE `categories_services` (
  `id` int(11) NOT NULL,
  `cat_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '0 = deleted, 1 = Active, 2 = Inactive'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories_services`
--

INSERT INTO `categories_services` (`id`, `cat_id`, `service_id`, `created_at`, `updated_at`, `deleted_at`, `status`) VALUES
(1, 54, 724, '2020-09-11 18:39:33', NULL, NULL, 1),
(2, 1, 1, '2020-09-12 03:26:42', NULL, NULL, 1),
(3, 1, 2, '2020-09-12 03:26:42', NULL, NULL, 1),
(4, 1, 723, '2020-09-12 03:26:42', NULL, NULL, 1),
(5, 1, 724, '2020-09-12 03:26:42', NULL, NULL, 1),
(6, 1, 725, '2020-09-12 03:26:42', NULL, NULL, 1),
(7, 1, 726, '2020-09-12 03:26:42', NULL, NULL, 1),
(8, 1, 727, '2020-09-12 03:26:42', NULL, NULL, 1),
(9, 3, 1, '2020-09-12 03:38:18', NULL, NULL, 1),
(10, 3, 2, '2020-09-12 03:38:18', NULL, NULL, 1),
(11, 3, 723, '2020-09-12 03:38:18', NULL, NULL, 1),
(12, 3, 724, '2020-09-12 03:38:18', NULL, NULL, 1),
(13, 3, 725, '2020-09-12 03:38:18', NULL, NULL, 1),
(14, 3, 726, '2020-09-12 03:38:18', NULL, NULL, 1),
(15, 3, 727, '2020-09-12 03:38:18', NULL, NULL, 1),
(16, 4, 724, '2020-09-12 03:42:16', NULL, NULL, 1),
(17, 55, 724, '2020-09-12 14:21:38', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `cat_banners`
--

CREATE TABLE `cat_banners` (
  `id` int(11) NOT NULL,
  `cat_id` bigint(20) NOT NULL,
  `image` varchar(100) NOT NULL,
  `ext` varchar(50) NOT NULL,
  `created_user_id` bigint(20) DEFAULT NULL,
  `updated_user_id` bigint(20) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '0=deleted,1=Active,2=Inactive'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cat_banners`
--

INSERT INTO `cat_banners` (`id`, `cat_id`, `image`, `ext`, `created_user_id`, `updated_user_id`, `created_at`, `updated_at`, `deleted_at`, `status`) VALUES
(1, 1, 'download.jpg', 'jpg', 1, NULL, '2020-08-25 17:10:37', NULL, NULL, 1),
(2, 17, 'BID WING.jpg', 'jpg', 1, NULL, '2020-09-11 18:34:51', NULL, NULL, 1),
(3, 9, '1.psd', 'psd', 1, NULL, '2020-09-11 18:35:06', NULL, NULL, 1),
(4, 5, 'BONDA.jpg', 'jpg', 1, NULL, '2020-09-11 18:35:21', NULL, NULL, 1),
(5, 1, 'corn flour.jpg', 'jpg', 1, NULL, '2020-09-11 18:35:51', NULL, NULL, 1),
(6, 5, 'BONDA.jpg', 'jpg', 1, NULL, '2020-09-12 20:09:20', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `constituencies`
--

CREATE TABLE `constituencies` (
  `id` int(11) NOT NULL,
  `state_id` int(11) NOT NULL,
  `district_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `pincode` int(11) NOT NULL,
  `created_user_id` bigint(20) DEFAULT NULL,
  `updated_user_id` bigint(20) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '0 = deleted, 1 = Active, 2 = Inactive'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `constituencies`
--

INSERT INTO `constituencies` (`id`, `state_id`, `district_id`, `name`, `pincode`, `created_user_id`, `updated_user_id`, `created_at`, `updated_at`, `deleted_at`, `status`) VALUES
(1, 1, 1, 'ANANTAPUR URBAN', 515001, 1, 1, '2019-10-11 09:34:15', '2019-10-11 10:53:31', NULL, 1),
(2, 1, 1, 'DHARMAVARAM', 515671, 1, 1, '2019-10-11 10:19:41', '2019-10-11 10:27:48', NULL, 1),
(3, 1, 1, 'GUNTAKAL', 515801, 1, NULL, '2019-10-11 10:27:29', NULL, NULL, 1),
(4, 1, 3, 'HINDUPUR', 515201, 1, 1, '2019-10-11 10:28:48', '2019-10-14 11:31:21', '2019-12-04 13:36:49', 1),
(5, 1, 1, 'KADIRI', 515591, 1, NULL, '2019-10-11 10:29:21', NULL, NULL, 1),
(6, 1, 1, 'KALYANDURG', 515761, 1, NULL, '2019-10-11 10:29:46', NULL, NULL, 1),
(7, 1, 1, 'MADAKASIRA', 515301, 1, NULL, '2019-10-11 10:30:11', NULL, NULL, 1),
(8, 1, 1, 'PENUKONDA', 515110, 1, NULL, '2019-10-11 10:30:41', NULL, NULL, 1),
(9, 1, 1, 'PUTTAPARTHI', 515134, 1, NULL, '2019-10-11 10:31:14', NULL, NULL, 1),
(10, 1, 1, 'RAPTADU', 515722, 1, NULL, '2019-10-11 10:31:50', NULL, NULL, 1),
(11, 1, 1, 'RAYADURG', 515865, 1, NULL, '2019-10-11 10:33:43', NULL, NULL, 1),
(12, 1, 1, 'SINGANAMALA', 515435, 1, NULL, '2019-10-11 10:34:04', NULL, NULL, 1),
(13, 1, 1, 'TADIPATRI', 515411, 1, NULL, '2019-10-11 10:34:32', NULL, NULL, 1),
(14, 1, 1, 'URAVAKONDA', 515812, 1, NULL, '2019-10-11 10:35:04', NULL, NULL, 1),
(15, 1, 2, 'CHANDRAGIRI', 517101, 1, NULL, '2019-10-11 10:36:03', NULL, NULL, 1),
(16, 1, 2, 'CHITTOOR', 517001, 1, NULL, '2019-10-11 10:36:43', NULL, NULL, 1),
(17, 1, 2, 'GANGADHARA NELLORE', 517125, 1, NULL, '2019-10-11 10:37:16', NULL, NULL, 1),
(18, 1, 2, 'KUPPAM', 517425, 1, NULL, '2019-10-11 10:38:00', NULL, NULL, 1),
(19, 2, 31, 'MADANAPALLE', 517325, 1, 1, '2019-10-11 10:38:37', '2019-10-14 11:31:56', NULL, 1),
(20, 1, 2, 'NAGARI', 517590, 1, NULL, '2019-10-11 10:39:06', NULL, NULL, 1),
(21, 1, 2, 'PALAMANER', 517408, 1, NULL, '2019-10-11 10:39:33', NULL, NULL, 1),
(22, 1, 2, 'PILERU', 517214, 1, NULL, '2019-10-11 10:40:13', NULL, NULL, 1),
(23, 1, 2, 'PUNGANUR', 517247, 1, NULL, '2019-10-11 10:40:41', NULL, NULL, 1),
(24, 1, 2, 'PUTHALAPATTU', 517124, 1, NULL, '2019-10-11 10:41:11', NULL, NULL, 1),
(25, 1, 2, 'SATYAVEDU', 517588, 1, NULL, '2019-10-11 10:41:39', NULL, NULL, 1),
(26, 1, 2, 'SRIKALAHASTI', 517644, 1, NULL, '2019-10-11 10:42:13', NULL, NULL, 1),
(27, 1, 2, 'THAMBALLAPALLE', 517418, 1, NULL, '2019-10-11 10:42:57', NULL, NULL, 1),
(28, 1, 2, 'TIRUPATI', 517501, 1, NULL, '2019-10-11 10:43:24', NULL, NULL, 1),
(29, 1, 3, 'AMALAPURAM', 533201, 1, NULL, '2019-10-11 10:44:15', NULL, NULL, 1),
(30, 1, 3, 'ANAPARTHY', 533342, 1, NULL, '2019-10-11 10:44:49', NULL, NULL, 1),
(31, 1, 3, 'GANNAVARAM', 521101, 1, NULL, '2019-10-11 10:45:32', NULL, NULL, 1),
(32, 1, 3, 'JAGGAMPETA', 533435, 1, NULL, '2019-10-11 10:45:53', NULL, '2019-12-04 13:49:01', 1),
(33, 1, 3, 'KAKINADA CITY', 533001, 1, NULL, '2019-10-11 10:46:29', NULL, NULL, 1),
(34, 1, 3, 'KAKINADA RURAL', 533006, 1, NULL, '2019-10-11 10:47:16', NULL, NULL, 1),
(35, 1, 3, 'KOTHAPETA', 533223, 1, NULL, '2019-10-11 10:48:32', NULL, NULL, 1),
(36, 1, 3, 'MANDAPETA', 533308, 1, NULL, '2019-10-11 10:48:54', NULL, NULL, 1),
(37, 1, 3, 'MUMMIDIVARAM', 533216, 1, NULL, '2019-10-11 10:49:17', NULL, NULL, 1),
(38, 1, 3, 'PEDDAPURAM', 533437, 1, NULL, '2019-10-11 10:49:43', NULL, NULL, 1),
(39, 1, 3, 'PITHAPURAM', 533450, 1, NULL, '2019-10-11 10:50:08', NULL, NULL, 1),
(40, 1, 3, 'PRATHIPADU', 522019, 1, NULL, '2019-10-11 10:50:27', NULL, NULL, 1),
(41, 1, 3, 'RAJAHMUNDRY CITY', 533101, 1, NULL, '2019-10-11 10:50:56', NULL, NULL, 1),
(42, 1, 3, 'RAJAMUNDRY RURAL', 581359, 1, NULL, '2019-10-11 10:51:20', NULL, NULL, 1),
(43, 1, 3, 'RAJANAGARAM', 533294, 1, NULL, '2019-10-11 10:51:41', NULL, NULL, 1),
(44, 1, 3, 'RAMACHANDRAPURAM', 533255, 1, NULL, '2019-10-11 10:52:07', NULL, NULL, 1),
(45, 1, 3, 'RAMPACHODAVARAM', 533288, 1, NULL, '2019-10-11 10:52:32', NULL, NULL, 1),
(46, 1, 3, 'RAZOLE', 533242, 1, NULL, '2019-10-11 10:54:09', NULL, NULL, 1),
(47, 1, 3, 'TUNI Constituency', 533401, 1, NULL, '2019-10-11 10:55:05', NULL, NULL, 1),
(48, 1, 4, 'BAPATLA', 522101, 1, NULL, '2019-10-11 10:56:03', NULL, NULL, 1),
(49, 1, 4, 'CHILAKALURIPET', 522616, 1, NULL, '2019-10-11 10:56:56', NULL, NULL, 1),
(50, 1, 1, 'GUNTUR EAST', 522124, 1, NULL, '2019-10-11 10:57:58', NULL, NULL, 1),
(51, 1, 4, 'GUNTUR WEST', 522001, 1, NULL, '2019-10-11 10:58:35', NULL, NULL, 1),
(52, 1, 4, 'GURAZALA', 522415, 1, NULL, '2019-10-11 10:59:07', NULL, NULL, 1),
(53, 1, 4, 'MACHERLA', 522426, 1, NULL, '2019-10-11 10:59:49', NULL, NULL, 1),
(54, 1, 4, 'MANGALAGIRI', 522503, 1, NULL, '2019-10-11 11:00:23', NULL, NULL, 1),
(55, 1, 4, 'NARASARAOPET', 522601, 1, NULL, '2019-10-11 11:00:50', NULL, NULL, 1),
(56, 1, 4, 'PEDAKURAPADU', 522402, 1, NULL, '2019-10-11 11:01:13', NULL, NULL, 1),
(57, 1, 4, 'PONNUR', 522124, 1, NULL, '2019-10-11 11:01:43', NULL, NULL, 1),
(58, 1, 4, 'PRATHIPADU (SC)', 522019, 1, NULL, '2019-10-11 11:02:24', NULL, NULL, 1),
(59, 1, 4, 'REPALLE', 522265, 1, NULL, '2019-10-11 11:02:48', NULL, NULL, 1),
(60, 1, 4, 'SATTENAPALLI', 522403, 1, NULL, '2019-10-11 11:03:21', NULL, NULL, 1),
(61, 1, 4, 'TADIKONDA (SC)', 522236, 1, NULL, '2019-10-11 11:03:51', NULL, NULL, 1),
(62, 1, 4, 'TENALI', 522201, 1, NULL, '2019-10-11 11:04:18', NULL, NULL, 1),
(63, 1, 4, 'VEMURU (SC)', 522261, 1, NULL, '2019-10-11 11:05:08', NULL, NULL, 1),
(64, 1, 4, 'VINUKONDA', 522647, 1, NULL, '2019-10-11 11:05:32', NULL, NULL, 1),
(65, 1, 13, 'BADVEL', 516227, 1, NULL, '2019-10-11 11:14:59', NULL, '2019-12-05 16:51:07', 1),
(66, 1, 13, 'JAMMALAMADUGU', 516434, 1, NULL, '2019-10-11 11:15:26', NULL, '2019-12-05 16:52:42', 1),
(67, 1, 13, 'KADAPA', 516001, 1, NULL, '2019-10-11 11:16:22', NULL, '2019-12-05 16:52:32', 1),
(68, 1, 13, 'KAMALAPURAM', 516289, 1, NULL, '2019-10-11 11:16:46', NULL, '2019-12-05 16:52:23', 1),
(69, 1, 13, 'KODUR', 516101, 1, NULL, '2019-10-11 11:17:22', NULL, '2019-12-05 16:51:26', 1),
(70, 1, 13, 'MYDUKUR', 516172, 1, NULL, '2019-10-11 11:17:49', NULL, '2019-12-05 16:50:41', 1),
(71, 1, 13, 'PRODDATUR', 516360, 1, NULL, '2019-10-11 11:18:33', NULL, '2019-12-05 16:52:13', 1),
(72, 1, 13, 'PULIVENDLA', 516390, 1, NULL, '2019-10-11 11:18:56', NULL, '2019-12-05 16:52:01', 1),
(73, 1, 13, 'RAJAMPET', 516115, 1, NULL, '2019-10-11 11:19:25', NULL, '2019-12-05 16:51:51', 1),
(74, 1, 13, 'RAYACHOTI', 516269, 1, NULL, '2019-10-11 11:19:56', NULL, '2019-12-05 16:51:36', 1),
(75, 1, 1, 'AVANIGADDA', 521121, 1, NULL, '2019-10-11 11:20:47', NULL, NULL, 1),
(76, 1, 5, 'GANNAVARAM', 521101, 1, NULL, '2019-10-11 11:21:51', NULL, NULL, 1),
(77, 1, 5, 'GUDIVADA', 521301, 1, NULL, '2019-10-11 11:23:46', NULL, NULL, 1),
(78, 1, 5, 'JAGGAYYAPETA', 521175, 1, NULL, '2019-10-11 11:26:54', NULL, NULL, 1),
(79, 1, 5, 'KAIKALUR', 521175, 1, NULL, '2019-10-11 12:20:06', NULL, NULL, 1),
(80, 1, 5, 'MACHILIPATNAM', 521001, 1, NULL, '2019-10-11 12:20:37', NULL, NULL, 1),
(81, 1, 5, 'MYLAVARAM', 521230, 1, NULL, '2019-10-11 12:21:05', NULL, NULL, 1),
(82, 1, 5, 'NANDIGAMA', 521185, 1, NULL, '2019-10-11 12:21:34', NULL, NULL, 1),
(83, 1, 5, 'NUZVID', 521201, 1, NULL, '2019-10-11 12:22:13', NULL, NULL, 1),
(84, 6, 136, 'Goa 1', 534250, 1, NULL, '2019-10-14 08:12:43', NULL, '2019-10-14 13:50:57', 1),
(85, 1, 8, 'Ichapuram', 552222, 1, NULL, '2019-10-14 13:50:17', NULL, '2019-10-14 13:50:49', 1),
(86, 1, 699, 'hgfhfgh', 502036, 1, NULL, '2019-10-23 10:54:42', NULL, '2019-11-08 12:57:07', 1),
(87, 25, 549, 'Adilabad', 504001, 1, NULL, '2019-11-11 07:43:33', NULL, NULL, 1),
(88, 25, 549, 'Boath', 504304, 1, NULL, '2019-11-11 07:44:27', NULL, NULL, 1),
(89, 25, 550, 'Pinapaka', 507117, 1, NULL, '2019-11-11 07:45:35', NULL, NULL, 1),
(90, 25, 550, 'Yellandu', 507123, 1, NULL, '2019-11-11 07:46:19', NULL, NULL, 1),
(91, 25, 550, 'Bhadrachalam', 507111, 1, NULL, '2019-11-11 07:47:03', NULL, NULL, 1),
(92, 25, 550, 'Kothagudem', 507101, 1, NULL, '2019-11-11 07:48:18', NULL, NULL, 1),
(93, 25, 550, 'Aswaraopet', 507301, 1, NULL, '2019-11-11 07:48:48', NULL, '2019-12-04 13:56:22', 1),
(94, 25, 551, 'Malakpet', 500036, 1, NULL, '2019-11-11 07:49:37', NULL, NULL, 1),
(95, 25, 551, 'Amberpet', 500013, 1, NULL, '2019-11-11 07:50:13', NULL, NULL, 1),
(96, 25, 551, 'Musheerabad', 500020, 1, NULL, '2019-11-11 07:50:50', NULL, NULL, 1),
(97, 25, 551, 'Khairatabad', 500004, 1, NULL, '2019-11-11 07:51:22', NULL, NULL, 1),
(98, 25, 551, 'Jubileehills', 500033, 1, NULL, '2019-11-11 07:51:47', NULL, NULL, 1),
(99, 25, 551, 'Sanathnagar', 500018, 1, NULL, '2019-11-11 07:52:17', NULL, NULL, 1),
(100, 25, 551, 'Nampally', 500012, 1, NULL, '2019-11-11 07:53:08', NULL, NULL, 1),
(101, 25, 551, 'Karwan', 500006, 1, NULL, '2019-11-11 07:53:53', NULL, NULL, 1),
(102, 25, 551, 'Goshamahal', 500012, 1, NULL, '2019-11-11 07:54:47', NULL, NULL, 1),
(103, 25, 551, 'Charminar', 500002, 1, NULL, '2019-11-11 07:55:30', NULL, NULL, 1),
(104, 25, 551, 'Chandrayangutta', 500005, 1, NULL, '2019-11-11 07:56:07', NULL, NULL, 1),
(105, 25, 551, 'Yukutpura', 500023, 1, NULL, '2019-11-11 07:56:51', NULL, '2019-12-05 16:43:15', 1),
(106, 25, 551, 'Bahadurpura', 500064, 1, NULL, '2019-11-11 07:57:25', NULL, NULL, 1),
(107, 25, 551, 'Secunderabad', 500003, 1, NULL, '2019-11-11 07:58:00', NULL, NULL, 1),
(108, 25, 551, 'Secunderabad(Cantonment)', 500094, 1, NULL, '2019-11-11 07:58:31', NULL, NULL, 1),
(109, 25, 552, 'Koratla', 505326, 1, NULL, '2019-11-11 07:59:32', NULL, NULL, 1),
(110, 25, 552, 'Jagtial', 505327, 1, NULL, '2019-11-11 08:00:01', NULL, NULL, 1),
(111, 25, 552, 'Dharmapuri', 636701, 1, NULL, '2019-11-11 08:00:34', NULL, NULL, 1),
(112, 25, 553, 'Jangaon', 506167, 1, NULL, '2019-11-11 08:01:35', NULL, NULL, 1),
(113, 25, 553, 'Ghanpur(Station)', 506143, 1, NULL, '2019-11-11 08:02:12', NULL, NULL, 1),
(114, 25, 553, 'Palakurthi', 506317, 1, NULL, '2019-11-11 08:02:40', NULL, NULL, 1),
(115, 25, 554, 'Mulug', 506345, 1, 1, '2019-11-11 08:03:17', '2019-11-11 08:03:27', NULL, 1),
(116, 25, 554, 'Bhupalpally', 506169, 1, NULL, '2019-11-11 08:04:01', NULL, NULL, 1),
(117, 25, 555, 'Gadwal', 509125, 1, NULL, '2019-11-11 08:04:41', NULL, NULL, 1),
(118, 25, 555, 'Alampur', 509152, 1, NULL, '2019-11-11 08:05:09', NULL, NULL, 1),
(119, 25, 556, 'Jukkal(SC)', 503310, 1, NULL, '2019-11-11 08:06:21', NULL, NULL, 1),
(120, 25, 556, 'Banswada', 503187, 1, NULL, '2019-11-11 08:06:50', NULL, NULL, 1),
(121, 25, 556, 'Yellareddy', 503122, 1, NULL, '2019-11-11 08:07:15', NULL, NULL, 1),
(122, 25, 556, 'Kamareddy', 503111, 1, NULL, '2019-11-11 08:07:42', NULL, NULL, 1),
(123, 25, 557, 'Manakondur(SC)', 505469, 1, NULL, '2019-11-11 08:08:36', NULL, NULL, 1),
(124, 25, 557, 'Huzurabad', 505468, 1, NULL, '2019-11-11 08:09:02', NULL, NULL, 1),
(125, 25, 558, 'Khammam', 507001, 1, NULL, '2019-11-12 06:50:43', NULL, NULL, 1),
(126, 25, 558, 'Palair', 507157, 1, NULL, '2019-11-12 06:51:47', NULL, NULL, 1),
(127, 25, 558, 'Madhira', 507203, 1, NULL, '2019-11-12 06:53:22', NULL, NULL, 1),
(128, 25, 558, 'Wyra Constituency', 507165, 1, NULL, '2019-11-12 06:55:05', NULL, NULL, 1),
(129, 25, 558, 'Sathupally', 507303, 1, NULL, '2019-11-12 06:56:13', NULL, NULL, 1),
(130, 25, 559, 'Sirpur', 504299, 1, NULL, '2019-11-12 06:57:32', NULL, '2019-12-04 13:58:37', 1),
(131, 25, 559, 'Asifabad', 504293, 1, NULL, '2019-11-12 06:59:01', NULL, '2019-12-04 13:58:15', 1),
(132, 25, 560, 'Dornakal', 506381, 1, NULL, '2019-11-12 07:03:24', NULL, NULL, 1),
(133, 25, 561, 'Mahabubabad', 506101, 1, NULL, '2019-11-12 07:06:41', NULL, NULL, 1),
(134, 25, 562, 'Chennur', 504201, 1, NULL, '2019-11-12 07:07:37', NULL, NULL, 1),
(135, 25, 562, 'Bellampalli', 504251, 1, NULL, '2019-11-12 07:20:05', NULL, NULL, 1),
(136, 25, 562, 'Mancherial', 504208, 1, NULL, '2019-11-12 07:20:52', NULL, NULL, 1),
(137, 25, 563, 'Medak', 502110, 1, NULL, '2019-11-12 07:55:03', NULL, NULL, 1),
(138, 25, 563, 'Patancheru', 502319, 1, NULL, '2019-11-12 07:55:35', NULL, NULL, 1),
(139, 25, 564, 'Malkajgiri', 500047, 1, NULL, '2019-11-12 07:56:20', NULL, NULL, 1),
(140, 25, 564, 'Medchal', 501401, 1, NULL, '2019-11-12 07:56:52', NULL, NULL, 1),
(141, 25, 564, 'Quthballapur', 500090, 1, NULL, '2019-11-12 07:57:47', NULL, NULL, 1),
(142, 25, 564, 'Kukatpally', 500072, 1, NULL, '2019-11-12 07:58:21', NULL, NULL, 1),
(143, 25, 564, 'Uppal', 500039, 1, NULL, '2019-11-12 07:58:54', NULL, NULL, 1),
(144, 25, 565, 'NagarKurnool', 509209, 1, NULL, '2019-11-13 06:28:55', NULL, NULL, 1),
(145, 25, 565, 'Achampet', 509375, 1, NULL, '2019-11-13 06:30:59', NULL, NULL, 1),
(146, 25, 565, 'Kalwakurthy', 509324, 1, NULL, '2019-11-13 06:36:11', NULL, NULL, 1),
(147, 25, 565, 'Kollapur', 509102, 1, NULL, '2019-11-13 06:38:18', NULL, NULL, 1),
(148, 25, 566, 'Devarakonda', 508248, 1, NULL, '2019-11-13 06:45:01', NULL, NULL, 1),
(149, 25, 566, 'Nagarjuna Sagar', 522439, 1, NULL, '2019-11-13 06:54:56', NULL, NULL, 1),
(150, 25, 566, 'Miryalaguda', 508207, 1, NULL, '2019-11-13 07:18:26', NULL, NULL, 1),
(151, 25, 566, 'Nalgonda', 508001, 1, NULL, '2019-11-13 07:19:15', NULL, NULL, 1),
(152, 25, 566, 'Munugode', 508244, 1, NULL, '2019-11-13 07:19:53', NULL, NULL, 1),
(153, 25, 566, 'Nakrekal', 508211, 1, NULL, '2019-11-13 07:20:37', NULL, NULL, 1),
(154, 25, 567, 'Khanapur', 591302, 1, NULL, '2019-11-13 07:21:33', NULL, NULL, 1),
(155, 25, 567, 'Nirmal', 504106, 1, NULL, '2019-11-13 07:22:26', NULL, NULL, 1),
(156, 25, 567, 'Mudhole', 504102, 1, NULL, '2019-11-13 07:24:21', NULL, NULL, 1),
(157, 25, 568, 'Bodhan', 503185, 1, NULL, '2019-11-13 07:25:12', NULL, NULL, 1),
(158, 25, 568, 'Nizamabad(Urban)', 503001, 1, NULL, '2019-11-13 07:26:01', NULL, NULL, 1),
(159, 25, 568, 'Nizamabad(Rural)', 503001, 1, NULL, '2019-11-13 07:26:52', NULL, NULL, 1),
(160, 25, 568, 'Balkonda', 503217, 1, NULL, '2019-11-13 07:28:11', NULL, NULL, 1),
(161, 25, 568, 'Armoor', 503224, 1, NULL, '2019-11-13 07:28:52', NULL, NULL, 1),
(162, 25, 569, 'Ramagundam', 505208, 1, NULL, '2019-11-13 07:29:36', NULL, NULL, 1),
(163, 25, 569, 'Manthani', 505184, 1, NULL, '2019-11-13 07:32:23', NULL, NULL, 1),
(164, 25, 569, 'Peddapalli', 505172, 1, NULL, '2019-11-13 07:33:07', NULL, NULL, 1),
(165, 25, 570, 'Vemulawada', 505302, 1, NULL, '2019-11-13 07:33:49', NULL, NULL, 1),
(166, 25, 570, 'Sircilla', 505301, 1, NULL, '2019-11-13 07:34:24', NULL, NULL, 1),
(167, 25, 571, 'Ibrahimpatanam', 501506, 1, NULL, '2019-11-13 07:35:08', NULL, NULL, 1),
(168, 25, 571, 'L.B Nagar(Lalbahadurnagar)', 500074, 1, NULL, '2019-11-13 07:35:51', NULL, NULL, 1),
(169, 25, 571, 'Maheshwaram', 501359, 1, NULL, '2019-11-13 07:36:23', NULL, NULL, 1),
(170, 25, 571, 'Rajendranagar', 500030, 1, NULL, '2019-11-13 07:37:01', NULL, NULL, 1),
(171, 25, 571, 'Serilingampally', 500019, 1, NULL, '2019-11-13 07:37:29', NULL, NULL, 1),
(172, 25, 571, 'Chevella', 501503, 1, NULL, '2019-11-13 07:38:07', NULL, NULL, 1),
(173, 25, 571, 'Shadnagar', 509216, 1, NULL, '2019-11-13 07:40:04', NULL, NULL, 1),
(174, 25, 572, 'Narayankhed', 502286, 1, NULL, '2019-11-13 07:40:38', NULL, NULL, 1),
(175, 25, 572, 'Andole', 502273, 1, NULL, '2019-11-13 07:41:10', NULL, NULL, 1),
(176, 25, 572, 'Narsapur', 534275, 1, NULL, '2019-11-13 07:42:18', NULL, NULL, 1),
(177, 25, 572, 'Zahirabad', 502220, 1, NULL, '2019-11-13 07:43:26', NULL, NULL, 1),
(178, 25, 572, 'Sangareddy', 502001, 1, NULL, '2019-11-13 07:44:28', NULL, NULL, 1),
(179, 25, 573, 'Siddipet', 502103, 1, NULL, '2019-11-13 07:45:13', NULL, NULL, 1),
(180, 25, 573, 'Husnanad', 505467, 1, NULL, '2019-11-13 08:04:14', NULL, NULL, 1),
(181, 25, 573, 'Dubbak', 502108, 1, NULL, '2019-11-13 08:05:05', NULL, NULL, 1),
(182, 25, 573, 'Gajwal', 502278, 1, NULL, '2019-11-13 08:05:51', NULL, '2019-12-04 14:03:08', 1),
(183, 25, 574, 'Huzurnagar', 508204, 1, NULL, '2019-11-18 06:26:37', NULL, NULL, 1),
(184, 25, 574, 'Kodad', 508206, 1, NULL, '2019-11-18 06:27:07', NULL, NULL, 1),
(185, 25, 574, 'Suryapet', 508213, 1, NULL, '2019-11-18 06:27:38', NULL, NULL, 1),
(186, 25, 574, 'Thungathurthi', 508280, 1, NULL, '2019-11-18 06:28:30', NULL, NULL, 1),
(187, 25, 575, 'Pargi', 501501, 1, NULL, '2019-11-18 06:29:26', NULL, NULL, 1),
(188, 25, 575, 'Vikarabad', 501101, 1, NULL, '2019-11-18 06:29:54', NULL, NULL, 1),
(189, 25, 575, 'Tandur', 501141, 1, NULL, '2019-11-18 06:47:43', NULL, NULL, 1),
(190, 25, 575, 'Kodangal', 509338, 1, NULL, '2019-11-18 06:49:12', NULL, '2019-12-04 14:44:31', 1),
(191, 25, 577, 'Narsampet', 506132, 1, NULL, '2019-11-18 06:52:07', NULL, NULL, 1),
(192, 25, 577, 'Parkal', 506164, 1, NULL, '2019-11-18 06:52:49', NULL, NULL, 1),
(193, 25, 577, 'Wardhanapet', 506313, 1, NULL, '2019-11-18 06:53:27', NULL, NULL, 1),
(194, 25, 578, 'Warangal(West)', 506002, 1, NULL, '2019-11-18 06:54:17', NULL, NULL, 1),
(195, 25, 578, 'Warangal(East)', 506002, 1, NULL, '2019-11-18 06:55:34', NULL, NULL, 1),
(196, 25, 579, 'Alair', 508101, 1, NULL, '2019-11-18 06:56:34', NULL, NULL, 1),
(197, 25, 579, 'Bhongir', 508116, 1, NULL, '2019-11-18 06:57:12', NULL, NULL, 1),
(198, 25, 576, 'Wanaparthy', 509103, 1, NULL, '2019-11-18 06:58:37', NULL, NULL, 1),
(199, 25, 577, 'BHUPALPALE', 506169, 1, NULL, '2019-12-04 13:13:24', NULL, NULL, 1),
(200, 25, 578, 'Wardhanpet', 506313, 1, NULL, '2019-12-04 13:23:05', NULL, NULL, 1),
(201, 25, 577, 'Warangal East', 506002, 1, NULL, '2019-12-04 13:24:06', NULL, '2019-12-04 13:24:27', 1),
(202, 25, 578, 'Mulugu', 506381, 1, NULL, '2019-12-04 13:25:22', NULL, NULL, 1),
(203, 25, 577, 'Narasampet', 506132, 1, NULL, '2019-12-04 13:27:22', NULL, NULL, 1),
(204, 25, 557, 'Choppadandi', 505415, 1, NULL, '2019-12-04 13:28:28', NULL, NULL, 1),
(205, 25, 557, 'Husnabad', 505467, 1, NULL, '2019-12-04 13:29:03', NULL, NULL, 1),
(206, 25, 557, 'karimnagar', 505001, 1, NULL, '2019-12-04 13:30:09', NULL, NULL, 1),
(207, 25, 557, 'Kothapalli', 505304, 1, NULL, '2019-12-04 13:30:45', NULL, NULL, 1),
(208, 25, 557, 'Siricilla', 505301, 1, NULL, '2019-12-04 13:31:26', NULL, NULL, 1),
(209, 25, 557, 'Peddapalle', 581353, 1, NULL, '2019-12-04 13:32:33', NULL, NULL, 1),
(210, 1, 1, 'Hindupur', 515201, 1, NULL, '2019-12-04 13:37:41', NULL, NULL, 1),
(211, 1, 4, 'Chilakaluripeta', 522616, 1, NULL, '2019-12-04 13:39:54', NULL, NULL, 1),
(212, 1, 11, 'Bobbili', 535558, 1, NULL, '2019-12-04 13:42:58', NULL, NULL, 1),
(213, 1, 11, 'Cheepurpalle', 535128, 1, NULL, '2019-12-04 13:43:59', NULL, NULL, 1),
(214, 1, 11, 'Gajapathinagaram', 535270, 1, NULL, '2019-12-04 13:44:30', NULL, NULL, 1),
(215, 1, 11, 'Kurupam', 535524, 1, NULL, '2019-12-04 13:44:58', NULL, NULL, 1),
(216, 1, 11, 'Nellimarla', 535217, 1, NULL, '2019-12-04 13:45:28', NULL, NULL, 1),
(217, 1, 11, 'Parvathipuram', 535501, 1, NULL, '2019-12-04 13:45:57', NULL, NULL, 1),
(218, 1, 11, 'Salur', 535591, 1, NULL, '2019-12-04 13:46:20', NULL, NULL, 1),
(219, 1, 11, 'Srungavarapu Kota', 535145, 1, NULL, '2019-12-04 13:47:02', NULL, NULL, 1),
(220, 1, 11, 'Vizianagaram', 535001, 1, NULL, '2019-12-04 13:47:30', NULL, NULL, 1),
(221, 1, 3, 'Jaggampeta', 533435, 1, NULL, '2019-12-04 13:49:47', NULL, NULL, 1),
(222, 25, 558, 'Aswaraopeta', 507301, 1, NULL, '2019-12-04 13:56:53', NULL, NULL, 1),
(223, 25, 549, 'Sirpur', 504299, 1, NULL, '2019-12-04 14:01:14', NULL, NULL, 1),
(224, 25, 549, 'Asifabad', 504293, 1, NULL, '2019-12-04 14:01:42', NULL, NULL, 1),
(225, 25, 563, 'Gajwel', 502278, 1, NULL, '2019-12-04 14:03:48', NULL, NULL, 1),
(226, 25, 563, 'Zaheerabad', 502220, 1, NULL, '2019-12-04 14:04:59', NULL, NULL, 1),
(227, 25, 571, 'Quthbullapur', 500054, 1, NULL, '2019-12-04 14:07:08', NULL, NULL, 1),
(228, 1, 7, 'Addanki', 523201, 1, NULL, '2019-12-04 14:08:17', NULL, NULL, 1),
(229, 1, 7, 'Giddalur', 523357, 1, NULL, '2019-12-04 14:08:58', NULL, NULL, 1),
(230, 1, 7, 'Kondapi', 523270, 1, NULL, '2019-12-04 14:09:24', NULL, NULL, 1),
(231, 1, 7, 'Parchur', 523169, 1, NULL, '2019-12-04 14:09:45', NULL, NULL, 1),
(232, 1, 7, 'Chirala', 523155, 1, NULL, '2019-12-04 14:10:16', NULL, NULL, 1),
(233, 1, 7, 'Kandukur', 523105, 1, NULL, '2019-12-04 14:10:44', NULL, NULL, 1),
(234, 1, 7, 'Markapur', 523316, 1, NULL, '2019-12-04 14:11:38', NULL, NULL, 1),
(235, 1, 7, 'Santhanuthalapadu', 523225, 1, NULL, '2019-12-04 14:12:14', NULL, NULL, 1),
(236, 1, 7, 'Darsi', 523247, 1, NULL, '2019-12-04 14:13:12', NULL, NULL, 1),
(237, 1, 7, 'Kangiri', 523230, 1, NULL, '2019-12-04 14:13:46', NULL, NULL, 1),
(238, 1, 7, 'Ongole', 523001, 1, NULL, '2019-12-04 14:14:12', NULL, NULL, 1),
(239, 1, 7, 'Yerragondapalem', 523327, 1, NULL, '2019-12-04 14:15:09', NULL, NULL, 1),
(240, 1, 5, 'Pamarru', 521157, 1, NULL, '2019-12-04 14:16:25', NULL, NULL, 1),
(241, 1, 5, 'Tiruvuru', 521235, 1, NULL, '2019-12-04 14:17:04', NULL, NULL, 1),
(242, 1, 5, 'Vijayawada Central', 520001, 1, NULL, '2019-12-04 14:17:46', NULL, NULL, 1),
(243, 1, 5, 'Pedana', 521366, 1, NULL, '2019-12-04 14:18:41', NULL, NULL, 1),
(244, 1, 5, 'Vijayawada West', 521456, 1, NULL, '2019-12-04 14:19:18', NULL, NULL, 1),
(245, 1, 5, 'Vijayawada East', 520007, 1, NULL, '2019-12-04 14:19:42', NULL, NULL, 1),
(246, 1, 5, 'Penamaluru', 521139, 1, NULL, '2019-12-04 14:20:38', NULL, NULL, 1),
(247, 1, 6, 'Adoni', 518301, 1, NULL, '2019-12-04 14:21:40', NULL, NULL, 1),
(248, 1, 6, 'Banaganaapalle', 518124, 1, NULL, '2019-12-04 14:22:05', NULL, NULL, 1),
(249, 1, 6, 'kurnool', 518001, 1, NULL, '2019-12-04 14:22:28', NULL, NULL, 1),
(250, 1, 6, 'Nandyala', 518501, 1, NULL, '2019-12-04 14:22:50', NULL, NULL, 1),
(251, 1, 6, 'Srisailam', 518101, 1, NULL, '2019-12-04 14:27:35', NULL, NULL, 1),
(252, 1, 6, 'Allagadda', 518508, 1, NULL, '2019-12-04 14:27:59', NULL, NULL, 1),
(253, 1, 6, 'Dhone', 518222, 1, NULL, '2019-12-04 14:28:21', NULL, NULL, 1),
(254, 1, 6, 'Mantralayam', 518345, 1, NULL, '2019-12-04 14:28:48', NULL, NULL, 1),
(255, 1, 6, 'Panyam', 518112, 1, NULL, '2019-12-04 14:29:08', NULL, NULL, 1),
(256, 1, 6, 'Yemmiganur', 518360, 1, NULL, '2019-12-04 14:29:39', NULL, NULL, 1),
(257, 1, 6, 'Almur', 518395, 1, NULL, '2019-12-04 14:29:58', NULL, NULL, 1),
(258, 1, 6, 'Kodumur', 518464, 1, NULL, '2019-12-04 14:30:21', NULL, NULL, 1),
(259, 1, 6, 'Nandikotkur', 518401, 1, NULL, '2019-12-04 14:30:54', NULL, NULL, 1),
(260, 1, 6, 'Pattikonda', 518380, 1, NULL, '2019-12-04 14:31:19', NULL, NULL, 1),
(261, 1, 10, 'Anakapalli', 531001, 1, NULL, '2019-12-04 14:32:11', NULL, NULL, 1),
(262, 1, 10, 'Chodavaram', 531036, 1, NULL, '2019-12-04 14:32:38', NULL, NULL, 1),
(263, 1, 10, 'Narsipatnam', 531116, 1, NULL, '2019-12-04 14:33:03', NULL, NULL, 1),
(264, 1, 10, 'Visakhapatnam East', 530003, 1, NULL, '2019-12-04 14:35:02', NULL, NULL, 1),
(265, 1, 10, 'Visakhapatnam West', 530045, 1, NULL, '2019-12-04 14:37:04', NULL, NULL, 1),
(266, 1, 10, 'Visakapatnam South', 500017, 1, 1, '2019-12-04 14:38:23', '2019-12-04 14:39:19', NULL, 1),
(267, 1, 10, 'Visakhapatnam North', 530013, 1, NULL, '2019-12-04 14:39:50', NULL, NULL, 1),
(268, 1, 10, 'Pendurthi', 530051, 1, NULL, '2019-12-04 14:40:16', NULL, NULL, 1),
(269, 1, 10, 'Araku Valley', 531151, 1, NULL, '2019-12-04 14:40:41', NULL, NULL, 1),
(270, 1, 10, 'Gajuwaka', 530026, 1, NULL, '2019-12-04 14:41:08', NULL, NULL, 1),
(271, 1, 10, 'Penderu', 531024, 1, NULL, '2019-12-04 14:41:33', NULL, NULL, 1),
(272, 1, 10, 'Bhimili', 531163, 1, NULL, '2019-12-04 14:41:55', NULL, NULL, 1),
(273, 1, 10, 'Madugula', 531027, 1, NULL, '2019-12-04 14:42:20', NULL, NULL, 1),
(274, 1, 10, 'Payakaraaopeta', 531126, 1, NULL, '2019-12-04 14:42:50', NULL, NULL, 1),
(275, 1, 10, 'Yelamanchili', 531055, 1, NULL, '2019-12-04 14:43:21', NULL, NULL, 1),
(276, 25, 561, 'Kodangal', 509338, 1, NULL, '2019-12-04 14:45:05', NULL, NULL, 1),
(277, 25, 561, 'Narayanpet', 509210, 1, NULL, '2019-12-04 14:45:57', NULL, NULL, 1),
(278, 25, 561, 'Mahabubnagar', 509001, 1, NULL, '2019-12-04 14:46:45', NULL, NULL, 1),
(279, 25, 561, 'Jadcherla', 509301, 1, NULL, '2019-12-04 14:47:22', NULL, NULL, 1),
(280, 25, 561, 'Devarkadra', 509204, 1, NULL, '2019-12-04 14:48:07', NULL, NULL, 1),
(281, 25, 561, 'Makthal', 509208, 1, NULL, '2019-12-04 14:48:44', NULL, NULL, 1),
(282, 25, 561, 'Shadnagar', 509216, 1, NULL, '2019-12-04 14:49:22', NULL, NULL, 1),
(283, 25, 561, 'Nagarkurnool', 509209, 1, NULL, '2019-12-04 14:50:22', NULL, NULL, 1),
(284, 25, 561, 'Achampet', 509375, 1, NULL, '2019-12-04 14:50:47', NULL, NULL, 1),
(285, 25, 561, 'Wanaparthy', 509103, 1, NULL, '2019-12-04 14:51:13', NULL, NULL, 1),
(286, 25, 561, 'Kalwakurthy', 509324, 1, NULL, '2019-12-04 14:51:44', NULL, NULL, 1),
(287, 25, 561, 'Alampur', 509152, 1, NULL, '2019-12-04 14:52:10', NULL, NULL, 1),
(288, 25, 561, 'Kollapur', 509102, 1, NULL, '2019-12-05 16:32:03', NULL, NULL, 1),
(289, 25, 561, 'Gadwal', 509125, 1, NULL, '2019-12-05 16:32:27', NULL, NULL, 1),
(290, 1, 8, 'Amudalavalasa', 532185, 1, NULL, '2019-12-05 16:33:59', NULL, NULL, 1),
(291, 1, 8, 'Etcherla', 532410, 1, NULL, '2019-12-05 16:35:33', NULL, NULL, 1),
(292, 1, 8, 'Ichapuram', 532312, 1, NULL, '2019-12-05 16:36:05', NULL, NULL, 1),
(293, 1, 8, 'Narasannapeta', 532421, 1, NULL, '2019-12-05 16:37:09', NULL, NULL, 1),
(294, 1, 8, 'Palakonda', 532440, 1, NULL, '2019-12-05 16:37:41', NULL, NULL, 1),
(295, 1, 8, 'Palasa', 532221, 1, NULL, '2019-12-05 16:38:23', NULL, NULL, 1),
(296, 1, 8, 'Pathapatnam', 532213, 1, NULL, '2019-12-05 16:39:52', NULL, NULL, 1),
(297, 1, 8, 'Rajam', 532127, 1, NULL, '2019-12-05 16:40:29', NULL, NULL, 1),
(298, 1, 8, 'Srikakulam', 532001, 1, NULL, '2019-12-05 16:41:08', NULL, NULL, 1),
(299, 1, 8, 'Tekkali', 532001, 1, NULL, '2019-12-05 16:41:36', NULL, NULL, 1),
(300, 25, 551, 'Yakutpura', 500023, 1, NULL, '2019-12-05 16:43:49', NULL, NULL, 1),
(301, 1, 703, 'Badvel', 516227, 1, NULL, '2019-12-05 16:53:46', NULL, NULL, 1),
(302, 1, 703, 'Kamalapuram', 516289, 1, NULL, '2019-12-05 16:54:11', NULL, NULL, 1),
(303, 1, 703, 'Proddatur', 516360, 1, NULL, '2019-12-05 16:54:36', NULL, NULL, 1),
(304, 1, 703, 'Jammalamadugu', 516434, 1, NULL, '2019-12-05 16:55:09', NULL, NULL, 1),
(305, 1, 703, 'Rayachoti', 516269, 1, NULL, '2019-12-05 16:55:34', NULL, NULL, 1),
(306, 1, 703, 'Kodur', 516101, 1, NULL, '2019-12-05 16:55:56', NULL, NULL, 1),
(307, 1, 703, 'Pulivendula', 516390, 1, NULL, '2019-12-05 16:56:24', NULL, NULL, 1),
(308, 1, 703, 'Kadapa', 516001, 1, NULL, '2019-12-05 16:57:29', NULL, '2019-12-07 20:24:04', 1),
(309, 1, 703, 'Mydukur', 516172, 1, NULL, '2019-12-05 16:58:00', NULL, NULL, 1),
(310, 1, 703, 'Rajampet', 516115, 1, NULL, '2019-12-05 16:58:22', NULL, NULL, 1),
(311, 1, 704, 'Atmakur', 524322, 1, NULL, '2019-12-05 16:59:57', NULL, NULL, 1),
(312, 1, 704, 'Kovur', 524137, 1, NULL, '2019-12-05 17:00:19', NULL, NULL, 1),
(313, 1, 704, 'Sarvepalli', 524321, 1, NULL, '2019-12-05 17:00:42', NULL, NULL, 1),
(314, 1, 704, 'Udayagiri', 524226, 1, NULL, '2019-12-05 17:01:11', NULL, NULL, 1),
(315, 1, 704, 'Gudur', 524101, 1, NULL, '2019-12-05 17:01:34', NULL, NULL, 1),
(316, 1, 704, 'Nellore City', 524001, 1, NULL, '2019-12-05 17:02:18', NULL, NULL, 1),
(317, 1, 704, 'Sullurpeta', 524121, 1, NULL, '2019-12-05 17:02:48', NULL, NULL, 1),
(318, 1, 704, 'Kavali', 524201, 1, NULL, '2019-12-05 17:03:11', NULL, NULL, 1),
(319, 1, 704, 'Nellore Rural', 524320, 1, NULL, '2019-12-05 17:03:41', NULL, NULL, 1),
(320, 1, 704, 'Venkatagiri', 524132, 1, NULL, '2019-12-05 17:04:42', NULL, NULL, 1),
(321, 1, 12, 'Achanta', 534123, 1, NULL, '2019-12-05 17:06:14', NULL, NULL, 1),
(322, 1, 12, 'Denduluru', 534432, 1, NULL, '2019-12-05 17:06:41', NULL, NULL, 1),
(323, 1, 12, 'Kovvur', 534350, 1, NULL, '2019-12-05 17:07:06', NULL, NULL, 1),
(324, 1, 12, 'Palakollu', 534260, 1, NULL, '2019-12-05 17:07:37', NULL, NULL, 1),
(325, 1, 12, 'Tanuku', 534211, 1, NULL, '2019-12-05 17:07:59', NULL, NULL, 1),
(326, 1, 12, 'Bhimavaram', 534201, 1, NULL, '2019-12-05 17:08:27', NULL, NULL, 1),
(327, 1, 12, 'Eluru', 534001, 1, NULL, '2019-12-05 17:08:56', NULL, NULL, 1),
(328, 1, 12, 'Narsapuram', 534275, 1, NULL, '2019-12-05 17:09:58', NULL, NULL, 1),
(329, 1, 12, 'Polavaram', 534315, 1, NULL, '2019-12-05 17:10:32', NULL, NULL, 1),
(330, 1, 12, 'Undi ( AP)', 534199, 1, NULL, '2019-12-05 17:12:11', NULL, NULL, 1),
(331, 1, 12, 'Chintalapudi', 534460, 1, NULL, '2019-12-05 17:12:42', NULL, NULL, 1),
(332, 1, 12, 'Gopalapuram', 534316, 1, NULL, '2019-12-05 17:13:11', NULL, NULL, 1),
(333, 1, 12, 'Nidadavole', 534301, 1, NULL, '2019-12-05 17:13:39', NULL, NULL, 1),
(334, 1, 12, 'Tadepalligudem', 534101, 1, NULL, '2019-12-05 17:14:14', NULL, NULL, 1),
(335, 1, 12, 'Unguturu', 534411, 1, NULL, '2019-12-05 17:15:17', NULL, NULL, 1),
(336, 1, 1, 'srssrs', 225566, 1, NULL, '2019-12-05 20:51:06', NULL, '2019-12-05 20:51:18', 1),
(337, 1, 703, 'Cuddapah', 516001, 1, NULL, '2019-12-07 20:24:53', NULL, NULL, 1),
(338, 1, 703, 'Cuddapah', 516001, 1, NULL, '2019-12-07 20:24:53', NULL, '2019-12-11 13:50:03', 1),
(339, 1, 4, 'GUNTUR EAST', 522002, 1, NULL, '2020-02-11 14:27:37', NULL, NULL, 1),
(340, 25, 571, 'Kukatpally', 500072, 1, 1, '2020-03-08 05:08:08', '2020-03-08 05:12:49', NULL, 1);

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
-- Table structure for table `days`
--

CREATE TABLE `days` (
  `id` tinyint(4) NOT NULL,
  `name` varchar(10) NOT NULL,
  `short_name` varchar(5) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '0 = deleted, 1 = Active, 2 = Inactive'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `deleted_items`
--

CREATE TABLE `deleted_items` (
  `id` int(11) NOT NULL,
  `vendor_id` bigint(20) NOT NULL,
  `item_id` bigint(20) NOT NULL,
  `created_user_id` bigint(20) DEFAULT NULL,
  `updated_user_id` bigint(20) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '0 = deleted, 1 = Active, 2 = Inactive'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `delivery_boy_settings`
--

CREATE TABLE `delivery_boy_settings` (
  `id` int(50) NOT NULL,
  `user_id` int(11) NOT NULL,
  `delivery_boy_status` tinyint(1) NOT NULL DEFAULT 2 COMMENT '1=Available, 2=Not-Available',
  `latitude` varchar(50) NOT NULL,
  `longitude` varchar(50) NOT NULL,
  `created_user_id` bigint(20) DEFAULT NULL,
  `updated_user_id` bigint(20) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '0=deleted,1=Active,2=Inactive'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `districts`
--

CREATE TABLE `districts` (
  `id` int(11) NOT NULL,
  `state_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `created_user_id` bigint(20) DEFAULT NULL,
  `updated_user_id` bigint(20) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '0 = deleted, 1 = Active, 2 = Inactive'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `districts`
--

INSERT INTO `districts` (`id`, `state_id`, `name`, `created_user_id`, `updated_user_id`, `created_at`, `updated_at`, `deleted_at`, `status`) VALUES
(1, 1, 'Anantapur', 1, 1, '2019-10-11 05:55:47', '2019-10-11 12:47:02', NULL, 1),
(2, 1, 'Chittoor', 1, NULL, '2019-10-11 05:56:09', NULL, NULL, 1),
(3, 1, 'East Godavari', 1, NULL, '2019-10-11 05:56:20', NULL, NULL, 1),
(4, 1, 'Guntur', 1, NULL, '2019-10-11 05:56:32', NULL, NULL, 1),
(5, 1, 'Krishna', 1, NULL, '2019-10-11 05:56:47', NULL, NULL, 1),
(6, 1, 'Kurnool', 1, NULL, '2019-10-11 05:56:56', NULL, NULL, 1),
(7, 1, 'Prakasam', 1, NULL, '2019-10-11 05:57:10', NULL, NULL, 1),
(8, 1, 'Srikakulam', 1, NULL, '2019-10-11 05:57:17', NULL, NULL, 1),
(9, 1, 'Sri Potti Sriramulu Nellore', 1, NULL, '2019-10-11 05:57:32', NULL, '2019-12-07 20:27:46', 1),
(10, 1, 'Visakhapatnam', 1, NULL, '2019-10-11 05:57:41', NULL, NULL, 1),
(11, 1, 'Vizianagaram', 1, NULL, '2019-10-11 05:57:57', NULL, NULL, 1),
(12, 1, 'West Godavari', 1, NULL, '2019-10-11 05:58:15', NULL, NULL, 1),
(13, 1, 'Kadapa', 1, NULL, '2019-10-11 05:58:23', NULL, '2019-12-07 20:25:21', 1),
(14, 2, 'Anjaw', 1, NULL, '2019-10-11 05:59:10', NULL, NULL, 1),
(15, 2, 'Changlang', 1, NULL, '2019-10-11 05:59:17', NULL, NULL, 1),
(16, 2, 'Dibang Valley', 1, NULL, '2019-10-11 05:59:26', NULL, NULL, 1),
(17, 2, 'East Kameng', 1, NULL, '2019-10-11 05:59:32', NULL, NULL, 1),
(18, 2, 'East Siang', 1, NULL, '2019-10-11 05:59:40', NULL, NULL, 1),
(19, 2, 'Kamle', 1, NULL, '2019-10-11 05:59:50', NULL, NULL, 1),
(20, 2, 'Kra Daadi', 1, NULL, '2019-10-11 05:59:59', NULL, NULL, 1),
(21, 2, 'Kurung Kumey', 1, NULL, '2019-10-11 06:00:06', NULL, NULL, 1),
(22, 2, 'Lepa Rada', 1, NULL, '2019-10-11 06:00:13', NULL, NULL, 1),
(23, 2, 'Lohit', 1, NULL, '2019-10-11 06:00:21', NULL, NULL, 1),
(24, 2, 'Longding', 1, NULL, '2019-10-11 06:00:33', NULL, NULL, 1),
(25, 2, 'Lower Dibang Valley', 1, NULL, '2019-10-11 06:00:41', NULL, NULL, 1),
(26, 2, 'Lower Siang', 1, NULL, '2019-10-11 06:00:50', NULL, NULL, 1),
(27, 2, 'Lower Subansiri', 1, NULL, '2019-10-11 06:00:58', NULL, NULL, 1),
(28, 2, 'Namsai', 1, NULL, '2019-10-11 06:01:05', NULL, NULL, 1),
(29, 2, 'Pakke Kessang', 1, NULL, '2019-10-11 06:01:12', NULL, NULL, 1),
(30, 2, 'Papum Pare', 1, NULL, '2019-10-11 06:01:24', NULL, NULL, 1),
(31, 2, 'Shi Yomi', 1, NULL, '2019-10-11 06:01:30', NULL, NULL, 1),
(32, 2, 'Siang', 1, NULL, '2019-10-11 06:01:37', NULL, NULL, 1),
(33, 2, 'Tawang', 1, NULL, '2019-10-11 06:01:44', NULL, NULL, 1),
(34, 2, 'Tirap', 1, NULL, '2019-10-11 06:01:50', NULL, NULL, 1),
(35, 2, 'Upper Siang', 1, NULL, '2019-10-11 06:02:00', NULL, NULL, 1),
(36, 2, 'Upper Subansiri', 1, NULL, '2019-10-11 06:02:07', NULL, NULL, 1),
(37, 2, 'West Kameng', 1, NULL, '2019-10-11 06:02:14', NULL, NULL, 1),
(38, 3, 'Baksa', 1, NULL, '2019-10-11 06:02:46', NULL, NULL, 1),
(39, 3, 'Barpeta', 1, NULL, '2019-10-11 06:02:58', NULL, NULL, 1),
(40, 3, 'Biswanath', 1, NULL, '2019-10-11 06:03:05', NULL, NULL, 1),
(41, 3, 'Bongaigaon', 1, NULL, '2019-10-11 06:03:11', NULL, NULL, 1),
(42, 3, 'Cachar', 1, NULL, '2019-10-11 06:03:18', NULL, NULL, 1),
(43, 3, 'Charaideo', 1, NULL, '2019-10-11 06:03:26', NULL, NULL, 1),
(44, 3, 'Chirang', 1, NULL, '2019-10-11 06:03:32', NULL, NULL, 1),
(45, 3, 'Darrang', 1, NULL, '2019-10-11 06:03:40', NULL, NULL, 1),
(46, 3, 'Dhemaji', 1, NULL, '2019-10-11 06:03:47', NULL, NULL, 1),
(47, 3, 'Dhubri', 1, NULL, '2019-10-11 06:03:57', NULL, NULL, 1),
(48, 3, 'Dibrugarh', 1, NULL, '2019-10-11 06:04:04', NULL, NULL, 1),
(49, 3, 'Dima Hasao (North Cachar Hills)', 1, NULL, '2019-10-11 06:04:12', NULL, NULL, 1),
(50, 3, 'Goalpara', 1, NULL, '2019-10-11 06:04:21', NULL, NULL, 1),
(51, 3, 'Golaghat', 1, NULL, '2019-10-11 06:04:27', NULL, NULL, 1),
(52, 3, 'Hailakandi', 1, NULL, '2019-10-11 06:04:35', NULL, NULL, 1),
(53, 3, 'Hojai', 1, NULL, '2019-10-11 06:04:43', NULL, NULL, 1),
(54, 3, 'Jorhat', 1, NULL, '2019-10-11 06:04:52', NULL, NULL, 1),
(55, 3, 'Kamrup', 1, NULL, '2019-10-11 06:05:00', NULL, NULL, 1),
(56, 3, 'Kamrup Metropolitan', 1, NULL, '2019-10-11 06:05:06', NULL, NULL, 1),
(57, 3, 'Karbi Anglong', 1, NULL, '2019-10-11 06:05:15', NULL, NULL, 1),
(58, 3, 'Karimganj', 1, NULL, '2019-10-11 06:05:24', NULL, NULL, 1),
(59, 3, 'Kokrajhar', 1, NULL, '2019-10-11 06:05:35', NULL, NULL, 1),
(60, 3, 'Lakhimpur', 1, NULL, '2019-10-11 06:05:42', NULL, NULL, 1),
(61, 3, 'Majuli', 1, NULL, '2019-10-11 06:06:08', NULL, NULL, 1),
(62, 3, 'Morigaon', 1, NULL, '2019-10-11 06:06:13', NULL, NULL, 1),
(63, 3, 'Nagaon', 1, NULL, '2019-10-11 06:06:22', NULL, NULL, 1),
(64, 3, 'Nalbari', 1, NULL, '2019-10-11 06:06:28', NULL, NULL, 1),
(65, 3, 'Sivasagar', 1, NULL, '2019-10-11 06:06:35', NULL, NULL, 1),
(66, 3, 'Sonitpur', 1, NULL, '2019-10-11 06:06:42', NULL, NULL, 1),
(67, 3, 'South Salamara-Mankachar', 1, NULL, '2019-10-11 06:06:50', NULL, NULL, 1),
(68, 3, 'Tinsukia', 1, NULL, '2019-10-11 06:06:58', NULL, NULL, 1),
(69, 3, 'Udalguri', 1, NULL, '2019-10-11 06:07:05', NULL, NULL, 1),
(70, 3, 'West Karbi Anglong', 1, NULL, '2019-10-11 06:07:12', NULL, NULL, 1),
(71, 4, 'Araria', 1, NULL, '2019-10-11 06:07:50', NULL, NULL, 1),
(72, 4, 'Arwal', 1, NULL, '2019-10-11 06:07:57', NULL, NULL, 1),
(73, 4, 'Aurangabad', 1, NULL, '2019-10-11 06:08:05', NULL, NULL, 1),
(74, 4, 'Banka', 1, NULL, '2019-10-11 06:08:14', NULL, NULL, 1),
(75, 4, 'Begusarai', 1, NULL, '2019-10-11 06:08:21', NULL, NULL, 1),
(76, 4, 'Bhagalpur', 1, NULL, '2019-10-11 06:08:28', NULL, NULL, 1),
(77, 4, 'Bhojpur', 1, NULL, '2019-10-11 06:08:36', NULL, NULL, 1),
(78, 4, 'Buxar', 1, NULL, '2019-10-11 06:08:50', NULL, NULL, 1),
(79, 4, 'Darbhanga', 1, NULL, '2019-10-11 06:09:08', NULL, NULL, 1),
(80, 4, 'East Champaran (Motihari)', 1, NULL, '2019-10-11 06:09:16', NULL, NULL, 1),
(81, 4, 'Gaya dt', 1, NULL, '2019-10-11 06:10:17', NULL, NULL, 1),
(82, 4, 'Jamui', 1, NULL, '2019-10-11 06:10:26', NULL, NULL, 1),
(83, 4, 'Jehanabad', 1, NULL, '2019-10-11 06:10:34', NULL, NULL, 1),
(84, 4, 'Kaimur (Bhabua)', 1, NULL, '2019-10-11 06:10:41', NULL, NULL, 1),
(85, 4, 'Katihar', 1, NULL, '2019-10-11 06:10:50', NULL, NULL, 1),
(86, 4, 'Khagaria', 1, NULL, '2019-10-11 06:10:56', NULL, NULL, 1),
(87, 4, 'Kishanganj', 1, NULL, '2019-10-11 06:11:04', NULL, NULL, 1),
(88, 4, 'Lakhisarai', 1, NULL, '2019-10-11 06:11:12', NULL, NULL, 1),
(89, 4, 'Madhepura', 1, NULL, '2019-10-11 06:11:20', NULL, NULL, 1),
(90, 4, 'Madhubani', 1, NULL, '2019-10-11 06:11:30', NULL, NULL, 1),
(91, 4, 'Munger (Monghyr)', 1, NULL, '2019-10-11 06:11:39', NULL, NULL, 1),
(92, 4, 'Muzaffarpur', 1, NULL, '2019-10-11 06:11:46', NULL, NULL, 1),
(93, 4, 'Nalanda', 1, NULL, '2019-10-11 06:11:56', NULL, NULL, 1),
(94, 4, 'Nawada', 1, NULL, '2019-10-11 06:12:03', NULL, NULL, 1),
(95, 4, 'Patna', 1, NULL, '2019-10-11 06:12:09', NULL, NULL, 1),
(96, 4, 'Purnia (Purnea)', 1, NULL, '2019-10-11 06:12:17', NULL, NULL, 1),
(97, 4, 'Rohtas', 1, NULL, '2019-10-11 06:12:26', NULL, NULL, 1),
(98, 4, 'Saharsa', 1, NULL, '2019-10-11 06:12:36', NULL, NULL, 1),
(99, 4, 'Samastipur', 1, NULL, '2019-10-11 06:12:43', NULL, NULL, 1),
(100, 4, 'Saran', 1, NULL, '2019-10-11 06:12:50', NULL, NULL, 1),
(101, 4, 'Sheikhpura', 1, NULL, '2019-10-11 06:12:57', NULL, NULL, 1),
(102, 4, 'Sheohar', 1, NULL, '2019-10-11 06:13:04', NULL, NULL, 1),
(103, 4, 'Sitamarhi', 1, NULL, '2019-10-11 06:13:14', NULL, NULL, 1),
(104, 4, 'Siwan', 1, NULL, '2019-10-11 06:13:20', NULL, NULL, 1),
(105, 4, 'Supaul', 1, NULL, '2019-10-11 06:13:27', NULL, NULL, 1),
(106, 4, 'Vaishali', 1, NULL, '2019-10-11 06:13:40', NULL, NULL, 1),
(107, 4, 'West Champaran', 1, NULL, '2019-10-11 06:13:45', NULL, NULL, 1),
(108, 5, 'Balod', 1, NULL, '2019-10-11 06:14:14', NULL, NULL, 1),
(109, 5, 'Baloda Bazar', 1, NULL, '2019-10-11 06:14:23', NULL, NULL, 1),
(110, 5, 'Balrampur', 1, NULL, '2019-10-11 06:14:31', NULL, NULL, 1),
(111, 5, 'Bastar', 1, NULL, '2019-10-11 06:14:40', NULL, NULL, 1),
(112, 5, 'Bemetara', 1, NULL, '2019-10-11 06:14:47', NULL, NULL, 1),
(113, 5, 'Bijapur', 1, NULL, '2019-10-11 06:14:55', NULL, NULL, 1),
(114, 5, 'Bilaspur', 1, NULL, '2019-10-11 06:15:03', NULL, NULL, 1),
(115, 5, 'Dantewada (South Bastar)', 1, NULL, '2019-10-11 06:15:11', NULL, NULL, 1),
(116, 5, 'Dhamtari', 1, NULL, '2019-10-11 06:15:19', NULL, NULL, 1),
(117, 5, 'Durg dt', 1, NULL, '2019-10-11 06:15:40', NULL, NULL, 1),
(118, 5, 'Gariyaband', 1, NULL, '2019-10-11 06:15:46', NULL, NULL, 1),
(119, 5, 'Janjgir-Champa', 1, NULL, '2019-10-11 06:15:56', NULL, NULL, 1),
(120, 5, 'Jashpur', 1, NULL, '2019-10-11 06:16:03', NULL, NULL, 1),
(121, 5, 'Kabirdham (Kawardha)', 1, NULL, '2019-10-11 06:16:10', NULL, NULL, 1),
(122, 5, 'Kanker (North Bastar)', 1, NULL, '2019-10-11 06:16:18', NULL, NULL, 1),
(123, 5, 'Kondagaon', 1, NULL, '2019-10-11 06:16:25', NULL, NULL, 1),
(124, 5, 'Korba', 1, NULL, '2019-10-11 06:16:32', NULL, NULL, 1),
(125, 5, 'Korea (Koriya)', 1, NULL, '2019-10-11 06:16:42', NULL, NULL, 1),
(126, 5, 'Mahasamund', 1, NULL, '2019-10-11 06:16:49', NULL, NULL, 1),
(127, 5, 'Mungeli', 1, NULL, '2019-10-11 06:16:59', NULL, NULL, 1),
(128, 5, 'Narayanpur', 1, NULL, '2019-10-11 06:17:04', NULL, NULL, 1),
(129, 5, 'Raigarh', 1, NULL, '2019-10-11 06:17:12', NULL, NULL, 1),
(130, 5, 'Raipur', 1, NULL, '2019-10-11 06:17:19', NULL, NULL, 1),
(131, 5, 'Rajnandgaon', 1, NULL, '2019-10-11 06:17:26', NULL, NULL, 1),
(132, 5, 'Sukma', 1, NULL, '2019-10-11 06:17:35', NULL, NULL, 1),
(133, 5, 'Surajpur', 1, NULL, '2019-10-11 06:17:42', NULL, NULL, 1),
(134, 5, 'Surguja', 1, NULL, '2019-10-11 06:17:53', NULL, NULL, 1),
(135, 6, 'North Goa', 1, NULL, '2019-10-11 06:18:18', NULL, NULL, 1),
(136, 6, 'South Goa', 1, NULL, '2019-10-11 06:18:27', NULL, NULL, 1),
(137, 7, 'Ahmedabad', 1, NULL, '2019-10-11 06:19:00', NULL, NULL, 1),
(138, 7, 'Amreli', 1, NULL, '2019-10-11 06:19:10', NULL, NULL, 1),
(139, 7, 'Anand', 1, NULL, '2019-10-11 06:19:17', NULL, NULL, 1),
(140, 7, 'Aravalli', 1, NULL, '2019-10-11 06:19:24', NULL, NULL, 1),
(141, 7, 'Banaskantha (Palanpur)', 1, NULL, '2019-10-11 06:19:31', NULL, NULL, 1),
(142, 7, 'Bharuch', 1, NULL, '2019-10-11 06:19:38', NULL, NULL, 1),
(143, 7, 'Bhavnagar', 1, NULL, '2019-10-11 06:19:46', NULL, NULL, 1),
(144, 7, 'Botad', 1, NULL, '2019-10-11 06:19:53', NULL, NULL, 1),
(145, 7, 'Chhota Udepur', 1, NULL, '2019-10-11 06:20:01', NULL, NULL, 1),
(146, 7, 'Dahod', 1, NULL, '2019-10-11 06:20:09', NULL, NULL, 1),
(147, 7, 'Dangs (Ahwa)', 1, NULL, '2019-10-11 06:20:18', NULL, NULL, 1),
(148, 7, 'Devbhoomi Dwarka', 1, NULL, '2019-10-11 06:20:27', NULL, NULL, 1),
(149, 7, 'Gandhinagar', 1, NULL, '2019-10-11 06:20:36', NULL, NULL, 1),
(150, 7, 'Gir Somnath', 1, NULL, '2019-10-11 06:20:43', NULL, NULL, 1),
(151, 7, 'Jamnagar', 1, NULL, '2019-10-11 06:20:49', NULL, NULL, 1),
(152, 7, 'Junagadh', 1, NULL, '2019-10-11 06:21:01', NULL, NULL, 1),
(153, 7, 'Kachchh', 1, NULL, '2019-10-11 06:21:10', NULL, NULL, 1),
(154, 7, 'Kheda (Nadiad)', 1, NULL, '2019-10-11 06:21:19', NULL, NULL, 1),
(155, 7, 'Mahisagar', 1, NULL, '2019-10-11 06:21:27', NULL, NULL, 1),
(156, 7, 'Mehsana', 1, NULL, '2019-10-11 06:21:36', NULL, NULL, 1),
(157, 7, 'Morbi', 1, NULL, '2019-10-11 06:21:45', NULL, NULL, 1),
(158, 7, 'Narmada (Rajpipla)', 1, NULL, '2019-10-11 06:21:53', NULL, NULL, 1),
(159, 7, 'Navsari', 1, NULL, '2019-10-11 06:22:00', NULL, NULL, 1),
(160, 7, 'Panchmahal (Godhra)', 1, NULL, '2019-10-11 06:22:08', NULL, NULL, 1),
(161, 7, 'Patan', 1, NULL, '2019-10-11 06:22:16', NULL, NULL, 1),
(162, 7, 'Porbandar', 1, NULL, '2019-10-11 06:22:23', NULL, NULL, 1),
(163, 7, 'Rajkot', 1, NULL, '2019-10-11 06:22:30', NULL, NULL, 1),
(164, 7, 'Sabarkantha (Himmatnagar)', 1, NULL, '2019-10-11 06:22:43', NULL, NULL, 1),
(165, 7, 'Surat', 1, NULL, '2019-10-11 06:22:52', NULL, NULL, 1),
(166, 7, 'Surendranagar', 1, NULL, '2019-10-11 06:23:00', NULL, NULL, 1),
(167, 7, 'Tapi (Vyara)', 1, NULL, '2019-10-11 06:23:07', NULL, NULL, 1),
(168, 7, 'Vadodara', 1, NULL, '2019-10-11 06:23:14', NULL, NULL, 1),
(169, 7, 'Valsad', 1, NULL, '2019-10-11 06:23:21', NULL, NULL, 1),
(170, 8, 'Ambala', 1, NULL, '2019-10-11 06:24:00', NULL, NULL, 1),
(171, 8, 'Bhiwani', 1, NULL, '2019-10-11 06:24:07', NULL, NULL, 1),
(172, 8, 'Charkhi Dadri', 1, NULL, '2019-10-11 06:24:14', NULL, NULL, 1),
(173, 8, 'Faridabad', 1, NULL, '2019-10-11 06:24:22', NULL, NULL, 1),
(174, 8, 'Fatehabad', 1, NULL, '2019-10-11 06:24:31', NULL, NULL, 1),
(175, 8, 'Gurugram (Gurgaon)', 1, NULL, '2019-10-11 06:24:39', NULL, NULL, 1),
(176, 8, 'Hisar', 1, NULL, '2019-10-11 06:24:51', NULL, NULL, 1),
(177, 8, 'Jhajjar', 1, NULL, '2019-10-11 06:24:59', NULL, NULL, 1),
(178, 8, 'Jind dt', 1, NULL, '2019-10-11 06:25:18', NULL, NULL, 1),
(179, 8, 'Kaithal', 1, NULL, '2019-10-11 06:25:23', NULL, NULL, 1),
(180, 8, 'Karnal', 1, NULL, '2019-10-11 06:25:31', NULL, NULL, 1),
(181, 8, 'Kurukshetra', 1, NULL, '2019-10-11 06:25:38', NULL, NULL, 1),
(182, 8, 'Mahendragarh', 1, NULL, '2019-10-11 06:25:45', NULL, NULL, 1),
(183, 8, 'Nuh dt', 1, NULL, '2019-10-11 06:26:03', NULL, NULL, 1),
(184, 8, 'Palwal', 1, NULL, '2019-10-11 06:26:08', NULL, NULL, 1),
(185, 8, 'Panchkula', 1, NULL, '2019-10-11 06:26:17', NULL, NULL, 1),
(186, 8, 'Panipat', 1, NULL, '2019-10-11 06:26:24', NULL, NULL, 1),
(187, 8, 'Rewari', 1, NULL, '2019-10-11 06:26:32', NULL, NULL, 1),
(188, 8, 'Rohtak', 1, NULL, '2019-10-11 06:26:41', NULL, NULL, 1),
(189, 8, 'Sirsa', 1, NULL, '2019-10-11 06:26:47', NULL, NULL, 1),
(190, 8, 'Sonipat', 1, NULL, '2019-10-11 06:26:56', NULL, NULL, 1),
(191, 8, 'Yamunanagar', 1, NULL, '2019-10-11 06:27:03', NULL, NULL, 1),
(192, 9, 'Bilaspur', 1, NULL, '2019-10-11 06:27:59', NULL, NULL, 1),
(193, 9, 'Chamba', 1, NULL, '2019-10-11 06:28:06', NULL, NULL, 1),
(194, 9, 'Hamirpur', 1, NULL, '2019-10-11 06:28:14', NULL, NULL, 1),
(195, 9, 'Kangra', 1, NULL, '2019-10-11 06:28:21', NULL, NULL, 1),
(196, 9, 'Kinnaur', 1, NULL, '2019-10-11 06:28:29', NULL, NULL, 1),
(197, 9, 'Kullu', 1, NULL, '2019-10-11 06:28:35', NULL, NULL, 1),
(198, 9, 'Lahaul & Spiti', 1, NULL, '2019-10-11 06:28:42', NULL, NULL, 1),
(199, 9, 'Mandi', 1, NULL, '2019-10-11 06:28:49', NULL, NULL, 1),
(200, 9, 'Shimla', 1, NULL, '2019-10-11 06:28:57', NULL, NULL, 1),
(201, 9, 'Sirmaur (Sirmour)', 1, NULL, '2019-10-11 06:29:04', NULL, NULL, 1),
(202, 9, 'Solan', 1, NULL, '2019-10-11 06:29:11', NULL, NULL, 1),
(203, 9, 'Una dt', 1, NULL, '2019-10-11 06:29:32', NULL, NULL, 1),
(204, 10, 'Anantnag', 1, NULL, '2019-10-11 06:29:59', NULL, NULL, 1),
(205, 10, 'Bandipore', 1, NULL, '2019-10-11 06:30:06', NULL, NULL, 1),
(206, 10, 'Baramulla', 1, NULL, '2019-10-11 06:30:14', NULL, NULL, 1),
(207, 10, 'Budgam', 1, NULL, '2019-10-11 06:30:23', NULL, NULL, 1),
(208, 10, 'Doda dt', 1, NULL, '2019-10-11 06:30:42', NULL, NULL, 1),
(209, 10, 'Ganderbal', 1, NULL, '2019-10-11 06:30:47', NULL, NULL, 1),
(210, 10, 'Jammu', 1, NULL, '2019-10-11 06:30:58', NULL, NULL, 1),
(211, 10, 'Kargil', 1, NULL, '2019-10-11 06:31:06', NULL, NULL, 1),
(212, 10, 'Kathua', 1, NULL, '2019-10-11 06:31:12', NULL, NULL, 1),
(213, 10, 'Kishtwar', 1, NULL, '2019-10-11 06:31:20', NULL, NULL, 1),
(214, 10, 'Kulgam', 1, NULL, '2019-10-11 06:31:31', NULL, NULL, 1),
(215, 10, 'Kupwara', 1, NULL, '2019-10-11 06:31:38', NULL, NULL, 1),
(216, 10, 'Leh dt', 1, NULL, '2019-10-11 06:32:05', NULL, NULL, 1),
(217, 10, 'Poonch', 1, NULL, '2019-10-11 06:32:11', NULL, NULL, 1),
(218, 10, 'Pulwama', 1, NULL, '2019-10-11 06:32:21', NULL, NULL, 1),
(219, 10, 'Rajouri', 1, NULL, '2019-10-11 06:32:27', NULL, NULL, 1),
(220, 10, 'Ramban', 1, NULL, '2019-10-11 06:32:35', NULL, NULL, 1),
(221, 10, 'Reasi', 1, NULL, '2019-10-11 06:32:42', NULL, NULL, 1),
(222, 10, 'Samba', 1, NULL, '2019-10-11 06:32:49', NULL, NULL, 1),
(223, 10, 'Shopian', 1, NULL, '2019-10-11 06:32:57', NULL, NULL, 1),
(224, 10, 'Srinagar', 1, NULL, '2019-10-11 06:33:05', NULL, NULL, 1),
(225, 10, 'Udhampur', 1, NULL, '2019-10-11 06:33:12', NULL, NULL, 1),
(226, 11, 'Bokaro', 1, NULL, '2019-10-11 06:33:52', NULL, NULL, 1),
(227, 11, 'Chatra', 1, NULL, '2019-10-11 06:33:59', NULL, NULL, 1),
(228, 11, 'Deoghar', 1, NULL, '2019-10-11 06:34:09', NULL, NULL, 1),
(229, 11, 'Dhanbad', 1, NULL, '2019-10-11 06:34:17', NULL, NULL, 1),
(230, 11, 'Dumka', 1, NULL, '2019-10-11 06:34:27', NULL, NULL, 1),
(231, 11, 'East Singhbhum', 1, NULL, '2019-10-11 06:34:35', NULL, NULL, 1),
(232, 11, 'Garhwa', 1, NULL, '2019-10-11 06:34:42', NULL, NULL, 1),
(233, 11, 'Giridih', 1, NULL, '2019-10-11 06:34:51', NULL, NULL, 1),
(234, 11, 'Godda dt', 1, NULL, '2019-10-11 06:35:00', NULL, NULL, 1),
(235, 11, 'Gumla', 1, NULL, '2019-10-11 06:35:08', NULL, NULL, 1),
(236, 11, 'Hazaribag', 1, NULL, '2019-10-11 06:35:15', NULL, NULL, 1),
(237, 11, 'Jamtara', 1, NULL, '2019-10-11 06:35:25', NULL, NULL, 1),
(238, 11, 'Khunti', 1, NULL, '2019-10-11 06:35:33', NULL, NULL, 1),
(239, 11, 'Koderma', 1, NULL, '2019-10-11 06:35:42', NULL, NULL, 1),
(240, 11, 'Latehar', 1, NULL, '2019-10-11 06:35:52', NULL, NULL, 1),
(241, 11, 'Lohardaga', 1, NULL, '2019-10-11 06:36:01', NULL, NULL, 1),
(242, 11, 'Pakur', 1, NULL, '2019-10-11 06:36:11', NULL, NULL, 1),
(243, 11, 'Palamu', 1, NULL, '2019-10-11 06:36:19', NULL, NULL, 1),
(244, 11, 'Ramgarh', 1, NULL, '2019-10-11 06:36:26', NULL, NULL, 1),
(245, 11, 'Ranchi', 1, NULL, '2019-10-11 06:36:34', NULL, NULL, 1),
(246, 11, 'Sahibganj', 1, NULL, '2019-10-11 06:36:41', NULL, NULL, 1),
(247, 11, 'Seraikela-Kharsawan', 1, NULL, '2019-10-11 06:36:50', NULL, NULL, 1),
(248, 11, 'Simdega', 1, NULL, '2019-10-11 06:36:57', NULL, NULL, 1),
(249, 11, 'West Singhbhum', 1, NULL, '2019-10-11 06:37:06', NULL, NULL, 1),
(250, 12, 'Bagalkot', 1, NULL, '2019-10-11 06:37:36', NULL, NULL, 1),
(251, 12, 'Ballari (Bellary)', 1, NULL, '2019-10-11 06:37:46', NULL, NULL, 1),
(252, 12, 'Belagavi (Belgaum)', 1, NULL, '2019-10-11 06:37:54', NULL, NULL, 1),
(253, 12, 'Bengaluru (Bangalore) Rural', 1, NULL, '2019-10-11 06:38:04', NULL, NULL, 1),
(254, 12, 'Bengaluru (Bangalore) Urban', 1, NULL, '2019-10-11 06:38:13', NULL, NULL, 1),
(255, 12, 'Bidar', 1, NULL, '2019-10-11 06:38:22', NULL, NULL, 1),
(256, 12, 'Chamarajanagar', 1, NULL, '2019-10-11 06:38:36', NULL, NULL, 1),
(257, 12, 'Chikballapur', 1, NULL, '2019-10-11 06:38:42', NULL, NULL, 1),
(258, 12, 'Chikkamagaluru (Chikmagalur)', 1, NULL, '2019-10-11 06:38:50', NULL, NULL, 1),
(259, 12, 'Chitradurga', 1, NULL, '2019-10-11 06:38:58', NULL, NULL, 1),
(260, 12, 'Dakshina Kannada', 1, NULL, '2019-10-11 06:39:07', NULL, NULL, 1),
(261, 12, 'Davangere', 1, NULL, '2019-10-11 06:39:17', NULL, NULL, 1),
(262, 12, 'Dharwad', 1, NULL, '2019-10-11 06:39:27', NULL, NULL, 1),
(263, 12, 'Gadag', 1, NULL, '2019-10-11 06:39:35', NULL, NULL, 1),
(264, 12, 'Hassan', 1, NULL, '2019-10-11 06:39:43', NULL, NULL, 1),
(265, 12, 'Haveri', 1, NULL, '2019-10-11 06:39:51', NULL, NULL, 1),
(266, 12, 'Kalaburagi (Gulbarga)', 1, NULL, '2019-10-11 06:39:59', NULL, NULL, 1),
(267, 12, 'Kodagu', 1, NULL, '2019-10-11 06:40:07', NULL, NULL, 1),
(268, 12, 'Kolar', 1, NULL, '2019-10-11 06:40:16', NULL, NULL, 1),
(269, 12, 'Koppal', 1, NULL, '2019-10-11 06:40:25', NULL, NULL, 1),
(270, 12, 'Mandya', 1, NULL, '2019-10-11 06:40:32', NULL, NULL, 1),
(271, 12, 'Mysuru (Mysore)', 1, NULL, '2019-10-11 06:40:43', NULL, NULL, 1),
(272, 12, 'Raichur', 1, NULL, '2019-10-11 06:40:50', NULL, NULL, 1),
(273, 12, 'Ramanagara', 1, NULL, '2019-10-11 06:40:58', NULL, NULL, 1),
(274, 12, 'Shivamogga (Shimoga)', 1, NULL, '2019-10-11 06:41:06', NULL, NULL, 1),
(275, 12, 'Tumakuru (Tumkur)', 1, NULL, '2019-10-11 06:41:16', NULL, NULL, 1),
(276, 12, 'Udupi', 1, NULL, '2019-10-11 06:41:24', NULL, NULL, 1),
(277, 12, 'Uttara Kannada (Karwar)', 1, NULL, '2019-10-11 06:41:33', NULL, NULL, 1),
(278, 12, 'Vijayapura (Bijapur)', 1, NULL, '2019-10-11 06:41:42', NULL, NULL, 1),
(279, 12, 'Yadgir', 1, NULL, '2019-10-11 06:41:51', NULL, NULL, 1),
(280, 13, 'Alappuzha', 1, NULL, '2019-10-11 06:42:22', NULL, NULL, 1),
(281, 13, 'Ernakulam', 1, NULL, '2019-10-11 06:42:29', NULL, NULL, 1),
(282, 13, 'Idukki', 1, NULL, '2019-10-11 06:42:41', NULL, NULL, 1),
(283, 13, 'Kannur', 1, NULL, '2019-10-11 06:42:48', NULL, NULL, 1),
(284, 13, 'Kasaragod', 1, NULL, '2019-10-11 06:42:57', NULL, NULL, 1),
(285, 13, 'Kollam', 1, NULL, '2019-10-11 06:43:07', NULL, NULL, 1),
(286, 13, 'Kottayam', 1, NULL, '2019-10-11 06:43:17', NULL, NULL, 1),
(287, 13, 'Kozhikode', 1, NULL, '2019-10-11 06:43:23', NULL, NULL, 1),
(288, 13, 'Malappuram', 1, NULL, '2019-10-11 06:43:32', NULL, NULL, 1),
(289, 13, 'Palakkad', 1, NULL, '2019-10-11 06:43:40', NULL, NULL, 1),
(290, 13, 'Pathanamthitta', 1, NULL, '2019-10-11 06:43:48', NULL, NULL, 1),
(291, 13, 'Thiruvananthapuram', 1, NULL, '2019-10-11 06:43:56', NULL, NULL, 1),
(292, 13, 'Thrissur', 1, NULL, '2019-10-11 06:44:03', NULL, NULL, 1),
(293, 13, 'Wayanad', 1, NULL, '2019-10-11 06:44:17', NULL, NULL, 1),
(294, 14, 'Agar Malwa', 1, NULL, '2019-10-11 06:45:02', NULL, NULL, 1),
(295, 14, 'Alirajpur', 1, NULL, '2019-10-11 06:45:08', NULL, NULL, 1),
(296, 14, 'Anuppur', 1, NULL, '2019-10-11 06:45:15', NULL, NULL, 1),
(297, 14, 'Ashoknagar', 1, NULL, '2019-10-11 06:45:23', NULL, NULL, 1),
(298, 14, 'Balaghat', 1, NULL, '2019-10-11 06:45:34', NULL, NULL, 1),
(299, 14, 'Barwani', 1, NULL, '2019-10-11 06:45:42', NULL, NULL, 1),
(300, 14, 'Betul', 1, NULL, '2019-10-11 06:45:50', NULL, NULL, 1),
(301, 14, 'Bhind', 1, NULL, '2019-10-11 06:45:58', NULL, NULL, 1),
(302, 14, 'Bhopal', 1, NULL, '2019-10-11 06:46:05', NULL, NULL, 1),
(303, 14, 'Burhanpur', 1, NULL, '2019-10-11 06:46:12', NULL, NULL, 1),
(304, 14, 'Chhatarpur', 1, NULL, '2019-10-11 06:46:22', NULL, NULL, 1),
(305, 14, 'Chhindwara', 1, NULL, '2019-10-11 06:46:29', NULL, NULL, 1),
(306, 14, 'Damoh', 1, NULL, '2019-10-11 06:46:35', NULL, NULL, 1),
(307, 14, 'Datia', 1, NULL, '2019-10-11 06:46:42', NULL, NULL, 1),
(308, 14, 'Dewas', 1, NULL, '2019-10-11 06:46:48', NULL, NULL, 1),
(309, 14, 'Dhar dt', 1, NULL, '2019-10-11 06:46:57', NULL, NULL, 1),
(310, 14, 'Dindori', 1, NULL, '2019-10-11 06:47:03', NULL, NULL, 1),
(311, 14, 'Guna dt', 1, NULL, '2019-10-11 06:47:14', NULL, NULL, 1),
(312, 14, 'Gwalior', 1, NULL, '2019-10-11 06:47:27', NULL, NULL, 1),
(313, 14, 'Harda', 1, NULL, '2019-10-11 06:47:37', NULL, NULL, 1),
(314, 14, 'Hoshangabad', 1, NULL, '2019-10-11 06:47:44', NULL, NULL, 1),
(315, 14, 'Indore', 1, NULL, '2019-10-11 06:47:50', NULL, NULL, 1),
(316, 14, 'Jabalpur', 1, NULL, '2019-10-11 06:47:56', NULL, NULL, 1),
(317, 14, 'Jhabua', 1, NULL, '2019-10-11 06:48:02', NULL, NULL, 1),
(318, 14, 'Katni', 1, NULL, '2019-10-11 06:48:09', NULL, NULL, 1),
(319, 14, 'Khandwa', 1, NULL, '2019-10-11 06:48:15', NULL, NULL, 1),
(320, 14, 'Khargone', 1, NULL, '2019-10-11 06:48:21', NULL, NULL, 1),
(321, 14, 'Mandla', 1, NULL, '2019-10-11 06:48:27', NULL, NULL, 1),
(322, 14, 'Mandsaur', 1, NULL, '2019-10-11 06:48:33', NULL, NULL, 1),
(323, 14, 'Morena', 1, NULL, '2019-10-11 06:48:40', NULL, NULL, 1),
(324, 14, 'Narsinghpur', 1, NULL, '2019-10-11 06:48:46', NULL, NULL, 1),
(325, 14, 'Neemuch', 1, NULL, '2019-10-11 06:48:52', NULL, NULL, 1),
(326, 14, 'Panna', 1, NULL, '2019-10-11 06:48:59', NULL, NULL, 1),
(327, 14, 'Raisen', 1, NULL, '2019-10-11 06:49:07', NULL, NULL, 1),
(328, 14, 'Rajgarh', 1, NULL, '2019-10-11 06:49:13', NULL, NULL, 1),
(329, 14, 'Ratlam', 1, NULL, '2019-10-11 06:49:20', NULL, NULL, 1),
(330, 14, 'Rewa dt', 1, NULL, '2019-10-11 06:49:27', NULL, NULL, 1),
(331, 14, 'Sagar', 1, NULL, '2019-10-11 06:49:34', NULL, NULL, 1),
(332, 14, 'Satna', 1, NULL, '2019-10-11 06:49:43', NULL, NULL, 1),
(333, 14, 'Sehore', 1, NULL, '2019-10-11 06:49:50', NULL, NULL, 1),
(334, 14, 'Seoni', 1, NULL, '2019-10-11 06:49:58', NULL, NULL, 1),
(335, 14, 'Shahdol', 1, NULL, '2019-10-11 06:50:04', NULL, NULL, 1),
(336, 14, 'Shajapur', 1, NULL, '2019-10-11 06:50:11', NULL, NULL, 1),
(337, 14, 'Sheopur', 1, NULL, '2019-10-11 06:50:19', NULL, NULL, 1),
(338, 14, 'Shivpuri', 1, NULL, '2019-10-11 06:50:25', NULL, NULL, 1),
(339, 14, 'Sidhi', 1, NULL, '2019-10-11 06:50:31', NULL, NULL, 1),
(340, 14, 'Singrauli', 1, NULL, '2019-10-11 06:50:37', NULL, NULL, 1),
(341, 14, 'Tikamgarh', 1, NULL, '2019-10-11 06:50:44', NULL, NULL, 1),
(342, 14, 'Ujjain', 1, NULL, '2019-10-11 06:50:51', NULL, NULL, 1),
(343, 14, 'Umaria', 1, NULL, '2019-10-11 06:50:57', NULL, NULL, 1),
(344, 14, 'Vidisha', 1, NULL, '2019-10-11 06:51:04', NULL, NULL, 1),
(345, 15, 'Ahmednagar', 1, NULL, '2019-10-11 06:52:01', NULL, NULL, 1),
(346, 15, 'Akola', 1, NULL, '2019-10-11 06:52:07', NULL, NULL, 1),
(347, 15, 'Amravati', 1, NULL, '2019-10-11 06:52:15', NULL, NULL, 1),
(348, 12, 'Beed dt', 1, NULL, '2019-10-11 06:52:33', NULL, NULL, 1),
(349, 15, 'Aurangabad', 1, NULL, '2019-10-11 06:52:55', NULL, NULL, 1),
(350, 15, 'Bhandara', 1, 1, '2019-10-11 06:53:00', '2019-10-11 06:53:13', NULL, 1),
(351, 15, 'Buldhana', 1, NULL, '2019-10-11 06:53:29', NULL, NULL, 1),
(352, 15, 'Chandrapur', 1, NULL, '2019-10-11 06:53:38', NULL, NULL, 1),
(353, 15, 'Dhule', 1, NULL, '2019-10-11 06:53:46', NULL, NULL, 1),
(354, 15, 'Gadchiroli', 1, NULL, '2019-10-11 06:53:54', NULL, NULL, 1),
(355, 15, 'Gondia', 1, NULL, '2019-10-11 06:54:01', NULL, NULL, 1),
(356, 15, 'Hingoli', 1, NULL, '2019-10-11 06:54:08', NULL, NULL, 1),
(357, 15, 'Jalgaon', 1, NULL, '2019-10-11 06:54:14', NULL, NULL, 1),
(358, 15, 'Jalgaon', 1, NULL, '2019-10-11 06:54:27', NULL, NULL, 1),
(359, 15, 'Jalna', 1, NULL, '2019-10-11 06:54:37', NULL, NULL, 1),
(360, 15, 'Kolhapur', 1, NULL, '2019-10-11 06:54:44', NULL, NULL, 1),
(361, 15, 'Latur', 1, NULL, '2019-10-11 06:54:50', NULL, NULL, 1),
(362, 15, 'Mumbai City', 1, 1, '2019-10-11 06:54:57', '2019-11-19 07:46:11', NULL, 1),
(363, 15, 'Mumbai Suburban', 1, 1, '2019-10-11 06:55:08', '2019-11-19 07:41:48', NULL, 1),
(364, 15, 'Nagpur', 1, NULL, '2019-10-11 06:55:15', NULL, NULL, 1),
(365, 15, 'Nanded', 1, NULL, '2019-10-11 06:55:22', NULL, NULL, 1),
(366, 15, 'Nandurbar', 1, NULL, '2019-10-11 06:55:30', NULL, NULL, 1),
(367, 15, 'Nashik', 1, NULL, '2019-10-11 06:55:39', NULL, NULL, 1),
(368, 15, 'Osmanabad', 1, NULL, '2019-10-11 06:55:46', NULL, NULL, 1),
(369, 15, 'Palghar', 1, NULL, '2019-10-11 06:55:51', NULL, NULL, 1),
(370, 15, 'Parbhani', 1, NULL, '2019-10-11 06:55:58', NULL, NULL, 1),
(371, 15, 'Pune dt', 1, NULL, '2019-10-11 06:56:06', NULL, NULL, 1),
(372, 15, 'Raigad', 1, NULL, '2019-10-11 06:56:14', NULL, NULL, 1),
(373, 15, 'Ratnagiri', 1, NULL, '2019-10-11 06:56:21', NULL, NULL, 1),
(374, 15, 'Sangli', 1, NULL, '2019-10-11 06:56:27', NULL, NULL, 1),
(375, 15, 'Satara', 1, NULL, '2019-10-11 06:56:36', NULL, NULL, 1),
(376, 15, 'Sindhudurg', 1, NULL, '2019-10-11 06:56:43', NULL, NULL, 1),
(377, 15, 'Solapur', 1, NULL, '2019-10-11 06:56:50', NULL, NULL, 1),
(378, 15, 'Thane', 1, NULL, '2019-10-11 06:56:57', NULL, NULL, 1),
(379, 15, 'Wardha', 1, NULL, '2019-10-11 06:57:05', NULL, NULL, 1),
(380, 15, 'Washim', 1, NULL, '2019-10-11 06:57:12', NULL, NULL, 1),
(381, 15, 'Yavatmal', 1, NULL, '2019-10-11 06:57:18', NULL, NULL, 1),
(382, 16, 'Bishnupur', 1, NULL, '2019-10-11 06:57:48', NULL, NULL, 1),
(383, 16, 'Chandel', 1, NULL, '2019-10-11 06:57:57', NULL, NULL, 1),
(384, 16, 'Churachandpur', 1, NULL, '2019-10-11 06:58:05', NULL, NULL, 1),
(385, 16, 'Imphal East', 1, 1, '2019-10-11 06:58:12', '2019-11-19 07:40:35', NULL, 1),
(386, 16, 'Imphal West', 1, 1, '2019-10-11 06:58:21', '2019-11-19 07:40:11', NULL, 1),
(387, 16, 'Jiribam', 1, NULL, '2019-10-11 06:58:28', NULL, NULL, 1),
(388, 16, 'Kakching', 1, NULL, '2019-10-11 06:58:35', NULL, NULL, 1),
(389, 16, 'Kamjong', 1, NULL, '2019-10-11 06:58:42', NULL, NULL, 1),
(390, 16, 'Kangpokpi', 1, NULL, '2019-10-11 06:58:49', NULL, NULL, 1),
(391, 16, 'Noney', 1, NULL, '2019-10-11 06:58:56', NULL, NULL, 1),
(392, 16, 'Pherzawl', 1, NULL, '2019-10-11 06:59:04', NULL, NULL, 1),
(393, 16, 'Senapati', 1, NULL, '2019-10-11 06:59:10', NULL, NULL, 1),
(394, 16, 'Tamenglong', 1, NULL, '2019-10-11 06:59:16', NULL, NULL, 1),
(395, 16, 'Tengnoupal', 1, NULL, '2019-10-11 06:59:23', NULL, NULL, 1),
(396, 16, 'Thoubal', 1, NULL, '2019-10-11 06:59:31', NULL, NULL, 1),
(397, 16, 'Ukhrul', 1, NULL, '2019-10-11 06:59:39', NULL, NULL, 1),
(398, 17, 'East Garo Hills', 1, NULL, '2019-10-11 07:00:06', NULL, NULL, 1),
(399, 17, 'East Jaintia Hills', 1, 1, '2019-10-11 07:00:14', '2019-11-19 07:36:38', NULL, 1),
(400, 17, 'East Khasi Hills', 1, 1, '2019-10-11 07:00:21', '2019-11-19 07:36:23', NULL, 1),
(401, 17, 'North Garo Hills', 1, 1, '2019-10-11 07:00:28', '2019-11-19 07:39:11', NULL, 1),
(402, 17, 'Ri Bhoi', 1, 1, '2019-10-11 07:00:36', '2019-11-19 07:38:12', NULL, 1),
(403, 17, 'South Garo Hills', 1, 1, '2019-10-11 07:00:43', '2019-11-19 07:37:42', NULL, 1),
(404, 17, 'South West Garo Hills', 1, 1, '2019-10-11 07:00:50', '2019-11-19 07:37:19', NULL, 1),
(405, 17, 'South West Khasi Hills', 1, 1, '2019-10-11 07:00:59', '2019-11-19 07:36:59', NULL, 1),
(406, 17, 'West Garo Hills', 1, 1, '2019-10-11 07:01:05', '2019-11-19 07:36:00', NULL, 1),
(407, 17, 'West Jaintia Hills', 1, 1, '2019-10-11 07:01:12', '2019-11-19 07:35:30', NULL, 1),
(408, 17, 'West Khasi Hills', 1, 1, '2019-10-11 07:01:19', '2019-11-19 07:35:09', NULL, 1),
(409, 18, 'Aizawl', 1, 1, '2019-10-11 07:01:46', '2019-11-19 07:34:50', NULL, 1),
(410, 18, 'Champhai', 1, NULL, '2019-10-11 07:01:53', NULL, NULL, 1),
(411, 18, 'Kolasib', 1, NULL, '2019-10-11 07:01:59', NULL, NULL, 1),
(412, 18, 'Lawngtlai', 1, NULL, '2019-10-11 07:02:06', NULL, NULL, 1),
(413, 18, 'Lunglei', 1, NULL, '2019-10-11 07:02:12', NULL, NULL, 1),
(414, 18, 'Mamit', 1, NULL, '2019-10-11 07:02:19', NULL, NULL, 1),
(415, 18, 'Saiha', 1, NULL, '2019-10-11 07:02:25', NULL, NULL, 1),
(416, 18, 'Serchhip', 1, NULL, '2019-10-11 07:02:32', NULL, NULL, 1),
(417, 19, 'Dimapur', 1, 1, '2019-10-11 07:03:04', '2019-11-19 07:34:23', NULL, 1),
(418, 19, 'Kiphire', 1, NULL, '2019-10-11 07:03:11', NULL, NULL, 1),
(419, 19, 'Kohima', 1, NULL, '2019-10-11 07:03:17', NULL, NULL, 1),
(420, 19, 'Longleng', 1, NULL, '2019-10-11 07:03:26', NULL, NULL, 1),
(421, 19, 'Mokokchung', 1, NULL, '2019-10-11 07:03:32', NULL, NULL, 1),
(422, 19, 'Mon dt', 1, NULL, '2019-10-11 07:03:44', NULL, NULL, 1),
(423, 19, 'Peren', 1, NULL, '2019-10-11 07:03:50', NULL, NULL, 1),
(424, 19, 'Phek dt', 1, NULL, '2019-10-11 07:03:58', NULL, NULL, 1),
(425, 19, 'Tuensang', 1, NULL, '2019-10-11 07:04:04', NULL, NULL, 1),
(426, 19, 'Wokha', 1, NULL, '2019-10-11 07:04:13', NULL, NULL, 1),
(427, 19, 'Zunheboto', 1, NULL, '2019-10-11 07:04:20', NULL, NULL, 1),
(428, 20, 'Angul', 1, NULL, '2019-10-11 07:05:05', NULL, NULL, 1),
(429, 20, 'Balangir', 1, NULL, '2019-10-11 07:05:12', NULL, NULL, 1),
(430, 20, 'Balasore', 1, NULL, '2019-10-11 07:05:20', NULL, NULL, 1),
(431, 20, 'Bargarh', 1, NULL, '2019-10-11 07:05:27', NULL, NULL, 1),
(432, 20, 'Bhadrak', 1, NULL, '2019-10-11 07:05:33', NULL, NULL, 1),
(433, 20, 'Boudh', 1, NULL, '2019-10-11 07:05:40', NULL, NULL, 1),
(434, 20, 'Cuttack', 1, NULL, '2019-10-11 07:05:51', NULL, NULL, 1),
(435, 20, 'Deogarh', 1, NULL, '2019-10-11 07:06:07', NULL, NULL, 1),
(436, 20, 'Dhenkanal', 1, NULL, '2019-10-11 07:06:17', NULL, NULL, 1),
(437, 20, 'Gajapati', 1, NULL, '2019-10-11 07:06:24', NULL, NULL, 1),
(438, 20, 'Ganjam', 1, NULL, '2019-10-11 07:06:39', NULL, NULL, 1),
(439, 20, 'Jagatsinghapur', 1, NULL, '2019-10-11 07:06:52', NULL, NULL, 1),
(440, 20, 'Jajpur', 1, NULL, '2019-10-11 07:07:00', NULL, NULL, 1),
(441, 20, 'Jharsuguda', 1, NULL, '2019-10-11 07:07:10', NULL, NULL, 1),
(442, 20, 'Kalahandi', 1, NULL, '2019-10-11 07:07:16', NULL, NULL, 1),
(443, 20, 'Kandhamal', 1, NULL, '2019-10-11 07:07:24', NULL, NULL, 1),
(444, 20, 'Kendrapara', 1, NULL, '2019-10-11 07:07:34', NULL, NULL, 1),
(445, 20, 'Kendujhar (Keonjhar)', 1, 1, '2019-10-11 07:07:41', '2019-11-19 07:33:37', NULL, 1),
(446, 20, 'Khordha', 1, NULL, '2019-10-11 07:07:49', NULL, NULL, 1),
(447, 20, 'Koraput', 1, NULL, '2019-10-11 07:07:56', NULL, NULL, 1),
(448, 20, 'Malkangiri', 1, NULL, '2019-10-11 07:08:08', NULL, NULL, 1),
(449, 20, 'Mayurbhanj', 1, NULL, '2019-10-11 07:08:16', NULL, NULL, 1),
(450, 20, 'Nabarangpur', 1, NULL, '2019-10-11 07:08:23', NULL, NULL, 1),
(451, 20, 'Nayagarh', 1, NULL, '2019-10-11 07:08:30', NULL, NULL, 1),
(452, 20, 'Nuapada', 1, NULL, '2019-10-11 07:08:38', NULL, NULL, 1),
(453, 20, 'Puri dt', 1, NULL, '2019-10-11 07:08:47', NULL, NULL, 1),
(454, 20, 'Rayagada', 1, NULL, '2019-10-11 07:08:54', NULL, NULL, 1),
(455, 20, 'Sambalpur', 1, NULL, '2019-10-11 07:09:02', NULL, NULL, 1),
(456, 20, 'Sonepur', 1, NULL, '2019-10-11 07:09:10', NULL, NULL, 1),
(457, 20, 'Sundargarh', 1, NULL, '2019-10-11 07:09:17', NULL, NULL, 1),
(458, 21, 'Amritsar', 1, 1, '2019-10-11 07:09:58', '2019-11-19 07:33:58', NULL, 1),
(459, 21, 'Barnala', 1, NULL, '2019-10-11 07:10:05', NULL, NULL, 1),
(460, 21, 'Bathinda', 1, NULL, '2019-10-11 07:10:13', NULL, NULL, 1),
(461, 21, 'Faridkot', 1, NULL, '2019-10-11 07:10:20', NULL, NULL, 1),
(462, 21, 'Fatehgarh Sahib', 1, 1, '2019-10-11 07:10:30', '2019-11-19 07:33:15', NULL, 1),
(463, 21, 'Fazilka', 1, NULL, '2019-10-11 07:10:38', NULL, NULL, 1),
(464, 21, 'Ferozepur', 1, NULL, '2019-10-11 07:10:49', NULL, NULL, 1),
(465, 21, 'Gurdaspur', 1, NULL, '2019-10-11 07:10:56', NULL, NULL, 1),
(466, 21, 'Hoshiarpur', 1, NULL, '2019-10-11 07:11:04', NULL, NULL, 1),
(467, 21, 'Jalandhar', 1, NULL, '2019-10-11 07:11:10', NULL, NULL, 1),
(468, 21, 'Kapurthala', 1, NULL, '2019-10-11 07:11:16', NULL, NULL, 1),
(469, 21, 'Ludhiana', 1, NULL, '2019-10-11 07:11:23', NULL, NULL, 1),
(470, 21, 'Mansa', 1, NULL, '2019-10-11 07:11:29', NULL, NULL, 1),
(471, 21, 'Moga dt', 1, NULL, '2019-10-11 07:11:38', NULL, NULL, 1),
(472, 21, 'Muktsar', 1, NULL, '2019-10-11 07:11:44', NULL, NULL, 1),
(473, 21, 'Nawanshahr (Shahid Bhagat Singh Nagar)', 1, 1, '2019-10-11 07:11:52', '2019-11-19 07:32:41', NULL, 1),
(474, 21, 'Pathankot', 1, NULL, '2019-10-11 07:11:59', NULL, NULL, 1),
(475, 21, 'Patiala', 1, NULL, '2019-10-11 07:12:08', NULL, NULL, 1),
(476, 21, 'Rupnagar', 1, NULL, '2019-10-11 07:12:15', NULL, NULL, 1),
(477, 21, 'Sahibzada Ajit Singh Nagar (Mohali)', 1, NULL, '2019-10-11 07:12:33', NULL, NULL, 1),
(478, 21, 'Sangrur', 1, NULL, '2019-10-11 07:12:39', NULL, NULL, 1),
(479, 21, 'Tarn Taran', 1, 1, '2019-10-11 07:12:49', '2019-11-19 07:32:14', NULL, 1),
(480, 22, 'Ajmer', 1, NULL, '2019-10-11 07:13:30', NULL, NULL, 1),
(481, 22, 'Alwar', 1, NULL, '2019-10-11 07:13:39', NULL, NULL, 1),
(482, 22, 'Banswara', 1, NULL, '2019-10-11 07:13:46', NULL, NULL, 1),
(483, 22, 'Baran', 1, NULL, '2019-10-11 07:13:54', NULL, NULL, 1),
(484, 22, 'Barmer', 1, NULL, '2019-10-11 07:14:01', NULL, NULL, 1),
(485, 22, 'Bharatpur', 1, NULL, '2019-10-11 07:14:09', NULL, NULL, 1),
(486, 22, 'Bhilwara', 1, NULL, '2019-10-11 07:14:17', NULL, NULL, 1),
(487, 22, 'Bikaner', 1, NULL, '2019-10-11 07:14:29', NULL, NULL, 1),
(488, 22, 'Bundi', 1, NULL, '2019-10-11 07:14:37', NULL, NULL, 1),
(489, 22, 'Chittorgarh', 1, NULL, '2019-10-11 07:14:43', NULL, NULL, 1),
(490, 22, 'Churu', 1, NULL, '2019-10-11 07:14:53', NULL, NULL, 1),
(491, 22, 'Dausa', 1, NULL, '2019-10-11 07:15:00', NULL, NULL, 1),
(492, 22, 'Dholpur', 1, NULL, '2019-10-11 07:15:07', NULL, NULL, 1),
(493, 22, 'Dungarpur', 1, NULL, '2019-10-11 07:15:18', NULL, NULL, 1),
(494, 22, 'Hanumangarh', 1, NULL, '2019-10-11 07:15:25', NULL, NULL, 1),
(495, 22, 'Jaipur', 1, NULL, '2019-10-11 07:15:32', NULL, NULL, 1),
(496, 22, 'Jaisalmer', 1, NULL, '2019-10-11 07:15:39', NULL, NULL, 1),
(497, 22, 'Jalore', 1, NULL, '2019-10-11 07:15:48', NULL, NULL, 1),
(498, 22, 'Jhalawar', 1, NULL, '2019-10-11 07:15:55', NULL, NULL, 1),
(499, 22, 'Jhunjhunu', 1, NULL, '2019-10-11 07:16:06', NULL, NULL, 1),
(500, 22, 'Jodhpur', 1, NULL, '2019-10-11 07:16:24', NULL, NULL, 1),
(501, 22, 'Karauli', 1, NULL, '2019-10-11 07:16:31', NULL, NULL, 1),
(502, 22, 'Kota dt', 1, NULL, '2019-10-11 07:16:45', NULL, NULL, 1),
(503, 22, 'Nagaur', 1, NULL, '2019-10-11 07:16:54', NULL, NULL, 1),
(504, 22, 'Pali dt', 1, NULL, '2019-10-11 07:17:05', NULL, NULL, 1),
(505, 22, 'Pratapgarh', 1, NULL, '2019-10-11 07:17:13', NULL, NULL, 1),
(506, 22, 'Rajsamand', 1, NULL, '2019-10-11 07:17:21', NULL, NULL, 1),
(507, 22, 'Sawai Madhopur', 1, NULL, '2019-10-11 07:17:36', NULL, NULL, 1),
(508, 22, 'Sikar', 1, NULL, '2019-10-11 07:17:45', NULL, NULL, 1),
(509, 22, 'Sirohi', 1, NULL, '2019-10-11 07:17:54', NULL, NULL, 1),
(510, 22, 'Sri Ganganagar', 1, NULL, '2019-10-11 07:18:07', NULL, NULL, 1),
(511, 22, 'Tonk dt', 1, NULL, '2019-10-11 07:18:15', NULL, NULL, 1),
(512, 22, 'Udaipur', 1, NULL, '2019-10-11 07:18:22', NULL, NULL, 1),
(513, 23, 'East Sikkim', 1, NULL, '2019-10-11 07:19:06', NULL, NULL, 1),
(514, 23, 'North Sikkim', 1, NULL, '2019-10-11 07:19:27', NULL, NULL, 1),
(515, 23, 'South Sikkim', 1, NULL, '2019-10-11 07:19:44', NULL, NULL, 1),
(516, 23, 'West Sikkim', 1, NULL, '2019-10-11 07:19:55', NULL, NULL, 1),
(517, 24, 'Ariyalur', 1, NULL, '2019-10-11 07:20:16', NULL, NULL, 1),
(518, 24, 'Chennai', 1, NULL, '2019-10-11 07:20:33', NULL, NULL, 1),
(519, 24, 'Coimbatore', 1, NULL, '2019-10-11 07:20:44', NULL, NULL, 1),
(520, 24, 'Cuddalore', 1, NULL, '2019-10-11 07:21:15', NULL, NULL, 1),
(521, 24, 'Dharmapuri', 1, NULL, '2019-10-11 07:21:24', NULL, NULL, 1),
(522, 24, 'Dindigul', 1, NULL, '2019-10-11 07:21:32', NULL, NULL, 1),
(523, 24, 'Erode', 1, NULL, '2019-10-11 07:21:39', NULL, NULL, 1),
(524, 24, 'Kanchipuram', 1, NULL, '2019-10-11 07:21:46', NULL, NULL, 1),
(525, 24, 'Kanyakumari', 1, NULL, '2019-10-11 07:21:53', NULL, NULL, 1),
(526, 24, 'Karur', 1, NULL, '2019-10-11 07:22:01', NULL, NULL, 1),
(527, 24, 'Krishnagiri', 1, NULL, '2019-10-11 07:22:09', NULL, NULL, 1),
(528, 24, 'Madurai', 1, NULL, '2019-10-11 07:22:16', NULL, NULL, 1),
(529, 24, 'Nagapattinam', 1, NULL, '2019-10-11 07:22:23', NULL, NULL, 1),
(530, 24, 'Namakkal', 1, NULL, '2019-10-11 07:22:31', NULL, NULL, 1),
(531, 24, 'Nilgiris', 1, NULL, '2019-10-11 07:22:40', NULL, NULL, 1),
(532, 24, 'Perambalur', 1, NULL, '2019-10-11 07:22:47', NULL, NULL, 1),
(533, 24, 'Pudukkottai', 1, NULL, '2019-10-11 07:22:55', NULL, NULL, 1),
(534, 24, 'Ramanathapuram', 1, NULL, '2019-10-11 07:23:04', NULL, NULL, 1),
(535, 24, 'Salem', 1, NULL, '2019-10-11 07:23:13', NULL, NULL, 1),
(536, 24, 'Sivaganga', 1, NULL, '2019-10-11 07:23:20', NULL, NULL, 1),
(537, 24, 'Thanjavur', 1, NULL, '2019-10-11 07:23:27', NULL, NULL, 1),
(538, 24, 'Theni', 1, NULL, '2019-10-11 07:23:33', NULL, NULL, 1),
(539, 24, 'Thoothukudi (Tuticorin)', 1, 1, '2019-10-11 07:23:41', '2019-11-19 07:31:42', NULL, 1),
(540, 24, 'Tiruchirappalli', 1, NULL, '2019-10-11 07:23:50', NULL, NULL, 1),
(541, 24, 'Tirunelveli', 1, NULL, '2019-10-11 07:23:58', NULL, NULL, 1),
(542, 24, 'Tiruppur', 1, NULL, '2019-10-11 07:24:06', NULL, NULL, 1),
(543, 24, 'Tiruvallur', 1, NULL, '2019-10-11 07:24:14', NULL, NULL, 1),
(544, 24, 'Tiruvannamalai', 1, NULL, '2019-10-11 07:24:23', NULL, NULL, 1),
(545, 24, 'Tiruvarur', 1, NULL, '2019-10-11 07:24:30', NULL, NULL, 1),
(546, 24, 'Vellore', 1, NULL, '2019-10-11 07:24:37', NULL, NULL, 1),
(547, 24, 'Viluppuram', 1, NULL, '2019-10-11 07:24:44', NULL, NULL, 1),
(548, 24, 'Virudhunagar', 1, NULL, '2019-10-11 07:24:51', NULL, NULL, 1),
(549, 25, 'Adilabad', 1, NULL, '2019-10-11 07:25:19', NULL, NULL, 1),
(550, 25, 'Bhadradri Kothagudem', 1, NULL, '2019-10-11 07:25:41', NULL, NULL, 1),
(551, 25, 'Hyderabad', 1, NULL, '2019-10-11 07:25:51', NULL, NULL, 1),
(552, 25, 'Jagtial', 1, NULL, '2019-10-11 07:25:59', NULL, NULL, 1),
(553, 25, 'Jangaon', 1, NULL, '2019-10-11 07:26:07', NULL, NULL, 1),
(554, 25, 'Jayashankar Bhoopalpally', 1, 1, '2019-10-11 07:26:15', '2019-11-19 07:31:23', NULL, 1),
(555, 25, 'Jogulamba Gadwal', 1, 1, '2019-10-11 07:26:24', '2019-11-19 07:30:40', NULL, 1),
(556, 25, 'Kamareddy', 1, NULL, '2019-10-11 07:26:58', NULL, NULL, 1),
(557, 25, 'Karimnagar', 1, NULL, '2019-10-11 07:27:07', NULL, NULL, 1),
(558, 25, 'Khammam', 1, NULL, '2019-10-11 07:27:15', NULL, NULL, 1),
(559, 25, 'Komaram Bheem Asifabad', 1, NULL, '2019-10-11 07:27:25', NULL, NULL, 1),
(560, 25, 'Mahabubabad', 1, NULL, '2019-10-11 07:27:35', NULL, NULL, 1),
(561, 25, 'Mahabubnagar', 1, NULL, '2019-10-11 07:27:43', NULL, NULL, 1),
(562, 25, 'Mancherial', 1, NULL, '2019-10-11 07:27:50', NULL, NULL, 1),
(563, 25, 'Medak', 1, NULL, '2019-10-11 07:27:57', NULL, NULL, 1),
(564, 25, 'Medchal', 1, NULL, '2019-10-11 07:28:06', NULL, NULL, 1),
(565, 25, 'Nagarkurnool', 1, NULL, '2019-10-11 07:28:13', NULL, NULL, 1),
(566, 25, 'Nalgonda', 1, NULL, '2019-10-11 07:28:21', NULL, NULL, 1),
(567, 25, 'Nirmal', 1, NULL, '2019-10-11 07:28:43', NULL, NULL, 1),
(568, 25, 'Nizamabad', 1, NULL, '2019-10-11 07:29:01', NULL, NULL, 1),
(569, 25, 'Peddapalli', 1, NULL, '2019-10-11 07:29:08', NULL, NULL, 1),
(570, 25, 'Rajanna Sircilla', 1, NULL, '2019-10-11 07:29:17', NULL, NULL, 1),
(571, 25, 'Rangareddy', 1, NULL, '2019-10-11 07:29:24', NULL, NULL, 1),
(572, 25, 'Sangareddy', 1, NULL, '2019-10-11 07:29:31', NULL, NULL, 1),
(573, 25, 'Siddipet', 1, NULL, '2019-10-11 07:29:39', NULL, NULL, 1),
(574, 25, 'Suryapet', 1, NULL, '2019-10-11 07:29:46', NULL, NULL, 1),
(575, 25, 'Vikarabad', 1, NULL, '2019-10-11 07:29:53', NULL, NULL, 1),
(576, 25, 'Wanaparthy', 1, NULL, '2019-10-11 07:29:59', NULL, NULL, 1),
(577, 25, 'Warangal (Rural)', 1, NULL, '2019-10-11 07:30:13', NULL, NULL, 1),
(578, 25, 'Warangal (Urban)', 1, NULL, '2019-10-11 07:30:20', NULL, NULL, 1),
(579, 25, 'Yadadri Bhuvanagiri', 1, NULL, '2019-10-11 07:30:29', NULL, NULL, 1),
(580, 26, 'Dhalai', 1, NULL, '2019-10-11 07:31:07', NULL, NULL, 1),
(581, 26, 'Gomati', 1, NULL, '2019-10-11 07:31:13', NULL, NULL, 1),
(582, 26, 'Khowai', 1, NULL, '2019-10-11 07:31:29', NULL, NULL, 1),
(583, 26, 'North Tripura', 1, NULL, '2019-10-11 07:31:43', NULL, NULL, 1),
(584, 26, 'Sepahijala', 1, NULL, '2019-10-11 07:31:51', NULL, NULL, 1),
(585, 26, 'South Tripura', 1, NULL, '2019-10-11 07:32:00', NULL, NULL, 1),
(586, 26, 'Unakoti', 1, NULL, '2019-10-11 07:32:11', NULL, NULL, 1),
(587, 26, 'West Tripura', 1, NULL, '2019-10-11 07:32:19', NULL, NULL, 1),
(588, 27, 'Agra dt', 1, NULL, '2019-10-11 07:34:04', NULL, NULL, 1),
(589, 27, 'Aligarh', 1, NULL, '2019-10-11 07:34:12', NULL, NULL, 1),
(590, 27, 'Allahabad', 1, NULL, '2019-10-11 07:34:19', NULL, NULL, 1),
(591, 27, 'Ambedkar Nagar', 1, 1, '2019-10-11 07:34:26', '2019-11-19 07:30:18', NULL, 1),
(592, 27, 'Amethi (Chatrapati Sahuji Mahraj Nagar)', 1, 1, '2019-10-11 07:34:33', '2019-11-19 07:30:03', NULL, 1),
(593, 27, 'Amroha (J.P. Nagar)', 1, 1, '2019-10-11 07:34:41', '2019-11-19 07:29:42', NULL, 1),
(594, 27, 'Auraiya', 1, NULL, '2019-10-11 07:34:48', NULL, NULL, 1),
(595, 27, 'Azamgarh', 1, NULL, '2019-10-11 07:34:55', NULL, NULL, 1),
(596, 27, 'Baghpat', 1, NULL, '2019-10-11 07:35:02', NULL, NULL, 1),
(597, 27, 'Bahraich', 1, NULL, '2019-10-11 07:35:14', NULL, NULL, 1),
(598, 27, 'Ballia', 1, NULL, '2019-10-11 07:35:22', NULL, NULL, 1),
(599, 27, 'Balrampur', 1, NULL, '2019-10-11 07:35:29', NULL, NULL, 1),
(600, 27, 'Banda', 1, NULL, '2019-10-11 07:35:36', NULL, NULL, 1),
(601, 27, 'Barabanki', 1, NULL, '2019-10-11 07:35:45', NULL, NULL, 1),
(602, 27, 'Bareilly', 1, NULL, '2019-10-11 07:35:52', NULL, NULL, 1),
(603, 27, 'Basti', 1, NULL, '2019-10-11 07:36:00', NULL, NULL, 1),
(604, 27, 'Bhadohi', 1, NULL, '2019-10-11 07:36:06', NULL, NULL, 1),
(605, 27, 'Bijnor', 1, NULL, '2019-10-11 07:36:14', NULL, NULL, 1),
(606, 27, 'Budaun', 1, NULL, '2019-10-11 07:36:28', NULL, NULL, 1),
(607, 27, 'Bulandshahr', 1, NULL, '2019-10-11 07:36:35', NULL, NULL, 1),
(608, 27, 'Chandauli', 1, NULL, '2019-10-11 07:36:43', NULL, NULL, 1),
(609, 27, 'Chitrakoot', 1, NULL, '2019-10-11 07:36:51', NULL, NULL, 1),
(610, 27, 'Deoria', 1, NULL, '2019-10-11 07:36:58', NULL, NULL, 1),
(611, 27, 'Etah dt', 1, NULL, '2019-10-11 07:37:21', NULL, NULL, 1),
(612, 27, 'Etawah', 1, NULL, '2019-10-11 07:37:39', NULL, NULL, 1),
(613, 27, 'Faizabad', 1, NULL, '2019-10-11 07:37:47', NULL, NULL, 1),
(614, 27, 'Farrukhabad', 1, NULL, '2019-10-11 07:37:53', NULL, NULL, 1),
(615, 27, 'Fatehpur', 1, NULL, '2019-10-11 07:37:59', NULL, NULL, 1),
(616, 27, 'Firozabad', 1, NULL, '2019-10-11 07:38:06', NULL, NULL, 1),
(617, 27, 'Gautam Buddha Nagar', 1, NULL, '2019-10-11 07:38:14', NULL, NULL, 1),
(618, 27, 'Ghaziabad', 1, NULL, '2019-10-11 07:38:20', NULL, NULL, 1),
(619, 27, 'Ghazipur', 1, NULL, '2019-10-11 07:38:27', NULL, NULL, 1),
(620, 27, 'Gonda', 1, NULL, '2019-10-11 07:38:38', NULL, NULL, 1),
(621, 27, 'Gorakhpur', 1, NULL, '2019-10-11 07:38:47', NULL, NULL, 1),
(622, 27, 'Hamirpur', 1, NULL, '2019-10-11 07:38:54', NULL, NULL, 1),
(623, 27, 'Hapur (Panchsheel Nagar)', 1, 1, '2019-10-11 07:39:03', '2019-11-19 07:24:41', NULL, 1),
(624, 27, 'Hardoi', 1, NULL, '2019-10-11 07:39:11', NULL, NULL, 1),
(625, 27, 'Hathras', 1, NULL, '2019-10-11 07:39:18', NULL, NULL, 1),
(626, 27, 'Jalaun', 1, NULL, '2019-10-11 07:39:26', NULL, NULL, 1),
(627, 27, 'Jaunpur', 1, NULL, '2019-10-11 07:39:33', NULL, NULL, 1),
(628, 27, 'Jhansi', 1, NULL, '2019-10-11 07:39:40', NULL, NULL, 1),
(629, 27, 'Kannauj', 1, NULL, '2019-10-11 07:39:48', NULL, NULL, 1),
(630, 27, 'Kanpur Dehat', 1, 1, '2019-10-11 07:39:55', '2019-11-19 07:24:26', NULL, 1),
(631, 27, 'Kanpur Nagar', 1, 1, '2019-10-11 07:40:02', '2019-11-19 07:24:09', NULL, 1),
(632, 27, 'Kanshiram Nagar (Kasganj)', 1, 1, '2019-10-11 07:40:09', '2019-11-19 07:23:46', NULL, 1),
(633, 27, 'Kaushambi', 1, NULL, '2019-10-11 07:40:15', NULL, NULL, 1),
(634, 27, 'Kushinagar (Padrauna)', 1, 1, '2019-10-11 07:40:22', '2019-11-19 07:23:30', NULL, 1),
(635, 27, 'Lakhimpur - Kheri', 1, 1, '2019-10-11 07:40:35', '2019-11-19 07:23:03', NULL, 1),
(636, 27, 'Lalitpur', 1, NULL, '2019-10-11 07:40:43', NULL, NULL, 1),
(637, 27, 'Lucknow', 1, NULL, '2019-10-11 07:40:51', NULL, NULL, 1),
(638, 27, 'Maharajganj', 1, NULL, '2019-10-11 07:40:59', NULL, NULL, 1),
(639, 27, 'Mahoba', 1, NULL, '2019-10-11 07:41:07', NULL, NULL, 1),
(640, 27, 'Mainpuri', 1, NULL, '2019-10-11 07:41:14', NULL, NULL, 1),
(641, 27, 'Mathura', 1, NULL, '2019-10-11 07:41:20', NULL, NULL, 1),
(642, 27, 'Mau dt', 1, NULL, '2019-10-11 07:41:29', NULL, NULL, 1),
(643, 27, 'Meerut', 1, NULL, '2019-10-11 07:41:36', NULL, NULL, 1),
(644, 27, 'Mirzapur', 1, NULL, '2019-10-11 07:41:43', NULL, NULL, 1),
(645, 27, 'Moradabad', 1, NULL, '2019-10-11 07:41:49', NULL, NULL, 1),
(646, 27, 'Muzaffarnagar', 1, NULL, '2019-10-11 07:41:56', NULL, NULL, 1),
(647, 27, 'Pilibhit', 1, NULL, '2019-10-11 07:42:03', NULL, NULL, 1),
(648, 27, 'Pratapgarh', 1, NULL, '2019-10-11 07:42:11', NULL, NULL, 1),
(649, 27, 'RaeBareli', 1, NULL, '2019-10-11 07:42:18', NULL, NULL, 1),
(650, 27, 'Rampur', 1, NULL, '2019-10-11 07:42:25', NULL, NULL, 1),
(651, 27, 'Saharanpur', 1, NULL, '2019-10-11 07:42:32', NULL, NULL, 1),
(652, 27, 'Sambhal (Bhim Nagar)', 1, NULL, '2019-10-11 07:42:43', NULL, NULL, 1),
(653, 27, 'Sant Kabir Nagar', 1, NULL, '2019-10-11 07:42:49', NULL, NULL, 1),
(654, 27, 'Shahjahanpur', 1, NULL, '2019-10-11 07:42:59', NULL, NULL, 1),
(655, 27, 'Shamali (Prabuddh Nagar)', 1, NULL, '2019-10-11 07:43:10', NULL, NULL, 1),
(656, 27, 'Shravasti', 1, NULL, '2019-10-11 07:43:17', NULL, NULL, 1),
(657, 27, 'Siddharth Nagar', 1, NULL, '2019-10-11 07:43:25', NULL, NULL, 1),
(658, 27, 'Sitapur', 1, NULL, '2019-10-11 07:43:33', NULL, NULL, 1),
(659, 27, 'Sonbhadra', 1, NULL, '2019-10-11 07:43:41', NULL, NULL, 1),
(660, 27, 'Sultanpur', 1, NULL, '2019-10-11 07:43:48', NULL, NULL, 1),
(661, 27, 'Unnao', 1, NULL, '2019-10-11 07:43:56', NULL, NULL, 1),
(662, 27, 'Varanasi', 1, NULL, '2019-10-11 07:44:06', NULL, NULL, 1),
(663, 28, 'Almora', 1, NULL, '2019-10-11 07:44:54', NULL, NULL, 1),
(664, 28, 'Bageshwar', 1, NULL, '2019-10-11 07:45:02', NULL, NULL, 1),
(665, 28, 'Chamoli', 1, NULL, '2019-10-11 07:45:09', NULL, NULL, 1),
(666, 28, 'Champawat', 1, NULL, '2019-10-11 07:45:15', NULL, NULL, 1),
(667, 28, 'Dehradun', 1, NULL, '2019-10-11 07:45:23', NULL, NULL, 1),
(668, 28, 'Haridwar', 1, NULL, '2019-10-11 07:45:31', NULL, NULL, 1),
(669, 28, 'Nainital', 1, NULL, '2019-10-11 07:45:37', NULL, NULL, 1),
(670, 28, 'Pauri Garhwal', 1, NULL, '2019-10-11 07:45:45', NULL, NULL, 1),
(671, 28, 'Pithoragarh', 1, NULL, '2019-10-11 07:45:52', NULL, NULL, 1),
(672, 28, 'Rudraprayag', 1, NULL, '2019-10-11 07:45:58', NULL, NULL, 1),
(673, 28, 'Udham Singh Nagar', 1, NULL, '2019-10-11 07:46:07', NULL, NULL, 1),
(674, 28, 'Uttarkashi', 1, NULL, '2019-10-11 07:46:14', NULL, NULL, 1),
(675, 29, 'Alipurduar', 1, NULL, '2019-10-11 07:47:54', NULL, NULL, 1),
(676, 29, 'Bankura', 1, NULL, '2019-10-11 07:48:01', NULL, NULL, 1),
(677, 29, 'Birbhum', 1, NULL, '2019-10-11 07:48:09', NULL, NULL, 1),
(678, 29, 'Cooch Behar', 1, NULL, '2019-10-11 07:48:26', NULL, NULL, 1),
(679, 29, 'Dakshin Dinajpur (South Dinajpur)', 1, NULL, '2019-10-11 07:48:32', NULL, NULL, 1),
(680, 29, 'Darjeeling', 1, NULL, '2019-10-11 07:48:39', NULL, NULL, 1),
(681, 29, 'Hooghly', 1, NULL, '2019-10-11 07:48:45', NULL, NULL, 1),
(682, 29, 'Howrah', 1, NULL, '2019-10-11 07:48:52', NULL, NULL, 1),
(683, 29, 'Jalpaiguri', 1, NULL, '2019-10-11 07:48:59', NULL, NULL, 1),
(684, 29, 'Jhargram', 1, NULL, '2019-10-11 07:49:06', NULL, NULL, 1),
(685, 29, 'Kalimpong', 1, NULL, '2019-10-11 07:49:13', NULL, NULL, 1),
(686, 29, 'Kolkata', 1, NULL, '2019-10-11 07:49:22', NULL, NULL, 1),
(687, 29, 'Malda', 1, NULL, '2019-10-11 07:49:29', NULL, NULL, 1),
(688, 29, 'Murshidabad', 1, NULL, '2019-10-11 07:49:36', NULL, NULL, 1),
(689, 29, 'Nadia', 1, NULL, '2019-10-11 07:49:46', NULL, NULL, 1),
(690, 29, 'North 24 Parganas', 1, NULL, '2019-10-11 07:49:55', NULL, NULL, 1),
(691, 29, 'Paschim Medinipur (West Medinipur)', 1, NULL, '2019-10-11 07:50:03', NULL, NULL, 1),
(692, 29, 'Paschim (West) Burdwan (Bardhaman)', 1, NULL, '2019-10-11 07:50:15', NULL, NULL, 1),
(693, 29, 'Purba Burdwan (Bardhaman)', 1, NULL, '2019-10-11 07:50:26', NULL, NULL, 1),
(694, 29, 'Purba Medinipur (East Medinipur)', 1, NULL, '2019-10-11 07:50:34', NULL, NULL, 1),
(695, 29, 'Purulia', 1, NULL, '2019-10-11 07:50:41', NULL, NULL, 1),
(696, 29, 'South 24 Parganas', 1, NULL, '2019-10-11 07:50:52', NULL, NULL, 1),
(697, 29, 'Uttar Dinajpur (North Dinajpur)', 1, NULL, '2019-10-11 07:51:04', NULL, NULL, 1),
(698, 1, 'Gudivada', 1, 1, '2019-10-11 11:25:00', '2019-12-07 19:33:51', NULL, 1),
(699, 1, 'kurnool', 1, 1, '2019-10-23 10:53:02', '2019-10-23 10:53:34', NULL, 1),
(700, 1, 'kadapa', 1, NULL, '2019-10-24 05:17:05', NULL, '2019-12-07 17:14:01', 1),
(701, 1, 'west godavari', 1, NULL, '2019-10-31 07:14:27', NULL, '2019-10-31 07:14:42', 1),
(702, 25, 'Khammam', 1, NULL, '2019-12-04 14:00:18', NULL, '2020-02-11 14:06:02', 1),
(703, 1, 'Cuddappah', 1, NULL, '2019-12-05 16:53:15', NULL, NULL, 1),
(704, 1, 'Nellore', 1, NULL, '2019-12-05 16:59:21', NULL, NULL, 1),
(705, 25, 'Karimnagar', 1, 1742, '2019-12-05 17:05:44', '2020-02-09 05:26:00', '2020-02-11 14:07:21', 1),
(706, 25, 'Karimnagar', 1742, NULL, '2020-02-09 05:23:04', NULL, '2020-02-11 14:07:34', 1),
(707, 1, 'Guntur East', 1, NULL, '2020-02-11 14:21:23', NULL, '2020-02-11 14:25:55', 1),
(708, 1, 'Guntur West', 1, NULL, '2020-02-11 14:21:39', NULL, '2020-02-11 14:25:46', 1);

-- --------------------------------------------------------

--
-- Table structure for table `food_cart`
--

CREATE TABLE `food_cart` (
  `id` int(50) NOT NULL,
  `vendor_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `created_user_id` bigint(20) DEFAULT NULL,
  `updated_user_id` bigint(20) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '0=deleted,1=Active,2=Inactive'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `food_item`
--

CREATE TABLE `food_item` (
  `id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `short_desc` text NOT NULL,
  `desc` longtext NOT NULL,
  `price` float NOT NULL,
  `discount` float NOT NULL DEFAULT 0,
  `item_type` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1=Veg,2=Not-Veg',
  `quantity` int(11) NOT NULL,
  `label` varchar(50) DEFAULT NULL,
  `exp` int(11) NOT NULL,
  `qualification` text NOT NULL,
  `created_user_id` bigint(20) DEFAULT NULL,
  `updated_user_id` bigint(20) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `approval_status` tinyint(1) NOT NULL DEFAULT 2 COMMENT '1=available,2=not-available',
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '0=deleted,1=Active,2=Inactive'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `food_item`
--

INSERT INTO `food_item` (`id`, `menu_id`, `name`, `short_desc`, `desc`, `price`, `discount`, `item_type`, `quantity`, `label`, `exp`, `qualification`, `created_user_id`, `updated_user_id`, `created_at`, `updated_at`, `deleted_at`, `approval_status`, `status`) VALUES
(1, 1, 'Milma Milk', 'This is my new Short Description', '<p>Milk milma</p>', 64, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-16 18:08:04', NULL, NULL, 1, 1),
(2, 1, 'Amul', 'This is my new Short Description', '<p>Amul</p>', 55, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-16 18:09:15', NULL, NULL, 1, 1),
(3, 1, 'Nandini milk', 'This is my new Short Description', '<p>Nandini</p>', 88, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-16 18:10:13', NULL, NULL, 1, 1),
(4, 1, 'PDDP', 'This is my new Short Description', '<p>PDDP</p>', 33, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-16 18:13:52', NULL, NULL, 1, 1),
(5, 2, 'Total', 'This is my new Short Description', '<p>TOTAL</p>', 34, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-16 18:18:34', NULL, NULL, 1, 1),
(6, 2, 'HERITAGE', 'This is my new Short Description', '<p>HERITAGE</p>', 55, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-16 18:20:29', NULL, NULL, 1, 1),
(7, 2, 'Musti', 'This is my new Short Description', '<p>asdfsdf</p>', 44, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-16 18:23:58', NULL, NULL, 1, 1),
(8, 2, 'Nestle', 'This is my new Short Description', '<p>Nestle</p>', 55, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-16 18:25:37', NULL, NULL, 1, 1),
(9, 5, 'BLACK FOREST', 'This is my new Short Description', '<p>BLOCK FOREST</p>', 33, 10, 1, 1, '', 0, '', 1, 1, '2020-07-16 20:45:46', '2020-07-26 11:47:17', NULL, 1, 1),
(10, 5, 'LAVIAN CAPPUCINO chocolate', 'This is my new Short Description', '<p>LAVIAN CAPPUCINO chocolate</p>', 55, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-16 20:47:50', NULL, NULL, 1, 1),
(11, 5, 'ECLAIRS', 'This is my new Short Description', '<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"width:396px\">\r\n	<tbody>\r\n		<tr>\r\n			<td>ECLAIRS</td>\r\n		</tr>\r\n	</tbody>\r\n</table>', 200, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-16 20:49:04', NULL, NULL, 1, 1),
(12, 5, 'lavian caramel chocolate', 'This is my new Short Description', '<p>lavian caramel chocolate</p>', 12, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-16 20:50:13', NULL, NULL, 1, 1),
(13, 6, 'GULABJAMUN', 'This is my new Short Description', '<p>GULABJAMUN</p>', 56, 10, 1, 1, '', 0, '', 1, 1, '2020-07-16 20:51:44', '2020-09-07 06:50:38', NULL, 1, 1),
(14, 6, 'MALAI KAZA', 'This is my new Short Description', '<p>MALAI KAZA</p>', 66, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-16 20:53:04', NULL, NULL, 1, 1),
(15, 6, 'SPL MYSOREPAK', 'This is my new Short Description', '<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"width:396px\">\r\n	<tbody>\r\n		<tr>\r\n			<td>SPL MYSOREPAK</td>\r\n		</tr>\r\n	</tbody>\r\n</table>', 44, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-16 20:54:51', NULL, NULL, 1, 1),
(16, 7, 'CHAKODI', 'This is my new Short Description', '<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"width:396px\">\r\n	<tbody>\r\n		<tr>\r\n			<td>CHAKODI</td>\r\n		</tr>\r\n	</tbody>\r\n</table>', 52, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-16 20:56:08', NULL, NULL, 1, 1),
(17, 7, 'BOONDHI KARAS', 'This is my new Short Description', '<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"width:396px\">\r\n	<tbody>\r\n		<tr>\r\n			<td>BOONDHI KARAS</td>\r\n		</tr>\r\n	</tbody>\r\n</table>', 33, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-16 20:58:57', NULL, NULL, 1, 1),
(18, 7, 'BOONDHI KARAS', 'This is my new Short Description', '<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"width:396px\">\r\n	<tbody>\r\n		<tr>\r\n			<td>BOONDHI KARAS</td>\r\n		</tr>\r\n	</tbody>\r\n</table>', 33, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-16 20:58:59', NULL, NULL, 1, 1),
(19, 7, 'DHAL MIXTURE', 'This is my new Short Description', '<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"width:396px\">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n			<p>DHAL MIXTURE</p>\r\n\r\n			<p>&nbsp;</p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>', 88, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-16 20:59:59', NULL, NULL, 1, 1),
(20, 7, 'PAKODA', 'This is my new Short Description', '<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"width:396px\">\r\n	<tbody>\r\n		<tr>\r\n			<td>PAKODA</td>\r\n		</tr>\r\n	</tbody>\r\n</table>', 66, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-16 21:01:01', NULL, NULL, 1, 1),
(21, 8, 'VENNA BISCUITS', 'This is my new Short Description', '<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"width:396px\">\r\n	<tbody>\r\n		<tr>\r\n			<td>VENNA BISCUITS</td>\r\n		</tr>\r\n		<tr>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n		<tr>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n		<tr>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>', 44, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-16 21:02:43', NULL, NULL, 1, 1),
(22, 8, 'SALT FLOWER BISCUITS', 'This is my new Short Description', '<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"width:396px\">\r\n	<tbody>\r\n		<tr>\r\n			<td>SALT FLOWER BISCUITS</td>\r\n		</tr>\r\n	</tbody>\r\n</table>', 33, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-16 21:03:58', NULL, NULL, 1, 1),
(23, 8, 'FULL COCONUT BISCUITS', 'This is my new Short Description', '<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"width:396px\">\r\n	<tbody>\r\n		<tr>\r\n			<td>FULL COCONUT BISCUITS</td>\r\n		</tr>\r\n	</tbody>\r\n</table>', 22, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-16 21:06:51', NULL, NULL, 1, 1),
(24, 8, 'PISTA BISCUITS', 'This is my new Short Description', '<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"width:396px\">\r\n	<tbody>\r\n		<tr>\r\n			<td>PISTA BISCUITS</td>\r\n		</tr>\r\n	</tbody>\r\n</table>', 22, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-16 21:07:53', NULL, NULL, 1, 1),
(25, 9, 'GHEE KARAPODI DOSA', 'This is my new Short Description', '<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"width:396px\">\r\n	<tbody>\r\n		<tr>\r\n			<td>GHEE KARAPODI DOSA</td>\r\n		</tr>\r\n	</tbody>\r\n</table>', 55, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-16 21:13:49', NULL, NULL, 1, 1),
(26, 9, 'KARAPODI DOSA', 'This is my new Short Description', '<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"width:396px\">\r\n	<tbody>\r\n		<tr>\r\n			<td>KARAPODI DOSA</td>\r\n		</tr>\r\n	</tbody>\r\n</table>', 33, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-16 21:14:48', NULL, NULL, 1, 1),
(27, 9, 'ONION UTHAPPAM', 'This is my new Short Description', '<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"width:396px\">\r\n	<tbody>\r\n		<tr>\r\n			<td>ONION UTHAPPAM</td>\r\n		</tr>\r\n	</tbody>\r\n</table>', 66, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-16 21:16:23', NULL, NULL, 1, 1),
(28, 9, 'SAMBAR VADA 2PCS', 'This is my new Short Description', '<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"width:396px\">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n			<p>SAMBAR VADA 2PCS</p>\r\n\r\n			<p>&nbsp;</p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>', 32, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-16 21:17:27', NULL, NULL, 1, 1),
(29, 10, 'full meals', 'This is my new Short Description', '<p>full meals</p>', 200, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-16 21:20:11', NULL, NULL, 1, 1),
(30, 10, 'SOUTH-INDIAN-MEALS', 'This is my new Short Description', '<p>SOUTH-INDIAN-MEALS</p>\r\n\r\n<p>&nbsp;</p>', 300, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-16 21:21:04', NULL, NULL, 1, 1),
(31, 10, 'SINGLE MEALS', 'This is my new Short Description', '<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"width:396px\">\r\n	<tbody>\r\n		<tr>\r\n			<td>SINGLE MEALS</td>\r\n		</tr>\r\n	</tbody>\r\n</table>', 150, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-16 21:23:31', NULL, NULL, 1, 1),
(32, 11, 'Chicken Biryani with Coconut Milk', 'This is my new Short Description', '<p><a href=\"https://food.ndtv.com/recipe-chicken-biryani-with-coconut-milk-211697\" rel=\"noopener\" target=\"_blank\">Chicken Biryani with Coconut Milk&nbsp;</a></p>', 202, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-16 21:25:27', NULL, NULL, 1, 1),
(33, 11, 'kunda chicken biryani', 'This is my new Short Description', '<p>kunda chicken biryani</p>\r\n\r\n<p>&nbsp;</p>', 230, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-16 21:28:02', NULL, NULL, 1, 1),
(34, 11, 'dum biryani', 'This is my new Short Description', '<p>dum biryani</p>', 150, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-16 21:34:40', NULL, NULL, 1, 1),
(35, 11, 'tikka biryani', 'This is my new Short Description', '<p>tikka biryani</p>', 320, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-16 21:36:43', NULL, NULL, 1, 1),
(36, 12, 'hyderabadi biryani mutton', 'This is my new Short Description', '<p>mutton</p>', 300, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-16 21:40:12', NULL, NULL, 1, 1),
(37, 12, 'Keema Biryani', 'This is my new Short Description', '<p>Keema Biryani</p>\r\n\r\n<p>&nbsp;</p>', 222, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-16 21:40:38', NULL, NULL, 1, 1),
(38, 12, 'Awadhi Mutton Biryani.', 'This is my new Short Description', '<p>Awadhi Mutton Biryani.</p>', 333, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-16 21:41:50', NULL, NULL, 1, 1),
(39, 12, 'Makhni Biryani', 'This is my new Short Description', '<p>Makhni Biryani</p>', 423, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-16 21:49:01', NULL, NULL, 1, 1),
(40, 44, 'Kaju Biryani', 'This is my new Short Description', '<p>Tasty</p>', 140, 10, 1, 1, '50%OFF', 0, '', 1, 1, '2020-07-21 10:55:56', '2020-09-12 20:48:40', NULL, 1, 1),
(41, 44, 'Mixed Vegetable Biryani', 'This is my new Short Description', '<p>Tasty</p>', 140, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-21 10:57:43', NULL, NULL, 1, 1),
(42, 44, 'Paneer Biryani', 'This is my new Short Description', '<p>Tasty</p>', 140, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-21 11:00:07', NULL, NULL, 1, 1),
(43, 44, 'Plain Rice', 'This is my new Short Description', '<p>Tasty</p>', 80, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-21 11:01:03', NULL, NULL, 1, 1),
(44, 44, 'Veg Biryani', 'This is my new Short Description', '<p>Tasty</p>', 160, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-21 11:02:01', NULL, NULL, 1, 1),
(45, 26, 'Argan Oil Hair Spa', 'This is my new Short Description', '<p>Good</p>', 250, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-21 11:17:40', NULL, NULL, 1, 1),
(46, 26, 'Hair Spa (Loreal)', 'This is my new Short Description', '<p>Good</p>', 300, 10, 2, 1, '', 0, '', 1, NULL, '2020-07-21 11:20:58', NULL, NULL, 1, 1),
(47, 44, 'Zeera rice', 'This is my new Short Description', '<p>Tasty</p>', 150, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-21 11:22:27', NULL, NULL, 1, 1),
(48, 26, 'Hair Spa (Organic)', 'This is my new Short Description', '<p>Good</p>', 420, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-21 11:22:29', NULL, NULL, 1, 1),
(49, 59, 'Chicken Biryani', 'This is my new Short Description', '<p>Tasty</p>', 220, 10, 2, 1, '', 0, '', 1, NULL, '2020-07-21 11:23:17', NULL, NULL, 1, 1),
(50, 26, 'Moisturizing Hair Spa', 'This is my new Short Description', '<p>Good</p>', 300, 10, 1, 1, 'Hot Deal', 0, '', 1, NULL, '2020-07-21 11:23:17', NULL, NULL, 1, 1),
(51, 31, 'Bridal Makeup', 'This is my new Short Description', '<p>Good</p>', 200, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-21 11:24:35', NULL, NULL, 1, 1),
(52, 59, 'Chicken Dum biryani', 'This is my new Short Description', '<p>Tasty</p>', 220, 10, 2, 1, '', 0, '', 1, NULL, '2020-07-21 11:24:56', NULL, NULL, 1, 1),
(53, 31, 'Casual Makeup', 'This is my new Short Description', '<p>Good</p>', 300, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-21 11:25:07', NULL, NULL, 1, 1),
(54, 59, 'Chicken Fry piece biryani', 'This is my new Short Description', '<p>Tasty</p>', 240, 10, 2, 1, '', 0, '', 1, NULL, '2020-07-21 11:25:32', NULL, NULL, 1, 1),
(55, 31, 'Engagement Makeup', 'This is my new Short Description', '<p>Good</p>', 230, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-21 11:26:33', NULL, NULL, 1, 1),
(56, 59, 'Chicken lollipop biryani', 'This is my new Short Description', '<p>Tasty</p>', 250, 10, 2, 1, '', 0, '', 1, NULL, '2020-07-21 11:26:34', NULL, NULL, 1, 1),
(57, 31, 'Eye Makeup', 'This is my new Short Description', '<p>Good</p>', 230, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-21 11:27:19', NULL, NULL, 1, 1),
(58, 59, 'Mutton Biryani', 'This is my new Short Description', '<p>Tasty</p>', 240, 10, 2, 1, '', 0, '', 1, NULL, '2020-07-21 11:27:27', NULL, NULL, 1, 1),
(59, 31, 'eyelash lifting', 'This is my new Short Description', '<p>Good</p>', 140, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-21 11:27:54', NULL, NULL, 1, 1),
(60, 31, 'eyelash tinting', 'This is my new Short Description', '<p>Good</p>', 130, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-21 11:28:35', NULL, NULL, 1, 1),
(61, 34, 'body massage treatment', 'This is my new Short Description', '<p>Good</p>', 1000, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-21 11:29:35', NULL, NULL, 1, 1),
(62, 34, 'Body Scrub', 'This is my new Short Description', '<p>Good</p>', 1500, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-21 11:30:10', NULL, NULL, 1, 1),
(63, 59, 'Boneless Mutton Biryani', 'This is my new Short Description', '<p>Tasty</p>', 260, 10, 2, 1, '', 0, '', 1, NULL, '2020-07-21 11:30:13', NULL, NULL, 1, 1),
(64, 59, 'Fish Biryani', 'This is my new Short Description', '<p>Tasty</p>', 240, 10, 2, 1, '', 0, '', 1, NULL, '2020-07-21 11:31:10', NULL, NULL, 1, 1),
(65, 34, 'Chair massage', 'This is my new Short Description', '<p>Good</p>', 1600, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-21 11:31:41', NULL, NULL, 1, 1),
(66, 59, 'Prawn Biryani', 'This is my new Short Description', '<p>Tasty</p>', 260, 10, 2, 1, '', 0, '', 1, NULL, '2020-07-21 11:32:09', NULL, NULL, 1, 1),
(67, 34, 'Head Massage', 'This is my new Short Description', '<p>Good</p>', 1600, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-21 11:32:14', NULL, NULL, 1, 1),
(68, 34, 'Oil Massage', 'This is my new Short Description', '<p>Good</p>', 1600, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-21 11:33:05', NULL, NULL, 1, 1),
(69, 37, 'Skin Care For Moisturizer', 'This is my new Short Description', '<p>Good</p>', 1200, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-21 11:34:09', NULL, NULL, 1, 1),
(70, 37, 'Skin care for Oily Face', 'This is my new Short Description', '<p>Good</p>', 1200, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-21 11:34:53', NULL, NULL, 1, 1),
(71, 37, 'Skin Care for Sunscreen', 'This is my new Short Description', '<p>Good</p>', 1300, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-21 11:35:30', NULL, NULL, 1, 1),
(72, 41, 'Diamond Cleanup', 'This is my new Short Description', '<p>Good</p>', 1200, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-21 11:36:27', NULL, NULL, 1, 1),
(73, 41, 'Face & Neck Clean up', 'This is my new Short Description', '<p>Good</p>', 1300, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-21 11:36:53', NULL, NULL, 1, 1),
(74, 41, 'Golden Cleanup', 'This is my new Short Description', '<p>Good</p>', 1300, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-21 11:37:26', NULL, NULL, 1, 1),
(75, 45, 'Almond Facial', 'This is my new Short Description', '<p>Good</p>', 300, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-21 11:38:35', NULL, NULL, 1, 1),
(76, 45, 'Aloe Vera Facial', 'This is my new Short Description', '<p>Good</p>', 230, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-21 11:39:47', NULL, NULL, 1, 1),
(77, 45, 'Aroma Facial', 'This is my new Short Description', '<p>Good</p>', 240, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-21 11:40:31', NULL, NULL, 1, 1),
(78, 45, 'Bridal facial', 'This is my new Short Description', '<p>Good</p>', 230, 10, 1, 1, 'Hot Deal', 0, '', 1, NULL, '2020-07-21 11:41:23', NULL, NULL, 1, 1),
(79, 45, 'Chocolate Facial', 'This is my new Short Description', '<p>Good</p>', 260, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-21 11:42:16', NULL, NULL, 1, 1),
(80, 46, 'balayage', 'This is my new Short Description', '<p>Good</p>', 230, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-21 11:44:07', NULL, NULL, 1, 1),
(81, 46, 'brazilian blowouts', 'This is my new Short Description', '<p>Good</p>', 250, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-21 11:44:49', NULL, NULL, 1, 1),
(82, 49, 'child manicure', 'This is my new Short Description', '<p>Good</p>', 230, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-21 11:45:33', NULL, NULL, 1, 1),
(83, 49, 'child pedicure', 'This is my new Short Description', '<p>Good</p>', 260, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-21 11:46:20', NULL, NULL, 1, 1),
(84, 49, 'child pedicure', 'This is my new Short Description', '<p>Good</p>', 260, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-21 11:46:33', NULL, NULL, 1, 1),
(85, 49, 'Experess Pedicure', 'This is my new Short Description', '<p>Good</p>', 260, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-21 11:47:02', NULL, NULL, 1, 1),
(86, 49, 'express manicure', 'This is my new Short Description', '<p>Good</p>', 200, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-21 11:48:51', NULL, NULL, 1, 1),
(87, 52, 'Hair Care', 'This is my new Short Description', '<p>Good</p>', 260, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-21 11:52:32', NULL, NULL, 1, 1),
(88, 52, 'Hair Care', 'This is my new Short Description', '<p>Good</p>', 260, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-21 11:52:35', NULL, NULL, 1, 1),
(89, 52, 'hair treatment', 'This is my new Short Description', '<p>Good</p>', 260, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-21 11:53:51', NULL, NULL, 1, 1),
(90, 52, 'nail care', 'This is my new Short Description', '<p>Good</p>', 260, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-21 11:54:28', NULL, NULL, 1, 1),
(91, 52, 'Waxing', 'This is my new Short Description', '<p>Good</p>', 240, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-21 11:59:33', NULL, NULL, 1, 1),
(92, 81, 'Egg Noodles', 'This is my new Short Description', '<p>Tasty</p>', 60, 10, 2, 1, '', 0, '', 1, NULL, '2020-07-21 11:59:59', NULL, NULL, 1, 1),
(93, 81, 'Egg Fried Rice', 'This is my new Short Description', '<p>Tasty</p>', 60, 10, 2, 1, '', 0, '', 1, NULL, '2020-07-21 12:01:23', NULL, NULL, 1, 1),
(94, 56, 'chin threading', 'This is my new Short Description', '<p>Good</p>', 50, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-21 12:01:33', NULL, NULL, 1, 1),
(95, 56, 'Eyebrow Threading', 'This is my new Short Description', '<p>Good</p>', 60, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-21 12:02:31', NULL, NULL, 1, 1),
(96, 81, 'chicken fried rice', 'This is my new Short Description', '<p>Tasty</p>', 80, 10, 2, 1, '', 0, '', 1, NULL, '2020-07-21 12:02:41', NULL, NULL, 1, 1),
(97, 56, 'ForeHead threading', 'This is my new Short Description', '<p>Good</p>', 60, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-21 12:03:33', NULL, NULL, 1, 1),
(98, 81, 'Chicken noodles', 'This is my new Short Description', '<p>Tasty</p>', 60, 10, 2, 1, '', 0, '', 1, NULL, '2020-07-21 12:04:34', NULL, NULL, 1, 1),
(99, 84, 'Chicken Manchuria', 'This is my new Short Description', '<p>Tasty</p>', 60, 10, 2, 1, '', 0, '', 1, NULL, '2020-07-21 12:06:02', NULL, NULL, 1, 1),
(100, 84, 'Chicken fry', 'This is my new Short Description', '<p>Tasty</p>', 80, 10, 2, 1, '', 0, '', 1, NULL, '2020-07-21 12:06:30', NULL, NULL, 1, 1),
(101, 84, 'Chicken 65', 'This is my new Short Description', '<p>Tasty</p>', 80, 10, 2, 1, '', 0, '', 1, NULL, '2020-07-21 12:07:00', NULL, NULL, 1, 1),
(102, 84, 'chicken Wings Fry', 'This is my new Short Description', '<p>Tasty</p>', 80, 10, 2, 1, '', 0, '', 1, NULL, '2020-07-21 12:07:35', NULL, NULL, 1, 1),
(103, 94, 'paneer biryani', 'This is my new Short Description', '<p>Tasty</p>', 100, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-21 12:13:41', NULL, NULL, 1, 1),
(104, 96, 'Mutton biryani', 'This is my new Short Description', '<p>Tasty</p>', 200, 10, 2, 1, '', 0, '', 1, NULL, '2020-07-21 12:14:10', NULL, NULL, 1, 1),
(105, 97, 'Cakes', 'This is my new Short Description', '<p>Tasty</p>', 20, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-21 12:16:12', NULL, NULL, 1, 1),
(106, 94, 'veg biryani', 'This is my new Short Description', '<p>tasty</p>', 10, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-21 12:18:22', NULL, NULL, 1, 1),
(107, 94, 'mixed vegetable biryani', 'This is my new Short Description', '<p>Tasty</p>', 10, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-21 12:18:56', NULL, NULL, 1, 1),
(108, 94, 'Kaju biryani', 'This is my new Short Description', '<p>Tasty</p>', 10, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-21 12:19:35', NULL, NULL, 1, 1),
(109, 96, 'Chicken Dum biryani', 'This is my new Short Description', '<p>Tasty</p>', 10, 10, 2, 1, '', 0, '', 1, NULL, '2020-07-21 12:20:14', NULL, NULL, 1, 1),
(110, 96, 'Prawn biryani', 'This is my new Short Description', '<p>Tasty</p>', 10, 10, 2, 1, '', 0, '', 1, NULL, '2020-07-21 12:20:38', NULL, NULL, 1, 1),
(111, 69, 'Biotique', 'This is my new Short Description', '<p>Good</p>', 260, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-21 12:21:17', NULL, NULL, 1, 1),
(112, 96, 'Salmod Fish biryani', 'This is my new Short Description', '<p>Tasty</p>', 10, 10, 2, 1, '', 0, '', 1, NULL, '2020-07-21 12:21:18', NULL, NULL, 1, 1),
(113, 69, 'Colorbar', 'This is my new Short Description', '<p>Good</p>', 60, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-21 12:22:02', NULL, NULL, 1, 1),
(114, 69, 'Himalaya', 'This is my new Short Description', '<p>Good</p>', 260, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-21 12:22:54', NULL, NULL, 1, 1),
(115, 70, 'Dove conditioner', 'This is my new Short Description', '<p>Good</p>', 260, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-21 12:24:01', NULL, NULL, 1, 1),
(116, 97, 'Besan-Halwa', 'This is my new Short Description', '<p>Tasty</p>', 50, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-21 12:24:41', NULL, NULL, 1, 1),
(117, 70, 'Khadi conditioner', 'This is my new Short Description', '<p>Good</p>', 160, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-21 12:24:42', NULL, NULL, 1, 1),
(118, 97, 'Chocolate-Barfi', 'This is my new Short Description', '<p>Tasty</p>', 50, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-21 12:25:05', NULL, NULL, 1, 1),
(119, 70, 'L\'oreal Conditioner', 'This is my new Short Description', '<p>Good</p>', 260, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-21 12:25:28', NULL, NULL, 1, 1),
(120, 97, 'Ghee mysorepak', 'This is my new Short Description', '<p>Tasty</p>', 50, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-21 12:25:47', NULL, NULL, 1, 1),
(121, 97, 'butterscotch ice cream', 'This is my new Short Description', '<p>Tasty</p>', 50, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-21 12:29:22', NULL, NULL, 1, 1),
(122, 97, 'ice cream vanilla', 'This is my new Short Description', '<p>Tasty</p>', 50, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-21 12:29:45', NULL, NULL, 1, 1),
(123, 97, 'strawberry ice cream', 'This is my new Short Description', '<p>Tasty</p>', 50, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-21 12:30:06', NULL, NULL, 1, 1),
(124, 104, 'Foolzy.', 'This is my new Short Description', '<p>Good</p>', 260, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-21 12:30:43', NULL, NULL, 1, 1),
(125, 104, 'Lotus Herbals Professional', 'This is my new Short Description', '<p>Good</p>', 260, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-21 12:31:12', NULL, NULL, 1, 1),
(126, 99, 'Cococola', 'This is my new Short Description', '<p>Tasty</p>', 40, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-21 12:31:21', NULL, NULL, 1, 1),
(127, 99, 'Mazaa', 'This is my new Short Description', '<p>Tasty</p>', 50, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-21 12:31:41', NULL, NULL, 1, 1),
(128, 104, 'Nature\'s Essence', 'This is my new Short Description', '<p>Good</p>', 260, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-21 12:31:51', NULL, NULL, 1, 1),
(129, 99, 'mountain due', 'This is my new Short Description', '<p>Tasty</p>', 50, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-21 12:32:00', NULL, NULL, 1, 1),
(130, 99, 'pepsi', 'This is my new Short Description', '<p>Tasty</p>', 50, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-21 12:32:25', NULL, NULL, 1, 1),
(131, 99, 'sprite', 'This is my new Short Description', '<p>Tasty</p>', 50, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-21 12:32:47', NULL, NULL, 1, 1),
(132, 99, 'thumpsup', 'This is my new Short Description', '<p>Tasty</p>', 50, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-21 12:33:29', NULL, NULL, 1, 1),
(133, 5, '5- Star', 'This is my new Short Description', '<p>Tasty</p>', 10, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-21 12:33:32', NULL, NULL, 1, 1),
(134, 5, 'Bournville', 'This is my new Short Description', '<p>Tasty</p>', 10, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-21 12:34:44', NULL, NULL, 1, 1),
(135, 6, 'Kaju Ki Barfi', 'This is my new Short Description', '<p>Tasty</p>', 150, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-21 12:35:29', NULL, NULL, 1, 1),
(136, 108, 'Veg Biryani', 'This is my new Short Description', '<p>Tasty</p>', 20, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-21 12:39:11', NULL, NULL, 1, 1),
(137, 8, 'Good day', 'This is my new Short Description', '<p>Tasty</p>', 10, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-21 12:39:12', NULL, NULL, 1, 1),
(138, 108, 'paneer biryani', 'This is my new Short Description', '<p>Tasty</p>', 20, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-21 12:39:34', NULL, NULL, 1, 1),
(139, 109, 'Chicken Biryani', 'This is my new Short Description', '<p>Tasty</p>', 20, 10, 2, 1, '', 0, '', 1, NULL, '2020-07-21 12:40:12', NULL, NULL, 1, 1),
(140, 109, 'Mutton biryani', 'This is my new Short Description', '<p>tasty</p>', 20, 10, 2, 1, '', 0, '', 1, NULL, '2020-07-21 12:40:36', NULL, NULL, 1, 1),
(141, 109, 'Prawns biryani', 'This is my new Short Description', '<p>Tasty</p>', 20, 10, 2, 1, '', 0, '', 1, NULL, '2020-07-21 12:40:58', NULL, NULL, 1, 1),
(142, 14, 'Blackforest-cake', 'This is my new Short Description', '<p>Blackforest-cake</p>', 150, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-21 12:42:19', NULL, NULL, 1, 1),
(143, 110, 'Butter chapathi', 'This is my new Short Description', '<p>Tasty</p>', 20, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-21 12:42:19', NULL, NULL, 1, 1),
(144, 14, 'Cherry Cheese Cake', 'This is my new Short Description', '<p>Cherry Cheese Cake</p>', 150, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-21 12:42:42', NULL, NULL, 1, 1),
(145, 110, 'Egg chapathi', 'This is my new Short Description', '<p>Tasty</p>', 20, 10, 2, 1, '', 0, '', 1, NULL, '2020-07-21 12:42:50', NULL, NULL, 1, 1),
(146, 110, 'Egg chapathi', 'This is my new Short Description', '<p>Tasty</p>', 20, 10, 2, 1, '', 0, '', 1, NULL, '2020-07-21 12:43:06', NULL, NULL, 1, 1),
(147, 110, 'Cheese chapathi', 'This is my new Short Description', '<p>Tasty</p>', 20, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-21 12:43:16', NULL, NULL, 1, 1),
(148, 14, 'Egg less Truffle Cake', 'This is my new Short Description', '<p>Egg less Truffle Cake</p>', 150, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-21 12:43:18', NULL, NULL, 1, 1),
(149, 14, 'coffee cake with kahlua chocolate ganache', 'This is my new Short Description', '<p>coffee cake with kahlua chocolate ganache</p>', 500, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-21 12:43:42', NULL, NULL, 1, 1),
(150, 14, 'mango meringue cake', 'This is my new Short Description', '<p>mango meringue cake</p>', 149, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-21 12:44:24', NULL, NULL, 1, 1),
(151, 15, 'birthday-special-red-velvet-cake', 'This is my new Short Description', '<p>birthday-special-red-velvet-cake</p>', 150, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-21 12:45:11', NULL, NULL, 1, 1),
(152, 111, 'Fish fry', 'This is my new Short Description', '<p>Tasty</p>', 20, 10, 2, 1, '', 0, '', 1, NULL, '2020-07-21 12:46:16', NULL, NULL, 1, 1),
(153, 15, 'Black forest gateau Cake', 'This is my new Short Description', '<p>Black forest gateau Cake</p>', 150, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-21 12:46:35', NULL, NULL, 1, 1),
(154, 15, 'carrot-cake-recipe', 'This is my new Short Description', '<p>carrot-cake-recipe</p>', 150, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-21 12:47:16', NULL, NULL, 1, 1),
(155, 111, 'Prawns Fry', 'This is my new Short Description', '<p>Tasty</p>', 20, 10, 2, 1, '', 0, '', 1, NULL, '2020-07-21 12:48:05', NULL, NULL, 1, 1),
(156, 15, 'Eggless-happy-birthday-truffle-cake', 'This is my new Short Description', '<p>Eggless-happy-birthday-truffle-cake</p>', 150, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-21 12:48:12', NULL, NULL, 1, 1),
(157, 15, 'Genoise Birthday Cake', 'This is my new Short Description', '<p>Genoise Birthday Cake</p>', 150, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-21 12:48:30', NULL, NULL, 1, 1),
(158, 111, 'Crab Fry', 'This is my new Short Description', '<p>Tasty</p>', 20, 10, 2, 1, '', 0, '', 1, NULL, '2020-07-21 12:49:19', NULL, NULL, 1, 1),
(159, 16, 'Bubbly Champagne Cupcakes', 'This is my new Short Description', '<p>Bubbly Champagne Cupcakes</p>', 150, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-21 12:50:12', NULL, NULL, 1, 1),
(160, 16, 'Chocolate Bourbon Pean Pie -Cupcake', 'This is my new Short Description', '<p>Chocolate Bourbon Pean Pie -Cupcake</p>', 149, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-21 12:51:11', NULL, NULL, 1, 1),
(161, 16, 'Easy Little Pandas-Cupcakes', 'This is my new Short Description', '<p>Easy Little Pandas-Cupcakes</p>', 150, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-21 12:51:49', NULL, NULL, 1, 1),
(162, 16, 'lemon-lavender-cupcakes', 'This is my new Short Description', '<p>lemon-lavender-cupcakes</p>', 150, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-21 12:52:16', NULL, NULL, 1, 1),
(163, 16, 'muffins', 'This is my new Short Description', '<p>muffins</p>', 150, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-21 12:52:41', NULL, NULL, 1, 1),
(164, 17, 'Black forest gateau Cake', 'This is my new Short Description', '<p>Black forest gateau Cake</p>', 150, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-21 12:53:11', NULL, NULL, 1, 1),
(165, 112, 'Idli', 'This is my new Short Description', '<p>Tasty</p>', 20, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-21 12:53:34', NULL, NULL, 1, 1),
(166, 17, 'Eggless Truffle Cake', 'This is my new Short Description', '<p>Eggless Truffle Cake</p>', 510, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-21 12:53:34', NULL, NULL, 1, 1),
(167, 112, 'Kichadi', 'This is my new Short Description', '<p>Tasty</p>', 20, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-21 12:53:55', NULL, NULL, 1, 1),
(168, 17, 'Genoise Cake', 'This is my new Short Description', '<p>Genoise Cake</p>', 510, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-21 12:54:03', NULL, NULL, 1, 1),
(169, 112, 'mysore bonda', 'This is my new Short Description', '<p>Tasty</p>', 20, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-21 12:54:12', NULL, NULL, 1, 1),
(170, 112, 'Pesarattu', 'This is my new Short Description', '<p>Tasty</p>', 20, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-21 12:54:31', NULL, NULL, 1, 1),
(171, 18, 'Choclate Ice cream', 'This is my new Short Description', '<p>Choclate Ice cream</p>', 150, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-21 12:54:32', NULL, NULL, 1, 1),
(172, 112, 'pulihora', 'This is my new Short Description', '<p>Tasty</p>', 20, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-21 12:54:52', NULL, NULL, 1, 1),
(173, 18, 'Chocolate Cup Ice cream', 'This is my new Short Description', '<p>Chocolate Cup Ice cream</p>', 150, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-21 12:54:57', NULL, NULL, 1, 1),
(174, 112, 'Puri', 'This is my new Short Description', '<p>Tasty</p>', 20, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-21 12:55:16', NULL, NULL, 1, 1),
(175, 18, 'Popsicle-lollipop-fruit-ice-cream', 'This is my new Short Description', '<p>Popsicle-lollipop-fruit-ice-cream</p>', 50, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-21 12:55:30', NULL, NULL, 1, 1),
(176, 112, 'Rava dosa', 'This is my new Short Description', '<p>Tasty</p>', 20, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-21 12:55:34', NULL, NULL, 1, 1),
(177, 112, 'Uthappam', 'This is my new Short Description', '<p>Tasty</p>', 20, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-21 12:55:50', NULL, NULL, 1, 1),
(178, 18, 'Chocolate Stick Ice cream', 'This is my new Short Description', '<p>Chocolate Stick Ice cream</p>', 50, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-21 12:55:53', NULL, NULL, 1, 1),
(179, 112, 'Vada', 'This is my new Short Description', '<p>Tasty</p>', 20, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-21 12:56:08', NULL, NULL, 1, 1),
(180, 19, 'blackforest-cake', 'This is my new Short Description', '<p>blackforest-cake</p>', 580, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-21 12:56:16', NULL, NULL, 1, 1),
(181, 19, 'Butterscotch-cake', 'This is my new Short Description', '<p>Butterscotch-cake</p>', 50, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-21 12:56:30', NULL, NULL, 1, 1),
(182, 19, 'carrot-cake', 'This is my new Short Description', '<p>carrot-cake</p>', 49, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-21 12:56:45', NULL, NULL, 1, 1),
(183, 19, 'Chiffon-cake', 'This is my new Short Description', '<p>Chiffon-cake</p>', 150, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-21 12:57:23', NULL, NULL, 1, 1),
(184, 19, 'Genoise Cake', 'This is my new Short Description', '<p>Genoise Cake</p>', 150, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-21 12:57:48', NULL, NULL, 1, 1),
(185, 20, 'Chapati batter', 'This is my new Short Description', '<p>Chapati batter</p>', 150, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-21 12:58:37', NULL, NULL, 1, 1),
(186, 20, 'Chapati readymade', 'This is my new Short Description', '<p>Chapati readymade</p>', 10, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-21 12:59:04', NULL, NULL, 1, 1),
(187, 20, 'Dosa batter', 'This is my new Short Description', '<p>Dosa batter</p>', 50, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-21 12:59:19', NULL, NULL, 1, 1),
(188, 20, 'Fresh-cream', 'This is my new Short Description', '<p>Fresh-cream</p>', 50, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-21 12:59:40', NULL, NULL, 1, 1),
(189, 20, 'Paneer', 'This is my new Short Description', '<p>Paneer</p>', 50, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-21 12:59:58', NULL, NULL, 1, 1),
(190, 116, 'Bread Snacks', 'This is my new Short Description', '<p>Tasty</p>', 20, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-21 13:01:05', NULL, NULL, 1, 1),
(191, 21, 'Amul Buttermilk', 'This is my new Short Description', '<p>Amul Buttermilk</p>', 50, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-21 13:01:10', NULL, NULL, 1, 1),
(192, 21, 'Hatsun', 'This is my new Short Description', '<p>Hatsun</p>', 50, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-21 13:01:35', NULL, NULL, 1, 1),
(193, 21, 'Heritage', 'This is my new Short Description', '<p>Heritage</p>', 50, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-21 13:01:43', NULL, NULL, 1, 1),
(194, 116, 'Bread Snacks', 'This is my new Short Description', '<p>Tasty</p>', 20, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-21 13:02:03', NULL, '2020-07-21 16:55:27', 1, 1),
(195, 116, 'Corn Snacks', 'This is my new Short Description', '<p>Tasty</p>', 20, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-21 13:02:48', NULL, NULL, 1, 1),
(196, 117, 'chicken satay', 'This is my new Short Description', '<p>Tasty</p>', 20, 10, 2, 1, '', 0, '', 1, NULL, '2020-07-21 13:05:04', NULL, NULL, 1, 1),
(197, 117, 'chicken satay', 'This is my new Short Description', '<p>Tasty</p>', 20, 10, 2, 1, '', 0, '', 1, NULL, '2020-07-21 13:05:16', NULL, '2020-07-21 16:54:51', 1, 1),
(198, 117, 'chicken satay', 'This is my new Short Description', '<p>Tasty</p>', 20, 10, 2, 1, '', 0, '', 1, NULL, '2020-07-21 13:05:17', NULL, '2020-07-21 16:55:12', 1, 1),
(199, 117, 'Tangri kebabs', 'This is my new Short Description', '<p>Tasty</p>', 20, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-21 13:06:12', NULL, NULL, 1, 1),
(200, 22, 'Amul', 'This is my new Short Description', '<p>Amul</p>', 10, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-21 13:07:31', NULL, NULL, 1, 1),
(201, 22, 'Arokya_curd', 'This is my new Short Description', '<p>Arokya_curd</p>', 15, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-21 13:08:49', NULL, NULL, 1, 1),
(202, 21, 'Hatsun curd', 'This is my new Short Description', '<p>Hatsun curd</p>', 14, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-21 13:09:41', NULL, NULL, 1, 1),
(203, 22, 'Heritage', 'This is my new Short Description', '<p>Heritage</p>', 15, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-21 13:10:05', NULL, NULL, 1, 1),
(204, 22, 'Vijaya curd', 'This is my new Short Description', '<p>Vijaya curd</p>', 15, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-21 13:10:44', NULL, NULL, 1, 1),
(205, 23, 'Amul', 'This is my new Short Description', '<p>Amul</p>', 15, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-21 13:11:25', NULL, NULL, 1, 1),
(206, 23, 'Aroghya  milk', 'This is my new Short Description', '<p>Aroghya &nbsp;milk</p>', 14, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-21 13:11:45', NULL, NULL, 1, 1),
(207, 23, 'Goodlife-milk', 'This is my new Short Description', '<p>Goodlife-milk</p>', 15, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-21 13:12:18', NULL, NULL, 1, 1),
(208, 23, 'Heritage', 'This is my new Short Description', '<p>Heritage</p>', 15, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-21 13:12:40', NULL, NULL, 1, 1),
(209, 24, 'Amul', 'This is my new Short Description', '<p>Amul</p>', 145, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-21 13:13:05', NULL, NULL, 1, 1),
(210, 24, 'Delicious', 'This is my new Short Description', '<p>Delicious</p>', 15, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-21 13:13:31', NULL, NULL, 1, 1),
(211, 24, 'Organic', 'This is my new Short Description', '<p>Organic</p>', 52, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-21 13:13:56', NULL, NULL, 1, 1),
(212, 24, 'Shea', 'This is my new Short Description', '<p>Shea</p>', 15, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-21 13:14:18', NULL, NULL, 1, 1),
(213, 25, 'Amul', 'This is my new Short Description', '<p>Amul</p>', 15, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-21 13:14:39', NULL, NULL, 1, 1),
(214, 25, 'Feta', 'This is my new Short Description', '<p>Feta</p>', 15, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-21 13:15:10', NULL, NULL, 1, 1),
(215, 25, 'Velveeta', 'This is my new Short Description', '<p>Velveeta</p>', 15, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-21 13:15:51', NULL, NULL, 1, 1),
(216, 27, 'Amul', 'This is my new Short Description', '<p>Amul</p>', 15, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-21 13:42:01', NULL, NULL, 1, 1),
(217, 27, 'DURGA-GHEE', 'This is my new Short Description', '<p>DURGA-GHEE</p>', 15, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-21 13:43:10', NULL, NULL, 1, 1),
(218, 27, 'Gowardhan', 'This is my new Short Description', '<p>Gowardhan</p>', 15, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-21 13:43:29', NULL, NULL, 1, 1),
(219, 27, 'Haldirams', 'This is my new Short Description', '<p>Haldirams</p>', 15, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-21 13:43:52', NULL, NULL, 1, 1),
(220, 27, 'Nanda- Gokul', 'This is my new Short Description', '<p>Nanda- Gokul</p>', 15, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-21 13:44:10', NULL, NULL, 1, 1),
(221, 28, 'Green apple', 'This is my new Short Description', '<p>Green apple</p>', 50, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-21 13:44:57', NULL, NULL, 1, 1),
(222, 28, 'Pears', 'This is my new Short Description', '<p>pears</p>', 50, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-21 13:45:50', NULL, NULL, 1, 1),
(223, 28, 'Red Apple', 'This is my new Short Description', '<p>red Apple</p>', 50, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-21 13:46:08', NULL, NULL, 1, 1),
(224, 29, 'Blueberries', 'This is my new Short Description', '<p><strong>blueberries</strong></p>', 50, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-21 13:46:37', NULL, NULL, 1, 1),
(225, 29, 'kiwifruit', 'This is my new Short Description', '<p>kiwifruit</p>', 50, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-21 13:47:05', NULL, NULL, 1, 1),
(226, 29, 'Passionfruit', 'This is my new Short Description', '<p>passionfruit</p>', 50, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-21 13:47:25', NULL, NULL, 1, 1),
(227, 29, 'Raspberries', 'This is my new Short Description', '<p>Raspberries</p>', 50, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-21 13:47:49', NULL, NULL, 1, 1),
(228, 29, 'Strawberry', 'This is my new Short Description', '<p>Strawberry</p>', 50, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-21 13:48:15', NULL, NULL, 1, 1),
(229, 30, 'Grapefruits', 'This is my new Short Description', '<p>Grapefruits</p>', 50, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-21 13:48:47', NULL, NULL, 1, 1),
(230, 30, 'Limes', 'This is my new Short Description', '<p>Limes.</p>', 52, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-21 13:50:13', NULL, NULL, 1, 1),
(231, 30, 'Mandarins', 'This is my new Short Description', '<p>mandarins</p>', 14, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-21 13:50:49', NULL, NULL, 1, 1),
(232, 30, 'Oranges', 'This is my new Short Description', '<p>oranges</p>', 15, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-21 13:51:13', NULL, NULL, 1, 1),
(233, 32, 'Aubergine or Eggplant.', 'This is my new Short Description', '<p>Aubergine or Eggplant.</p>', 50, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-21 13:51:48', NULL, NULL, 1, 1),
(234, 32, 'Avocado', 'This is my new Short Description', '<p>Avocado</p>', 50, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-21 13:52:05', NULL, NULL, 1, 1),
(235, 32, 'Olives', 'This is my new Short Description', '<p>Olives</p>', 50, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-21 13:52:28', NULL, NULL, 1, 1),
(236, 32, 'Pumpkin & Squash', 'This is my new Short Description', '<p>Pumpkin &amp; Squash</p>', 15, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-21 13:52:43', NULL, NULL, 1, 1),
(237, 32, 'Sweet corn', 'This is my new Short Description', '<p>Sweet corn</p>', 50, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-21 13:53:15', NULL, NULL, 1, 1),
(238, 33, 'Amaranth leaves', 'This is my new Short Description', '<p>Amaranth leaves</p>\r\n\r\n<p>&nbsp;</p>', 10, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-21 13:54:15', NULL, NULL, 1, 1),
(239, 33, 'Chenopodium', 'This is my new Short Description', '<p>Chenopodium&nbsp;</p>', 10, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-21 13:54:49', NULL, NULL, 1, 1),
(240, 33, 'Colocasia', 'This is my new Short Description', '<p>Colocasia</p>', 10, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-21 13:55:36', NULL, NULL, 1, 1),
(241, 33, 'Fenugreek', 'This is my new Short Description', '<p>Fenugreek</p>', 15, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-21 13:55:56', NULL, NULL, 1, 1),
(242, 33, 'greens', 'This is my new Short Description', '<p>greens</p>', 10, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-21 13:56:12', NULL, NULL, 1, 1),
(243, 33, 'Mesta', 'This is my new Short Description', '<p>Mesta</p>', 10, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-21 13:56:31', NULL, NULL, 1, 1),
(244, 33, 'Moringa', 'This is my new Short Description', '<p>Moringa</p>', 10, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-21 13:56:44', NULL, NULL, 1, 1),
(245, 33, 'Mustard', 'This is my new Short Description', '<p>Mustard</p>', 10, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-21 13:57:07', NULL, NULL, 1, 1),
(246, 33, 'Narrow-leaved dock', 'This is my new Short Description', '<p>Narrow-leaved dock</p>', 10, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-21 13:58:10', NULL, NULL, 1, 1),
(247, 33, 'Purslane', 'This is my new Short Description', '<p>Purslane</p>', 10, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-21 13:58:32', NULL, NULL, 1, 1),
(248, 33, 'Spinach', 'This is my new Short Description', '<p>Spinach</p>', 10, 10, 1, 1, '', 0, '', 1, NULL, '2020-07-21 13:58:48', NULL, NULL, 1, 1),
(249, 14, 'Pastry', 'This is my new Short Description', '<p>Pastry</p>', 500, 10, 1, 1, '', 0, '', 101002, 1, '2020-07-21 16:31:49', '2020-07-21 16:32:29', '2020-07-21 16:36:47', 1, 1),
(250, 17, 'Pastry', 'This is my new Short Description', '<p>Cake</p>', 500, 10, 1, 1, '', 0, '', 101002, 1, '2020-07-21 16:34:11', '2020-07-21 16:34:22', '2020-07-21 16:36:59', 1, 1),
(253, 27, 'cow ghee', 'This is my new Short Description', '<p>Good</p>', 300, 10, 1, 1, 'hot deal', 0, '', 101508, 1, '2020-07-25 16:06:51', '2020-07-25 16:09:14', NULL, 1, 1),
(254, 44, 'WHITE ROSE', 'BEAUTIFUL', '<p>123456</p>', 50, 10, 1, 1, '', 0, '', 1, 1, '2020-09-12 00:25:08', '2020-09-12 19:57:03', NULL, 1, 1),
(255, 6, 'LADOO', 'JUICY', '<p>123456</p>', 50, 10, 1, 1, '', 0, '', 1, NULL, '2020-09-12 19:59:00', NULL, NULL, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `food_menu`
--

CREATE TABLE `food_menu` (
  `id` int(11) NOT NULL,
  `vendor_id` int(11) NOT NULL,
  `sub_cat_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `desc` varchar(50) NOT NULL,
  `created_user_id` bigint(20) DEFAULT NULL,
  `updated_user_id` bigint(20) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '0=deleted,1=Active,2=Inactive'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `food_menu`
--

INSERT INTO `food_menu` (`id`, `vendor_id`, `sub_cat_id`, `name`, `desc`, `created_user_id`, `updated_user_id`, `created_at`, `updated_at`, `deleted_at`, `status`) VALUES
(1, 1, 599, 'Milk', 'Milk', 1, NULL, '2020-07-16 17:14:39', NULL, '2020-07-21 11:17:25', 1),
(2, 1, 599, 'Curd', 'Curd', 1, NULL, '2020-07-16 17:15:33', NULL, '2020-07-21 11:16:38', 1),
(3, 1, 600, 'Fruits & Vegetables', 'Fruits & Vegetables', 1, NULL, '2020-07-16 17:19:15', NULL, '2020-07-16 17:26:22', 1),
(4, 1, 603, 'PULSES', 'PULSES', 1, NULL, '2020-07-16 17:22:45', NULL, '2020-07-16 17:26:39', 1),
(5, 1, 599, 'CHOCOLATES', 'CHOCOLATES', 1, NULL, '2020-07-16 17:25:48', NULL, NULL, 1),
(6, 1, 31, 'Sweets & Deserts', 'SWEETS', 1, 1, '2020-07-16 17:29:57', '2020-07-21 12:40:17', NULL, 1),
(7, 1, 31, 'SAVOURIES', 'SAVOURIES', 1, NULL, '2020-07-16 17:33:19', NULL, NULL, 1),
(8, 1, 31, 'BISCUITS ( COOKIES )', 'BISCUITS ( COOKIES )', 1, NULL, '2020-07-16 17:34:30', NULL, NULL, 1),
(9, 1, 32, 'TIFFINS', 'TIFFINS', 1, NULL, '2020-07-16 17:45:18', NULL, NULL, 1),
(10, 1, 32, 'Meals', 'Meals', 1, NULL, '2020-07-16 17:50:04', NULL, NULL, 1),
(11, 1, 597, 'Chicken Biryani', 'Chicken Biryani', 1, NULL, '2020-07-16 18:00:00', NULL, NULL, 1),
(12, 1, 597, 'Mutton Biryani', 'Mutton Biryani', 1, NULL, '2020-07-16 18:02:03', NULL, NULL, 1),
(13, 1, 31, 'Sweets & Deserts', 'Good', 1, 1, '2020-07-21 10:32:00', '2020-07-21 10:32:48', '2020-07-21 12:39:54', 1),
(14, 1, 1050, 'Cream Cakes', 'Good', 1, NULL, '2020-07-21 10:35:16', NULL, NULL, 1),
(15, 1, 1050, 'Birthday cakes', 'Good', 1, NULL, '2020-07-21 10:35:46', NULL, NULL, 1),
(16, 1, 1050, 'cupcakes', 'Good', 1, 1, '2020-07-21 10:36:11', '2020-07-21 12:49:45', NULL, 1),
(17, 1, 1050, 'Festival Cake', 'Good', 1, NULL, '2020-07-21 10:36:32', NULL, NULL, 1),
(18, 1, 31, 'Ice-Cream', 'Good', 1, NULL, '2020-07-21 10:38:05', NULL, NULL, 1),
(19, 1, 31, 'Pastries', 'Good', 1, NULL, '2020-07-21 10:38:45', NULL, NULL, 1),
(20, 1, 599, 'Frozen foods', 'Good', 1, NULL, '2020-07-21 10:39:35', NULL, NULL, 1),
(21, 1, 599, 'Buttermilk..', 'Good', 1, NULL, '2020-07-21 10:41:35', NULL, NULL, 1),
(22, 1, 599, 'curd', 'Good', 1, NULL, '2020-07-21 10:41:53', NULL, NULL, 1),
(23, 1, 599, 'Milk', 'Good', 1, 1, '2020-07-21 10:42:15', '2020-07-21 11:14:40', NULL, 1),
(24, 1, 599, 'Butter', 'Good', 1, NULL, '2020-07-21 10:42:45', NULL, NULL, 1),
(25, 1, 599, 'cheese', 'Good', 1, NULL, '2020-07-21 10:43:09', NULL, NULL, 1),
(26, 1, 48, 'Hair Spa', 'Available', 1, NULL, '2020-07-21 10:43:18', NULL, NULL, 1),
(27, 1, 599, 'Ghee', 'Good', 1, NULL, '2020-07-21 10:43:24', NULL, NULL, 1),
(28, 1, 600, 'Apples and pears.', 'Good', 1, NULL, '2020-07-21 10:43:43', NULL, NULL, 1),
(29, 1, 600, 'Berries', 'Good', 1, NULL, '2020-07-21 10:44:14', NULL, NULL, 1),
(30, 1, 600, 'citrus', 'Good', 1, NULL, '2020-07-21 10:44:32', NULL, NULL, 1),
(31, 1, 48, 'Make-Up', 'Available', 1, NULL, '2020-07-21 10:45:15', NULL, NULL, 1),
(32, 1, 600, 'fruiting vegetables', 'Good', 1, NULL, '2020-07-21 10:45:25', NULL, NULL, 1),
(33, 1, 600, 'leafy vegetables', 'Good', 1, NULL, '2020-07-21 10:45:49', NULL, NULL, 1),
(34, 1, 48, 'Massage', 'Available', 1, NULL, '2020-07-21 10:46:06', NULL, NULL, 1),
(35, 1, 600, 'Melon', 'Good', 1, NULL, '2020-07-21 10:46:19', NULL, NULL, 1),
(36, 1, 600, 'root vegetables.', 'Good', 1, NULL, '2020-07-21 10:46:47', NULL, NULL, 1),
(37, 1, 48, 'Skin Care', 'Available', 1, NULL, '2020-07-21 10:46:57', NULL, NULL, 1),
(38, 1, 600, 'root vegetables.', 'Good', 1, NULL, '2020-07-21 10:47:07', NULL, NULL, 1),
(39, 1, 600, 'salad vegetables', 'Good', 1, NULL, '2020-07-21 10:47:28', NULL, NULL, 1),
(40, 1, 600, 'squash vegetables', 'Good', 1, NULL, '2020-07-21 10:47:46', NULL, NULL, 1),
(41, 1, 527, 'Cleanup\'s', 'Available', 1, NULL, '2020-07-21 10:48:30', NULL, NULL, 1),
(42, 1, 600, 'stone Fruit', 'Good', 1, NULL, '2020-07-21 10:48:31', NULL, NULL, 1),
(43, 1, 600, 'Fruits', 'Good', 1, NULL, '2020-07-21 10:48:50', NULL, NULL, 1),
(44, 1, 30, 'Veg-Biryani', 'Veg-Biryani', 1, 1, '2020-07-21 10:49:12', '2020-07-21 10:53:04', NULL, 1),
(45, 1, 527, 'Facial', 'Available', 1, NULL, '2020-07-21 10:49:56', NULL, NULL, 1),
(46, 1, 527, 'Hair Cut', 'Available', 1, NULL, '2020-07-21 10:50:23', NULL, NULL, 1),
(47, 1, 606, 'cosmetics', 'Good', 1, NULL, '2020-07-21 10:50:37', NULL, '2020-07-21 10:51:39', 1),
(48, 1, 30, 'chicken Biryani', 'chicken Biryani', 1, NULL, '2020-07-21 10:50:43', NULL, '2020-07-21 10:51:58', 1),
(49, 1, 48, 'Pedicure & Manicure ..', 'Available', 1, NULL, '2020-07-21 10:50:50', NULL, NULL, 1),
(50, 1, 601, 'Dal', 'Good', 1, 1, '2020-07-21 10:51:23', '2020-07-21 11:03:11', NULL, 1),
(51, 1, 30, 'Mutton Biryani', 'Mutton Biryani', 1, NULL, '2020-07-21 10:51:24', NULL, '2020-07-21 10:51:50', 1),
(52, 1, 527, 'Salon Services', 'Available', 1, NULL, '2020-07-21 10:52:08', NULL, NULL, 1),
(53, 1, 601, 'Pulses', 'Good', 1, 1, '2020-07-21 10:52:08', '2020-07-21 11:03:51', NULL, 1),
(54, 1, 606, 'body lotion', 'Good', 1, NULL, '2020-07-21 10:52:33', NULL, NULL, 1),
(55, 1, 606, 'body spray', 'Good', 1, NULL, '2020-07-21 10:52:50', NULL, NULL, 1),
(56, 1, 527, 'Threading', 'Available', 1, NULL, '2020-07-21 10:52:57', NULL, NULL, 1),
(57, 1, 606, 'Talcum-powders', 'Good', 1, NULL, '2020-07-21 10:53:10', NULL, NULL, 1),
(58, 1, 606, 'face cream', 'Good', 1, NULL, '2020-07-21 10:53:27', NULL, NULL, 1),
(59, 1, 30, 'Non-Veg Biryani', 'Non-Veg Biryani', 1, NULL, '2020-07-21 10:54:04', NULL, NULL, 1),
(60, 1, 601, 'Candles and Fragrances', 'Good', 1, 1, '2020-07-21 10:54:54', '2020-07-21 11:07:45', NULL, 1),
(61, 1, 601, 'Lamps & Lantern', 'Good', 1, 1, '2020-07-21 10:55:13', '2020-07-21 11:10:43', NULL, 1),
(62, 1, 601, 'Pooj Products', 'Good', 1, 1, '2020-07-21 10:56:04', '2020-07-21 11:05:43', NULL, 1),
(63, 1, 601, 'Rice', 'Good', 1, 1, '2020-07-21 10:56:58', '2020-07-21 11:08:38', NULL, 1),
(64, 1, 601, 'Flour', 'Good', 1, 1, '2020-07-21 10:57:14', '2020-07-21 11:09:25', NULL, 1),
(65, 1, 606, 'Body Soap', 'Good', 1, NULL, '2020-07-21 10:57:36', NULL, NULL, 1),
(66, 1, 606, 'dish-wash-soap', 'Good', 1, NULL, '2020-07-21 10:57:56', NULL, NULL, 1),
(67, 1, 606, 'Shampoo', 'Good', 1, NULL, '2020-07-21 10:58:19', NULL, NULL, 1),
(68, 1, 606, 'Hand Wash', 'Good', 1, NULL, '2020-07-21 10:58:51', NULL, NULL, 1),
(69, 1, 1052, 'Facial Products', 'Good', 1, NULL, '2020-07-21 11:07:45', NULL, NULL, 1),
(70, 1, 1052, 'conditioning', 'Good', 1, NULL, '2020-07-21 11:08:27', NULL, NULL, 1),
(71, 1, 1052, 'Pedicure & Manicure', 'Good', 1, NULL, '2020-07-21 11:09:13', NULL, NULL, 1),
(72, 1, 1052, 'Waxing', 'Good', 1, NULL, '2020-07-21 11:09:52', NULL, NULL, 1),
(73, 1, 606, 'Washing Soap', 'Good', 1, NULL, '2020-07-21 11:11:51', NULL, NULL, 1),
(74, 1, 605, 'Cool Drinks', 'Good', 1, NULL, '2020-07-21 11:21:30', NULL, NULL, 1),
(75, 1, 605, 'Juices', 'Good', 1, NULL, '2020-07-21 11:22:19', NULL, NULL, 1),
(76, 1, 605, 'Bottled Water', 'Good', 1, NULL, '2020-07-21 11:23:00', NULL, NULL, 1),
(77, 1, 612, 'Dried Fruits', 'Good', 1, NULL, '2020-07-21 11:35:41', NULL, NULL, 1),
(78, 1, 612, 'Nuts', 'Good', 1, NULL, '2020-07-21 11:36:02', NULL, '2020-07-21 11:37:43', 1),
(79, 1, 612, 'Nuts', 'Good', 1, NULL, '2020-07-21 11:36:06', NULL, NULL, 1),
(80, 1, 612, 'raisins', 'Good', 1, NULL, '2020-07-21 11:36:24', NULL, NULL, 1),
(81, 1, 33, 'Fast Food Chicken', 'Chicken', 1, 1, '2020-07-21 11:36:56', '2020-07-21 11:56:00', NULL, 1),
(82, 1, 612, 'Roasted Nuts', 'Good', 1, NULL, '2020-07-21 11:37:00', NULL, NULL, 1),
(83, 1, 612, 'Walnuts', 'Good', 1, NULL, '2020-07-21 11:37:25', NULL, NULL, 1),
(84, 1, 33, 'Fast Food Fries', 'Fries', 1, 1, '2020-07-21 11:38:38', '2020-07-21 11:56:54', NULL, 1),
(85, 1, 1051, 'Milk Bread', 'Good', 1, NULL, '2020-07-21 11:53:52', NULL, NULL, 1),
(86, 1, 1051, 'Brown Bread', 'Good', 1, NULL, '2020-07-21 11:55:48', NULL, NULL, 1),
(87, 1, 1051, 'Sand Witch Bread', 'Good', 1, NULL, '2020-07-21 11:56:31', NULL, NULL, 1),
(88, 1, 1051, 'Tuti Fruity Bread', 'Good', 1, NULL, '2020-07-21 11:57:00', NULL, NULL, 1),
(89, 1, 1051, 'Wheat Bread', 'Good', 1, NULL, '2020-07-21 11:57:43', NULL, NULL, 1),
(90, 1, 1051, 'Bun', 'Good', 1, NULL, '2020-07-21 11:58:58', NULL, NULL, 1),
(91, 1, 607, 'Meat', 'Good', 1, NULL, '2020-07-21 12:08:06', NULL, NULL, 1),
(92, 1, 1052, 'Facial Products', 'Available', 1, NULL, '2020-07-21 12:09:42', NULL, NULL, 1),
(93, 1, 607, 'Eggs', 'Good', 1, NULL, '2020-07-21 12:10:19', NULL, NULL, 1),
(94, 1, 34, 'Veg Biryani', 'Biryani', 1, NULL, '2020-07-21 12:10:35', NULL, NULL, 1),
(95, 1, 607, 'Sea Food', 'Good', 1, NULL, '2020-07-21 12:11:20', NULL, NULL, 1),
(96, 1, 34, 'Non-Veg Biryani', 'Non-Veg Biryani', 1, NULL, '2020-07-21 12:11:24', NULL, NULL, 1),
(97, 1, 34, 'Desserts', 'Desserts', 1, NULL, '2020-07-21 12:11:50', NULL, NULL, 1),
(98, 1, 1052, 'Hair Products', 'Good', 1, NULL, '2020-07-21 12:12:11', NULL, NULL, 1),
(99, 1, 34, 'Beverages', 'Beverages', 1, NULL, '2020-07-21 12:12:16', NULL, NULL, 1),
(100, 1, 1052, 'Pedicure & Manicure Products', 'Available', 1, NULL, '2020-07-21 12:15:01', NULL, NULL, 1),
(101, 1, 1052, 'Waxing Products', 'Available', 1, NULL, '2020-07-21 12:15:42', NULL, NULL, 1),
(102, 1, 603, 'Cooking Needs', 'Good', 1, NULL, '2020-07-21 12:22:47', NULL, NULL, 1),
(103, 1, 603, 'Baking Needs', 'Good', 1, NULL, '2020-07-21 12:23:09', NULL, NULL, 1),
(104, 1, 1052, 'Child Manicure', 'Available', 1, NULL, '2020-07-21 12:28:04', NULL, NULL, 1),
(105, 1, 1052, 'Child pedicure', 'Available', 1, NULL, '2020-07-21 12:28:55', NULL, NULL, 1),
(106, 1, 1052, 'express manicure products', 'Available', 1, NULL, '2020-07-21 12:29:18', NULL, NULL, 1),
(107, 1, 1052, 'Express Pedicure Products', 'Available', 1, NULL, '2020-07-21 12:29:43', NULL, NULL, 1),
(108, 1, 596, 'Veg Biryani', 'Veg-Biryani', 1, NULL, '2020-07-21 12:35:18', NULL, NULL, 1),
(109, 1, 596, 'Non-Veg Biryani', 'Non-Veg Biryani', 1, NULL, '2020-07-21 12:36:09', NULL, NULL, 1),
(110, 1, 596, 'Andhra Rotis', 'Andhra Rotis', 1, NULL, '2020-07-21 12:36:49', NULL, NULL, 1),
(111, 1, 596, 'Andhra Sea food', 'Andhra Sea food', 1, NULL, '2020-07-21 12:37:23', NULL, NULL, 1),
(112, 1, 596, 'Andhra Break fast', 'Andhra Break fast', 1, NULL, '2020-07-21 12:37:53', NULL, NULL, 1),
(113, 1, 1053, 'Air filter and fin cleaning.', 'Available', 1, NULL, '2020-07-21 12:52:45', NULL, NULL, 1),
(114, 1, 1053, 'AC condenser and evaporator coil cleaning.', 'Available', 1, NULL, '2020-07-21 12:54:28', NULL, NULL, 1),
(115, 1, 598, 'Veg Snacks', 'Veg Snacks', 1, 1, '2020-07-21 12:57:50', '2020-07-21 12:58:55', '2020-07-21 12:59:10', 1),
(116, 1, 598, 'Veg Snacks', 'Veg Snacks', 1, NULL, '2020-07-21 12:59:42', NULL, NULL, 1),
(117, 1, 598, 'Non-Veg Snacks', 'Non-Veg Snacks', 1, NULL, '2020-07-21 13:00:10', NULL, NULL, 1),
(121, 1, 1052, 'ROSE', 'BEAUTY', 1, NULL, '2020-09-12 00:21:45', NULL, NULL, 1),
(122, 1, 31, 'CAKE', 'CREAMY', 1, NULL, '2020-09-12 00:23:13', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `food_orders`
--

CREATE TABLE `food_orders` (
  `id` int(50) NOT NULL,
  `user_id` int(11) NOT NULL,
  `vendor_id` int(11) NOT NULL,
  `deal_id` int(11) NOT NULL,
  `otp` varchar(50) DEFAULT NULL,
  `address_id` int(11) NOT NULL,
  `promo_id` int(11) DEFAULT NULL,
  `promo_code` varchar(50) DEFAULT NULL,
  `promo_discount` float DEFAULT NULL,
  `discount` float NOT NULL,
  `delivery_fee` float NOT NULL,
  `tax` float NOT NULL,
  `used_walet` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0=No, 1=Yes',
  `used_walet_amount` decimal(14,2) DEFAULT NULL,
  `sub_total` float NOT NULL,
  `total` float NOT NULL,
  `coupon_id` int(11) NOT NULL,
  `order_track` varchar(50) DEFAULT NULL,
  `order_status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '0=Rejected,1=Order Received,2=Accepted,3=Preparing,4=Out for delivery,5=Order on the way,6=Order Completed,7=Canceled',
  `delivery` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1=delivery, 2=pickup, 3=booking',
  `payment_method_id` int(11) NOT NULL,
  `instructions` text NOT NULL,
  `rejected_reason` text NOT NULL,
  `created_user_id` bigint(20) DEFAULT NULL,
  `updated_user_id` bigint(20) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '0=deleted,1=Active,2=Inactive'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `food_order_deal`
--

CREATE TABLE `food_order_deal` (
  `id` int(50) NOT NULL,
  `order_id` int(11) NOT NULL,
  `deal_id` int(11) NOT NULL,
  `otp` int(11) NOT NULL,
  `ord_deal_status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1=Received, 2=Acceptted',
  `created_user_id` bigint(20) DEFAULT NULL,
  `updated_user_id` bigint(20) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '0=deleted,1=Active,2=Inactive'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `food_order_items`
--

CREATE TABLE `food_order_items` (
  `id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `price` float NOT NULL,
  `quantity` int(11) NOT NULL,
  `sec_item_id` int(11) DEFAULT NULL,
  `created_user_id` bigint(20) DEFAULT NULL,
  `updated_user_id` bigint(20) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '0=deleted,1=Active,2=Inactive'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `food_section`
--

CREATE TABLE `food_section` (
  `id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT 0,
  `item_field` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=Radio,2=Checkbox',
  `sec_price` tinyint(1) NOT NULL DEFAULT 3 COMMENT '1= Add, 2= Replace, 3= No Price',
  `created_user_id` bigint(20) DEFAULT NULL,
  `updated_user_id` bigint(20) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '0=deleted,1=Active,2=Inactive'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `food_section`
--

INSERT INTO `food_section` (`id`, `menu_id`, `item_id`, `name`, `required`, `item_field`, `sec_price`, `created_user_id`, `updated_user_id`, `created_at`, `updated_at`, `deleted_at`, `status`) VALUES
(1, 6, 13, 'KG\'s', 1, 1, 2, 1, NULL, '2020-08-03 07:04:44', NULL, NULL, 1),
(2, 6, 13, 'Extra Items', 0, 2, 1, 1, 1, '2020-08-03 07:30:51', '2020-09-28 19:22:48', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `food_sec_item`
--

CREATE TABLE `food_sec_item` (
  `id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `sec_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `desc` varchar(50) NOT NULL,
  `price` float NOT NULL,
  `created_user_id` bigint(20) DEFAULT NULL,
  `updated_user_id` bigint(20) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '0=deleted,1=Active,2=Inactive'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `food_sec_item`
--

INSERT INTO `food_sec_item` (`id`, `menu_id`, `item_id`, `sec_id`, `name`, `desc`, `price`, `created_user_id`, `updated_user_id`, `created_at`, `updated_at`, `deleted_at`, `status`) VALUES
(1, 6, 13, 1, '250 GM\'s', 'Get sweet with 250 GM\'s', 150, 1, NULL, '2020-08-03 07:05:46', NULL, NULL, 1),
(2, 6, 13, 1, '500 GM\'s', 'Get sweet with 500 GM\'s', 500, 1, NULL, '2020-08-03 07:07:27', NULL, NULL, 1),
(3, 6, 13, 1, '1 KG', 'Get sweet with 1 Kg with less price', 900, 1, NULL, '2020-08-03 07:08:21', NULL, NULL, 1),
(4, 6, 13, 2, '100 Gm\'s Cool Cake', 'The best disert cool cake', 50, 1, NULL, '2020-08-03 07:31:50', NULL, NULL, 1),
(5, 6, 13, 2, 'covabun 500 GM\'s', 'Sweet and tasty covabun', 250, 1, NULL, '2020-08-03 07:32:39', NULL, NULL, 1),
(6, 6, 13, 2, 'My fest with this product', 'jndsfnksjdfd', 600, 1, NULL, '2020-08-03 07:33:07', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `food_settings`
--

CREATE TABLE `food_settings` (
  `id` int(50) NOT NULL,
  `vendor_id` int(11) NOT NULL,
  `min_order_price` float NOT NULL,
  `delivery_free_range` int(11) NOT NULL,
  `preparation_time` int(11) NOT NULL,
  `min_delivery_fee` float NOT NULL,
  `ext_delivery_fee` float NOT NULL,
  `restaurant_status` tinyint(1) NOT NULL DEFAULT 2 COMMENT '1=Available, 2=Not-Available',
  `tax` int(11) NOT NULL,
  `label` varchar(50) NOT NULL,
  `created_user_id` bigint(20) DEFAULT NULL,
  `updated_user_id` bigint(20) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '0=deleted,1=Active,2=Inactive'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `food_sub_order_items`
--

CREATE TABLE `food_sub_order_items` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `sec_item_id` int(11) NOT NULL,
  `price` float NOT NULL,
  `quantity` int(11) NOT NULL,
  `created_user_id` bigint(20) DEFAULT NULL,
  `updated_user_id` bigint(20) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '0=deleted,1=Active,2=Inactive'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
-- Table structure for table `local_news`
--

CREATE TABLE `local_news` (
  `id` int(11) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `location_id` int(11) NOT NULL,
  `title` longtext NOT NULL,
  `category` int(11) NOT NULL,
  `video_link` varchar(200) NOT NULL,
  `news` longtext NOT NULL,
  `created_user_id` bigint(20) DEFAULT NULL,
  `updated_user_id` bigint(20) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1=posted,2=published'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `locations`
--

CREATE TABLE `locations` (
  `id` bigint(20) NOT NULL,
  `latitude` varchar(20) NOT NULL,
  `longitude` varchar(20) NOT NULL,
  `address` varchar(100) NOT NULL,
  `created_user_id` bigint(20) DEFAULT NULL,
  `updated_user_id` bigint(20) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '0 = deleted, 1 = Active, 2 = Inactive'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `locations`
--

INSERT INTO `locations` (`id`, `latitude`, `longitude`, `address`, `created_user_id`, `updated_user_id`, `created_at`, `updated_at`, `deleted_at`, `status`) VALUES
(1, '15.5376315', '77.550657', 'Devanakonda, Andhra Pradesh, India', 1, NULL, '2020-07-27 12:22:37', NULL, NULL, 1),
(2, '15.539518', '77.54904479999999', 'Devanakonda, Andhra Pradesh, India', 1, NULL, '2020-09-26 12:32:10', NULL, NULL, 1),
(3, '15.539518', '77.5490448', 'Devanakonda, Andhra Pradesh, India', NULL, NULL, '2020-09-26 12:32:48', NULL, NULL, 1),
(4, '13.7008756', '80.0209065', 'Sullurupeta, Andhra Pradesh, India', 1, NULL, '2020-09-30 12:49:27', NULL, NULL, 1),
(5, '15.8338958', '79.4844499', 'Donakonda, Andhra Pradesh, India', NULL, NULL, '2020-10-12 22:04:18', NULL, NULL, 1),
(6, '16.6930017', '78.9203378', 'Devarakonda, Telangana, India', NULL, NULL, '2020-11-13 16:57:09', NULL, NULL, 1),
(7, '17.385044', '78.486671', 'Hyderabad, Telangana, India', NULL, NULL, '2020-12-05 11:26:21', NULL, NULL, 1),
(8, '42.4635206', '21.4694011', 'dentawellgjilan, Gjilan, Kosovo', NULL, NULL, '2020-12-20 12:16:40', NULL, NULL, 1),
(9, '17.4375084', '78.4482441', 'Ameerpet, Hyderabad, Telangana, India', NULL, NULL, '2020-12-20 12:17:11', NULL, NULL, 1);

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
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `id` bigint(20) NOT NULL,
  `title` varchar(300) NOT NULL,
  `category` int(11) NOT NULL,
  `video_link` varchar(200) DEFAULT NULL,
  `news` longtext NOT NULL,
  `news_date` date NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `created_user_id` int(11) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_user_id` int(11) NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '0 = deleted, 1 = Active, 2 = Inactive'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `news_categories`
--

CREATE TABLE `news_categories` (
  `id` int(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `desc` varchar(50) NOT NULL,
  `created_user_id` bigint(20) DEFAULT NULL,
  `updated_user_id` bigint(20) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '0=deleted,1=Active,2=Inactive'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `order_rating`
--

CREATE TABLE `order_rating` (
  `id` int(50) NOT NULL,
  `order_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `rating` int(11) NOT NULL,
  `review` varchar(500) NOT NULL,
  `del_rating` int(11) NOT NULL,
  `del_review` varchar(500) NOT NULL,
  `created_user_id` bigint(20) DEFAULT NULL,
  `updated_user_id` bigint(20) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '0=deleted,1=Active,2=Inactive'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `order_support`
--

CREATE TABLE `order_support` (
  `id` int(11) NOT NULL,
  `order_id` bigint(20) NOT NULL,
  `from_id` int(11) NOT NULL,
  `to_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `read_status` tinyint(4) NOT NULL DEFAULT 2 COMMENT '1=Read,2Unread',
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `modified_at` datetime DEFAULT NULL,
  `row_status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0=Deleted,1=Active,2=Inactive'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
-- Table structure for table `promo_codes`
--

CREATE TABLE `promo_codes` (
  `id` int(11) NOT NULL,
  `promo_title` varchar(100) NOT NULL,
  `promo_code` varchar(20) NOT NULL,
  `promo_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=Nextclick, 2=All Vendors, 3=Few Vendors',
  `promo_label` varchar(100) NOT NULL,
  `school` text NOT NULL,
  `class` text NOT NULL,
  `valid_from` date NOT NULL,
  `valid_to` date NOT NULL,
  `discount_type` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1=Amount, 2=Percentage',
  `discount` int(11) DEFAULT NULL,
  `uses` int(11) NOT NULL,
  `desc` text NOT NULL,
  `created_user_id` int(11) DEFAULT NULL,
  `modified_user_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `modified_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '	0=deleted,1=Active,2=Inactive	'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `promo_codes`
--

INSERT INTO `promo_codes` (`id`, `promo_title`, `promo_code`, `promo_type`, `promo_label`, `school`, `class`, `valid_from`, `valid_to`, `discount_type`, `discount`, `uses`, `desc`, `created_user_id`, `modified_user_id`, `created_at`, `modified_at`, `deleted_at`, `status`) VALUES
(1, 'Flymengo', 'FLY50', 1, 'The best with the process', '', '', '2020-09-21', '2020-11-03', 2, 5, 3, '', 1, NULL, '2020-09-28 19:50:09', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `promo_vendors`
--

CREATE TABLE `promo_vendors` (
  `id` int(11) NOT NULL,
  `vendor_id` int(11) NOT NULL,
  `promo_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ratings`
--

CREATE TABLE `ratings` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `vendor_id` bigint(20) NOT NULL,
  `rating` decimal(14,2) NOT NULL,
  `review` text NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '0 = deleted, 1 = Active, 2 = Inactive'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` int(11) NOT NULL,
  `permission_parent_ids` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `desc` varchar(200) NOT NULL,
  `created_user_id` bigint(20) DEFAULT NULL,
  `updated_user_id` bigint(20) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '0 = deleted, 1 = Active, 2 = Inactive'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `permission_parent_ids`, `name`, `desc`, `created_user_id`, `updated_user_id`, `created_at`, `updated_at`, `deleted_at`, `status`) VALUES
(1, '1', 'Admin', '', 1, 1, '2019-12-10 15:03:11', '2019-12-12 14:30:22', NULL, 1),
(2, '33', 'Manage Account', '', 1, 1, '2019-12-12 14:17:26', '2020-01-24 13:55:58', NULL, 1),
(3, '20', 'News Management', '', 1, 1, '2019-12-12 14:18:49', '2020-06-29 11:32:26', '2020-07-07 15:32:08', 1),
(4, '47', 'Booking Service', '', 1, 1, '2020-05-13 21:24:06', '2020-05-13 21:25:31', NULL, 1),
(5, '45', 'Delivery Service', '', 1, 1, '2020-05-13 21:24:26', '2020-05-13 21:25:17', NULL, 1),
(6, '46', 'Courier Service', '', 1, 1, '2020-05-13 21:24:59', '2020-05-13 21:26:08', NULL, 1),
(7, '48', 'Self Pickup', '', 1, 1, '2020-05-13 21:25:56', '2020-05-13 21:26:18', NULL, 1),
(8, '49', 'Leads', '', 1, 1, '2020-06-29 11:29:18', '2020-06-29 11:29:29', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `services_permissions`
--

CREATE TABLE `services_permissions` (
  `id` bigint(20) NOT NULL,
  `service_id` int(50) NOT NULL,
  `perm_id` int(50) NOT NULL,
  `created_user_id` bigint(20) NOT NULL,
  `updated_user_id` bigint(20) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '0=deleted,1=Active,2=Inactive'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `services_permissions`
--

INSERT INTO `services_permissions` (`id`, `service_id`, `perm_id`, `created_user_id`, `updated_user_id`, `created_at`, `updated_at`, `deleted_at`, `status`) VALUES
(170, 1, 2, 0, 0, '2019-12-12 19:00:22', NULL, NULL, 1),
(171, 1, 3, 0, 0, '2019-12-12 19:00:23', NULL, NULL, 1),
(172, 1, 4, 0, 0, '2019-12-12 19:00:23', NULL, NULL, 1),
(173, 1, 5, 0, 0, '2019-12-12 19:00:23', NULL, NULL, 1),
(174, 1, 6, 0, 0, '2019-12-12 19:00:23', NULL, NULL, 1),
(175, 1, 7, 0, 0, '2019-12-12 19:00:23', NULL, NULL, 1),
(176, 1, 8, 0, 0, '2019-12-12 19:00:23', NULL, NULL, 1),
(177, 1, 9, 0, 0, '2019-12-12 19:00:23', NULL, NULL, 1),
(178, 1, 10, 0, 0, '2019-12-12 19:00:23', NULL, NULL, 1),
(179, 1, 11, 0, 0, '2019-12-12 19:00:23', NULL, NULL, 1),
(180, 1, 12, 0, 0, '2019-12-12 19:00:23', NULL, NULL, 1),
(181, 1, 13, 0, 0, '2019-12-12 19:00:23', NULL, NULL, 1),
(182, 1, 14, 0, 0, '2019-12-12 19:00:23', NULL, NULL, 1),
(183, 1, 15, 0, 0, '2019-12-12 19:00:23', NULL, NULL, 1),
(184, 1, 16, 0, 0, '2019-12-12 19:00:23', NULL, NULL, 1),
(185, 1, 17, 0, 0, '2019-12-12 19:00:23', NULL, NULL, 1),
(186, 1, 18, 0, 0, '2019-12-12 19:00:23', NULL, NULL, 1),
(187, 1, 19, 0, 0, '2019-12-12 19:00:23', NULL, NULL, 1),
(8428, 2, 34, 0, 0, '2020-01-24 13:55:58', NULL, NULL, 1),
(8429, 2, 35, 0, 0, '2020-01-24 13:55:58', NULL, NULL, 1),
(8430, 2, 36, 0, 0, '2020-01-24 13:55:58', NULL, NULL, 1),
(8431, 2, 37, 0, 0, '2020-01-24 13:55:58', NULL, NULL, 1),
(8432, 2, 38, 0, 0, '2020-01-24 13:55:58', NULL, NULL, 1),
(8433, 2, 39, 0, 0, '2020-01-24 13:55:58', NULL, NULL, 1),
(8434, 2, 40, 0, 0, '2020-01-24 13:55:58', NULL, NULL, 1),
(8435, 2, 33, 0, 0, '2020-01-24 13:55:58', NULL, NULL, 1),
(8436, 5, 45, 0, 0, '2020-05-13 15:55:17', NULL, NULL, 1),
(8437, 4, 47, 0, 0, '2020-05-13 15:55:31', NULL, NULL, 1),
(8438, 6, 46, 0, 0, '2020-05-13 15:56:08', NULL, NULL, 1),
(8439, 7, 48, 0, 0, '2020-05-13 15:56:18', NULL, NULL, 1),
(8440, 8, 49, 0, 0, '2020-06-29 05:59:29', NULL, NULL, 1),
(8441, 3, 21, 0, 0, '2020-06-29 06:02:26', NULL, NULL, 1),
(8442, 3, 20, 0, 0, '2020-06-29 06:02:26', NULL, NULL, 1);

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
(1, 'system_name', 'Next Click', 0, '2019-04-30 15:41:07', 1, '2019-11-05 08:15:44', NULL, 1),
(2, 'system_title', 'Your success begins here', 0, '2019-04-30 15:41:07', 1, '2019-11-05 08:15:44', NULL, 1),
(3, 'address', 'Hyderabad', 0, '2019-04-30 15:41:07', 1, '2019-11-05 08:15:44', NULL, 1),
(4, 'mobile', '9704100111', 0, '2019-04-30 15:41:07', 1, '2019-11-05 08:15:44', NULL, 1),
(5, 'system_email', 'info@gmail.com', 0, '2019-04-30 15:41:07', 1, '2019-10-17 10:36:40', NULL, 1),
(6, 'email_password', '123123', 0, '2019-04-30 15:41:07', 1, '2019-10-17 10:36:40', NULL, 1),
(7, 'sms_username', '123', 0, '2019-04-30 15:41:07', 1, '2019-10-17 10:22:46', NULL, 1),
(8, 'sms_sender', 'TRAI', 0, '2019-04-30 15:41:07', 1, '2019-10-17 10:22:46', NULL, 1),
(9, 'sms_hash', 'HASH', 0, '2019-04-30 15:41:07', 1, '2019-10-17 10:22:46', NULL, 1),
(10, 'privacy', '<h1 style=\"text-align: center;\"><span style=\"color:#008000\"><u><span style=\"font-size:22px\"><span style=\"font-family:lucida sans unicode,lucida grande,sans-serif\"><var><strong><em>MyPulse</em></strong></var></span></span></u></span></h1>\r\n', 0, '2019-04-30 15:41:07', NULL, '0000-00-00 00:00:00', NULL, 1),
(11, 'terms', '<p>hi this is for testing</p>\r\n', 0, '2019-04-30 15:41:07', NULL, '0000-00-00 00:00:00', NULL, 1),
(12, 'facebook', 'https://www.facebook.com/', 0, '2019-07-22 14:05:08', 1, '2019-11-05 08:15:44', NULL, 1),
(13, 'twiter', 'https://www.twiter.com/', 0, '2019-07-22 14:05:08', 1, '2019-11-05 08:15:44', NULL, 1),
(14, 'youtube', 'https://www.youtube.com/', 0, '2019-07-22 14:05:08', 1, '2019-11-05 08:15:44', NULL, 1),
(15, 'skype', 'http://skype.com/', 0, '2019-10-16 09:49:33', 1, '2019-11-05 08:15:44', NULL, 1),
(16, 'pinterest', 'http://pinterest.com/', 0, '2019-10-16 09:50:50', 1, '2019-11-05 08:15:44', NULL, 1),
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
-- Table structure for table `states`
--

CREATE TABLE `states` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `created_user_id` bigint(20) DEFAULT NULL,
  `updated_user_id` bigint(20) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '0 = deleted, 1 = Active, 2 = Inactive'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `states`
--

INSERT INTO `states` (`id`, `name`, `created_user_id`, `updated_user_id`, `created_at`, `updated_at`, `deleted_at`, `status`) VALUES
(1, 'Andhra Pradesh', 1, NULL, '2019-10-10 13:43:11', NULL, NULL, 1),
(2, 'Arunachal Pradesh', 1, NULL, '2019-10-10 13:43:42', NULL, NULL, 1),
(3, 'Assam', 1, NULL, '2019-10-10 13:43:54', NULL, NULL, 1),
(4, 'Bihar', 1, NULL, '2019-10-10 13:44:02', NULL, NULL, 1),
(5, 'Chhattisgarh', 1, NULL, '2019-10-10 13:44:11', NULL, NULL, 1),
(6, 'ST Goa', 1, NULL, '2019-10-10 13:45:03', NULL, NULL, 1),
(7, 'Gujarat', 1, NULL, '2019-10-10 13:45:25', NULL, NULL, 1),
(8, 'Haryana', 1, 1, '2019-10-10 13:45:33', '2019-10-11 12:42:01', NULL, 1),
(9, 'Himachal Pradesh', 1, NULL, '2019-10-10 13:45:39', NULL, NULL, 1),
(10, 'Jammu and Kashmir', 1, NULL, '2019-10-10 13:45:53', NULL, NULL, 1),
(11, 'Jharkhand', 1, NULL, '2019-10-10 13:46:01', NULL, NULL, 1),
(12, 'Karnataka', 1, NULL, '2019-10-10 13:46:08', NULL, NULL, 1),
(13, 'Kerala', 1, NULL, '2019-10-10 13:46:15', NULL, NULL, 1),
(14, 'Madhya Pradesh', 1, NULL, '2019-10-10 13:46:22', NULL, NULL, 1),
(15, 'Maharashtra', 1, NULL, '2019-10-10 13:46:30', NULL, NULL, 1),
(16, 'Manipur', 1, NULL, '2019-10-10 13:46:36', NULL, NULL, 1),
(17, 'Meghalaya', 1, NULL, '2019-10-10 13:46:42', NULL, NULL, 1),
(18, 'Mizoram', 1, NULL, '2019-10-10 13:46:49', NULL, NULL, 1),
(19, 'Nagaland', 1, NULL, '2019-10-10 13:46:57', NULL, NULL, 1),
(20, 'Odisha', 1, NULL, '2019-10-10 13:47:04', NULL, NULL, 1),
(21, 'Punjab', 1, NULL, '2019-10-10 13:47:11', NULL, NULL, 1),
(22, 'Rajasthan', 1, NULL, '2019-10-10 13:47:17', NULL, NULL, 1),
(23, 'Sikkim', 1, NULL, '2019-10-10 13:47:24', NULL, NULL, 1),
(24, 'Tamil Nadu', 1, NULL, '2019-10-10 13:47:32', NULL, NULL, 1),
(25, 'Telangana', 1, NULL, '2019-10-10 13:47:46', NULL, NULL, 1),
(26, 'Tripura', 1, NULL, '2019-10-10 13:47:55', NULL, NULL, 1),
(27, 'Uttar Pradesh', 1, NULL, '2019-10-10 13:48:05', NULL, NULL, 1),
(28, 'Uttarakhand', 1, NULL, '2019-10-10 13:48:13', NULL, NULL, 1),
(29, 'West Bengal', 1, NULL, '2019-10-10 13:48:22', NULL, NULL, 1),
(30, 'sikkim', 1, 1, '2019-10-23 10:51:56', '2019-10-24 05:15:39', NULL, 1),
(31, 'Andhra pradesh', 1, NULL, '2019-12-07 19:35:17', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `sub_categories`
--

CREATE TABLE `sub_categories` (
  `id` int(11) NOT NULL,
  `cat_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `desc` varchar(50) NOT NULL,
  `created_user_id` bigint(20) DEFAULT NULL,
  `updated_user_id` bigint(20) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '0=deleted,1=Active,2=Inactive'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sub_categories`
--

INSERT INTO `sub_categories` (`id`, `cat_id`, `name`, `desc`, `created_user_id`, `updated_user_id`, `created_at`, `updated_at`, `deleted_at`, `status`) VALUES
(1, 3, 'Ativan', 'All types of medicines', 1, 1, '2019-10-07 12:24:58', '2020-01-12 17:02:02', '2020-01-12 17:02:47', 1),
(2, 9, 'Business Travels', 'Search Travels', 1, 1, '2019-10-07 12:26:48', '2019-10-10 09:23:30', '2019-10-10 09:23:38', 1),
(3, 3, 'Primary Education', 'Search Schools & Colleges, Online Education', 1, NULL, '2019-10-07 12:28:09', NULL, '2019-10-10 09:23:43', 1),
(4, 4, 'Family Restaurants', 'Search Restaurants,Order Food, Home Delivery', 1, NULL, '2019-10-10 06:51:55', NULL, '2019-10-10 09:23:47', 1),
(5, 5, 'Electronics & Home Appliances', 'Search Mobile Stores, Automobiles', 1, NULL, '2019-10-10 06:53:55', NULL, '2019-10-10 09:24:08', 1),
(6, 6, 'Function Hall', 'Caterers,Decoraters', 1, NULL, '2019-10-10 06:56:05', NULL, '2019-10-10 09:24:03', 1),
(7, 7, 'Botiques', 'Search Beauty Salons,Spa,Bridal', 1, NULL, '2019-10-10 06:57:57', NULL, '2019-10-10 09:24:00', 1),
(8, 8, 'General Store', 'Search Grocery Stores', 1, NULL, '2019-10-10 07:01:52', NULL, '2019-10-10 09:23:56', 1),
(9, 9, 'Sarees', 'Kids Wear,Western,Jeans', 1, NULL, '2019-10-10 07:07:43', NULL, '2019-10-10 09:23:52', 1),
(10, 1, 'Medical Records', 'Search Hospitals,Book Appointments', 1, NULL, '2019-10-10 09:25:47', NULL, '2019-10-10 09:31:01', 1),
(11, 1, 'Health Profile', 'Search Hospitals,Book Appointments', 1, NULL, '2019-10-10 09:26:19', NULL, '2019-10-10 09:31:05', 1),
(12, 1, 'Ambulance 108', 'Search Hospitals,Book Appointments', 1, NULL, '2019-10-10 09:29:52', NULL, '2019-10-10 09:31:09', 1),
(13, 1, 'Pharmaceuticals', 'Search Hospitals,Book Appointments', 1, NULL, '2019-10-10 09:33:22', NULL, '2020-01-12 16:54:56', 1),
(14, 2, 'Transportation', 'Search Cars & Travels', 1, 1, '2019-10-10 09:34:14', '2020-05-17 14:44:07', NULL, 1),
(15, 3, 'School', 'Search Schools Online Education', 1, NULL, '2019-10-10 09:36:00', NULL, '2019-10-10 09:37:36', 1),
(16, 3, 'Colleges', 'Search Colleges, Online Education', 1, NULL, '2019-10-10 09:36:41', NULL, '2019-10-10 09:37:36', 1),
(17, 2, 'Car Booking', 'Search Cars & Travels', 1, 1, '2019-10-10 09:45:48', '2020-05-04 12:15:59', NULL, 1),
(18, 64, 'Bus Booking', 'Search Cars & Travels', 1, 1, '2019-10-10 09:46:08', '2019-11-11 05:36:50', NULL, 1),
(19, 2, 'Trucks Book', 'Trucks', 1, 1, '2019-10-10 09:47:26', '2020-05-04 12:17:41', NULL, 1),
(20, 64, 'Tour Vehicles', 'Tour Vehicles', 1, 1, '2019-10-10 09:47:56', '2019-11-11 05:35:50', NULL, 1),
(21, 65, 'Tour Packages', 'Tour Packages', 1, 1, '2019-10-10 09:48:43', '2019-11-11 05:35:01', NULL, 1),
(22, 64, 'International', 'International Service', 1, 1, '2019-10-10 09:49:18', '2019-11-11 05:34:37', NULL, 1),
(23, 55, 'School', 'Search Schools Online Education', 1, 1, '2019-10-10 09:52:15', '2019-11-11 05:08:29', NULL, 1),
(24, 55, 'College', 'Search  Colleges Online Education', 1, 1, '2019-10-10 09:53:20', '2019-11-11 05:38:23', NULL, 1),
(25, 55, 'Engineering Colleges', 'Engineering College', 1, 1, '2019-10-10 09:56:02', '2019-11-11 05:37:59', NULL, 1),
(26, 55, 'Degree Colleges', 'Degree College', 1, 1, '2019-10-10 09:57:03', '2019-12-13 21:58:12', NULL, 1),
(27, 3, 'Primary Schools', 'School Education', 1, NULL, '2019-10-10 09:57:36', NULL, '2019-10-25 12:05:14', 1),
(28, 55, 'Coaching Centres', 'Coaching Institutes', 1, 1, '2019-10-10 09:58:15', '2019-12-13 22:03:45', NULL, 1),
(29, 55, 'Play Schools', 'Play Schools for Children', 1, 1, '2019-10-10 09:59:57', '2019-12-13 22:04:27', NULL, 1),
(30, 5, 'Family Restaurants', 'Search Restaurants,Order Food, Home Delivery', 1, 1, '2019-10-10 10:01:06', '2020-05-04 11:06:06', NULL, 1),
(31, 1, 'Bakery', 'Cakes,Breads', 1, 1, '2019-10-10 10:02:13', '2020-05-04 10:31:07', NULL, 1),
(32, 5, 'Tiffens & Meals', 'South & North Indian', 1, 1, '2019-10-10 10:03:16', '2020-05-04 11:08:50', NULL, 1),
(33, 5, 'Chinese', 'Chinese Items', 1, 1, '2019-10-10 10:05:43', '2020-05-04 11:12:03', NULL, 1),
(34, 5, 'Dhaba', 'Dhaba Food Items', 1, 1, '2019-10-10 10:06:36', '2020-05-04 11:14:08', NULL, 1),
(35, 18, 'Mobiles', 'Search Mobile Stores', 1, 1, '2019-10-10 10:07:35', '2020-01-24 17:01:09', NULL, 1),
(36, 9, 'Air Cooler', 'AC Daikin,Voltas', 1, 1, '2019-10-10 10:09:34', '2020-05-04 15:05:24', NULL, 1),
(37, 18, 'LED TV', 'Sony,LG', 1, 1, '2019-10-10 10:10:57', '2020-01-24 17:00:26', NULL, 1),
(38, 18, 'Laptops', 'Sony,Dell,HP......', 1, 1, '2019-10-10 10:12:34', '2020-01-24 16:45:46', NULL, 1),
(39, 18, 'Washing Machines', 'IFB, Samsung....', 1, 1, '2019-10-10 10:14:05', '2020-01-24 16:59:30', NULL, 1),
(40, 6, 'Function Hall', 'Caterings and Decorators', 1, 1, '2019-10-10 10:14:55', '2019-12-13 21:31:10', '2020-01-12 15:52:22', 1),
(41, 6, 'Banquet Halls', 'Banquet halls', 1, 1, '2019-10-10 10:16:04', '2019-12-13 21:31:43', '2020-01-12 15:59:07', 1),
(42, 8, 'Caterings', 'Food Items,Beverages', 1, 1, '2019-10-10 10:17:43', '2020-01-12 15:52:49', '2020-01-12 16:16:55', 1),
(43, 8, 'Decoration', 'Decorations,Event Organisers,Sound & Lightings', 1, 1, '2019-10-10 10:18:07', '2020-01-12 15:55:31', '2020-01-12 16:15:58', 1),
(44, 6, 'Jewellery', 'Jewellery Items Gold', 1, NULL, '2019-10-10 10:19:21', NULL, '2020-01-12 15:51:41', 1),
(45, 8, 'Photographers', 'Photos and Videos', 1, 1, '2019-10-10 10:21:02', '2020-01-12 15:57:22', '2020-01-12 16:15:38', 1),
(46, 6, 'Photographers', 'Photos and Videos', 1, NULL, '2019-10-10 10:21:16', NULL, '2019-10-10 10:21:46', 1),
(47, 7, 'Parlour', 'Face Packs', 1, NULL, '2019-10-10 10:22:32', NULL, '2020-01-12 16:10:05', 1),
(48, 4, 'Spa & Salon', 'Hair Cut,Trimmering,Spa', 1, 1, '2019-10-10 10:23:26', '2020-05-04 13:01:18', NULL, 1),
(49, 7, 'Boutiques', 'Boutiques Dresses Long', 1, NULL, '2019-10-10 10:24:42', NULL, '2020-01-12 16:10:28', 1),
(50, 7, 'Maggam Works', 'Model Necks', 1, NULL, '2019-10-10 10:34:51', NULL, '2020-01-12 16:10:44', 1),
(51, 7, 'Tailors', 'Shirts and Pants', 1, NULL, '2019-10-10 10:36:03', NULL, '2020-01-12 16:10:59', 1),
(52, 7, 'Beauty Home Services', 'Beauty Care Products', 1, NULL, '2019-10-10 10:36:36', NULL, '2020-01-12 16:11:15', 1),
(53, 8, 'General Store', 'All Items', 1, 1, '2019-10-10 10:39:39', '2019-12-13 22:06:46', '2020-01-12 16:13:05', 1),
(54, 8, 'Milk & Diary', 'Milk Products', 1, 1, '2019-10-10 10:40:50', '2019-12-13 22:05:42', '2020-01-12 16:12:07', 1),
(55, 8, 'Grocery', 'Grocery Products', 1, 1, '2019-10-10 10:41:35', '2019-12-13 21:36:34', '2020-01-12 16:14:00', 1),
(56, 8, 'Super Market', 'Grocery Products', 1, 1, '2019-10-10 10:42:54', '2019-12-13 21:37:15', '2020-01-12 16:12:30', 1),
(57, 8, 'Book Stores', 'Book Stores', 1, 1, '2019-10-10 10:43:25', '2019-12-13 21:37:50', '2020-01-12 15:47:19', 1),
(58, 18, 'Sarees', 'Sarees,Dresses', 1, 1, '2019-10-10 10:44:36', '2020-01-24 16:58:34', NULL, 1),
(59, 9, 'Western Wear', 'Knots Western Wear', 1, 1, '2019-10-10 10:45:30', '2019-12-13 21:28:37', '2020-01-12 17:18:39', 1),
(60, 9, 'Kids Wear', 'Boys and Girls', 1, 1, '2019-10-10 10:46:48', '2019-12-13 21:29:22', '2020-01-12 17:18:49', 1),
(61, 9, 'Jeans', 'Lower,Ankle', 1, 1, '2019-10-10 10:47:47', '2019-12-13 21:29:56', '2020-01-12 17:18:59', 1),
(62, 9, 'Foot Wear', 'Girls boys mens women foot prints', 1, 1, '2019-10-10 10:49:19', '2019-12-13 21:30:22', '2020-01-12 17:19:10', 1),
(63, 10, 'Find Crop', 'Crops', 1, NULL, '2019-10-10 10:52:57', NULL, '2020-01-13 08:05:21', 1),
(64, 10, 'List Crop', 'List Crops', 1, NULL, '2019-10-10 10:53:20', NULL, '2019-10-19 07:33:53', 1),
(65, 10, 'Agri Products', 'Products', 1, NULL, '2019-10-10 10:53:44', NULL, '2020-01-13 08:05:44', 1),
(66, 10, 'Market Price', 'Price List', 1, NULL, '2019-10-10 10:54:05', NULL, '2020-01-13 08:06:26', 1),
(67, 10, 'Farmer Point', 'Farmer Point', 1, 1, '2019-10-10 10:54:38', '2019-10-29 05:20:05', '2020-01-13 08:06:50', 1),
(68, 4, 'Schools', 'Crops', 1, 1, '2019-10-23 10:29:58', '2019-11-11 04:49:58', '2020-01-12 15:22:54', 1),
(69, 22, 'Car On Hire', 'All, Honda, Maruti, BMW, Mercedes Benz', 1, NULL, '2019-11-07 10:20:07', NULL, NULL, 1),
(70, 22, 'Costumes On Hire', 'Fancy Dress ( Historical and Period Costume Hire)', 1, NULL, '2019-11-07 10:26:30', NULL, NULL, 1),
(71, 23, 'Health', 'Baby Cleanliness, Medical care', 1, NULL, '2019-11-07 10:51:34', NULL, NULL, 1),
(72, 22, 'Bus On Hire', 'All- Ashok Leyland, Bharat benz,Limouzine , Tata', 1, 1, '2019-11-07 11:18:34', '2019-11-07 11:51:53', NULL, 1),
(73, 23, 'Baby Sitters', 'Baby Sitters', 1, NULL, '2019-11-07 11:21:14', NULL, NULL, 1),
(74, 22, 'Tempos On Hire', 'All- Tempos,  Mini Trucks', 1, 1, '2019-11-07 11:24:00', '2019-11-07 11:46:13', NULL, 1),
(75, 24, 'Electronics & Electrical Supplies', 'Coolers, Power Cord,', 1, 1, '2019-11-07 11:25:13', '2019-11-11 04:51:11', NULL, 1),
(76, 22, 'Mini Bus on Hire', 'All -Eicher ,  Mahindra Touister , Swaraj Mazad ,M', 1, 1, '2019-11-07 11:26:52', '2019-11-07 11:45:31', NULL, 1),
(77, 22, 'Ac on Hire', 'All - Blue Star , Carrier , Onida', 1, NULL, '2019-11-07 11:29:49', NULL, NULL, 1),
(78, 24, 'Industrial Machinery & Equipments', 'Tools, adjusting feet machine', 1, NULL, '2019-11-07 11:32:46', NULL, NULL, 1),
(79, 23, 'Baby Sleep', 'All-Baby Pillows,baby Blankets, Quilts Ect.,', 1, NULL, '2019-11-07 11:33:21', NULL, NULL, 1),
(80, 22, 'Rooms on Hire', 'All - Meeting Rooms, Counsellor rooms, Function Ro', 1, NULL, '2019-11-07 11:33:21', NULL, NULL, 1),
(81, 22, 'Air Coolers on Hire', 'All - Daikin , Voltas , Compact', 1, NULL, '2019-11-07 11:36:03', NULL, NULL, 1),
(82, 24, 'Construction Machinery & Supplies', 'Bobcat, Bulldozer, Crane', 1, 1, '2019-11-07 11:37:09', '2019-11-11 04:52:05', NULL, 1),
(83, 22, 'Blazers on Hire', 'All - Beetle  , Bregeo  ManQ ,Mens Jackets ,', 1, NULL, '2019-11-07 11:40:27', NULL, NULL, 1),
(84, 24, 'Automobiles Spare Parts & Services', 'Tail Gate, Head Lamp, Grill', 1, NULL, '2019-11-07 11:43:03', NULL, NULL, 1),
(85, 23, 'Baby Bath', 'Baby Bath Tub,Shower Cap,Soap Case', 1, NULL, '2019-11-07 11:43:38', NULL, NULL, 1),
(86, 22, 'Bridal wear on Hire', 'All - Lehenga , Gown', 1, 1, '2019-11-07 11:43:56', '2019-11-07 12:33:35', '2019-11-07 12:33:46', 1),
(87, 24, 'Logistics & Transportation', 'Car, Bus, Bicycle, Helicopter', 1, 1, '2019-11-07 11:49:33', '2019-11-11 04:53:02', NULL, 1),
(88, 22, 'Bungalows on Hire', 'All -  Villas , Luxurious Bungalows', 1, NULL, '2019-11-07 11:49:50', NULL, NULL, 1),
(89, 24, 'Industrial Supplies', 'crimping tool, screwdriver ,', 1, NULL, '2019-11-07 11:55:15', NULL, NULL, 1),
(90, 23, 'Books', 'All Baby  Fiction,Learning,Magic,Writing Books', 1, NULL, '2019-11-07 11:55:32', NULL, NULL, 1),
(91, 22, 'Cameras on Hire', 'All - Canon , Nikon , Dslr', 1, NULL, '2019-11-07 11:58:04', NULL, NULL, 1),
(92, 24, 'Business Services & Consultants', 'Insurance , Banking', 1, NULL, '2019-11-07 12:02:01', NULL, NULL, 1),
(93, 22, 'Chairs on Hire', 'All - Plastic Chairs , wooden Chairs ,Office Chair', 1, NULL, '2019-11-07 12:02:29', NULL, NULL, 1),
(94, 24, 'Food & Beverages', 'Vegetables, Mixed Fruits', 1, NULL, '2019-11-07 12:05:16', NULL, NULL, 1),
(95, 22, 'Computers on Hire', 'All Types o', 1, 1, '2019-11-07 12:06:59', '2019-11-08 06:48:52', '2019-11-08 06:49:06', 1),
(96, 22, 'Cooks on Hire', 'Master Chefs ( All types of Varieties )', 1, NULL, '2019-11-07 12:11:32', NULL, NULL, 1),
(97, 23, 'Breast Feeding Accessories', 'Breast Pad,Pump,Milk Pump,Electric Pump', 1, NULL, '2019-11-07 12:11:55', NULL, NULL, 1),
(98, 24, 'Event Management', 'Event Planing (All types of events)', 1, NULL, '2019-11-07 12:13:35', NULL, NULL, 1),
(99, 22, 'Cottages on Hire', 'All Cottages ( Holiday Cottages ,Luxury Cottages)', 1, 1, '2019-11-07 12:15:17', '2019-11-08 05:58:27', '2019-11-08 05:58:39', 1),
(100, 23, 'Baby Cloths', 'All Kinds Of Baby Cloths Available', 1, 1, '2019-11-07 12:19:27', '2019-11-11 05:16:32', NULL, 1),
(101, 22, 'Cranes on Hire', 'All Types of Cranes ( JCB , Hydra  )', 1, NULL, '2019-11-07 12:19:42', NULL, NULL, 1),
(102, 24, 'Apparels Clothing & Footwear', 'All, T-Shirts, Shoes,', 1, NULL, '2019-11-07 12:19:50', NULL, NULL, 1),
(103, 24, 'Advertising & PR Marketing', 'Channelizing, Marketing', 1, NULL, '2019-11-07 12:24:57', NULL, NULL, 1),
(104, 22, 'DJ Equipment\'s on Hire', 'All -  (PA System , Disco Equipment )', 1, NULL, '2019-11-07 12:26:26', NULL, NULL, 1),
(105, 23, 'Baby Creams', 'Baby Lotions, Diaper Rash & Facial Baby Creams', 1, 1, '2019-11-07 12:29:04', '2019-11-11 04:57:18', NULL, 1),
(106, 22, 'Dead Body Freezer Box On Hire', 'Dead Body Freezer Box', 1, NULL, '2019-11-08 05:36:16', NULL, NULL, 1),
(107, 22, 'Bridal Wear On Hire', 'All - Lehenga,Gown, Jewewllary', 1, NULL, '2019-11-08 05:56:43', NULL, NULL, 1),
(108, 24, 'Agriculture Produce & Equipments', 'Cereals, Livestock, Roots, Farm Tools', 1, NULL, '2019-11-08 05:59:29', NULL, NULL, 1),
(109, 22, 'Cottages On Hire', 'All - Cottages (Luxury ,Wooden ,Holiday cottages )', 1, NULL, '2019-11-08 06:02:06', NULL, NULL, 1),
(110, 24, 'Ayurvedic Drugs & Products', 'All, Dalchini, Manjistha', 1, NULL, '2019-11-08 06:07:41', NULL, NULL, 1),
(111, 24, 'Beauty & Health Care', 'All, Natural, Organic products', 1, NULL, '2019-11-08 06:12:58', NULL, NULL, 1),
(112, 23, 'Health', 'All Baby Health Products', 1, 1, '2019-11-08 06:15:11', '2019-11-11 05:26:53', NULL, 1),
(113, 22, 'Farm House On Hire', 'All Farm Houses (Shallal, DewDrop,Happy)', 1, 1, '2019-11-08 06:16:11', '2019-11-11 05:02:28', NULL, 1),
(114, 24, 'Books & Stationaries', 'All Types Of Books', 1, NULL, '2019-11-08 06:16:20', NULL, NULL, 1),
(115, 23, 'Baby Food', 'Baby food is any soft, easily consumed food other ', 1, NULL, '2019-11-08 06:18:50', NULL, NULL, 1),
(116, 23, 'Baby Sitters', 'Couch Potato, Professional,  Mary Poppins,.....', 1, 1, '2019-11-08 06:21:13', '2019-11-11 05:34:14', NULL, 1),
(117, 24, 'Chemical Products & Equipments', 'Laboratory Equipments, Scientific Instruments', 1, NULL, '2019-11-08 06:21:57', NULL, NULL, 1),
(118, 22, 'Furnitures On Hire', 'All Types of Furniture\'s ( Living Room, Bedroom,..', 1, 1, '2019-11-08 06:22:45', '2019-11-11 05:18:40', NULL, 1),
(119, 23, 'Baby Sleep', 'All Services Available', 1, 1, '2019-11-08 06:23:14', '2019-11-11 05:01:03', NULL, 1),
(120, 23, 'Baby Bath', 'Baby Bath Pillow,Baby Bath Tub,....', 1, 1, '2019-11-08 06:26:14', '2019-11-11 05:24:26', NULL, 1),
(121, 23, 'Books', 'Picture,Picture Story, Pop-up, Sparkle,...', 1, 1, '2019-11-08 06:29:16', '2019-11-11 05:36:38', NULL, 1),
(122, 24, 'Corporate IT Components & Services', 'Corporate Innovation Strategy, Corporate Culture', 1, NULL, '2019-11-08 06:29:39', NULL, NULL, 1),
(123, 23, 'Breast Feeding Accessories', 'Tableware, Pacifiers & Teether,.....', 1, 1, '2019-11-08 06:31:51', '2019-11-11 05:42:04', NULL, 1),
(124, 22, 'Generators On Hire', 'All Types Of Generators ( Koel Green , Jakson , Ki', 1, NULL, '2019-11-08 06:34:27', NULL, NULL, 1),
(125, 23, 'Cloths', 'All Types Of Cloths', 1, 1, '2019-11-08 06:34:41', '2019-11-11 05:37:41', NULL, 1),
(126, 24, 'Corporate Travel & Outing', 'Social Travel, Normal Travel', 1, NULL, '2019-11-08 06:35:00', NULL, NULL, 1),
(127, 24, 'Engineering Sevices', 'All, Mechanical, Product Engineering Services', 1, NULL, '2019-11-08 06:38:11', NULL, NULL, 1),
(128, 23, 'Creams', 'All Products Available', 1, 1, '2019-11-08 06:40:22', '2019-11-11 05:20:30', NULL, 1),
(129, 22, 'Hydraulic Cranes On Hire', 'Hydraulic Cranes ( Tadano , XCMG , Terex , Hiab )', 1, NULL, '2019-11-08 06:41:15', NULL, NULL, 1),
(130, 24, 'Fashion Accessories', 'Different Types Of Fashion Accessories', 1, NULL, '2019-11-08 06:41:20', NULL, NULL, 1),
(131, 23, 'Diapers', 'Cloth Diapers, Fitted, Pocket Daipers,...', 1, 1, '2019-11-08 06:44:14', '2019-11-11 05:49:38', NULL, 1),
(132, 22, 'Laptops On Hire', 'All Types Of Laptops ( Samsung , Dell , Apple )', 1, NULL, '2019-11-08 06:44:43', NULL, NULL, 1),
(133, 24, 'Film & Movie Production', 'All Types Of Film Productions', 1, NULL, '2019-11-08 06:46:13', NULL, NULL, 1),
(134, 22, 'Computers On Hire', 'All Types Of Computers', 1, NULL, '2019-11-08 06:49:45', NULL, NULL, 1),
(135, 23, 'Food Feeding Accessories', 'Whatever feeding choice you make for your baby, be', 1, NULL, '2019-11-08 06:53:51', NULL, NULL, 1),
(136, 22, 'Mini Trucks On Hire', 'Mini Trucks - Tata ace , Mahindra ,Ashok Leyland..', 1, NULL, '2019-11-08 06:56:20', NULL, NULL, 1),
(137, 24, 'Furniture & Hardware Products', 'Cupboards, Cabinet Hardware', 1, NULL, '2019-11-08 06:58:21', NULL, NULL, 1),
(138, 23, 'Foot wear', 'All Types Of Baby Shoes, Slippers', 1, 1, '2019-11-08 06:58:56', '2019-11-11 05:39:26', NULL, 1),
(139, 22, 'Motor Cycles On HIre', 'Motor Cycles -  Honda , Yamaha , Kawasaki , Suzuki', 1, 1, '2019-11-08 07:00:50', '2019-11-11 05:43:21', NULL, 1),
(140, 24, 'Gardening Tools & Services', 'Landscaping, Spade Shovel Harrow', 1, NULL, '2019-11-08 07:02:51', NULL, NULL, 1),
(141, 23, 'Grooming', 'Your baby starts developing from the moment', 1, 1, '2019-11-08 07:03:29', '2019-11-11 05:33:29', NULL, 1),
(142, 22, 'Offices On Hire', 'Offices - Space for  Training ,Work ,Meetings....', 1, NULL, '2019-11-08 07:05:46', NULL, NULL, 1),
(143, 23, 'Maternity wear', 'You\'ll make plenty of decisions during pregnancy, ', 1, NULL, '2019-11-08 07:06:49', NULL, NULL, 1),
(144, 22, 'Passenger Vans On Hire', 'All -  Maruti , Toyota , Tata , Honda...', 1, NULL, '2019-11-08 07:11:41', NULL, NULL, 1),
(145, 24, 'Gems & Jewellery', 'Gems & Jewellery-Ruby Stones', 1, NULL, '2019-11-08 07:13:15', NULL, NULL, 1),
(146, 23, 'Safety', 'Baby Sleeping Safety All infants should be put dow', 1, NULL, '2019-11-08 07:14:19', NULL, NULL, 1),
(147, 24, 'Gifts Handicrafts & Decoratives', 'Hand Made Gifts, Flower Decoratives', 1, NULL, '2019-11-08 07:18:29', NULL, NULL, 1),
(148, 24, 'Goods & Services On Hire', 'All Types Of Goods & Services', 1, NULL, '2019-11-08 07:22:48', NULL, NULL, 1),
(149, 22, 'Projectors On Hire', 'Projectors Types -  Epson , Benq , Sony , Dell', 1, NULL, '2019-11-08 07:26:50', NULL, NULL, 1),
(150, 24, 'Heavy Transport Components & Parts', 'Vehicles, Helicopter, Garbage Trucks', 1, NULL, '2019-11-08 07:30:25', NULL, NULL, 1),
(151, 23, 'Toys For Kids', 'All types of Baby Toys', 1, NULL, '2019-11-08 07:32:29', NULL, NULL, 1),
(152, 24, 'Home Supplies', 'Luggage Rack, Mini Bar Fridge', 1, NULL, '2019-11-08 07:32:59', NULL, NULL, 1),
(153, 22, 'Refrigerators On Hire', 'Refrigerators - Samsung , LG, Whirlpool', 1, NULL, '2019-11-08 07:34:40', NULL, NULL, 1),
(154, 23, 'Travel Accessories', 'Baby Travelling Accessories', 1, NULL, '2019-11-08 07:35:00', NULL, NULL, 1),
(155, 24, 'House Keeping & Facility Management', 'Paper Towels, Stiff Brush', 1, NULL, '2019-11-08 07:36:51', NULL, NULL, 1),
(156, 23, 'Travel Accessories', 'Baby Travelling Accessories', 1, NULL, '2019-11-08 08:04:28', NULL, NULL, 1),
(157, 24, 'Human Resource Service', 'HR Services', 1, NULL, '2019-11-08 08:06:17', NULL, NULL, 1),
(158, 23, 'Utensils', 'Baby utensils items', 1, NULL, '2019-11-08 08:08:52', NULL, NULL, 1),
(159, 22, 'Sherwanis On Hire', 'Sherwanis - Groom Wear , western wear....', 1, NULL, '2019-11-08 08:09:13', NULL, NULL, 1),
(160, 24, 'Interior Designers & Architecture', 'Furniture', 1, NULL, '2019-11-08 08:10:00', NULL, NULL, 1),
(161, 23, 'Wipes', 'Image result for baby wipes descriptionnordicexpat', 1, NULL, '2019-11-08 08:10:45', NULL, NULL, 1),
(162, 24, 'Kitchenware & Appliances', 'Dishware Appliance,Coockie Items,...', 1, 1, '2019-11-08 08:12:35', '2019-11-11 05:53:02', NULL, 1),
(163, 22, 'Sound System On Hire', 'All - Music Systems ( PA , Home Theater )', 1, NULL, '2019-11-08 08:14:06', NULL, NULL, 1),
(164, 24, 'Laboratory & Testing Equipment', 'Material Laboratory Testing Equipment', 1, NULL, '2019-11-08 08:14:36', NULL, NULL, 1),
(165, 24, 'Leather Goods & Accessories', 'Bags, Shoes', 1, NULL, '2019-11-08 08:16:12', NULL, NULL, 1),
(166, 22, 'Suits On Hire', 'Suits -  Wedding suits , Formal suits , Modern Sli', 1, NULL, '2019-11-08 08:17:02', NULL, NULL, 1),
(167, 24, 'Luggage & Bags', 'Suitcases, Trolley Bags', 1, NULL, '2019-11-08 08:19:51', NULL, NULL, 1),
(168, 24, 'Metals & Metal Products', 'Copper, Steel', 1, NULL, '2019-11-08 08:22:57', NULL, NULL, 1),
(169, 24, 'Office Electronics Stationery & service', 'Files, Pens', 1, NULL, '2019-11-08 08:26:14', NULL, NULL, 1),
(170, 24, 'Packaging & La-belling', 'All Types Of Packaging & La-belling', 1, NULL, '2019-11-08 08:27:57', NULL, NULL, 1),
(171, 24, 'Paper & Paper Products', 'Paper Plates, Paper Cups', 1, NULL, '2019-11-08 08:29:19', NULL, NULL, 1),
(172, 24, 'Pharmaceutical & Medical Supplies', 'Professional  Medical Supplies', 1, 1, '2019-11-08 08:31:24', '2019-11-11 05:56:38', NULL, 1),
(173, 24, 'Printing & Publishing Services', 'All Types Of Printings', 1, NULL, '2019-11-08 08:33:15', NULL, NULL, 1),
(174, 24, 'Security Equipment & Services', 'Security Infrastructure', 1, NULL, '2019-11-08 08:34:35', NULL, NULL, 1),
(175, 24, 'Sports & Fitness', 'All Types Of Sports & Fitness Iteams', 1, NULL, '2019-11-08 08:36:32', NULL, NULL, 1),
(176, 24, 'Stone Artifacts & Flooring', 'Wall Stones', 1, NULL, '2019-11-08 08:38:12', NULL, NULL, 1),
(177, 24, 'Telecom Products & Services', 'Mobiles', 1, NULL, '2019-11-08 08:40:25', NULL, NULL, 1),
(178, 24, 'Textile Goods & Services', 'Mats, Cloths', 1, NULL, '2019-11-08 08:42:31', NULL, NULL, 1),
(179, 24, 'Toys, Games & Baby Care', 'All Types Of Baby Toys', 1, NULL, '2019-11-08 08:44:02', NULL, NULL, 1),
(180, 24, 'Vocational and Corporate Training', 'All Trainings', 1, NULL, '2019-11-08 08:45:20', NULL, NULL, 1),
(181, 26, 'School', 'Boarding Schools, Vernacular schools', 1, NULL, '2019-11-08 08:52:13', NULL, NULL, 1),
(182, 27, 'International Courier', 'Fedex, Gati, DTDC, SefExpress', 1, 1, '2019-11-08 09:09:16', '2019-11-08 09:49:56', NULL, 1),
(183, 27, 'Local Courier', 'All Courier', 1, NULL, '2019-11-08 09:11:00', NULL, NULL, 1),
(184, 27, 'National Courier', 'National level Courier', 1, NULL, '2019-11-08 09:13:59', NULL, '2019-11-08 09:47:51', 1),
(185, 28, 'New Cars', 'Cars - Kia ,Renault ,Lamborghini', 1, NULL, '2019-11-08 09:14:40', NULL, NULL, 1),
(186, 27, 'Bulk Courier', 'Bulk Stock', 1, NULL, '2019-11-08 09:16:30', NULL, NULL, 1),
(187, 28, 'Used Cars', 'Cars - Ford , Hyundai ,Tata ....', 1, NULL, '2019-11-08 09:16:33', NULL, NULL, 1),
(188, 27, 'Blue Dart', 'Shipping, Tracking', 1, NULL, '2019-11-08 09:20:26', NULL, '2019-11-08 09:47:34', 1),
(189, 28, 'Sell Cars', 'Cars - Skoda ,Volkswagen...', 1, 1, '2019-11-08 09:21:25', '2019-11-08 09:21:38', NULL, 1),
(190, 28, 'Test Drive', 'Test Drive For a Ride', 1, NULL, '2019-11-08 09:24:05', NULL, NULL, 1),
(191, 27, 'DHL Courier', 'Forwarding By Air', 1, NULL, '2019-11-08 09:25:08', NULL, '2019-11-08 09:47:25', 1),
(192, 28, 'Car Loans', 'Own Your Dream Car With  Car Loan', 1, NULL, '2019-11-08 09:26:34', NULL, NULL, 1),
(193, 27, 'DTDC courier', 'Tracking', 1, NULL, '2019-11-08 09:26:49', NULL, '2019-11-08 09:47:13', 1),
(194, 27, 'Fedex Courier', 'Shipping Service', 1, NULL, '2019-11-08 09:28:19', NULL, '2019-11-08 09:46:36', 1),
(195, 28, 'Car Insurance', 'Which Covers Loss or Damage To Your car', 1, NULL, '2019-11-08 09:30:03', NULL, NULL, 1),
(196, 27, 'First Flight Courier', 'Tracking', 1, NULL, '2019-11-08 09:30:32', NULL, '2019-11-08 09:46:56', 1),
(197, 27, 'Gati Courier', 'Distribution - Road, Air, Rail & End to End Logist', 1, NULL, '2019-11-08 09:33:21', NULL, '2019-11-08 09:46:23', 1),
(198, 28, 'Car Accessories', 'Car Accessories - Spongers , Car Covers , Mats , S', 1, NULL, '2019-11-08 09:34:10', NULL, NULL, 1),
(199, 27, 'Professional Courier', 'Domestic Courier Services', 1, NULL, '2019-11-08 09:35:26', NULL, '2019-11-08 09:46:16', 1),
(200, 28, 'Two Wheeler', 'Two Wheeler - Bikes', 1, NULL, '2019-11-08 09:37:14', NULL, '2019-11-08 09:38:07', 1),
(201, 27, 'SefExpress Courier', 'Track Shipment', 1, NULL, '2019-11-08 09:37:41', NULL, '2019-11-08 09:46:07', 1),
(202, 27, 'SpeedPost Courier', 'Speed Post Courier', 1, NULL, '2019-11-08 09:40:29', NULL, '2019-11-08 09:45:50', 1),
(203, 28, 'Two Wheeler Accessories', 'Two Wheeler Accessories - Seat Covers , Indicator ', 1, NULL, '2019-11-08 09:43:46', NULL, NULL, 1),
(204, 2, 'Bike Book', 'Bike Rent', 1, 1, '2019-11-08 09:46:31', '2020-05-04 12:28:18', NULL, 1),
(205, 28, 'Motor Training Institutes', 'Learns how to Drive a Car', 1, NULL, '2019-11-08 09:50:48', NULL, NULL, 1),
(206, 29, 'Grocery', 'Vegetables, Friuts', 1, NULL, '2019-11-08 10:00:16', NULL, NULL, 1),
(207, 29, 'Chemists', 'Pharmacy', 1, NULL, '2019-11-08 10:02:14', NULL, NULL, 1),
(208, 29, 'Bakery', 'Bread, Cookies, Cakes, Pastries, and Pies.', 1, 1, '2019-11-08 10:05:24', '2019-11-11 06:00:16', NULL, 1),
(209, 29, 'Daily Products', 'Grocery', 1, NULL, '2019-11-08 10:08:55', NULL, NULL, 1),
(210, 29, 'Cakes', 'All Kids Of  Cakes', 1, 1, '2019-11-08 10:13:19', '2019-11-11 06:02:05', NULL, 1),
(211, 29, 'Ice Cream', 'Strawberry, Venila', 1, NULL, '2019-11-08 10:16:27', NULL, NULL, 1),
(212, 31, 'All Banquet Halls', '5 star Banquet Halls , AC Banquet Halls  Non-AC Ba', 1, NULL, '2019-11-08 10:21:51', NULL, NULL, 1),
(213, 32, 'Music Classes', 'Local Music Classes, Western Music classes', 1, NULL, '2019-11-08 10:34:22', NULL, NULL, 1),
(214, 34, 'Dietitians', 'Physical fitness is generally achieved through pro', 1, NULL, '2019-11-08 10:40:15', NULL, NULL, 1),
(215, 35, '24 Hours Chemists', 'Pharmacy', 1, NULL, '2019-11-08 10:40:47', NULL, NULL, 1),
(216, 34, 'Fitness Classes', 'Fitness classes benefits', 1, NULL, '2019-11-08 10:43:42', NULL, NULL, 1),
(217, 35, 'Hospitals', 'Blood Banks, Cardiologist, Ambulance Service', 1, NULL, '2019-11-08 10:43:49', NULL, NULL, 1),
(218, 35, 'Duplicate Key Stores', 'All Types Duplicates Keys', 1, NULL, '2019-11-08 10:47:32', NULL, NULL, 1),
(219, 35, 'Fire Bridge', 'Fire Emergency', 1, NULL, '2019-11-08 10:51:41', NULL, NULL, 1),
(220, 35, 'Police', 'police Service', 1, NULL, '2019-11-08 10:54:15', NULL, NULL, 1),
(221, 34, 'Health', 'The word \"health\" refers to a state of complete em', 1, NULL, '2019-11-08 10:54:15', NULL, NULL, 1),
(222, 34, 'Equipments', 'Equipment\'s', 1, NULL, '2019-11-08 10:56:15', NULL, NULL, 1),
(223, 35, 'Snake Catchers', 'All Normal & Dangerous Snakes ,Immediate Service', 1, 1, '2019-11-08 10:57:08', '2019-11-11 06:14:07', NULL, 1),
(224, 34, 'Health Food& Supplements', 'Health Food &Supplements products', 1, NULL, '2019-11-08 10:59:01', NULL, NULL, 1),
(225, 35, 'Towing Services', 'Universal Towing Service', 1, NULL, '2019-11-08 10:59:41', NULL, NULL, 1),
(226, 38, 'Corporate Parties', 'Popular Corporate Places', 1, NULL, '2019-11-08 11:06:50', NULL, NULL, 1),
(227, 37, 'Book Car Online', 'Booking A Car Online', 1, NULL, '2019-11-08 11:07:32', NULL, NULL, 1),
(228, 34, 'Pilates Studies', 'If practiced with consistency, Pilates improves fl', 1, NULL, '2019-11-08 11:08:26', NULL, NULL, 1),
(229, 38, 'Private Parties', 'Private Parties Halls', 1, NULL, '2019-11-08 11:08:56', NULL, NULL, 1),
(230, 37, 'Car Rentals', 'Car for Rental', 1, NULL, '2019-11-08 11:09:16', NULL, NULL, 1),
(231, 34, 'Florists', 'Best Flower Bouquet', 1, NULL, '2019-11-08 11:13:34', NULL, NULL, 1),
(232, 38, 'Seminar Organizers', 'All Types Of Halls', 1, NULL, '2019-11-08 11:14:02', NULL, NULL, 1),
(233, 34, 'Florists Shops', 'Florists Flower', 1, NULL, '2019-11-08 11:15:44', NULL, NULL, 1),
(234, 38, 'Stage Show Organizers', 'Event Show', 1, NULL, '2019-11-08 11:16:14', NULL, NULL, 1),
(235, 39, 'Office Caterers', 'All- Continental ,Andhra , Bengali', 1, NULL, '2019-11-08 11:17:15', NULL, NULL, 1),
(236, 38, 'Trade Fair Organizers', 'Trade Fair Database', 1, NULL, '2019-11-08 11:18:23', NULL, NULL, 1),
(237, 34, 'Florists Home Delivery', 'Florists  Home Services', 1, 1, '2019-11-08 11:18:25', '2019-11-11 07:07:57', NULL, 1),
(238, 39, 'Wedding Caterers', 'All - South Indian , Mughlai , Kerala', 1, NULL, '2019-11-08 11:20:08', NULL, NULL, 1),
(239, 34, '24 hours Florists', '24 hours Florists services', 1, NULL, '2019-11-08 11:21:14', NULL, NULL, 1),
(240, 34, 'Florists For Wedding Decoration', 'Wedding Decoration with Flowers', 1, NULL, '2019-11-08 11:22:48', NULL, NULL, 1),
(241, 38, 'Wedding Organizer', 'Beautiful Event', 1, NULL, '2019-11-08 11:22:55', NULL, NULL, 1),
(242, 43, 'Chocolate Bouquet Florists', 'Flowers Bouquet', 1, 1, '2019-11-08 11:29:43', '2019-11-11 05:42:58', NULL, 1),
(243, 43, 'Customer Florists', 'Customer Florists Services', 1, 1, '2019-11-08 11:30:44', '2019-11-11 05:42:00', NULL, 1),
(244, 41, 'Civil Contractor', 'All Locations', 1, NULL, '2019-11-08 11:31:18', NULL, NULL, 1),
(245, 43, 'Dry Bouquet Florists', 'Dry flowers', 1, 1, '2019-11-08 11:32:26', '2019-11-11 05:40:40', NULL, 1),
(246, 41, 'Electrical Contractors', 'All Locations', 1, NULL, '2019-11-08 11:33:25', NULL, NULL, 1),
(247, 31, 'Florists For All India', 'Florists  For all India services', 1, 1, '2019-11-08 11:33:57', '2019-11-11 04:48:09', NULL, 1),
(248, 42, 'Ayurvedic Doctors', 'All Locations', 1, NULL, '2019-11-08 11:34:09', NULL, NULL, 1),
(249, 43, 'Florists For Car Decoration', 'Car decoration', 1, 1, '2019-11-08 11:35:14', '2019-11-11 05:01:32', NULL, 1),
(250, 41, 'Flooring Contractors', 'All Locations', 1, NULL, '2019-11-08 11:35:33', NULL, NULL, 1),
(251, 43, 'Florists For Corporate', 'Florists for corporation', 1, 1, '2019-11-08 11:37:07', '2019-11-11 04:58:16', NULL, 1),
(252, 41, 'Furniture Contractors', 'All Locations', 1, NULL, '2019-11-08 11:38:27', NULL, NULL, 1),
(253, 42, 'Cardiologist', 'All Locations', 1, NULL, '2019-11-08 11:38:28', NULL, NULL, 1),
(254, 31, 'Florists For Event Decoration', 'Event Decoration Service', 1, 1, '2019-11-08 11:40:27', '2019-11-11 04:53:03', NULL, 1),
(255, 42, 'Chest Specialists', 'All Locations', 1, NULL, '2019-11-08 11:40:41', NULL, NULL, 1),
(256, 41, 'Painting Contractors', 'All Locations', 1, NULL, '2019-11-08 11:41:22', NULL, NULL, 1),
(257, 41, 'Plumbing Contractors', 'All Locations', 1, NULL, '2019-11-08 11:44:03', NULL, NULL, 1),
(258, 42, 'Cosmetic Surgeons', 'All Locations', 1, NULL, '2019-11-08 11:44:55', NULL, NULL, 1),
(259, 41, 'Borewell Contractors', 'All Locations', 1, NULL, '2019-11-08 11:46:45', NULL, NULL, 1),
(260, 42, 'Dermatologists', 'All Locations', 1, NULL, '2019-11-08 11:47:10', NULL, NULL, 1),
(261, 43, 'Florists For International', 'International flower Services', 1, NULL, '2019-11-08 11:47:24', NULL, NULL, 1),
(262, 43, 'Florists For Office Decoration', 'Office Decoration Services', 1, NULL, '2019-11-08 11:48:50', NULL, NULL, 1),
(263, 43, 'Florists For Wedding Decoration', 'Wedding Decoration Services', 1, NULL, '2019-11-08 11:50:25', NULL, NULL, 1),
(264, 42, 'Dietitians', 'All Locations', 1, NULL, '2019-11-08 11:51:35', NULL, NULL, 1),
(265, 43, 'Internet Wed site For Flower Delivery', 'Internet web site for Flower Delivery Services', 1, NULL, '2019-11-08 11:52:57', NULL, NULL, 1),
(266, 41, 'Building Contractors', 'All Locations', 1, NULL, '2019-11-08 11:53:32', NULL, '2019-11-09 05:17:26', 1),
(267, 42, 'Diabetologists', 'All Locations', 1, NULL, '2019-11-08 11:54:02', NULL, NULL, 1),
(268, 43, 'Midnight Florists', 'Midnight Flowers Services', 1, NULL, '2019-11-08 11:54:16', NULL, NULL, 1),
(269, 41, 'Carpentry Contractors', 'All Locations', 1, NULL, '2019-11-08 11:54:59', NULL, NULL, 1),
(270, 42, 'ENT Specialist', 'All Locations', 1, 1, '2019-11-08 11:55:08', '2019-11-11 07:07:50', NULL, 1),
(271, 43, 'Online Flower Delivery Services', 'Online Delivery Services', 1, NULL, '2019-11-08 11:55:27', NULL, NULL, 1),
(272, 41, 'Carpet Contractors', 'All Locations', 1, NULL, '2019-11-08 11:56:53', NULL, NULL, 1),
(273, 42, 'Eye Specialists', 'All Locations', 1, NULL, '2019-11-08 11:58:04', NULL, NULL, 1),
(274, 42, 'Gastroenteritist', 'All Locations', 1, NULL, '2019-11-08 12:01:57', NULL, NULL, 1),
(275, 41, 'Drainage Contractor', 'All Locations', 1, NULL, '2019-11-08 12:04:20', NULL, NULL, 1),
(276, 44, 'Cooks', 'Cooks Service', 1, NULL, '2019-11-08 12:05:20', NULL, NULL, 1),
(277, 42, 'General Physicians', 'All Locations', 1, NULL, '2019-11-08 12:05:38', NULL, NULL, 1),
(278, 61, 'Maids', 'Maids Services', 1, 1, '2019-11-08 12:07:05', '2019-12-13 21:54:11', NULL, 1),
(279, 41, 'Drilling Contractors', 'All Locations', 1, NULL, '2019-11-08 12:07:33', NULL, NULL, 1),
(280, 42, 'Gynecologist & Obstetricians', 'All Locations', 1, NULL, '2019-11-08 12:07:35', NULL, NULL, 1),
(281, 44, 'Drivers', 'Drivers Services', 1, NULL, '2019-11-08 12:07:52', NULL, NULL, 1),
(282, 42, 'Homeopathic Doctors', 'All Locations', 1, NULL, '2019-11-08 12:09:28', NULL, NULL, 1),
(283, 44, 'Gardener', 'Gardener Services', 1, NULL, '2019-11-08 12:10:26', NULL, NULL, 1),
(284, 41, 'Elevator Contractors', 'All Locations', 1, NULL, '2019-11-08 12:10:58', NULL, NULL, 1),
(285, 42, 'Neurologists & Neurosurgeons', 'All Locations', 1, NULL, '2019-11-08 12:11:23', NULL, NULL, 1),
(286, 61, 'Laundry Services', 'Laundry services', 1, 1, '2019-11-08 12:13:10', '2019-12-13 21:53:28', NULL, 1),
(287, 42, 'Pediatricians', 'All Locations', 1, NULL, '2019-11-08 12:15:06', NULL, NULL, 1),
(288, 43, 'Cleaning Services', 'Cleaning services', 1, NULL, '2019-11-08 12:15:35', NULL, NULL, 1),
(289, 43, 'Pest Control', 'Pest Controlling  services', 1, NULL, '2019-11-08 12:16:49', NULL, NULL, 1),
(290, 42, 'Physiotherapists', 'All Locations', 1, NULL, '2019-11-08 12:17:19', NULL, NULL, 1),
(291, 41, 'Fabrication Contractors', 'All Locations', 1, 1, '2019-11-08 12:17:48', '2019-11-09 06:22:40', NULL, 1),
(292, 45, 'Industrial Parts', 'Manufacturing Industrial Products', 1, NULL, '2019-11-09 04:50:45', NULL, NULL, 1),
(293, 45, 'Industrial Tools', 'Industrial Tools Products', 1, NULL, '2019-11-09 04:52:02', NULL, NULL, 1),
(294, 42, 'Piles Doctors', 'All Locations', 1, NULL, '2019-11-09 04:53:29', NULL, NULL, 1),
(295, 42, 'Psychiatrists', 'All Locations', 1, NULL, '2019-11-09 04:54:59', NULL, NULL, 1),
(296, 42, 'Sexologists', 'All Locations', 1, NULL, '2019-11-09 04:56:48', NULL, NULL, 1),
(297, 45, 'Industrial Specific Machines', 'Industrial Specific machines products', 1, NULL, '2019-11-09 04:57:05', NULL, NULL, 1),
(298, 45, 'Welding Equipments & Machines', 'Welding Equipment\'s Products', 1, NULL, '2019-11-09 04:59:41', NULL, NULL, 1),
(299, 42, 'Speech Therapists', 'All Locations', 1, NULL, '2019-11-09 05:01:07', NULL, NULL, 1),
(300, 45, 'Bending & Metal Work Machines', 'Bending & Metal work Products', 1, NULL, '2019-11-09 05:01:54', NULL, NULL, 1),
(301, 45, 'Casting And Moulding Equipments', 'Casting And Moulding equipment products', 1, NULL, '2019-11-09 05:04:28', NULL, NULL, 1),
(302, 45, 'Crusher, Shredder & Presses', 'Crushers, Shredder& Presses Products', 1, NULL, '2019-11-09 05:06:12', NULL, NULL, 1),
(303, 45, 'Drilling & Boring Equipments', 'Drilling& Boring Products', 1, NULL, '2019-11-09 05:08:46', NULL, NULL, 1),
(304, 45, 'Industrial Hard Wares', 'Industrial Hard wares Products', 1, NULL, '2019-11-09 05:10:33', NULL, NULL, 1),
(305, 6, 'Thyroid Doctor', 'Consultation With Thyroid Doctors', 1, 1, '2019-11-09 05:10:48', '2020-05-04 14:47:33', NULL, 1),
(306, 42, 'Trichologist', 'All Locations', 1, NULL, '2019-11-09 05:12:48', NULL, NULL, 1),
(307, 45, 'Industrial Parts', 'Industrial Parts Products', 1, NULL, '2019-11-09 05:12:54', NULL, NULL, 1),
(308, 42, 'Urologists', 'All Locations', 1, NULL, '2019-11-09 05:13:59', NULL, NULL, 1),
(309, 42, 'Veterinary Doctors', 'All Locations', 1, NULL, '2019-11-09 05:15:13', NULL, NULL, 1),
(310, 45, 'Instrumentation & Control Equipments', 'Instrumentation & Control products', 1, NULL, '2019-11-09 05:16:03', NULL, NULL, 1),
(311, 42, '24 Hours Dentists', 'All Locations', 1, NULL, '2019-11-09 05:17:10', NULL, NULL, 1),
(312, 45, 'Milling & Grinding Tools', 'Milling And Grinding tools Products', 1, NULL, '2019-11-09 05:18:03', NULL, NULL, 1),
(313, 41, 'Building Contractors', 'All Locations', 1, NULL, '2019-11-09 05:18:04', NULL, NULL, 1),
(314, 42, 'Acupressure Doctors', 'All Locations', 1, NULL, '2019-11-09 05:19:07', NULL, NULL, 1),
(315, 45, 'Testing & Measuring Equipments', 'Testing & Measuring Equipments Products', 1, NULL, '2019-11-09 05:20:09', NULL, NULL, 1),
(316, 42, 'Alcohol De-Addiction Doctors', 'All Locations', 1, NULL, '2019-11-09 05:21:22', NULL, NULL, 1),
(317, 42, 'Andrologist', 'All Locations', 1, NULL, '2019-11-09 05:23:43', NULL, NULL, 1),
(318, 41, 'False Ceiling Contractors', 'All Locations', 1, NULL, '2019-11-09 05:24:45', NULL, NULL, 1),
(319, 42, 'Appendix Doctors', 'All Locations', 1, NULL, '2019-11-09 05:25:04', NULL, NULL, 1),
(320, 42, 'Audiologists', 'All Locations', 1, NULL, '2019-11-09 05:26:02', NULL, NULL, 1),
(321, 42, 'Bariatric Surgeons', 'All Locations', 1, NULL, '2019-11-09 05:27:47', NULL, NULL, 1),
(322, 41, 'FireFighting Contractors', 'All Locations', 1, NULL, '2019-11-09 05:28:08', NULL, NULL, 1),
(323, 48, 'Architects', 'Architects, Interiors Design, Commercial', 1, NULL, '2019-11-09 05:30:01', NULL, NULL, 1),
(324, 48, 'Residence', 'Residence Designing', 1, NULL, '2019-11-09 05:31:51', NULL, NULL, 1),
(325, 42, 'Breast Specialists', 'All Locations', 1, NULL, '2019-11-09 05:31:52', NULL, NULL, 1),
(326, 48, 'Interior Commercial', 'Inter Commercial Services', 1, NULL, '2019-11-09 05:33:13', NULL, NULL, 1),
(327, 42, 'Cardiac Surgeons', 'All Locations', 1, NULL, '2019-11-09 05:34:40', NULL, NULL, 1),
(328, 42, 'Chiropractors', 'All Locations', 1, NULL, '2019-11-09 05:36:30', NULL, NULL, 1),
(329, 48, 'Interior Decorators', 'Interior Decorators Designes', 1, NULL, '2019-11-09 05:37:15', NULL, NULL, 1),
(330, 42, 'Clinical Nutritionists', 'All Locations', 1, NULL, '2019-11-09 05:37:20', NULL, NULL, 1),
(331, 41, 'Garden Contractors', 'All Locations', 1, NULL, '2019-11-09 05:38:19', NULL, NULL, 1),
(332, 42, 'Clinical Psychologists', 'All Locations', 1, NULL, '2019-11-09 05:38:30', NULL, NULL, 1),
(333, 48, 'Interior Furnishing Contractors', 'Interior Furnishing designs', 1, NULL, '2019-11-09 05:39:02', NULL, NULL, 1),
(334, 42, 'Doctors For Mental Illness', 'All Locations', 1, NULL, '2019-11-09 05:40:32', NULL, NULL, 1),
(335, 48, 'Interior Designer Institutes', 'Interior Designer Institutes Services', 1, NULL, '2019-11-09 05:41:08', NULL, NULL, 1),
(336, 6, 'Allergy', 'All Locations', 1, 1, '2019-11-09 05:41:58', '2020-05-04 14:48:51', NULL, 1),
(337, 42, 'Doctors for Asthma Treatment', 'All Locations', 1, NULL, '2019-11-09 05:44:01', NULL, NULL, 1),
(338, 42, 'Doctors for Colonoscopy', 'All Locations', 1, NULL, '2019-11-09 05:45:53', NULL, NULL, 1),
(339, 42, 'Doctors for Gallstone Removal', 'All Locations', 1, NULL, '2019-11-09 05:46:48', NULL, NULL, 1),
(340, 42, 'Doctors for HIV Aids Treatment', 'All Locations', 1, NULL, '2019-11-09 05:48:56', NULL, NULL, 1),
(341, 42, 'Doctors for Hernia', 'All Locations', 1, NULL, '2019-11-09 05:49:50', NULL, NULL, 1),
(342, 42, 'Doctors for Jaundice', 'All Locations', 1, NULL, '2019-11-09 05:51:15', NULL, NULL, 1),
(343, 48, 'Internet Service Providers', 'Internet Service', 1, NULL, '2019-11-09 05:51:36', NULL, NULL, 1),
(344, 42, 'Doctors for Kidney Stone Laser Surgery', 'All Locations', 1, NULL, '2019-11-09 05:52:20', NULL, NULL, 1),
(345, 48, 'Wed Designers', 'Wed Designer', 1, NULL, '2019-11-09 05:53:01', NULL, NULL, 1),
(346, 42, 'Doctors for Laser Eye Surgery', 'All Locations', 1, NULL, '2019-11-09 05:53:12', NULL, NULL, 1),
(347, 48, 'Cyber Cafes', 'Cyber Cafes Services', 1, NULL, '2019-11-09 05:54:49', NULL, NULL, 1),
(348, 41, 'Interior Decorators', 'All Locations', 1, NULL, '2019-11-09 05:55:11', NULL, NULL, 1),
(349, 41, 'Labour Contractors', 'All Locations', 1, NULL, '2019-11-09 05:57:24', NULL, NULL, 1),
(350, 42, 'Doctors for Neck Surgery', 'All Locations', 1, NULL, '2019-11-09 05:57:29', NULL, NULL, 1),
(351, 48, 'WiFi Internet Services Providers', 'Internet Services Providers', 1, NULL, '2019-11-09 05:57:56', NULL, NULL, 1),
(352, 42, 'Doctors for Weight Loss', 'All Locations', 1, NULL, '2019-11-09 06:01:04', NULL, NULL, 1),
(353, 48, 'Explore By Service Provider', 'Explore by Service Providers', 1, NULL, '2019-11-09 06:01:27', NULL, NULL, 1),
(354, 41, 'PipeLine Contractors', 'All Locations', 1, NULL, '2019-11-09 06:01:31', NULL, NULL, 1),
(355, 42, 'Fistula Surgeons', 'All Locations', 1, NULL, '2019-11-09 06:02:52', NULL, NULL, 1),
(356, 41, 'Road Construction Contractors', 'All Locations', 1, NULL, '2019-11-09 06:03:52', NULL, NULL, 1),
(357, 42, 'Gynaecologic Oncologists', 'All Locations', 1, NULL, '2019-11-09 06:04:33', NULL, NULL, 1),
(358, 42, 'Height Specialists', 'All Locations', 1, NULL, '2019-11-09 06:07:29', NULL, NULL, 1),
(359, 41, 'Roofing Contractors', 'All Locations', 1, NULL, '2019-11-09 06:07:36', NULL, NULL, 1),
(360, 6, 'Hepatitis Doctors', 'All Locations', 1, 1, '2019-11-09 06:08:33', '2020-05-04 14:49:58', NULL, 1),
(361, 42, 'Homeopathic Doctors', 'All Locations', 1, NULL, '2019-11-09 06:09:29', NULL, NULL, 1),
(362, 41, 'Swimming Contractors', 'All Locations', 1, NULL, '2019-11-09 06:11:34', NULL, NULL, 1),
(363, 42, 'Infertility Doctors', 'All Locations', 1, NULL, '2019-11-09 06:12:19', NULL, NULL, 1),
(364, 41, 'Tiling Contractors', 'All Locations', 1, NULL, '2019-11-09 06:13:32', NULL, NULL, 1),
(365, 42, 'Knee Replacement Surgeons', 'All Locations', 1, NULL, '2019-11-09 06:13:35', NULL, NULL, 1),
(366, 41, 'Wall Paper Contractors', 'All Locations', 1, NULL, '2019-11-09 06:15:16', NULL, NULL, 1),
(367, 42, 'Laparoscopic Surgeons', 'All Locations', 1, NULL, '2019-11-09 06:15:21', NULL, NULL, 1),
(368, 42, 'Migraine Therapists', 'All Locations', 1, NULL, '2019-11-09 06:16:32', NULL, NULL, 1),
(369, 54, 'All Jewellery', 'All Jewellery Products', 1, NULL, '2019-11-09 06:17:27', NULL, NULL, 1),
(370, 46, 'Rent Service', 'House,  Commercial, Residential Rentals', 1, NULL, '2019-11-09 06:17:32', NULL, NULL, 1),
(371, 42, 'Oncologist Surgeons', 'All Locations', 1, NULL, '2019-11-09 06:18:34', NULL, NULL, 1),
(372, 54, 'Bridal Jewellery', 'Bridal Jewellery Items', 1, NULL, '2019-11-09 06:19:09', NULL, NULL, 1),
(373, 41, 'WaterProofing Contractors', 'All Locations', 1, NULL, '2019-11-09 06:19:20', NULL, NULL, 1),
(374, 42, 'Pediatric Ophthalmologists', 'All Locations', 1, NULL, '2019-11-09 06:19:49', NULL, NULL, 1),
(375, 54, 'Bangles', 'Bangles', 1, NULL, '2019-11-09 06:20:17', NULL, NULL, 1),
(376, 42, 'Radiologists', 'All Locations', 1, NULL, '2019-11-09 06:20:51', NULL, NULL, 1),
(377, 54, 'Bracelets', 'Bracelets Products', 1, NULL, '2019-11-09 06:21:20', NULL, NULL, 1),
(378, 42, 'Rheumatologists', 'All Locations', 1, NULL, '2019-11-09 06:21:54', NULL, NULL, 1),
(379, 54, 'Chains', 'Gold Chains', 1, NULL, '2019-11-09 06:22:35', NULL, NULL, 1),
(380, 42, 'Spine Surgeons', 'All Locations', 1, NULL, '2019-11-09 06:23:04', NULL, NULL, 1),
(381, 46, 'Sell Service', 'House,  Commercial, Residential', 1, NULL, '2019-11-09 06:23:13', NULL, NULL, 1),
(382, 41, 'Welding Contractors', 'All Locations', 1, NULL, '2019-11-09 06:23:19', NULL, NULL, 1),
(383, 46, 'Sell Service', 'House,  Commercial, Residential', 1, NULL, '2019-11-09 06:23:28', NULL, NULL, 1),
(384, 42, 'Trichologists', 'All Locations', 1, NULL, '2019-11-09 06:24:12', NULL, NULL, 1),
(385, 42, 'Urologists', 'All Locations', 1, NULL, '2019-11-09 06:25:16', NULL, NULL, 1),
(386, 42, 'Vascular Surgeons', 'All Locations', 1, NULL, '2019-11-09 06:26:00', NULL, NULL, 1),
(387, 46, 'Buy Service', 'House,  Commercial, Residential', 1, NULL, '2019-11-09 06:26:06', NULL, NULL, 1),
(388, 54, 'Gold Coins', 'Gold Coins Store', 1, NULL, '2019-11-09 06:26:43', NULL, NULL, 1),
(389, 54, 'Earnings', 'Kundan Earnings', 1, NULL, '2019-11-09 06:29:54', NULL, NULL, 1),
(390, 54, 'Mangalsutras', 'Indian Mangalsutras', 1, NULL, '2019-11-09 06:31:21', NULL, NULL, 1),
(391, 54, 'Necklaces', 'Simple Gold Necklace  Designs', 1, NULL, '2019-11-09 06:32:55', NULL, NULL, 1),
(392, 54, 'Nose Pins', 'Gold Nose Pins Designs', 1, NULL, '2019-11-09 06:34:14', NULL, NULL, 1),
(393, 46, 'PG, Hostels and Rooms', 'Men, Students, Women', 1, NULL, '2019-11-09 06:34:26', NULL, NULL, 1),
(394, 26, 'Schools', 'Boarding Schools, Special Schools', 1, NULL, '2019-11-09 06:35:26', NULL, NULL, 1),
(395, 54, 'Pendants', 'Gold Pendants Designs', 1, NULL, '2019-11-09 06:35:41', NULL, NULL, 1),
(396, 54, 'Rings', 'Gold Rings', 1, NULL, '2019-11-09 06:36:42', NULL, NULL, 1),
(397, 26, 'Colleges', 'Commerce College, Engineering Colleges, Govt Colle', 1, NULL, '2019-11-09 06:37:51', NULL, NULL, 1),
(398, 54, 'Explore More', 'Explore more Designs', 1, NULL, '2019-11-09 06:38:08', NULL, NULL, 1),
(399, 47, 'AC Service', 'Blue Star,  Daikin, Godrej, LG.....', 1, NULL, '2019-11-09 06:38:11', NULL, NULL, 1),
(400, 56, 'Chimneys', 'Exhaust the Combustion Gas Outside', 1, NULL, '2019-11-09 06:38:21', NULL, NULL, 1),
(401, 55, 'Acting Classes', 'Acting Classes At House, Acting Classes For Adult', 1, NULL, '2019-11-09 06:39:28', NULL, NULL, 1),
(402, 47, 'Car Service', 'Ford, Mahindra, Hyundai,  Honda,..............', 1, NULL, '2019-11-09 06:41:05', NULL, NULL, 1),
(403, 26, 'Art & Craft Classes', 'Art & Craft Classes For Adult, Art & Craft Classes', 1, NULL, '2019-11-09 06:41:58', NULL, NULL, 1),
(404, 47, 'Computer', 'Acer, Apple, Dell,.........', 1, 1, '2019-11-09 06:43:28', '2019-11-09 06:46:34', NULL, 1),
(405, 56, 'Gas Stoves', 'All- Prestiage , Preethi ,SunFlame....', 1, NULL, '2019-11-09 06:43:49', NULL, NULL, 1),
(406, 57, 'Languages', 'Arabic, Chinese, English, German, Hindi, Italian, ', 1, NULL, '2019-11-09 06:45:04', NULL, NULL, 1),
(407, 26, 'Coaching Classes & Tutorials', 'House Riding ,', 1, NULL, '2019-11-09 06:45:11', NULL, NULL, 1),
(408, 47, 'Laptop', 'Acer, Apple, Dell,.........', 1, NULL, '2019-11-09 06:45:59', NULL, NULL, 1),
(409, 56, 'Built In Hobs', 'As per Customer Requirement Designs Available ( 2,', 1, NULL, '2019-11-09 06:47:09', NULL, NULL, 1),
(410, 26, 'Language Classes', 'All-Hindi, English, Islamic, Marathi, Semi English', 1, NULL, '2019-11-09 06:47:43', NULL, NULL, 1),
(411, 26, 'Painting Classes', 'All Types Of Painting', 1, NULL, '2019-11-09 06:49:16', NULL, NULL, 1),
(412, 56, 'Shutters', 'Shutters Allows Light and Ventilation', 1, 1, '2019-11-09 06:49:25', '2019-11-09 06:49:39', NULL, 1),
(413, 26, 'Photography Classes', 'Photos', 1, NULL, '2019-11-09 06:50:23', NULL, NULL, 1),
(414, 47, 'Mobile Phone', 'Apple, Redme, Samsong,....', 1, 1, '2019-11-09 06:50:28', '2019-11-09 06:50:58', NULL, 1),
(415, 26, 'Soft Skill & Image Building', 'Communication, Leadership', 1, NULL, '2019-11-09 06:52:56', NULL, NULL, 1),
(416, 58, 'Home Loans', 'Home loan Service', 1, 1, '2019-11-09 06:53:55', '2019-11-11 04:54:06', NULL, 1),
(417, 56, 'U Shaped Kitchen', 'Design Of U Shape in Kitchen', 1, NULL, '2019-11-09 06:55:09', NULL, NULL, 1),
(418, 26, 'Training Institutes', 'All Types Of Training', 1, NULL, '2019-11-09 06:55:22', NULL, NULL, 1),
(419, 58, 'Credit Cards', 'Credit Cards (visa,master card)', 1, NULL, '2019-11-09 06:55:56', NULL, NULL, 1),
(420, 58, 'Personal Loans', 'Personal Loan Services', 1, 1, '2019-11-09 06:57:33', '2019-11-11 06:25:50', NULL, 1),
(421, 47, 'Motorcycle', 'Thunderbolt , Venom, Thunderbird...', 1, 1, '2019-11-09 06:57:42', '2019-11-11 06:24:58', NULL, 1),
(422, 58, 'Car loans', 'Car loan Services', 1, NULL, '2019-11-09 06:59:31', NULL, NULL, 1),
(423, 58, 'Business Loans', 'Business loans Services (Commercial)', 1, NULL, '2019-11-09 07:01:07', NULL, NULL, 1),
(424, 56, 'Cabinets', 'Kitchen Cabinets - Base , Wall , Pantry , Wooden', 1, 1, '2019-11-09 07:01:17', '2019-11-09 07:01:41', NULL, 1),
(425, 47, 'Refrigerator', 'LG, Samsung, Whirlpool, Haier,....', 1, NULL, '2019-11-09 07:02:31', NULL, NULL, 1),
(426, 58, 'Educational Loans', 'Educational loans Services', 1, NULL, '2019-11-09 07:02:39', NULL, NULL, 1),
(427, 60, 'Administration Training', 'For Ex: Office Administration, Sales force Adminis', 1, NULL, '2019-11-09 07:03:29', NULL, NULL, 1),
(428, 58, 'Loan Against Gold', 'Loans Against Loans Services', 1, NULL, '2019-11-09 07:04:16', NULL, NULL, 1),
(429, 47, 'Washing Machine', 'Panasonic, Whirlpool, Sansung,....', 1, NULL, '2019-11-09 07:05:19', NULL, NULL, 1),
(430, 58, 'Mortgage Loans', 'Mortgage loans services', 1, 1, '2019-11-09 07:06:04', '2019-11-09 07:06:21', NULL, 1),
(431, 60, 'Basic Computing', 'MS- Office ( Excel, Word, Power Point )', 1, NULL, '2019-11-09 07:09:09', NULL, NULL, 1),
(432, 47, 'Water Purifier', 'Aquagaurd,   Kent, ...', 1, NULL, '2019-11-09 07:10:03', NULL, NULL, 1),
(433, 62, 'Doctors', 'Doctors Services', 1, NULL, '2019-11-09 07:10:36', NULL, NULL, 1),
(434, 60, 'Computer Hardware Training', 'Computer Hardware Training Service', 1, NULL, '2019-11-09 07:10:56', NULL, NULL, 1),
(435, 62, 'Hospitals', 'Hospitals Services', 1, NULL, '2019-11-09 07:12:05', NULL, NULL, 1),
(436, 61, 'Carpenters', 'All Locations', 1, 1, '2019-11-09 07:12:41', '2019-12-13 21:45:10', NULL, 1),
(437, 60, 'Computer Network Training', 'Computer Network Training', 1, NULL, '2019-11-09 07:12:48', NULL, NULL, 1),
(438, 62, 'Dentists', 'Dentists Services', 1, NULL, '2019-11-09 07:12:56', NULL, NULL, 1),
(439, 62, 'Chemists', 'Chemists labor Statistics', 1, NULL, '2019-11-09 07:15:06', NULL, NULL, 1),
(440, 47, 'Bodyguards', 'Hire  Professional Body Guards', 1, NULL, '2019-11-09 07:16:05', NULL, NULL, 1),
(441, 62, 'Pathology Labs', 'Pathology Laboratory', 1, NULL, '2019-11-09 07:16:40', NULL, NULL, 1),
(442, 61, 'Carpet Cleaners', 'Carpel Cleaners - Dirt Devil , Bissell , Pyle Wet ', 1, NULL, '2019-11-09 07:16:45', NULL, NULL, 1),
(443, 23, 'CCTV Cameras', 'Dome, Bullet, C-Mount,....', 1, NULL, '2019-11-09 07:17:58', NULL, NULL, 1),
(444, 62, 'Ambulance', 'Ambulance Services', 1, NULL, '2019-11-09 07:18:07', NULL, NULL, 1),
(445, 62, 'Opticians', 'Opticians Services', 1, NULL, '2019-11-09 07:19:35', NULL, NULL, 1),
(446, 61, 'Driver Service', 'Driver Service - All Locations', 1, NULL, '2019-11-09 07:20:15', NULL, NULL, 1),
(447, 60, 'Data Base Training', 'Data Base Training', 1, NULL, '2019-11-09 07:20:22', NULL, NULL, 1),
(448, 62, 'Blood Banks', 'Blood Bank Services', 1, NULL, '2019-11-09 07:20:50', NULL, NULL, 1),
(449, 47, 'Hire Detectives', 'Hire  Professional Detectives', 1, NULL, '2019-11-09 07:21:20', NULL, NULL, 1),
(450, 61, 'Duplicate Key Makers', 'All Types Of Keys', 1, NULL, '2019-11-09 07:21:49', NULL, NULL, 1),
(451, 26, 'Engineering Colleges', 'Training ( Mechanical, Piping, Network....)', 1, 1, '2019-11-09 07:22:18', '2019-12-13 21:57:45', NULL, 1),
(452, 6, 'Allopathic Doctors', 'Allopathic Doctors Services', 1, 1, '2019-11-09 07:23:28', '2020-05-04 14:51:41', NULL, 1),
(453, 61, 'Electricians', 'All Locations', 1, 1, '2019-11-09 07:23:51', '2019-12-13 21:44:06', NULL, 1);
INSERT INTO `sub_categories` (`id`, `cat_id`, `name`, `desc`, `created_user_id`, `updated_user_id`, `created_at`, `updated_at`, `deleted_at`, `status`) VALUES
(454, 60, 'Mobile Development Training', 'App Development Training', 1, NULL, '2019-11-09 07:24:25', NULL, NULL, 1),
(455, 47, 'Lock Services', 'Padlocks, Deadbolts, Knob Locks,  Lever Handle Loc', 1, NULL, '2019-11-09 07:25:11', NULL, NULL, 1),
(456, 6, 'Alternative Therapy', 'Alternative Therapy Services', 1, 1, '2019-11-09 07:25:17', '2020-05-04 14:53:20', NULL, 1),
(457, 6, 'Ayurvedic Doctors', 'Ayurvedic Services', 1, 1, '2019-11-09 07:27:08', '2020-05-04 14:54:36', NULL, 1),
(458, 12, 'Brick Builders', 'Contract - Available Brick Builders', 1, 1, '2019-11-09 07:28:01', '2020-01-24 16:03:05', NULL, 1),
(459, 12, 'Security Services', 'Hire Security Services', 1, 1, '2019-11-09 07:28:43', '2020-01-24 16:51:48', NULL, 1),
(460, 6, 'Homeopathic Doctors', 'Homeopathic Services', 1, 1, '2019-11-09 07:28:51', '2020-05-04 14:56:50', NULL, 1),
(461, 60, 'Multimedia & Design Training', 'Multimedia Training', 1, NULL, '2019-11-09 07:29:55', NULL, NULL, 1),
(462, 60, 'Programming Languages', 'Programming Languages Training (Java, PHP, C++....', 1, NULL, '2019-11-09 07:31:18', NULL, NULL, 1),
(463, 61, 'Painters (Daily ,Hours )', 'Contract or Daily', 1, NULL, '2019-11-09 07:32:33', NULL, NULL, 1),
(464, 60, 'Web Technology Training', 'Web Languages Training ( .net, Magento)', 1, NULL, '2019-11-09 07:33:56', NULL, NULL, 1),
(465, 63, 'Animal Transporters', 'All ( Dogs, Pigs, Sheep ...)', 1, NULL, '2019-11-09 07:45:34', NULL, NULL, 1),
(466, 63, 'Antiques & Special Care Items', 'All types of Antiques', 1, NULL, '2019-11-09 07:49:49', NULL, NULL, 1),
(467, 63, 'Business & Industrial Goods', 'Business Products', 1, NULL, '2019-11-09 07:52:11', NULL, NULL, 1),
(468, 63, 'Food & Agriculture Products', 'Food and Agriculture Products Movers', 1, NULL, '2019-11-09 07:54:20', NULL, NULL, 1),
(469, 63, 'House Hold Goods', 'House Hold Products Movers', 1, NULL, '2019-11-09 07:55:51', NULL, NULL, 1),
(470, 63, 'Junk Transporters', 'Junk Food Movers', 1, NULL, '2019-11-09 07:57:29', NULL, NULL, 1),
(471, 63, 'Low Container Low Freight', 'Low weight Load Container movers', 1, NULL, '2019-11-09 07:58:52', NULL, NULL, 1),
(472, 63, 'Plants & Heavy Equipments', 'Heavy Containers, Movers', 1, 1, '2019-11-09 08:00:14', '2019-11-11 06:52:04', NULL, 1),
(473, 54, 'Online Doctors', 'Online Doctor Consultant', 1, NULL, '2019-11-09 08:00:20', NULL, NULL, 1),
(474, 63, 'Vehicle Transporters', 'Any Vehicle movers', 1, NULL, '2019-11-09 08:01:17', NULL, NULL, 1),
(475, 62, 'Siddha Doctors', 'Siddha Services', 1, NULL, '2019-11-09 08:02:01', NULL, NULL, 1),
(476, 6, 'Unani Doctors', 'Unani Services', 1, 1, '2019-11-09 08:04:12', '2020-05-04 15:01:20', NULL, 1),
(477, 62, 'Veterinary Doctors', 'Veterinary Services', 1, NULL, '2019-11-09 08:06:22', NULL, NULL, 1),
(478, 61, 'Pest Control', 'Pest Control Services - Residential , Commercial', 1, NULL, '2019-11-09 08:06:44', NULL, NULL, 1),
(479, 47, 'Valet Parking Services', 'Restaurants. Theaters. Lounges. Hotels. Retail Cen', 1, NULL, '2019-11-09 08:07:56', NULL, NULL, 1),
(480, 61, 'Plumbers', 'Plumber Services - All Locations', 1, 1, '2019-11-09 08:08:48', '2019-12-13 21:44:38', NULL, 1),
(481, 61, 'Towing Service', 'All Locations', 1, NULL, '2019-11-09 08:11:31', NULL, NULL, 1),
(482, 9, 'Hotels', 'Hotels Service', 1, 1, '2019-11-09 08:13:07', '2020-05-04 15:07:16', NULL, 1),
(483, 2, 'Flights', 'Comfortable Flight Service', 1, 1, '2019-11-09 08:14:13', '2020-05-04 12:29:59', NULL, 1),
(484, 47, 'Walkie Talkie Dealers', 'Providing Professional Dealers', 1, NULL, '2019-11-09 08:14:14', NULL, NULL, 1),
(485, 10, 'Buses', 'Bus Service', 1, 1, '2019-11-09 08:16:02', '2020-01-24 16:48:46', NULL, 1),
(486, 65, 'Local', 'Goods carriers - Local', 1, NULL, '2019-11-09 08:17:03', NULL, '2019-11-09 08:21:09', 1),
(487, 2, 'Car Rentals', 'Car Rentals Services', 1, 1, '2019-11-09 08:17:11', '2020-05-04 12:31:17', NULL, 1),
(488, 52, 'Shopping For Men', 'Blazar, Cap,  Shoe, Socks, Formal Wear, Ethnic wea', 1, 1, '2019-11-09 08:18:47', '2019-11-11 06:30:49', NULL, 1),
(489, 2, 'Cabs Service', 'Cab Service', 1, 1, '2019-11-09 08:20:19', '2020-05-04 12:32:26', NULL, 1),
(490, 64, 'Trains', 'Train Service', 1, NULL, '2019-11-09 08:21:40', NULL, NULL, 1),
(491, 15, 'Local', 'Goods carriers - Local', 1, 1, '2019-11-09 08:21:40', '2020-01-24 16:56:01', NULL, 1),
(492, 52, 'Shopping For Women', 'Glove, Hand Bag, Perfume, Scarf, Wrist Watch..', 1, NULL, '2019-11-09 08:21:58', NULL, NULL, 1),
(493, 65, 'National', 'Goods Carriers - National', 1, NULL, '2019-11-09 08:22:19', NULL, NULL, 1),
(494, 64, 'International SIM Card', 'SIM Card Service', 1, NULL, '2019-11-09 08:23:28', NULL, NULL, 1),
(495, 65, 'International', 'All Locations', 1, NULL, '2019-11-09 08:23:33', NULL, NULL, 1),
(496, 64, 'Visa Assistance', 'Visa Service', 1, NULL, '2019-11-09 08:25:11', NULL, NULL, 1),
(497, 64, 'Foreign Exchange', 'Foreign Exchange Service', 1, NULL, '2019-11-09 08:26:17', NULL, NULL, 1),
(498, 64, 'Meals On Train', 'Meals Service', 1, NULL, '2019-11-09 08:27:12', NULL, NULL, 1),
(499, 11, 'Tempo Travelers On Hire', 'Travel  Service', 1, 1, '2019-11-09 08:28:41', '2020-01-24 16:53:51', NULL, 1),
(500, 15, 'Movers For Automobile', 'Automobile Movers in All Locations', 1, 1, '2019-11-09 08:30:21', '2020-01-24 16:54:55', NULL, 1),
(501, 52, 'Shopping For Kids', 'Fashion Accessory, Toys, Kids shoe.......', 1, NULL, '2019-11-09 08:30:48', NULL, NULL, 1),
(502, 8, 'Banquet Halls', 'Wedding Service', 1, 1, '2019-11-09 08:33:51', '2020-01-12 15:45:23', '2020-01-12 16:15:20', 1),
(503, 15, 'Movers For Commercial', 'Packers and Movers for Office , Bussiness', 1, 1, '2019-11-09 08:34:35', '2020-01-24 16:47:44', NULL, 1),
(504, 4, 'Bridal Requisites', 'Wedding Kit', 1, 1, '2019-11-09 08:37:41', '2020-05-04 13:05:23', NULL, 1),
(505, 53, 'Athletics', 'Training & Classes', 1, NULL, '2019-11-09 08:38:20', NULL, NULL, 1),
(506, 8, 'Banquet Halls', 'Wedding , Get to Gether Parties....', 1, 1, '2019-11-09 08:39:52', '2020-01-12 15:44:53', '2020-01-12 16:16:41', 1),
(507, 19, 'DJ Event', 'Music  Equipment', 1, 1, '2019-11-09 08:42:05', '2020-01-24 17:03:32', NULL, 1),
(508, 17, 'Florists', 'All Types of Flowers', 1, 1, '2019-11-09 08:46:02', '2020-01-24 16:57:20', NULL, 1),
(509, 53, 'Badminton', 'Forehand Service,Backhand Service..', 1, 1, '2019-11-09 08:47:19', '2019-11-09 08:48:50', NULL, 1),
(510, 8, 'Jewellery', 'Wedding Jewellery', 1, 1, '2019-11-09 08:47:25', '2020-01-12 14:55:40', '2020-01-12 16:14:21', 1),
(511, 8, 'Event Organisers', 'Organiser to All Your Events', 1, 1, '2019-11-09 08:47:55', '2020-05-04 15:22:35', NULL, 1),
(512, 66, 'Matrimonial Bureaus', 'Wedding Bureaus', 1, NULL, '2019-11-09 08:50:40', NULL, NULL, 1),
(513, 8, 'Photographers', 'Wedding Photographers', 1, 1, '2019-11-09 08:52:56', '2020-05-04 15:25:17', NULL, 1),
(514, 53, 'Basketball', 'Local, Regional, National, International', 1, NULL, '2019-11-09 08:54:24', NULL, NULL, 1),
(515, 8, 'Wedding Cards', 'Wedding Invitations Cards', 1, 1, '2019-11-09 08:56:00', '2020-01-12 14:50:27', '2020-01-12 16:17:45', 1),
(516, 67, 'Photographers', 'Captures Your Celebrations', 1, NULL, '2019-11-09 08:57:47', NULL, '2019-11-09 08:58:01', 1),
(517, 67, 'Photographers', 'Captures Your Celebrations', 1, NULL, '2019-11-09 08:58:32', NULL, NULL, 1),
(518, 67, 'Wine Retailers', 'Natural Wine & Beer Shops', 1, NULL, '2019-11-09 09:00:57', NULL, NULL, 1),
(519, 53, 'Boxing', 'Kick Boxing, Inter Services, Home Service', 1, NULL, '2019-11-09 09:01:02', NULL, NULL, 1),
(520, 67, 'Party Organisers For Children', 'Parties for Children', 1, NULL, '2019-11-09 09:03:01', NULL, NULL, 1),
(521, 68, 'Beer Shops', 'Beer Service', 1, NULL, '2019-11-09 09:03:49', NULL, NULL, 1),
(522, 67, 'Playback Singers', 'Singers For Party', 1, NULL, '2019-11-09 09:05:33', NULL, NULL, 1),
(523, 68, 'Liquor Stores', 'Liquor Service', 1, NULL, '2019-11-09 09:05:36', NULL, NULL, 1),
(524, 53, 'Chess', 'Home Service,Training  For All', 1, NULL, '2019-11-09 09:07:28', NULL, NULL, 1),
(525, 67, 'Bouncer Services', 'Bouncers for Your Safety', 1, NULL, '2019-11-09 09:08:19', NULL, NULL, 1),
(526, 4, 'Costumes', 'Different Costumes For Parties', 1, 1, '2019-11-09 09:10:48', '2020-05-04 13:10:47', NULL, 1),
(527, 4, 'Beauty Parlours', 'Men Beauty Parlours, Unisex Beauty Parlours, Women', 1, 1, '2019-11-09 09:12:00', '2020-05-04 13:18:34', NULL, 1),
(528, 53, 'Cricket', 'Training For Regional, National & International', 1, NULL, '2019-11-09 09:12:18', NULL, NULL, 1),
(529, 8, 'Dance Groups', 'Dance Groups For Parties', 1, 1, '2019-11-09 09:13:37', '2020-05-04 15:27:34', NULL, 1),
(530, 4, 'Beauty Services', 'Beard Styling Services, Beauty Parlours For Bridal', 1, 1, '2019-11-09 09:13:48', '2020-05-04 13:20:54', NULL, 1),
(531, 4, 'Bridal Makeup', 'Beauty Parlours For Muslim Bride, Beauty Parlours', 1, 1, '2019-11-09 09:17:54', '2020-05-04 13:23:15', NULL, 1),
(532, 67, 'Fire Crackers', 'Party Equipment ( Party blast )', 1, NULL, '2019-11-09 09:18:14', NULL, NULL, 1),
(533, 17, 'Florists', 'Flower Decoration for Parties', 1, 1, '2019-11-09 09:19:50', '2020-01-24 16:43:46', NULL, 1),
(534, 4, 'Bridegroom', 'Follow On Wedding Day', 1, 1, '2019-11-09 09:21:50', '2020-05-04 13:25:56', NULL, 1),
(535, 67, 'Generator and Power Backup', 'Power Supply', 1, NULL, '2019-11-09 09:21:50', NULL, NULL, 1),
(536, 67, 'Guest House', 'Boarding House', 1, NULL, '2019-11-09 09:23:56', NULL, NULL, 1),
(537, 4, 'Salons', 'At Home, Men, Unisex, Women', 1, 1, '2019-11-09 09:24:00', '2020-05-04 14:33:30', NULL, 1),
(538, 4, 'Laser', 'Best Laser Service', 1, 1, '2019-11-09 09:26:08', '2020-05-04 14:44:56', NULL, 1),
(539, 5, 'Ice Cube Dealers', 'Quality Ice Cubes', 1, 1, '2019-11-09 09:26:22', '2020-05-04 11:16:57', NULL, 1),
(540, 8, 'Invitation Cards', 'All Types Of Invitation Cards Available', 1, 1, '2019-11-09 09:29:30', '2020-05-04 15:37:20', NULL, 1),
(541, 5, 'Juice Services', 'Provides Juice services', 1, 1, '2019-11-09 09:31:24', '2020-05-04 12:04:41', NULL, 1),
(542, 67, 'Kids Entertainment', 'Entertainment For Kids In Parties', 1, NULL, '2019-11-09 09:33:37', NULL, NULL, 1),
(543, 70, 'Pet Accessories', 'Pet Safety Muzzle', 1, NULL, '2019-11-09 09:33:40', NULL, NULL, 1),
(544, 70, 'Pet Food', 'best Protein Food For Pet', 1, NULL, '2019-11-09 09:35:43', NULL, NULL, 1),
(545, 67, 'Liquor Stores', 'Best Liquor', 1, NULL, '2019-11-09 09:36:46', NULL, NULL, 1),
(546, 70, 'Pet Shops', 'Neat Pet shops', 1, NULL, '2019-11-09 09:37:23', NULL, NULL, 1),
(547, 6, 'Veterinary Doctors', 'All Locations', 1, 1, '2019-11-09 09:38:11', '2020-05-04 15:03:20', NULL, 1),
(548, 67, 'Mascots', 'All Types of Mascots', 1, NULL, '2019-11-09 09:38:11', NULL, NULL, 1),
(549, 67, 'MilkShakes', 'All Varities  Of MilkShakes', 1, NULL, '2019-11-09 09:40:26', NULL, NULL, 1),
(550, 53, 'Football', 'Jorkyball, Cycle-ball, Roller Soccer, Footballtenn', 1, NULL, '2019-11-09 09:41:55', NULL, NULL, 1),
(551, 71, 'Kindergarten', 'National & International Schools', 1, NULL, '2019-11-09 09:42:50', NULL, NULL, 1),
(552, 67, 'Orchestra Bands', 'Best Music Bands', 1, NULL, '2019-11-09 09:43:33', NULL, NULL, 1),
(553, 71, 'Montessori Schools', 'Montessori & Traditional  Schools', 1, 1, '2019-11-09 09:43:47', '2019-11-11 06:44:35', NULL, 1),
(554, 67, 'Party Poppers', 'Different Types of Party Poppers', 1, NULL, '2019-11-09 09:44:52', NULL, NULL, 1),
(555, 71, 'Pre-School', 'Children With Professional Educational', 1, NULL, '2019-11-09 09:45:27', NULL, NULL, 1),
(556, 53, 'Gymnastic', 'Floor Exercise, Pommel Horse, Still Rings, Vault, ', 1, NULL, '2019-11-09 09:45:46', NULL, NULL, 1),
(557, 67, 'Sweet Shops', 'All Varities Of Sweets', 1, NULL, '2019-11-09 09:46:09', NULL, NULL, 1),
(558, 53, 'Hockey', 'Field & Ice', 1, NULL, '2019-11-09 09:50:10', NULL, NULL, 1),
(559, 53, 'Judo Service', 'For Kids,Men , Women', 1, NULL, '2019-11-09 09:53:32', NULL, NULL, 1),
(560, 67, 'Tent House', 'All Types', 1, NULL, '2019-11-09 09:56:19', NULL, NULL, 1),
(561, 53, 'Kabbadi', 'Local, Regional, National, International', 1, NULL, '2019-11-09 10:00:00', NULL, NULL, 1),
(562, 5, 'Furnitures', 'Furniture\'s Products', 1, 1, '2019-11-09 10:00:52', '2019-12-13 22:08:16', '2020-01-12 14:36:45', 1),
(563, 73, 'Furnishing', 'Furnishing  Products', 1, NULL, '2019-11-09 10:02:42', NULL, NULL, 1),
(564, 62, 'Lamps & Lighting', 'Lamps & Lightnings', 1, 1, '2019-11-09 10:04:27', '2019-12-11 16:41:28', NULL, 1),
(565, 73, 'Kitchen& Dining', 'Kitchen & Dining Design', 1, NULL, '2019-11-09 10:06:21', NULL, NULL, 1),
(566, 53, 'Karate', 'Wado-ryu, Shorin-ryu, Kyokushin,  Shito-ryu, Ashih', 1, NULL, '2019-11-09 10:06:27', NULL, NULL, 1),
(567, 73, 'Bathing', 'Baby Bath Tub,Shower Cap,Soap Case', 1, NULL, '2019-11-09 10:09:36', NULL, NULL, 1),
(568, 53, 'Skating', 'Inline, Artistick Roller, Road,....', 1, NULL, '2019-11-09 10:10:25', NULL, NULL, 1),
(569, 73, 'House Keeping', 'House Keeping Services', 1, NULL, '2019-11-09 10:10:48', NULL, NULL, 1),
(570, 53, 'Squash', 'Single & Double Squash', 1, 1, '2019-11-09 10:16:42', '2019-11-11 06:43:26', NULL, 1),
(571, 53, 'Swimming', 'The Front Crawl, Breaststroke.,The Butterfly Strok', 1, NULL, '2019-11-09 10:26:31', NULL, NULL, 1),
(572, 53, 'Table Tennis', 'Penhold, Shakehand Grip, Unusual Grips....', 1, NULL, '2019-11-09 10:32:23', NULL, NULL, 1),
(573, 53, 'Tennis', 'Singles & Doubles', 1, NULL, '2019-11-09 10:35:17', NULL, NULL, 1),
(574, 53, 'Volleyball', 'Aquatic , Beach,  Fistball...', 1, NULL, '2019-11-09 10:38:41', NULL, NULL, 1),
(575, 73, 'Dressing Table', 'Dressing Table Products', 1, NULL, '2019-11-09 11:11:31', NULL, NULL, 1),
(576, 73, 'Bed Room Furniture', 'Bed Room Furniture', 1, NULL, '2019-11-09 11:12:55', NULL, NULL, 1),
(577, 73, 'Bed Room Sets', 'Bed Room Sets Products', 1, NULL, '2019-11-09 11:14:46', NULL, NULL, 1),
(578, 73, 'Beside Tablets', 'Beside Tablets Products', 1, NULL, '2019-11-09 11:19:06', NULL, NULL, 1),
(579, 73, 'Cots Furniture', 'Cots Furniture Products', 1, NULL, '2019-11-09 11:20:03', NULL, NULL, 1),
(580, 73, 'Wardrobe Cupboards& Alimirahs', 'Wardrobe Cupboards & Alimirahs products', 1, NULL, '2019-11-09 11:22:28', NULL, NULL, 1),
(581, 73, 'Kitchen Stands & Racks', 'Kitchen Stands & Racks', 1, NULL, '2019-11-09 11:23:50', NULL, NULL, 1),
(582, 73, 'Kitchen Trolley', 'Kitchen Trolley products', 1, NULL, '2019-11-09 11:24:52', NULL, NULL, 1),
(583, 73, 'Dinning chairs', 'Dinning Chairs Products', 1, NULL, '2019-11-09 11:26:15', NULL, NULL, 1),
(584, 73, 'Kitchen Cabinet', 'Kitchen Cabinet Products', 1, NULL, '2019-11-09 11:27:31', NULL, NULL, 1),
(585, 73, 'Kitchen Furniture & Doors', 'Kitchen Furniture And Doors', 1, NULL, '2019-11-09 11:29:16', NULL, NULL, 1),
(586, 73, 'Modular Kitchen & Furniture', 'Modular Kitchen & Furniture Products', 1, NULL, '2019-11-09 11:34:16', NULL, NULL, 1),
(587, 72, 'Cabinets', 'Cabinets Poducts', 1, NULL, '2019-11-09 11:35:34', NULL, NULL, 1),
(588, 73, 'Shoe Racks', 'Shoe Racks Products', 1, NULL, '2019-11-09 11:36:32', NULL, NULL, 1),
(589, 73, 'Sofas & Diwans', 'Sofas & Diwans Products', 1, NULL, '2019-11-09 11:37:45', NULL, NULL, 1),
(590, 73, 'Sideboards', 'Side Boards Products', 1, NULL, '2019-11-09 11:39:16', NULL, NULL, 1),
(591, 72, 'Out Door - Services', 'Garden Furniture , Outdoor Benches and Chairs....', 1, NULL, '2019-11-09 11:39:24', NULL, NULL, 1),
(592, 73, 'Stools Shelf & Racks', 'Stools & Shelf And Racks', 1, NULL, '2019-11-09 11:41:20', NULL, '2020-01-28 08:06:49', 1),
(593, 73, 'Tables & Drawers', 'Tables and  Drawers products', 1, NULL, '2019-11-09 11:43:13', NULL, '2020-01-12 14:33:41', 1),
(594, 73, 'Trolley & Stands', 'Trolley & Stands product', 1, NULL, '2019-11-09 11:44:28', NULL, '2020-01-12 14:33:21', 1),
(595, 73, 'Wall & TV Units', 'Wall& Tv Units', 1, NULL, '2019-11-09 11:45:43', NULL, '2020-01-12 14:30:05', 1),
(596, 5, 'Andhra Food', 'Andhra Specials', 1, 1, '2019-11-09 11:47:39', '2020-05-04 12:06:17', NULL, 1),
(597, 5, 'Biryani', 'Tasty and Spicy', 1, 1, '2019-11-09 12:08:26', '2020-05-04 12:08:57', NULL, 1),
(598, 5, 'Snacks & Others', 'Snacks & Others', 1, 1, '2019-11-09 12:09:48', '2020-05-04 12:12:01', NULL, 1),
(599, 1, 'Diary Products', 'Diary Products', 1, 1, '2019-11-09 12:12:08', '2020-05-04 10:35:14', NULL, 1),
(600, 1, 'FRUITS & VEGGIES', 'Grocery Products', 1, 1, '2019-11-09 12:14:02', '2020-05-04 10:40:24', NULL, 1),
(601, 1, 'Home Needs', 'Home Daily Needs', 1, 1, '2019-11-11 04:46:59', '2020-05-04 10:42:48', NULL, 1),
(602, 3, 'Ayurveda', 'Health Care Products', 1, 1, '2019-11-11 04:47:31', '2020-05-04 12:35:46', NULL, 1),
(603, 1, 'Cooking & Baking Needs', 'Grocery Products', 1, 1, '2019-11-11 04:48:01', '2020-05-17 13:49:13', NULL, 1),
(604, 8, 'Google Maps', '24 Maps', 1, NULL, '2019-12-13 21:40:00', NULL, '2019-12-13 21:40:21', 1),
(605, 1, 'Cool Drinks', 'Grocery Products', 1, 1, '2019-12-13 21:46:34', '2020-05-17 13:50:31', NULL, 1),
(606, 1, 'Daily Needs', 'Grocery Products', 1, 1, '2019-12-13 21:47:38', '2020-06-28 14:37:11', NULL, 1),
(607, 1, 'Meat poultry & Sea food', 'Grocery Products', 1, 1, '2019-12-13 21:59:13', '2020-05-17 14:44:26', NULL, 1),
(608, 18, 'T-Shirts & Polos', 'T-Shirts & Polos', 1, 1, '2020-01-12 15:43:37', '2020-01-24 14:56:28', '2020-01-24 14:57:08', 1),
(609, 19, 'DJ Event', 'DJ Event Rock', 1, 1, '2020-01-12 16:22:06', '2020-01-24 17:02:51', NULL, 1),
(610, 2, 'Car Share', 'Car Share Book', 1, 1, '2020-01-12 16:52:56', '2020-01-24 15:58:18', NULL, 1),
(611, 2, 'Auto Book', 'Auto Book Ola', 1, 1, '2020-01-12 16:54:14', '2020-05-04 12:34:06', NULL, 1),
(612, 1, 'Dry fruits', 'Different types of Spices', 1, 1, '2020-01-12 16:57:35', '2020-05-17 13:52:07', NULL, 1),
(613, 3, 'Diabetes Care', 'Types of Medicines', 1, 1, '2020-01-12 16:59:55', '2020-05-04 12:41:59', NULL, 1),
(614, 3, 'Baby & Mom Care', 'All types of medicines', 1, 1, '2020-01-12 17:03:09', '2020-05-04 12:44:46', NULL, 1),
(615, 3, 'Health Conditions', 'All types of medicines', 1, 1, '2020-01-12 17:04:33', '2020-05-04 12:46:04', NULL, 1),
(616, 3, 'Homeopathy and Unani', 'All types of medicines', 1, 1, '2020-01-12 17:05:45', '2020-05-04 12:48:07', NULL, 1),
(617, 3, 'Medical Devices & Accessories', 'All types of medicines', 1, 1, '2020-01-12 17:07:13', '2020-05-04 12:50:05', NULL, 1),
(618, 3, 'Nutrition & Health Supplements', 'All types of medicines', 1, 1, '2020-01-12 17:08:34', '2020-05-04 12:51:49', NULL, 1),
(619, 3, 'Personal Care & Hygiene', 'All types of medicines', 1, 1, '2020-01-12 17:09:30', '2020-05-04 12:53:54', NULL, 1),
(620, 3, 'Injections', 'All types of medicines', 1, 1, '2020-01-12 17:10:48', '2020-05-04 12:59:26', NULL, 1),
(621, 19, 'Sangeeth', 'Dance', 1, 1, '2020-01-12 17:13:45', '2020-01-24 17:02:01', NULL, 1),
(622, 9, 'Plumber', 'All types of services', 1, 1, '2020-01-12 17:21:41', '2020-05-04 15:08:23', NULL, 1),
(623, 9, 'Electricians', 'Electricians', 1, 1, '2020-01-12 17:23:08', '2020-05-04 15:09:32', NULL, 1),
(624, 9, 'Cleaning', 'Cleaning Service', 1, 1, '2020-01-12 17:24:12', '2020-05-04 15:10:46', NULL, 1),
(625, 9, 'Massage', 'Massage at Home', 1, 1, '2020-01-12 17:27:22', '2020-05-04 15:14:19', NULL, 1),
(626, 9, 'AC Repair', 'AC Daikin,Voltas', 1, 1, '2020-01-12 17:30:12', '2020-05-04 15:15:42', NULL, 1),
(627, 9, 'Fitness', 'Fitness Gym', 1, 1, '2020-01-12 17:31:35', '2020-05-04 15:18:36', NULL, 1),
(628, 9, 'Carpenter', 'Carpenters service', 1, 1, '2020-01-12 17:32:45', '2020-05-04 15:19:46', NULL, 1),
(629, 7, 'Crops', 'Services', 1, NULL, '2020-01-12 17:35:52', NULL, '2020-01-13 08:06:07', 1),
(630, 7, 'Natural Resource', 'Natural', 1, 1, '2020-01-12 17:37:26', '2020-05-04 16:27:22', NULL, 1),
(631, 7, 'Live Stock', 'Live Stock Images', 1, 1, '2020-01-12 17:38:39', '2020-05-04 16:30:59', NULL, 1),
(632, 7, 'Small Farm', 'Small Farm Products', 1, 1, '2020-01-12 17:40:33', '2020-05-04 16:32:50', NULL, 1),
(633, 7, 'Education and Research', 'Agriculture', 1, 1, '2020-01-12 17:42:44', '2020-05-04 16:34:42', NULL, 1),
(634, 7, 'Social Justice', 'Social Justice', 1, 1, '2020-01-12 17:43:59', '2020-05-04 16:36:52', NULL, 1),
(635, 7, 'Local Foods', 'Local Food Items', 1, 1, '2020-01-12 17:45:24', '2020-05-04 16:38:48', NULL, 1),
(636, 7, 'Marketing', 'Marketing Products', 1, 1, '2020-01-12 17:46:36', '2020-05-04 16:41:52', NULL, 1),
(637, 7, 'Energy', 'Energy Products', 1, 1, '2020-01-12 17:47:47', '2020-01-24 14:55:16', '2020-01-24 14:57:25', 1),
(638, 10, 'AC Bus Booking', 'Luxurious Buses', 1, 1, '2020-01-13 08:08:43', '2020-01-24 14:47:53', NULL, 1),
(639, 10, 'Non AC Book', 'Non Ac', 1, 1, '2020-01-13 08:11:10', '2020-01-24 14:47:30', NULL, 1),
(640, 10, 'Mini Bus', 'Mini Bus Book', 1, 1, '2020-01-13 08:12:29', '2020-01-24 14:47:11', NULL, 1),
(641, 10, 'Mini Non AC', 'Mini Non Ac', 1, 1, '2020-01-13 08:15:19', '2020-01-24 14:46:46', NULL, 1),
(642, 10, 'AC Indra', 'AC Indra Bus', 1, 1, '2020-01-13 08:17:28', '2020-01-23 14:00:55', NULL, 1),
(643, 14, 'Transporting', '4 Wheeler', 1, 1, '2020-01-28 06:30:37', '2020-01-28 06:31:35', NULL, 1),
(644, 14, 'goods vehicle', 'goods vehicle', 1, NULL, '2020-01-28 06:33:12', NULL, NULL, 1),
(645, 11, 'Courier Service', 'Courier', 1, NULL, '2020-01-28 06:54:35', NULL, NULL, 1),
(646, 16, 'Home Sample  Collection', 'Home Sample  Collection', 1, NULL, '2020-01-28 07:26:46', NULL, NULL, 1),
(647, 16, 'Buy Health  Checkup', 'Buy Health  Checkup', 1, NULL, '2020-01-28 07:28:07', NULL, NULL, 1),
(648, 21, 'Business Loans', 'All Types are Available', 1, NULL, '2020-02-20 11:33:28', NULL, NULL, 1),
(649, 2, 'Foreign Exchange', 'Travels', 1215, NULL, '2020-02-20 11:36:22', NULL, NULL, 1),
(650, 29, 'All Jewerally', 'Jewellery', 1, NULL, '2020-02-20 11:36:30', NULL, NULL, 1),
(651, 21, 'Car Loans', 'All Types are Available', 1, NULL, '2020-02-20 11:36:46', NULL, NULL, 1),
(652, 2, 'Tempo Travellers On Hire', 'Travels', 1215, NULL, '2020-02-20 11:38:54', NULL, NULL, 1),
(653, 21, 'Credit Cards', 'Credit Cards', 1, NULL, '2020-02-20 11:39:48', NULL, NULL, 1),
(654, 29, 'Artificial Bangles', 'Jewellery', 1, NULL, '2020-02-20 11:40:25', NULL, NULL, 1),
(655, 47, 'International Flight Bookings', 'Flights', 1215, NULL, '2020-02-20 11:42:45', NULL, NULL, 1),
(656, 21, 'Educational Loans', 'Educational Loans', 1, NULL, '2020-02-20 11:43:15', NULL, NULL, 1),
(657, 43, '24 Hours Chemists', '24 hours Chemists', 1, NULL, '2020-02-20 11:43:27', NULL, NULL, 1),
(658, 29, 'Diamonds', 'Jewellery', 1, NULL, '2020-02-20 11:43:35', NULL, NULL, 1),
(659, 21, 'Home Loans', 'Home Loans Available', 1, NULL, '2020-02-20 11:44:53', NULL, NULL, 1),
(660, 43, 'Ambulance Service', '24 hours Ambulance Service in any area', 1, NULL, '2020-02-20 11:45:35', NULL, NULL, 1),
(661, 47, 'Domestic Flight Bookings', 'Flights', 1215, NULL, '2020-02-20 11:45:42', NULL, NULL, 1),
(662, 21, 'Loan against Gold', 'Loan against Gold', 1, NULL, '2020-02-20 11:46:04', NULL, NULL, 1),
(663, 21, 'Mortgage Loans', 'Mortgage Loans', 1, NULL, '2020-02-20 11:46:48', NULL, NULL, 1),
(664, 29, 'Gold Jewellery', 'Jewellery', 1, NULL, '2020-02-20 11:52:07', NULL, NULL, 1),
(665, 40, 'All Line Function Bookings', 'Celebration service', 1215, NULL, '2020-02-20 11:53:31', NULL, NULL, 1),
(666, 21, 'Personal Loans', 'Personal Loans', 1, NULL, '2020-02-20 11:55:09', NULL, NULL, 1),
(667, 40, 'Banquet Halls', 'Celebration service', 1215, NULL, '2020-02-20 11:56:25', NULL, NULL, 1),
(668, 22, 'Car Accessories', 'Car Accessories', 1, NULL, '2020-02-20 11:56:32', NULL, NULL, 1),
(669, 43, 'Blood Banks', 'Blood Banks', 1, NULL, '2020-02-20 11:57:05', NULL, NULL, 1),
(670, 29, 'Gold Coin', 'Jewellery', 1, NULL, '2020-02-20 11:58:38', NULL, NULL, 1),
(671, 22, 'Car Batteries', 'Car Batteries', 1, NULL, '2020-02-20 11:59:36', NULL, NULL, 1),
(672, 22, 'Car Repair', 'Car Repair', 1, NULL, '2020-02-20 12:00:27', NULL, NULL, 1),
(673, 43, 'Cardiologists', 'Cardiologists', 1, NULL, '2020-02-20 12:00:28', NULL, NULL, 1),
(674, 22, 'Car Tyres', 'Car Tyres', 1, NULL, '2020-02-20 12:01:28', NULL, NULL, 1),
(675, 29, 'Platinum', 'Jewellery', 1, NULL, '2020-02-20 12:02:43', NULL, NULL, 1),
(676, 22, 'Car Wash', 'Car Wash', 1, NULL, '2020-02-20 12:03:03', NULL, NULL, 1),
(677, 43, 'Duplicate Key Stores', 'Duplicate Key Stores', 1, NULL, '2020-02-20 12:03:25', NULL, NULL, 1),
(678, 22, 'Motorcycle Repair', 'Motorcycle Repair', 1, NULL, '2020-02-20 12:04:21', NULL, NULL, 1),
(679, 22, 'Scooter Repair', 'Scooter Repair', 1, NULL, '2020-02-20 12:06:05', NULL, NULL, 1),
(680, 40, 'Decorators', 'Celebration service', 1215, NULL, '2020-02-20 12:06:34', NULL, NULL, 1),
(681, 22, 'Two Wheeler Accessories', 'Two Wheeler Accessories', 1, NULL, '2020-02-20 12:07:54', NULL, NULL, 1),
(682, 22, 'Two Wheeler Batteries', 'Two Wheeler Batteries', 1, NULL, '2020-02-20 12:09:02', NULL, NULL, 1),
(683, 22, 'Two Wheeler Tyres', 'Two Wheeler Tyres', 1, NULL, '2020-02-20 12:10:06', NULL, NULL, 1),
(684, 24, '5-Star Banquet Halls', '5-Star Banquet Halls', 1, NULL, '2020-02-20 12:11:35', NULL, NULL, 1),
(685, 29, 'Silver', 'Jewellery', 1, NULL, '2020-02-20 12:11:46', NULL, NULL, 1),
(686, 40, 'DJ on Hire', 'Celebration service', 1215, NULL, '2020-02-20 12:12:22', NULL, NULL, 1),
(687, 24, 'AC Banquet Halls', 'AC Banquet Halls', 1, NULL, '2020-02-20 12:13:07', NULL, NULL, 1),
(688, 40, 'Event Organizers', 'Celebration service', 1215, NULL, '2020-02-20 12:13:42', NULL, NULL, 1),
(689, 24, 'All Banquet Halls', 'All Banquet Halls', 1, NULL, '2020-02-20 12:14:01', NULL, NULL, 1),
(690, 34, 'Computer Classes', 'Language Classes', 1, NULL, '2020-02-20 12:14:06', NULL, NULL, 1),
(691, 43, 'Fire Brigade', 'Fire Brigade', 1, NULL, '2020-02-20 12:14:10', NULL, NULL, 1),
(692, 40, 'Firecrackers', 'Celebration service', 1215, NULL, '2020-02-20 12:14:49', NULL, NULL, 1),
(693, 43, 'Hospitals', 'Hospitals', 1, NULL, '2020-02-20 12:15:31', NULL, NULL, 1),
(694, 34, 'English Grammar', 'Language Classes', 1, NULL, '2020-02-20 12:15:33', NULL, NULL, 1),
(695, 24, 'Lawn For Events', 'Lawn For Events', 1, NULL, '2020-02-20 12:15:35', NULL, NULL, 1),
(696, 40, 'Floweriest', 'Celebration service', 1215, NULL, '2020-02-20 12:15:59', NULL, NULL, 1),
(697, 24, 'Non AC Banquet Halls', 'Non AC Banquet Halls', 1, NULL, '2020-02-20 12:16:40', NULL, NULL, 1),
(698, 34, 'Hindi Classes', 'Language Classes', 1, NULL, '2020-02-20 12:17:33', NULL, NULL, 1),
(699, 27, 'Comic Books', 'Comic Books', 1, NULL, '2020-02-20 12:18:44', NULL, NULL, 1),
(700, 43, 'Police', 'Police', 1, NULL, '2020-02-20 12:19:39', NULL, NULL, 1),
(701, 40, 'Function Needs', 'Celebration service', 1215, NULL, '2020-02-20 12:20:11', NULL, NULL, 1),
(702, 27, 'Novels', 'Novels', 1, NULL, '2020-02-20 12:20:52', NULL, NULL, 1),
(703, 43, 'Snake Catchers', 'Snake Catchers', 1, NULL, '2020-02-20 12:21:13', NULL, NULL, 1),
(704, 36, 'Generator & Power Backup', 'Celebration service', 1215, NULL, '2020-02-20 12:21:57', NULL, NULL, 1),
(705, 27, 'Science and Technology Books', 'Science and Technology Books', 1, NULL, '2020-02-20 12:22:08', NULL, NULL, 1),
(706, 43, 'Towing Services', 'Towing Services', 1, NULL, '2020-02-20 12:22:45', NULL, NULL, 1),
(707, 27, 'Sports', 'Sports', 1, NULL, '2020-02-20 12:24:19', NULL, NULL, 1),
(708, 27, 'Stationary', 'Stationary', 1, NULL, '2020-02-20 12:25:47', NULL, NULL, 1),
(709, 37, 'Acting Classes', 'Acting Classes', 1, NULL, '2020-02-20 12:26:02', NULL, NULL, 1),
(710, 27, 'Story Books', 'Story Books', 1, NULL, '2020-02-20 12:26:59', NULL, NULL, 1),
(711, 33, 'Carpentry Contractors', 'Carpentry Contractors', 1, NULL, '2020-02-20 12:28:34', NULL, NULL, 1),
(712, 40, 'Invitation Cards', 'Celebration service', 1215, NULL, '2020-02-20 12:29:06', NULL, NULL, 1),
(713, 37, 'Art & Craft Classes', 'Art & Craft Classes', 1, NULL, '2020-02-20 12:29:12', NULL, NULL, 1),
(714, 33, 'Civil Contractors', 'Civil Contractors', 1, NULL, '2020-02-20 12:29:30', NULL, NULL, 1),
(715, 34, 'IIT Classes', 'Language Classes', 1, NULL, '2020-02-20 12:30:08', NULL, NULL, 1),
(716, 40, 'Juice Services', 'Celebration service', 1215, NULL, '2020-02-20 12:30:18', NULL, NULL, 1),
(717, 33, 'Electrical Contractors', 'Electrical Contractors', 1, NULL, '2020-02-20 12:30:36', NULL, NULL, 1),
(718, 37, 'Coaching Classes & Tutorials', 'Coaching Classes & Tutorials', 1, NULL, '2020-02-20 12:31:34', NULL, NULL, 1),
(719, 33, 'Flooring Contractors', 'Flooring Contractors', 1, NULL, '2020-02-20 12:31:40', NULL, NULL, 1),
(720, 40, 'Orchestra Bands', 'Celebration service', 1215, NULL, '2020-02-20 12:32:02', NULL, NULL, 1),
(721, 33, 'Furniture Contractors', 'Furniture Contractors', 1, NULL, '2020-02-20 12:32:23', NULL, NULL, 1),
(722, 34, 'Software Classes', 'Language Classes', 1, NULL, '2020-02-20 12:32:26', NULL, NULL, 1),
(723, 37, 'Colleges', 'Colleges', 1, NULL, '2020-02-20 12:33:59', NULL, NULL, 1),
(724, 33, 'Painting Contractors', 'Painting Contractors', 1, NULL, '2020-02-20 12:34:01', NULL, NULL, 1),
(725, 40, 'Photographers', 'Celebration service', 1215, NULL, '2020-02-20 12:34:51', NULL, NULL, 1),
(726, 34, 'Typing Institutes', 'Language Classes', 1, NULL, '2020-02-20 12:34:59', NULL, NULL, 1),
(727, 33, 'Plumbing Contractors', 'Plumbing Contractors', 1, NULL, '2020-02-20 12:35:20', NULL, NULL, 1),
(728, 40, 'Purohits', 'Celebration service', 1215, NULL, '2020-02-20 12:35:58', NULL, NULL, 1),
(729, 37, 'Language Classes', 'Language Classes', 1, NULL, '2020-02-20 12:36:06', NULL, NULL, 1),
(730, 52, 'Fabrication', 'All', 1236, NULL, '2020-02-20 12:37:00', NULL, NULL, 1),
(731, 37, 'Music Classes', 'Music Classes', 1, NULL, '2020-02-20 12:37:25', NULL, NULL, 1),
(732, 52, 'Goldsmiths', 'All', 1236, NULL, '2020-02-20 12:37:38', NULL, NULL, 1),
(733, 40, 'Sound System On Hire', 'Celebration service', 1215, NULL, '2020-02-20 12:37:44', NULL, NULL, 1),
(734, 52, 'Industrial workshops', 'All', 1236, NULL, '2020-02-20 12:38:15', NULL, NULL, 1),
(735, 37, 'Painting Classes', 'Painting Classes', 1, NULL, '2020-02-20 12:38:18', NULL, NULL, 1),
(736, 38, 'Animal Care', 'Pet Care', 1, NULL, '2020-02-20 12:39:19', NULL, NULL, 1),
(737, 26, 'Fancy Stores', 'All', 1236, NULL, '2020-02-20 12:39:24', NULL, NULL, 1),
(738, 36, 'Tent House', 'Celebration service', 1215, NULL, '2020-02-20 12:39:32', NULL, NULL, 1),
(739, 37, 'Photography Classes', 'Photography Classes', 1, NULL, '2020-02-20 12:39:46', NULL, NULL, 1),
(740, 26, 'Footwear', 'All', 1236, NULL, '2020-02-20 12:40:25', NULL, NULL, 1),
(741, 26, 'Fruit Shops', 'All', 1236, NULL, '2020-02-20 12:40:54', NULL, NULL, 1),
(742, 26, 'Furniture shops', 'All', 1236, NULL, '2020-02-20 12:41:19', NULL, NULL, 1),
(743, 26, 'Gift Shops', 'All', 1236, NULL, '2020-02-20 12:41:46', NULL, NULL, 1),
(744, 37, 'Schools', 'Schools', 1, NULL, '2020-02-20 12:41:56', NULL, NULL, 1),
(745, 38, 'Birds', 'Pet Care', 1, NULL, '2020-02-20 12:42:11', NULL, NULL, 1),
(746, 26, 'Gold Shops', 'All', 1236, NULL, '2020-02-20 12:43:47', NULL, NULL, 1),
(747, 37, 'Soft Skill & Image Building', 'Soft Skill & Image Building', 1, NULL, '2020-02-20 12:43:49', NULL, NULL, 1),
(748, 38, 'Dogs Food', 'Pet Care', 1, NULL, '2020-02-20 12:44:31', NULL, NULL, 1),
(749, 26, 'Household & kitchen items', 'All', 1236, NULL, '2020-02-20 12:44:47', NULL, NULL, 1),
(750, 26, 'Mobile points', 'All', 1236, NULL, '2020-02-20 12:45:14', NULL, NULL, 1),
(751, 26, 'Pooja stores', 'All', 1236, NULL, '2020-02-20 12:45:48', NULL, NULL, 1),
(752, 26, 'Silver Shops', 'All', 1236, NULL, '2020-02-20 12:46:14', NULL, NULL, 1),
(753, 26, 'Steel shops', 'All', 1236, NULL, '2020-02-20 12:46:43', NULL, NULL, 1),
(754, 26, 'Toy shops', 'All', 1236, NULL, '2020-02-20 12:47:13', NULL, NULL, 1),
(755, 37, 'Training Institutes', 'Training Institutes', 1, NULL, '2020-02-20 12:47:39', NULL, NULL, 1),
(756, 38, 'Dogs Training', 'Pet Care', 1, NULL, '2020-02-20 12:47:58', NULL, NULL, 1),
(757, 28, 'Drivers', 'Drivers', 1, NULL, '2020-02-20 12:48:45', NULL, NULL, 1),
(758, 30, 'Bath Home Decor', 'All', 1236, NULL, '2020-02-20 12:49:15', NULL, NULL, 1),
(759, 28, 'Laundry Services', 'Laundry Services', 1, NULL, '2020-02-20 12:50:29', NULL, NULL, 1),
(760, 30, 'Chimneys', 'All', 1236, NULL, '2020-02-20 12:51:03', NULL, NULL, 1),
(761, 28, 'Pest Control', 'Pest Control', 1, NULL, '2020-02-20 12:51:24', NULL, NULL, 1),
(762, 38, 'Pet Accessories', 'Pet Care', 1, NULL, '2020-02-20 12:51:31', NULL, NULL, 1),
(763, 30, 'Floorings', 'All', 1236, NULL, '2020-02-20 12:53:04', NULL, NULL, 1),
(764, 38, 'Pet Food', 'Pet Care', 1, NULL, '2020-02-20 12:53:12', NULL, NULL, 1),
(765, 28, 'Housekeeping Services', 'Housekeeping Services', 1, NULL, '2020-02-20 12:53:25', NULL, NULL, 1),
(766, 30, 'Furnishing', 'All', 1236, NULL, '2020-02-20 12:54:33', NULL, NULL, 1),
(767, 28, 'Home Garden Services', 'Home Garden Services', 1, NULL, '2020-02-20 12:54:45', NULL, NULL, 1),
(768, 30, 'Furniture', 'All', 1236, NULL, '2020-02-20 12:56:04', NULL, NULL, 1),
(769, 30, 'Gardening Decors', 'All', 1236, NULL, '2020-02-20 12:57:58', NULL, NULL, 1),
(770, 38, 'Pet Shops', 'Pet Care', 1, NULL, '2020-02-20 12:58:46', NULL, NULL, 1),
(771, 23, 'All Dance Classes', 'All Dance Classes', 1, 1, '2020-02-20 12:59:16', '2020-02-20 17:07:34', NULL, 1),
(772, 30, 'Gas Stoves', 'All', 1236, NULL, '2020-02-20 13:00:02', NULL, NULL, 1),
(773, 38, 'Animal Clinic', 'Pet Care', 1, NULL, '2020-02-20 13:00:56', NULL, NULL, 1),
(774, 30, 'Housekeeping', 'All', 1236, NULL, '2020-02-20 13:01:48', NULL, NULL, 1),
(775, 51, 'Animal Transporters', 'Transport Service', 1, NULL, '2020-02-20 13:08:12', NULL, NULL, 1),
(776, 30, 'Kitchen & Dining', 'All', 1236, NULL, '2020-02-20 13:08:56', NULL, NULL, 1),
(777, 30, 'Lamps & Lighting', 'All', 1236, NULL, '2020-02-20 13:11:05', NULL, NULL, 1),
(778, 30, 'Modular Kitchens', 'All', 1236, NULL, '2020-02-20 13:12:05', NULL, NULL, 1),
(779, 51, 'Antiques & Special Care Items', 'Transport Service', 1, NULL, '2020-02-20 13:12:08', NULL, NULL, 1),
(780, 30, 'Swimming Pools', 'All', 1236, NULL, '2020-02-20 13:14:07', NULL, NULL, 1),
(781, 44, 'PG, Hostels and Rooms', 'PG, Hostels and Rooms', 1215, NULL, '2020-02-20 13:14:59', NULL, NULL, 1),
(782, 30, 'Wall Claddings', 'All', 1236, NULL, '2020-02-20 13:15:41', NULL, NULL, 1),
(783, 46, 'Mobile Recharge', 'Mobile Recharge', 1215, NULL, '2020-02-20 13:15:53', NULL, NULL, 1),
(784, 46, 'DTH recharge', 'DTH recharge', 1215, NULL, '2020-02-20 13:16:30', NULL, NULL, 1),
(785, 30, 'Wallpapers', 'All', 1236, NULL, '2020-02-20 13:16:54', NULL, NULL, 1),
(786, 41, 'Baby Care Centers', 'Play Schools', 1, NULL, '2020-02-20 13:17:18', NULL, NULL, 1),
(787, 35, 'AC Room', 'All', 1236, NULL, '2020-02-20 13:18:33', NULL, NULL, 1),
(788, 46, 'REPAIR SERVICE', 'REPAIR SERVICE', 1215, NULL, '2020-02-20 13:19:20', NULL, '2020-02-20 13:19:35', 1),
(789, 41, 'Play Schools', 'Play Schools', 1, NULL, '2020-02-20 13:19:43', NULL, NULL, 1),
(790, 31, 'AC Repair', 'AC Repair', 1215, NULL, '2020-02-20 13:20:04', NULL, NULL, 1),
(791, 31, 'AC Repair', 'AC Repair', 1215, NULL, '2020-02-20 13:20:05', NULL, '2020-02-20 13:20:21', 1),
(792, 31, 'Air Cooler Services', 'Air Cooler Services', 1215, NULL, '2020-02-20 13:20:48', NULL, NULL, 1),
(793, 35, 'Family Room Bookings', 'All', 1236, NULL, '2020-02-20 13:20:50', NULL, NULL, 1),
(794, 41, 'Pre-School', 'Play Schools', 1, NULL, '2020-02-20 13:20:56', NULL, NULL, 1),
(795, 31, 'Camera Services', 'Camera Services', 1215, NULL, '2020-02-20 13:21:53', NULL, NULL, 1),
(796, 51, 'Vehicles Transporters', 'Transport Service', 1, NULL, '2020-02-20 13:22:16', NULL, NULL, 1),
(797, 31, 'Car Repair', 'Car Repair', 1215, NULL, '2020-02-20 13:22:54', NULL, NULL, 1),
(798, 51, 'Plants & Heavy Equipments', 'Transport Service', 1, NULL, '2020-02-20 13:24:25', NULL, NULL, 1),
(799, 31, 'CCTV Camera Services', 'CCTV Camera Services', 1215, NULL, '2020-02-20 13:24:41', NULL, NULL, 1),
(800, 31, 'Computer Hardware Services', 'Computer Hardware Services', 1215, NULL, '2020-02-20 13:25:13', NULL, NULL, 1),
(801, 31, 'Computer Printer Services', 'Computer Printer Services', 1215, NULL, '2020-02-20 13:25:37', NULL, NULL, 1),
(802, 51, 'Low Container Load Freight', 'Transport Service', 1, NULL, '2020-02-20 13:26:00', NULL, NULL, 1),
(803, 31, 'Computer Services', 'Computer Services', 1215, NULL, '2020-02-20 13:26:07', NULL, NULL, 1),
(804, 35, 'For Group of Travellers', 'All', 1236, NULL, '2020-02-20 13:26:08', NULL, NULL, 1),
(805, 31, 'DVD Player Services', 'DVD Player Services', 1215, NULL, '2020-02-20 13:26:32', NULL, NULL, 1),
(806, 35, 'Luxury AC Rooms', 'All', 1236, NULL, '2020-02-20 13:26:34', NULL, NULL, 1),
(807, 35, 'Premium Rooms', 'All', 1236, NULL, '2020-02-20 13:26:58', NULL, NULL, 1),
(808, 31, 'Electric Chimney Services', 'Electric Chimney Services', 1215, NULL, '2020-02-20 13:27:00', NULL, NULL, 1),
(809, 31, 'Elevator Services', 'Elevator Services', 1215, NULL, '2020-02-20 13:27:22', NULL, NULL, 1),
(810, 35, 'Rooms Bookings', 'All', 1236, NULL, '2020-02-20 13:27:32', NULL, NULL, 1),
(811, 31, 'Gas Stove Services', 'Gas Stove Services', 1215, NULL, '2020-02-20 13:28:00', NULL, NULL, 1),
(812, 31, 'Generator Services', 'Generator Services', 1215, NULL, '2020-02-20 13:28:39', NULL, NULL, 1),
(813, 31, 'Geyser Services', 'Geyser Services', 1215, NULL, '2020-02-20 13:29:29', NULL, NULL, 1),
(814, 31, 'Home Theatre Services', 'Home Theatre Services', 1215, NULL, '2020-02-20 13:29:57', NULL, NULL, 1),
(815, 31, 'Inverter Services', 'Inverter Services', 1215, NULL, '2020-02-20 13:30:24', NULL, NULL, 1),
(816, 31, 'Laptop Services', 'Laptop Services', 1215, NULL, '2020-02-20 13:31:17', NULL, NULL, 1),
(817, 31, 'Microwave Oven Services', 'Microwave Oven Services', 1215, NULL, '2020-02-20 13:32:57', NULL, NULL, 1),
(818, 31, 'Mobile Phone Services', 'Mobile Phone Services', 1215, NULL, '2020-02-20 13:33:32', NULL, NULL, 1),
(819, 31, 'Motorcycle Services', 'Motorcycle Services', 1215, NULL, '2020-02-20 13:34:13', NULL, NULL, 1),
(820, 31, 'Refrigerator Services', 'Refrigerator Services', 1215, NULL, '2020-02-20 13:34:42', NULL, NULL, 1),
(821, 51, 'Junk Transporters', 'Transport Service', 1, NULL, '2020-02-20 13:34:56', NULL, NULL, 1),
(822, 31, 'Ro Water Purifier Services', 'Ro Water Purifier Services', 1215, NULL, '2020-02-20 13:35:26', NULL, NULL, 1),
(823, 31, 'Scooter Services', 'Scooter Services', 1215, NULL, '2020-02-20 13:36:25', NULL, NULL, 1),
(824, 31, 'Sewing Machine Services', 'Sewing Machine Services', 1215, NULL, '2020-02-20 13:37:01', NULL, NULL, 1),
(825, 31, 'Sofa Set repairs', 'Sofa Set repairs', 1215, NULL, '2020-02-20 13:37:41', NULL, NULL, 1),
(826, 31, 'TV repair', 'TV repair', 1215, NULL, '2020-02-20 13:38:05', NULL, NULL, 1),
(827, 31, 'Washing Machine repair', 'Washing Machine repair', 1215, NULL, '2020-02-20 13:38:27', NULL, NULL, 1),
(828, 31, 'Water Purifier services', 'Water Purifier services', 1215, NULL, '2020-02-20 13:38:56', NULL, NULL, 1),
(829, 31, 'Wrist Watch repairer', 'Wrist Watch repairer', 1215, NULL, '2020-02-20 13:39:17', NULL, NULL, 1),
(830, 39, 'CC Cameras', 'CC Cameras', 1215, NULL, '2020-02-20 13:39:41', NULL, NULL, 1),
(831, 51, 'Household Goods', 'Transport Service', 1, NULL, '2020-02-20 13:39:48', NULL, NULL, 1),
(832, 51, 'Household Goods', 'Transport Service', 1, NULL, '2020-02-20 13:39:48', NULL, NULL, 1),
(833, 39, 'Security Agencies', 'Security Agencies', 1215, NULL, '2020-02-20 13:40:12', NULL, NULL, 1),
(834, 39, 'Security Alarms', 'Security Alarms', 1215, NULL, '2020-02-20 13:40:46', NULL, NULL, 1),
(835, 39, 'Security Keys', 'Security Keys', 1215, NULL, '2020-02-20 13:41:38', NULL, NULL, 1),
(836, 39, 'Security Store wells', 'Security Store wells', 1215, NULL, '2020-02-20 13:42:05', NULL, NULL, 1),
(837, 45, 'Branded Shopping', 'Branded Shopping', 1215, NULL, '2020-02-20 13:42:43', NULL, NULL, 1),
(838, 45, 'Shopping For Bridals', 'Shopping For Bridals', 1215, NULL, '2020-02-20 13:43:16', NULL, NULL, 1),
(839, 45, 'Shopping For Kids', 'Shopping For Kids', 1215, NULL, '2020-02-20 13:43:37', NULL, NULL, 1),
(840, 45, 'Shopping For Men', 'Shopping For Men', 1215, NULL, '2020-02-20 13:44:05', NULL, NULL, 1),
(841, 45, 'Shopping For Women', 'Shopping For Women', 1215, NULL, '2020-02-20 13:44:27', NULL, NULL, 1),
(842, 45, 'Shopping Malls', 'Shopping Malls', 1215, NULL, '2020-02-20 13:44:52', NULL, NULL, 1),
(843, 48, 'Badminton', 'Badminton', 1215, NULL, '2020-02-20 13:45:22', NULL, NULL, 1),
(844, 48, 'Cricket', 'Cricket', 1215, NULL, '2020-02-20 13:45:46', NULL, NULL, 1),
(845, 48, 'Football', 'Football', 1215, NULL, '2020-02-20 13:46:08', NULL, NULL, 1),
(846, 48, 'Tennis', 'Tennis', 1215, NULL, '2020-02-20 13:46:53', NULL, NULL, 1),
(847, 51, 'Full Container Load Freight', 'Transport Service', 1, NULL, '2020-02-20 13:47:22', NULL, NULL, 1),
(848, 48, 'Hockey', 'Hockey', 1215, NULL, '2020-02-20 13:47:31', NULL, NULL, 1),
(849, 48, 'Skating', 'Skating', 1215, NULL, '2020-02-20 13:47:56', NULL, NULL, 1),
(850, 48, 'Cycling', 'Cycling', 1215, NULL, '2020-02-20 13:48:21', NULL, NULL, 1),
(851, 48, 'Chess', 'Chess', 1215, NULL, '2020-02-20 13:49:05', NULL, NULL, 1),
(852, 51, 'Food & Agriculture Products', 'Transport Service', 1, NULL, '2020-02-20 13:49:41', NULL, NULL, 1),
(853, 48, 'Sport Wear Shop', 'Sport Wear Shop', 1215, NULL, '2020-02-20 13:49:46', NULL, NULL, 1),
(854, 51, 'Daily good Transporters', 'Transport Service', 1, NULL, '2020-02-20 13:50:55', NULL, NULL, 1),
(855, 51, 'Business & Industrial Goods', 'Transport Service', 1, NULL, '2020-02-20 13:55:36', NULL, NULL, 1),
(856, 32, 'Baby Food', 'Kids Care', 1, NULL, '2020-02-20 14:06:25', NULL, NULL, 1),
(857, 32, 'Baby Sitters', 'Kids Care', 1, NULL, '2020-02-20 14:08:20', NULL, NULL, 1),
(858, 7, 'Industrial Hardware', 'all types of Industrial Hardware', 1, NULL, '2020-02-20 14:08:50', NULL, NULL, 1),
(859, 32, 'Baby Sleep', 'Kids Care', 1, NULL, '2020-02-20 14:10:59', NULL, NULL, 1),
(860, 42, 'Welding Equipment & Machines', 'all Welding Equipment & Machines', 1, NULL, '2020-02-20 14:11:16', NULL, NULL, 1),
(861, 49, 'Car & Bike Insurance', 'all Car & Bike Insurance', 1, NULL, '2020-02-20 14:12:31', NULL, NULL, 1),
(862, 32, 'Bath Care', 'Kids Care', 1, NULL, '2020-02-20 14:12:52', NULL, NULL, 1),
(863, 49, 'Crop Insurance', 'all types of Crop Insurance', 1, NULL, '2020-02-20 14:13:36', NULL, NULL, 1),
(864, 49, 'Health Insurance', 'all Health Insurance', 1, NULL, '2020-02-20 14:14:36', NULL, NULL, 1),
(865, 32, 'Books', 'Kids Care', 1, NULL, '2020-02-20 14:14:48', NULL, NULL, 1),
(866, 49, 'Industrial Insurance', 'all Industrial Insurance', 1, NULL, '2020-02-20 14:15:34', NULL, NULL, 1),
(867, 32, 'Breast Feeding Accessories', 'Kids Care', 1, NULL, '2020-02-20 14:15:51', NULL, NULL, 1),
(868, 49, 'Insurance Agents', 'all Insurance Agents', 1, NULL, '2020-02-20 14:17:31', NULL, NULL, 1),
(869, 32, 'Clothes', 'Kids Care', 1, NULL, '2020-02-20 14:17:44', NULL, NULL, 1),
(870, 32, 'Creams', 'Kids Care', 1, NULL, '2020-02-20 14:19:43', NULL, NULL, 1),
(871, 32, 'Daipers', 'Kids Care', 1, NULL, '2020-02-20 14:21:13', NULL, NULL, 1),
(872, 32, 'Food Feeding Accessories', 'Kids Care', 1, NULL, '2020-02-20 14:38:19', NULL, NULL, 1),
(873, 32, 'footware', 'Kids Care', 1, NULL, '2020-02-20 14:39:44', NULL, NULL, 1),
(874, 32, 'Grooming', 'Kids Care', 1, NULL, '2020-02-20 14:40:43', NULL, NULL, 1),
(875, 32, 'Health', 'Kids Care', 1, NULL, '2020-02-20 14:42:55', NULL, NULL, 1),
(876, 32, 'Maternity Wear', 'Kids Care', 1, NULL, '2020-02-20 14:44:39', NULL, NULL, 1),
(877, 32, 'Safety Toys', 'Kids Care', 1, NULL, '2020-02-20 14:46:04', NULL, NULL, 1),
(878, 32, 'Travel Accessories', 'Kids Care', 1, NULL, '2020-02-20 14:47:53', NULL, NULL, 1),
(879, 53, 'Web Designers', 'all Web Designers', 1, NULL, '2020-02-20 14:48:08', NULL, NULL, 1),
(880, 32, 'Utensils', 'Kids Care', 1, NULL, '2020-02-20 14:49:08', NULL, NULL, 1),
(881, 32, 'Wipes', 'Kids Care', 1, NULL, '2020-02-20 14:51:13', NULL, NULL, 1),
(882, 53, 'Cyber Cafes', 'all Cyber Cafes', 1, NULL, '2020-02-20 14:52:04', NULL, NULL, 1),
(883, 50, 'Residence', 'all Residence', 1, NULL, '2020-02-20 14:53:05', NULL, NULL, 1),
(884, 50, 'Interior Furnishing Contractors', 'all Interior Furnishing Contractors', 1, NULL, '2020-02-20 14:53:59', NULL, NULL, 1),
(885, 50, 'Interior Designer Institutes', 'all Interior Designer Institutes', 1, NULL, '2020-02-20 14:54:56', NULL, NULL, 1),
(886, 50, 'Interior Decorators', 'all Interior Decorators', 1, NULL, '2020-02-20 14:55:49', NULL, NULL, 1),
(887, 50, 'Commercial', 'all Commercial', 1, NULL, '2020-02-20 14:56:23', NULL, NULL, 1),
(888, 50, 'Architects', 'all Architects', 1, NULL, '2020-02-20 14:57:10', NULL, NULL, 1),
(889, 23, 'All Music Classes', 'All Music Classes', 1, NULL, '2020-02-20 17:11:25', NULL, NULL, 1),
(890, 23, 'Bollywood & Tollywood', 'Bollywood & Tollywood', 1, NULL, '2020-02-20 17:14:32', NULL, NULL, 1),
(891, 23, 'Classic Music Classes', 'Classic Music Classes', 1, NULL, '2020-02-20 17:18:15', NULL, NULL, 1),
(892, 23, 'Classical Dance', 'Classical Dance', 1, NULL, '2020-02-20 17:19:55', NULL, NULL, 1),
(893, 23, 'Hip Hop', 'Hip Hop', 1, NULL, '2020-02-20 17:21:54', NULL, NULL, 1),
(894, 23, 'Salsa', 'Salsa', 1, NULL, '2020-02-20 17:23:53', NULL, NULL, 1),
(895, 23, 'Vocal Music Classes', 'Vocal Music Classes', 1, NULL, '2020-02-20 17:27:40', NULL, NULL, 1),
(896, 23, 'Western Music Classes', 'Western Music Classes', 1, NULL, '2020-02-20 17:28:38', NULL, NULL, 1),
(897, 36, 'All Caterers', 'All Caterers', 1, NULL, '2020-02-20 17:29:52', NULL, NULL, 1),
(898, 36, 'Andhra', 'Andhra', 1, NULL, '2020-02-20 17:31:42', NULL, NULL, 1),
(899, 36, 'Birthday Party Caterers', 'Birthday Party Caterers', 1, NULL, '2020-02-20 17:32:46', NULL, NULL, 1),
(900, 36, 'Brahmin', 'Brahmin', 1, NULL, '2020-02-20 17:37:04', NULL, NULL, 1),
(901, 36, 'Chinese', 'Chinese', 1, NULL, '2020-02-20 17:39:21', NULL, NULL, 1),
(902, 36, 'Continental', 'Continental', 1, NULL, '2020-02-20 17:40:46', NULL, NULL, 1),
(903, 36, 'Hyderabadi', 'Hyderabadi', 1, NULL, '2020-02-20 17:42:58', NULL, NULL, 1),
(904, 36, 'Italian', 'Italian', 1, NULL, '2020-02-20 17:47:09', NULL, NULL, 1),
(905, 36, 'Jain Catering', 'Jain Catering', 1, NULL, '2020-02-20 17:50:17', NULL, NULL, 1),
(906, 36, 'Maharashtrian', 'Maharashtrian', 1, NULL, '2020-02-20 17:51:45', NULL, NULL, 1),
(907, 36, 'Marwari', 'Marwari', 1, NULL, '2020-02-20 17:53:13', NULL, NULL, 1),
(908, 36, 'Mughlai', 'Mughlai', 1, NULL, '2020-02-20 17:55:11', NULL, NULL, 1),
(909, 36, 'Multi-cuisine', 'Multi-cuisine', 1, NULL, '2020-02-20 17:56:19', NULL, NULL, 1),
(910, 36, 'Non-Veg', 'Non-Veg', 1, NULL, '2020-02-20 18:00:02', NULL, NULL, 1),
(911, 36, 'North Indian', 'North Indian', 1, NULL, '2020-02-20 18:00:40', NULL, NULL, 1),
(912, 36, 'Office Caterers', 'Office Caterers', 1, NULL, '2020-02-20 18:05:13', NULL, NULL, 1),
(913, 36, 'Party Caterers', 'Party Caterers', 1, NULL, '2020-02-20 18:07:05', NULL, NULL, 1),
(914, 36, 'Punjabi', 'Punjabi', 1, NULL, '2020-02-20 18:11:24', NULL, NULL, 1),
(915, 36, 'South Indian', 'South Indian', 1, NULL, '2020-02-20 18:15:06', NULL, NULL, 1),
(916, 36, 'Veg Catering', 'Veg Catering', 1, NULL, '2020-02-20 18:17:28', NULL, NULL, 1),
(917, 36, 'Wedding Caterers', 'Wedding Caterers', 1, NULL, '2020-02-20 18:23:30', NULL, NULL, 1),
(918, 25, 'Chest Specialists', 'Chest Specialists', 1, NULL, '2020-02-20 18:29:34', NULL, NULL, 1),
(919, 25, 'Chiropractors', 'Chiropractors', 1, NULL, '2020-02-20 18:35:40', NULL, NULL, 1),
(920, 25, 'Clinical Nutritionists', 'Clinical Nutritionists', 1, NULL, '2020-02-20 18:41:26', NULL, NULL, 1),
(921, 25, 'Clinical Psychologists', 'Clinical Psychologists', 1, NULL, '2020-02-20 18:44:25', NULL, NULL, 1),
(922, 25, 'Cosmetic Surgeons', 'Cosmetic Surgeons', 1, NULL, '2020-02-20 18:46:28', NULL, NULL, 1),
(923, 25, 'Cosmetologists', 'Cosmetologists', 1, NULL, '2020-02-20 18:52:12', NULL, NULL, 1),
(924, 25, 'Dental Surgeons', 'Dental Surgeons', 1, NULL, '2020-02-20 18:54:08', NULL, NULL, 1),
(925, 25, 'Dentists', 'Dentists', 1, NULL, '2020-02-20 18:55:38', NULL, NULL, 1),
(926, 25, 'Hair Transplant Surgeons', 'Doctor-N-Doctor', 1, NULL, '2020-02-21 03:55:32', NULL, NULL, 1),
(927, 25, 'Hearing Care Clinics', 'Doctor-N-Doctor', 1, NULL, '2020-02-21 03:58:35', NULL, NULL, 1),
(928, 25, 'Height Specialists', 'Doctor-N-Doctor', 1, NULL, '2020-02-21 04:01:27', NULL, NULL, 1),
(929, 25, 'Hematologists', 'Doctor-N-Doctor', 1, NULL, '2020-02-21 04:02:59', NULL, NULL, 1),
(930, 25, 'Hepatitis Doctors', 'Doctor-N-Doctor', 1, NULL, '2020-02-21 04:06:46', NULL, NULL, 1),
(931, 25, 'Hepatologists', 'Doctor-N-Doctor', 1, NULL, '2020-02-21 04:08:05', NULL, NULL, 1),
(932, 25, 'Hernia Surgeons', 'Doctor-N-Doctor', 1, NULL, '2020-02-21 04:12:28', NULL, NULL, 1),
(933, 25, 'Homeopathic Doctors', 'Doctor-N-Doctor', 1, NULL, '2020-02-21 04:13:48', NULL, NULL, 1),
(934, 25, 'Homeopathic Doctors for Skin Treatment', 'Doctor-N-Doctor', 1, NULL, '2020-02-21 04:16:59', NULL, NULL, 1),
(935, 25, 'Hypnotherapists Infertility Doctors', 'Doctor-N-Doctor', 1, NULL, '2020-02-21 04:19:54', NULL, NULL, 1),
(936, 25, 'Knee Replacement Surgeons LIC Panel Doctors', 'Doctor-N-Doctor', 1, NULL, '2020-02-21 04:23:15', NULL, NULL, 1),
(937, 25, 'Laparoscopic Surgeons', 'Doctor-N-Doctor', 1, NULL, '2020-02-21 04:24:46', NULL, NULL, 1),
(938, 25, 'Lasik Eye Surgeons', 'Doctor-N-Doctor', 1, NULL, '2020-02-21 04:29:52', NULL, '2020-02-21 04:32:15', 1),
(939, 25, 'Lasik Eye Surgeons', 'Doctor-N-Doctor', 1, NULL, '2020-02-21 04:37:27', NULL, NULL, 1),
(940, 25, 'Dermatologists', 'Dermatologists', 1, NULL, '2020-02-21 04:38:09', NULL, NULL, 1),
(941, 25, 'Dermatosurgeons', 'Dermatosurgeons', 1, NULL, '2020-02-21 04:40:20', NULL, NULL, 1),
(942, 25, '24 Hours Dentists', '24 Hours Dentists Available', 1, NULL, '2020-02-21 04:40:26', NULL, NULL, 1),
(943, 25, 'Diabetologists', 'Diabetologists', 1, NULL, '2020-02-21 04:41:37', NULL, NULL, 1),
(944, 25, '24 Hours Veterinary Doctors', '24 Hours Veterinary Doctors Available', 1, NULL, '2020-02-21 04:41:42', NULL, NULL, 1),
(945, 25, 'Acupressure Therapists For Home Visit', 'Acupressure Therapists For Home Visit', 1, NULL, '2020-02-21 04:43:07', NULL, NULL, 1),
(946, 25, 'Dietitians', 'Dietitians', 1, NULL, '2020-02-21 04:43:23', NULL, NULL, 1),
(947, 25, 'Acupuncture Doctors', 'Acupuncture Doctors', 1, NULL, '2020-02-21 04:44:20', NULL, NULL, 1),
(948, 53, 'internet service provider', 'all internet service providers', 1, NULL, '2020-02-21 04:44:23', NULL, NULL, 1),
(949, 25, 'Doctors Available 24 Hours On Phone', 'Doctors Available 24 Hours On Phone', 1, NULL, '2020-02-21 04:45:28', NULL, NULL, 1),
(950, 25, 'Alcohol De-Addiction', 'Alcohol De-Addiction', 1, NULL, '2020-02-21 04:45:28', NULL, NULL, 1),
(951, 25, 'Liposuction Doctors', 'Doctor-N-Doctor', 1, NULL, '2020-02-21 04:47:31', NULL, NULL, 1);
INSERT INTO `sub_categories` (`id`, `cat_id`, `name`, `desc`, `created_user_id`, `updated_user_id`, `created_at`, `updated_at`, `deleted_at`, `status`) VALUES
(952, 25, 'Doctors for Allergy', 'Doctors for Allergy', 1, NULL, '2020-02-21 04:47:45', NULL, NULL, 1),
(953, 25, 'Allopathic Doctors', 'Allopathic Doctors Available', 1, NULL, '2020-02-21 04:48:08', NULL, NULL, 1),
(954, 25, 'Migraine Therapists', 'Doctor-N-Doctor', 1, NULL, '2020-02-21 04:48:58', NULL, NULL, 1),
(955, 25, 'Andrologists', 'Andrologists', 1, NULL, '2020-02-21 04:49:03', NULL, NULL, 1),
(956, 25, 'Doctors for Arthritis Treatment', 'Doctors for Arthritis Treatment', 1, NULL, '2020-02-21 04:50:36', NULL, NULL, 1),
(957, 25, 'Appendix Doctors', 'Appendix Doctors', 1, NULL, '2020-02-21 04:50:39', NULL, NULL, 1),
(958, 25, 'Naturopathic Doctors', 'Doctor-N-Doctor', 1, NULL, '2020-02-21 04:51:21', NULL, NULL, 1),
(959, 25, 'Audiologists', 'Audiologists', 1, NULL, '2020-02-21 04:51:37', NULL, NULL, 1),
(960, 25, 'Ayurvedic Doctors', 'Ayurvedic Doctors', 1, NULL, '2020-02-21 04:52:50', NULL, NULL, 1),
(961, 25, 'Pathologists', 'Doctor-N-Doctor', 1, NULL, '2020-02-21 04:53:24', NULL, NULL, 1),
(962, 25, 'Doctors for Asthma Treatment', 'Doctors for Asthma Treatment', 1, NULL, '2020-02-21 04:53:34', NULL, NULL, 1),
(963, 25, 'Neonatologists', 'Doctor-N-Doctor', 1, NULL, '2020-02-21 04:53:39', NULL, NULL, 1),
(964, 25, 'Ayurvedic Doctors For Hair Fall Treatment', 'Ayurvedic Doctors For Hair Fall Treatment', 1, NULL, '2020-02-21 04:54:01', NULL, NULL, 1),
(965, 25, 'Ayurvedic Doctors for Piles Treatment', 'Ayurvedic Doctors for Piles Treatment', 1, NULL, '2020-02-21 04:55:01', NULL, NULL, 1),
(966, 25, 'Doctors for Breast Cancer Treatment', 'Doctors for Breast Cancer Treatment', 1, NULL, '2020-02-21 04:55:55', NULL, NULL, 1),
(967, 25, 'Doctors for Breast Enlargement', 'Doctors for Breast Enlargement', 1, NULL, '2020-02-21 05:01:07', NULL, NULL, 1),
(968, 25, 'Ayurvedic Doctors For Skin Treatment', 'Ayurvedic Doctors For Skin Treatment', 1, NULL, '2020-02-21 05:01:44', NULL, NULL, 1),
(969, 25, 'Vascular Surgeons', 'Doctor-N-Doctor', 1, NULL, '2020-02-21 05:01:46', NULL, NULL, 1),
(970, 25, 'Pediatric Cardiologists', 'Doctor-N-Doctor', 1, NULL, '2020-02-21 05:02:29', NULL, NULL, 1),
(971, 25, 'Psychiatrists', 'Doctor-N-Doctor', 1, NULL, '2020-02-21 05:03:10', NULL, NULL, 1),
(972, 25, 'Doctors for Breast Implant', 'All', 1, NULL, '2020-02-21 05:04:04', NULL, NULL, 1),
(973, 25, 'Podiatrists', 'Doctor-N-Doctor', 1, NULL, '2020-02-21 05:04:40', NULL, NULL, 1),
(974, 25, 'Doctors for Burn Surgery', 'All', 1, NULL, '2020-02-21 05:04:48', NULL, NULL, 1),
(975, 25, 'Doctors for Cataract Operation', 'All', 1, NULL, '2020-02-21 05:05:21', NULL, NULL, 1),
(976, 25, 'Ayurvedic Sexologists', 'Ayurvedic Sexologists', 1, NULL, '2020-02-21 05:05:52', NULL, NULL, 1),
(977, 25, 'Doctors for Colonoscopy', 'All', 1, NULL, '2020-02-21 05:06:47', NULL, NULL, 1),
(978, 25, 'Bariatric Surgeons', 'Bariatric Surgeons', 1, NULL, '2020-02-21 05:06:53', NULL, NULL, 1),
(979, 25, 'Breast Specialists', 'Breast Specialists', 1, NULL, '2020-02-21 05:08:55', NULL, NULL, 1),
(980, 25, 'Piles Doctors', 'Doctor-N-Doctor', 1, NULL, '2020-02-21 05:09:12', NULL, NULL, 1),
(981, 25, 'Pediatric Dermatologists', 'Doctor-N-Doctor', 1, NULL, '2020-02-21 05:09:40', NULL, NULL, 1),
(982, 25, 'Cardiac Surgeons', 'Cardiac Surgeons Available', 1, NULL, '2020-02-21 05:10:22', NULL, NULL, 1),
(983, 25, 'Physiotherapists For Home Visit', 'Doctor-N-Doctor', 1, NULL, '2020-02-21 05:10:36', NULL, NULL, 1),
(984, 25, 'Pediatric ENT Specialists', 'Doctor-N-Doctor', 1, NULL, '2020-02-21 05:11:41', NULL, NULL, 1),
(985, 25, 'Cardiologists', 'Cardiologists', 1, NULL, '2020-02-21 05:12:21', NULL, NULL, 1),
(986, 25, 'Physiotherapists', 'Doctor-N-Doctor', 1, NULL, '2020-02-21 05:12:28', NULL, NULL, 1),
(987, 25, 'Doctors for Gallstone Removal', 'All', 1, NULL, '2020-02-21 05:12:33', NULL, NULL, 1),
(988, 25, 'Peripheral Nerve Surgeons', 'Doctor-N-Doctor', 1, NULL, '2020-02-21 05:13:28', NULL, NULL, 1),
(989, 25, 'Pediatricians', 'Doctor-N-Doctor', 1, NULL, '2020-02-21 05:14:27', NULL, NULL, 1),
(990, 25, 'Doctors for Hair Loss Treatment', 'All', 1, NULL, '2020-02-21 05:14:59', NULL, NULL, 1),
(991, 25, 'Doctors for Hernia', 'All', 1, NULL, '2020-02-21 05:17:16', NULL, NULL, 1),
(992, 25, 'Pediatric Gastroenterologists', 'Doctor-N-Doctor', 1, NULL, '2020-02-21 05:17:25', NULL, NULL, 1),
(993, 25, 'Doctors for HIV Aids Treatment', 'All', 1, NULL, '2020-02-21 05:18:59', NULL, NULL, 1),
(994, 25, 'Doctors for Jaundice', 'All', 1, NULL, '2020-02-21 05:22:36', NULL, NULL, 1),
(995, 25, 'Pediatric Neurologists', 'Doctor-N-Doctor', 1, NULL, '2020-02-21 05:23:01', NULL, NULL, 1),
(996, 25, 'Doctors for Kidney Stone Laser Surgery', 'All', 1, NULL, '2020-02-21 05:25:49', NULL, NULL, 1),
(997, 25, 'Doctors for Kidney Transplant', 'All', 1, NULL, '2020-02-21 05:27:28', NULL, NULL, 1),
(998, 25, 'Pediatric Ophthalmologists', 'Doctor-N-Doctor', 1, NULL, '2020-02-21 05:27:43', NULL, NULL, 1),
(999, 25, 'Doctors for Laser Eye Surgery', 'All', 1, NULL, '2020-02-21 05:28:24', NULL, NULL, 1),
(1000, 25, 'Doctors For Mental Illness', 'All', 1, NULL, '2020-02-21 05:32:08', NULL, NULL, 1),
(1001, 25, 'Doctors for Neck Surgery', 'All', 1, NULL, '2020-02-21 05:34:12', NULL, NULL, 1),
(1002, 25, 'Pediatric Orthopedics', 'Doctor-N-Doctor', 1, NULL, '2020-02-21 05:34:51', NULL, NULL, 1),
(1003, 25, 'Doctors for Pain Relief', 'All', 1, NULL, '2020-02-21 05:35:12', NULL, NULL, 1),
(1004, 25, 'Pediatric Physiotherapists', 'Doctor-N-Doctor', 1, NULL, '2020-02-21 05:36:28', NULL, NULL, 1),
(1005, 25, 'Doctors for Paralysis Treatment', 'All', 1, NULL, '2020-02-21 05:36:54', NULL, NULL, 1),
(1006, 25, 'Doctors for Respiratory Disease', 'All', 1, NULL, '2020-02-21 05:41:55', NULL, NULL, 1),
(1007, 25, 'Nephrologists', 'Nephrologists', 1, NULL, '2020-02-21 05:43:08', NULL, NULL, 1),
(1008, 25, 'Neuro Physicians', 'Neuro Physicians', 1, NULL, '2020-02-21 05:43:32', NULL, NULL, 1),
(1009, 25, 'Neurologists', 'Neurologists', 1, NULL, '2020-02-21 05:43:58', NULL, NULL, 1),
(1010, 25, 'Neurosurgeons', 'Neurosurgeons', 1, NULL, '2020-02-21 05:44:37', NULL, NULL, 1),
(1011, 25, 'Occupational Therapists', 'Occupational Therapists', 1, NULL, '2020-02-21 05:45:07', NULL, NULL, 1),
(1012, 25, 'On Call Doctors', 'On Call Doctors', 1, NULL, '2020-02-21 05:45:33', NULL, NULL, 1),
(1013, 25, 'On Call Gynecologists', 'On Call Gynecologists', 1, NULL, '2020-02-21 05:46:01', NULL, NULL, 1),
(1014, 25, 'Pediatric Psychiatrist', 'Doctor-N-Doctor', 1, NULL, '2020-02-21 05:46:03', NULL, NULL, 1),
(1015, 25, 'Gynecologist’s & Obstetricians', 'alall Gynecologist’s & Obstetricians', 1, NULL, '2020-02-21 05:46:23', NULL, NULL, 1),
(1016, 25, 'On Call Pediatricians', 'On Call Pediatricians', 1, NULL, '2020-02-21 05:46:28', NULL, NULL, 1),
(1017, 25, 'On Call Veterinary Doctors', 'On Call Veterinary Doctors', 1, NULL, '2020-02-21 05:46:58', NULL, NULL, 1),
(1018, 25, 'Oncologist Surgeons', 'Oncologist Surgeons', 1, NULL, '2020-02-21 05:47:20', NULL, NULL, 1),
(1019, 25, 'Gynecologic Oncologists', 'all  Gynecologic Oncologists', 1, NULL, '2020-02-21 05:47:23', NULL, NULL, 1),
(1020, 25, 'Oncologists', 'Oncologists', 1, NULL, '2020-02-21 05:48:01', NULL, NULL, 1),
(1021, 25, 'Pediatric Surgeons', 'Doctor-N-Doctor', 1, NULL, '2020-02-21 05:48:26', NULL, NULL, 1),
(1022, 25, 'General Surgeons', 'all General Surgeons', 1, NULL, '2020-02-21 05:48:32', NULL, NULL, 1),
(1023, 25, 'Online Doctors', 'Online Doctors', 1, NULL, '2020-02-21 05:48:51', NULL, NULL, 1),
(1024, 25, 'General Physicians', 'all General Physicians', 1, NULL, '2020-02-21 05:49:47', NULL, NULL, 1),
(1025, 25, 'Opticians', 'Opticians', 1, NULL, '2020-02-21 05:49:48', NULL, NULL, 1),
(1026, 25, 'Oral Oncologists', 'Oral Oncologists', 1, NULL, '2020-02-21 05:50:15', NULL, NULL, 1),
(1027, 25, 'Orthodontists', 'Orthodontists', 1, NULL, '2020-02-21 05:50:38', NULL, NULL, 1),
(1028, 25, 'Gastrointestinal Surgeons', 'all  Gastrointestinal Surgeons', 1, NULL, '2020-02-21 05:50:54', NULL, NULL, 1),
(1029, 25, 'Orthopedic Doctors', 'Orthopedic Doctors', 1, NULL, '2020-02-21 05:51:09', NULL, NULL, 1),
(1030, 25, 'Paedodontists', 'Paedodontists', 1, NULL, '2020-02-21 05:51:36', NULL, NULL, 1),
(1031, 25, 'Gastroenterologists', 'all  Gastroenterologists', 1, NULL, '2020-02-21 05:51:52', NULL, NULL, 1),
(1032, 25, 'Fistula Surgeons', 'all Fistula Surgeons', 1, NULL, '2020-02-21 05:52:54', NULL, NULL, 1),
(1033, 25, 'Eye Surgeons', 'all  Eye Surgeons', 1, NULL, '2020-02-21 05:53:38', NULL, NULL, 1),
(1034, 25, 'Eye Specialists', 'all Eye Specialists', 1, NULL, '2020-02-21 05:54:18', NULL, NULL, 1),
(1035, 25, 'ESIC Doctors', 'ESIC Doctors', 1, NULL, '2020-02-21 06:08:47', NULL, NULL, 1),
(1036, 25, 'ENT Surgeons', 'ENT Surgeons', 1, NULL, '2020-02-21 06:09:24', NULL, NULL, 1),
(1037, 25, 'ENT Specialists', 'ENT Specialists', 1, NULL, '2020-02-21 06:09:58', NULL, NULL, 1),
(1038, 25, 'Endoscopists', 'Endoscopists', 1, NULL, '2020-02-21 06:10:37', NULL, NULL, 1),
(1039, 25, 'Endocrinologists', 'Endocrinologists', 1, NULL, '2020-02-21 06:11:31', NULL, NULL, 1),
(1040, 25, 'Doctors for Varicose Veins Treatment', 'Doctors for Varicose Veins Treatment', 1, NULL, '2020-02-21 06:30:32', NULL, NULL, 1),
(1041, 25, 'Doctors for Tuberculosis Treatment', 'Doctors for Tuberculosis Treatment', 1, NULL, '2020-02-21 06:31:21', NULL, NULL, 1),
(1042, 25, 'Doctors for Weight Loss Drug De-Addiction Centre', 'Doctors for Weight Loss Drug De-Addiction Centre', 1, NULL, '2020-02-21 06:39:53', NULL, NULL, 1),
(1043, 1, 'RICE BAG', 'HMT RICE', 1, NULL, '2020-05-05 12:37:24', NULL, '2020-05-06 11:09:56', 1),
(1044, 1, 'Dry Fruits', 'Nice Product', 1, NULL, '2020-05-13 12:57:21', NULL, '2020-05-15 22:45:37', 1),
(1045, 1, 'Dry Fruits', 'Nice Product', 1, NULL, '2020-05-15 22:48:19', NULL, '2020-05-17 13:41:12', 1),
(1046, 1, 'Masalas', 'Nice Products', 1, NULL, '2020-05-15 22:51:21', NULL, '2020-05-17 13:40:58', 1),
(1047, 1, 'Pencils & Pens', 'Nice Product', 1, 1, '2020-05-16 14:07:06', '2020-05-16 14:08:34', '2020-05-17 13:40:07', 1),
(1048, 1, 'meat shops', 'Mutton', 1, NULL, '2020-05-17 12:33:22', NULL, '2020-05-17 13:33:21', 1),
(1049, 1, 'cool cake', 'good food', 1, NULL, '2020-05-17 16:45:47', NULL, NULL, 1),
(1050, 1, 'Cakes', 'Nice Product', 1, NULL, '2020-05-17 22:36:20', NULL, NULL, 1),
(1051, 1, 'Breads', 'Good Taste', 1, NULL, '2020-06-16 13:44:00', NULL, NULL, 1),
(1052, 54, 'DECORATIVE FLOWERS', 'FRESH', 1, NULL, '2020-09-12 00:14:35', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `used_promo_codes`
--

CREATE TABLE `used_promo_codes` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `promo_id` int(11) NOT NULL,
  `promo_code` varchar(50) NOT NULL,
  `promo_discount` float NOT NULL,
  `created_user_id` bigint(20) DEFAULT NULL,
  `updated_user_id` bigint(20) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '0=Deleted,1=Active,2=Inactive'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
(1, '192.168.1.28', 'administrator', 'NCA0101', '$2y$08$pu1H.lRnZpAdIFyJfqHRuuraA1ORbGdTjHVJXb4.vcjYBnGVs7SGq', '', 'admin@admin.com', '0.00', '', 'k2XbH2mOA7h8g9wQ2EdRHe36a51b7bfacd0a67f2', 1604757210, NULL, 1268889823, 1660973248, 1, 0, 'Mahesh', 'BT', 'ADMIN', '2134657895', NULL, 1, '2019-09-20 16:59:05', '2021-12-22 11:49:18', NULL, 1),
(2, '223.238.24.242', '8121815502', 'NCU0001', '$2y$08$r95eePlGtOKynIhCV8hnKuMt.a7qnqNEsMUD3ShWFT86.ksnpFbUO', NULL, '', '0.00', NULL, NULL, NULL, NULL, 1601109504, NULL, 1, 0, NULL, NULL, NULL, '8121815502', NULL, NULL, '2020-09-26 08:38:24', NULL, NULL, 1),
(3, '146.196.36.39', 'NCV0001', 'NCV0001', '$2y$08$pu1H.lRnZpAdIFyJfqHRuuraA1ORbGdTjHVJXb4.vcjYBnGVs7SGq', NULL, 'punjabidhaba@flymengo.com', '0.00', NULL, NULL, NULL, NULL, 1601450366, 1622533332, 1, 0, 'punjabi dhaba', NULL, NULL, NULL, NULL, NULL, '2020-09-30 07:19:26', NULL, NULL, 1),
(4, '157.48.183.22', '7036375558', 'NCU0002', '$2y$08$IPnqLx.y3JVV6HOguc5EneweGhqo6sZB2Vvx2K9A62t2Cp3AIsx2m', NULL, '', '0.00', NULL, NULL, NULL, NULL, 1608395436, NULL, 1, 0, NULL, NULL, NULL, '7036375558', NULL, NULL, '2020-12-19 16:30:36', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `users_address`
--

CREATE TABLE `users_address` (
  `id` bigint(50) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `phone` varchar(12) NOT NULL,
  `email` varchar(50) NOT NULL,
  `name` varchar(20) NOT NULL,
  `address` longtext NOT NULL,
  `location_id` int(11) NOT NULL,
  `created_user_id` bigint(20) DEFAULT NULL,
  `updated_user_id` bigint(20) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '0=deleted,1=Active,2=Inactive'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users_address`
--

INSERT INTO `users_address` (`id`, `user_id`, `phone`, `email`, `name`, `address`, `location_id`, `created_user_id`, `updated_user_id`, `created_at`, `updated_at`, `deleted_at`, `status`) VALUES
(1, 2, '8121815502', '', 'null ', 'Devanakonda, Andhra Pradesh, India', 3, NULL, NULL, '2020-09-26 14:09:01', NULL, NULL, 1),
(2, 2, '8121815502', '', 'null ', 'Hyderabad, Telangana, India', 7, NULL, NULL, '2020-12-05 11:26:21', NULL, NULL, 1),
(3, 4, '7036375558', '', 'null ', 'dentawellgjilan, Gjilan, Kosovo', 8, NULL, NULL, '2020-12-20 12:16:40', NULL, '2020-12-23 18:44:00', 1),
(4, 4, '7036375558', '', 'null ', 'Ameerpet, Hyderabad, Telangana, India', 9, NULL, NULL, '2020-12-20 12:17:11', NULL, '2020-12-23 18:43:56', 1),
(5, 4, '7036375558', '', 'null ', 'Ameerpet, Hyderabad, Telangana, India', 9, NULL, NULL, '2020-12-20 12:17:12', NULL, NULL, 1),
(6, 4, '7036375558', '', 'null ', 'Hyderabad, Telangana, India', 7, NULL, NULL, '2020-12-23 18:44:05', NULL, NULL, 1);

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
-- Table structure for table `user_services`
--

CREATE TABLE `user_services` (
  `id` bigint(20) NOT NULL,
  `vendor_id` bigint(20) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `created_user_id` bigint(20) DEFAULT NULL,
  `updated_user_id` bigint(20) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `vendors_holidays`
--

CREATE TABLE `vendors_holidays` (
  `id` bigint(20) NOT NULL,
  `list_id` bigint(20) NOT NULL,
  `day_id` int(11) NOT NULL,
  `created_user_id` bigint(20) DEFAULT NULL,
  `updated_user_id` bigint(20) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '0 = deleted, 1 = Active, 2 = Inactive'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `vendors_list`
--

CREATE TABLE `vendors_list` (
  `id` bigint(20) NOT NULL,
  `vendor_user_id` bigint(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `unique_id` varchar(20) NOT NULL,
  `location_id` bigint(20) NOT NULL,
  `executive_id` bigint(20) NOT NULL,
  `constituency_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `no_of_banners` int(11) NOT NULL,
  `address` varchar(250) NOT NULL,
  `landmark` varchar(50) NOT NULL,
  `pincode` int(11) NOT NULL,
  `everyday_open_time` time DEFAULT NULL,
  `everyday_close_time` time DEFAULT NULL,
  `holiday_open_time` time DEFAULT NULL,
  `holiday_close_time` time DEFAULT NULL,
  `sounds_like` text NOT NULL,
  `restaurant_status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=Available, 2=Not-Available',
  `label` varchar(50) NOT NULL,
  `rating` float NOT NULL DEFAULT 0.5,
  `preparation_time` int(11) NOT NULL,
  `preparation_type` enum('mins','hours','days','weeks','months') NOT NULL DEFAULT 'mins',
  `desc` longtext NOT NULL,
  `created_user_id` bigint(20) DEFAULT NULL,
  `updated_user_id` bigint(20) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `approved_by` tinyint(4) NOT NULL DEFAULT 1 COMMENT '0 = Executive, 1 = DM, 2 = Manager, 3 = Admin',
  `status` tinyint(4) NOT NULL DEFAULT 2 COMMENT '0 = deleted, 1 = Active, 2 = Inactive'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `vendors_list`
--

INSERT INTO `vendors_list` (`id`, `vendor_user_id`, `name`, `email`, `unique_id`, `location_id`, `executive_id`, `constituency_id`, `category_id`, `no_of_banners`, `address`, `landmark`, `pincode`, `everyday_open_time`, `everyday_close_time`, `holiday_open_time`, `holiday_close_time`, `sounds_like`, `restaurant_status`, `label`, `rating`, `preparation_time`, `preparation_type`, `desc`, `created_user_id`, `updated_user_id`, `created_at`, `updated_at`, `deleted_at`, `approved_by`, `status`) VALUES
(1, 1, 'Flymengo', 'admin@admin.com', 'NCA0101', 2, 1, 0, 1, 0, 'Kurnool Main road 1', 'Kurnool', 518001, NULL, NULL, NULL, NULL, '', 1, 'The Best Seller', 3.9, 30, 'mins', '', NULL, 1, '2020-07-27 06:52:37', '2020-09-26 13:35:27', NULL, 3, 1),
(2, 3, 'punjabi dhaba', 'punjabidhaba@flymengo.com', 'NCV0001', 4, 1, 0, 5, 0, 'Sullurupeta', 'NEAR TOWER CLOCK', 0, NULL, NULL, NULL, NULL, '', 1, '', 0.5, 0, 'mins', '', NULL, 1, '2020-09-30 07:19:27', '2021-12-22 11:49:18', NULL, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `vendors_sub_categories`
--

CREATE TABLE `vendors_sub_categories` (
  `id` bigint(20) NOT NULL,
  `list_id` bigint(20) NOT NULL,
  `sub_category_id` int(11) NOT NULL,
  `created_user_id` bigint(20) DEFAULT NULL,
  `updated_user_id` bigint(20) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '0 = deleted, 1 = Active, 2 = Inactive'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `vendors_sub_categories`
--

INSERT INTO `vendors_sub_categories` (`id`, `list_id`, `sub_category_id`, `created_user_id`, `updated_user_id`, `created_at`, `updated_at`, `deleted_at`, `status`) VALUES
(22, 1, 31, 1, NULL, '2020-09-26 14:32:18', NULL, NULL, 1),
(23, 1, 599, 1, NULL, '2020-09-26 14:32:18', NULL, NULL, 1),
(24, 1, 600, 1, NULL, '2020-09-26 14:32:18', NULL, NULL, 1),
(25, 1, 601, 1, NULL, '2020-09-26 14:32:18', NULL, NULL, 1),
(26, 1, 603, 1, NULL, '2020-09-26 14:32:18', NULL, NULL, 1),
(27, 1, 605, 1, NULL, '2020-09-26 14:32:18', NULL, NULL, 1),
(28, 1, 606, 1, NULL, '2020-09-26 14:32:18', NULL, NULL, 1),
(29, 1, 607, 1, NULL, '2020-09-26 14:32:18', NULL, NULL, 1),
(30, 1, 612, 1, NULL, '2020-09-26 14:32:18', NULL, NULL, 1),
(31, 1, 1049, 1, NULL, '2020-09-26 14:32:18', NULL, NULL, 1),
(32, 1, 1050, 1, NULL, '2020-09-26 14:32:18', NULL, NULL, 1),
(33, 1, 1051, 1, NULL, '2020-09-26 14:32:18', NULL, NULL, 1),
(34, 0, 0, 1, NULL, '2021-06-01 13:15:08', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `vendor_amenities`
--

CREATE TABLE `vendor_amenities` (
  `id` bigint(20) NOT NULL,
  `list_id` bigint(20) NOT NULL,
  `amenity_id` int(11) NOT NULL,
  `created_user_id` bigint(20) DEFAULT NULL,
  `updated_user_id` bigint(20) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '0 = deleted, 1 = Active, 2 = Inactive'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `vendor_amenities`
--

INSERT INTO `vendor_amenities` (`id`, `list_id`, `amenity_id`, `created_user_id`, `updated_user_id`, `created_at`, `updated_at`, `deleted_at`, `status`) VALUES
(1, 0, 0, 1, NULL, '2020-09-26 12:33:15', NULL, NULL, 1),
(2, 0, 0, 1, NULL, '2020-09-26 14:31:58', NULL, NULL, 1),
(3, 0, 0, 1, NULL, '2020-09-26 14:32:18', NULL, NULL, 1),
(4, 0, 0, 1, NULL, '2021-06-01 13:15:08', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `vendor_bank_details`
--

CREATE TABLE `vendor_bank_details` (
  `id` int(50) NOT NULL,
  `vendor_id` int(11) NOT NULL,
  `bank_name` varchar(60) NOT NULL,
  `bank_branch` varchar(60) NOT NULL,
  `ifsc` varchar(20) NOT NULL,
  `ac_holder_name` varchar(100) NOT NULL,
  `ac_number` varchar(30) NOT NULL,
  `created_user_id` bigint(20) DEFAULT NULL,
  `updated_user_id` bigint(20) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '0=deleted,1=Active,2=Inactive'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `vendor_banners`
--

CREATE TABLE `vendor_banners` (
  `id` bigint(20) NOT NULL,
  `list_id` bigint(20) NOT NULL,
  `image` varchar(200) NOT NULL,
  `ext` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `vendor_banners`
--

INSERT INTO `vendor_banners` (`id`, `list_id`, `image`, `ext`) VALUES
(1, 1, 'banner_1.jpg', 'jpg');

-- --------------------------------------------------------

--
-- Table structure for table `vendor_brands`
--

CREATE TABLE `vendor_brands` (
  `id` int(11) NOT NULL,
  `list_id` int(11) NOT NULL,
  `brand_id` int(11) NOT NULL,
  `created_user_id` int(11) NOT NULL,
  `updated_user_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '0 = deleted, 1 = Active, 2 = Inactive'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `vendor_brands`
--

INSERT INTO `vendor_brands` (`id`, `list_id`, `brand_id`, `created_user_id`, `updated_user_id`, `created_at`, `updated_at`, `deleted_at`, `status`) VALUES
(1, 0, 0, 1, 0, '2020-07-27 12:23:44', NULL, NULL, 1),
(2, 0, 0, 1, 0, '2020-07-27 12:28:17', NULL, NULL, 1),
(3, 0, 0, 1, 0, '2020-09-07 07:16:52', NULL, NULL, 1),
(4, 0, 0, 1, 0, '2020-09-07 18:33:07', NULL, NULL, 1),
(5, 0, 0, 1, 0, '2020-09-12 19:12:10', NULL, NULL, 1),
(6, 0, 0, 1, 0, '2020-09-12 20:35:58', NULL, NULL, 1),
(7, 0, 0, 1, 0, '2020-09-15 11:24:00', NULL, NULL, 1),
(8, 0, 0, 1, 0, '2020-09-20 16:30:18', NULL, NULL, 1),
(9, 0, 0, 1, 0, '2020-09-20 16:47:03', NULL, NULL, 1),
(10, 0, 0, 1, 0, '2020-09-26 12:33:15', NULL, NULL, 1),
(11, 0, 0, 1, 0, '2020-09-26 14:31:58', NULL, NULL, 1),
(12, 0, 0, 1, 0, '2020-09-26 14:32:18', NULL, NULL, 1),
(13, 0, 0, 1, 0, '2021-06-01 13:15:08', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `vendor_leads`
--

CREATE TABLE `vendor_leads` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `vendor_id` int(11) NOT NULL,
  `lead_status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1=Received, 2=Processing, 3=Completed,4=Canceled',
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '0 = deleted, 1 = Active, 2 = Inactive'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `vendor_services`
--

CREATE TABLE `vendor_services` (
  `id` bigint(20) NOT NULL,
  `list_id` bigint(20) NOT NULL,
  `service_id` bigint(20) NOT NULL,
  `created_user_id` bigint(20) DEFAULT NULL,
  `updated_user_id` bigint(20) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '0 = deleted, 1 = Active, 2 = Inactive'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `vendor_services`
--

INSERT INTO `vendor_services` (`id`, `list_id`, `service_id`, `created_user_id`, `updated_user_id`, `created_at`, `updated_at`, `deleted_at`, `status`) VALUES
(7, 1, 2, 1, NULL, '2020-09-26 14:32:18', NULL, NULL, 1),
(8, 1, 5, 1, NULL, '2020-09-26 14:32:18', NULL, NULL, 1),
(9, 1, 7, 1, NULL, '2020-09-26 14:32:18', NULL, NULL, 1),
(10, 2, 2, 1, NULL, '2021-06-01 13:15:08', NULL, NULL, 1),
(11, 2, 5, 1, NULL, '2021-06-01 13:15:08', NULL, NULL, 1),
(12, 2, 7, 1, NULL, '2021-06-01 13:15:08', NULL, NULL, 1),
(13, 2, 8, 1, NULL, '2021-06-01 13:15:08', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `vendor_settings`
--

CREATE TABLE `vendor_settings` (
  `id` bigint(20) NOT NULL,
  `key` longtext NOT NULL,
  `value` longtext NOT NULL,
  `created_user_id` bigint(20) DEFAULT NULL,
  `updated_user_id` bigint(20) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '0 = deleted, 1 = Active, 2 = Inactive'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `vendor_settings`
--

INSERT INTO `vendor_settings` (`id`, `key`, `value`, `created_user_id`, `updated_user_id`, `created_at`, `updated_at`, `deleted_at`, `status`) VALUES
(1, 'min_order_price', '155', NULL, 1, '2019-12-06 13:36:01', '2020-07-13 16:08:43', NULL, 1),
(2, 'delivery_free_range', '2', NULL, 1, '2019-12-06 13:36:01', '2020-07-13 16:08:44', NULL, 1),
(3, 'min_delivery_fee', '15', NULL, 1, '2019-12-06 13:36:01', '2020-07-13 16:08:44', NULL, 1),
(4, 'ext_delivery_fee', '10', NULL, 1, '2019-12-06 13:36:01', '2020-07-13 16:08:44', NULL, 1),
(5, 'tax', '18', NULL, 1, '2019-12-06 13:36:01', '2020-07-13 16:08:44', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `vendor_timings`
--

CREATE TABLE `vendor_timings` (
  `id` bigint(20) NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `list_id` bigint(20) NOT NULL,
  `created_user_id` bigint(20) DEFAULT 0,
  `updated_user_id` bigint(20) DEFAULT 0,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '0 = deleted, 1 = Active, 2 = Inactive'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
-- Indexes for table `amenities`
--
ALTER TABLE `amenities`
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
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories_brands`
--
ALTER TABLE `categories_brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories_services`
--
ALTER TABLE `categories_services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cat_banners`
--
ALTER TABLE `cat_banners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `constituencies`
--
ALTER TABLE `constituencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `days`
--
ALTER TABLE `days`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deleted_items`
--
ALTER TABLE `deleted_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `delivery_boy_settings`
--
ALTER TABLE `delivery_boy_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `districts`
--
ALTER TABLE `districts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `food_cart`
--
ALTER TABLE `food_cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `food_item`
--
ALTER TABLE `food_item`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `food_menu`
--
ALTER TABLE `food_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `food_orders`
--
ALTER TABLE `food_orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `food_order_deal`
--
ALTER TABLE `food_order_deal`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `food_order_items`
--
ALTER TABLE `food_order_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `food_section`
--
ALTER TABLE `food_section`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `food_sec_item`
--
ALTER TABLE `food_sec_item`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `food_settings`
--
ALTER TABLE `food_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `food_sub_order_items`
--
ALTER TABLE `food_sub_order_items`
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
-- Indexes for table `local_news`
--
ALTER TABLE `local_news`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `news_categories`
--
ALTER TABLE `news_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_rating`
--
ALTER TABLE `order_rating`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_support`
--
ALTER TABLE `order_support`
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
-- Indexes for table `promo_codes`
--
ALTER TABLE `promo_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `promo_vendors`
--
ALTER TABLE `promo_vendors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ratings`
--
ALTER TABLE `ratings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `services_permissions`
--
ALTER TABLE `services_permissions`
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
-- Indexes for table `states`
--
ALTER TABLE `states`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sub_categories`
--
ALTER TABLE `sub_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `used_promo_codes`
--
ALTER TABLE `used_promo_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users_address`
--
ALTER TABLE `users_address`
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
-- Indexes for table `user_services`
--
ALTER TABLE `user_services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vendors_holidays`
--
ALTER TABLE `vendors_holidays`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vendors_list`
--
ALTER TABLE `vendors_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vendors_sub_categories`
--
ALTER TABLE `vendors_sub_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vendor_amenities`
--
ALTER TABLE `vendor_amenities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vendor_bank_details`
--
ALTER TABLE `vendor_bank_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vendor_banners`
--
ALTER TABLE `vendor_banners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vendor_brands`
--
ALTER TABLE `vendor_brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vendor_leads`
--
ALTER TABLE `vendor_leads`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vendor_services`
--
ALTER TABLE `vendor_services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vendor_settings`
--
ALTER TABLE `vendor_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vendor_timings`
--
ALTER TABLE `vendor_timings`
  ADD PRIMARY KEY (`id`);

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
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `amenities`
--
ALTER TABLE `amenities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

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
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `categories_brands`
--
ALTER TABLE `categories_brands`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories_services`
--
ALTER TABLE `categories_services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `cat_banners`
--
ALTER TABLE `cat_banners`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `constituencies`
--
ALTER TABLE `constituencies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=341;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `days`
--
ALTER TABLE `days`
  MODIFY `id` tinyint(4) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `deleted_items`
--
ALTER TABLE `deleted_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `delivery_boy_settings`
--
ALTER TABLE `delivery_boy_settings`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `districts`
--
ALTER TABLE `districts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=709;

--
-- AUTO_INCREMENT for table `food_cart`
--
ALTER TABLE `food_cart`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `food_item`
--
ALTER TABLE `food_item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=256;

--
-- AUTO_INCREMENT for table `food_menu`
--
ALTER TABLE `food_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=123;

--
-- AUTO_INCREMENT for table `food_orders`
--
ALTER TABLE `food_orders`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `food_order_deal`
--
ALTER TABLE `food_order_deal`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `food_order_items`
--
ALTER TABLE `food_order_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `food_section`
--
ALTER TABLE `food_section`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `food_sec_item`
--
ALTER TABLE `food_sec_item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `food_settings`
--
ALTER TABLE `food_settings`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `food_sub_order_items`
--
ALTER TABLE `food_sub_order_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

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
-- AUTO_INCREMENT for table `local_news`
--
ALTER TABLE `local_news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `locations`
--
ALTER TABLE `locations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

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
-- AUTO_INCREMENT for table `news`
--
ALTER TABLE `news`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `news_categories`
--
ALTER TABLE `news_categories`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_rating`
--
ALTER TABLE `order_rating`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_support`
--
ALTER TABLE `order_support`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

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
-- AUTO_INCREMENT for table `promo_codes`
--
ALTER TABLE `promo_codes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `promo_vendors`
--
ALTER TABLE `promo_vendors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ratings`
--
ALTER TABLE `ratings`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=728;

--
-- AUTO_INCREMENT for table `services_permissions`
--
ALTER TABLE `services_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8443;

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
-- AUTO_INCREMENT for table `states`
--
ALTER TABLE `states`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `sub_categories`
--
ALTER TABLE `sub_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1053;

--
-- AUTO_INCREMENT for table `used_promo_codes`
--
ALTER TABLE `used_promo_codes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users_address`
--
ALTER TABLE `users_address`
  MODIFY `id` bigint(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

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
-- AUTO_INCREMENT for table `user_services`
--
ALTER TABLE `user_services`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vendors_holidays`
--
ALTER TABLE `vendors_holidays`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vendors_list`
--
ALTER TABLE `vendors_list`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `vendors_sub_categories`
--
ALTER TABLE `vendors_sub_categories`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `vendor_amenities`
--
ALTER TABLE `vendor_amenities`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `vendor_bank_details`
--
ALTER TABLE `vendor_bank_details`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vendor_banners`
--
ALTER TABLE `vendor_banners`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `vendor_brands`
--
ALTER TABLE `vendor_brands`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `vendor_leads`
--
ALTER TABLE `vendor_leads`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vendor_services`
--
ALTER TABLE `vendor_services`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `vendor_settings`
--
ALTER TABLE `vendor_settings`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `vendor_timings`
--
ALTER TABLE `vendor_timings`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

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
