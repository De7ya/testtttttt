-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 31, 2025 at 01:48 PM
-- Server version: 10.6.22-MariaDB
-- PHP Version: 8.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bus`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(40) DEFAULT NULL,
  `email` varchar(40) DEFAULT NULL,
  `username` varchar(40) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `role_id` bigint(20) UNSIGNED DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `username`, `email_verified_at`, `status`, `role_id`, `image`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'yahya admin', 'yahyaaboudaya@gmail.com', 'admin', NULL, 'Active', NULL, '689f813ebc8da1755283774.png', '$2y$12$KqKsaPpxawVnLiousAYTeeH8g3kFNsPUPZBStb10VktF0Ez3.fm2u', NULL, NULL, '2025-08-15 18:49:35'),
(3, 'test1', 'test@test.com', 'staff', NULL, 'Active', 2, NULL, '$2y$12$KqKsaPpxawVnLiousAYTeeH8g3kFNsPUPZBStb10VktF0Ez3.fm2u', NULL, NULL, NULL),
(4, 'oibpermkemk', 'jkmerkjkemrblgmjrkelewklegke', NULL, NULL, 'active', NULL, NULL, '', NULL, '2025-08-11 21:53:54', '2025-08-11 21:53:54');

-- --------------------------------------------------------

--
-- Table structure for table `admin_notifications`
--

CREATE TABLE `admin_notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `title` varchar(255) DEFAULT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT 0,
  `click_url` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_notifications`
--

INSERT INTO `admin_notifications` (`id`, `user_id`, `title`, `is_read`, `click_url`, `created_at`, `updated_at`) VALUES
(1, 1, 'New member registered', 0, '/admin/users/detail/1', '2025-06-02 23:15:46', '2025-06-02 23:15:46'),
(2, 2, 'New member registered', 1, '/admin/users/detail/2', '2025-06-11 22:03:46', '2025-07-25 21:03:47'),
(3, 3, 'New member registered', 0, '/admin/users/detail/3', '2025-06-11 22:09:05', '2025-06-11 22:09:05'),
(4, 4, 'New member registered', 1, '/admin/users/detail/4', '2025-06-17 18:32:41', '2025-07-25 21:03:42'),
(5, 5, 'New member registered', 1, '/admin/users/detail/5', '2025-06-24 22:14:36', '2025-07-04 15:56:58'),
(6, 6, 'New member registered', 1, '/admin/users/detail/6', '2025-06-24 22:51:00', '2025-07-03 21:14:11'),
(7, 6, 'A new contact message has been submitted', 1, '/admin/ticket/view/1', '2025-07-26 20:17:33', '2025-07-26 20:29:14'),
(8, 6, 'Payment request from ytytopi', 0, '/admin/deposit/details/8', '2025-07-29 01:23:31', '2025-07-29 01:23:31'),
(9, 6, 'Payment request from ytytopi', 0, '/admin/deposit/details/9', '2025-07-29 01:25:42', '2025-07-29 01:25:42'),
(10, 4, 'Payment request from yahyaa', 0, '/admin/deposit/details/10', '2025-07-31 00:00:29', '2025-07-31 00:00:29'),
(11, 4, 'Payment request from yahyaa', 0, '/admin/deposit/details/11', '2025-07-31 07:24:57', '2025-07-31 07:24:57'),
(12, 4, 'New support ticket has opened', 0, '/admin/ticket/view/2', '2025-08-13 19:31:11', '2025-08-13 19:31:11'),
(13, 0, 'SMTP Error: Could not authenticate.', 0, '#', '2025-08-21 01:00:07', '2025-08-21 01:00:07'),
(14, 0, 'SMTP Error: Could not authenticate.', 0, '#', '2025-08-21 01:01:53', '2025-08-21 01:01:53'),
(15, 0, 'SMTP Error: Could not authenticate.', 0, '#', '2025-08-21 01:02:21', '2025-08-21 01:02:21'),
(16, 0, 'SMTP Error: Could not authenticate.', 0, '#', '2025-08-21 01:07:52', '2025-08-21 01:07:52'),
(17, 0, 'SMTP Error: Could not authenticate.', 0, '#', '2025-08-21 01:20:23', '2025-08-21 01:20:23'),
(18, 0, 'SMTP Error: Could not connect to SMTP host. Failed to connect to server', 0, '#', '2025-08-21 01:25:33', '2025-08-21 01:25:33'),
(19, 0, 'SMTP Error: Could not connect to SMTP host. Failed to connect to server', 0, '#', '2025-08-21 01:25:56', '2025-08-21 01:25:56'),
(20, 0, 'SMTP Error: Could not connect to SMTP host. Failed to connect to server', 0, '#', '2025-08-21 01:26:47', '2025-08-21 01:26:47'),
(21, 0, 'SMTP Error: Could not authenticate.', 0, '#', '2025-08-21 01:27:27', '2025-08-21 01:27:27'),
(22, 4, 'Payment request from yahyaa', 0, '/admin/deposit/details/13', '2025-08-22 14:43:44', '2025-08-22 14:43:44'),
(23, 0, 'SMTP Error: Could not authenticate.', 0, '#', '2025-08-22 14:43:47', '2025-08-22 14:43:47'),
(24, 0, 'SMTP Error: Could not authenticate.', 0, '#', '2025-08-22 14:44:12', '2025-08-22 14:44:12'),
(25, 0, 'SMTP Error: Could not authenticate.', 0, '#', '2025-08-22 15:46:47', '2025-08-22 15:46:47'),
(26, 0, 'PHP mail() returned false', 0, '#', '2025-08-22 15:56:45', '2025-08-22 15:56:45'),
(27, 0, 'Email delivery error: Undefined property: stdClass::$host', 0, '#', '2025-08-22 16:00:45', '2025-08-22 16:00:45'),
(28, 0, 'The following From address failed: info@viserlab.com : MAIL FROM command failed,Access denied - Invalid HELO name (See RFC2821 4.1.1.1)\r\n,550,SMTP server error: MAIL FROM command failed Detail: Access denied - Invalid HELO name (See RFC2821 4.1.1.1)\r\n SMT', 0, '#', '2025-08-22 16:03:21', '2025-08-22 16:03:21'),
(29, 0, 'The following From address failed: info@viserlab.com : MAIL FROM command failed,Access denied - Invalid HELO name (See RFC2821 4.1.1.1)\r\n,550,SMTP server error: MAIL FROM command failed Detail: Access denied - Invalid HELO name (See RFC2821 4.1.1.1)\r\n SMT', 0, '#', '2025-08-22 16:04:13', '2025-08-22 16:04:13'),
(30, 0, 'The following From address failed: info@viserlab.com : MAIL FROM command failed,Access denied - Invalid HELO name (See RFC2821 4.1.1.1)\r\n,550,SMTP server error: MAIL FROM command failed Detail: Access denied - Invalid HELO name (See RFC2821 4.1.1.1)\r\n SMT', 0, '#', '2025-08-22 16:05:02', '2025-08-22 16:05:02'),
(31, 0, 'The following From address failed: info@viserlab.com : MAIL FROM command failed,Access denied - Invalid HELO name (See RFC2821 4.1.1.1)\r\n,550,SMTP server error: MAIL FROM command failed Detail: Access denied - Invalid HELO name (See RFC2821 4.1.1.1)\r\n SMT', 0, '#', '2025-08-22 16:05:11', '2025-08-22 16:05:11'),
(32, 0, 'The following From address failed: info@viserlab.com : MAIL FROM command failed,Access denied - Invalid HELO name (See RFC2821 4.1.1.1)\r\n,550,SMTP server error: MAIL FROM command failed Detail: Access denied - Invalid HELO name (See RFC2821 4.1.1.1)\r\n SMT', 0, '#', '2025-08-22 16:07:28', '2025-08-22 16:07:28'),
(33, 0, 'The following From address failed: info@viserlab.com : MAIL FROM command failed,Access denied - Invalid HELO name (See RFC2821 4.1.1.1)\r\n,550,SMTP server error: MAIL FROM command failed Detail: Access denied - Invalid HELO name (See RFC2821 4.1.1.1)\r\n SMT', 0, '#', '2025-08-22 16:08:05', '2025-08-22 16:08:05'),
(34, 0, 'SMTP Error: Could not authenticate.', 0, '#', '2025-08-22 16:10:34', '2025-08-22 16:10:34'),
(35, 0, 'SMTP Error: Could not connect to SMTP host. Failed to connect to server', 0, '#', '2025-08-22 16:16:06', '2025-08-22 16:16:06'),
(36, 4, 'A new contact message has been submitted', 1, '/admin/ticket/view/3', '2025-08-25 00:35:13', '2025-08-25 00:35:29'),
(37, 0, 'SMTP Error: Could not connect to SMTP host. Failed to connect to server', 0, '#', '2025-08-25 00:48:14', '2025-08-25 00:48:14'),
(38, 0, 'SMTP Error: Could not connect to SMTP host. Failed to connect to server', 0, '#', '2025-08-25 00:49:28', '2025-08-25 00:49:28'),
(39, 4, 'Payment request from yahyaa', 0, '/admin/deposit/details/15', '2025-08-26 05:24:51', '2025-08-26 05:24:51'),
(40, 0, 'SMTP Error: Could not connect to SMTP host. Failed to connect to server', 0, '#', '2025-08-26 05:25:13', '2025-08-26 05:25:13'),
(41, 4, 'Payment request from yahyaa', 0, '/admin/deposit/details/16', '2025-08-26 05:27:16', '2025-08-26 05:27:16'),
(42, 0, 'SMTP Error: Could not connect to SMTP host. Failed to connect to server', 0, '#', '2025-08-26 05:27:37', '2025-08-26 05:27:37'),
(43, 7, 'New member registered', 0, '/admin/users/detail/7', '2025-08-27 16:40:09', '2025-08-27 16:40:09'),
(44, 0, 'SMTP Error: Could not connect to SMTP host. Failed to connect to server', 0, '#', '2025-08-27 16:42:17', '2025-08-27 16:42:17'),
(45, 0, 'SMTP Error: Could not connect to SMTP host. Failed to connect to server', 0, '#', '2025-08-27 16:45:35', '2025-08-27 16:45:35'),
(46, 8, 'New member registered', 0, '/admin/users/detail/8', '2025-08-27 16:54:02', '2025-08-27 16:54:02'),
(47, 0, 'SMTP Error: Could not connect to SMTP host. Failed to connect to server', 0, '#', '2025-08-27 16:54:29', '2025-08-27 16:54:29'),
(48, 9, 'New member registered', 0, '/admin/users/detail/9', '2025-08-27 17:17:26', '2025-08-27 17:17:26'),
(49, 10, 'New member registered', 0, '/admin/users/detail/10', '2025-08-27 20:13:17', '2025-08-27 20:13:17'),
(50, 11, 'New member registered', 0, '/admin/users/detail/11', '2025-08-27 20:14:48', '2025-08-27 20:14:48'),
(51, 12, 'New member registered', 0, '/admin/users/detail/12', '2025-08-27 20:21:24', '2025-08-27 20:21:24'),
(52, 13, 'New member registered', 0, '/admin/users/detail/13', '2025-08-27 21:01:16', '2025-08-27 21:01:16'),
(53, 4, 'New support ticket has opened', 0, '/admin/ticket/view/4', '2025-08-27 23:33:09', '2025-08-27 23:33:09'),
(54, 4, 'Payment request from yahyaa', 0, '/admin/deposit/details/17', '2025-08-27 23:39:16', '2025-08-27 23:39:16'),
(55, 4, 'Payment request from yahyaa', 0, '/admin/deposit/details/18', '2025-08-27 23:47:17', '2025-08-27 23:47:17');

-- --------------------------------------------------------

--
-- Table structure for table `admin_password_resets`
--

CREATE TABLE `admin_password_resets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(40) DEFAULT NULL,
  `token` varchar(40) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_password_resets`
--

INSERT INTO `admin_password_resets` (`id`, `email`, `token`, `status`, `created_at`) VALUES
(1, 'yahyaaboudaya@gmail.com', '625970', 1, '2025-08-03 23:14:58'),
(2, 'yahyaaboudaya@gmail.com', '320234', 1, '2025-08-03 23:17:10'),
(3, 'yahyaaboudaya@gmail.com', '879164', 1, '2025-08-05 11:30:10');

-- --------------------------------------------------------

--
-- Table structure for table `assigned_vehicles`
--

CREATE TABLE `assigned_vehicles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `trip_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `vehicle_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `start_from` time DEFAULT NULL,
  `end_at` time DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `assigned_vehicles`
--

INSERT INTO `assigned_vehicles` (`id`, `trip_id`, `vehicle_id`, `start_from`, `end_at`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '00:29:00', '17:08:00', 1, '2025-06-24 22:10:51', '2025-06-24 22:10:51');

-- --------------------------------------------------------

--
-- Table structure for table `booked_tickets`
--

CREATE TABLE `booked_tickets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `gender` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `trip_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `source_destination` varchar(40) DEFAULT NULL,
  `pickup_point` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `dropping_point` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `seats` varchar(255) DEFAULT NULL,
  `ticket_count` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `unit_price` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `sub_total` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `date_of_journey` date DEFAULT NULL,
  `pnr_number` varchar(40) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `booked_tickets`
--

INSERT INTO `booked_tickets` (`id`, `user_id`, `gender`, `trip_id`, `source_destination`, `pickup_point`, `dropping_point`, `seats`, `ticket_count`, `unit_price`, `sub_total`, `date_of_journey`, `pnr_number`, `status`, `created_at`, `updated_at`) VALUES
(1, 5, 1, 1, '[\"2\",\"11\"]', 2, 11, '[\"1-B2\"]', 1, 400.00000000, 400.00000000, '2025-06-27', 'A4WVLTP2II', 0, '2025-06-24 22:16:24', '2025-06-24 22:16:24'),
(2, 4, 1, 1, '[\"2\",\"11\"]', 2, 11, '[\"1-A1\"]', 1, 400.00000000, 400.00000000, '2025-06-26', '16BDGEFFHE', 0, '2025-06-26 13:29:07', '2025-06-26 13:29:07'),
(3, 4, 1, 2, '[\"2\",\"1\"]', 2, 1, '[\"1-A2\"]', 1, 140.00000000, 140.00000000, '2025-06-27', 'ZM1TGDHZDF', 0, '2025-06-27 14:53:06', '2025-06-27 14:53:06'),
(4, 4, 1, 2, '[\"2\",\"1\"]', 2, 1, '[\"1-A2\"]', 1, 140.00000000, 140.00000000, '2025-06-27', 'DDUN6B7666', 0, '2025-06-27 14:57:32', '2025-06-27 14:57:32'),
(5, 4, 2, 2, '[\"2\",\"1\"]', 2, 1, '[\"1-K2\"]', 1, 140.00000000, 140.00000000, '2025-06-27', '124FXPPTKC', 0, '2025-06-27 14:59:22', '2025-06-27 14:59:22'),
(13, 4, 1, 2, '[\"2\",\"1\"]', 2, 1, '[\"1-D2\"]', 1, 140.00000000, 140.00000000, '2025-07-31', 'CJYHXJRAKR', 0, '2025-07-30 23:55:03', '2025-08-20 21:28:14'),
(14, 4, 1, 2, '[\"2\",\"1\"]', 2, 1, '[\"1-B2\"]', 1, 140.00000000, 140.00000000, '2025-07-31', 'AOEUB437ME', 1, '2025-07-31 07:24:15', '2025-07-31 07:25:56'),
(15, 4, 1, 2, '[\"2\",\"1\"]', 2, 1, '[\"1-B1\"]', 1, 140.00000000, 140.00000000, '2025-08-03', 'C1XZ3OMWBC', 0, '2025-08-03 21:16:42', '2025-08-03 21:16:42'),
(16, 4, 1, 2, '[\"2\",\"1\"]', 2, 1, '[\"1-C2\"]', 1, 140.00000000, 140.00000000, '2025-08-13', 'ZN3XWZS4ZL', 0, '2025-08-13 19:26:11', '2025-08-13 19:26:11'),
(17, 4, 1, 2, '[\"2\",\"1\"]', 2, 1, '[\"1-D1\",\"1-D2\"]', 2, 140.00000000, 280.00000000, '2025-08-22', 'OD5VP5ZOLD', 1, '2025-08-22 14:42:47', '2025-08-22 14:44:09'),
(18, 4, 1, 2, '[\"2\",\"1\"]', 2, 1, '[\"1-D1\"]', 1, 140.00000000, 140.00000000, '2025-08-26', 'Q7OAGTUELF', 1, '2025-08-26 04:41:42', '2025-08-27 23:34:36'),
(19, 4, 1, 2, '[\"2\",\"1\"]', 2, 1, '[\"1-C1\"]', 1, 140.00000000, 140.00000000, '2025-08-28', 'VX82VT8LKE', 1, '2025-08-27 23:38:52', '2025-08-27 23:39:27'),
(20, 4, 1, 2, '[\"2\",\"1\"]', 2, 1, '[\"1-D1\"]', 1, 140.00000000, 140.00000000, '2025-08-28', 'S9B3L4B5Q2', 0, '2025-08-27 23:46:45', '2025-08-28 02:03:56'),
(21, 4, 1, 2, '[\"2\",\"1\"]', 2, 1, '[\"1-D2\"]', 1, 140.00000000, 140.00000000, '2025-08-28', 'LF4TQR8MUS', 0, '2025-08-28 02:32:48', '2025-08-28 02:32:48');

-- --------------------------------------------------------

--
-- Table structure for table `counters`
--

CREATE TABLE `counters` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `city` varchar(40) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `mobile` varchar(40) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `counters`
--

INSERT INTO `counters` (`id`, `name`, `city`, `location`, `mobile`, `status`, `created_at`, `updated_at`) VALUES
(1, 'درنة', 'Darna', 'درنة', '921895895', 1, '2025-06-11 22:41:08', '2025-06-26 19:39:51'),
(2, 'طرابلس', 'Tripoli', 'شارع المعر', '91000000', 1, '2025-06-19 15:36:31', '2025-08-27 21:40:02'),
(3, 'test', 'test1', 'الصابري', '920000000', 0, '2025-06-19 15:37:25', '2025-08-27 14:52:40'),
(4, 'تونس', 'tunis', 'شارع محمد الخامس تونس', '0', 1, '2025-06-19 15:37:59', '2025-06-26 15:02:01'),
(5, 'طبرق', 'tubruk', NULL, '091000000', 1, '2025-06-19 15:56:36', '2025-06-19 15:56:36'),
(6, 'غدامس', 'Ghadames', NULL, '0920000000', 1, '2025-06-19 15:57:41', '2025-06-19 15:57:41'),
(7, 'الجفرة', 'Al-Jufrah', NULL, '0950000000', 1, '2025-06-19 15:58:45', '2025-06-19 15:58:45'),
(8, 'القاهرة', 'Cairo', NULL, '99999999', 1, '2025-06-19 15:59:58', '2025-06-19 15:59:58'),
(9, 'سوسة', 'Sousse', 'سوسة', '222222222', 1, '2025-06-19 16:00:35', '2025-06-26 15:09:46'),
(10, 'TRIPOLI-HQ', 'TRIPOLI-HQ 2', 'TRIPOLI - LIBYA', '22222', 1, '2025-06-24 22:02:40', '2025-06-24 22:02:40'),
(11, 'محطة الساحل الاسكندرية', 'الاسكندرية', 'الاسكندرية شارع الساحل', '12344', 1, '2025-06-24 22:07:03', '2025-06-24 22:07:03'),
(12, 'مصراتة', 'تاجوراء', NULL, '0910000004', 0, '2025-08-27 15:33:25', '2025-08-27 15:33:52'),
(13, 'yyah', 'wee', 'sss', '222', 1, '2025-08-27 23:02:06', '2025-08-27 23:02:06');

-- --------------------------------------------------------

--
-- Table structure for table `deposits`
--

CREATE TABLE `deposits` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `booked_ticket_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `method_code` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `amount` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `method_currency` varchar(40) DEFAULT NULL,
  `charge` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `rate` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `final_amount` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `detail` text DEFAULT NULL,
  `btc_amount` varchar(255) DEFAULT NULL,
  `btc_wallet` varchar(255) DEFAULT NULL,
  `trx` varchar(40) DEFAULT NULL,
  `payment_try` int(11) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1=>success, 2=>pending, 3=>cancel',
  `from_api` tinyint(1) NOT NULL DEFAULT 0,
  `admin_feedback` varchar(255) DEFAULT NULL,
  `success_url` varchar(255) DEFAULT NULL,
  `failed_url` varchar(255) DEFAULT NULL,
  `last_cron` int(11) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `deposits`
--

INSERT INTO `deposits` (`id`, `user_id`, `booked_ticket_id`, `method_code`, `amount`, `method_currency`, `charge`, `rate`, `final_amount`, `detail`, `btc_amount`, `btc_wallet`, `trx`, `payment_try`, `status`, `from_api`, `admin_feedback`, `success_url`, `failed_url`, `last_cron`, `created_at`, `updated_at`) VALUES
(2, 6, 11, 101, 140.00000000, 'USD', 3.80000000, 1.00000000, 143.80000000, NULL, '0', '', 'CIDOKWH7TXPG', 0, 0, 0, NULL, '/user/booked-ticket/history', '/tickets', 0, '2025-07-29 00:52:52', '2025-07-29 00:52:52'),
(3, 6, 11, 1001, 140.00000000, 'USD', 0.00000000, 1.00000000, 140.00000000, NULL, '0', '', '2UP5J6XH35E9', 0, 0, 0, NULL, '/user/booked-ticket/history', '/tickets', 0, '2025-07-29 00:53:16', '2025-07-29 00:53:16'),
(4, 6, 11, 102, 140.00000000, 'USD', 4.36000000, 1.00000000, 144.36000000, NULL, '0', '', 'OS3IYWH8HQ7Z', 0, 0, 0, NULL, '/user/booked-ticket/history', '/tickets', 0, '2025-07-29 01:01:29', '2025-07-29 01:01:29'),
(5, 6, 11, 1001, 140.00000000, 'USD', 0.00000000, 1.00000000, 140.00000000, NULL, '0', '', 'SUHTKLSIY8VF', 0, 0, 0, NULL, '/user/booked-ticket/history', '/tickets', 0, '2025-07-29 01:01:43', '2025-07-29 01:01:43'),
(6, 6, 11, 1001, 140.00000000, 'LYD', 0.00000000, 1.00000000, 140.00000000, NULL, '0', '', 'ITNY73FREBIW', 0, 0, 0, NULL, '/user/booked-ticket/history', '/tickets', 0, '2025-07-29 01:04:40', '2025-07-29 01:04:40'),
(7, 6, 11, 1001, 140.00000000, 'LYD', 0.00000000, 1.00000000, 140.00000000, NULL, '0', '', '5JQEPQVLIBCW', 0, 0, 0, NULL, '/user/booked-ticket/history', '/tickets', 0, '2025-07-29 01:04:50', '2025-07-29 01:04:50'),
(8, 6, 11, 1001, 140.00000000, 'LYD', 0.00000000, 1.00000000, 140.00000000, '[{\"name\":\"Name of Card\",\"type\":\"text\",\"value\":\"taha\"}]', '0', '', 'D4MJBSRO52J6', 0, 2, 0, NULL, '/user/booked-ticket/history', '/tickets', 0, '2025-07-29 01:10:33', '2025-07-29 01:23:31'),
(9, 6, 12, 1001, 280.00000000, 'LYD', 0.00000000, 1.00000000, 280.00000000, '[{\"name\":\"Name of Card\",\"type\":\"text\",\"value\":null}]', '0', '', 'NNJLDUWCZB9R', 0, 1, 0, NULL, '/user/booked-ticket/history', '/tickets', 0, '2025-07-29 01:25:29', '2025-07-29 01:26:18'),
(10, 4, 13, 1001, 140.00000000, 'LYD', 0.00000000, 1.00000000, 140.00000000, '[]', '0', '', 'YFWIGZ94T2V5', 0, 3, 0, 'تأخير', '/user/booked-ticket/history', '/tickets', 0, '2025-07-30 23:56:51', '2025-08-20 21:28:14'),
(11, 4, 14, 1001, 140.00000000, 'LYD', 0.00000000, 1.00000000, 140.00000000, '[]', '0', '', 'KITLIO3F74YF', 0, 1, 0, NULL, '/user/booked-ticket/history', '/tickets', 0, '2025-07-31 07:24:53', '2025-07-31 07:25:56'),
(12, 4, 15, 1001, 140.00000000, 'LYD', 0.00000000, 1.00000000, 140.00000000, NULL, '0', '', 'FSB3542Q7XBS', 0, 0, 0, NULL, '/user/booked-ticket/history', '/tickets', 0, '2025-08-03 21:17:13', '2025-08-03 21:17:13'),
(13, 4, 17, 1001, 280.00000000, 'LYD', 0.00000000, 1.00000000, 280.00000000, '[]', '0', '', 'A9KZ14Y4XPMS', 0, 1, 0, NULL, '/user/booked-ticket/history', '/tickets', 0, '2025-08-22 14:43:39', '2025-08-22 14:44:09'),
(14, 4, 18, 1001, 140.00000000, 'LYD', 0.00000000, 1.00000000, 140.00000000, NULL, '0', '', 'RZ1BUC9B44OB', 0, 0, 0, NULL, '/user/booked-ticket/history', '/tickets', 0, '2025-08-26 05:01:51', '2025-08-26 05:01:51'),
(15, 4, 18, 1001, 140.00000000, 'LYD', 0.00000000, 1.00000000, 140.00000000, '[]', '0', '', 'KIWLPRIPFGV3', 0, 1, 0, NULL, '/user/booked-ticket/history', '/tickets', 0, '2025-08-26 05:03:12', '2025-08-27 23:37:35'),
(16, 4, 18, 1001, 140.00000000, 'LYD', 0.00000000, 1.00000000, 140.00000000, '[]', '0', '', '9SV4PFSXVM7M', 0, 1, 0, NULL, '/user/booked-ticket/history', '/tickets', 0, '2025-08-26 05:27:14', '2025-08-27 23:34:36'),
(17, 4, 19, 1001, 140.00000000, 'LYD', 0.00000000, 1.00000000, 140.00000000, '[]', '0', '', '9FVDBF6I7XCR', 0, 1, 0, NULL, '/user/booked-ticket/history', '/tickets', 0, '2025-08-27 23:38:58', '2025-08-27 23:39:27'),
(18, 4, 20, 1001, 140.00000000, 'LYD', 0.00000000, 1.00000000, 140.00000000, '[]', '0', '', 'WEIHDK25OCG5', 0, 3, 0, 'اختبار الصندق الاسود', '/user/booked-ticket/history', '/tickets', 0, '2025-08-27 23:47:12', '2025-08-28 02:03:56');

-- --------------------------------------------------------

--
-- Table structure for table `device_tokens`
--

CREATE TABLE `device_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_app` tinyint(1) NOT NULL DEFAULT 0,
  `token` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `drivers`
--

CREATE TABLE `drivers` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `age` int(11) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `address` text NOT NULL,
  `license_number` varchar(100) NOT NULL,
  `updated_at` int(5) NOT NULL,
  `created_at` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `drivers`
--

INSERT INTO `drivers` (`id`, `name`, `age`, `phone`, `address`, `license_number`, `updated_at`, `created_at`) VALUES
(1, 'yahya test', 55, '0920000000', 'dsc', '323242', 2025, 2025),
(2, 'iommk', 222, '5151515', 'kmk', '9448', 2025, 2025),
(3, 'rre', 225, '848484', 'kkkk', '999', 2025, 2025),
(4, 'kmgkermgker', 45, '995959595', 'te', '959', 2025, 2025),
(5, 'vrtim', 748, '4584894', 'btrbr', '488484', 2025, 2025);

-- --------------------------------------------------------

--
-- Table structure for table `extensions`
--

CREATE TABLE `extensions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `act` varchar(40) DEFAULT NULL,
  `name` varchar(40) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `script` text DEFAULT NULL,
  `shortcode` text DEFAULT NULL COMMENT 'object',
  `support` text DEFAULT NULL COMMENT 'help section',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=>enable, 2=>disable',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `extensions`
--

INSERT INTO `extensions` (`id`, `act`, `name`, `description`, `image`, `script`, `shortcode`, `support`, `status`, `created_at`, `updated_at`) VALUES
(1, 'tawk-chat', 'Tawk.to', 'Key location is shown bellow', 'tawky_big.png', '<script>\r\n                        var Tawk_API=Tawk_API||{}, Tawk_LoadStart=new Date();\r\n                        (function(){\r\n                        var s1=document.createElement(\"script\"),s0=document.getElementsByTagName(\"script\")[0];\r\n                        s1.async=true;\r\n                        s1.src=\"https://embed.tawk.to/{{app_key}}\";\r\n                        s1.charset=\"UTF-8\";\r\n                        s1.setAttribute(\"crossorigin\",\"*\");\r\n                        s0.parentNode.insertBefore(s1,s0);\r\n                        })();\r\n                    </script>', '{\"app_key\":{\"title\":\"App Key\",\"value\":\"------\"}}', 'twak.png', 0, '2019-10-18 11:16:05', '2024-05-16 06:23:02'),
(2, 'google-recaptcha2', 'Google Recaptcha 2', 'Key location is shown bellow', 'recaptcha3.png', '\n<script src=\"https://www.google.com/recaptcha/api.js\"></script>\n<div class=\"g-recaptcha\" data-sitekey=\"{{site_key}}\" data-callback=\"verifyCaptcha\"></div>\n<div id=\"g-recaptcha-error\"></div>', '{\"site_key\":{\"title\":\"Site Key\",\"value\":\"6LdPC88fAAAAADQlUf_DV6Hrvgm-pZuLJFSLDOWV\"},\"secret_key\":{\"title\":\"Secret Key\",\"value\":\"6LdPC88fAAAAAG5SVaRYDnV2NpCrptLg2XLYKRKB\"}}', 'recaptcha.png', 0, '2019-10-18 11:16:05', '2024-07-06 00:01:09'),
(3, 'custom-captcha', 'Custom Captcha', 'Just put any random string', 'customcaptcha.png', NULL, '{\"random_key\":{\"title\":\"Random String\",\"value\":\"SecureString\"}}', 'na', 0, '2019-10-18 11:16:05', '2024-07-06 00:01:13'),
(4, 'google-analytics', 'Google Analytics', 'Key location is shown bellow', 'google_analytics.png', '<script async src=\"https://www.googletagmanager.com/gtag/js?id={{measurement_id}}\"></script>\n                <script>\n                  window.dataLayer = window.dataLayer || [];\n                  function gtag(){dataLayer.push(arguments);}\n                  gtag(\"js\", new Date());\n                \n                  gtag(\"config\", \"{{measurement_id}}\");\n                </script>', '{\"measurement_id\":{\"title\":\"Measurement ID\",\"value\":\"------\"}}', 'ganalytics.png', 0, NULL, '2021-05-03 22:19:12'),
(5, 'fb-comment', 'Facebook Comment ', 'Key location is shown bellow', 'Facebook.png', '<div id=\"fb-root\"></div><script async defer crossorigin=\"anonymous\" src=\"https://connect.facebook.net/en_GB/sdk.js#xfbml=1&version=v4.0&appId={{app_key}}&autoLogAppEvents=1\"></script>', '{\"app_key\":{\"title\":\"App Key\",\"value\":\"----\"}}', 'fb_com.png', 0, NULL, '2022-03-21 17:18:36');

-- --------------------------------------------------------

--
-- Table structure for table `fleet_types`
--

CREATE TABLE `fleet_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `seat_layout` varchar(40) DEFAULT NULL,
  `deck` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `deck_seats` varchar(255) DEFAULT NULL,
  `facilities` varchar(255) DEFAULT NULL,
  `has_ac` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `fleet_types`
--

INSERT INTO `fleet_types` (`id`, `name`, `seat_layout`, `deck`, `deck_seats`, `facilities`, `has_ac`, `status`, `created_at`, `updated_at`) VALUES
(1, 'ALMASAR - N', '2 x 2', 1, '[\"47\"]', '[\"Water Bottle\",\"Pillow\"]', 1, 1, '2025-06-24 20:49:44', '2025-06-26 19:19:35'),
(2, 'ALMASAR - VIP', '2 x 2', 1, '[\"47\"]', '[\"Soft Drinks\",\"Water Bottle\",\"Pillow\",\"Wifi\"]', 1, 1, '2025-06-24 22:04:51', '2025-06-26 19:19:23'),
(3, 'test', '2 x 2', 1, '[\"47\"]', '[\"Soft Drinks\",\"Water Bottle\"]', 1, 1, '2025-08-27 23:04:05', '2025-08-27 23:04:05');

-- --------------------------------------------------------

--
-- Table structure for table `forms`
--

CREATE TABLE `forms` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `act` varchar(40) DEFAULT NULL,
  `form_data` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `forms`
--

INSERT INTO `forms` (`id`, `act`, `form_data`, `created_at`, `updated_at`) VALUES
(1, 'manual_deposit', '[]', '2025-07-29 01:23:04', '2025-07-31 00:00:15');

-- --------------------------------------------------------

--
-- Table structure for table `frontends`
--

CREATE TABLE `frontends` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `data_keys` varchar(40) DEFAULT NULL,
  `data_values` longtext DEFAULT NULL,
  `seo_content` longtext DEFAULT NULL,
  `tempname` varchar(40) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `frontends`
--

INSERT INTO `frontends` (`id`, `data_keys`, `data_values`, `seo_content`, `tempname`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'seo.data', '{\"seo_image\":\"1\",\"keywords\":[\"ViserBus\",\"bus booking system\",\"bus booking php script\",\"single vendor bus booking system\"],\"description\":\"Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit\",\"social_title\":\"ViserBus - Bus Ticket Booking System\",\"social_description\":\"Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit ff\",\"image\":\"66a3478bbd09b1721976715.png\"}', NULL, NULL, '', '2020-07-04 23:42:52', '2024-07-26 06:51:55'),
(24, 'about.content', '{\"has_image\":\"1\",\"heading\":\"\\u0623\\u0633\\u0637\\u0648\\u0644\\u0646\\u0627\",\"title\":\"\\u062d\\u0648\\u0644\\u0646\\u0627\",\"short_description\":\"<div class=\\\"section-header\\\" style=\\\"margin-bottom:20px;color:rgb(119,119,119);font-family:Lato, sans-serif;\\\"><p style=\\\"margin-right:0px;margin-left:0px;padding:0px;font-size:18px;color:rgb(66,66,72);\\\"><\\/p><div class=\\\"row lists\\\" style=\\\"margin-left:-15px;margin-right:-15px;margin-top:40px;color:rgb(33,37,41);font-family:\'DIN Next Arabic\';font-size:16px;font-style:normal;font-weight:400;letter-spacing:normal;text-align:right;text-indent:0px;text-transform:none;word-spacing:0px;white-space:normal;background-color:rgb(242,242,242);text-decoration-thickness:initial;text-decoration-style:initial;\\\"><\\/div><div class=\\\"text-\\/\\\" style=\\\"color:rgb(33,37,41);font-family:\'DIN Next Arabic\';font-size:16px;font-style:normal;font-weight:400;letter-spacing:normal;text-align:right;text-indent:0px;text-transform:none;word-spacing:0px;white-space:normal;background-color:rgb(242,242,242);text-decoration-thickness:initial;text-decoration-style:initial;\\\">\\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0<strong style=\\\"font-weight:bolder;\\\"><span>\\u00a0<\\/span>\\u0639\\u062f\\u062f \\u0627\\u0644\\u0628\\u0627\\u0635\\u0627\\u062a:<\\/strong><br \\/>\\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u0639\\u062f\\u062f \\u062d\\u0627\\u0641\\u0644\\u0627\\u062a\\u0646\\u0627 \\u0647\\u0648 \\u062e\\u0645\\u0633\\u0629 \\u0639\\u0634\\u0631 \\u062d\\u0627\\u0641\\u0644\\u0629 \\u0648\\u0644\\u0627\\u0632\\u0627\\u0644 \\u0627\\u0644\\u0623\\u0633\\u0637\\u0648\\u0644 \\u0641\\u064a \\u062a\\u0632\\u0627\\u064a\\u062f \\u0645\\u0633\\u062a\\u0645\\u0631 \\u062d\\u0633\\u0628 \\u0645\\u062a\\u0637\\u0644\\u0628\\u0627\\u062a \\u0627\\u0644\\u062a\\u0634\\u063a\\u064a\\u0644<br \\/>\\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0<span>\\u00a0<\\/span><strong style=\\\"font-weight:bolder;\\\">\\u062a\\u062e\\u0635\\u0635 \\u0627\\u0644\\u0628\\u0627\\u0635:<\\/strong><br \\/>\\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u062a\\u062a\\u062e\\u0635\\u0635 \\u0647\\u0630\\u0647 \\u0627\\u0644\\u062d\\u0627\\u0641\\u0644\\u0627\\u062a \\u0641\\u064a \\u0627\\u0644\\u0646\\u0642\\u0644\\u00a0\\u0627\\u0644\\u0637\\u0648\\u064a\\u0644 \\u0627\\u0644\\u0645\\u062f\\u0649 \\u0644\\u0641\\u0639\\u0627\\u0644\\u064a\\u062a\\u0647\\u0627 \\u0641\\u064a \\u0627\\u0644\\u0637\\u0631\\u0642 \\u0627\\u0644\\u0637\\u0648\\u064a\\u0644\\u0629 \\u0645\\u0646 \\u0646\\u0627\\u062d\\u064a\\u0629 \\u0627\\u0644\\u0631\\u0627\\u062d\\u0629 \\u0648\\u0627\\u0644\\u0623\\u0645\\u0627\\u0646 \\u0648\\u0627\\u0644\\u0631\\u0641\\u0627\\u0647\\u064a\\u0629.\\u00a0<br \\/>\\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0<strong style=\\\"font-weight:bolder;\\\">\\u0645\\u0648\\u0627\\u0635\\u0641\\u0627\\u062a \\u0627\\u0644\\u0628\\u0627\\u0635:\\u00a0<\\/strong><\\/div><div class=\\\"text-\\/\\\" style=\\\"color:rgb(33,37,41);font-family:\'DIN Next Arabic\';font-size:16px;font-style:normal;font-weight:400;letter-spacing:normal;text-align:right;text-indent:0px;text-transform:none;word-spacing:0px;white-space:normal;background-color:rgb(242,242,242);text-decoration-thickness:initial;text-decoration-style:initial;\\\"><strong style=\\\"font-weight:bolder;\\\"><\\/strong><div class=\\\"text-\\\" style=\\\"font-weight:400;\\\"><strong style=\\\"font-weight:bolder;\\\"><\\/strong><strong style=\\\"font-weight:bolder;\\\">\\u0648\\u062c\\u0631\\u0633 \\u0644\\u062d\\u0627\\u0644\\u0627\\u062a \\u0627\\u0644\\u0637\\u0648\\u0627\\u0631\\u0626 \\u0627\\u0644\\u062e\\u0627\\u0635\\u0629 \\u0628\\u062f\\u0648\\u0631\\u0629 \\u0627\\u0644\\u0645\\u064a\\u0627\\u0647\\u0643\\u0627\\u0645\\u064a\\u0631\\u0627\\u062a \\u0645\\u0631\\u0627\\u0642\\u0628\\u0629 \\u0644\\u0645\\u0631\\u0627\\u0642\\u0628\\u0629 \\u0627\\u0644\\u0637\\u0631\\u064a\\u0642 \\u0648\\u0628\\u0627\\u0628 \\u0627\\u0644\\u062e\\u0631\\u0648\\u062c \\u0627\\u0644\\u062b\\u0627\\u0646\\u0648\\u064a \\u0644\\u0644\\u062d\\u0641\\u0627\\u0638 \\u0639\\u0644\\u0649 \\u0633\\u0644\\u0627\\u0645\\u062a\\u0643\\u0645\\u0634\\u0627\\u0634\\u0627\\u062a \\u0639\\u0631\\u0636 \\u0631\\u0626\\u064a\\u0633\\u064a\\u0629 \\u0644\\u0644\\u0625\\u0631\\u0634\\u0627\\u062f\\u0627\\u062a\\u0643\\u0645\\u0627 \\u064a\\u0648\\u062c\\u062f \\u0634\\u0627\\u0634\\u0627\\u062a \\u0645\\u062e\\u0635\\u0635\\u0629 \\u0644\\u0643\\u0644 \\u0631\\u0627\\u0643\\u0628 \\u064a\\u062a\\u0648\\u0627\\u062c\\u062f \\u0628\\u0647\\u0627 \\u0639\\u062f\\u0629 \\u0623\\u0641\\u0644\\u0627\\u0645 \\u0648\\u0645\\u0633\\u0631\\u062d\\u064a\\u0627\\u062a \\u0648\\u0642\\u0631\\u0622\\u0646 \\u0645\\u062e\\u062a\\u0627\\u0631\\u0629 \\u0628\\u0639\\u0646\\u0627\\u064a\\u0629 \\u0644\\u0644\\u0625\\u0633\\u062a\\u0645\\u062a\\u0627\\u0639 \\u0628\\u0627\\u0644\\u0631\\u062d\\u0644\\u0629\\u062a\\u0633\\u062a\\u0637\\u064a\\u0639 \\u0627\\u0644\\u062a\\u062d\\u0643\\u0645 \\u0628\\u0627\\u0644\\u0643\\u0631\\u0633\\u064a \\u062e\\u0644\\u0641\\u0627 \\u0648\\u062c\\u0627\\u0646\\u064a\\u0627 \\u0644\\u0631\\u0627\\u062d\\u062a\\u0643 \\u0639\\u0646 \\u0637\\u0631\\u064a\\u0642 \\u0627\\u0644\\u0623\\u0632\\u0631\\u0627\\u0631 \\u0627\\u0644\\u0645\\u0648\\u062c\\u0648\\u062f\\u0629 \\u0639\\u0644\\u0649 \\u062c\\u0627\\u0646\\u0628 \\u0627\\u0644\\u0643\\u0631\\u0633\\u064a\\u0625\\u0633\\u0637\\u0648\\u0627\\u0646\\u0627\\u062a \\u0625\\u0637\\u0641\\u0627\\u0621 \\u062d\\u0631\\u064a\\u0642 \\u0645\\u062e\\u0635\\u0635\\u0629 \\u0645\\u062a\\u0648\\u0632\\u0639\\u0629 \\u0648\\u0627\\u062d\\u062f\\u0629 \\u0641\\u064a \\u0643\\u0631\\u0633\\u064a \\u0631\\u0642\\u0645 1 \\u0648\\u0643\\u0631\\u0633\\u064a \\u0631\\u0642\\u0645 23 \\u0648 \\u0648\\u0627\\u062d\\u062f\\u0629 \\u0641\\u064a \\u0627\\u0644\\u062e\\u0632\\u0627\\u0646\\u0629 \\u0627\\u0644\\u062e\\u0627\\u0631\\u062c\\u064a\\u0629 \\u0627\\u0644\\u062e\\u0627\\u0635\\u0629 \\u0628\\u0627\\u0644\\u0633\\u0627\\u0626\\u0642 \\u0648 \\u0625\\u0633\\u0637\\u0648\\u0627\\u0646\\u0629 \\u062e\\u0627\\u0635\\u0629 \\u0628\\u0625\\u0637\\u0641\\u0627\\u0621 \\u0623\\u064a \\u062d\\u0631\\u064a\\u0642 \\u062e\\u0627\\u0635 \\u0628\\u0627\\u0644\\u0645\\u062d\\u0631\\u0643 \\u0644\\u0627 \\u0633\\u0645\\u062d \\u0627\\u0644\\u0644\\u0647 \\u0641\\u064a \\u062d\\u064a\\u0646 \\u062d\\u062f\\u0648\\u062b\\u0647 \\u062a\\u0639\\u0645\\u0644 \\u0628\\u0632\\u0631 \\u0623\\u0648\\u062a\\u0648\\u0645\\u0627\\u062a\\u064a\\u0643\\u064a.<br \\/>\\u062a\\u0648\\u062c\\u062f \\u0645\\u0637\\u0631\\u0642\\u0627\\u062a \\u0644\\u0643\\u0633\\u0631 \\u0627\\u0644\\u0632\\u062c\\u0627\\u062c \\u0641\\u064a \\u062d\\u064a\\u0646 \\u062d\\u062f\\u0648\\u062b \\u0625\\u0646\\u0642\\u0644\\u0627\\u0628 \\u0644\\u0633\\u0645\\u062d \\u0627\\u0644\\u0644\\u0647 \\u0644\\u0644\\u062d\\u0627\\u0641\\u0644\\u0629 \\u0623\\u0648 \\u0623\\u064a \\u0625\\u0639\\u0627\\u0642\\u0629 \\u0644\\u0644\\u0647\\u0631\\u0628 \\u0645\\u0646 \\u062d\\u0627\\u062f\\u0630\\u0629 \\u0623\\u0648 \\u0645\\u0643\\u0631\\u0648\\u0647.\\u062a\\u0648\\u062c\\u062f \\u0645\\u0637\\u0631\\u0642\\u0627\\u062a \\u0644\\u0643\\u0633\\u0631 \\u0627\\u0644\\u0632\\u062c\\u0627\\u062c \\u0641\\u064a \\u062d\\u064a\\u0646 \\u062d\\u062f\\u0648\\u062b \\u0625\\u0646\\u0642\\u0644\\u0627\\u0628 \\u0644\\u0633\\u0645\\u062d \\u0627\\u0644\\u0644\\u0647 \\u0644\\u0644\\u062d\\u0627\\u0641\\u0644\\u0629 \\u0623\\u0648 \\u0623\\u064a \\u0625\\u0639\\u0627\\u0642\\u0629 \\u0644\\u0644\\u0647\\u0631\\u0628 \\u0645\\u0646 \\u062d\\u0627\\u062f\\u0630\\u0629 \\u0623\\u0648 \\u0645\\u0643\\u0631\\u0648\\u0647.<\\/strong><\\/div><strong style=\\\"font-weight:bolder;\\\"><\\/strong><\\/div><\\/div>\",\"description\":\"<div class=\\\"item\\\" style=\\\"margin-bottom:30px;color:rgb(119,119,119);font-family:Lato, sans-serif;\\\"><div class=\\\"row lists\\\" style=\\\"margin-left:-15px;margin-right:-15px;margin-top:40px;\\\"><div class=\\\"text-\\\"><ul style=\\\"margin-top:15px;margin-bottom:1rem;\\\"><li style=\\\"padding-right:26px;list-style:none;font-size:15px;\\\">\\u0647\\u0630\\u0647 \\u0627\\u0644\\u0628\\u0627\\u0635 \\u062a\\u062d\\u062a\\u0648\\u064a \\u0639\\u0644\\u0649 \\u0645\\u062d\\u0631\\u0643\\u0627\\u0646 \\u0630\\u0627\\u062a \\u0633\\u0639\\u0629 \\u0644\\u062a\\u0631\\u064a\\u0629 \\u0643\\u0628\\u064a\\u0631\\u0629 \\u0648\\u0623\\u0645\\u0627\\u0646 \\u0643\\u0627\\u0645\\u0644 \\u0641\\u064a \\u0647\\u064a\\u0643\\u0644\\u0647\\u0627<\\/li><li style=\\\"padding-right:26px;list-style:none;font-size:15px;\\\">\\u062a\\u062d\\u062a\\u0648\\u064a \\u0639\\u0644\\u0649 \\u0625\\u062b\\u0646\\u0627\\u0646 \\u0645\\u062e\\u0627\\u0631\\u062c \\u0623\\u0633\\u0627\\u0633\\u064a\\u0629<\\/li><li style=\\\"padding-right:26px;list-style:none;font-size:15px;\\\">\\u0625\\u062b\\u0646\\u0627\\u0646 \\u0645\\u062e\\u0627\\u0631\\u062c \\u0639\\u0644\\u0648\\u064a\\u0629 \\u0644\\u0644\\u0637\\u0648\\u0627\\u0631\\u0626<\\/li><li style=\\\"padding-right:26px;list-style:none;font-size:15px;\\\">47 \\u0643\\u0631\\u0633\\u064a \\u0644\\u0644\\u0631\\u0643\\u0627\\u0628 \\u0644\\u0627 \\u062a\\u0634\\u0645\\u0644 \\u0645\\u0642\\u0639\\u062f \\u0643\\u0631\\u0633\\u064a \\u0627\\u0644\\u0643\\u0627\\u0628\\u062a\\u0646 \\u0648\\u0645\\u0633\\u0627\\u0639\\u062f \\u0627\\u0644\\u0643\\u0627\\u0628\\u062a\\u0646<\\/li><li style=\\\"padding-right:26px;list-style:none;font-size:15px;\\\">\\u062a\\u062d\\u062a\\u0648\\u064a \\u0627\\u0644\\u062d\\u0627\\u0641\\u0644\\u0629 \\u0623\\u064a\\u0636\\u0627 \\u0639\\u0644\\u0649 \\u062b\\u0644\\u0627\\u062c\\u0629 \\u0644\\u0644\\u062d\\u0641\\u0627\\u0638 \\u0639\\u0644\\u0649 \\u0627\\u0644\\u0645\\u0634\\u0631\\u0648\\u0628\\u0627\\u062a \\u0648\\u0627\\u0644\\u0623\\u0643\\u0644\\u0627\\u062a \\u0627\\u0644\\u0628\\u0627\\u0631\\u062f\\u0629 \\u0648 \\u0627\\u0644\\u0633\\u0627\\u062e\\u0646\\u0629<\\/li><li style=\\\"padding-right:26px;list-style:none;font-size:15px;\\\">\\u0648\\u062a\\u062d\\u062a\\u0648\\u064a \\u0639\\u0644\\u0649 \\u062f\\u0648\\u0631\\u0629 \\u0645\\u064a\\u0627\\u0647 \\u0645\\u062e\\u0635\\u0635\\u0629 \\u062c\\u0627\\u0647\\u0632\\u0629 \\u0645\\u0639 \\u0648\\u062c\\u0648\\u062f \\u0645\\u0627\\u0621 \\u062c\\u0627\\u0631\\u064a \\u0645\\u0639\\u0642\\u0645<\\/li><li style=\\\"padding-right:26px;list-style:none;font-size:15px;\\\">\\u0648\\u064a\\u0648\\u062c\\u062f \\u062a\\u0643\\u064a\\u064a\\u0641 \\u0645\\u0631\\u0643\\u0632\\u064a \\u0644\\u0647\\u0627 \\u0648\\u062a\\u0643\\u064a\\u064a\\u0641 \\u0645\\u062e\\u0635\\u0635 \\u0644\\u0643\\u0644 \\u0645\\u0646 \\u0627\\u0644\\u0631\\u0643\\u0627\\u0628<\\/li><li style=\\\"padding-right:26px;list-style:none;font-size:15px;\\\">\\u0646\\u0638\\u0627\\u0645 \\u0625\\u0636\\u0627\\u0621\\u0629 \\u062d\\u062f\\u064a\\u062b \\u0645\\u062a\\u0648\\u0632\\u0639 \\u0639\\u0644\\u0649 \\u0627\\u0644\\u062d\\u0627\\u0641\\u0644\\u0629<\\/li><li style=\\\"padding-right:26px;list-style:none;font-size:15px;\\\">\\u0623\\u0631\\u0641\\u0641 \\u062a\\u062e\\u0632\\u064a\\u0646 \\u0639\\u0644\\u0648\\u064a\\u0629<\\/li><li style=\\\"padding-right:26px;list-style:none;font-size:15px;\\\">\\u0648\\u062a\\u062d\\u062a\\u0648\\u064a \\u0623\\u064a\\u0636\\u0627 \\u0639\\u0644\\u0649 \\u062c\\u0631\\u0633 \\u0644\\u0644\\u0625\\u0633\\u062a\\u062f\\u0639\\u0627\\u0621 \\u0641\\u064a \\u062d\\u064a\\u0646 \\u0637\\u0644\\u0628 \\u0623\\u064a \\u0634\\u064a \\u0645\\u0646 \\u0642\\u0628\\u0644\\u0643\\u0645<\\/li><\\/ul><\\/div><\\/div><div class=\\\"wrapper row\\\" style=\\\"margin:0px auto;max-width:959px;\\\"><div class=\\\"col-md-4 col-3 p-0\\\" style=\\\"width:319.663px;max-width:33.3333%;\\\"><\\/div><\\/div><\\/div><h2 class=\\\"title\\\" style=\\\"margin-top:-10px;margin-bottom:15px;font-weight:600;line-height:1.2;font-size:36px;color:rgb(66,66,72);font-family:Georama, sans-serif;\\\"><\\/h2>\",\"image\":\"68ae4a3d5ac8b1756252733.jpg\"}', NULL, 'basic', '', '2020-10-28 00:51:20', '2025-08-26 23:58:54'),
(31, 'social_icon.element', '{\"title\":\"Facebook\",\"social_icon\":\"<i class=\\\"las la-expand\\\"><\\/i>\",\"url\":\"https:\\/\\/www.google.com\\/\"}', NULL, 'basic', NULL, '2020-11-12 04:07:30', '2021-05-12 05:56:59'),
(42, 'policy_pages.element', '{\"title\":\"\\u0633\\u064a\\u0627\\u0633\\u064a\\u0627\\u062a \\u0627\\u0644\\u062e\\u0635\\u0648\\u0635\\u064a\\u0629\",\"details\":\"<h4><\\/h4><p><strong>\\u0645\\u0642\\u062f\\u0645\\u0629<\\/strong><br \\/>\\r\\n\\u062a\\u0635\\u0641 \\u0633\\u064a\\u0627\\u0633\\u0629 \\u0627\\u0644\\u062e\\u0635\\u0648\\u0635\\u064a\\u0629 \\u0647\\u0630\\u0647 \\u0643\\u064a\\u0641\\u064a\\u0629 \\u062c\\u0645\\u0639\\u0646\\u0627 \\u0648\\u0627\\u0633\\u062a\\u062e\\u062f\\u0627\\u0645\\u0646\\u0627 \\u0648\\u0627\\u0644\\u0625\\u0641\\u0635\\u0627\\u062d \\u0639\\u0646 \\u0627\\u0644\\u0645\\u0639\\u0644\\u0648\\u0645\\u0627\\u062a\\u060c \\u0628\\u0645\\u0627 \\u0641\\u064a \\u0630\\u0644\\u0643 \\u0627\\u0644\\u0645\\u0639\\u0644\\u0648\\u0645\\u0627\\u062a \\u0627\\u0644\\u0634\\u062e\\u0635\\u064a\\u0629\\u060c \\u0641\\u064a\\u0645\\u0627 \\u064a\\u062a\\u0639\\u0644\\u0642 \\u0628\\u0627\\u0633\\u062a\\u062e\\u062f\\u0627\\u0645\\u0643 \\u0644\\u0645\\u0648\\u0642\\u0639\\u0646\\u0627 \\u0627\\u0644\\u0625\\u0644\\u0643\\u062a\\u0631\\u0648\\u0646\\u064a.<\\/p>\\r\\n<hr \\/>\\r\\n<h3><strong>\\u0627\\u0644\\u0645\\u0639\\u0644\\u0648\\u0645\\u0627\\u062a \\u0627\\u0644\\u062a\\u064a \\u0646\\u062c\\u0645\\u0639\\u0647\\u0627<\\/strong><\\/h3><h4>\\r\\n<\\/h4><p>\\u0646\\u062c\\u0645\\u0639 \\u0646\\u0648\\u0639\\u064a\\u0646 \\u0631\\u0626\\u064a\\u0633\\u064a\\u064a\\u0646 \\u0645\\u0646 \\u0627\\u0644\\u0645\\u0639\\u0644\\u0648\\u0645\\u0627\\u062a \\u0639\\u0644\\u0649 \\u0627\\u0644\\u0645\\u0648\\u0642\\u0639:<\\/p>\\r\\n<p><strong>\\u0627\\u0644\\u0645\\u0639\\u0644\\u0648\\u0645\\u0627\\u062a \\u0627\\u0644\\u0634\\u062e\\u0635\\u064a\\u0629:<\\/strong><br \\/>\\r\\n\\u062a\\u0634\\u0645\\u0644 \\u0627\\u0644\\u0628\\u064a\\u0627\\u0646\\u0627\\u062a \\u0627\\u0644\\u062a\\u064a \\u064a\\u0645\\u0643\\u0646 \\u0623\\u0646 \\u062a\\u062d\\u062f\\u062f \\u0647\\u0648\\u064a\\u062a\\u0643 \\u0643\\u0634\\u062e\\u0635\\u060c \\u0645\\u062b\\u0644 \\u0627\\u0633\\u0645\\u0643\\u060c \\u0639\\u0646\\u0648\\u0627\\u0646 \\u0628\\u0631\\u064a\\u062f\\u0643 \\u0627\\u0644\\u0625\\u0644\\u0643\\u062a\\u0631\\u0648\\u0646\\u064a\\u060c \\u0631\\u0642\\u0645 \\u0647\\u0627\\u062a\\u0641\\u0643\\u060c \\u0623\\u0648 \\u0639\\u0646\\u0648\\u0627\\u0646\\u0643 \\u0627\\u0644\\u0628\\u0631\\u064a\\u062f\\u064a. \\u0646\\u0642\\u0648\\u0645 \\u0628\\u062c\\u0645\\u0639 \\u0647\\u0630\\u0647 \\u0627\\u0644\\u0645\\u0639\\u0644\\u0648\\u0645\\u0627\\u062a \\u0641\\u0642\\u0637 \\u0639\\u0646\\u062f\\u0645\\u0627 \\u062a\\u0642\\u062f\\u0645\\u0647\\u0627 \\u0644\\u0646\\u0627 \\u0637\\u0648\\u0639\\u064b\\u0627\\u060c \\u0645\\u062b\\u0644 \\u0627\\u0644\\u0627\\u0634\\u062a\\u0631\\u0627\\u0643 \\u0641\\u064a \\u0627\\u0644\\u0646\\u0634\\u0631\\u0629 \\u0627\\u0644\\u0625\\u062e\\u0628\\u0627\\u0631\\u064a\\u0629\\u060c \\u0623\\u0648 \\u0627\\u0644\\u0627\\u062a\\u0635\\u0627\\u0644 \\u0628\\u0646\\u0627 \\u0645\\u0646 \\u062e\\u0644\\u0627\\u0644 \\u0646\\u0645\\u0648\\u0630\\u062c\\u060c \\u0623\\u0648 \\u0625\\u062c\\u0631\\u0627\\u0621 \\u0639\\u0645\\u0644\\u064a\\u0629 \\u0634\\u0631\\u0627\\u0621.<\\/p>\\r\\n<p><strong>\\u0627\\u0644\\u0645\\u0639\\u0644\\u0648\\u0645\\u0627\\u062a \\u063a\\u064a\\u0631 \\u0627\\u0644\\u0634\\u062e\\u0635\\u064a\\u0629:<\\/strong><br \\/>\\r\\n\\u062a\\u0634\\u0645\\u0644 \\u0627\\u0644\\u0628\\u064a\\u0627\\u0646\\u0627\\u062a \\u0627\\u0644\\u062a\\u064a \\u0644\\u0627 \\u064a\\u0645\\u0643\\u0646 \\u0627\\u0633\\u062a\\u062e\\u062f\\u0627\\u0645\\u0647\\u0627 \\u0644\\u062a\\u062d\\u062f\\u064a\\u062f \\u0647\\u0648\\u064a\\u062a\\u0643 \\u0628\\u0634\\u0643\\u0644 \\u0645\\u0628\\u0627\\u0634\\u0631\\u060c \\u0645\\u062b\\u0644 \\u0646\\u0648\\u0639 \\u0627\\u0644\\u0645\\u062a\\u0635\\u0641\\u062d\\u060c \\u0646\\u0648\\u0639 \\u0627\\u0644\\u062c\\u0647\\u0627\\u0632\\u060c \\u0646\\u0638\\u0627\\u0645 \\u0627\\u0644\\u062a\\u0634\\u063a\\u064a\\u0644\\u060c \\u0639\\u0646\\u0648\\u0627\\u0646 \\u0628\\u0631\\u0648\\u062a\\u0648\\u0643\\u0648\\u0644 \\u0627\\u0644\\u0625\\u0646\\u062a\\u0631\\u0646\\u062a (IP)\\u060c \\u0646\\u0634\\u0627\\u0637 \\u0627\\u0644\\u062a\\u0635\\u0641\\u062d\\u060c \\u0648\\u0625\\u062d\\u0635\\u0627\\u0626\\u064a\\u0627\\u062a \\u0627\\u0644\\u0627\\u0633\\u062a\\u062e\\u062f\\u0627\\u0645. \\u0646\\u0642\\u0648\\u0645 \\u0628\\u062c\\u0645\\u0639 \\u0647\\u0630\\u0647 \\u0627\\u0644\\u0645\\u0639\\u0644\\u0648\\u0645\\u0627\\u062a \\u062a\\u0644\\u0642\\u0627\\u0626\\u064a\\u064b\\u0627 \\u0645\\u0646 \\u062e\\u0644\\u0627\\u0644 \\u0645\\u0644\\u0641\\u0627\\u062a \\u062a\\u0639\\u0631\\u064a\\u0641 \\u0627\\u0644\\u0627\\u0631\\u062a\\u0628\\u0627\\u0637 (Cookies) \\u0648\\u062a\\u0642\\u0646\\u064a\\u0627\\u062a \\u0627\\u0644\\u062a\\u062a\\u0628\\u0639 \\u0627\\u0644\\u0623\\u062e\\u0631\\u0649.<\\/p>\\r\\n<hr \\/>\\r\\n<h3><strong>\\u0643\\u064a\\u0641\\u064a\\u0629 \\u0627\\u0633\\u062a\\u062e\\u062f\\u0627\\u0645\\u0646\\u0627 \\u0644\\u0644\\u0645\\u0639\\u0644\\u0648\\u0645\\u0627\\u062a<\\/strong><\\/h3><h4>\\r\\n<\\/h4><p>\\u062a\\u062a\\u064a\\u062d \\u0644\\u0646\\u0627 \\u0627\\u0644\\u0645\\u0639\\u0644\\u0648\\u0645\\u0627\\u062a \\u0627\\u0644\\u062a\\u064a \\u0646\\u062c\\u0645\\u0639\\u0647\\u0627 \\u0645\\u0627 \\u064a\\u0644\\u064a:<\\/p>\\r\\n<ul>\\r\\n<li>\\r\\n<p>\\u062a\\u0634\\u063a\\u064a\\u0644 \\u0648\\u0635\\u064a\\u0627\\u0646\\u0629 \\u0627\\u0644\\u0645\\u0648\\u0642\\u0639 \\u0628\\u0641\\u0639\\u0627\\u0644\\u064a\\u0629.<\\/p>\\r\\n<\\/li>\\r\\n<li>\\r\\n<p>\\u0625\\u0631\\u0633\\u0627\\u0644 \\u0627\\u0644\\u0646\\u0634\\u0631\\u0627\\u062a \\u0627\\u0644\\u0625\\u062e\\u0628\\u0627\\u0631\\u064a\\u0629 \\u0623\\u0648 \\u0627\\u0644\\u0627\\u062a\\u0635\\u0627\\u0644\\u0627\\u062a \\u0627\\u0644\\u062a\\u0633\\u0648\\u064a\\u0642\\u064a\\u0629 \\u0644\\u0643\\u060c \\u0648\\u0644\\u0643\\u0646 \\u0641\\u0642\\u0637 \\u0628\\u0645\\u0648\\u0627\\u0641\\u0642\\u062a\\u0643.<\\/p>\\r\\n<\\/li>\\r\\n<li>\\r\\n<p>\\u0627\\u0644\\u0631\\u062f \\u0639\\u0644\\u0649 \\u0627\\u0633\\u062a\\u0641\\u0633\\u0627\\u0631\\u0627\\u062a\\u0643 \\u0648\\u062a\\u0644\\u0628\\u064a\\u0629 \\u0637\\u0644\\u0628\\u0627\\u062a\\u0643.<\\/p>\\r\\n<\\/li>\\r\\n<li>\\r\\n<p>\\u062a\\u062d\\u0633\\u064a\\u0646 \\u0627\\u0644\\u0645\\u0648\\u0642\\u0639 \\u0648\\u062a\\u062c\\u0631\\u0628\\u0629 \\u0627\\u0644\\u0645\\u0633\\u062a\\u062e\\u062f\\u0645 \\u0627\\u0644\\u062e\\u0627\\u0635\\u0629 \\u0628\\u0643.<\\/p>\\r\\n<\\/li>\\r\\n<li>\\r\\n<p>\\u062a\\u062e\\u0635\\u064a\\u0635 \\u062a\\u062c\\u0631\\u0628\\u062a\\u0643 \\u0639\\u0644\\u0649 \\u0627\\u0644\\u0645\\u0648\\u0642\\u0639 \\u0628\\u0646\\u0627\\u0621\\u064b \\u0639\\u0644\\u0649 \\u0639\\u0627\\u062f\\u0627\\u062a \\u0627\\u0644\\u062a\\u0635\\u0641\\u062d \\u0627\\u0644\\u062e\\u0627\\u0635\\u0629 \\u0628\\u0643.<\\/p>\\r\\n<\\/li>\\r\\n<li>\\r\\n<p>\\u062a\\u062d\\u0644\\u064a\\u0644 \\u0643\\u064a\\u0641\\u064a\\u0629 \\u0627\\u0633\\u062a\\u062e\\u062f\\u0627\\u0645 \\u0627\\u0644\\u0645\\u0648\\u0642\\u0639 \\u0644\\u062a\\u062d\\u0633\\u064a\\u0646 \\u062e\\u062f\\u0645\\u0627\\u062a\\u0646\\u0627.<\\/p>\\r\\n<\\/li>\\r\\n<li>\\r\\n<p>\\u0627\\u0644\\u0627\\u0645\\u062a\\u062b\\u0627\\u0644 \\u0644\\u0644\\u0645\\u062a\\u0637\\u0644\\u0628\\u0627\\u062a \\u0627\\u0644\\u0642\\u0627\\u0646\\u0648\\u0646\\u064a\\u0629 \\u0648\\u0627\\u0644\\u062a\\u0646\\u0638\\u064a\\u0645\\u064a\\u0629.<\\/p>\\r\\n<\\/li>\\r\\n<\\/ul>\\r\\n<hr \\/>\\r\\n<h3><strong>\\u0645\\u0634\\u0627\\u0631\\u0643\\u0629 \\u0627\\u0644\\u0645\\u0639\\u0644\\u0648\\u0645\\u0627\\u062a<\\/strong><\\/h3><h4>\\r\\n<\\/h4><p>\\u0642\\u062f \\u0646\\u0634\\u0627\\u0631\\u0643 \\u0645\\u0639\\u0644\\u0648\\u0645\\u0627\\u062a\\u0643 \\u0645\\u0639 \\u0645\\u0632\\u0648\\u062f\\u064a \\u062e\\u062f\\u0645\\u0627\\u062a \\u062e\\u0627\\u0631\\u062c\\u064a\\u064a\\u0646 \\u0645\\u0648\\u062b\\u0648\\u0642 \\u0628\\u0647\\u0645 \\u064a\\u0633\\u0627\\u0639\\u062f\\u0648\\u0646\\u0646\\u0627 \\u0641\\u064a \\u062a\\u0634\\u063a\\u064a\\u0644 \\u0627\\u0644\\u0645\\u0648\\u0642\\u0639 \\u0648\\u062a\\u0642\\u062f\\u064a\\u0645 \\u062e\\u062f\\u0645\\u0627\\u062a\\u0646\\u0627. \\u0647\\u0624\\u0644\\u0627\\u0621 \\u0627\\u0644\\u0645\\u0632\\u0648\\u062f\\u0648\\u0646 \\u0645\\u0644\\u0632\\u0645\\u0648\\u0646 \\u0628\\u0645\\u0648\\u062c\\u0628 \\u0627\\u0644\\u0639\\u0642\\u062f \\u0628\\u0627\\u0644\\u062d\\u0641\\u0627\\u0638 \\u0639\\u0644\\u0649 \\u0633\\u0631\\u064a\\u0629 \\u0645\\u0639\\u0644\\u0648\\u0645\\u0627\\u062a\\u0643 \\u0648\\u0627\\u0633\\u062a\\u062e\\u062f\\u0627\\u0645\\u0647\\u0627 \\u0641\\u0642\\u0637 \\u0644\\u0644\\u0623\\u063a\\u0631\\u0627\\u0636 \\u0627\\u0644\\u062a\\u064a \\u0646\\u0643\\u0634\\u0641\\u0647\\u0627 \\u0644\\u0647\\u0645.<\\/p>\\r\\n<p>\\u0644\\u0646 \\u0646\\u0634\\u0627\\u0631\\u0643 \\u0623\\u0628\\u062f\\u064b\\u0627 \\u0645\\u0639\\u0644\\u0648\\u0645\\u0627\\u062a\\u0643 \\u0627\\u0644\\u0634\\u062e\\u0635\\u064a\\u0629 \\u0645\\u0639 \\u0623\\u064a \\u0637\\u0631\\u0641 \\u062b\\u0627\\u0644\\u062b \\u0644\\u0623\\u063a\\u0631\\u0627\\u0636 \\u062a\\u0633\\u0648\\u064a\\u0642\\u064a\\u0629 \\u062f\\u0648\\u0646 \\u0645\\u0648\\u0627\\u0641\\u0642\\u062a\\u0643 \\u0627\\u0644\\u0635\\u0631\\u064a\\u062d\\u0629.<\\/p>\\r\\n<hr \\/>\\r\\n<h3><strong>\\u0627\\u0644\\u0627\\u062d\\u062a\\u0641\\u0627\\u0638 \\u0628\\u0627\\u0644\\u0628\\u064a\\u0627\\u0646\\u0627\\u062a<\\/strong><\\/h3><h4>\\r\\n<\\/h4><p>\\u0646\\u062d\\u062a\\u0641\\u0638 \\u0628\\u0645\\u0639\\u0644\\u0648\\u0645\\u0627\\u062a\\u0643 \\u0627\\u0644\\u0634\\u062e\\u0635\\u064a\\u0629 \\u0641\\u0642\\u0637 \\u0637\\u0627\\u0644\\u0645\\u0627 \\u0643\\u0627\\u0646 \\u0630\\u0644\\u0643 \\u0636\\u0631\\u0648\\u0631\\u064a\\u064b\\u0627 \\u0644\\u062a\\u062d\\u0642\\u064a\\u0642 \\u0627\\u0644\\u0623\\u063a\\u0631\\u0627\\u0636 \\u0627\\u0644\\u062a\\u064a \\u062c\\u064f\\u0645\\u0639\\u062a \\u0645\\u0646 \\u0623\\u062c\\u0644\\u0647\\u0627. \\u0642\\u062f \\u0646\\u062d\\u062a\\u0641\\u0638 \\u0628\\u0647\\u0627 \\u0644\\u0641\\u062a\\u0631\\u0627\\u062a \\u0623\\u0637\\u0648\\u0644 \\u0641\\u0642\\u0637 \\u0625\\u0630\\u0627 \\u0643\\u0627\\u0646 \\u0630\\u0644\\u0643 \\u0645\\u0637\\u0644\\u0648\\u0628\\u064b\\u0627 \\u0623\\u0648 \\u0645\\u0633\\u0645\\u0648\\u062d\\u064b\\u0627 \\u0628\\u0647 \\u0628\\u0645\\u0648\\u062c\\u0628 \\u0627\\u0644\\u0642\\u0627\\u0646\\u0648\\u0646.<\\/p>\"}', NULL, 'basic', 'privacy-policy', '2021-06-09 08:50:42', '2025-08-27 13:26:42'),
(43, 'policy_pages.element', '{\"title\":\"\\u0634\\u0631\\u0648\\u0637 \\u0627\\u0644\\u062e\\u062f\\u0645\\u0629\",\"details\":\"<h4><\\/h4><p>\\u0645\\u0631\\u062d\\u0628\\u064b\\u0627 \\u0628\\u0643 \\u0641\\u064a \\u0645\\u0648\\u0642\\u0639 <strong>\\u0634\\u0631\\u0643\\u0629 \\u0627\\u0644\\u0645\\u0633\\u0627\\u0631 \\u0644\\u0644\\u0646\\u0642\\u0644 \\u0627\\u0644\\u0628\\u0631\\u064a<\\/strong>. \\u0628\\u0627\\u0633\\u062a\\u062e\\u062f\\u0627\\u0645\\u0643 \\u0644\\u062e\\u062f\\u0645\\u0627\\u062a\\u0646\\u0627\\u060c \\u0641\\u0625\\u0646\\u0643 \\u062a\\u0648\\u0627\\u0641\\u0642 \\u0639\\u0644\\u0649 \\u0627\\u0644\\u0627\\u0644\\u062a\\u0632\\u0627\\u0645 \\u0628\\u0627\\u0644\\u0634\\u0631\\u0648\\u0637 \\u0648\\u0627\\u0644\\u0623\\u062d\\u0643\\u0627\\u0645 \\u0627\\u0644\\u062a\\u0627\\u0644\\u064a\\u0629. \\u064a\\u0631\\u062c\\u0649 \\u0642\\u0631\\u0627\\u0621\\u062a\\u0647\\u0627 \\u0628\\u0639\\u0646\\u0627\\u064a\\u0629 \\u0642\\u0628\\u0644 \\u0627\\u0633\\u062a\\u062e\\u062f\\u0627\\u0645 \\u0627\\u0644\\u0645\\u0648\\u0642\\u0639 \\u0623\\u0648 \\u0627\\u0644\\u062d\\u062c\\u0632 \\u0645\\u0646 \\u062e\\u0644\\u0627\\u0644\\u0647.<\\/p><p><br \\/><\\/p><h3>1. \\u0627\\u0644\\u0642\\u0628\\u0648\\u0644 \\u0628\\u0627\\u0644\\u0634\\u0631\\u0648\\u0637<\\/h3><h4><\\/h4><p>\\u0628\\u0627\\u0633\\u062a\\u062e\\u062f\\u0627\\u0645\\u0643 \\u0647\\u0630\\u0627 \\u0627\\u0644\\u0645\\u0648\\u0642\\u0639 \\u0623\\u0648 \\u0623\\u064a \\u0645\\u0646 \\u062e\\u062f\\u0645\\u0627\\u062a \\u0634\\u0631\\u0643\\u0629 \\u0627\\u0644\\u0645\\u0633\\u0627\\u0631\\u060c \\u0641\\u0625\\u0646\\u0643 \\u062a\\u0642\\u0631 \\u0628\\u0623\\u0646\\u0643 \\u0642\\u062f \\u0642\\u0631\\u0623\\u062a \\u0648\\u0641\\u0647\\u0645\\u062a \\u0648\\u0648\\u0627\\u0641\\u0642\\u062a \\u0639\\u0644\\u0649 \\u0647\\u0630\\u0647 \\u0627\\u0644\\u0634\\u0631\\u0648\\u0637 \\u0628\\u0627\\u0644\\u0643\\u0627\\u0645\\u0644. \\u0625\\u0630\\u0627 \\u0644\\u0645 \\u062a\\u0648\\u0627\\u0641\\u0642 \\u0639\\u0644\\u0649 \\u0623\\u064a \\u0645\\u0646 \\u0627\\u0644\\u0634\\u0631\\u0648\\u0637\\u060c \\u064a\\u064f\\u0631\\u062c\\u0649 \\u0639\\u062f\\u0645 \\u0627\\u0633\\u062a\\u062e\\u062f\\u0627\\u0645 \\u0627\\u0644\\u0645\\u0648\\u0642\\u0639 \\u0623\\u0648 \\u0627\\u0644\\u062e\\u062f\\u0645\\u0629.<\\/p><p>\\r\\n\\r\\n\\r\\n<\\/p><h3><\\/h3><h4><br \\/><\\/h4><h3>2. \\u0627\\u0644\\u062e\\u062f\\u0645\\u0627\\u062a \\u0627\\u0644\\u0645\\u0642\\u062f\\u0645\\u0629<\\/h3><h4>\\r\\n<\\/h4><ul>\\r\\n<li>\\r\\n<p>\\u062a\\u0642\\u062f\\u0645 \\u0634\\u0631\\u0643\\u0629 \\u0627\\u0644\\u0645\\u0633\\u0627\\u0631 \\u062e\\u062f\\u0645\\u0627\\u062a \\u0646\\u0642\\u0644 \\u0628\\u0631\\u064a \\u0628\\u064a\\u0646 \\u0627\\u0644\\u0645\\u062f\\u0646 \\u0648\\u0646\\u0642\\u0627\\u0637 \\u0627\\u0644\\u0627\\u0646\\u0637\\u0644\\u0627\\u0642 \\u0627\\u0644\\u0645\\u0639\\u062a\\u0645\\u062f\\u0629.<\\/p>\\r\\n<\\/li>\\r\\n<li>\\r\\n<p>\\u062a\\u0634\\u0645\\u0644 \\u0627\\u0644\\u062e\\u062f\\u0645\\u0627\\u062a \\u062d\\u062c\\u0632 \\u0627\\u0644\\u062a\\u0630\\u0627\\u0643\\u0631\\u060c \\u0625\\u062f\\u0627\\u0631\\u0629 \\u0627\\u0644\\u0631\\u062d\\u0644\\u0627\\u062a\\u060c \\u0648\\u062a\\u062a\\u0628\\u0639 \\u0627\\u0644\\u0645\\u0631\\u0643\\u0628\\u0627\\u062a (\\u0625\\u0646 \\u062a\\u0648\\u0641\\u0631).<\\/p>\\r\\n<\\/li>\\r\\n<\\/ul><div><font color=\\\"#5b6e88\\\"><span style=\\\"font-size:14px;\\\"><br \\/><\\/span><\\/font><\\/div><h3>3. \\u0627\\u0633\\u062a\\u062e\\u062f\\u0627\\u0645 \\u0627\\u0644\\u0645\\u0648\\u0642\\u0639<\\/h3><h4><\\/h4><div>\\r\\n<ul>\\r\\n<li>\\r\\n<p>\\u064a\\u062a\\u0639\\u0647\\u062f \\u0627\\u0644\\u0645\\u0633\\u062a\\u062e\\u062f\\u0645 \\u0628\\u0639\\u062f\\u0645 \\u0627\\u0633\\u062a\\u062e\\u062f\\u0627\\u0645 \\u0627\\u0644\\u0645\\u0648\\u0642\\u0639 \\u0644\\u0623\\u064a \\u0623\\u063a\\u0631\\u0627\\u0636 \\u063a\\u064a\\u0631 \\u0642\\u0627\\u0646\\u0648\\u0646\\u064a\\u0629 \\u0623\\u0648 \\u062a\\u0646\\u062a\\u0647\\u0643 \\u062d\\u0642\\u0648\\u0642 \\u0627\\u0644\\u063a\\u064a\\u0631.<\\/p>\\r\\n<\\/li>\\r\\n<li>\\r\\n<p>\\u064a\\u062c\\u0628 \\u0639\\u0644\\u0649 \\u0627\\u0644\\u0645\\u0633\\u062a\\u062e\\u062f\\u0645 \\u062a\\u0642\\u062f\\u064a\\u0645 \\u0645\\u0639\\u0644\\u0648\\u0645\\u0627\\u062a \\u062f\\u0642\\u064a\\u0642\\u0629 \\u0639\\u0646\\u062f \\u0625\\u0646\\u0634\\u0627\\u0621 \\u0627\\u0644\\u062d\\u0633\\u0627\\u0628 \\u0623\\u0648 \\u0627\\u0644\\u062d\\u062c\\u0632.<\\/p>\\r\\n<\\/li>\\r\\n<li>\\r\\n<p>\\u062a\\u062d\\u062a\\u0641\\u0638 \\u0627\\u0644\\u0634\\u0631\\u0643\\u0629 \\u0628\\u0627\\u0644\\u062d\\u0642 \\u0641\\u064a \\u0625\\u0644\\u063a\\u0627\\u0621 \\u0623\\u064a \\u062d\\u062c\\u0632 \\u0623\\u0648 \\u062d\\u0633\\u0627\\u0628 \\u064a\\u062d\\u062a\\u0648\\u064a \\u0639\\u0644\\u0649 \\u0645\\u0639\\u0644\\u0648\\u0645\\u0627\\u062a \\u0645\\u0632\\u064a\\u0641\\u0629 \\u0623\\u0648 \\u0645\\u0634\\u0628\\u0648\\u0647\\u0629.<\\/p>\\r\\n<\\/li>\\r\\n<\\/ul><div><font color=\\\"#5b6e88\\\"><span style=\\\"font-size:14px;\\\"><br \\/><\\/span><\\/font><\\/div><\\/div><h3>4. \\u0627\\u0644\\u0645\\u0633\\u0624\\u0648\\u0644\\u064a\\u0629<\\/h3><h4><\\/h4><div>\\r\\n<ul>\\r\\n<li>\\r\\n<p>\\u062a\\u0628\\u0630\\u0644 \\u0627\\u0644\\u0634\\u0631\\u0643\\u0629 \\u0642\\u0635\\u0627\\u0631\\u0649 \\u062c\\u0647\\u062f\\u0647\\u0627 \\u0644\\u0636\\u0645\\u0627\\u0646 \\u062f\\u0642\\u0629 \\u0627\\u0644\\u0645\\u0639\\u0644\\u0648\\u0645\\u0627\\u062a \\u0648\\u062a\\u0648\\u0627\\u0641\\u0631 \\u0627\\u0644\\u062e\\u062f\\u0645\\u0629\\u060c \\u0644\\u0643\\u0646\\u0647\\u0627 \\u063a\\u064a\\u0631 \\u0645\\u0633\\u0624\\u0648\\u0644\\u0629 \\u0639\\u0646:<\\/p>\\r\\n<ul>\\r\\n<li>\\r\\n<p>\\u0623\\u064a \\u062a\\u0623\\u062e\\u064a\\u0631 \\u0641\\u064a \\u0627\\u0644\\u0631\\u062d\\u0644\\u0627\\u062a \\u0646\\u0627\\u062a\\u062c \\u0639\\u0646 \\u0638\\u0631\\u0648\\u0641 \\u062e\\u0627\\u0631\\u062c\\u0629 \\u0639\\u0646 \\u0627\\u0644\\u0625\\u0631\\u0627\\u062f\\u0629 (\\u0643\\u0627\\u0644\\u062d\\u0648\\u0627\\u062f\\u062b \\u0623\\u0648 \\u0627\\u0644\\u0637\\u0642\\u0633).<\\/p>\\r\\n<\\/li>\\r\\n<li>\\r\\n<p>\\u0641\\u0642\\u062f\\u0627\\u0646 \\u0623\\u0648 \\u062a\\u0644\\u0641 \\u0627\\u0644\\u0623\\u0645\\u062a\\u0639\\u0629 \\u0645\\u0627 \\u0644\\u0645 \\u062a\\u0643\\u0646 \\u0645\\u0633\\u062c\\u0644\\u0629 \\u0631\\u0633\\u0645\\u064a\\u064b\\u0627.<\\/p>\\r\\n<\\/li>\\r\\n<\\/ul><\\/li>\\r\\n\\r\\n<\\/ul><div><font color=\\\"#5b6e88\\\"><span style=\\\"font-size:14px;\\\"><br \\/><\\/span><\\/font><\\/div><\\/div><h3>5. \\u0627\\u0644\\u062a\\u0639\\u062f\\u064a\\u0644\\u0627\\u062a \\u0639\\u0644\\u0649 \\u0627\\u0644\\u062e\\u062f\\u0645\\u0629<\\/h3><h4><\\/h4><div>\\r\\n<ul>\\r\\n<li>\\r\\n<p>\\u062a\\u062d\\u062a\\u0641\\u0638 \\u0634\\u0631\\u0643\\u0629 \\u0627\\u0644\\u0645\\u0633\\u0627\\u0631 \\u0628\\u062d\\u0642 \\u062a\\u0639\\u062f\\u064a\\u0644 \\u0623\\u0648 \\u0625\\u0646\\u0647\\u0627\\u0621 \\u0623\\u064a \\u0645\\u0646 \\u062e\\u062f\\u0645\\u0627\\u062a\\u0647\\u0627 \\u0623\\u0648 \\u0647\\u0630\\u0647 \\u0627\\u0644\\u0634\\u0631\\u0648\\u0637 \\u0641\\u064a \\u0623\\u064a \\u0648\\u0642\\u062a \\u062f\\u0648\\u0646 \\u0625\\u0634\\u0639\\u0627\\u0631 \\u0645\\u0633\\u0628\\u0642.<\\/p>\\r\\n<\\/li>\\r\\n<li>\\r\\n<p>\\u064a\\u064f\\u0646\\u0635\\u062d \\u0628\\u0645\\u0631\\u0627\\u062c\\u0639\\u0629 \\u0627\\u0644\\u0635\\u0641\\u062d\\u0629 \\u0628\\u0634\\u0643\\u0644 \\u062f\\u0648\\u0631\\u064a \\u0644\\u0644\\u062a\\u0623\\u0643\\u062f \\u0645\\u0646 \\u0645\\u0639\\u0631\\u0641\\u0629 \\u0627\\u0644\\u062a\\u062d\\u062f\\u064a\\u062b\\u0627\\u062a.<\\/p>\\r\\n<\\/li>\\r\\n<\\/ul><div><font color=\\\"#5b6e88\\\"><span style=\\\"font-size:14px;\\\"><br \\/><\\/span><\\/font><\\/div><\\/div><h3>6. \\u062d\\u0642\\u0648\\u0642 \\u0627\\u0644\\u0645\\u0644\\u0643\\u064a\\u0629 \\u0627\\u0644\\u0641\\u0643\\u0631\\u064a\\u0629<\\/h3><h4><\\/h4><div>\\r\\n<ul>\\r\\n<li>\\r\\n<p>\\u062c\\u0645\\u064a\\u0639 \\u0645\\u062d\\u062a\\u0648\\u064a\\u0627\\u062a \\u0627\\u0644\\u0645\\u0648\\u0642\\u0639 (\\u0646\\u0635\\u0648\\u0635\\u060c \\u0634\\u0639\\u0627\\u0631\\u0627\\u062a\\u060c \\u0635\\u0648\\u0631\\u060c \\u0623\\u0643\\u0648\\u0627\\u062f) \\u0647\\u064a \\u0645\\u0644\\u0643 \\u0644\\u0634\\u0631\\u0643\\u0629 \\u0627\\u0644\\u0645\\u0633\\u0627\\u0631 \\u0648\\u0644\\u0627 \\u064a\\u062c\\u0648\\u0632 \\u0627\\u0633\\u062a\\u062e\\u062f\\u0627\\u0645\\u0647\\u0627 \\u062f\\u0648\\u0646 \\u0625\\u0630\\u0646 \\u062e\\u0637\\u064a \\u0645\\u0633\\u0628\\u0642.<\\/p>\\r\\n<\\/li>\\r\\n<\\/ul><div><font color=\\\"#5b6e88\\\"><span style=\\\"font-size:14px;\\\"><br \\/><\\/span><\\/font><\\/div><\\/div><div><font color=\\\"#5b6e88\\\"><span style=\\\"font-size:14px;\\\"><br \\/><\\/span><\\/font><\\/div><h3>7. \\u0627\\u0644\\u062e\\u0635\\u0648\\u0635\\u064a\\u0629<\\/h3><h4><\\/h4><div>\\r\\n<ul>\\r\\n<li>\\r\\n<p>\\u062a\\u062e\\u0636\\u0639 \\u0628\\u064a\\u0627\\u0646\\u0627\\u062a \\u0627\\u0644\\u0645\\u0633\\u062a\\u062e\\u062f\\u0645 \\u0644\\u0633\\u064a\\u0627\\u0633\\u0629 \\u0627\\u0644\\u062e\\u0635\\u0648\\u0635\\u064a\\u0629 \\u0627\\u0644\\u0645\\u0648\\u0636\\u062d\\u0629 \\u0641\\u064a \\u0635\\u0641\\u062d\\u0629 [\\u0633\\u064a\\u0627\\u0633\\u0629 \\u0627\\u0644\\u062e\\u0635\\u0648\\u0635\\u064a\\u0629].<\\/p>\\r\\n<\\/li>\\r\\n<li>\\r\\n<p>\\u064a\\u062a\\u0645 \\u0627\\u0633\\u062a\\u062e\\u062f\\u0627\\u0645 \\u0627\\u0644\\u0628\\u064a\\u0627\\u0646\\u0627\\u062a \\u0641\\u0642\\u0637 \\u0644\\u062a\\u062d\\u0633\\u064a\\u0646 \\u0627\\u0644\\u062e\\u062f\\u0645\\u0629 \\u0648\\u062a\\u0633\\u0647\\u064a\\u0644 \\u0627\\u0644\\u062d\\u062c\\u0632 \\u0648\\u0644\\u0627 \\u062a\\u064f\\u0628\\u0627\\u0639 \\u0644\\u0623\\u064a \\u062c\\u0647\\u0629 \\u062e\\u0627\\u0631\\u062c\\u064a\\u0629.<\\/p>\\r\\n<\\/li>\\r\\n<\\/ul><div><font color=\\\"#5b6e88\\\"><span style=\\\"font-size:14px;\\\"><br \\/><\\/span><\\/font><\\/div><\\/div><h3>8. \\u0627\\u0644\\u0642\\u0627\\u0646\\u0648\\u0646 \\u0627\\u0644\\u0648\\u0627\\u062c\\u0628 \\u0627\\u0644\\u062a\\u0637\\u0628\\u064a\\u0642<\\/h3><h4><\\/h4><div>\\r\\n<ul>\\r\\n<li>\\r\\n<p>\\u062a\\u062e\\u0636\\u0639 \\u0647\\u0630\\u0647 \\u0627\\u0644\\u0634\\u0631\\u0648\\u0637 \\u0648\\u062a\\u064f\\u0641\\u0633\\u0631 \\u0648\\u0641\\u0642\\u064b\\u0627 \\u0644\\u0642\\u0648\\u0627\\u0646\\u064a\\u0646 \\u0627\\u0644\\u062f\\u0648\\u0644\\u0629 \\u0627\\u0644\\u062a\\u064a \\u062a\\u0639\\u0645\\u0644 \\u0641\\u064a\\u0647\\u0627 \\u0634\\u0631\\u0643\\u0629 \\u0627\\u0644\\u0645\\u0633\\u0627\\u0631 (\\u0644\\u064a\\u0628\\u064a\\u0627).<\\/p>\\r\\n<\\/li>\\r\\n<li>\\r\\n<p>\\u0623\\u064a \\u0646\\u0632\\u0627\\u0639 \\u064a\\u064f\\u062d\\u0627\\u0644 \\u0625\\u0644\\u0649 \\u0627\\u0644\\u062c\\u0647\\u0627\\u062a \\u0627\\u0644\\u0642\\u0636\\u0627\\u0626\\u064a\\u0629 \\u0627\\u0644\\u0645\\u062e\\u062a\\u0635\\u0629.<\\/p>\\r\\n<\\/li>\\r\\n<\\/ul><\\/div><hr \\/>\"}', NULL, 'basic', 'terms-of-service', '2021-06-09 08:51:18', '2025-07-08 00:20:14'),
(44, 'maintenance.data', '{\"description\":\"<div class=\\\"mb-5\\\" style=\\\"font-family: Nunito, sans-serif; margin-bottom: 3rem !important;\\\"><h3 class=\\\"mb-3\\\" style=\\\"text-align: center; font-weight: 600; line-height: 1.3; font-size: 24px; font-family: Exo, sans-serif;\\\"><font color=\\\"#ff0000\\\">THE SITE IS UNDER MAINTENANCE<\\/font><\\/h3><p class=\\\"font-18\\\" style=\\\"color: rgb(111, 111, 111); text-align: center; margin-right: 0px; margin-left: 0px; font-size: 18px !important;\\\">We\'re just tuning up a few things.We apologize for the inconvenience but Front is currently undergoing planned maintenance. Thanks for your patience.<\\/p><\\/div>\",\"image\":\"6603c203472ad1711522307.png\"}', NULL, NULL, NULL, '2020-07-04 23:42:52', '2024-03-27 06:51:47'),
(64, 'banner.content', '{\"heading\":\"\\u0627\\u062d\\u0635\\u0644 \\u0639\\u0644\\u0649 \\u062a\\u0630\\u0643\\u0631\\u062a\\u0643 \\u0639\\u0628\\u0631 \\u0627\\u0644\\u0625\\u0646\\u062a\\u0631\\u0646\\u062a \\u0628\\u0633\\u0647\\u0648\\u0644\\u0629 \\u0648\\u0623\\u0645\\u0627\\u0646\",\"link_title\":\"\\u0627\\u062d\\u0635\\u0644 \\u0639\\u0644\\u0649 \\u0627\\u0644\\u062a\\u0630\\u0643\\u0631\\u0629 \\u0627\\u0644\\u0622\\u0646\",\"link\":\"tickets\",\"has_image\":\"1\",\"background_image\":\"668688791bb031720092793.png\",\"animation_image\":\"68acf17917a321756164473.png\"}', NULL, 'basic', '', '2024-05-01 00:06:45', '2025-08-25 23:27:56'),
(66, 'register_disable.content', '{\"has_image\":\"1\",\"heading\":\"Registration Currently Disabled\",\"subheading\":\"Page you are looking for doesn\'t exit or an other error occurred or temporarily unavailable.\",\"button_name\":\"Go to Home\",\"button_url\":\"#\",\"image\":\"663a0f20ecd0b1715080992.png\"}', NULL, 'basic', '', '2024-05-07 05:23:12', '2024-05-07 05:28:09'),
(67, 'amenities.content', '{\"heading\":\"\\u0648\\u0633\\u0627\\u0626\\u0644 \\u0627\\u0644\\u0631\\u0627\\u062d\\u0629 \\u0644\\u062f\\u064a\\u0646\\u0627\",\"sub_heading\":\"\\u0623\\u0644\\u0642\\u064a \\u0646\\u0638\\u0631\\u0629 \\u0639\\u0644\\u0649 \\u0633\\u0628\\u0628\\u0646\\u0627 \\u0627\\u0644\\u0634\\u0627\\u0626\\u0639. \\u0644\\u0645\\u0627\\u0630\\u0627 \\u064a\\u062c\\u0628 \\u0639\\u0644\\u064a\\u0643 \\u0627\\u062e\\u062a\\u064a\\u0627\\u0631 \\u0627\\u0644\\u062d\\u0627\\u0641\\u0644\\u0629 \\u0627\\u0644\\u062e\\u0627\\u0635\\u0629 \\u0628\\u0643. \\u0645\\u0627 \\u0639\\u0644\\u064a\\u0643 \\u0633\\u0648\\u0649 \\u0627\\u062e\\u062a\\u064a\\u0627\\u0631 \\u0627\\u0644\\u062d\\u0627\\u0641\\u0644\\u0629 \\u0648\\u0627\\u0644\\u062d\\u0635\\u0648\\u0644 \\u0639\\u0644\\u0649 \\u062a\\u0630\\u0643\\u0631\\u0629 \\u0644\\u0631\\u062d\\u0644\\u062a\\u0643 \\u0627\\u0644\\u0631\\u0627\\u0626\\u0639\\u0629!\"}', NULL, 'basic', '', '2024-07-02 06:49:15', '2025-07-04 19:52:09'),
(68, 'amenities.element', '{\"title\":\"Wifi\",\"icon\":\"<i class=\\\"fas fa-wifi\\\"><\\/i>\"}', NULL, 'basic', '', '2024-07-02 06:49:35', '2024-07-02 06:49:35'),
(69, 'amenities.element', '{\"title\":\"Pillow\",\"icon\":\"<i class=\\\"las la-bed\\\"><\\/i>\"}', NULL, 'basic', '', '2024-07-02 06:49:51', '2024-07-02 06:49:51'),
(70, 'amenities.element', '{\"title\":\"Water Bottle\",\"icon\":\"<i class=\\\"las la-prescription-bottle\\\"><\\/i>\"}', NULL, 'basic', '', '2024-07-02 06:50:07', '2024-07-02 06:50:07'),
(71, 'amenities.element', '{\"title\":\"Soft Drinks\",\"icon\":\"<i class=\\\"fas fa-wine-glass-alt\\\"><\\/i>\"}', NULL, 'basic', '', '2024-07-02 06:50:23', '2024-07-02 06:50:23'),
(72, 'blog.content', '{\"heading\":\"\\u062a\\u062f\\u0648\\u064a\\u0646\\u0629 \\u062d\\u062f\\u064a\\u062b\\u0629\",\"subheading\":\"\\u0623\\u0644\\u0642\\u0650 \\u0646\\u0638\\u0631\\u0629 \\u0639\\u0644\\u0649 \\u0623\\u0633\\u0628\\u0627\\u0628\\u0646\\u0627 \\u0627\\u0644\\u0634\\u0627\\u0626\\u0639\\u0629 \\u0644\\u0627\\u062e\\u062a\\u064a\\u0627\\u0631 \\u062d\\u0627\\u0641\\u0644\\u062a\\u0643. \\u0645\\u0627 \\u0639\\u0644\\u064a\\u0643 \\u0633\\u0648\\u0649 \\u0627\\u062e\\u062a\\u064a\\u0627\\u0631 \\u062d\\u0627\\u0641\\u0644\\u0629 \\u0648\\u0627\\u062d\\u0635\\u0644 \\u0639\\u0644\\u0649 \\u062a\\u0630\\u0643\\u0631\\u0629 \\u0644\\u0631\\u062d\\u0644\\u062a\\u0643 \\u0627\\u0644\\u0631\\u0627\\u0626\\u0639\\u0629.\"}', NULL, 'basic', '', '2024-07-04 05:37:14', '2025-07-04 19:46:17'),
(79, 'breadcrumb.content', '{\"has_image\":\"1\",\"background_image\":\"66868cfc051ae1720093948.jpg\"}', NULL, 'basic', '', '2024-07-04 05:52:28', '2024-07-04 05:52:28'),
(80, 'contact.content', '{\"title\":\"\\u062f\\u0639\\u0648\\u0646\\u0627 \\u0646\\u062a\\u0648\\u0627\\u0635\\u0644\",\"short_details\":\"\\u0646\\u062d\\u0646 \\u0645\\u0646\\u0641\\u062a\\u062d\\u0648\\u0646 \\u0639\\u0644\\u0649 \\u0623\\u064a \\u0627\\u0642\\u062a\\u0631\\u0627\\u062d \\u0623\\u0648 \\u0645\\u062c\\u0631\\u062f \\u0627\\u0644\\u062f\\u0631\\u062f\\u0634\\u0629\",\"address\":\"\\u0637\\u0631\\u0627\\u0628\\u0633\",\"contact_number\":\"0918051663\",\"email\":\"yahyaaboudaya@gmail.com\",\"latitude\":\"32.890276\",\"longitude\":\"13.1709459\",\"form_title\":\"\\u0647\\u0644 \\u0644\\u062f\\u064a\\u0643 \\u0623\\u064a \\u0623\\u0633\\u0626\\u0644\\u0629\"}', NULL, 'basic', '', '2024-07-04 05:53:48', '2025-08-25 00:34:34'),
(81, 'auth.content', '{\"has_image\":\"1\",\"signup_heading\":\"testvvvv\",\"signin_heading\":\"Non distinctio Null\",\"user_data_heading\":\"Vel perspiciatis im\",\"verify_email_heading\":\"tytopicuca@mailinator.com\",\"verify_phone_heading\":\"091000000\",\"reset_password_heading\":\"Sed aute nulla simil\",\"background_image\":\"66869002329471720094722.jpg\"}', NULL, 'basic', '', '2024-07-04 06:05:22', '2025-07-29 23:06:37'),
(82, 'faq.element', '{\"question\":\"\\u0647\\u0644 \\u064a\\u0648\\u062c\\u062f \\u0645\\u0642\\u0627\\u0639\\u062f \\u062e\\u0627\\u0635\\u0629 \\u0644\\u0644\\u0646\\u0633\\u0627\\u0621 \\u0623\\u0648 \\u0627\\u0644\\u0639\\u0627\\u0626\\u0644\\u0627\\u062a \\u061f\",\"answer\":\"\\u0645\\u0642\\u0627\\u0639\\u062f \\u0645\\u062e\\u0635\\u0635\\u0629 \\u0644\\u0644\\u0646\\u0633\\u0627\\u0621 \\u0644\\u0636\\u0645\\u0627\\u0646 \\u0627\\u0644\\u062e\\u0635\\u0648\\u0635\\u064a\\u0629 \\u0648\\u0627\\u0644\\u0631\\u0627\\u062d\\u0629 \\u0623\\u062b\\u0646\\u0627\\u0621 \\u0627\\u0644\\u0631\\u062d\\u0644\\u0629.\\r\\n\\r\\n \\u0645\\u0646\\u0627\\u0637\\u0642 \\u0645\\u062e\\u0635\\u0635\\u0629 \\u0644\\u0644\\u0639\\u0627\\u0626\\u0644\\u0627\\u062a \\u062a\\u062a\\u064a\\u062d \\u0644\\u0647\\u0645 \\u0627\\u0644\\u062c\\u0644\\u0648\\u0633 \\u0645\\u0639\\u064b\\u0627 \\u0628\\u0643\\u0644 \\u0623\\u0631\\u064a\\u062d\\u064a\\u0629.\\r\\n\\r\\n\\u064a\\u062a\\u0645 \\u062a\\u062d\\u062f\\u064a\\u062f \\u0647\\u0630\\u0647 \\u0627\\u0644\\u0645\\u0642\\u0627\\u0639\\u062f \\u0623\\u062b\\u0646\\u0627\\u0621 \\u0627\\u0644\\u062d\\u062c\\u0632 \\u0627\\u0644\\u0645\\u0633\\u0628\\u0642 \\u0639\\u0628\\u0631 \\u0627\\u0644\\u0645\\u0648\\u0642\\u0639 \\u0627\\u0644\\u0625\\u0644\\u0643\\u062a\\u0631\\u0648\\u0646\\u064a \\u0623\\u0648 \\u0627\\u0644\\u062a\\u0637\\u0628\\u064a\\u0642\\u060c \\u0643\\u0645\\u0627 \\u064a\\u0645\\u0643\\u0646 \\u0637\\u0644\\u0628\\u0647\\u0627 \\u0645\\u0628\\u0627\\u0634\\u0631\\u0629 \\u0645\\u0646 \\u0645\\u0648\\u0638\\u0641 \\u0627\\u0644\\u062d\\u062c\\u0632 \\u0641\\u064a \\u0627\\u0644\\u0645\\u062d\\u0637\\u0629.\\r\\n\\r\\n\\u0646\\u0644\\u062a\\u0632\\u0645 \\u0628\\u062a\\u0648\\u0641\\u064a\\u0631 \\u0628\\u064a\\u0626\\u0629 \\u0622\\u0645\\u0646\\u0629 \\u0648\\u0645\\u0631\\u064a\\u062d\\u0629 \\u0644\\u062c\\u0645\\u064a\\u0639 \\u0627\\u0644\\u0631\\u0643\\u0627\\u0628 \\u0648\\u0641\\u0642\\u064b\\u0627 \\u0644\\u0644\\u0645\\u0639\\u0627\\u064a\\u064a\\u0631 \\u0627\\u0644\\u062b\\u0642\\u0627\\u0641\\u064a\\u0629 \\u0648\\u0627\\u0644\\u0627\\u062c\\u062a\\u0645\\u0627\\u0639\\u064a\\u0629.\"}', NULL, 'basic', '', '2024-07-04 06:05:57', '2025-07-04 20:43:01'),
(83, 'faq.element', '{\"question\":\"\\u0645\\u0627 \\u0647\\u0648 \\u0627\\u0644\\u0633\\u0646 \\u0627\\u0644\\u0623\\u062f\\u0646\\u0649 \\u0644\\u0644\\u0623\\u0637\\u0641\\u0627\\u0644 \\u0644\\u0644\\u0633\\u0641\\u0631\\u061f\",\"answer\":\"\\u0646\\u0633\\u0645\\u062d \\u0644\\u0644\\u0623\\u0637\\u0641\\u0627\\u0644 \\u062f\\u0648\\u0646 \\u0633\\u0646\\u0651 [18] \\u0628\\u0627\\u0644\\u0633\\u0641\\u0631 \\u0628\\u0634\\u0631\\u0637 \\u0623\\u0646 \\u064a\\u0643\\u0648\\u0646\\u0648\\u0627 \\u0628\\u0631\\u0641\\u0642\\u0629 \\u0631\\u0627\\u0634\\u062f \\u0645\\u0633\\u0624\\u0648\\u0644 (\\u0623\\u062d\\u062f \\u0627\\u0644\\u0648\\u0627\\u0644\\u062f\\u064a\\u0646 \\u0623\\u0648 \\u0648\\u0635\\u064a \\u0642\\u0627\\u0646\\u0648\\u0646\\u064a).\\r\\n\\r\\n\\u0644\\u0627 \\u064a\\u064f\\u0633\\u0645\\u062d \\u0644\\u0644\\u0623\\u0637\\u0641\\u0627\\u0644 \\u062f\\u0648\\u0646 \\u0633\\u0646\\u0651 [18] \\u0628\\u0627\\u0644\\u0633\\u0641\\u0631 \\u0628\\u0645\\u0641\\u0631\\u062f\\u0647\\u0645.\\r\\n\\r\\n\\u0628\\u0627\\u0644\\u0646\\u0633\\u0628\\u0629 \\u0644\\u0644\\u0623\\u0637\\u0641\\u0627\\u0644 \\u0627\\u0644\\u0630\\u064a\\u0646 \\u062a\\u062a\\u0631\\u0627\\u0648\\u062d \\u0623\\u0639\\u0645\\u0627\\u0631\\u0647\\u0645 \\u0628\\u064a\\u0646 [\\u062d\\u062f\\u062f \\u0627\\u0644\\u0639\\u0645\\u0631 \\u0627\\u0644\\u0623\\u0635\\u063a\\u0631] \\u0648[\\u062d\\u062f\\u062f \\u0627\\u0644\\u0639\\u0645\\u0631 \\u0627\\u0644\\u0623\\u0643\\u0628\\u0631]\\u060c \\u064a\\u062c\\u0628 \\u062a\\u0642\\u062f\\u064a\\u0645 \\u062a\\u0641\\u0648\\u064a\\u0636 \\u0645\\u0643\\u062a\\u0648\\u0628 \\u0645\\u0648\\u0642\\u0639 \\u0645\\u0646 \\u0648\\u0644\\u064a \\u0627\\u0644\\u0623\\u0645\\u0631 \\u0642\\u0628\\u0644 \\u0627\\u0644\\u0631\\u062d\\u0644\\u0629.\\r\\n\\r\\n\\u064a\\u064f\\u0631\\u062c\\u0649 \\u0645\\u0631\\u0627\\u062c\\u0639\\u0629 \\u0627\\u0644\\u0645\\u062a\\u0637\\u0644\\u0628\\u0627\\u062a \\u0627\\u0644\\u062e\\u0627\\u0635\\u0629 \\u0644\\u0643\\u0644 \\u0646\\u0648\\u0639 \\u0631\\u062d\\u0644\\u0629 \\u2014 \\u062e\\u0627\\u0635\\u0629 \\u0627\\u0644\\u0631\\u062d\\u0644\\u0627\\u062a \\u0627\\u0644\\u0644\\u064a\\u0644\\u064a\\u0629 \\u0623\\u0648 \\u0627\\u0644\\u0631\\u062d\\u0644\\u0627\\u062a \\u0627\\u0644\\u0637\\u0648\\u064a\\u0644\\u0629\\u060c \\u062d\\u064a\\u062b \\u0642\\u062f \\u064a\\u0643\\u0648\\u0646 \\u0647\\u0646\\u0627\\u0644\\u0643 \\u0642\\u064a\\u0648\\u062f \\u0625\\u0636\\u0627\\u0641\\u064a\\u0629.\\r\\n\\r\\n\\u064a\\u064f\\u0645\\u0646\\u062d \\u0627\\u0644\\u0623\\u0637\\u0641\\u0627\\u0644 \\u062e\\u0635\\u0645\\u064b\\u0627 \\u062e\\u0627\\u0635\\u064b\\u0627 \\u0639\\u0646\\u062f \\u0627\\u0644\\u062d\\u062c\\u0632 \\u0641\\u064a \\u062d\\u0627\\u0644 \\u0627\\u0633\\u062a\\u064a\\u0641\\u0627\\u0621\\u0647\\u0645 \\u0645\\u0639\\u0627\\u064a\\u064a\\u0631 \\u0627\\u0644\\u0641\\u0626\\u0629 \\u0627\\u0644\\u0639\\u0645\\u0631\\u064a\\u0629.\"}', NULL, 'basic', '', '2024-07-04 06:06:08', '2025-07-04 20:41:16'),
(84, 'faq.element', '{\"question\":\"\\u0647\\u0644 \\u0627\\u0644\\u062d\\u0627\\u0641\\u0644\\u0627\\u062a \\u0645\\u0632\\u0648\\u062f\\u0629 \\u0628\\u062e\\u062f\\u0645\\u0629 \\u0627\\u0646\\u062a\\u0631\\u0646\\u062a \\u061f\",\"answer\":\"\\u0646\\u0639\\u0645\\u060c \\u0645\\u0639\\u0638\\u0645 \\u062d\\u0627\\u0641\\u0644\\u0627\\u062a\\u0646\\u0627 \\u0627\\u0644\\u062d\\u062f\\u064a\\u062b\\u0629 \\u0645\\u0632\\u0648\\u062f\\u0629 \\u0628\\u062e\\u062f\\u0645\\u0629 Wi-Fi \\u0645\\u062c\\u0627\\u0646\\u064a\\u0629 \\u0644\\u062a\\u0648\\u0641\\u064a\\u0631 \\u062a\\u062c\\u0631\\u0628\\u0629 \\u0633\\u0641\\u0631 \\u0623\\u0643\\u062b\\u0631 \\u0631\\u0627\\u062d\\u0629 \\u0648\\u0645\\u062a\\u0639\\u0629. \\u064a\\u0645\\u0643\\u0646\\u0643 \\u062a\\u0635\\u0641\\u062d \\u0627\\u0644\\u0625\\u0646\\u062a\\u0631\\u0646\\u062a\\u060c \\u0627\\u0633\\u062a\\u062e\\u062f\\u0627\\u0645 \\u062a\\u0637\\u0628\\u064a\\u0642\\u0627\\u062a \\u0627\\u0644\\u062a\\u0648\\u0627\\u0635\\u0644 \\u0627\\u0644\\u0627\\u062c\\u062a\\u0645\\u0627\\u0639\\u064a\\u060c \\u0623\\u0648 \\u0645\\u062a\\u0627\\u0628\\u0639\\u0629 \\u0623\\u0639\\u0645\\u0627\\u0644\\u0643 \\u062e\\u0644\\u0627\\u0644 \\u0627\\u0644\\u0631\\u062d\\u0644\\u0629.\\r\\n\\r\\n\\u0645\\u0644\\u0627\\u062d\\u0638\\u0629: \\u0633\\u0631\\u0639\\u0629 \\u0627\\u0644\\u0627\\u062a\\u0635\\u0627\\u0644 \\u0642\\u062f \\u062a\\u062e\\u062a\\u0644\\u0641 \\u062d\\u0633\\u0628 \\u0627\\u0644\\u0645\\u0646\\u0637\\u0642\\u0629 \\u0627\\u0644\\u062c\\u063a\\u0631\\u0627\\u0641\\u064a\\u0629 \\u0648\\u062a\\u063a\\u0637\\u064a\\u0629 \\u0627\\u0644\\u0634\\u0628\\u0643\\u0629 \\u0623\\u062b\\u0646\\u0627\\u0621 \\u0627\\u0644\\u0631\\u062d\\u0644\\u0629.\\r\\n\\r\\n\\u0646\\u062d\\u0646 \\u0646\\u0639\\u0645\\u0644 \\u0628\\u0627\\u0633\\u062a\\u0645\\u0631\\u0627\\u0631 \\u0639\\u0644\\u0649 \\u062a\\u062d\\u0633\\u064a\\u0646 \\u062c\\u0648\\u062f\\u0629 \\u0627\\u0644\\u0627\\u062a\\u0635\\u0627\\u0644 \\u0644\\u0636\\u0645\\u0627\\u0646 \\u0623\\u0641\\u0636\\u0644 \\u062a\\u062c\\u0631\\u0628\\u0629 \\u0644\\u062c\\u0645\\u064a\\u0639 \\u0631\\u0643\\u0627\\u0628\\u0646\\u0627.\"}', NULL, 'basic', '', '2024-07-04 06:06:20', '2025-07-04 20:44:08');
INSERT INTO `frontends` (`id`, `data_keys`, `data_values`, `seo_content`, `tempname`, `slug`, `created_at`, `updated_at`) VALUES
(85, 'faq.element', '{\"question\":\"\\u0647\\u0644 \\u064a\\u0645\\u0643\\u0646 \\u0627\\u0635\\u0637\\u062d\\u0627\\u0628 \\u0627\\u0644\\u062d\\u064a\\u0648\\u0627\\u0646\\u0627\\u062a \\u0627\\u0644\\u0623\\u0644\\u064a\\u0641\\u0629\\u061f\",\"answer\":\"\\u0646\\u062d\\u0646 \\u0646\\u062d\\u0631\\u0635 \\u0639\\u0644\\u0649 \\u0631\\u0627\\u062d\\u0629 \\u062c\\u0645\\u064a\\u0639 \\u0627\\u0644\\u0631\\u0643\\u0627\\u0628\\u060c \\u0648\\u0644\\u0647\\u0630\\u0627 \\u0646\\u064f\\u0637\\u0628\\u0642 \\u0633\\u064a\\u0627\\u0633\\u0629 \\u0648\\u0627\\u0636\\u062d\\u0629 \\u0628\\u062e\\u0635\\u0648\\u0635 \\u0627\\u0635\\u0637\\u062d\\u0627\\u0628 \\u0627\\u0644\\u062d\\u064a\\u0648\\u0627\\u0646\\u0627\\u062a \\u0627\\u0644\\u0623\\u0644\\u064a\\u0641\\u0629:\\r\\n\\r\\n\\u064a\\u064f\\u0633\\u0645\\u062d \\u0628\\u0627\\u0635\\u0637\\u062d\\u0627\\u0628 \\u0627\\u0644\\u062d\\u064a\\u0648\\u0627\\u0646\\u0627\\u062a \\u0627\\u0644\\u0623\\u0644\\u064a\\u0641\\u0629 \\u0627\\u0644\\u0635\\u063a\\u064a\\u0631\\u0629 (\\u0645\\u062b\\u0644 \\u0627\\u0644\\u0642\\u0637\\u0637 \\u0623\\u0648 \\u0627\\u0644\\u0643\\u0644\\u0627\\u0628 \\u0627\\u0644\\u0635\\u063a\\u064a\\u0631\\u0629)\\u060c \\u0634\\u0631\\u064a\\u0637\\u0629 \\u0648\\u0636\\u0639\\u0647\\u0627 \\u0641\\u064a \\u0635\\u0646\\u062f\\u0648\\u0642 \\u0623\\u0648 \\u062d\\u0642\\u064a\\u0628\\u0629 \\u0645\\u062e\\u0635\\u0635\\u0629 \\u0644\\u0644\\u0646\\u0642\\u0644\\u060c \\u0648\\u0645\\u0631\\u0627\\u0639\\u0627\\u0629 \\u0623\\u0644\\u0627 \\u062a\\u0633\\u0628\\u0628 \\u0625\\u0632\\u0639\\u0627\\u062c\\u064b\\u0627 \\u0644\\u0644\\u0631\\u0643\\u0627\\u0628 \\u0627\\u0644\\u0622\\u062e\\u0631\\u064a\\u0646.\\r\\n\\r\\n\\u0644\\u0627 \\u064a\\u064f\\u0633\\u0645\\u062d \\u0628\\u0648\\u062c\\u0648\\u062f \\u0627\\u0644\\u062d\\u064a\\u0648\\u0627\\u0646\\u0627\\u062a \\u0627\\u0644\\u0643\\u0628\\u064a\\u0631\\u0629 \\u062f\\u0627\\u062e\\u0644 \\u0627\\u0644\\u062d\\u0627\\u0641\\u0644\\u0629 \\u062d\\u0641\\u0627\\u0638\\u064b\\u0627 \\u0639\\u0644\\u0649 \\u0633\\u0644\\u0627\\u0645\\u0629 \\u0648\\u0631\\u0627\\u062d\\u0629 \\u0627\\u0644\\u0631\\u0643\\u0627\\u0628.\\r\\n\\r\\n\\u064a\\u062a\\u062d\\u0645\\u0644 \\u0627\\u0644\\u0631\\u0627\\u0643\\u0628 \\u0643\\u0627\\u0645\\u0644 \\u0627\\u0644\\u0645\\u0633\\u0624\\u0648\\u0644\\u064a\\u0629 \\u0639\\u0646 \\u0646\\u0638\\u0627\\u0641\\u0629 \\u0627\\u0644\\u062d\\u064a\\u0648\\u0627\\u0646 \\u0648\\u0633\\u0644\\u0627\\u0645\\u062a\\u0647 \\u0623\\u062b\\u0646\\u0627\\u0621 \\u0627\\u0644\\u0631\\u062d\\u0644\\u0629.\\r\\n\\r\\n\\u064a\\u064f\\u0641\\u0636\\u0644 \\u0625\\u0628\\u0644\\u0627\\u063a \\u0645\\u0648\\u0638\\u0641\\u064a \\u0627\\u0644\\u062d\\u062c\\u0632 \\u0645\\u0633\\u0628\\u0642\\u064b\\u0627 \\u0641\\u064a \\u062d\\u0627\\u0644 \\u0631\\u063a\\u0628\\u062a\\u0643 \\u0628\\u0627\\u0635\\u0637\\u062d\\u0627\\u0628 \\u062d\\u064a\\u0648\\u0627\\u0646 \\u0623\\u0644\\u064a\\u0641 \\u0644\\u062a\\u0648\\u0641\\u064a\\u0631 \\u0627\\u0644\\u062a\\u0631\\u062a\\u064a\\u0628\\u0627\\u062a \\u0627\\u0644\\u0645\\u0646\\u0627\\u0633\\u0628\\u0629.\"}', NULL, 'basic', '', '2024-07-04 06:06:45', '2025-07-04 20:37:35'),
(86, 'faq.element', '{\"question\":\"\\u0645\\u0627 \\u0647\\u064a \\u0627\\u0644\\u0645\\u062f\\u0646 \\u0623\\u0648 \\u0627\\u0644\\u0645\\u0646\\u0627\\u0637\\u0642 \\u0627\\u0644\\u062a\\u064a \\u062a\\u063a\\u0637\\u064a\\u0647\\u0627 \\u062e\\u0637\\u0648\\u0637 \\u0627\\u0644\\u062d\\u0627\\u0641\\u0644\\u0627\\u062a\\u061f\",\"answer\":\"\\u0646\\u062d\\u0646 \\u0646\\u063a\\u0637\\u064a \\u0645\\u062c\\u0645\\u0648\\u0639\\u0629 \\u0648\\u0627\\u0633\\u0639\\u0629 \\u0645\\u0646 \\u0627\\u0644\\u0645\\u062f\\u0646 \\u0648\\u0627\\u0644\\u0645\\u0646\\u0627\\u0637\\u0642 \\u062f\\u0627\\u062e\\u0644 \\u0627\\u0644\\u062f\\u0648\\u0644\\u0629 \\u0644\\u062a\\u0644\\u0628\\u064a\\u0629 \\u0627\\u062d\\u062a\\u064a\\u0627\\u062c\\u0627\\u062a \\u062c\\u0645\\u064a\\u0639 \\u0627\\u0644\\u0631\\u0643\\u0627\\u0628\\u060c \\u0648\\u062a\\u0634\\u0645\\u0644 \\u062e\\u0637\\u0648\\u0637\\u0646\\u0627 \\u0627\\u0644\\u0631\\u0626\\u064a\\u0633\\u064a\\u0629:\\r\\n\\r\\n\\u0627\\u0644\\u0645\\u062f\\u0646 \\u0627\\u0644\\u0643\\u0628\\u0631\\u0649:\\r\\n\\u0637\\u0631\\u0627\\u0628\\u0644\\u0633 \\u2013 \\u0628\\u0646\\u063a\\u0627\\u0632\\u064a \\u2013 \\u0645\\u0635\\u0631\\u0627\\u062a\\u0629 \\u2013 \\u0633\\u0628\\u0647\\u0627 \\u2013 \\u0627\\u0644\\u0628\\u064a\\u0636\\u0627\\u0621 \\u2013 \\u0627\\u0644\\u0632\\u0627\\u0648\\u064a\\u0629 \\u2013 \\u0632\\u0644\\u064a\\u062a\\u0646\\r\\n\\r\\n\\u0627\\u0644\\u0645\\u0646\\u0627\\u0637\\u0642 \\u0627\\u0644\\u0633\\u0627\\u062d\\u0644\\u064a\\u0629:\\r\\n\\u0627\\u0644\\u062e\\u0645\\u0633 \\u2013 \\u062f\\u0631\\u0646\\u0629 \\u2013 \\u0637\\u0628\\u0631\\u0642 \\u2013 \\u0633\\u0631\\u062a \\u2013 \\u0631\\u0627\\u0633 \\u0644\\u0627\\u0646\\u0648\\u0641\\r\\n\\r\\n\\u0627\\u0644\\u0645\\u0646\\u0627\\u0637\\u0642 \\u0627\\u0644\\u062c\\u0646\\u0648\\u0628\\u064a\\u0629:\\r\\n\\u0623\\u0648\\u0628\\u0627\\u0631\\u064a \\u2013 \\u0645\\u0631\\u0632\\u0642 \\u2013 \\u063a\\u0627\\u062a \\u2013 \\u0627\\u0644\\u0643\\u0641\\u0631\\u0629\\r\\n\\r\\n\\u0627\\u0644\\u0645\\u0639\\u0627\\u0628\\u0631 \\u0627\\u0644\\u062d\\u062f\\u0648\\u062f\\u064a\\u0629 (\\u0625\\u0646 \\u0648\\u062c\\u062f\\u062a):\\r\\n\\u0631\\u0623\\u0633 \\u0627\\u062c\\u062f\\u064a\\u0631 (\\u0627\\u0644\\u062d\\u062f\\u0648\\u062f \\u0627\\u0644\\u062a\\u0648\\u0646\\u0633\\u064a\\u0629) \\u2013 \\u0645\\u0633\\u0627\\u0639\\u062f (\\u0627\\u0644\\u062d\\u062f\\u0648\\u062f \\u0627\\u0644\\u0645\\u0635\\u0631\\u064a\\u0629)\\r\\n\\r\\n\\u0646\\u062d\\u0631\\u0635 \\u062f\\u0627\\u0626\\u0645\\u064b\\u0627 \\u0639\\u0644\\u0649 \\u062a\\u0648\\u0633\\u064a\\u0639 \\u0634\\u0628\\u0643\\u0629 \\u0627\\u0644\\u062e\\u0637\\u0648\\u0637 \\u0644\\u062a\\u0634\\u0645\\u0644 \\u0645\\u0646\\u0627\\u0637\\u0642 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u062d\\u0633\\u0628 \\u0627\\u0644\\u0637\\u0644\\u0628 \\u0648\\u0627\\u062d\\u062a\\u064a\\u0627\\u062c\\u0627\\u062a \\u0627\\u0644\\u0645\\u0633\\u0627\\u0641\\u0631\\u064a\\u0646. \\u0628\\u0625\\u0645\\u0643\\u0627\\u0646\\u0643 \\u0627\\u0644\\u062a\\u062d\\u0642\\u0642 \\u0645\\u0646 \\u0627\\u0644\\u062e\\u0637\\u0648\\u0637 \\u0627\\u0644\\u0645\\u062a\\u0648\\u0641\\u0631\\u0629 \\u0641\\u064a \\u0645\\u0646\\u0637\\u0642\\u062a\\u0643 \\u0639\\u0628\\u0631 \\u062a\\u0637\\u0628\\u064a\\u0642\\u0646\\u0627 \\u0623\\u0648 \\u0645\\u0648\\u0642\\u0639 \\u0627\\u0644\\u062d\\u062c\\u0632 \\u0627\\u0644\\u0625\\u0644\\u0643\\u062a\\u0631\\u0648\\u0646\\u064a.\"}', NULL, 'basic', '', '2024-07-04 06:07:02', '2025-07-04 20:36:14'),
(87, 'footer.content', '{\"short_description\":\"\\u0623\\u0647\\u0644\\u0627 \\u0628\\u0643\\u0645\"}', NULL, 'basic', '', '2024-07-04 06:07:39', '2025-07-07 11:55:48'),
(88, 'how_it_works.content', '{\"heading\":\"\\u0627\\u062d\\u0635\\u0644 \\u0639\\u0644\\u0649 \\u062a\\u0630\\u0643\\u0631\\u062a\\u0643 \\u0628\\u062b\\u0644\\u0627\\u062b \\u062e\\u0637\\u0648\\u0627\\u062a \\u0641\\u0642\\u0637\",\"sub_heading\":\"\\u0623\\u0644\\u0642\\u0650 \\u0646\\u0638\\u0631\\u0629 \\u0639\\u0644\\u0649 \\u0633\\u0628\\u0628\\u0646\\u0627 \\u0627\\u0644\\u0634\\u0627\\u0626\\u0639 \\u0644\\u0627\\u062e\\u062a\\u064a\\u0627\\u0631 \\u062d\\u0627\\u0641\\u0644\\u062a\\u0643. \\u0645\\u0627 \\u0639\\u0644\\u064a\\u0643 \\u0633\\u0648\\u0649 \\u062d\\u062c\\u0632 \\u062d\\u0627\\u0641\\u0644\\u0629 \\u0648\\u0627\\u062d\\u0635\\u0644 \\u0639\\u0644\\u0649 \\u062a\\u0630\\u0643\\u0631\\u0629 \\u0644\\u0631\\u062d\\u0644\\u062a\\u0643 \\u0627\\u0644\\u0631\\u0627\\u0626\\u0639\\u0629.\"}', NULL, 'basic', '', '2024-07-04 06:08:01', '2025-07-04 20:03:43'),
(89, 'how_it_works.element', '{\"heading\":\"\\u0627\\u0628\\u062d\\u062b \\u0639\\u0646 \\u062d\\u0627\\u0641\\u0644\\u062a\\u0643\",\"sub_heading\":\"\\u0627\\u062e\\u062a\\u0631 \\u0646\\u0642\\u0637\\u0629 \\u0627\\u0646\\u0637\\u0644\\u0627\\u0642\\u0643 \\u0648\\u0648\\u062c\\u0647\\u062a\\u0643\\u060c \\u0645\\u0627 \\u0639\\u0644\\u064a\\u0643 \\u0633\\u0648\\u0649 \\u0627\\u062e\\u062a\\u064a\\u0627\\u0631 \\u062a\\u0648\\u0627\\u0631\\u064a\\u062e \\u0631\\u062d\\u0644\\u0629 \\u0627\\u0644\\u062d\\u0627\\u0641\\u0644\\u0629 \\u0648\\u0627\\u0644\\u0628\\u062d\\u062b \\u0639\\u0646 \\u0627\\u0644\\u062d\\u0627\\u0641\\u0644\\u0627\\u062a\",\"icon\":\"<i class=\\\"las la-search\\\"><\\/i>\"}', NULL, 'basic', '', '2024-07-04 06:08:24', '2025-07-04 19:42:29'),
(90, 'how_it_works.element', '{\"heading\":\"\\u0627\\u062e\\u062a\\u0631 \\u0627\\u0644\\u062a\\u0630\\u0643\\u0631\\u0629\",\"sub_heading\":\"\\u0627\\u062e\\u062a\\u0631 \\u0646\\u0642\\u0637\\u0629 \\u0627\\u0646\\u0637\\u0644\\u0627\\u0642\\u0643 \\u0648\\u0648\\u062c\\u0647\\u062a\\u0643\\u060c \\u0641\\u0642\\u0637 \\u062d\\u0627\\u0641\\u0644\\u0629 \\u0644\\u062a\\u0627\\u0631\\u064a\\u062e \\u0631\\u062d\\u0644\\u062a\\u0643 \\u0627\\u0644\\u0631\\u0627\\u0626\\u0639\\u0629 \\u0648\\u0627\\u0628\\u062d\\u062b \\u0639\\u0646 \\u0627\\u0644\\u062d\\u0627\\u0641\\u0644\\u0627\\u062a\",\"icon\":\"<i class=\\\"las la-ticket-alt\\\"><\\/i>\"}', NULL, 'basic', '', '2024-07-04 06:08:41', '2025-07-04 19:41:52'),
(91, 'how_it_works.element', '{\"heading\":\"\\u062f\\u0641\\u0639 \\u0627\\u0644\\u0641\\u0627\\u062a\\u0648\\u0631\\u0629\",\"sub_heading\":\"\\u0627\\u062e\\u062a\\u0631 \\u0646\\u0642\\u0637\\u0629 \\u0627\\u0646\\u0637\\u0644\\u0627\\u0642\\u0643 \\u0648\\u0648\\u062c\\u0647\\u062a\\u0643\\u060c \\u0648\\u0627\\u062e\\u062a\\u0631 \\u062d\\u0627\\u0641\\u0644\\u0629 \\u0644\\u062a\\u0627\\u0631\\u064a\\u062e \\u0631\\u062d\\u0644\\u062a\\u0643 \\u0627\\u0644\\u0631\\u0627\\u0626\\u0639\\u0629 \\u0648\\u0627\\u0628\\u062d\\u062b \\u0639\\u0646 \\u0627\\u0644\\u062d\\u0627\\u0641\\u0644\\u0627\\u062a\",\"icon\":\"<i class=\\\"las la-money-bill-wave-alt\\\"><\\/i>\"}', NULL, 'basic', '', '2024-07-04 06:08:58', '2025-07-04 19:41:11'),
(92, 'social_links.element', '{\"name\":\"Facebook\",\"icon\":\"<i class=\\\"lab la-facebook-f\\\"><\\/i>\",\"url\":\"https:\\/\\/www.facebook.com\\/\"}', NULL, 'basic', '', '2024-07-04 06:09:46', '2024-07-04 06:09:46'),
(96, 'testimonials.content', '{\"heading\":\"\\u0634\\u0647\\u0627\\u062f\\u0627\\u062a\\u0646\\u0627\",\"sub_heading\":\"\\u0623\\u0644\\u0642\\u0650 \\u0646\\u0638\\u0631\\u0629 \\u0639\\u0644\\u0649 \\u0633\\u0628\\u0628\\u0646\\u0627 \\u0627\\u0644\\u0634\\u0627\\u0626\\u0639 \\u0644\\u0627\\u062e\\u062a\\u064a\\u0627\\u0631 \\u062d\\u0627\\u0641\\u0644\\u062a\\u0643. \\u0645\\u0627 \\u0639\\u0644\\u064a\\u0643 \\u0633\\u0648\\u0649 \\u0627\\u062e\\u062a\\u064a\\u0627\\u0631 \\u062d\\u0627\\u0641\\u0644\\u0629 \\u0648\\u0627\\u062d\\u0635\\u0644 \\u0639\\u0644\\u0649 \\u062a\\u0630\\u0643\\u0631\\u0629 \\u0644\\u0631\\u062d\\u0644\\u062a\\u0643 \\u0627\\u0644\\u0631\\u0627\\u0626\\u0639\\u0629!\"}', NULL, 'basic', '', '2024-07-04 06:11:47', '2025-07-04 19:45:09'),
(98, 'testimonials.element', '{\"has_image\":\"1\",\"person\":\"\\u064a\\u062d\\u064a\\u0649\",\"description\":\"\\u0643\\u0627\\u0646\\u062a \\u062a\\u062c\\u0631\\u0628\\u0629 \\u0631\\u0627\\u0626\\u0639\\u0629\",\"image\":\"68683453e51bc1751659603.png\"}', NULL, 'basic', '', '2024-07-04 06:15:35', '2025-07-04 20:06:44'),
(99, 'cookie.data', '{\"short_desc\":\"We may use cookies or any other tracking technologies when you visit our website, including any other media form, mobile website, or mobile application related or connected to help customize the Site and improve your experience.\",\"description\":\"<h4>Cookie Policy<\\/h4>\\r\\n\\r\\n<p>This Cookie Policy explains how to use cookies and similar technologies to recognize you when you visit our website. It explains what these technologies are and why we use them, as well as your rights to control our use of them.<\\/p>\\r\\n<br>\\r\\n<h4>What are cookies?<\\/h4>\\r\\n\\r\\n<p>Cookies are small pieces of data stored on your computer or mobile device when you visit a website. Cookies are widely used by website owners to make their websites work, or to work more efficiently, as well as to provide reporting information.<\\/p>\\r\\n<br>\\r\\n<h4>Why do we use cookies?<\\/h4>\\r\\n\\r\\n<p>We use cookies for several reasons. Some cookies are required for technical reasons for our Website to operate, and we refer to these as \\\"essential\\\" or \\\"strictly necessary\\\" cookies. Other cookies enable us to track and target the interests of our users to enhance the experience on our Website. Third parties serve cookies through our Website for advertising, analytics, and other purposes.<\\/p>\\r\\n<br>\\r\\n<h4>What types of cookies do we use?<\\/h4>\\r\\n\\r\\n<div>\\r\\n    <ul style=\\\"list-style: unset;\\\">\\r\\n        <li>\\r\\n            <strong>Essential Website Cookies:<\\/strong> \\r\\n            These cookies are strictly necessary to provide you with services available through our Website and to use some of its features.\\r\\n        <\\/li>\\r\\n        <li>\\r\\n            <strong>Analytics and Performance Cookies:<\\/strong> \\r\\n            These cookies allow us to count visits and traffic sources to measure and improve our Website\'s performance.\\r\\n        <\\/li>\\r\\n        <li>\\r\\n            <strong>Advertising Cookies:<\\/strong> \\r\\n            These cookies make advertising messages more relevant to you and your interests. They perform functions like preventing the same ad from continuously reappearing, ensuring that ads are properly displayed, and in some cases selecting advertisements that are based on your interests.\\r\\n        <\\/li>\\r\\n    <\\/ul>\\r\\n<\\/div>\\r\\n<br>\\r\\n<h4>Data Collected by Cookies<\\/h4>\\r\\n<p>Cookies may collect various types of data, including but not limited to:<\\/p>\\r\\n<ul style=\\\"list-style: unset;\\\">\\r\\n    <li>IP addresses<\\/li>\\r\\n    <li>Browser and device information<\\/li>\\r\\n    <li>Referring website addresses<\\/li>\\r\\n    <li>Pages visited on our website<\\/li>\\r\\n    <li>Interactions with our website, such as clicks and mouse movements<\\/li>\\r\\n    <li>Time spent on our website<\\/li>\\r\\n<\\/ul>\\r\\n<br>\\r\\n<h4>How We Use Collected Data<\\/h4>\\r\\n\\r\\n<p>We may use data collected by cookies for the following purposes:<\\/p>\\r\\n<ul style=\\\"list-style: unset;\\\">\\r\\n    <li>To personalize your experience on our website<\\/li>\\r\\n    <li>To improve our website\'s functionality and performance<\\/li>\\r\\n    <li>To analyze trends and gather demographic information about our user base<\\/li>\\r\\n    <li>To deliver targeted advertising based on your interests<\\/li>\\r\\n    <li>To prevent fraudulent activity and enhance website security<\\/li>\\r\\n<\\/ul>\\r\\n<br>\\r\\n<h4>Third-party cookies<\\/h4>\\r\\n\\r\\n<p>In addition to our cookies, we may also use various third-party cookies to report usage statistics of our Website, deliver advertisements on and through our Website, and so on.<\\/p>\\r\\n<br>\\r\\n<h4>How can we control cookies?<\\/h4>\\r\\n\\r\\n<p>You have the right to decide whether to accept or reject cookies. You can exercise your cookie preferences by clicking on the \\\"Cookie Settings\\\" link in the footer of our website. You can also set or amend your web browser controls to accept or refuse cookies. If you choose to reject cookies, you may still use our Website though your access to some functionality and areas of our Website may be restricted.<\\/p>\\r\\n<br>\\r\\n<h4>Changes to our Cookie Policy<\\/h4>\\r\\n\\r\\n<p>We may update our Cookie Policy from time to time. We will notify you of any changes by posting the new Cookie Policy on this page.<\\/p>\",\"status\":1}', NULL, NULL, NULL, NULL, NULL),
(100, 'faq.content', '{\"heading\":\"\\u0627\\u0644\\u0623\\u0633\\u0626\\u0644\\u0629 \\u0627\\u0644\\u0634\\u0627\\u0626\\u0639\\u0629\",\"sub_heading\":\"\\u0644\\u0627 \\u064a\\u0648\\u062c\\u062f \\u0623\\u064a \\u0631\\u063a\\u0628\\u0629 \\u0641\\u064a \\u0627\\u062e\\u062a\\u064a\\u0627\\u0631 \\u0627\\u0644\\u0623\\u0630\\u0646\\u060c \\u0645\\u0645\\u0627 \\u064a\\u0639\\u0646\\u064a \\u0639\\u062f\\u0645 \\u062d\\u062f\\u0648\\u062b \\u0623\\u064a \\u0639\\u0645\\u0644 \\u062e\\u0627\\u0631\\u062c \\u0627\\u0644\\u062c\\u0633\\u0645 \\u0623\\u062b\\u0646\\u0627\\u0621 \\u0645\\u0645\\u0627\\u0631\\u0633\\u0629 \\u0627\\u0644\\u0631\\u064a\\u0627\\u0636\\u0629\\u060c \\u0623\\u0648 \\u063a\\u064a\\u0631 \\u0630\\u0644\\u0643 \\u0645\\u0646 \\u0627\\u0644\\u0627\\u0633\\u062a\\u062b\\u0646\\u0627\\u0621\\u0627\\u062a.\"}', NULL, 'basic', '', '2024-07-04 06:50:15', '2025-07-04 20:25:52'),
(101, 'sign_in.content', '{\"has_image\":\"1\",\"heading\":\"Welcome to Bus Booking\",\"sub_heading\":\"Sign In your Account\",\"background_image\":\"6686a2e20d8421720099554.jpg\"}', NULL, 'basic', '', '2024-07-04 07:25:54', '2024-07-04 07:25:54'),
(102, 'sign_up.content', '{\"has_image\":\"1\",\"heading\":\"Welcome to Bus Booking\",\"sub_heading\":\"Sign Up your Account\",\"background_image\":\"6686a396adb0a1720099734.jpg\"}', NULL, 'basic', '', '2024-07-04 07:28:54', '2024-07-04 07:28:55'),
(108, 'blog.element', '{\"has_image\":[\"1\"],\"title\":\"\\u0623\\u064a\\u0646 \\u064a\\u0645\\u0643\\u0646\\u0646\\u064a \\u0627\\u0644\\u062d\\u0635\\u0648\\u0644 \\u0639\\u0644\\u0649 \\u0628\\u0639\\u0636 \\u0645\\u0646\\u0647\\u0627\\u061f\",\"description\":\"<div style=\\\"text-align:justify;\\\"><font color=\\\"#000000\\\" face=\\\"Open Sans, Arial, sans-serif\\\"><span style=\\\"font-size:14px;\\\">\\u0646\\u0646\\u0635\\u062d \\u0628\\u0647\\u0630\\u0647 \\u0627\\u0644\\u062a\\u062c\\u0631\\u0628\\u0629\\u00a0<\\/span><\\/font><\\/div>\",\"image\":\"686bb817e61d91751889943.jpg\"}', NULL, 'basic', 'lmatha-nstkhdmh', '2024-07-26 05:48:55', '2025-08-21 00:41:16'),
(109, 'blog.element', '{\"has_image\":[\"1\"],\"title\":\"\\u0644\\u0645\\u0627\\u0630\\u0627 \\u0646\\u0633\\u062a\\u062e\\u062f\\u0645\\u0647\\u061f\",\"description\":\"<p style=\\\"margin-right:0px;margin-bottom:15px;margin-left:0px;color:rgb(0,0,0);font-size:14px;padding:0px;text-align:justify;font-family:\'Open Sans\', Arial, sans-serif;\\\">\\u0624\\u0643\\u0627\\u0646\\u062a \\u062a\\u062c\\u0631\\u0628\\u0629 \\u0633\\u0641\\u0631 \\u0645\\u0645\\u064a\\u0632\\u0629 \\u0648\\u0628\\u0627\\u0644\\u062a\\u0623\\u0643\\u064a\\u062f \\u0633\\u0646\\u0639\\u064a\\u062f\\u0647\\u0627 \\u0645\\u0631\\u0627\\u0631\\u0627 \\u062a\\u0643\\u0631\\u0627\\u0631\\u0627\\u00a0<\\/p>\",\"image\":\"686bb806208731751889926.jpg\"}', NULL, 'basic', 'ayn-ymknny-alhsol-aal-baad-mnha', '2024-07-26 05:49:38', '2025-08-21 00:40:09'),
(112, 'policy_pages.element', '{\"title\":\"\\u0633\\u064a\\u0627\\u0633\\u0627\\u062a \\u0627\\u0644\\u062a\\u0630\\u0627\\u0643\\u0631\",\"details\":\"<p>\\u0641\\u064a <strong>\\u0634\\u0631\\u0643\\u0629 \\u0627\\u0644\\u0645\\u0633\\u0627\\u0631 \\u0644\\u0644\\u0646\\u0642\\u0644 \\u0627\\u0644\\u0628\\u0631\\u064a<\\/strong>\\u060c \\u0646\\u0644\\u062a\\u0632\\u0645 \\u0628\\u062a\\u0648\\u0641\\u064a\\u0631 \\u062a\\u062c\\u0631\\u0628\\u0629 \\u0633\\u0641\\u0631 \\u0622\\u0645\\u0646\\u0629 \\u0648\\u0645\\u0646\\u0638\\u0645\\u0629 \\u0644\\u0639\\u0645\\u0644\\u0627\\u0626\\u0646\\u0627. \\u0644\\u0630\\u0644\\u0643\\u060c \\u0646\\u0631\\u062c\\u0648 \\u0645\\u0646\\u0643\\u0645 \\u0642\\u0631\\u0627\\u0621\\u0629 \\u0648\\u0641\\u0647\\u0645 \\u0633\\u064a\\u0627\\u0633\\u0629 \\u0627\\u0644\\u062a\\u0630\\u0627\\u0643\\u0631 \\u0627\\u0644\\u062a\\u0627\\u0644\\u064a\\u0629 \\u0628\\u0639\\u0646\\u0627\\u064a\\u0629 \\u0642\\u0628\\u0644 \\u0627\\u0644\\u062d\\u062c\\u0632 \\u0623\\u0648 \\u0627\\u0633\\u062a\\u062e\\u062f\\u0627\\u0645 \\u0623\\u064a \\u0645\\u0646 \\u062e\\u062f\\u0645\\u0627\\u062a\\u0646\\u0627.<\\/p><p><br \\/><\\/p><h3>\\u00a0\\u062d\\u062c\\u0632 \\u0627\\u0644\\u062a\\u0630\\u0627\\u0643\\u0631<\\/h3><p>\\r\\n<\\/p><ol>\\r\\n<li>\\r\\n<p>\\u064a\\u0645\\u0643\\u0646 \\u062d\\u062c\\u0632 \\u0627\\u0644\\u062a\\u0630\\u0627\\u0643\\u0631 \\u0639\\u0628\\u0631 \\u0627\\u0644\\u0645\\u0648\\u0642\\u0639 \\u0627\\u0644\\u0625\\u0644\\u0643\\u062a\\u0631\\u0648\\u0646\\u064a\\u060c \\u0627\\u0644\\u062a\\u0637\\u0628\\u064a\\u0642\\u060c \\u0623\\u0648 \\u0645\\u0646 \\u062e\\u0644\\u0627\\u0644 \\u0645\\u0643\\u0627\\u062a\\u0628\\u0646\\u0627 \\u0627\\u0644\\u0645\\u0639\\u062a\\u0645\\u062f\\u0629.<\\/p>\\r\\n<\\/li>\\r\\n<li>\\r\\n<p>\\u064a\\u062c\\u0628 \\u0625\\u062f\\u062e\\u0627\\u0644 \\u0627\\u0644\\u0628\\u064a\\u0627\\u0646\\u0627\\u062a \\u0627\\u0644\\u0634\\u062e\\u0635\\u064a\\u0629 \\u0628\\u062f\\u0642\\u0629 \\u0623\\u062b\\u0646\\u0627\\u0621 \\u0627\\u0644\\u062d\\u062c\\u0632 (\\u0627\\u0644\\u0627\\u0633\\u0645 \\u0627\\u0644\\u0643\\u0627\\u0645\\u0644\\u060c \\u0631\\u0642\\u0645 \\u0627\\u0644\\u0647\\u0648\\u064a\\u0629\\u060c \\u0631\\u0642\\u0645 \\u0627\\u0644\\u0647\\u0627\\u062a\\u0641...).<\\/p>\\r\\n<\\/li>\\r\\n<li>\\r\\n<p>\\u064a\\u0639\\u062a\\u0628\\u0631 \\u0627\\u0644\\u062d\\u062c\\u0632 \\u0645\\u0624\\u0643\\u062f\\u064b\\u0627 \\u0641\\u0642\\u0637 \\u0628\\u0639\\u062f \\u0625\\u062a\\u0645\\u0627\\u0645 \\u0639\\u0645\\u0644\\u064a\\u0629 \\u0627\\u0644\\u062f\\u0641\\u0639 \\u0648\\u0627\\u0644\\u062d\\u0635\\u0648\\u0644 \\u0639\\u0644\\u0649 \\u0625\\u0634\\u0639\\u0627\\u0631 \\u0628\\u0627\\u0644\\u062a\\u0623\\u0643\\u064a\\u062f.<\\/p>\\r\\n<\\/li>\\r\\n<\\/ol><div><font color=\\\"#5b6e88\\\"><span style=\\\"font-size:14px;\\\"><br \\/><\\/span><\\/font><\\/div><div><h3>\\u0645\\u0648\\u0627\\u0639\\u064a\\u062f \\u0627\\u0644\\u0631\\u062d\\u0644\\u0627\\u062a<\\/h3>\\r\\n<ol>\\r\\n<li>\\r\\n<p>\\u064a\\u062c\\u0628 \\u0639\\u0644\\u0649 \\u0627\\u0644\\u0645\\u0633\\u0627\\u0641\\u0631 \\u0627\\u0644\\u062d\\u0636\\u0648\\u0631 \\u0625\\u0644\\u0649 \\u0646\\u0642\\u0637\\u0629 \\u0627\\u0644\\u0627\\u0646\\u0637\\u0644\\u0627\\u0642 \\u0642\\u0628\\u0644 <strong>30 \\u062f\\u0642\\u064a\\u0642\\u0629 \\u0639\\u0644\\u0649 \\u0627\\u0644\\u0623\\u0642\\u0644<\\/strong> \\u0645\\u0646 \\u0645\\u0648\\u0639\\u062f \\u0627\\u0644\\u0631\\u062d\\u0644\\u0629.<\\/p>\\r\\n<\\/li>\\r\\n<li>\\r\\n<p>\\u0627\\u0644\\u0634\\u0631\\u0643\\u0629 \\u063a\\u064a\\u0631 \\u0645\\u0633\\u0624\\u0648\\u0644\\u0629 \\u0639\\u0646 \\u062a\\u0623\\u062e\\u0631 \\u0627\\u0644\\u0645\\u0633\\u0627\\u0641\\u0631 \\u0639\\u0646 \\u0645\\u0648\\u0639\\u062f \\u0627\\u0644\\u0627\\u0646\\u0637\\u0644\\u0627\\u0642\\u060c \\u0648\\u0644\\u0646 \\u064a\\u062a\\u0645 \\u0627\\u0633\\u062a\\u0631\\u062f\\u0627\\u062f \\u0642\\u064a\\u0645\\u0629 \\u0627\\u0644\\u062a\\u0630\\u0643\\u0631\\u0629 \\u0641\\u064a \\u0647\\u0630\\u0647 \\u0627\\u0644\\u062d\\u0627\\u0644\\u0629.<\\/p>\\r\\n<\\/li>\\r\\n<li>\\r\\n<p>\\u062a\\u062d\\u062a\\u0641\\u0638 \\u0627\\u0644\\u0634\\u0631\\u0643\\u0629 \\u0628\\u062d\\u0642 \\u062a\\u0639\\u062f\\u064a\\u0644 \\u0645\\u0648\\u0627\\u0639\\u064a\\u062f \\u0627\\u0644\\u0631\\u062d\\u0644\\u0627\\u062a \\u0641\\u064a \\u062d\\u0627\\u0644\\u0627\\u062a \\u0627\\u0644\\u0637\\u0648\\u0627\\u0631\\u0626 \\u0623\\u0648 \\u0627\\u0644\\u0638\\u0631\\u0648\\u0641 \\u0627\\u0644\\u062c\\u0648\\u064a\\u0629 \\u0623\\u0648 \\u0644\\u0623\\u0633\\u0628\\u0627\\u0628 \\u062a\\u0634\\u063a\\u064a\\u0644\\u064a\\u0629\\u060c \\u0648\\u0633\\u064a\\u062a\\u0645 \\u0625\\u0639\\u0644\\u0627\\u0645 \\u0627\\u0644\\u0631\\u0643\\u0627\\u0628 \\u0628\\u0630\\u0644\\u0643 \\u0641\\u064a \\u0623\\u0642\\u0631\\u0628 \\u0648\\u0642\\u062a \\u0645\\u0645\\u0643\\u0646.<\\/p>\\r\\n<\\/li>\\r\\n<\\/ol><div><font color=\\\"#5b6e88\\\"><span style=\\\"font-size:14px;\\\"><br \\/><\\/span><\\/font><\\/div><div><font color=\\\"#5b6e88\\\"><span style=\\\"font-size:14px;\\\"><br \\/><\\/span><\\/font><\\/div><div><h3>\\u0625\\u0644\\u063a\\u0627\\u0621 \\u0627\\u0644\\u062a\\u0630\\u0627\\u0643\\u0631<\\/h3>\\r\\n<ol>\\r\\n<li>\\r\\n<p>\\u064a\\u0645\\u0643\\u0646 \\u0625\\u0644\\u063a\\u0627\\u0621 \\u0627\\u0644\\u062a\\u0630\\u0643\\u0631\\u0629 \\u0642\\u0628\\u0644 \\u0645\\u0648\\u0639\\u062f \\u0627\\u0644\\u0631\\u062d\\u0644\\u0629 \\u0628\\u0640 <strong>12 \\u0633\\u0627\\u0639\\u0629 \\u0639\\u0644\\u0649 \\u0627\\u0644\\u0623\\u0642\\u0644<\\/strong> \\u0644\\u0644\\u062d\\u0635\\u0648\\u0644 \\u0639\\u0644\\u0649 \\u0627\\u0633\\u062a\\u0631\\u062f\\u0627\\u062f \\u062c\\u0632\\u0626\\u064a.<\\/p>\\r\\n<\\/li>\\r\\n<li>\\r\\n<p>\\u064a\\u064f\\u062e\\u0635\\u0645 \\u0645\\u0646 \\u0642\\u064a\\u0645\\u0629 \\u0627\\u0644\\u062a\\u0630\\u0643\\u0631\\u0629 \\u0631\\u0633\\u0648\\u0645 \\u0625\\u062f\\u0627\\u0631\\u064a\\u0629 \\u0628\\u0646\\u0633\\u0628\\u0629 <strong>10%<\\/strong> \\u0639\\u0646\\u062f \\u0627\\u0644\\u0625\\u0644\\u063a\\u0627\\u0621.<\\/p>\\r\\n<\\/li>\\r\\n<li>\\r\\n<p>\\u0644\\u0627 \\u064a\\u0645\\u0643\\u0646 \\u0625\\u0644\\u063a\\u0627\\u0621 \\u0627\\u0644\\u062a\\u0630\\u0643\\u0631\\u0629 \\u0623\\u0648 \\u0627\\u0633\\u062a\\u0631\\u062f\\u0627\\u062f \\u0642\\u064a\\u0645\\u062a\\u0647\\u0627 \\u0628\\u0639\\u062f \\u0628\\u062f\\u0621 \\u0627\\u0644\\u0631\\u062d\\u0644\\u0629 \\u0623\\u0648 \\u0641\\u064a \\u062d\\u0627\\u0644 \\u0639\\u062f\\u0645 \\u0627\\u0644\\u062d\\u0636\\u0648\\u0631<\\/p><\\/li><\\/ol><div><font color=\\\"#5b6e88\\\"><span style=\\\"font-size:14px;\\\"><br \\/><\\/span><\\/font><\\/div><\\/div><\\/div><div><h3>\\u062a\\u0639\\u062f\\u064a\\u0644 \\u0627\\u0644\\u062d\\u062c\\u0632<\\/h3>\\r\\n<ol>\\r\\n<li>\\r\\n<p>\\u064a\\u064f\\u0633\\u0645\\u062d \\u0628\\u062a\\u0639\\u062f\\u064a\\u0644 \\u0645\\u0648\\u0639\\u062f \\u0627\\u0644\\u0631\\u062d\\u0644\\u0629 \\u0644\\u0645\\u0631\\u0629 \\u0648\\u0627\\u062d\\u062f\\u0629 \\u0641\\u0642\\u0637\\u060c \\u0634\\u0631\\u064a\\u0637\\u0629 \\u062a\\u0648\\u0641\\u0631 \\u0645\\u0642\\u0627\\u0639\\u062f \\u0641\\u064a \\u0627\\u0644\\u0631\\u062d\\u0644\\u0629 \\u0627\\u0644\\u062c\\u062f\\u064a\\u062f\\u0629.<\\/p>\\r\\n<\\/li>\\r\\n<li>\\r\\n<p>\\u064a\\u062c\\u0628 \\u062a\\u0642\\u062f\\u064a\\u0645 \\u0637\\u0644\\u0628 \\u0627\\u0644\\u062a\\u0639\\u062f\\u064a\\u0644 \\u0642\\u0628\\u0644 \\u0645\\u0648\\u0639\\u062f \\u0627\\u0644\\u0631\\u062d\\u0644\\u0629 \\u0628\\u0640 <strong>12 \\u0633\\u0627\\u0639\\u0629 \\u0639\\u0644\\u0649 \\u0627\\u0644\\u0623\\u0642\\u0644<\\/strong>.<\\/p><\\/li><\\/ol><div><font color=\\\"#5b6e88\\\"><span style=\\\"font-size:14px;\\\"><br \\/><\\/span><\\/font><\\/div><\\/div><div><h3>\\u0645\\u0642\\u0627\\u0639\\u062f \\u0645\\u062e\\u0635\\u0635\\u0629<\\/h3>\\r\\n<ol>\\r\\n<li>\\r\\n<p>\\u064a\\u062a\\u0645 \\u062a\\u062e\\u0635\\u064a\\u0635 \\u0627\\u0644\\u0645\\u0642\\u0627\\u0639\\u062f \\u062a\\u0644\\u0642\\u0627\\u0626\\u064a\\u064b\\u0627 \\u0623\\u062b\\u0646\\u0627\\u0621 \\u0627\\u0644\\u062d\\u062c\\u0632.<\\/p>\\r\\n<\\/li>\\r\\n<li>\\r\\n<p>\\u064a\\u0645\\u0643\\u0646 \\u0644\\u0644\\u0645\\u0633\\u0627\\u0641\\u0631 \\u0637\\u0644\\u0628 \\u062a\\u063a\\u064a\\u064a\\u0631 \\u0627\\u0644\\u0645\\u0642\\u0639\\u062f \\u062d\\u0633\\u0628 \\u0627\\u0644\\u062a\\u0648\\u0641\\u0631 \\u0645\\u0642\\u0627\\u0628\\u0644 \\u0631\\u0633\\u0648\\u0645 \\u0625\\u0636\\u0627\\u0641\\u064a\\u0629.<\\/p>\\r\\n<\\/li>\\r\\n<\\/ol><div><font color=\\\"#5b6e88\\\"><span style=\\\"font-size:14px;\\\"><br \\/><\\/span><\\/font><\\/div><\\/div><div><h3>\\u00a0\\u0627\\u0644\\u0623\\u0645\\u062a\\u0639\\u0629<\\/h3>\\r\\n<ol>\\r\\n<li>\\r\\n<p>\\u064a\\u064f\\u0633\\u0645\\u062d \\u0644\\u0643\\u0644 \\u0631\\u0627\\u0643\\u0628 \\u0628\\u062d\\u0642\\u064a\\u0628\\u0629 \\u0648\\u0627\\u062d\\u062f\\u0629 \\u0644\\u0627 \\u062a\\u062a\\u062c\\u0627\\u0648\\u0632 <strong>25 \\u0643\\u063a<\\/strong> \\u0645\\u062c\\u0627\\u0646\\u064b\\u0627.<\\/p>\\r\\n<\\/li>\\r\\n<li>\\r\\n<p>\\u0627\\u0644\\u0623\\u0645\\u062a\\u0639\\u0629 \\u0627\\u0644\\u0632\\u0627\\u0626\\u062f\\u0629 \\u062a\\u062e\\u0636\\u0639 \\u0644\\u0631\\u0633\\u0648\\u0645 \\u0625\\u0636\\u0627\\u0641\\u064a\\u0629\\u060c \\u0648\\u064a\\u062c\\u0628 \\u0625\\u0628\\u0644\\u0627\\u063a \\u0627\\u0644\\u0645\\u0648\\u0638\\u0641 \\u0639\\u0646\\u062f \\u0627\\u0644\\u062d\\u062c\\u0632.<\\/p>\\r\\n<\\/li>\\r\\n<li>\\r\\n<p>\\u0627\\u0644\\u0634\\u0631\\u0643\\u0629 \\u063a\\u064a\\u0631 \\u0645\\u0633\\u0624\\u0648\\u0644\\u0629 \\u0639\\u0646 \\u0641\\u0642\\u062f\\u0627\\u0646 \\u0623\\u0648 \\u062a\\u0644\\u0641 \\u0627\\u0644\\u0623\\u0645\\u062a\\u0639\\u0629 \\u063a\\u064a\\u0631 \\u0627\\u0644\\u0645\\u0633\\u062c\\u0644\\u0629.<\\/p>\\r\\n<\\/li>\\r\\n<\\/ol><div><font color=\\\"#5b6e88\\\"><span style=\\\"font-size:14px;\\\"><br \\/><\\/span><\\/font><\\/div><div><h3>\\u0627\\u0644\\u0623\\u0637\\u0641\\u0627\\u0644<\\/h3>\\r\\n<ol>\\r\\n<li>\\r\\n<p>\\u0627\\u0644\\u0623\\u0637\\u0641\\u0627\\u0644 \\u062f\\u0648\\u0646 \\u0633\\u0646 <strong>5 \\u0633\\u0646\\u0648\\u0627\\u062a<\\/strong> \\u064a\\u0633\\u0627\\u0641\\u0631\\u0648\\u0646 \\u0645\\u062c\\u0627\\u0646\\u064b\\u0627 \\u0628\\u0634\\u0631\\u0637 \\u0639\\u062f\\u0645 \\u0634\\u063a\\u0644 \\u0645\\u0642\\u0639\\u062f \\u0645\\u0633\\u062a\\u0642\\u0644.<\\/p>\\r\\n<\\/li>\\r\\n<li>\\r\\n<p>\\u064a\\u062c\\u0628 \\u0634\\u0631\\u0627\\u0621 \\u062a\\u0630\\u0643\\u0631\\u0629 \\u0645\\u0646\\u0641\\u0635\\u0644\\u0629 \\u0644\\u0644\\u0623\\u0637\\u0641\\u0627\\u0644 \\u0627\\u0644\\u0630\\u064a\\u0646 \\u064a\\u0634\\u063a\\u0644\\u0648\\u0646 \\u0645\\u0642\\u0627\\u0639\\u062f \\u0645\\u0633\\u062a\\u0642\\u0644\\u0629.<\\/p><\\/li><\\/ol><div><font color=\\\"#5b6e88\\\"><span style=\\\"font-size:14px;\\\"><br \\/><\\/span><\\/font><\\/div><\\/div><div><h3>\\u0627\\u0644\\u062d\\u064a\\u0648\\u0627\\u0646\\u0627\\u062a \\u0627\\u0644\\u0623\\u0644\\u064a\\u0641\\u0629<\\/h3>\\r\\n<ul>\\r\\n<li>\\r\\n<p>\\u0644\\u0627 \\u064a\\u064f\\u0633\\u0645\\u062d \\u0628\\u0627\\u0635\\u0637\\u062d\\u0627\\u0628 \\u0627\\u0644\\u062d\\u064a\\u0648\\u0627\\u0646\\u0627\\u062a \\u0627\\u0644\\u0623\\u0644\\u064a\\u0641\\u0629 \\u062f\\u0627\\u062e\\u0644 \\u0627\\u0644\\u062d\\u0627\\u0641\\u0644\\u0627\\u062a\\u060c \\u0628\\u0627\\u0633\\u062a\\u062b\\u0646\\u0627\\u0621 \\u0627\\u0644\\u062d\\u0627\\u0644\\u0627\\u062a \\u0627\\u0644\\u062e\\u0627\\u0635\\u0629 \\u0648\\u0641\\u0642\\u064b\\u0627 \\u0644\\u0644\\u0648\\u0627\\u0626\\u062d \\u0627\\u0644\\u0634\\u0631\\u0643\\u0629.<\\/p><\\/li><\\/ul><\\/div><div><font color=\\\"#5b6e88\\\"><span style=\\\"font-size:14px;\\\"><br \\/><\\/span><\\/font><\\/div><\\/div>\"}', NULL, 'basic', 'ticket-policies', '2024-07-26 06:55:15', '2025-07-08 00:16:22'),
(113, 'policy_pages.element', '{\"title\":\"\\u0633\\u064a\\u0627\\u0633\\u0629 \\u0627\\u0644\\u0627\\u0633\\u062a\\u0631\\u062c\\u0627\\u0639\",\"details\":\"<h4 class=\\\"title\\\" style=\\\"margin-bottom:15px;line-height:1.2;font-family:Georama, sans-serif;\\\"><\\/h4><p style=\\\"color:rgb(66,66,72);font-size:24px;\\\"><span style=\\\"font-weight:bolder;\\\">\\u0646\\u062d\\u0646 \\u0641\\u064a\\u00a0<span>\\u0634\\u0631\\u0643\\u0629 \\u0627\\u0644\\u0645\\u0633\\u0627\\u0631 \\u0644\\u0644\\u0646\\u0642\\u0644 \\u0627\\u0644\\u0628\\u0631\\u064a<\\/span>\\u00a0\\u0646\\u062d\\u0631\\u0635 \\u0639\\u0644\\u0649 \\u0631\\u0636\\u0627 \\u0639\\u0645\\u0644\\u0627\\u0626\\u0646\\u0627. \\u064a\\u0645\\u0643\\u0646 \\u0637\\u0644\\u0628 \\u0627\\u0633\\u062a\\u0631\\u062c\\u0627\\u0639 \\u0623\\u0648 \\u0627\\u0633\\u062a\\u0631\\u062f\\u0627\\u062f \\u0627\\u0644\\u0645\\u0628\\u0644\\u063a \\u062e\\u0644\\u0627\\u0644 \\u0645\\u062f\\u0629 \\u0623\\u0642\\u0635\\u0627\\u0647\\u0627\\u00a0<span>3 \\u0623\\u064a\\u0627\\u0645<\\/span>\\u00a0\\u0645\\u0646 \\u062a\\u0627\\u0631\\u064a\\u062e \\u0627\\u0644\\u062d\\u062c\\u0632\\u060c \\u0648\\u0641\\u0642\\u064b\\u0627 \\u0644\\u0644\\u0634\\u0631\\u0648\\u0637 \\u0627\\u0644\\u062a\\u0627\\u0644\\u064a\\u0629.<\\/span><\\/p><p style=\\\"color:rgb(66,66,72);font-size:24px;\\\"><span style=\\\"font-size:0.875rem;\\\">\\u064a\\u062c\\u0628 \\u062a\\u0642\\u062f\\u064a\\u0645 \\u0637\\u0644\\u0628 \\u0627\\u0644\\u0627\\u0633\\u062a\\u0631\\u062c\\u0627\\u0639 \\u062e\\u0644\\u0627\\u0644 \\u0627\\u0644\\u0645\\u062f\\u0629 \\u0627\\u0644\\u0645\\u062d\\u062f\\u062f\\u0629 \\u0623\\u0639\\u0644\\u0627\\u0647.<\\/span><\\/p><ol style=\\\"color:rgb(66,66,72);font-size:24px;\\\"><li><p>\\u064a\\u062c\\u0628 \\u0623\\u0644\\u0627 \\u064a\\u0643\\u0648\\u0646 \\u0642\\u062f \\u062a\\u0645 \\u0627\\u0633\\u062a\\u062e\\u062f\\u0627\\u0645 \\u0627\\u0644\\u062a\\u0630\\u0643\\u0631\\u0629 \\u0623\\u0648 \\u0628\\u062f\\u0623 \\u0645\\u0648\\u0639\\u062f \\u0627\\u0644\\u0631\\u062d\\u0644\\u0629.<\\/p><\\/li><li><p>\\u0641\\u064a \\u062d\\u0627\\u0644 \\u062a\\u0645 \\u0627\\u0644\\u062f\\u0641\\u0639 \\u0627\\u0644\\u0645\\u0633\\u0628\\u0642\\u060c \\u0642\\u062f \\u064a\\u062a\\u0645 \\u062e\\u0635\\u0645 \\u0631\\u0633\\u0648\\u0645 \\u0625\\u062f\\u0627\\u0631\\u064a\\u0629 \\u0623\\u0648 \\u0631\\u0633\\u0648\\u0645 \\u062a\\u062d\\u0648\\u064a\\u0644 \\u0628\\u0646\\u0643\\u064a\\u0629 (\\u0625\\u0646 \\u0648\\u062c\\u062f\\u062a).<\\/p><\\/li><li><p>\\u0644\\u0627 \\u064a\\u0645\\u0643\\u0646 \\u0627\\u0633\\u062a\\u0631\\u062c\\u0627\\u0639 \\u0627\\u0644\\u0645\\u0628\\u0627\\u0644\\u063a \\u0627\\u0644\\u0645\\u062f\\u0641\\u0648\\u0639\\u0629 \\u0641\\u064a \\u0627\\u0644\\u062d\\u0627\\u0644\\u0627\\u062a \\u0627\\u0644\\u062a\\u0627\\u0644\\u064a\\u0629:<\\/p><\\/li><\\/ol><ul><li><p>\\u0625\\u0630\\u0627 \\u062a\\u0645 \\u0627\\u0633\\u062a\\u062e\\u062f\\u0627\\u0645 \\u0627\\u0644\\u062a\\u0630\\u0643\\u0631\\u0629 \\u0623\\u0648 \\u0641\\u0627\\u062a \\u0645\\u0648\\u0639\\u062f \\u0627\\u0644\\u0631\\u062d\\u0644\\u0629.<\\/p><\\/li><li><p>\\u0641\\u064a \\u062d\\u0627\\u0644 \\u0627\\u0644\\u0625\\u0644\\u063a\\u0627\\u0621 \\u0627\\u0644\\u0645\\u062a\\u0623\\u062e\\u0631 (\\u0642\\u0628\\u0644 \\u0623\\u0642\\u0644 \\u0645\\u0646 12 \\u0633\\u0627\\u0639\\u0629 \\u0645\\u0646 \\u0645\\u0648\\u0639\\u062f \\u0627\\u0644\\u0627\\u0646\\u0637\\u0644\\u0627\\u0642).<\\/p><\\/li><li><p>\\u0641\\u064a \\u062d\\u0627\\u0644 \\u062a\\u0642\\u062f\\u064a\\u0645 \\u0645\\u0639\\u0644\\u0648\\u0645\\u0627\\u062a \\u063a\\u064a\\u0631 \\u062f\\u0642\\u064a\\u0642\\u0629 \\u0639\\u0646\\u062f \\u0627\\u0644\\u062d\\u062c\\u0632.<\\/p><\\/li><\\/ul><div><font color=\\\"#5b6e88\\\"><span style=\\\"font-size:14px;\\\"><br \\/><\\/span><\\/font><\\/div><h3>\\u0622\\u0644\\u064a\\u0629 \\u0627\\u0644\\u0627\\u0633\\u062a\\u0631\\u062f\\u0627\\u062f:<\\/h3><h4 class=\\\"title\\\" style=\\\"margin-bottom:15px;line-height:1.2;font-family:Georama, sans-serif;\\\"><\\/h4><ul><li><p>\\u062a\\u062a\\u0645 \\u0645\\u0639\\u0627\\u0644\\u062c\\u0629 \\u0637\\u0644\\u0628\\u0627\\u062a \\u0627\\u0644\\u0627\\u0633\\u062a\\u0631\\u062f\\u0627\\u062f \\u062e\\u0644\\u0627\\u0644\\u00a0<span style=\\\"font-weight:bolder;\\\">3 \\u0625\\u0644\\u0649 7 \\u0623\\u064a\\u0627\\u0645 \\u0639\\u0645\\u0644<\\/span>.<\\/p><\\/li><li><p>\\u064a\\u062a\\u0645 \\u0625\\u0639\\u0627\\u062f\\u0629 \\u0627\\u0644\\u0645\\u0628\\u0644\\u063a \\u0625\\u0644\\u0649 \\u0646\\u0641\\u0633 \\u0648\\u0633\\u064a\\u0644\\u0629 \\u0627\\u0644\\u062f\\u0641\\u0639 \\u0627\\u0644\\u062a\\u064a \\u062a\\u0645 \\u0627\\u0633\\u062a\\u062e\\u062f\\u0627\\u0645\\u0647\\u0627 (\\u0628\\u0637\\u0627\\u0642\\u0629 \\u0645\\u0635\\u0631\\u0641\\u064a\\u0629\\u060c \\u0645\\u062d\\u0641\\u0638\\u0629 \\u0625\\u0644\\u0643\\u062a\\u0631\\u0648\\u0646\\u064a\\u0629\\u060c \\u0623\\u0648 \\u0646\\u0642\\u062f\\u064b\\u0627 \\u0625\\u0646 \\u0623\\u0645\\u0643\\u0646).<\\/p><\\/li><\\/ul><h3>\\u00a0\\u0644\\u0644\\u062a\\u0648\\u0627\\u0635\\u0644 \\u0645\\u0639\\u0646\\u0627:<\\/h3><h4 class=\\\"title\\\" style=\\\"margin-bottom:15px;line-height:1.2;font-family:Georama, sans-serif;\\\"><\\/h4><p>\\u0625\\u0630\\u0627 \\u0643\\u0627\\u0646\\u062a \\u0644\\u062f\\u064a\\u0643 \\u0623\\u064a \\u0627\\u0633\\u062a\\u0641\\u0633\\u0627\\u0631\\u0627\\u062a \\u0623\\u0648 \\u062a\\u0631\\u063a\\u0628 \\u0641\\u064a \\u062a\\u0642\\u062f\\u064a\\u0645 \\u0637\\u0644\\u0628 \\u0627\\u0633\\u062a\\u0631\\u062c\\u0627\\u0639\\u060c \\u064a\\u0631\\u062c\\u0649 \\u0627\\u0644\\u062a\\u0648\\u0627\\u0635\\u0644 \\u0645\\u0639\\u0646\\u0627 \\u0639\\u0628\\u0631:<\\/p><ul><li><p>\\u0627\\u0644\\u0628\\u0631\\u064a\\u062f \\u0627\\u0644\\u0625\\u0644\\u0643\\u062a\\u0631\\u0648\\u0646\\u064a:\\u00a0<span style=\\\"font-weight:bolder;\\\"><a class=\\\"cursor-pointer\\\" style=\\\"color:rgb(13,110,253);\\\">support@almasar.ly<\\/a><\\/span><\\/p><\\/li><li><p>\\u0627\\u0644\\u0647\\u0627\\u062a\\u0641:<span style=\\\"font-weight:bolder;\\\">0918051663<\\/span><\\/p><\\/li><li><p>\\u0623\\u0648 \\u0645\\u0646 \\u062e\\u0644\\u0627\\u0644 \\u0646\\u0645\\u0648\\u0630\\u062c \\u0627\\u0644\\u062a\\u0648\\u0627\\u0635\\u0644 \\u0639\\u0644\\u0649 \\u0627\\u0644\\u0645\\u0648\\u0642\\u0639 \\u0627\\u0644\\u0631\\u0633\\u0645\\u064a.<\\/p><\\/li><\\/ul><h3>\\u0645\\u0644\\u0627\\u062d\\u0638\\u0627\\u062a \\u0647\\u0627\\u0645\\u0629:<\\/h3><h4 class=\\\"title\\\" style=\\\"margin-bottom:15px;line-height:1.2;font-family:Georama, sans-serif;\\\"><\\/h4><ul><li><p>\\u062a\\u062d\\u062a\\u0641\\u0638 \\u0634\\u0631\\u0643\\u0629 \\u0627\\u0644\\u0645\\u0633\\u0627\\u0631 \\u0644\\u0644\\u0646\\u0642\\u0644 \\u0627\\u0644\\u0628\\u0631\\u064a \\u0628\\u062d\\u0642 \\u0631\\u0641\\u0636 \\u0623\\u064a \\u0637\\u0644\\u0628 \\u0627\\u0633\\u062a\\u0631\\u062c\\u0627\\u0639 \\u0644\\u0627 \\u064a\\u062a\\u0648\\u0627\\u0641\\u0642 \\u0645\\u0639 \\u0627\\u0644\\u0634\\u0631\\u0648\\u0637 \\u0627\\u0644\\u0645\\u0630\\u0643\\u0648\\u0631\\u0629 \\u0623\\u0639\\u0644\\u0627\\u0647.<\\/p><\\/li><li><p>\\u062a\\u062e\\u0636\\u0639 \\u0647\\u0630\\u0647 \\u0627\\u0644\\u0633\\u064a\\u0627\\u0633\\u0629 \\u0644\\u0644\\u062a\\u062d\\u062f\\u064a\\u062b \\u0641\\u064a \\u0623\\u064a \\u0648\\u0642\\u062a \\u062f\\u0648\\u0646 \\u0625\\u0634\\u0639\\u0627\\u0631 \\u0645\\u0633\\u0628\\u0642. \\u064a\\u064f\\u0631\\u062c\\u0649 \\u0645\\u0631\\u0627\\u062c\\u0639\\u062a\\u0647\\u0627 \\u0628\\u0634\\u0643\\u0644 \\u062f\\u0648\\u0631\\u064a.<\\/p><\\/li><\\/ul>\"}', NULL, 'basic', 'refund-policy', '2024-07-26 06:55:28', '2025-07-08 00:05:56'),
(114, 'amenities.element', '{\"title\":\"\\u0625\\u062c\\u0645\\u0627\\u0644\\u064a \\u0627\\u0644\\u0631\\u0633\\u0648\\u0645\",\"icon\":\"<i class=\\\"fas fa-network-wired\\\"><\\/i>\"}', NULL, 'basic', '', '2025-08-26 15:21:31', '2025-08-26 15:21:31'),
(117, 'amenities.element', '{\"title\":\"\\u0627\\u0644\\u0645\\u062f\\u0641\\u0648\\u0639\\u0627\\u062a\",\"icon\":\"<i class=\\\"las la-money-bill-wave-alt\\\"><\\/i>\"}', NULL, 'basic', '', '2025-08-26 15:46:13', '2025-08-26 15:46:13'),
(118, 'amenities.element', '{\"title\":\"\\u0627\\u062f\\u0627\\u0631\\u0629 \\u0627\\u0644\\u0645\\u0633\\u062a\\u062e\\u062f\\u0645\\u064a\\u0646\",\"icon\":\"<i class=\\\"fas fa-users-cog\\\"><\\/i>\"}', NULL, 'basic', '', '2025-08-26 15:48:34', '2025-08-26 15:48:34');

-- --------------------------------------------------------

--
-- Table structure for table `gateways`
--

CREATE TABLE `gateways` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `form_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `code` int(11) DEFAULT NULL,
  `name` varchar(40) DEFAULT NULL,
  `alias` varchar(40) NOT NULL DEFAULT 'NULL',
  `image` varchar(255) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=>enable, 2=>disable',
  `gateway_parameters` text DEFAULT NULL,
  `supported_currencies` text DEFAULT NULL,
  `crypto` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0: fiat currency, 1: crypto currency',
  `extra` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `gateways`
--

INSERT INTO `gateways` (`id`, `form_id`, `code`, `name`, `alias`, `image`, `status`, `gateway_parameters`, `supported_currencies`, `crypto`, `extra`, `description`, `created_at`, `updated_at`) VALUES
(60, 0, 101, 'PayPal', 'paypal', 'paypal.png', 1, NULL, NULL, 0, NULL, 'PayPal payment gateway', NULL, NULL),
(61, 0, 102, 'Stripe', 'stripe', 'stripe.png', 1, NULL, NULL, 0, NULL, 'Stripe payment gateway', NULL, NULL),
(62, 1, 1001, 'Manual Payment', 'manual_payment', 'bank.png', 1, '[]', '[]', 0, NULL, 'Manual bank transfer', NULL, '2025-07-29 01:23:04');

-- --------------------------------------------------------

--
-- Table structure for table `gateway_currencies`
--

CREATE TABLE `gateway_currencies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(40) DEFAULT NULL,
  `currency` varchar(40) DEFAULT NULL,
  `symbol` varchar(40) DEFAULT NULL,
  `method_code` int(11) DEFAULT NULL,
  `gateway_alias` varchar(40) DEFAULT NULL,
  `min_amount` decimal(28,8) DEFAULT 0.00000000,
  `max_amount` decimal(28,8) DEFAULT 0.00000000,
  `percent_charge` decimal(5,2) NOT NULL DEFAULT 0.00,
  `fixed_charge` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `rate` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `gateway_parameter` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `gateway_currencies`
--

INSERT INTO `gateway_currencies` (`id`, `name`, `currency`, `symbol`, `method_code`, `gateway_alias`, `min_amount`, `max_amount`, `percent_charge`, `fixed_charge`, `rate`, `gateway_parameter`, `created_at`, `updated_at`) VALUES
(4, 'Manual Payment', 'LYD', '', 1001, 'manual_payment', 10.00000000, 100000.00000000, 0.00, 0.00000000, 1.00000000, NULL, NULL, '2025-07-31 00:00:15');

-- --------------------------------------------------------

--
-- Table structure for table `general_settings`
--

CREATE TABLE `general_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `site_name` varchar(40) DEFAULT NULL,
  `cur_text` varchar(40) DEFAULT NULL COMMENT 'currency text',
  `cur_sym` varchar(40) DEFAULT NULL COMMENT 'currency symbol',
  `email_from` varchar(40) DEFAULT NULL,
  `email_from_name` varchar(255) DEFAULT NULL,
  `email_template` text DEFAULT NULL,
  `sms_template` varchar(255) DEFAULT NULL,
  `sms_from` varchar(255) DEFAULT NULL,
  `push_title` varchar(255) DEFAULT NULL,
  `push_template` varchar(255) DEFAULT NULL,
  `base_color` varchar(40) DEFAULT NULL,
  `mail_config` text DEFAULT NULL COMMENT 'email configuration',
  `sms_config` text DEFAULT NULL,
  `firebase_config` text DEFAULT NULL,
  `global_shortcodes` text DEFAULT NULL,
  `ev` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'email verification, 0 - dont check, 1 - check',
  `en` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'email notification, 0 - dont send, 1 - send',
  `sv` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'mobile verication, 0 - dont check, 1 - check',
  `sn` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'sms notification, 0 - dont send, 1 - send',
  `pn` tinyint(1) NOT NULL DEFAULT 1,
  `force_ssl` tinyint(1) NOT NULL DEFAULT 0,
  `maintenance_mode` tinyint(1) NOT NULL DEFAULT 0,
  `secure_password` tinyint(1) NOT NULL DEFAULT 0,
  `agree` tinyint(1) NOT NULL DEFAULT 0,
  `multi_language` tinyint(1) NOT NULL DEFAULT 1,
  `registration` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0: Off	, 1: On',
  `active_template` varchar(40) DEFAULT NULL,
  `socialite_credentials` text DEFAULT NULL,
  `last_cron` datetime DEFAULT NULL,
  `available_version` varchar(40) DEFAULT NULL,
  `system_customized` tinyint(1) NOT NULL DEFAULT 0,
  `paginate_number` int(11) NOT NULL DEFAULT 0,
  `currency_format` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1=>Both\r\n2=>Text Only\r\n3=>Symbol Only',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `general_settings`
--

INSERT INTO `general_settings` (`id`, `site_name`, `cur_text`, `cur_sym`, `email_from`, `email_from_name`, `email_template`, `sms_template`, `sms_from`, `push_title`, `push_template`, `base_color`, `mail_config`, `sms_config`, `firebase_config`, `global_shortcodes`, `ev`, `en`, `sv`, `sn`, `pn`, `force_ssl`, `maintenance_mode`, `secure_password`, `agree`, `multi_language`, `registration`, `active_template`, `socialite_credentials`, `last_cron`, `available_version`, `system_customized`, `paginate_number`, `currency_format`, `created_at`, `updated_at`) VALUES
(1, 'المسار', 'د.ل', '.', 'info@viserlab.com', '{{site_name}}', '<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">\n  <!--[if !mso]><!-->\n  <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\n  <!--<![endif]-->\n  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n  <title></title>\n  <style type=\"text/css\">\n.ReadMsgBody { width: 100%; background-color: #ffffff; }\n.ExternalClass { width: 100%; background-color: #ffffff; }\n.ExternalClass, .ExternalClass p, .ExternalClass span, .ExternalClass font, .ExternalClass td, .ExternalClass div { line-height: 100%; }\nhtml { width: 100%; }\nbody { -webkit-text-size-adjust: none; -ms-text-size-adjust: none; margin: 0; padding: 0; }\ntable { border-spacing: 0; table-layout: fixed; margin: 0 auto;border-collapse: collapse; }\ntable table table { table-layout: auto; }\n.yshortcuts a { border-bottom: none !important; }\nimg:hover { opacity: 0.9 !important; }\na { color: #0087ff; text-decoration: none; }\n.textbutton a { font-family: \'open sans\', arial, sans-serif !important;}\n.btn-link a { color:#FFFFFF !important;}\n\n@media only screen and (max-width: 480px) {\nbody { width: auto !important; }\n*[class=\"table-inner\"] { width: 90% !important; text-align: center !important; }\n*[class=\"table-full\"] { width: 100% !important; text-align: center !important; }\n/* image */\nimg[class=\"img1\"] { width: 100% !important; height: auto !important; }\n}\n</style>\n\n\n\n  <table bgcolor=\"#414a51\" width=\"100%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\n    <tbody><tr>\n      <td height=\"50\"></td>\n    </tr>\n    <tr>\n      <td align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\n        <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\n          <tbody><tr>\n            <td align=\"center\" width=\"600\">\n              <!--header-->\n              <table class=\"table-inner\" width=\"95%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\n                <tbody><tr>\n                  <td bgcolor=\"#0087ff\" style=\"border-top-left-radius:6px; border-top-right-radius:6px;text-align:center;vertical-align:top;font-size:0;\" align=\"center\">\n                    <table width=\"90%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\n                      <tbody><tr>\n                        <td height=\"20\"></td>\n                      </tr>\n                      <tr>\n                        <td align=\"center\" style=\"font-family: \'Open sans\', Arial, sans-serif; color:#FFFFFF; font-size:16px; font-weight: bold;\">This is a System Generated Email</td>\n                      </tr>\n                      <tr>\n                        <td height=\"20\"></td>\n                      </tr>\n                    </tbody></table>\n                  </td>\n                </tr>\n              </tbody></table>\n              <!--end header-->\n              <table class=\"table-inner\" width=\"95%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n                <tbody><tr>\n                  <td bgcolor=\"#FFFFFF\" align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\n                    <table align=\"center\" width=\"90%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n                      <tbody><tr>\n                        <td height=\"35\"></td>\n                      </tr>\n                      <!--logo-->\n                      <tr>\n                        <td align=\"center\" style=\"vertical-align:top;font-size:0;\">\n                          <a href=\"#\">\n                            <img style=\"display:block; line-height:0px; font-size:0px; border:0px;\" src=\"https://i.ibb.co/rw2fTRM/logo-dark.png\" width=\"220\" alt=\"img\">\n                          </a>\n                        </td>\n                      </tr>\n                      <!--end logo-->\n                      <tr>\n                        <td height=\"40\"></td>\n                      </tr>\n                      <!--headline-->\n                      <tr>\n                        <td align=\"center\" style=\"font-family: \'Open Sans\', Arial, sans-serif; font-size: 22px;color:#414a51;font-weight: bold;\">Hello {{fullname}} ({{username}})</td>\n                      </tr>\n                      <!--end headline-->\n                      <tr>\n                        <td align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\n                          <table width=\"40\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\n                            <tbody><tr>\n                              <td height=\"20\" style=\" border-bottom:3px solid #0087ff;\"></td>\n                            </tr>\n                          </tbody></table>\n                        </td>\n                      </tr>\n                      <tr>\n                        <td height=\"20\"></td>\n                      </tr>\n                      <!--content-->\n                      <tr>\n                        <td align=\"left\" style=\"font-family: \'Open sans\', Arial, sans-serif; color:#7f8c8d; font-size:16px; line-height: 28px;\">{{message}}</td>\n                      </tr>\n                      <!--end content-->\n                      <tr>\n                        <td height=\"40\"></td>\n                      </tr>\n              \n                    </tbody></table>\n                  </td>\n                </tr>\n                <tr>\n                  <td height=\"45\" align=\"center\" bgcolor=\"#f4f4f4\" style=\"border-bottom-left-radius:6px;border-bottom-right-radius:6px;\">\n                    <table align=\"center\" width=\"90%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n                      <tbody><tr>\n                        <td height=\"10\"></td>\n                      </tr>\n                      <!--preference-->\n                      <tr>\n                        <td class=\"preference-link\" align=\"center\" style=\"font-family: \'Open sans\', Arial, sans-serif; color:#95a5a6; font-size:14px;\">\n                          © 2024 <a href=\"#\">{{site_name}}</a>&nbsp;. All Rights Reserved. \n                        </td>\n                      </tr>\n                      <!--end preference-->\n                      <tr>\n                        <td height=\"10\"></td>\n                      </tr>\n                    </tbody></table>\n                  </td>\n                </tr>\n              </tbody></table>\n            </td>\n          </tr>\n        </tbody></table>\n      </td>\n    </tr>\n    <tr>\n      <td height=\"60\"></td>\n    </tr>\n  </tbody></table>', 'hi {{fullname}} ({{username}}), {{message}}', '{{site_name}}', '{{site_name}}', 'hi {{fullname}} ({{username}}), {{message}}', '030100', '{\"name\":\"smtp\",\"host\":\"smtp.live.com\",\"port\":\"465\",\"enc\":\"ssl\",\"username\":\"t.abodia@ltt.ly\",\"password\":\"T@0927918328f#\"}', '{\"name\":\"clickatell\",\"clickatell\":{\"api_key\":\"----------------\"},\"infobip\":{\"username\":\"------------8888888\",\"password\":\"-----------------\"},\"message_bird\":{\"api_key\":\"-------------------\"},\"nexmo\":{\"api_key\":\"----------------------\",\"api_secret\":\"----------------------\"},\"sms_broadcast\":{\"username\":\"----------------------\",\"password\":\"-----------------------------\"},\"twilio\":{\"account_sid\":\"-----------------------\",\"auth_token\":\"---------------------------\",\"from\":\"----------------------\"},\"text_magic\":{\"username\":\"-----------------------\",\"apiv2_key\":\"-------------------------------\"},\"custom\":{\"method\":\"get\",\"url\":\"https:\\/\\/hostname.com\\/demo-api-v1\",\"headers\":{\"name\":[\"api_key\"],\"value\":[\"test_api 555\"]},\"body\":{\"name\":[\"from_number\"],\"value\":[\"5657545757\"]}}}', '{\"apiKey\":\"AIzaSyCb6zm7_8kdStXjZMgLZpwjGDuTUg0e_qM\",\"authDomain\":\"flutter-prime-df1c5.firebaseapp.com\",\"projectId\":\"flutter-prime-df1c5\",\"storageBucket\":\"flutter-prime-df1c5.appspot.com\",\"messagingSenderId\":\"274514992002\",\"appId\":\"1:274514992002:web:4d77660766f4797500cd9b\",\"measurementId\":\"G-KFPM07RXRC\",\"serverKey\":\"AAAA14oqxFc:APA91bE9uJdrjU_FX3gg_EtCfApRqoNojV71m6J-9yCQC7GoL2pBFcN9pdJjLLQxEAUcNxxatfWKLcnl5qCuLsmpPdr_3QRtH9XzfIu1MrLUJU3dHkBc4CGIkYMM9EWgXCNFjudhhQmH\"}', '{\n    \"site_name\":\"Name of your site\",\n    \"site_currency\":\"Currency of your site\",\n    \"currency_symbol\":\"Symbol of currency\"\n}', 0, 0, 1, 0, 0, 0, 0, 0, 1, 1, 1, 'basic', '{\"google\":{\"client_id\":\"------------\",\"client_secret\":\"-------------\",\"status\":0},\"facebook\":{\"client_id\":\"------\",\"client_secret\":\"------\",\"status\":0},\"linkedin\":{\"client_id\":\"-----\",\"client_secret\":\"-----\",\"status\":0}}', '2024-05-05 13:20:49', '3.0', 0, 20, 3, NULL, '2025-08-27 21:45:06');

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(40) DEFAULT NULL,
  `code` varchar(40) DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0: not default language, 1: default language',
  `image` varchar(40) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `name`, `code`, `is_default`, `image`, `created_at`, `updated_at`) VALUES
(1, 'English', 'en', 0, '660b94fa876ac1712035066.png', '2020-07-06 03:47:55', '2025-07-04 17:27:35'),
(17, 'arabic', 'ar', 1, '68680eac6b57d1751649964.png', '2025-07-04 17:26:04', '2025-07-04 17:27:35');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2020_06_14_061757_create_support_tickets_table', 3),
(5, '2020_06_14_061837_create_support_messages_table', 3),
(6, '2020_06_14_061904_create_support_attachments_table', 3),
(7, '2020_06_14_062359_create_admins_table', 3),
(8, '2020_06_14_064604_create_transactions_table', 4),
(9, '2020_06_14_065247_create_general_settings_table', 5),
(12, '2014_10_12_100000_create_password_resets_table', 6),
(13, '2020_06_14_060541_create_user_logins_table', 6),
(14, '2020_06_14_071708_create_admin_password_resets_table', 7),
(15, '2020_09_14_053026_create_countries_table', 8),
(16, '2021_03_15_084721_create_admin_notifications_table', 9),
(17, '2016_06_01_000001_create_oauth_auth_codes_table', 10),
(18, '2016_06_01_000002_create_oauth_access_tokens_table', 10),
(19, '2016_06_01_000003_create_oauth_refresh_tokens_table', 10),
(20, '2016_06_01_000004_create_oauth_clients_table', 10),
(21, '2016_06_01_000005_create_oauth_personal_access_clients_table', 10),
(22, '2021_05_08_103925_create_sms_gateways_table', 11),
(23, '2019_12_14_000001_create_personal_access_tokens_table', 12),
(24, '2021_05_23_111859_create_email_logs_table', 13),
(25, '2022_02_26_061836_create_forms_table', 14),
(26, '2023_06_15_144908_create_update_logs_table', 15);

-- --------------------------------------------------------

--
-- Table structure for table `notification_logs`
--

CREATE TABLE `notification_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `sender` varchar(40) DEFAULT NULL,
  `sent_from` varchar(40) DEFAULT NULL,
  `sent_to` varchar(40) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `notification_type` varchar(40) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `user_read` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notification_logs`
--

INSERT INTO `notification_logs` (`id`, `user_id`, `sender`, `sent_from`, `sent_to`, `subject`, `message`, `notification_type`, `image`, `user_read`, `created_at`, `updated_at`) VALUES
(1, 1, 'php', 'info@viserlab.com', 'ds2@v.com', 'Email Verification Code', '<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">\r\n  <!--[if !mso]><!-->\r\n  <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\r\n  <!--<![endif]-->\r\n  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n  <title></title>\r\n  <style type=\"text/css\">\r\n.ReadMsgBody { width: 100%; background-color: #ffffff; }\r\n.ExternalClass { width: 100%; background-color: #ffffff; }\r\n.ExternalClass, .ExternalClass p, .ExternalClass span, .ExternalClass font, .ExternalClass td, .ExternalClass div { line-height: 100%; }\r\nhtml { width: 100%; }\r\nbody { -webkit-text-size-adjust: none; -ms-text-size-adjust: none; margin: 0; padding: 0; }\r\ntable { border-spacing: 0; table-layout: fixed; margin: 0 auto;border-collapse: collapse; }\r\ntable table table { table-layout: auto; }\r\n.yshortcuts a { border-bottom: none !important; }\r\nimg:hover { opacity: 0.9 !important; }\r\na { color: #0087ff; text-decoration: none; }\r\n.textbutton a { font-family: \'open sans\', arial, sans-serif !important;}\r\n.btn-link a { color:#FFFFFF !important;}\r\n\r\n@media only screen and (max-width: 480px) {\r\nbody { width: auto !important; }\r\n*[class=\"table-inner\"] { width: 90% !important; text-align: center !important; }\r\n*[class=\"table-full\"] { width: 100% !important; text-align: center !important; }\r\n/* image */\r\nimg[class=\"img1\"] { width: 100% !important; height: auto !important; }\r\n}\r\n</style>\r\n\r\n\r\n\r\n  <table bgcolor=\"#414a51\" width=\"100%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n    <tbody><tr>\r\n      <td height=\"50\"></td>\r\n    </tr>\r\n    <tr>\r\n      <td align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\r\n        <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\r\n          <tbody><tr>\r\n            <td align=\"center\" width=\"600\">\r\n              <!--header-->\r\n              <table class=\"table-inner\" width=\"95%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n                <tbody><tr>\r\n                  <td bgcolor=\"#0087ff\" style=\"border-top-left-radius:6px; border-top-right-radius:6px;text-align:center;vertical-align:top;font-size:0;\" align=\"center\">\r\n                    <table width=\"90%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n                      <tbody><tr>\r\n                        <td height=\"20\"></td>\r\n                      </tr>\r\n                      <tr>\r\n                        <td align=\"center\" style=\"font-family: \'Open sans\', Arial, sans-serif; color:#FFFFFF; font-size:16px; font-weight: bold;\">This is a System Generated Email</td>\r\n                      </tr>\r\n                      <tr>\r\n                        <td height=\"20\"></td>\r\n                      </tr>\r\n                    </tbody></table>\r\n                  </td>\r\n                </tr>\r\n              </tbody></table>\r\n              <!--end header-->\r\n              <table class=\"table-inner\" width=\"95%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n                <tbody><tr>\r\n                  <td bgcolor=\"#FFFFFF\" align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\r\n                    <table align=\"center\" width=\"90%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n                      <tbody><tr>\r\n                        <td height=\"35\"></td>\r\n                      </tr>\r\n                      <!--logo-->\r\n                      <tr>\r\n                        <td align=\"center\" style=\"vertical-align:top;font-size:0;\">\r\n                          <a href=\"#\">\r\n                            <img style=\"display:block; line-height:0px; font-size:0px; border:0px;\" src=\"https://i.ibb.co/rw2fTRM/logo-dark.png\" width=\"220\" alt=\"img\">\r\n                          </a>\r\n                        </td>\r\n                      </tr>\r\n                      <!--end logo-->\r\n                      <tr>\r\n                        <td height=\"40\"></td>\r\n                      </tr>\r\n                      <!--headline-->\r\n                      <tr>\r\n                        <td align=\"center\" style=\"font-family: \'Open Sans\', Arial, sans-serif; font-size: 22px;color:#414a51;font-weight: bold;\">Hello tss sdss (vsdvshbjjnuy)</td>\r\n                      </tr>\r\n                      <!--end headline-->\r\n                      <tr>\r\n                        <td align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\r\n                          <table width=\"40\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n                            <tbody><tr>\r\n                              <td height=\"20\" style=\" border-bottom:3px solid #0087ff;\"></td>\r\n                            </tr>\r\n                          </tbody></table>\r\n                        </td>\r\n                      </tr>\r\n                      <tr>\r\n                        <td height=\"20\"></td>\r\n                      </tr>\r\n                      <!--content-->\r\n                      <tr>\r\n                        <td align=\"left\" style=\"font-family: \'Open sans\', Arial, sans-serif; color:#7f8c8d; font-size:16px; line-height: 28px;\"><div>\r\n    <div><span>Thank you for taking the time to verify your email address with us. Your email verification code\r\n            is</span>: <b><font size=\"6\">868742</font></b></div><br>\r\n    <div><span>Please enter this code in the designated field on our platform to complete the verification\r\n            process.</span></div><br>\r\n    <div><span>If you did not request this verification code, please disregard this email. Your account security is our\r\n            top priority, and we advise you to take appropriate measures if you suspect any unauthorized access.</span>\r\n    </div><br>\r\n    <div><span>If you have any questions or encounter any issues during the verification process, please don\'t hesitate\r\n            to contact our support team for assistance.</span></div><br>\r\n    <div><span>Thank you for choosing us.</span></div>\r\n</div></td>\r\n                      </tr>\r\n                      <!--end content-->\r\n                      <tr>\r\n                        <td height=\"40\"></td>\r\n                      </tr>\r\n              \r\n                    </tbody></table>\r\n                  </td>\r\n                </tr>\r\n                <tr>\r\n                  <td height=\"45\" align=\"center\" bgcolor=\"#f4f4f4\" style=\"border-bottom-left-radius:6px;border-bottom-right-radius:6px;\">\r\n                    <table align=\"center\" width=\"90%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n                      <tbody><tr>\r\n                        <td height=\"10\"></td>\r\n                      </tr>\r\n                      <!--preference-->\r\n                      <tr>\r\n                        <td class=\"preference-link\" align=\"center\" style=\"font-family: \'Open sans\', Arial, sans-serif; color:#95a5a6; font-size:14px;\">\r\n                          © 2024 <a href=\"#\">Viserbus</a>&nbsp;. All Rights Reserved. \r\n                        </td>\r\n                      </tr>\r\n                      <!--end preference-->\r\n                      <tr>\r\n                        <td height=\"10\"></td>\r\n                      </tr>\r\n                    </tbody></table>\r\n                  </td>\r\n                </tr>\r\n              </tbody></table>\r\n            </td>\r\n          </tr>\r\n        </tbody></table>\r\n      </td>\r\n    </tr>\r\n    <tr>\r\n      <td height=\"60\"></td>\r\n    </tr>\r\n  </tbody></table>', 'email', NULL, 0, '2025-06-02 23:16:17', '2025-06-02 23:16:17'),
(2, 1, 'php', 'info@viserlab.com', 'ds2@v.com', 'Email Verification Code', '<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">\r\n  <!--[if !mso]><!-->\r\n  <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\r\n  <!--<![endif]-->\r\n  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n  <title></title>\r\n  <style type=\"text/css\">\r\n.ReadMsgBody { width: 100%; background-color: #ffffff; }\r\n.ExternalClass { width: 100%; background-color: #ffffff; }\r\n.ExternalClass, .ExternalClass p, .ExternalClass span, .ExternalClass font, .ExternalClass td, .ExternalClass div { line-height: 100%; }\r\nhtml { width: 100%; }\r\nbody { -webkit-text-size-adjust: none; -ms-text-size-adjust: none; margin: 0; padding: 0; }\r\ntable { border-spacing: 0; table-layout: fixed; margin: 0 auto;border-collapse: collapse; }\r\ntable table table { table-layout: auto; }\r\n.yshortcuts a { border-bottom: none !important; }\r\nimg:hover { opacity: 0.9 !important; }\r\na { color: #0087ff; text-decoration: none; }\r\n.textbutton a { font-family: \'open sans\', arial, sans-serif !important;}\r\n.btn-link a { color:#FFFFFF !important;}\r\n\r\n@media only screen and (max-width: 480px) {\r\nbody { width: auto !important; }\r\n*[class=\"table-inner\"] { width: 90% !important; text-align: center !important; }\r\n*[class=\"table-full\"] { width: 100% !important; text-align: center !important; }\r\n/* image */\r\nimg[class=\"img1\"] { width: 100% !important; height: auto !important; }\r\n}\r\n</style>\r\n\r\n\r\n\r\n  <table bgcolor=\"#414a51\" width=\"100%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n    <tbody><tr>\r\n      <td height=\"50\"></td>\r\n    </tr>\r\n    <tr>\r\n      <td align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\r\n        <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\r\n          <tbody><tr>\r\n            <td align=\"center\" width=\"600\">\r\n              <!--header-->\r\n              <table class=\"table-inner\" width=\"95%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n                <tbody><tr>\r\n                  <td bgcolor=\"#0087ff\" style=\"border-top-left-radius:6px; border-top-right-radius:6px;text-align:center;vertical-align:top;font-size:0;\" align=\"center\">\r\n                    <table width=\"90%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n                      <tbody><tr>\r\n                        <td height=\"20\"></td>\r\n                      </tr>\r\n                      <tr>\r\n                        <td align=\"center\" style=\"font-family: \'Open sans\', Arial, sans-serif; color:#FFFFFF; font-size:16px; font-weight: bold;\">This is a System Generated Email</td>\r\n                      </tr>\r\n                      <tr>\r\n                        <td height=\"20\"></td>\r\n                      </tr>\r\n                    </tbody></table>\r\n                  </td>\r\n                </tr>\r\n              </tbody></table>\r\n              <!--end header-->\r\n              <table class=\"table-inner\" width=\"95%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n                <tbody><tr>\r\n                  <td bgcolor=\"#FFFFFF\" align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\r\n                    <table align=\"center\" width=\"90%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n                      <tbody><tr>\r\n                        <td height=\"35\"></td>\r\n                      </tr>\r\n                      <!--logo-->\r\n                      <tr>\r\n                        <td align=\"center\" style=\"vertical-align:top;font-size:0;\">\r\n                          <a href=\"#\">\r\n                            <img style=\"display:block; line-height:0px; font-size:0px; border:0px;\" src=\"https://i.ibb.co/rw2fTRM/logo-dark.png\" width=\"220\" alt=\"img\">\r\n                          </a>\r\n                        </td>\r\n                      </tr>\r\n                      <!--end logo-->\r\n                      <tr>\r\n                        <td height=\"40\"></td>\r\n                      </tr>\r\n                      <!--headline-->\r\n                      <tr>\r\n                        <td align=\"center\" style=\"font-family: \'Open Sans\', Arial, sans-serif; font-size: 22px;color:#414a51;font-weight: bold;\">Hello tss sdss (vsdvshbjjnuy)</td>\r\n                      </tr>\r\n                      <!--end headline-->\r\n                      <tr>\r\n                        <td align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\r\n                          <table width=\"40\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n                            <tbody><tr>\r\n                              <td height=\"20\" style=\" border-bottom:3px solid #0087ff;\"></td>\r\n                            </tr>\r\n                          </tbody></table>\r\n                        </td>\r\n                      </tr>\r\n                      <tr>\r\n                        <td height=\"20\"></td>\r\n                      </tr>\r\n                      <!--content-->\r\n                      <tr>\r\n                        <td align=\"left\" style=\"font-family: \'Open sans\', Arial, sans-serif; color:#7f8c8d; font-size:16px; line-height: 28px;\"><div>\r\n    <div><span>Thank you for taking the time to verify your email address with us. Your email verification code\r\n            is</span>: <b><font size=\"6\">284180</font></b></div><br>\r\n    <div><span>Please enter this code in the designated field on our platform to complete the verification\r\n            process.</span></div><br>\r\n    <div><span>If you did not request this verification code, please disregard this email. Your account security is our\r\n            top priority, and we advise you to take appropriate measures if you suspect any unauthorized access.</span>\r\n    </div><br>\r\n    <div><span>If you have any questions or encounter any issues during the verification process, please don\'t hesitate\r\n            to contact our support team for assistance.</span></div><br>\r\n    <div><span>Thank you for choosing us.</span></div>\r\n</div></td>\r\n                      </tr>\r\n                      <!--end content-->\r\n                      <tr>\r\n                        <td height=\"40\"></td>\r\n                      </tr>\r\n              \r\n                    </tbody></table>\r\n                  </td>\r\n                </tr>\r\n                <tr>\r\n                  <td height=\"45\" align=\"center\" bgcolor=\"#f4f4f4\" style=\"border-bottom-left-radius:6px;border-bottom-right-radius:6px;\">\r\n                    <table align=\"center\" width=\"90%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n                      <tbody><tr>\r\n                        <td height=\"10\"></td>\r\n                      </tr>\r\n                      <!--preference-->\r\n                      <tr>\r\n                        <td class=\"preference-link\" align=\"center\" style=\"font-family: \'Open sans\', Arial, sans-serif; color:#95a5a6; font-size:14px;\">\r\n                          © 2024 <a href=\"#\">Viserbus</a>&nbsp;. All Rights Reserved. \r\n                        </td>\r\n                      </tr>\r\n                      <!--end preference-->\r\n                      <tr>\r\n                        <td height=\"10\"></td>\r\n                      </tr>\r\n                    </tbody></table>\r\n                  </td>\r\n                </tr>\r\n              </tbody></table>\r\n            </td>\r\n          </tr>\r\n        </tbody></table>\r\n      </td>\r\n    </tr>\r\n    <tr>\r\n      <td height=\"60\"></td>\r\n    </tr>\r\n  </tbody></table>', 'email', NULL, 0, '2025-06-02 23:18:46', '2025-06-02 23:18:46'),
(3, 2, 'php', 'info@viserlab.com', 'drer@ref.com', 'Email Verification Code', '<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">\r\n  <!--[if !mso]><!-->\r\n  <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\r\n  <!--<![endif]-->\r\n  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n  <title></title>\r\n  <style type=\"text/css\">\r\n.ReadMsgBody { width: 100%; background-color: #ffffff; }\r\n.ExternalClass { width: 100%; background-color: #ffffff; }\r\n.ExternalClass, .ExternalClass p, .ExternalClass span, .ExternalClass font, .ExternalClass td, .ExternalClass div { line-height: 100%; }\r\nhtml { width: 100%; }\r\nbody { -webkit-text-size-adjust: none; -ms-text-size-adjust: none; margin: 0; padding: 0; }\r\ntable { border-spacing: 0; table-layout: fixed; margin: 0 auto;border-collapse: collapse; }\r\ntable table table { table-layout: auto; }\r\n.yshortcuts a { border-bottom: none !important; }\r\nimg:hover { opacity: 0.9 !important; }\r\na { color: #0087ff; text-decoration: none; }\r\n.textbutton a { font-family: \'open sans\', arial, sans-serif !important;}\r\n.btn-link a { color:#FFFFFF !important;}\r\n\r\n@media only screen and (max-width: 480px) {\r\nbody { width: auto !important; }\r\n*[class=\"table-inner\"] { width: 90% !important; text-align: center !important; }\r\n*[class=\"table-full\"] { width: 100% !important; text-align: center !important; }\r\n/* image */\r\nimg[class=\"img1\"] { width: 100% !important; height: auto !important; }\r\n}\r\n</style>\r\n\r\n\r\n\r\n  <table bgcolor=\"#414a51\" width=\"100%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n    <tbody><tr>\r\n      <td height=\"50\"></td>\r\n    </tr>\r\n    <tr>\r\n      <td align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\r\n        <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\r\n          <tbody><tr>\r\n            <td align=\"center\" width=\"600\">\r\n              <!--header-->\r\n              <table class=\"table-inner\" width=\"95%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n                <tbody><tr>\r\n                  <td bgcolor=\"#0087ff\" style=\"border-top-left-radius:6px; border-top-right-radius:6px;text-align:center;vertical-align:top;font-size:0;\" align=\"center\">\r\n                    <table width=\"90%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n                      <tbody><tr>\r\n                        <td height=\"20\"></td>\r\n                      </tr>\r\n                      <tr>\r\n                        <td align=\"center\" style=\"font-family: \'Open sans\', Arial, sans-serif; color:#FFFFFF; font-size:16px; font-weight: bold;\">This is a System Generated Email</td>\r\n                      </tr>\r\n                      <tr>\r\n                        <td height=\"20\"></td>\r\n                      </tr>\r\n                    </tbody></table>\r\n                  </td>\r\n                </tr>\r\n              </tbody></table>\r\n              <!--end header-->\r\n              <table class=\"table-inner\" width=\"95%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n                <tbody><tr>\r\n                  <td bgcolor=\"#FFFFFF\" align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\r\n                    <table align=\"center\" width=\"90%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n                      <tbody><tr>\r\n                        <td height=\"35\"></td>\r\n                      </tr>\r\n                      <!--logo-->\r\n                      <tr>\r\n                        <td align=\"center\" style=\"vertical-align:top;font-size:0;\">\r\n                          <a href=\"#\">\r\n                            <img style=\"display:block; line-height:0px; font-size:0px; border:0px;\" src=\"https://i.ibb.co/rw2fTRM/logo-dark.png\" width=\"220\" alt=\"img\">\r\n                          </a>\r\n                        </td>\r\n                      </tr>\r\n                      <!--end logo-->\r\n                      <tr>\r\n                        <td height=\"40\"></td>\r\n                      </tr>\r\n                      <!--headline-->\r\n                      <tr>\r\n                        <td align=\"center\" style=\"font-family: \'Open Sans\', Arial, sans-serif; font-size: 22px;color:#414a51;font-weight: bold;\">Hello new nre (rreerree)</td>\r\n                      </tr>\r\n                      <!--end headline-->\r\n                      <tr>\r\n                        <td align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\r\n                          <table width=\"40\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n                            <tbody><tr>\r\n                              <td height=\"20\" style=\" border-bottom:3px solid #0087ff;\"></td>\r\n                            </tr>\r\n                          </tbody></table>\r\n                        </td>\r\n                      </tr>\r\n                      <tr>\r\n                        <td height=\"20\"></td>\r\n                      </tr>\r\n                      <!--content-->\r\n                      <tr>\r\n                        <td align=\"left\" style=\"font-family: \'Open sans\', Arial, sans-serif; color:#7f8c8d; font-size:16px; line-height: 28px;\"><div>\r\n    <div><span>Thank you for taking the time to verify your email address with us. Your email verification code\r\n            is</span>: <b><font size=\"6\">820542</font></b></div><br>\r\n    <div><span>Please enter this code in the designated field on our platform to complete the verification\r\n            process.</span></div><br>\r\n    <div><span>If you did not request this verification code, please disregard this email. Your account security is our\r\n            top priority, and we advise you to take appropriate measures if you suspect any unauthorized access.</span>\r\n    </div><br>\r\n    <div><span>If you have any questions or encounter any issues during the verification process, please don\'t hesitate\r\n            to contact our support team for assistance.</span></div><br>\r\n    <div><span>Thank you for choosing us.</span></div>\r\n</div></td>\r\n                      </tr>\r\n                      <!--end content-->\r\n                      <tr>\r\n                        <td height=\"40\"></td>\r\n                      </tr>\r\n              \r\n                    </tbody></table>\r\n                  </td>\r\n                </tr>\r\n                <tr>\r\n                  <td height=\"45\" align=\"center\" bgcolor=\"#f4f4f4\" style=\"border-bottom-left-radius:6px;border-bottom-right-radius:6px;\">\r\n                    <table align=\"center\" width=\"90%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n                      <tbody><tr>\r\n                        <td height=\"10\"></td>\r\n                      </tr>\r\n                      <!--preference-->\r\n                      <tr>\r\n                        <td class=\"preference-link\" align=\"center\" style=\"font-family: \'Open sans\', Arial, sans-serif; color:#95a5a6; font-size:14px;\">\r\n                          © 2024 <a href=\"#\">Viserbus</a>&nbsp;. All Rights Reserved. \r\n                        </td>\r\n                      </tr>\r\n                      <!--end preference-->\r\n                      <tr>\r\n                        <td height=\"10\"></td>\r\n                      </tr>\r\n                    </tbody></table>\r\n                  </td>\r\n                </tr>\r\n              </tbody></table>\r\n            </td>\r\n          </tr>\r\n        </tbody></table>\r\n      </td>\r\n    </tr>\r\n    <tr>\r\n      <td height=\"60\"></td>\r\n    </tr>\r\n  </tbody></table>', 'email', NULL, 0, '2025-06-11 22:04:35', '2025-06-11 22:04:35');

-- --------------------------------------------------------

--
-- Table structure for table `notification_templates`
--

CREATE TABLE `notification_templates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `act` varchar(40) DEFAULT NULL,
  `name` varchar(40) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `push_title` varchar(255) DEFAULT NULL,
  `email_body` text DEFAULT NULL,
  `sms_body` text DEFAULT NULL,
  `push_body` text DEFAULT NULL,
  `shortcodes` text DEFAULT NULL,
  `email_status` tinyint(1) NOT NULL DEFAULT 1,
  `email_sent_from_name` varchar(40) DEFAULT NULL,
  `email_sent_from_address` varchar(40) DEFAULT NULL,
  `sms_status` tinyint(1) NOT NULL DEFAULT 1,
  `sms_sent_from` varchar(40) DEFAULT NULL,
  `push_status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notification_templates`
--

INSERT INTO `notification_templates` (`id`, `act`, `name`, `subject`, `push_title`, `email_body`, `sms_body`, `push_body`, `shortcodes`, `email_status`, `email_sent_from_name`, `email_sent_from_address`, `sms_status`, `sms_sent_from`, `push_status`, `created_at`, `updated_at`) VALUES
(3, 'PAYMENT_COMPLETE', 'Payment - Automated - Successful', 'Payment Completed Successfully', '{{site_name}} - Payment successful', '<div>Your payment of <b>{{amount}}</b><font color=\"#212529\"><b>{{site_currency}}</b></font>&nbsp;is via&nbsp; <b>{{method_name}} </b>has been completed Successfully.<b><br></b></div><div><b><br></b></div><div><b>Details of your Payment :<br></b></div><div><br></div><div>Amount : {{amount}} {{site_currency}}</div><div>Charge: <font color=\"#000000\">{{charge}}&nbsp;</font><span style=\"background-color: var(--bs-card-bg); text-align: var(--bs-body-text-align);\"><font color=\"#000000\">{{site_currency}}</font></span></div><div><br></div><div>Conversion Rate : 1 {{site_currency}} = {{rate}} {{method_currency}}</div><div>Payable : {{method_amount}} {{method_currency}} <br></div><div>Paid via :&nbsp; {{method_name}}</div><div><br></div><div>Transaction Number : {{trx}}</div><div><br></div><div><b>Booking Information :<br></b></div><div><br></div><div>Date of Journey : {{journey_date}}</div><div>Seats: {{seats}}</div><div>Total Seats : {{total_seats}}</div><div>Starting Point : {{source}}</div><div>Destination : {{destination}}</div>', '{{amount}} {{site_currency}} Payment successful by {{gateway_name}} .\r\nJourney Date: {{journey_date}} , Seats: {{seats}}, Starting point: {{source}}, Dropping point: {{destination}}', 'Payment Completed Successfully', '{\r\n    \"trx\": \"Transaction Number\",\r\n    \"amount\": \"Request Amount By user\",\r\n    \"charge\": \"Gateway Charge\",\r\n    \"method_name\": \"Payment Method Name\",\r\n    \"method_currency\": \"Payment Method Currency\",\r\n    \"method_amount\": \"Payment Method Amount After Conversion\",\r\n    \"journey_date\": \"journey date\",\r\n    \"seats\": \"Seat Number\",\r\n    \"total_seats\": \"Total Seats\",\r\n    \"source\": \"Starting point\",\r\n    \"destination\": \"Destination point\"\r\n}', 1, '{{site_name}} Billing', NULL, 0, NULL, 1, '2021-11-03 12:00:00', '2024-07-17 13:17:59'),
(4, 'PAYMENT_APPROVE', 'Payment - Manual - Approved', 'Payment Request Approved', '{{site_name}} - Payment Request Approved', '<div>Your payment request of <b>{{amount}} {{site_currency}}</b> is via&nbsp; <b>{{method_name}} </b>is Approved .<b><br></b>\r\n</div>\r\n<div><b><br></b></div>\r\n<div><b>Details of your payment :<br></b></div>\r\n<div><br></div>\r\n<div>Amount : {{amount}} {{site_currency}}</div>\r\n<div>Charge: <font color=\"#FF0000\">{{charge}} {{site_currency}}</font>\r\n</div>\r\n<div><br></div>\r\n<div>Conversion Rate : 1 {{site_currency}} = {{rate}} {{method_currency}}</div>\r\n<div>Payable : {{method_amount}} {{method_currency}} <br></div>\r\n<div>Paid via :&nbsp; {{method_name}}</div>\r\n<div><br></div>\r\n<div>Transaction Number : {{trx}}</div>\r\n<div><br></div>\r\n<div><b>Booking Information :<br></b></div>\r\n<div><br></div>\r\n<div>Date of Journey : {{journey_date}}</div>\r\n<div>Seats: {{seats}}</div>\r\n<div>Total Seats : {{total_seats}}</div>\r\n<div>Starting Point : {{source}}</div>\r\n<div>Destination : {{destination}}</div>', 'Admin Approve Your {{amount}} {{gateway_currency}} payment request by {{gateway_name}} transaction : {{transaction}}.\r\nJourney Date: {{journey_date}} , Seats: {{seats}}, Starting point: {{source}}, Dropping point: {{destination}}', 'Payment of {{amount}} {{site_currency}} via {{method_name}} has been approved.', '{\r\n    \"trx\": \"Transaction Number\",\r\n    \"amount\": \"Request Amount By user\",\r\n    \"charge\": \"Gateway Charge\",\r\n    \"rate\": \"Conversion Rate\",\r\n    \"method_name\": \"Deposit Method Name\",\r\n    \"method_currency\": \"Deposit Method Currency\",\r\n    \"method_amount\": \"Deposit Method Amount After Conversion\",\r\n    \"journey_date\": \"journey date\",\r\n    \"seats\": \"Seat Number\",\r\n    \"total_seats\": \"Total Seats\",\r\n    \"source\": \"Starting point\",\r\n    \"destination\": \"Destination point\"\r\n}', 1, '{{site_name}} Billing', NULL, 0, NULL, 0, '2021-11-03 12:00:00', '2024-07-17 13:22:08'),
(5, 'PAYMENT_REJECT', 'Payment - Manual - Rejected', 'Payment Request Rejected', '{{site_name}} - Payment Request Rejected', '<div>Your payment request of <b>{{amount}} {{site_currency}}</b> is via&nbsp; <b>{{method_name}} </b>is Approved .<b><br></b>\r\n</div>\r\n<div><b><br></b></div>\r\n<div><b>Details of your payment :<br></b></div>\r\n<div><br></div>\r\n<div>Amount : {{amount}} {{site_currency}}</div>\r\n<div>Charge: <font color=\"#FF0000\">{{charge}} {{site_currency}}</font>\r\n</div>\r\n<div><br></div>\r\n<div>Conversion Rate : 1 {{site_currency}} = {{rate}} {{method_currency}}</div>\r\n<div>Payable : {{method_amount}} {{method_currency}} <br></div>\r\n<div>Paid via :&nbsp; {{method_name}}</div>\r\n<div><br></div>\r\n<div>Transaction Number : {{trx}}</div>\r\n<div><br></div>\r\n<div><b>Booking Information :<br></b></div>\r\n<div><br></div>\r\n<div>Date of Journey : {{journey_date}}</div>\r\n<div>Seats: {{seats}}</div>\r\n<div>Total Seats : {{total_seats}}</div>\r\n<div>Starting Point : {{source}}</div>\r\n<div>Destination : {{destination}}</div>', 'Admin Approve Your {{amount}} {{gateway_currency}} payment request by {{gateway_name}} transaction : {{transaction}}.\r\nJourney Date: {{journey_date}} , Seats: {{seats}}, Starting point: {{source}}, Dropping point: {{destination}}', 'Your deposit request of {{amount}} {{site_currency}} via {{method_name}} has been rejected.', '{\r\n    \"trx\": \"Transaction Number\",\r\n    \"amount\": \"Request Amount By user\",\r\n    \"charge\": \"Gateway Charge\",\r\n    \"rate\": \"Conversion Rate\",\r\n    \"method_name\": \"Payment Method Name\",\r\n    \"method_currency\": \"Payment Method Currency\",\r\n    \"method_amount\": \"Payment Method Amount After Conversion\",\r\n    \"journey_date\": \"journey date\",\r\n    \"seats\": \"Seat Number\",\r\n    \"total_seats\": \"Total Seats\",\r\n    \"source\": \"Starting point\",\r\n    \"destination\": \"Destination point\"\r\n}', 1, '{{site_name}} Billing', NULL, 0, NULL, 0, '2021-11-03 12:00:00', '2024-07-17 13:20:56'),
(6, 'PAYMENT_REQUEST', 'Payment- Manual - Requested', 'Payment Request Submitted Successfully', NULL, '<div>Your payment request of <b>{{amount}} {{site_currency}}</b> is via&nbsp; <b>{{method_name}} </b>submitted\r\n    successfully<b> .<br></b></div>\r\n<div><b><br></b></div>\r\n<div><b>Details of your payment :<br></b></div>\r\n<div><br></div>\r\n<div>Amount : {{amount}} {{site_currency}}</div>\r\n<div>Charge: <font color=\"#FF0000\">{{charge}} {{site_currency}}</font>\r\n</div>\r\n<div><br></div>\r\n<div>Conversion Rate : 1 {{site_currency}} = {{rate}} {{method_currency}}</div>\r\n<div>Payable : {{method_amount}} {{method_currency}} <br></div>\r\n<div>Pay via :&nbsp; {{method_name}}</div>\r\n<div><br></div>\r\n<div>Transaction Number : {{trx}}</div>\r\n<div><br></div>\r\n<div><b>Pending Booking Information :<br></b></div>\r\n<div><br></div>\r\n<div>Date of Journey : {{journey_date}}</div>\r\n<div>Seats: {{seats}}</div>\r\n<div>Total Seats : {{total_seats}}</div>\r\n<div>Starting Point : {{source}}</div>\r\n<div>Destination : {{destination}}</div>', '{{amount}} Payment requested by {{method}}. Charge: {{charge}} . Trx: {{trx}} .\r\nJourney Date: {{journey_date}} , Seats: {{seats}}, Starting point: {{source}}, Dropping point: {{destination}}', 'Your payment request of {{amount}} {{site_currency}} via {{method_name}} submitted successfully.', '{\r\n    \"trx\": \"Transaction Number\",\r\n    \"amount\": \"Request Amount By user\",\r\n    \"charge\": \"Gateway Charge\",\r\n    \"rate\": \"Conversion Rate\",\r\n    \"method_name\": \"Deposit Method Name\",\r\n    \"method_currency\": \"Deposit Method Currency\",\r\n    \"method_amount\": \"Deposit Method Amount After Conversion\",\r\n    \"journey_date\": \"journey date\",\r\n    \"seats\": \"Seat Number\",\r\n    \"total_seats\": \"Total Seats\",\r\n    \"source\": \"Starting point\",\r\n    \"destination\": \"Destination point\"\r\n}', 1, '{{site_name}} Billing', NULL, 0, NULL, 0, '2021-11-03 12:00:00', '2024-07-17 13:25:53'),
(7, 'PASS_RESET_CODE', 'Password - Reset - Code', 'Password Reset', '{{site_name}} Password Reset Code', '<div>We\'ve received a request to reset the password for your account on <b>{{time}}</b>. The request originated from\r\n            the following IP address: <b>{{ip}}</b>, using <b>{{browser}}</b> on <b>{{operating_system}}</b>.\r\n    </div><br>\r\n    <div><span>To proceed with the password reset, please use the following account recovery code</span>: <span><b><font size=\"6\">{{code}}</font></b></span></div><br>\r\n    <div><span>If you did not initiate this password reset request, please disregard this message. Your account security\r\n            remains our top priority, and we advise you to take appropriate action if you suspect any unauthorized\r\n            access to your account.</span></div>', 'To proceed with the password reset, please use the following account recovery code: {{code}}', 'To proceed with the password reset, please use the following account recovery code: {{code}}', '{\"code\":\"Verification code for password reset\",\"ip\":\"IP address of the user\",\"browser\":\"Browser of the user\",\"operating_system\":\"Operating system of the user\",\"time\":\"Time of the request\"}', 1, '{{site_name}} Authentication Center', NULL, 0, NULL, 0, '2021-11-03 12:00:00', '2024-05-08 07:24:57'),
(8, 'PASS_RESET_DONE', 'Password - Reset - Confirmation', 'Password Reset Successful', NULL, '<div><div><span>We are writing to inform you that the password reset for your account was successful. This action was completed at {{time}} from the following browser</span>: <span>{{browser}}</span><span>on {{operating_system}}, with the IP address</span>: <span>{{ip}}</span>.</div><br><div><span>Your account security is our utmost priority, and we are committed to ensuring the safety of your information. If you did not initiate this password reset or notice any suspicious activity on your account, please contact our support team immediately for further assistance.</span></div></div>', 'We are writing to inform you that the password reset for your account was successful.', 'We are writing to inform you that the password reset for your account was successful.', '{\"ip\":\"IP address of the user\",\"browser\":\"Browser of the user\",\"operating_system\":\"Operating system of the user\",\"time\":\"Time of the request\"}', 1, '{{site_name}} Authentication Center', NULL, 1, NULL, 0, '2021-11-03 12:00:00', '2024-04-25 03:27:24'),
(9, 'ADMIN_SUPPORT_REPLY', 'Support - Reply', 'Re: {{ticket_subject}} - Ticket #{{ticket_id}}', '{{site_name}} - Support Ticket Replied', '<div>\r\n    <div><span>Thank you for reaching out to us regarding your support ticket with the subject</span>:\r\n        <span>\"{{ticket_subject}}\"&nbsp;</span><span>and ticket ID</span>: {{ticket_id}}.</div><br>\r\n    <div><span>We have carefully reviewed your inquiry, and we are pleased to provide you with the following\r\n            response</span><span>:</span></div><br>\r\n    <div>{{reply}}</div><br>\r\n    <div><span>If you have any further questions or need additional assistance, please feel free to reply by clicking on\r\n            the following link</span>: <a href=\"{{link}}\" title=\"\" target=\"_blank\">{{link}}</a><span>. This link will take you to\r\n            the ticket thread where you can provide further information or ask for clarification.</span></div><br>\r\n    <div><span>Thank you for your patience and cooperation as we worked to address your concerns.</span></div>\r\n</div>', 'Thank you for reaching out to us regarding your support ticket with the subject: \"{{ticket_subject}}\" and ticket ID: {{ticket_id}}. We have carefully reviewed your inquiry. To check the response, please go to the following link: {{link}}', 'Re: {{ticket_subject}} - Ticket #{{ticket_id}}', '{\"ticket_id\":\"ID of the support ticket\",\"ticket_subject\":\"Subject  of the support ticket\",\"reply\":\"Reply made by the admin\",\"link\":\"URL to view the support ticket\"}', 1, '{{site_name}} Support Team', NULL, 1, NULL, 0, '2021-11-03 12:00:00', '2024-05-08 07:26:06'),
(10, 'EVER_CODE', 'Verification - Email', 'Email Verification Code', NULL, '<div>\r\n    <div><span>Thank you for taking the time to verify your email address with us. Your email verification code\r\n            is</span>: <b><font size=\"6\">{{code}}</font></b></div><br>\r\n    <div><span>Please enter this code in the designated field on our platform to complete the verification\r\n            process.</span></div><br>\r\n    <div><span>If you did not request this verification code, please disregard this email. Your account security is our\r\n            top priority, and we advise you to take appropriate measures if you suspect any unauthorized access.</span>\r\n    </div><br>\r\n    <div><span>If you have any questions or encounter any issues during the verification process, please don\'t hesitate\r\n            to contact our support team for assistance.</span></div><br>\r\n    <div><span>Thank you for choosing us.</span></div>\r\n</div>', '---', '---', '{\"code\":\"Email verification code\"}', 1, '{{site_name}} Verification Center', NULL, 0, NULL, 0, '2021-11-03 12:00:00', '2024-04-25 03:27:12'),
(11, 'SVER_CODE', 'Verification - SMS', 'Verify Your Mobile Number', NULL, '---', 'Your mobile verification code is {{code}}. Please enter this code in the appropriate field to verify your mobile number. If you did not request this code, please ignore this message.', '---', '{\"code\":\"SMS Verification Code\"}', 0, '{{site_name}} Verification Center', NULL, 1, NULL, 0, '2021-11-03 12:00:00', '2024-04-25 03:27:03'),
(15, 'DEFAULT', 'Default Template', '{{subject}}', '{{subject}}', '{{message}}', '{{message}}', '{{message}}', '{\"subject\":\"Subject\",\"message\":\"Message\"}', 1, NULL, NULL, 1, NULL, 1, '2019-09-14 13:14:22', '2024-05-16 01:32:53');

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(40) DEFAULT NULL,
  `slug` varchar(40) DEFAULT NULL,
  `tempname` varchar(40) DEFAULT NULL COMMENT 'template name',
  `secs` text DEFAULT NULL,
  `seo_content` text DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `name`, `slug`, `tempname`, `secs`, `seo_content`, `is_default`, `created_at`, `updated_at`) VALUES
(1, 'HOME', '/', 'templates.basic.', '[\"how_it_works\",\"amenities\",\"testimonials\",\"blog\"]', '{\"image\":\"663212c9551ed1714557641.png\",\"description\":\"Et recusandae Minus\",\"social_title\":null,\"social_description\":\"Odit magna eos cons\",\"keywords\":null}', 1, '2020-07-11 06:23:58', '2024-07-04 04:48:18'),
(4, 'Blog', 'blog', 'templates.basic.', NULL, NULL, 1, '2020-10-22 01:14:43', '2020-10-22 01:14:43'),
(5, 'Contact', 'contact', 'templates.basic.', NULL, NULL, 1, '2020-10-22 01:14:53', '2020-10-22 01:14:53'),
(26, 'حول', 'abouk', 'templates.basic.', '[\"about\",\"faq\"]', NULL, 0, '2024-07-04 06:48:11', '2025-07-02 01:56:35'),
(27, 'الأسئلة الشائعة', 'faqs', 'templates.basic.', '[\"faq\",\"blog\"]', NULL, 0, '2024-07-04 06:48:20', '2025-07-07 23:14:48');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(40) DEFAULT NULL,
  `token` varchar(40) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('yahyaabodia2@gmail.com', '937751', '2025-08-21 00:42:04');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `counter` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `fleet` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `counter`, `fleet`, `created_at`, `updated_at`) VALUES
(1, 'staff_v', 3, 2, NULL, '2025-08-19 02:54:47'),
(2, 'staff_ve', 3, 1, NULL, '2025-08-22 15:42:26');

-- --------------------------------------------------------

--
-- Table structure for table `schedules`
--

CREATE TABLE `schedules` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `start_from` time DEFAULT NULL,
  `end_at` time DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `schedules`
--

INSERT INTO `schedules` (`id`, `start_from`, `end_at`, `status`, `created_at`, `updated_at`) VALUES
(1, '00:29:00', '17:08:00', 1, '2025-06-24 22:08:42', '2025-06-24 22:08:42'),
(2, '04:00:00', '20:00:00', 1, '2025-06-26 13:58:37', '2025-06-26 13:58:37'),
(3, '04:00:00', '10:00:00', 1, '2025-06-26 14:03:17', '2025-06-26 14:03:17'),
(4, '20:00:00', '02:00:00', 1, '2025-06-26 14:04:00', '2025-06-26 14:04:00'),
(5, '04:00:00', '19:00:00', 1, '2025-06-26 14:06:53', '2025-06-26 14:06:53'),
(6, '20:00:00', '03:00:00', 1, '2025-06-26 14:09:02', '2025-06-26 14:09:02'),
(7, '04:00:00', '02:00:00', 1, '2025-06-26 14:10:58', '2025-06-26 14:10:58'),
(8, '04:00:00', '04:00:00', 1, '2025-06-26 14:11:40', '2025-06-26 14:11:40'),
(9, '19:46:00', '22:49:00', 1, '2025-06-27 14:44:42', '2025-06-27 14:44:42'),
(10, '01:10:00', '04:10:00', 0, '2025-08-27 23:11:05', '2025-08-27 23:12:33');

-- --------------------------------------------------------

--
-- Table structure for table `seat_layouts`
--

CREATE TABLE `seat_layouts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `layout` varchar(40) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `seat_layouts`
--

INSERT INTO `seat_layouts` (`id`, `layout`, `created_at`, `updated_at`) VALUES
(1, '2 x 2', '2025-06-19 17:06:09', '2025-06-19 17:06:09'),
(3, '2 x 3', '2025-06-24 20:26:16', '2025-06-24 20:26:16'),
(4, '3 x 2', '2025-06-24 20:26:25', '2025-06-24 20:26:25'),
(6, '1 x 1', '2025-06-24 20:26:46', '2025-06-24 20:26:46'),
(7, '3 x 3', '2025-06-24 22:03:37', '2025-06-24 22:03:37'),
(11, '2 × 2', '2025-08-27 23:03:23', '2025-08-27 23:03:23');

-- --------------------------------------------------------

--
-- Table structure for table `subscribers`
--

CREATE TABLE `subscribers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(40) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `support_attachments`
--

CREATE TABLE `support_attachments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `support_message_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `attachment` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `support_attachments`
--

INSERT INTO `support_attachments` (`id`, `support_message_id`, `attachment`, `created_at`, `updated_at`) VALUES
(1, 4, '68854524a53a31753564452.jpg', '2025-07-26 21:14:14', '2025-07-26 21:14:14');

-- --------------------------------------------------------

--
-- Table structure for table `support_messages`
--

CREATE TABLE `support_messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `support_ticket_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `admin_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `message` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `support_messages`
--

INSERT INTO `support_messages` (`id`, `support_ticket_id`, `admin_id`, `message`, `created_at`, `updated_at`) VALUES
(1, 1, 0, 'asasas', '2025-07-26 20:17:33', '2025-07-26 20:17:33'),
(2, 1, 0, 'sasa', '2025-07-26 20:17:49', '2025-07-26 20:17:49'),
(3, 1, 0, 'kjhk', '2025-07-26 21:13:15', '2025-07-26 21:13:15'),
(4, 1, 0, 'test', '2025-07-26 21:14:12', '2025-07-26 21:14:12'),
(5, 2, 0, 'نتنتنت', '2025-08-13 19:31:11', '2025-08-13 19:31:11'),
(6, 3, 0, 'غاغغغ', '2025-08-25 00:35:13', '2025-08-25 00:35:13'),
(7, 2, 1, 'jgjjggjgj', '2025-08-25 00:47:53', '2025-08-25 00:47:53'),
(9, 4, 0, '4334', '2025-08-27 23:33:09', '2025-08-27 23:33:09');

-- --------------------------------------------------------

--
-- Table structure for table `support_tickets`
--

CREATE TABLE `support_tickets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT 0,
  `name` varchar(40) DEFAULT NULL,
  `email` varchar(40) DEFAULT NULL,
  `ticket` varchar(40) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0: Open, 1: Answered, 2: Replied, 3: Closed',
  `priority` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1 = Low, 2 = medium, 3 = heigh',
  `last_reply` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `support_tickets`
--

INSERT INTO `support_tickets` (`id`, `user_id`, `name`, `email`, `ticket`, `subject`, `status`, `priority`, `last_reply`, `created_at`, `updated_at`) VALUES
(1, 6, 'yahya tttt', 'yah3342@gmail.com', '42575326', 'ssa', 2, 2, '2025-07-26 23:14:12', '2025-07-26 20:17:33', '2025-07-26 21:14:12'),
(2, 4, 'yahya test', 'yahyaabodia2@gmail.com', '675855', 'hi', 1, 3, '2025-08-25 02:47:53', '2025-08-13 19:31:11', '2025-08-25 00:47:53'),
(3, 4, 'yahya test', 'yahyaabodia2@gmail.com', '95704041', 'hi', 3, 2, '2025-08-25 02:49:07', '2025-08-25 00:35:13', '2025-08-25 00:50:18'),
(4, 4, 'yahya aa', 'yahyaabodia2@gmail.com', '990470', '34343', 0, 3, '2025-08-28 01:33:09', '2025-08-27 23:33:09', '2025-08-27 23:33:09');

-- --------------------------------------------------------

--
-- Table structure for table `ticket_prices`
--

CREATE TABLE `ticket_prices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `fleet_type_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `vehicle_route_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `price` decimal(8,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ticket_prices`
--

INSERT INTO `ticket_prices` (`id`, `fleet_type_id`, `vehicle_route_id`, `price`, `created_at`, `updated_at`) VALUES
(3, 1, 1, 140.00, '2025-06-26 17:34:37', '2025-06-26 17:34:37'),
(4, 1, 15, 140.00, '2025-06-26 17:38:55', '2025-06-26 17:38:55'),
(5, 1, 4, 150.00, '2025-06-26 17:41:10', '2025-06-26 17:41:10'),
(6, 1, 3, 150.00, '2025-06-26 17:41:26', '2025-06-26 17:41:26'),
(7, 1, 5, 100.00, '2025-06-26 17:41:48', '2025-06-26 17:41:48'),
(8, 1, 6, 100.00, '2025-06-26 17:42:34', '2025-06-26 17:42:34'),
(9, 1, 7, 75.00, '2025-06-26 17:42:50', '2025-06-26 17:42:50'),
(10, 1, 8, 75.00, '2025-06-26 17:44:00', '2025-06-26 17:44:00'),
(11, 1, 9, 400.00, '2025-06-26 17:44:21', '2025-06-26 17:44:21'),
(12, 1, 10, 400.00, '2025-06-26 17:44:38', '2025-06-26 17:44:38'),
(13, 1, 11, 430.00, '2025-06-26 17:44:56', '2025-06-26 17:44:56'),
(14, 1, 12, 400.00, '2025-06-26 17:45:17', '2025-06-26 17:45:17'),
(15, 1, 13, 160.00, '2025-06-26 17:45:36', '2025-06-26 17:45:36'),
(16, 1, 14, 160.00, '2025-06-26 17:45:54', '2025-06-26 17:45:54'),
(17, 2, 15, 20.00, '2025-06-27 14:42:47', '2025-06-27 14:42:47');

-- --------------------------------------------------------

--
-- Table structure for table `ticket_price_by_stoppages`
--

CREATE TABLE `ticket_price_by_stoppages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ticket_price_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `source_destination` varchar(40) DEFAULT NULL,
  `price` double(8,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ticket_price_by_stoppages`
--

INSERT INTO `ticket_price_by_stoppages` (`id`, `ticket_price_id`, `source_destination`, `price`, `created_at`, `updated_at`) VALUES
(3, 3, '[\"2\",\"1\"]', 140.00, '2025-06-26 17:34:37', '2025-06-26 17:34:37'),
(4, 4, '[\"1\",\"2\"]', 140.00, '2025-06-26 17:38:55', '2025-06-26 17:38:55'),
(5, 5, '[\"4\",\"2\"]', 150.00, '2025-06-26 17:41:10', '2025-06-26 17:41:10'),
(6, 6, '[\"2\",\"4\"]', 150.00, '2025-06-26 17:41:26', '2025-06-26 17:41:26'),
(7, 7, '[\"2\",\"3\"]', 100.00, '2025-06-26 17:41:48', '2025-06-26 17:41:48'),
(8, 8, '[\"3\",\"2\"]', 100.00, '2025-06-26 17:42:34', '2025-06-26 17:42:34'),
(9, 9, '[\"2\",\"6\"]', 75.00, '2025-06-26 17:42:50', '2025-06-26 17:42:50'),
(10, 10, '[\"6\",\"2\"]', 75.00, '2025-06-26 17:44:00', '2025-06-26 17:44:00'),
(11, 11, '[\"2\",\"11\"]', 400.00, '2025-06-26 17:44:21', '2025-06-26 17:44:21'),
(12, 12, '[\"11\",\"2\"]', 400.00, '2025-06-26 17:44:38', '2025-06-26 17:44:38'),
(13, 13, '[\"2\",\"8\"]', 430.00, '2025-06-26 17:44:56', '2025-06-26 17:44:56'),
(14, 14, '[\"8\",\"2\"]', 400.00, '2025-06-26 17:45:17', '2025-06-26 17:45:17'),
(15, 15, '[\"2\",\"9\"]', 160.00, '2025-06-26 17:45:36', '2025-06-26 17:45:36'),
(16, 16, '[\"9\",\"2\"]', 160.00, '2025-06-26 17:45:54', '2025-06-26 17:45:54'),
(17, 17, '[\"3\",\"1\"]', 222.00, '2025-06-27 14:42:47', '2025-08-27 23:14:27');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `amount` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `charge` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `post_balance` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `trx_type` varchar(40) DEFAULT NULL,
  `trx` varchar(40) DEFAULT NULL,
  `details` varchar(255) DEFAULT NULL,
  `remark` varchar(40) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `user_id`, `amount`, `charge`, `post_balance`, `trx_type`, `trx`, `details`, `remark`, `created_at`, `updated_at`) VALUES
(1, 6, 3.00000000, 0.00000000, 3.00000000, '+', 'QURVZVO7JIGB', 'replay', 'balance_add', '2025-07-04 17:39:06', '2025-07-04 17:39:06'),
(2, 6, 3.00000000, 0.00000000, 0.00000000, '-', 'L8LX25YQ8LVK', 'e', 'balance_subtract', '2025-07-04 17:39:44', '2025-07-04 17:39:44');

-- --------------------------------------------------------

--
-- Table structure for table `trips`
--

CREATE TABLE `trips` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `fleet_type_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `vehicle_route_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `schedule_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `start_from` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `end_to` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `day_off` varchar(255) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `trips`
--

INSERT INTO `trips` (`id`, `title`, `fleet_type_id`, `vehicle_route_id`, `schedule_id`, `start_from`, `end_to`, `day_off`, `status`, `created_at`, `updated_at`) VALUES
(1, 'رحلة صيف 2025', 2, 9, 1, 2, 11, '[\"0\",\"1\",\"2\",\"3\",\"4\",\"6\"]', 1, '2025-06-24 22:10:40', '2025-06-27 14:17:39'),
(2, 'Darna', 1, 1, 1, 2, 1, '[]', 1, '2025-06-27 14:49:57', '2025-06-27 14:49:57'),
(3, 'trnrtnt', 1, 1, 1, 1, 1, '[]', 1, '2025-08-19 01:03:48', '2025-08-19 01:03:48'),
(4, 'رحلة القاهرة (اختبار)', 2, 11, 3, 2, 8, '[\"0\",\"1\",\"2\"]', 1, '2025-08-27 23:20:19', '2025-08-27 23:20:19');

-- --------------------------------------------------------

--
-- Table structure for table `update_logs`
--

CREATE TABLE `update_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `version` varchar(40) DEFAULT NULL,
  `update_log` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `firstname` varchar(40) DEFAULT NULL,
  `lastname` varchar(40) DEFAULT NULL,
  `username` varchar(40) DEFAULT NULL,
  `email` varchar(40) NOT NULL,
  `dial_code` varchar(40) DEFAULT NULL,
  `mobile` varchar(40) DEFAULT NULL,
  `ref_by` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `balance` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `password` varchar(255) NOT NULL,
  `country_name` varchar(255) DEFAULT NULL,
  `country_code` varchar(40) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `zip` varchar(255) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0: banned, 1: active',
  `gender` int(11) NOT NULL,
  `ev` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0: email unverified, 1: email verified',
  `sv` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0: mobile unverified, 1: mobile verified',
  `profile_complete` tinyint(1) NOT NULL DEFAULT 0,
  `ver_code` varchar(40) DEFAULT NULL COMMENT 'stores verification code',
  `ver_code_send_at` datetime DEFAULT NULL COMMENT 'verification send time',
  `ts` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0: 2fa off, 1: 2fa on',
  `tv` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0: 2fa unverified, 1: 2fa verified',
  `tsc` varchar(255) DEFAULT NULL,
  `ban_reason` varchar(255) DEFAULT NULL,
  `remember_token` varchar(255) DEFAULT NULL,
  `provider` varchar(255) DEFAULT NULL,
  `provider_id` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `username`, `email`, `dial_code`, `mobile`, `ref_by`, `balance`, `password`, `country_name`, `country_code`, `city`, `state`, `zip`, `address`, `status`, `gender`, `ev`, `sv`, `profile_complete`, `ver_code`, `ver_code_send_at`, `ts`, `tv`, `tsc`, `ban_reason`, `remember_token`, `provider`, `provider_id`, `created_at`, `updated_at`) VALUES
(1, 'tss', 'sdss', 'vsdvshbjjnuy', 'ds2@v.com', '93', '188482215', 0, 0.00000000, '$2y$12$Bl69Cyswv.F89d.rWWjxveysVJRPqX9cFBx5kgfMpTtYnRYn9w5Ky', 'Afghanistan', 'AF', 'tripoli', NULL, NULL, 'tripoli', 1, 0, 0, 1, 1, '284180', '2025-06-03 01:18:44', 0, 1, NULL, NULL, NULL, NULL, NULL, '2025-06-02 23:15:46', '2025-06-02 23:18:44'),
(2, 'new', 'nre', 'rreerree', 'drer@ref.com', '93', '343453553', 0, 0.00000000, '$2y$12$ipOoStH7lzNSyBkb/yYGIudEYyPNJpzmNvRJAz7gcya6o302yBU9S', 'Afghanistan', 'AF', NULL, NULL, NULL, NULL, 1, 0, 0, 1, 1, '972357', '2025-06-12 00:38:00', 0, 1, NULL, NULL, NULL, NULL, NULL, '2025-06-11 22:03:46', '2025-06-11 22:38:00'),
(3, 'nn', 'nn', 'nnnnnnn', 'nn@nn.com', '93', '3424334433', 0, 0.00000000, '$2y$12$TxU..6Q2AsXfBglEp1TI7eJ7M7v2Nm9WXhRcDbs39woYAKZRA3thm', 'Afghanistan', 'AF', NULL, NULL, NULL, NULL, 1, 0, 1, 1, 1, NULL, NULL, 0, 1, NULL, NULL, NULL, NULL, NULL, '2025-06-11 22:09:05', '2025-06-11 22:09:18'),
(4, 'yahya', 'aa', 'yahyaa', 'yahyaabodia2@gmail.com', '93', '918051663', 0, 0.00000000, '$2y$12$TxU..6Q2AsXfBglEp1TI7eJ7M7v2Nm9WXhRcDbs39woYAKZRA3thm', 'Afghanistan', 'AF', 'asw', 'taj', NULL, 'tripoli', 1, 0, 1, 1, 1, NULL, NULL, 0, 1, NULL, NULL, NULL, NULL, NULL, '2025-06-17 18:32:41', '2025-08-27 19:07:08'),
(5, 'YASSEN', 'test', 'yassen', '1200@yahya.com', '93', '943189070', 0, 0.00000000, '$2y$12$9j2XohM7VCBeTINP.fGn../zJw7uzFaAX0kNGdAHUKFvRTDNXTc7q', 'Afghanistan', 'AF', 'tripoli', 'taj', '10001', 'tripoli', 1, 0, 1, 1, 1, NULL, NULL, 0, 1, NULL, NULL, NULL, NULL, NULL, '2025-06-24 22:14:36', '2025-06-24 22:15:18'),
(7, 'aboudaya', 'yahya', 'test_ww', 'test@gmail.com', '93', '9015555555', 0, 0.00000000, '$2y$12$HNUDlc0MDqmk5zvyhKxik.eW01mALTnxVfAh3wI7fQJnSRlYtRin6', 'Afghanistan', 'AF', 'test1', 'tajora', '10001', 'tripoli', 1, 0, 0, 1, 1, '305311', '2025-08-27 18:45:13', 0, 1, NULL, NULL, NULL, NULL, NULL, '2025-08-27 16:40:09', '2025-08-27 16:45:13'),
(8, 'bode', 'bode', 'bodeaa', 'bode@gmail.com', '218', '0915858585', 0, 0.00000000, '$2y$12$5w1ePP1TNXo2esB7NjEt4e.E3LG8gxT.GG.hYMa7lmGsZOVM3yAyK', 'Libya', 'LY', 'test1', 'tajora', '10001', 'tripoli', 1, 0, 1, 1, 1, '434873', '2025-08-27 22:05:04', 0, 1, NULL, NULL, NULL, NULL, NULL, '2025-08-27 16:54:02', '2025-08-27 20:05:04'),
(9, 'yhyy', 'yahya', '', 'yahya@gmail.com', '218', '44332424', 0, 0.00000000, '$2y$12$TxU..6Q2AsXfBglEp1TI7eJ7M7v2Nm9WXhRcDbs39woYAKZRA3thm', 'Libya', 'LY', 'test1', NULL, NULL, 'dsc', 1, 0, 0, 1, 1, '975395', '2025-08-27 22:10:01', 0, 1, NULL, NULL, NULL, NULL, NULL, '2025-08-27 17:17:26', '2025-08-27 20:10:01'),
(10, 'fewew', 'rgwger', 'testtt', 'twst@c.com', '93', '34242', 0, 0.00000000, '$2y$12$mZSuWdSvTk5x.FKufz08I.2dC//vqI6LASDycBqsMPFAWuAHsLi.K', 'Afghanistan', 'AF', NULL, NULL, NULL, NULL, 0, 0, 1, 1, 1, NULL, NULL, 0, 1, NULL, 'اختبار', NULL, NULL, NULL, '2025-08-27 20:13:17', '2025-08-27 23:30:36'),
(11, 'testtttttt', 'tesssstnow', 'nowregrger', 'tessstenow@f.com', '93', '324242', 0, 0.00000000, '$2y$12$xfjC95oc7ooLMI.B17nviO84EbsNzNoBb7N24r5L/U1ThN7X7tn.a', 'Afghanistan', 'AF', NULL, NULL, NULL, NULL, 1, 0, 1, 1, 1, NULL, NULL, 0, 1, NULL, NULL, NULL, NULL, NULL, '2025-08-27 20:14:48', '2025-08-27 20:15:05'),
(12, 'aa', 'yah', NULL, 'aa@gmail.com', '93', '434335353', 0, 0.00000000, '$2y$12$mIHQPeOQM46b/dhQLgRdquBaQPSWl3Y4TaDOBwAn1NOkncsI57Rv.', 'Afghanistan', 'AF', 'fergerger', NULL, NULL, NULL, 1, 1, 1, 1, 1, NULL, NULL, 0, 1, NULL, NULL, NULL, NULL, NULL, '2025-08-27 20:21:24', '2025-08-27 20:58:54'),
(13, 'ss', 'aass', NULL, 'yahya@gmail.coma', '218', '88888888888', 0, 0.00000000, '$2y$12$.hL0sZVVpLEjtiWKWR9AeOtQ.BNIObxnvgxkk56jJPQaupFk4gDRa', 'Libya', 'LY', NULL, 'taj', NULL, 'طرابس', 1, 0, 0, 0, 1, NULL, NULL, 0, 1, NULL, NULL, NULL, NULL, NULL, '2025-08-27 21:01:16', '2025-08-27 23:28:01');

-- --------------------------------------------------------

--
-- Table structure for table `user_logins`
--

CREATE TABLE `user_logins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `user_ip` varchar(40) DEFAULT NULL,
  `city` varchar(40) DEFAULT NULL,
  `country` varchar(40) DEFAULT NULL,
  `country_code` varchar(40) DEFAULT NULL,
  `longitude` varchar(40) DEFAULT NULL,
  `latitude` varchar(40) DEFAULT NULL,
  `browser` varchar(40) DEFAULT NULL,
  `os` varchar(40) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_logins`
--

INSERT INTO `user_logins` (`id`, `user_id`, `user_ip`, `city`, `country`, `country_code`, `longitude`, `latitude`, `browser`, `os`, `created_at`, `updated_at`) VALUES
(1, 1, '127.0.0.1', '', '', '', '', '', 'Chrome', 'Windows 10', '2025-06-02 23:15:47', '2025-06-02 23:15:47'),
(2, 1, '127.0.0.1', '', '', '', '', '', 'Chrome', 'Windows 10', '2025-06-02 23:16:49', '2025-06-02 23:16:49'),
(3, 1, '127.0.0.1', '', '', '', '', '', 'Chrome', 'Windows 10', '2025-06-02 23:18:44', '2025-06-02 23:18:44'),
(4, 2, '127.0.0.1', '', '', '', '', '', 'Chrome', 'Windows 10', '2025-06-11 22:03:46', '2025-06-11 22:03:46'),
(5, 2, '127.0.0.1', '', '', '', '', '', 'Chrome', 'Windows 10', '2025-06-11 22:05:56', '2025-06-11 22:05:56'),
(6, 3, '127.0.0.1', '', '', '', '', '', 'Chrome', 'Windows 10', '2025-06-11 22:09:05', '2025-06-11 22:09:05'),
(7, 4, '127.0.0.1', '', '', '', '', '', 'Chrome', 'Windows 10', '2025-06-17 18:32:41', '2025-06-17 18:32:41'),
(8, 4, '127.0.0.1', '', '', '', '', '', 'Chrome', 'Windows 10', '2025-06-19 15:26:39', '2025-06-19 15:26:39'),
(9, 5, '127.0.0.1', '', '', '', '', '', 'Chrome', 'Windows 10', '2025-06-24 22:14:36', '2025-06-24 22:14:36'),
(10, 6, '127.0.0.1', '', '', '', '', '', 'Chrome', 'Windows 10', '2025-06-24 22:51:00', '2025-06-24 22:51:00'),
(11, 4, '127.0.0.1', '', '', '', '', '', 'Chrome', 'Windows 10', '2025-06-26 13:26:53', '2025-06-26 13:26:53'),
(12, 4, '127.0.0.1', '', '', '', '', '', 'Chrome', 'Windows 10', '2025-06-27 14:52:31', '2025-06-27 14:52:31'),
(13, 4, '127.0.0.1', '', '', '', '', '', 'Chrome', 'Windows 10', '2025-06-28 20:34:18', '2025-06-28 20:34:18'),
(14, 4, '127.0.0.1', '', '', '', '', '', 'Chrome', 'Windows 10', '2025-06-29 21:35:14', '2025-06-29 21:35:14'),
(15, 4, '127.0.0.1', '', '', '', '', '', 'Chrome', 'Windows 10', '2025-06-30 01:38:36', '2025-06-30 01:38:36'),
(16, 4, '127.0.0.1', '', '', '', '', '', 'Chrome', 'Windows 10', '2025-06-30 21:04:17', '2025-06-30 21:04:17'),
(17, 4, '127.0.0.1', '', '', '', '', '', 'Chrome', 'Windows 10', '2025-07-01 01:51:56', '2025-07-01 01:51:56'),
(18, 4, '127.0.0.1', '', '', '', '', '', 'Chrome', 'Windows 10', '2025-07-01 15:30:52', '2025-07-01 15:30:52'),
(19, 4, '127.0.0.1', '', '', '', '', '', 'Chrome', 'Windows 10', '2025-07-01 15:35:55', '2025-07-01 15:35:55'),
(20, 4, '127.0.0.1', '', '', '', '', '', 'Chrome', 'Windows 10', '2025-07-01 16:17:13', '2025-07-01 16:17:13'),
(21, 4, '127.0.0.1', '', '', '', '', '', 'Chrome', 'Windows 10', '2025-07-01 20:08:55', '2025-07-01 20:08:55'),
(22, 4, '127.0.0.1', '', '', '', '', '', 'Chrome', 'Windows 10', '2025-07-02 01:48:43', '2025-07-02 01:48:43'),
(23, 4, '127.0.0.1', '', '', '', '', '', 'Chrome', 'Windows 10', '2025-07-03 20:52:12', '2025-07-03 20:52:12'),
(24, 4, '127.0.0.1', '', '', '', '', '', 'Chrome', 'Windows 10', '2025-07-07 23:32:25', '2025-07-07 23:32:25'),
(25, 4, '127.0.0.1', '', '', '', '', '', 'Chrome', 'Windows 10', '2025-07-08 00:22:51', '2025-07-08 00:22:51'),
(26, 6, '127.0.0.1', '', '', '', '', '', 'Chrome', 'Windows 10', '2025-07-08 00:24:34', '2025-07-08 00:24:34'),
(27, 6, '127.0.0.1', '', '', '', '', '', 'Chrome', 'Windows 10', '2025-07-08 09:28:43', '2025-07-08 09:28:43'),
(28, 6, '127.0.0.1', '', '', '', '', '', 'Chrome', 'Windows 10', '2025-07-08 09:46:01', '2025-07-08 09:46:01'),
(29, 6, '127.0.0.1', '', '', '', '', '', 'Chrome', 'Windows 10', '2025-07-08 09:47:22', '2025-07-08 09:47:22'),
(30, 6, '127.0.0.1', '', '', '', '', '', 'Chrome', 'Windows 10', '2025-07-26 20:14:38', '2025-07-26 20:14:38'),
(31, 6, '127.0.0.1', '', '', '', '', '', 'Chrome', 'Windows 10', '2025-07-28 22:23:52', '2025-07-28 22:23:52'),
(32, 6, '127.0.0.1', '', '', '', '', '', 'Chrome', 'Windows 10', '2025-07-29 23:06:57', '2025-07-29 23:06:57'),
(33, 6, '127.0.0.1', '', '', '', '', '', 'Chrome', 'Windows 10', '2025-07-29 23:08:16', '2025-07-29 23:08:16'),
(34, 6, '127.0.0.1', '', '', '', '', '', 'Chrome', 'Windows 10', '2025-07-30 19:26:24', '2025-07-30 19:26:24'),
(35, 4, '127.0.0.1', '', '', '', '', '', 'Chrome', 'Windows 10', '2025-07-30 20:52:56', '2025-07-30 20:52:56'),
(36, 4, '127.0.0.1', '', '', '', '', '', 'Chrome', 'Windows 10', '2025-07-31 07:23:12', '2025-07-31 07:23:12'),
(37, 4, '127.0.0.1', '', '', '', '', '', 'Chrome', 'Windows 10', '2025-07-31 07:33:44', '2025-07-31 07:33:44'),
(38, 4, '127.0.0.1', '', '', '', '', '', 'Chrome', 'Windows 10', '2025-08-03 21:12:00', '2025-08-03 21:12:00'),
(39, 4, '127.0.0.1', '', '', '', '', '', 'Chrome', 'Windows 10', '2025-08-10 20:25:02', '2025-08-10 20:25:02'),
(40, 4, '127.0.0.1', '', '', '', '', '', 'Chrome', 'Windows 10', '2025-08-13 21:10:24', '2025-08-13 21:10:24'),
(41, 4, '127.0.0.1', '', '', '', '', '', 'Chrome', 'Windows 10', '2025-08-15 18:04:34', '2025-08-15 18:04:34'),
(42, 4, '127.0.0.1', '', '', '', '', '', 'Chrome', 'Windows 10', '2025-08-18 20:10:26', '2025-08-18 20:10:26'),
(43, 4, '127.0.0.1', '', '', '', '', '', 'Chrome', 'Windows 10', '2025-08-18 20:36:34', '2025-08-18 20:36:34'),
(44, 4, '127.0.0.1', '', '', '', '', '', 'Chrome', 'Windows 10', '2025-08-22 14:39:12', '2025-08-22 14:39:12'),
(45, 4, '127.0.0.1', '', '', '', '', '', 'Chrome', 'Windows 10', '2025-08-23 21:09:10', '2025-08-23 21:09:10'),
(46, 4, '127.0.0.1', '', '', '', '', '', 'Chrome', 'Windows 10', '2025-08-24 15:42:53', '2025-08-24 15:42:53'),
(47, 4, '127.0.0.1', '', '', '', '', '', 'Chrome', 'Windows 10', '2025-08-24 23:25:52', '2025-08-24 23:25:52'),
(48, 4, '127.0.0.1', '', '', '', '', '', 'Chrome', 'Windows 10', '2025-08-24 23:32:29', '2025-08-24 23:32:29'),
(49, 4, '127.0.0.1', '', '', '', '', '', 'Chrome', 'Windows 10', '2025-08-24 23:41:09', '2025-08-24 23:41:09'),
(50, 4, '127.0.0.1', '', '', '', '', '', 'Chrome', 'Windows 10', '2025-08-24 23:49:12', '2025-08-24 23:49:12'),
(51, 4, '127.0.0.1', '', '', '', '', '', 'Chrome', 'Windows 10', '2025-08-24 23:50:56', '2025-08-24 23:50:56'),
(52, 4, '127.0.0.1', '', '', '', '', '', 'Chrome', 'Windows 10', '2025-08-25 20:10:00', '2025-08-25 20:10:00'),
(53, 4, '127.0.0.1', '', '', '', '', '', 'Chrome', 'Windows 10', '2025-08-25 20:12:31', '2025-08-25 20:12:31'),
(54, 4, '127.0.0.1', '', '', '', '', '', 'Chrome', 'Windows 10', '2025-08-25 20:18:34', '2025-08-25 20:18:34'),
(55, 4, '127.0.0.1', '', '', '', '', '', 'Chrome', 'Windows 10', '2025-08-25 20:25:00', '2025-08-25 20:25:00'),
(56, 4, '127.0.0.1', '', '', '', '', '', 'Chrome', 'Windows 10', '2025-08-26 01:27:43', '2025-08-26 01:27:43'),
(57, 4, '127.0.0.1', '', '', '', '', '', 'Chrome', 'Windows 10', '2025-08-26 04:27:47', '2025-08-26 04:27:47'),
(58, 4, '127.0.0.1', '', '', '', '', '', 'Chrome', 'Windows 10', '2025-08-26 13:45:42', '2025-08-26 13:45:42'),
(59, 4, '127.0.0.1', '', '', '', '', '', 'Chrome', 'Windows 10', '2025-08-26 23:13:37', '2025-08-26 23:13:37'),
(60, 4, '127.0.0.1', '', '', '', '', '', 'Chrome', 'Windows 10', '2025-08-26 23:14:36', '2025-08-26 23:14:36'),
(61, 7, '127.0.0.1', '', '', '', '', '', 'Chrome', 'Windows 10', '2025-08-27 16:40:09', '2025-08-27 16:40:09'),
(62, 7, '127.0.0.1', '', '', '', '', '', 'Chrome', 'Windows 10', '2025-08-27 16:45:13', '2025-08-27 16:45:13'),
(63, 8, '127.0.0.1', '', '', '', '', '', 'Chrome', 'Windows 10', '2025-08-27 16:54:02', '2025-08-27 16:54:02'),
(64, 9, '127.0.0.1', '', '', '', '', '', 'Chrome', 'Windows 10', '2025-08-27 17:17:26', '2025-08-27 17:17:26'),
(65, 4, '127.0.0.1', '', '', '', '', '', 'Chrome', 'Windows 10', '2025-08-27 17:21:31', '2025-08-27 17:21:31'),
(66, 4, '127.0.0.1', '', '', '', '', '', 'Chrome', 'Windows 10', '2025-08-27 17:22:16', '2025-08-27 17:22:16'),
(67, 4, '127.0.0.1', '', '', '', '', '', 'Chrome', 'Windows 10', '2025-08-27 17:26:34', '2025-08-27 17:26:34'),
(68, 4, '127.0.0.1', '', '', '', '', '', 'Chrome', 'Windows 10', '2025-08-27 17:27:07', '2025-08-27 17:27:07'),
(69, 4, '127.0.0.1', '', '', '', '', '', 'Chrome', 'Windows 10', '2025-08-27 17:27:18', '2025-08-27 17:27:18'),
(70, 6, '127.0.0.1', '', '', '', '', '', 'Chrome', 'Windows 10', '2025-08-27 17:27:56', '2025-08-27 17:27:56'),
(71, 4, '127.0.0.1', '', '', '', '', '', 'Chrome', 'Windows 10', '2025-08-27 17:32:57', '2025-08-27 17:32:57'),
(72, 4, '127.0.0.1', '', '', '', '', '', 'Chrome', 'Windows 10', '2025-08-27 18:49:23', '2025-08-27 18:49:23'),
(73, 4, '127.0.0.1', '', '', '', '', '', 'Chrome', 'Windows 10', '2025-08-27 18:50:46', '2025-08-27 18:50:46'),
(74, 4, '127.0.0.1', '', '', '', '', '', 'Chrome', 'Windows 10', '2025-08-27 18:52:00', '2025-08-27 18:52:00'),
(75, 8, '127.0.0.1', '', '', '', '', '', 'Chrome', 'Windows 10', '2025-08-27 19:57:25', '2025-08-27 19:57:25'),
(76, 8, '127.0.0.1', '', '', '', '', '', 'Chrome', 'Windows 10', '2025-08-27 20:01:37', '2025-08-27 20:01:37'),
(77, 8, '127.0.0.1', '', '', '', '', '', 'Chrome', 'Windows 10', '2025-08-27 20:05:04', '2025-08-27 20:05:04'),
(78, 8, '127.0.0.1', '', '', '', '', '', 'Chrome', 'Windows 10', '2025-08-27 20:08:26', '2025-08-27 20:08:26'),
(79, 9, '127.0.0.1', '', '', '', '', '', 'Chrome', 'Windows 10', '2025-08-27 20:09:36', '2025-08-27 20:09:36'),
(80, 10, '127.0.0.1', '', '', '', '', '', 'Chrome', 'Windows 10', '2025-08-27 20:13:17', '2025-08-27 20:13:17'),
(81, 11, '127.0.0.1', '', '', '', '', '', 'Chrome', 'Windows 10', '2025-08-27 20:14:48', '2025-08-27 20:14:48'),
(82, 11, '127.0.0.1', '', '', '', '', '', 'Chrome', 'Windows 10', '2025-08-27 20:17:03', '2025-08-27 20:17:03'),
(83, 12, '127.0.0.1', '', '', '', '', '', 'Chrome', 'Windows 10', '2025-08-27 20:21:24', '2025-08-27 20:21:24'),
(84, 13, '127.0.0.1', '', '', '', '', '', 'Chrome', 'Windows 10', '2025-08-27 21:01:16', '2025-08-27 21:01:16'),
(85, 4, '127.0.0.1', '', '', '', '', '', 'Chrome', 'Windows 10', '2025-08-27 22:36:00', '2025-08-27 22:36:00'),
(86, 4, '127.0.0.1', '', '', '', '', '', 'Chrome', 'Windows 10', '2025-08-27 22:57:56', '2025-08-27 22:57:56'),
(87, 4, '127.0.0.1', '', '', '', '', '', 'Chrome', 'Windows 10', '2025-08-28 02:32:25', '2025-08-28 02:32:25'),
(88, 4, '127.0.0.1', '', '', '', '', '', 'Chrome', 'Windows 10', '2025-08-31 11:25:42', '2025-08-31 11:25:42');

-- --------------------------------------------------------

--
-- Table structure for table `vehicles`
--

CREATE TABLE `vehicles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nick_name` varchar(40) DEFAULT NULL,
  `fleet_type_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `register_no` varchar(255) DEFAULT NULL,
  `engine_no` varchar(255) DEFAULT NULL,
  `chasis_no` varchar(255) DEFAULT NULL,
  `model_no` varchar(255) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vehicles`
--

INSERT INTO `vehicles` (`id`, `nick_name`, `fleet_type_id`, `register_no`, `engine_no`, `chasis_no`, `model_no`, `status`, `created_at`, `updated_at`) VALUES
(1, 'MEGA  BUS 12', 2, '5–13245–نقل عام', '12', 'JT8BK12Y3W1034567', '2020', 1, '2025-06-24 22:05:36', '2025-06-26 13:36:05'),
(2, 'Tourismo', 2, '5–12245–نقل عام', '18', 'JT8BK12Y3W1034511', '2020', 1, '2025-06-26 19:18:04', '2025-06-26 19:18:04'),
(3, 'test', 3, '1111111', '11111', '11111', '1111111', 1, '2025-08-27 23:04:30', '2025-08-27 23:04:30');

-- --------------------------------------------------------

--
-- Table structure for table `vehicle_routes`
--

CREATE TABLE `vehicle_routes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(60) DEFAULT NULL,
  `start_from` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `end_to` int(10) UNSIGNED DEFAULT 0,
  `stoppages` text DEFAULT NULL,
  `distance` varchar(40) DEFAULT NULL,
  `time` varchar(40) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vehicle_routes`
--

INSERT INTO `vehicle_routes` (`id`, `name`, `start_from`, `end_to`, `stoppages`, `distance`, `time`, `status`, `created_at`, `updated_at`) VALUES
(1, 'طرابلس - درنة', 2, 1, '[\"2\",\"1\"]', '1350 KM', '17 ساعة', 1, '2025-06-19 16:04:18', '2025-06-26 14:43:27'),
(2, 'رحلة الاسكندرية', 11, 2, '[\"11\",\"2\"]', '2400 KM', '12:30', 0, '2025-06-24 22:08:04', '2025-06-26 17:40:34'),
(3, 'طرابلس - تونس', 2, 4, '[\"2\",\"4\"]', '410 KM', '6 ساعات', 1, '2025-06-26 14:33:40', '2025-06-26 14:33:40'),
(4, 'تونس - طرابلس', 4, 2, '[\"4\",\"2\"]', '410 KM', '6 ساعات', 1, '2025-06-26 14:34:25', '2025-06-26 14:34:25'),
(5, 'طرابلس - بنغازي', 2, 3, '[\"2\",\"3\"]', '1025 KM', '13 ساعة', 1, '2025-06-26 14:35:24', '2025-06-26 14:35:24'),
(6, 'بنغازي - طرابلس', 3, 2, '[\"3\",\"2\"]', '1025 KM', '13 ساعة', 1, '2025-06-26 14:35:51', '2025-06-26 14:35:51'),
(7, 'طرابلس - غدامس', 2, 6, '[\"2\",\"6\"]', '620 KM', '7 ساعات', 1, '2025-06-26 14:36:55', '2025-06-26 14:36:55'),
(8, 'غدامس - طرابلس', 6, 2, '[\"6\",\"2\"]', '620 KM', '7 ساعات', 1, '2025-06-26 14:37:28', '2025-06-26 14:37:28'),
(9, 'طرابلس - الاسكندرية', 2, 11, '[\"2\",\"11\"]', '1900 KM', '22 ساعة', 1, '2025-06-26 14:38:25', '2025-06-26 14:38:25'),
(10, 'الاسكندرية -  طرابلس', 11, 2, '[\"11\",\"2\"]', '1900 KM', '22 ساعة', 1, '2025-06-26 14:39:05', '2025-06-26 14:39:05'),
(11, 'طرابلس - القاهرة', 2, 8, '[\"2\",\"8\"]', '2100 KM', '24 ساعة', 1, '2025-06-26 14:39:55', '2025-06-26 14:39:55'),
(12, 'القاهرة - طرابلس', 8, 2, '[\"8\",\"2\"]', '2100 KM', '24 ساعة', 1, '2025-06-26 14:40:18', '2025-06-26 14:40:18'),
(13, 'طرابلس - سوسة', 2, 9, '[\"2\",\"9\"]', '630 KM', '7 ساعات', 1, '2025-06-26 14:41:25', '2025-06-26 14:41:25'),
(14, 'سوسة -  طرابلس', 9, 2, '[\"9\",\"2\"]', '630 KM', '7 ساعات', 1, '2025-06-26 14:41:47', '2025-06-26 14:41:47'),
(15, 'test22', 3, 1, '[\"3\",\"1\"]', '1350 KM', '17 ساعة', 1, '2025-06-26 14:44:16', '2025-06-27 14:20:13'),
(16, 'test220000', 3, 1, '[\"3\",\"1\"]', '630 KM', '22 hrs', 1, '2025-06-27 14:28:23', '2025-06-27 14:28:23'),
(17, 'طرابلس', 8, 1, '[\"8\",\"1\"]', '630 KM', '7 ساعات', 1, '2025-08-27 23:00:23', '2025-08-27 23:00:23'),
(18, 'اختبار', 4, 5, '[\"4\",\"5\"]', 'الاللال', '17 ساعة الوقت المتوقع', 0, '2025-08-27 23:05:39', '2025-08-27 23:06:08'),
(19, 'اختبار الصندوق الاسود', 1, 4, '[\"1\",\"4\"]', '1025 KM', '6 ساعات', 1, '2025-08-27 23:08:50', '2025-08-27 23:08:50');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`,`username`),
  ADD KEY `fk_admins_role` (`role_id`);

--
-- Indexes for table `admin_notifications`
--
ALTER TABLE `admin_notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_password_resets`
--
ALTER TABLE `admin_password_resets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `assigned_vehicles`
--
ALTER TABLE `assigned_vehicles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `booked_tickets`
--
ALTER TABLE `booked_tickets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `counters`
--
ALTER TABLE `counters`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deposits`
--
ALTER TABLE `deposits`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `device_tokens`
--
ALTER TABLE `device_tokens`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `drivers`
--
ALTER TABLE `drivers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `extensions`
--
ALTER TABLE `extensions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fleet_types`
--
ALTER TABLE `fleet_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `forms`
--
ALTER TABLE `forms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `frontends`
--
ALTER TABLE `frontends`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gateways`
--
ALTER TABLE `gateways`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`);

--
-- Indexes for table `gateway_currencies`
--
ALTER TABLE `gateway_currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `general_settings`
--
ALTER TABLE `general_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notification_logs`
--
ALTER TABLE `notification_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notification_templates`
--
ALTER TABLE `notification_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Indexes for table `schedules`
--
ALTER TABLE `schedules`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `seat_layouts`
--
ALTER TABLE `seat_layouts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscribers`
--
ALTER TABLE `subscribers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `support_attachments`
--
ALTER TABLE `support_attachments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `support_messages`
--
ALTER TABLE `support_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `support_tickets`
--
ALTER TABLE `support_tickets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ticket_prices`
--
ALTER TABLE `ticket_prices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ticket_price_by_stoppages`
--
ALTER TABLE `ticket_price_by_stoppages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `trips`
--
ALTER TABLE `trips`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `update_logs`
--
ALTER TABLE `update_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`,`email`);

--
-- Indexes for table `user_logins`
--
ALTER TABLE `user_logins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vehicles`
--
ALTER TABLE `vehicles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vehicle_routes`
--
ALTER TABLE `vehicle_routes`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `admin_notifications`
--
ALTER TABLE `admin_notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `admin_password_resets`
--
ALTER TABLE `admin_password_resets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `assigned_vehicles`
--
ALTER TABLE `assigned_vehicles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `booked_tickets`
--
ALTER TABLE `booked_tickets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `counters`
--
ALTER TABLE `counters`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `deposits`
--
ALTER TABLE `deposits`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `device_tokens`
--
ALTER TABLE `device_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `drivers`
--
ALTER TABLE `drivers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `extensions`
--
ALTER TABLE `extensions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `fleet_types`
--
ALTER TABLE `fleet_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `forms`
--
ALTER TABLE `forms`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `frontends`
--
ALTER TABLE `frontends`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=119;

--
-- AUTO_INCREMENT for table `gateways`
--
ALTER TABLE `gateways`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `gateway_currencies`
--
ALTER TABLE `gateway_currencies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `general_settings`
--
ALTER TABLE `general_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `notification_logs`
--
ALTER TABLE `notification_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `notification_templates`
--
ALTER TABLE `notification_templates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `schedules`
--
ALTER TABLE `schedules`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `seat_layouts`
--
ALTER TABLE `seat_layouts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `subscribers`
--
ALTER TABLE `subscribers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `support_attachments`
--
ALTER TABLE `support_attachments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `support_messages`
--
ALTER TABLE `support_messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `support_tickets`
--
ALTER TABLE `support_tickets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `ticket_prices`
--
ALTER TABLE `ticket_prices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `ticket_price_by_stoppages`
--
ALTER TABLE `ticket_price_by_stoppages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `trips`
--
ALTER TABLE `trips`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `update_logs`
--
ALTER TABLE `update_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `user_logins`
--
ALTER TABLE `user_logins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=89;

--
-- AUTO_INCREMENT for table `vehicles`
--
ALTER TABLE `vehicles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `vehicle_routes`
--
ALTER TABLE `vehicle_routes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admins`
--
ALTER TABLE `admins`
  ADD CONSTRAINT `fk_admins_role` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
