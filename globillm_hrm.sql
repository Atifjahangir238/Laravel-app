-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 24, 2024 at 08:45 AM
-- Server version: 10.3.39-MariaDB
-- PHP Version: 8.1.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `globillm_hrm`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `id` int(11) NOT NULL,
  `account_num` varchar(192) NOT NULL,
  `account_name` varchar(192) NOT NULL,
  `initial_balance` decimal(10,2) NOT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp(6) NULL DEFAULT NULL,
  `updated_at` timestamp(6) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `announcements`
--

CREATE TABLE `announcements` (
  `id` int(11) NOT NULL,
  `title` varchar(192) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `company_id` int(11) NOT NULL,
  `department_id` int(11) DEFAULT NULL,
  `summary` text NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp(6) NULL DEFAULT NULL,
  `updated_at` timestamp(6) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `announcements`
--

INSERT INTO `announcements` (`id`, `title`, `start_date`, `end_date`, `company_id`, `department_id`, `summary`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Birthday Celebration', '2023-10-18', '2023-10-19', 1, 2, 'Junaid Birthday was on Oct, 15th. Please wish him Happy Birthday', '', '2023-10-18 17:27:37.000000', '2023-10-18 17:28:57.000000', '2023-10-18 17:28:57');

-- --------------------------------------------------------

--
-- Table structure for table `arrangement_types`
--

CREATE TABLE `arrangement_types` (
  `id` int(11) NOT NULL,
  `title` varchar(192) NOT NULL,
  `created_at` timestamp(6) NULL DEFAULT NULL,
  `updated_at` timestamp(6) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `attendances`
--

CREATE TABLE `attendances` (
  `id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `clock_in` varchar(191) NOT NULL,
  `clock_in_ip` varchar(45) NOT NULL,
  `clock_out` varchar(191) NOT NULL,
  `clock_out_ip` varchar(191) NOT NULL,
  `clock_in_out` tinyint(1) NOT NULL,
  `depart_early` varchar(191) NOT NULL DEFAULT '00:00',
  `late_time` varchar(191) NOT NULL DEFAULT '00:00',
  `overtime` varchar(191) NOT NULL DEFAULT '00:00',
  `total_work` varchar(191) NOT NULL DEFAULT '00:00',
  `total_rest` varchar(191) NOT NULL DEFAULT '00:00',
  `status` varchar(191) NOT NULL DEFAULT 'present',
  `created_at` timestamp(6) NULL DEFAULT NULL,
  `updated_at` timestamp(6) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attendances`
--

INSERT INTO `attendances` (`id`, `company_id`, `employee_id`, `date`, `clock_in`, `clock_in_ip`, `clock_out`, `clock_out_ip`, `clock_in_out`, `depart_early`, `late_time`, `overtime`, `total_work`, `total_rest`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 2, '2023-10-18', '20:52', '127.0.0.1', '20:58', '', 0, '00:00', '02:52', '00:06', '00:06', '00:00', 'present', '2023-10-18 15:52:53.000000', '2023-10-18 15:58:54.000000', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `awards`
--

CREATE TABLE `awards` (
  `id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `department_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `award_type_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `gift` varchar(192) NOT NULL,
  `cash` decimal(65,2) NOT NULL,
  `photo` varchar(192) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp(6) NULL DEFAULT NULL,
  `updated_at` timestamp(6) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `award_types`
--

CREATE TABLE `award_types` (
  `id` int(11) NOT NULL,
  `title` varchar(192) NOT NULL,
  `created_at` timestamp(6) NULL DEFAULT NULL,
  `updated_at` timestamp(6) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `id` int(11) NOT NULL,
  `firstname` varchar(191) NOT NULL,
  `lastname` varchar(192) NOT NULL,
  `username` varchar(192) NOT NULL,
  `role_users_id` bigint(20) UNSIGNED NOT NULL,
  `code` int(11) NOT NULL,
  `email` varchar(192) NOT NULL,
  `country` varchar(191) DEFAULT NULL,
  `city` varchar(191) DEFAULT NULL,
  `phone` varchar(191) DEFAULT NULL,
  `address` varchar(191) DEFAULT NULL,
  `created_at` timestamp(6) NULL DEFAULT NULL,
  `updated_at` timestamp(6) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `companies`
--

CREATE TABLE `companies` (
  `id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `email` varchar(191) DEFAULT NULL,
  `phone` varchar(191) DEFAULT NULL,
  `country` varchar(191) DEFAULT NULL,
  `created_at` timestamp(6) NULL DEFAULT NULL,
  `updated_at` timestamp(6) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `companies`
--

INSERT INTO `companies` (`id`, `name`, `email`, `phone`, `country`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Globill Medical Resources', 'info@globillmedicalresources.com', '+1-347-427-5655', 'Pakistan', '2023-10-18 15:46:17.000000', '2023-10-24 23:18:44.000000', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `complaints`
--

CREATE TABLE `complaints` (
  `id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `employee_from` int(11) NOT NULL,
  `employee_against` int(11) NOT NULL,
  `title` varchar(192) NOT NULL,
  `reason` text NOT NULL,
  `date` date NOT NULL,
  `time` time DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp(6) NULL DEFAULT NULL,
  `updated_at` timestamp(6) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` int(11) NOT NULL,
  `code` varchar(192) NOT NULL,
  `name` varchar(192) NOT NULL,
  `symbol` varchar(192) NOT NULL,
  `created_at` timestamp(6) NULL DEFAULT NULL,
  `updated_at` timestamp(6) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `code`, `name`, `symbol`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'USD', 'US Dollar', '$', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `id` int(11) NOT NULL,
  `department` varchar(191) NOT NULL,
  `company_id` int(11) NOT NULL,
  `department_head` int(11) DEFAULT NULL,
  `created_at` timestamp(6) NULL DEFAULT NULL,
  `updated_at` timestamp(6) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`id`, `department`, `company_id`, `department_head`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Software', 1, NULL, '2023-10-18 15:46:47.000000', '2023-10-18 15:46:47.000000', NULL),
(2, 'Operations', 1, NULL, '2023-10-18 17:14:03.000000', '2023-10-18 17:14:03.000000', NULL),
(3, 'Virtual Assistant', 1, NULL, '2023-10-18 17:14:25.000000', '2023-10-18 17:14:25.000000', NULL),
(4, 'Medical Coding Department', 1, NULL, '2023-10-18 17:14:42.000000', '2023-10-18 17:14:42.000000', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `deposits`
--

CREATE TABLE `deposits` (
  `id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `deposit_category_id` int(11) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `payment_method_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `deposit_ref` varchar(192) NOT NULL,
  `description` text DEFAULT NULL,
  `attachment` varchar(192) DEFAULT NULL,
  `created_at` timestamp(6) NULL DEFAULT NULL,
  `updated_at` timestamp(6) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `deposit_categories`
--

CREATE TABLE `deposit_categories` (
  `id` int(11) NOT NULL,
  `title` varchar(192) NOT NULL,
  `created_at` timestamp(6) NULL DEFAULT NULL,
  `updated_at` timestamp(6) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `designations`
--

CREATE TABLE `designations` (
  `id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `department_id` int(11) NOT NULL,
  `designation` varchar(192) NOT NULL,
  `created_at` timestamp(6) NULL DEFAULT NULL,
  `updated_at` timestamp(6) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `designations`
--

INSERT INTO `designations` (`id`, `company_id`, `department_id`, `designation`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 1, 'FullStack Developer', '2023-10-18 15:47:20.000000', '2023-10-18 15:47:20.000000', NULL),
(2, 1, 2, 'Trainee Billing Executive', '2023-10-18 17:15:24.000000', '2023-10-18 17:15:24.000000', NULL),
(3, 1, 3, 'Team Lead Virtual Assistant Department.', '2023-10-18 17:15:56.000000', '2023-10-18 17:15:56.000000', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id` int(11) NOT NULL,
  `role_users_id` bigint(20) UNSIGNED NOT NULL,
  `firstname` varchar(192) NOT NULL,
  `lastname` varchar(192) NOT NULL,
  `username` varchar(191) NOT NULL,
  `email` varchar(192) NOT NULL,
  `phone` varchar(192) NOT NULL,
  `country` varchar(192) NOT NULL,
  `city` varchar(192) DEFAULT NULL,
  `province` varchar(192) DEFAULT NULL,
  `zipcode` varchar(192) DEFAULT NULL,
  `address` varchar(192) DEFAULT NULL,
  `gender` varchar(192) NOT NULL,
  `resume` varchar(192) DEFAULT NULL,
  `avatar` varchar(192) DEFAULT 'no_avatar.png',
  `document` varchar(192) DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `joining_date` date DEFAULT NULL,
  `company_id` int(11) NOT NULL,
  `department_id` int(11) NOT NULL,
  `designation_id` int(11) NOT NULL,
  `office_shift_id` int(11) NOT NULL,
  `remaining_leave` tinyint(1) DEFAULT 0,
  `total_leave` tinyint(1) DEFAULT 0,
  `hourly_rate` decimal(10,2) DEFAULT 0.00,
  `basic_salary` decimal(10,2) DEFAULT 0.00,
  `employment_type` varchar(192) DEFAULT 'full_time',
  `leaving_date` date DEFAULT NULL,
  `marital_status` varchar(192) DEFAULT 'single',
  `facebook` varchar(192) DEFAULT NULL,
  `skype` varchar(192) DEFAULT NULL,
  `whatsapp` varchar(192) DEFAULT NULL,
  `twitter` varchar(192) DEFAULT NULL,
  `linkedin` varchar(192) DEFAULT NULL,
  `created_at` timestamp(6) NULL DEFAULT NULL,
  `updated_at` timestamp(6) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id`, `role_users_id`, `firstname`, `lastname`, `username`, `email`, `phone`, `country`, `city`, `province`, `zipcode`, `address`, `gender`, `resume`, `avatar`, `document`, `birth_date`, `joining_date`, `company_id`, `department_id`, `designation_id`, `office_shift_id`, `remaining_leave`, `total_leave`, `hourly_rate`, `basic_salary`, `employment_type`, `leaving_date`, `marital_status`, `facebook`, `skype`, `whatsapp`, `twitter`, `linkedin`, `created_at`, `updated_at`, `deleted_at`) VALUES
(2, 2, 'Muhammad', 'Mesum', 'Muhammad Mesum', 'mesum@gmail.com', '03235005048', 'Pakistan', NULL, NULL, NULL, NULL, 'male', NULL, 'no_avatar.png', NULL, '1999-12-18', '2023-09-01', 1, 1, 1, 1, 0, 0, 0.00, 0.00, 'full_time', NULL, 'single', NULL, NULL, NULL, NULL, NULL, '2023-10-18 15:49:57.000000', '2023-10-18 15:49:57.000000', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `employee_accounts`
--

CREATE TABLE `employee_accounts` (
  `id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `bank_name` varchar(192) NOT NULL,
  `bank_branch` varchar(192) NOT NULL,
  `account_no` varchar(192) NOT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp(6) NULL DEFAULT NULL,
  `updated_at` timestamp(6) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employee_documents`
--

CREATE TABLE `employee_documents` (
  `id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `title` varchar(192) NOT NULL,
  `description` text DEFAULT NULL,
  `attachment` varchar(192) NOT NULL,
  `created_at` timestamp(6) NULL DEFAULT NULL,
  `updated_at` timestamp(6) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employee_experiences`
--

CREATE TABLE `employee_experiences` (
  `id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `title` varchar(192) NOT NULL,
  `company_name` varchar(192) NOT NULL,
  `location` varchar(192) DEFAULT NULL,
  `employment_type` varchar(192) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp(6) NULL DEFAULT NULL,
  `updated_at` timestamp(6) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employee_project`
--

CREATE TABLE `employee_project` (
  `employee_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employee_task`
--

CREATE TABLE `employee_task` (
  `employee_id` int(11) NOT NULL,
  `task_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employee_training`
--

CREATE TABLE `employee_training` (
  `employee_id` int(11) NOT NULL,
  `training_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` int(11) NOT NULL,
  `title` varchar(192) NOT NULL,
  `company_id` int(11) NOT NULL,
  `department_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `note` text DEFAULT NULL,
  `status` varchar(191) NOT NULL,
  `created_at` timestamp(6) NULL DEFAULT NULL,
  `updated_at` timestamp(6) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

CREATE TABLE `expenses` (
  `id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `expense_category_id` int(11) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `payment_method_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `expense_ref` varchar(192) NOT NULL,
  `description` text DEFAULT NULL,
  `attachment` varchar(192) DEFAULT NULL,
  `created_at` timestamp(6) NULL DEFAULT NULL,
  `updated_at` timestamp(6) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `expense_categories`
--

CREATE TABLE `expense_categories` (
  `id` int(11) NOT NULL,
  `title` varchar(192) NOT NULL,
  `created_at` timestamp(6) NULL DEFAULT NULL,
  `updated_at` timestamp(6) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `holidays`
--

CREATE TABLE `holidays` (
  `id` int(11) NOT NULL,
  `title` varchar(192) NOT NULL,
  `company_id` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp(6) NULL DEFAULT NULL,
  `updated_at` timestamp(6) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `leaves`
--

CREATE TABLE `leaves` (
  `id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `department_id` int(11) NOT NULL,
  `leave_type_id` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `days` varchar(192) NOT NULL,
  `reason` text DEFAULT NULL,
  `attachment` varchar(192) DEFAULT NULL,
  `half_day` tinyint(1) DEFAULT NULL,
  `status` varchar(192) NOT NULL,
  `created_at` timestamp(6) NULL DEFAULT NULL,
  `updated_at` timestamp(6) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `leave_types`
--

CREATE TABLE `leave_types` (
  `id` int(11) NOT NULL,
  `title` varchar(192) NOT NULL,
  `created_at` timestamp(6) NULL DEFAULT NULL,
  `updated_at` timestamp(6) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2022_02_18_161351_create_accounts_table', 1),
(2, '2022_02_18_161351_create_announcements_table', 1),
(3, '2022_02_18_161351_create_arrangement_types_table', 1),
(4, '2022_02_18_161351_create_attendances_table', 1),
(5, '2022_02_18_161351_create_award_types_table', 1),
(6, '2022_02_18_161351_create_awards_table', 1),
(7, '2022_02_18_161351_create_clients_table', 1),
(8, '2022_02_18_161351_create_companies_table', 1),
(9, '2022_02_18_161351_create_complaints_table', 1),
(10, '2022_02_18_161351_create_currencies_table', 1),
(11, '2022_02_18_161351_create_departments_table', 1),
(12, '2022_02_18_161351_create_deposit_categories_table', 1),
(13, '2022_02_18_161351_create_deposits_table', 1),
(14, '2022_02_18_161351_create_designations_table', 1),
(15, '2022_02_18_161351_create_employee_accounts_table', 1),
(16, '2022_02_18_161351_create_employee_documents_table', 1),
(17, '2022_02_18_161351_create_employee_experiences_table', 1),
(18, '2022_02_18_161351_create_employee_project_table', 1),
(19, '2022_02_18_161351_create_employee_task_table', 1),
(20, '2022_02_18_161351_create_employee_training_table', 1),
(21, '2022_02_18_161351_create_employees_table', 1),
(22, '2022_02_18_161351_create_events_table', 1),
(23, '2022_02_18_161351_create_expense_categories_table', 1),
(24, '2022_02_18_161351_create_expenses_table', 1),
(25, '2022_02_18_161351_create_holidays_table', 1),
(26, '2022_02_18_161351_create_leave_types_table', 1),
(27, '2022_02_18_161351_create_leaves_table', 1),
(28, '2022_02_18_161351_create_model_has_permissions_table', 1),
(29, '2022_02_18_161351_create_model_has_roles_table', 1),
(30, '2022_02_18_161351_create_office_shifts_table', 1),
(31, '2022_02_18_161351_create_password_resets_table', 1),
(32, '2022_02_18_161351_create_payment_methods_table', 1),
(33, '2022_02_18_161351_create_permissions_table', 1),
(34, '2022_02_18_161351_create_policies_table', 1),
(35, '2022_02_18_161351_create_project_discussions_table', 1),
(36, '2022_02_18_161351_create_project_documents_table', 1),
(37, '2022_02_18_161351_create_project_issues_table', 1),
(38, '2022_02_18_161351_create_projects_table', 1),
(39, '2022_02_18_161351_create_role_has_permissions_table', 1),
(40, '2022_02_18_161351_create_roles_table', 1),
(41, '2022_02_18_161351_create_settings_table', 1),
(42, '2022_02_18_161351_create_task_discussions_table', 1),
(43, '2022_02_18_161351_create_task_documents_table', 1),
(44, '2022_02_18_161351_create_tasks_table', 1),
(45, '2022_02_18_161351_create_trainers_table', 1),
(46, '2022_02_18_161351_create_training_skills_table', 1),
(47, '2022_02_18_161351_create_trainings_table', 1),
(48, '2022_02_18_161351_create_travel_table', 1),
(49, '2022_02_18_161351_create_users_table', 1),
(50, '2022_02_18_161355_add_foreign_keys_to_announcements_table', 1),
(51, '2022_02_18_161355_add_foreign_keys_to_attendances_table', 1),
(52, '2022_02_18_161355_add_foreign_keys_to_awards_table', 1),
(53, '2022_02_18_161355_add_foreign_keys_to_clients_table', 1),
(54, '2022_02_18_161355_add_foreign_keys_to_complaints_table', 1),
(55, '2022_02_18_161355_add_foreign_keys_to_departments_table', 1),
(56, '2022_02_18_161355_add_foreign_keys_to_deposits_table', 1),
(57, '2022_02_18_161355_add_foreign_keys_to_designations_table', 1),
(58, '2022_02_18_161355_add_foreign_keys_to_employee_accounts_table', 1),
(59, '2022_02_18_161355_add_foreign_keys_to_employee_documents_table', 1),
(60, '2022_02_18_161355_add_foreign_keys_to_employee_experiences_table', 1),
(61, '2022_02_18_161355_add_foreign_keys_to_employee_project_table', 1),
(62, '2022_02_18_161355_add_foreign_keys_to_employee_task_table', 1),
(63, '2022_02_18_161355_add_foreign_keys_to_employee_training_table', 1),
(64, '2022_02_18_161355_add_foreign_keys_to_employees_table', 1),
(65, '2022_02_18_161355_add_foreign_keys_to_events_table', 1),
(66, '2022_02_18_161355_add_foreign_keys_to_expenses_table', 1),
(67, '2022_02_18_161355_add_foreign_keys_to_holidays_table', 1),
(68, '2022_02_18_161355_add_foreign_keys_to_leaves_table', 1),
(69, '2022_02_18_161355_add_foreign_keys_to_model_has_permissions_table', 1),
(70, '2022_02_18_161355_add_foreign_keys_to_model_has_roles_table', 1),
(71, '2022_02_18_161355_add_foreign_keys_to_office_shifts_table', 1),
(72, '2022_02_18_161355_add_foreign_keys_to_policies_table', 1),
(73, '2022_02_18_161355_add_foreign_keys_to_project_discussions_table', 1),
(74, '2022_02_18_161355_add_foreign_keys_to_project_documents_table', 1),
(75, '2022_02_18_161355_add_foreign_keys_to_project_issues_table', 1),
(76, '2022_02_18_161355_add_foreign_keys_to_projects_table', 1),
(77, '2022_02_18_161355_add_foreign_keys_to_role_has_permissions_table', 1),
(78, '2022_02_18_161355_add_foreign_keys_to_settings_table', 1),
(79, '2022_02_18_161355_add_foreign_keys_to_task_discussions_table', 1),
(80, '2022_02_18_161355_add_foreign_keys_to_task_documents_table', 1),
(81, '2022_02_18_161355_add_foreign_keys_to_tasks_table', 1),
(82, '2022_02_18_161355_add_foreign_keys_to_trainers_table', 1),
(83, '2022_02_18_161355_add_foreign_keys_to_trainings_table', 1),
(84, '2022_02_18_161355_add_foreign_keys_to_travel_table', 1),
(85, '2022_02_18_161355_add_foreign_keys_to_users_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(191) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(191) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1),
(2, 'App\\Models\\User', 2);

-- --------------------------------------------------------

--
-- Table structure for table `office_shifts`
--

CREATE TABLE `office_shifts` (
  `id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `monday_in` varchar(191) DEFAULT NULL,
  `monday_out` varchar(191) DEFAULT NULL,
  `tuesday_in` varchar(191) DEFAULT NULL,
  `tuesday_out` varchar(191) DEFAULT NULL,
  `wednesday_in` varchar(191) DEFAULT NULL,
  `wednesday_out` varchar(191) DEFAULT NULL,
  `thursday_in` varchar(191) DEFAULT NULL,
  `thursday_out` varchar(191) DEFAULT NULL,
  `friday_in` varchar(191) DEFAULT NULL,
  `friday_out` varchar(191) DEFAULT NULL,
  `saturday_in` varchar(191) DEFAULT NULL,
  `saturday_out` varchar(191) DEFAULT NULL,
  `sunday_in` varchar(191) DEFAULT NULL,
  `sunday_out` varchar(191) DEFAULT NULL,
  `created_at` timestamp(6) NULL DEFAULT NULL,
  `updated_at` timestamp(6) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `office_shifts`
--

INSERT INTO `office_shifts` (`id`, `company_id`, `name`, `monday_in`, `monday_out`, `tuesday_in`, `tuesday_out`, `wednesday_in`, `wednesday_out`, `thursday_in`, `thursday_out`, `friday_in`, `friday_out`, `saturday_in`, `saturday_out`, `sunday_in`, `sunday_out`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'Evening', '20:30PM', '02:20AM', NULL, NULL, '18:00PM', '03:00AM', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-10-18 15:49:04.000000', '2023-10-18 15:52:40.000000', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) NOT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_methods`
--

CREATE TABLE `payment_methods` (
  `id` int(11) NOT NULL,
  `title` varchar(192) NOT NULL,
  `created_at` timestamp(6) NULL DEFAULT NULL,
  `updated_at` timestamp(6) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(192) NOT NULL,
  `guard_name` varchar(191) NOT NULL,
  `created_at` timestamp(6) NULL DEFAULT NULL,
  `updated_at` timestamp(6) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'employee_view', 'web', NULL, NULL, NULL),
(2, 'employee_add', 'web', NULL, NULL, NULL),
(3, 'employee_edit', 'web', NULL, NULL, NULL),
(4, 'employee_delete', 'web', NULL, NULL, NULL),
(5, 'user_view', 'web', NULL, NULL, NULL),
(6, 'user_add', 'web', NULL, NULL, NULL),
(7, 'user_edit', 'web', NULL, NULL, NULL),
(8, 'user_delete', 'web', NULL, NULL, NULL),
(9, 'company_view', 'web', NULL, NULL, NULL),
(10, 'company_add', 'web', NULL, NULL, NULL),
(11, 'company_edit', 'web', NULL, NULL, NULL),
(12, 'company_delete', 'web', NULL, NULL, NULL),
(13, 'department_view', 'web', NULL, NULL, NULL),
(14, 'department_add', 'web', NULL, NULL, NULL),
(15, 'department_edit', 'web', NULL, NULL, NULL),
(16, 'department_delete', 'web', NULL, NULL, NULL),
(17, 'designation_view', 'web', NULL, NULL, NULL),
(18, 'designation_add', 'web', NULL, NULL, NULL),
(19, 'designation_edit', 'web', NULL, NULL, NULL),
(20, 'designation_delete', 'web', NULL, NULL, NULL),
(21, 'policy_view', 'web', NULL, NULL, NULL),
(22, 'policy_add', 'web', NULL, NULL, NULL),
(23, 'policy_edit', 'web', NULL, NULL, NULL),
(24, 'policy_delete', 'web', NULL, NULL, NULL),
(25, 'announcement_view', 'web', NULL, NULL, NULL),
(26, 'announcement_add', 'web', NULL, NULL, NULL),
(27, 'announcement_edit', 'web', NULL, NULL, NULL),
(28, 'announcement_delete', 'web', NULL, NULL, NULL),
(29, 'office_shift_view', 'web', NULL, NULL, NULL),
(30, 'office_shift_add', 'web', NULL, NULL, NULL),
(31, 'office_shift_edit', 'web', NULL, NULL, NULL),
(32, 'office_shift_delete', 'web', NULL, NULL, NULL),
(33, 'event_view', 'web', NULL, NULL, NULL),
(34, 'event_add', 'web', NULL, NULL, NULL),
(35, 'event_edit', 'web', NULL, NULL, NULL),
(36, 'event_delete', 'web', NULL, NULL, NULL),
(37, 'holiday_view', 'web', NULL, NULL, NULL),
(38, 'holiday_add', 'web', NULL, NULL, NULL),
(39, 'holiday_edit', 'web', NULL, NULL, NULL),
(40, 'holiday_delete', 'web', NULL, NULL, NULL),
(41, 'award_view', 'web', NULL, NULL, NULL),
(42, 'award_add', 'web', NULL, NULL, NULL),
(43, 'award_edit', 'web', NULL, NULL, NULL),
(44, 'award_delete', 'web', NULL, NULL, NULL),
(45, 'award_type', 'web', NULL, NULL, NULL),
(46, 'complaint_view', 'web', NULL, NULL, NULL),
(47, 'complaint_add', 'web', NULL, NULL, NULL),
(48, 'complaint_edit', 'web', NULL, NULL, NULL),
(49, 'complaint_delete', 'web', NULL, NULL, NULL),
(50, 'travel_view', 'web', NULL, NULL, NULL),
(51, 'travel_add', 'web', NULL, NULL, NULL),
(52, 'travel_edit', 'web', NULL, NULL, NULL),
(53, 'travel_delete', 'web', NULL, NULL, NULL),
(54, 'arrangement_type', 'web', NULL, NULL, NULL),
(55, 'attendance_view', 'web', NULL, NULL, NULL),
(56, 'attendance_add', 'web', NULL, NULL, NULL),
(57, 'attendance_edit', 'web', NULL, NULL, NULL),
(58, 'attendance_delete', 'web', NULL, NULL, NULL),
(59, 'account_view', 'web', NULL, NULL, NULL),
(60, 'account_add', 'web', NULL, NULL, NULL),
(61, 'account_edit', 'web', NULL, NULL, NULL),
(62, 'account_delete', 'web', NULL, NULL, NULL),
(63, 'deposit_view', 'web', NULL, NULL, NULL),
(64, 'deposit_add', 'web', NULL, NULL, NULL),
(65, 'deposit_edit', 'web', NULL, NULL, NULL),
(66, 'deposit_delete', 'web', NULL, NULL, NULL),
(67, 'expense_view', 'web', NULL, NULL, NULL),
(68, 'expense_add', 'web', NULL, NULL, NULL),
(69, 'expense_edit', 'web', NULL, NULL, NULL),
(70, 'expense_delete', 'web', NULL, NULL, NULL),
(71, 'client_view', 'web', NULL, NULL, NULL),
(72, 'client_add', 'web', NULL, NULL, NULL),
(73, 'client_edit', 'web', NULL, NULL, NULL),
(74, 'client_delete', 'web', NULL, NULL, NULL),
(75, 'deposit_category', 'web', NULL, NULL, NULL),
(76, 'payment_method', 'web', NULL, NULL, NULL),
(77, 'expense_category', 'web', NULL, NULL, NULL),
(78, 'project_view', 'web', NULL, NULL, NULL),
(79, 'project_add', 'web', NULL, NULL, NULL),
(80, 'project_edit', 'web', NULL, NULL, NULL),
(81, 'project_delete', 'web', NULL, NULL, NULL),
(82, 'task_view', 'web', NULL, NULL, NULL),
(83, 'task_add', 'web', NULL, NULL, NULL),
(84, 'task_edit', 'web', NULL, NULL, NULL),
(85, 'task_delete', 'web', NULL, NULL, NULL),
(86, 'leave_view', 'web', NULL, NULL, NULL),
(87, 'leave_add', 'web', NULL, NULL, NULL),
(88, 'leave_edit', 'web', NULL, NULL, NULL),
(89, 'leave_delete', 'web', NULL, NULL, NULL),
(90, 'training_view', 'web', NULL, NULL, NULL),
(91, 'training_add', 'web', NULL, NULL, NULL),
(92, 'training_edit', 'web', NULL, NULL, NULL),
(93, 'training_delete', 'web', NULL, NULL, NULL),
(94, 'trainer', 'web', NULL, NULL, NULL),
(95, 'training_skills', 'web', NULL, NULL, NULL),
(96, 'settings', 'web', NULL, NULL, NULL),
(97, 'currency', 'web', NULL, NULL, NULL),
(98, 'backup', 'web', NULL, NULL, NULL),
(99, 'group_permission', 'web', NULL, NULL, NULL),
(100, 'attendance_report', 'web', NULL, NULL, NULL),
(101, 'employee_report', 'web', NULL, NULL, NULL),
(102, 'project_report', 'web', NULL, NULL, NULL),
(103, 'task_report', 'web', NULL, NULL, NULL),
(104, 'expense_report', 'web', NULL, NULL, NULL),
(105, 'deposit_report', 'web', NULL, NULL, NULL),
(106, 'employee_details', 'web', NULL, NULL, NULL),
(107, 'leave_type', 'web', NULL, NULL, NULL),
(108, 'project_details', 'web', NULL, NULL, NULL),
(109, 'task_details', 'web', NULL, NULL, NULL),
(110, 'module_settings', 'web', NULL, NULL, NULL),
(111, 'kanban_task', 'web', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `policies`
--

CREATE TABLE `policies` (
  `id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `title` varchar(192) NOT NULL,
  `description` text NOT NULL,
  `created_at` timestamp(6) NULL DEFAULT NULL,
  `updated_at` timestamp(6) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE `projects` (
  `id` int(11) NOT NULL,
  `title` varchar(191) NOT NULL,
  `client_id` int(11) NOT NULL,
  `priority` varchar(191) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `summary` text NOT NULL,
  `description` text DEFAULT NULL,
  `company_id` int(11) NOT NULL,
  `project_progress` varchar(191) NOT NULL,
  `status` varchar(191) NOT NULL,
  `project_note` text DEFAULT NULL,
  `created_at` timestamp(6) NULL DEFAULT NULL,
  `updated_at` timestamp(6) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `project_discussions`
--

CREATE TABLE `project_discussions` (
  `id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `created_at` timestamp(6) NULL DEFAULT NULL,
  `updated_at` timestamp(6) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `project_documents`
--

CREATE TABLE `project_documents` (
  `id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `title` varchar(192) NOT NULL,
  `description` text DEFAULT NULL,
  `attachment` varchar(192) NOT NULL,
  `created_at` timestamp(6) NULL DEFAULT NULL,
  `updated_at` timestamp(6) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `project_issues`
--

CREATE TABLE `project_issues` (
  `id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `title` varchar(192) NOT NULL,
  `comment` text NOT NULL,
  `label` varchar(192) DEFAULT NULL,
  `attachment` varchar(192) DEFAULT NULL,
  `status` varchar(192) DEFAULT 'pending',
  `created_at` timestamp(6) NULL DEFAULT NULL,
  `updated_at` timestamp(6) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `description` text DEFAULT NULL,
  `guard_name` varchar(191) NOT NULL,
  `created_at` timestamp(6) NULL DEFAULT NULL,
  `updated_at` timestamp(6) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `description`, `guard_name`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Super Admin', 'Super Admin', 'web', NULL, NULL, NULL),
(2, 'Employee', 'Employee Access', 'web', NULL, NULL, NULL),
(3, 'Client', 'Client Access', 'web', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(21, 2),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(25, 2),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(33, 1),
(34, 1),
(35, 1),
(36, 1),
(37, 1),
(38, 1),
(39, 1),
(40, 1),
(41, 1),
(42, 1),
(43, 1),
(44, 1),
(45, 1),
(46, 1),
(47, 1),
(48, 1),
(49, 1),
(50, 1),
(51, 1),
(52, 1),
(53, 1),
(54, 1),
(55, 1),
(55, 2),
(56, 1),
(57, 1),
(58, 1),
(59, 1),
(60, 1),
(61, 1),
(62, 1),
(63, 1),
(64, 1),
(65, 1),
(66, 1),
(67, 1),
(68, 1),
(69, 1),
(70, 1),
(71, 1),
(72, 1),
(73, 1),
(74, 1),
(75, 1),
(76, 1),
(77, 1),
(78, 1),
(79, 1),
(80, 1),
(81, 1),
(82, 1),
(83, 1),
(84, 1),
(85, 1),
(86, 1),
(87, 1),
(88, 1),
(89, 1),
(90, 1),
(91, 1),
(92, 1),
(93, 1),
(94, 1),
(95, 1),
(96, 1),
(97, 1),
(98, 1),
(99, 1),
(100, 1),
(101, 1),
(102, 1),
(103, 1),
(104, 1),
(105, 1),
(106, 1),
(107, 1),
(108, 1),
(109, 1),
(110, 1),
(111, 1);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(11) NOT NULL,
  `currency_id` int(11) DEFAULT NULL,
  `email` varchar(191) NOT NULL,
  `CompanyName` varchar(191) NOT NULL,
  `CompanyPhone` varchar(191) NOT NULL,
  `CompanyAdress` varchar(191) NOT NULL,
  `footer` varchar(191) NOT NULL,
  `developed_by` varchar(191) NOT NULL,
  `logo` varchar(191) DEFAULT NULL,
  `default_language` varchar(192) NOT NULL DEFAULT 'en',
  `created_at` timestamp(6) NULL DEFAULT NULL,
  `updated_at` timestamp(6) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `currency_id`, `email`, `CompanyName`, `CompanyPhone`, `CompanyAdress`, `footer`, `developed_by`, `logo`, `default_language`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'admin@example.com', 'WorkTick', '6315996770', '3618 Abia Martin Drive', 'WorkTick - Ultimate HRM & Project Management', 'Ui-Lib', 'logo-default.png', 'en', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tasks`
--

CREATE TABLE `tasks` (
  `id` int(11) NOT NULL,
  `title` varchar(192) NOT NULL,
  `project_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `estimated_hour` varchar(192) DEFAULT NULL,
  `task_progress` varchar(192) DEFAULT NULL,
  `summary` varchar(191) NOT NULL,
  `description` text DEFAULT NULL,
  `status` varchar(192) NOT NULL,
  `priority` varchar(191) NOT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp(6) NULL DEFAULT NULL,
  `updated_at` timestamp(6) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `task_discussions`
--

CREATE TABLE `task_discussions` (
  `id` int(11) NOT NULL,
  `task_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `created_at` timestamp(6) NULL DEFAULT NULL,
  `updated_at` timestamp(6) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `task_documents`
--

CREATE TABLE `task_documents` (
  `id` int(11) NOT NULL,
  `task_id` int(11) NOT NULL,
  `title` varchar(192) NOT NULL,
  `description` text DEFAULT NULL,
  `attachment` varchar(192) NOT NULL,
  `created_at` timestamp(6) NULL DEFAULT NULL,
  `updated_at` timestamp(6) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `trainers`
--

CREATE TABLE `trainers` (
  `id` int(11) NOT NULL,
  `name` varchar(192) NOT NULL,
  `company_id` int(11) NOT NULL,
  `phone` varchar(192) NOT NULL,
  `email` varchar(192) NOT NULL,
  `country` varchar(191) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `created_at` timestamp(6) NULL DEFAULT NULL,
  `updated_at` timestamp(6) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `trainings`
--

CREATE TABLE `trainings` (
  `id` int(11) NOT NULL,
  `trainer_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `training_skill_id` int(11) NOT NULL,
  `training_cost` varchar(192) DEFAULT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `description` text DEFAULT NULL,
  `created_at` timestamp(6) NULL DEFAULT NULL,
  `updated_at` timestamp(6) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `training_skills`
--

CREATE TABLE `training_skills` (
  `id` int(11) NOT NULL,
  `training_skill` varchar(192) NOT NULL,
  `created_at` timestamp(6) NULL DEFAULT NULL,
  `updated_at` timestamp(6) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `travel`
--

CREATE TABLE `travel` (
  `id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `visit_purpose` varchar(192) NOT NULL,
  `visit_place` varchar(192) NOT NULL,
  `travel_mode` varchar(192) NOT NULL,
  `arrangement_type_id` int(11) NOT NULL,
  `expected_budget` decimal(65,2) NOT NULL DEFAULT 0.00,
  `actual_budget` decimal(65,2) NOT NULL DEFAULT 0.00,
  `status` varchar(191) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp(6) NULL DEFAULT NULL,
  `updated_at` timestamp(6) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(192) NOT NULL,
  `email` varchar(192) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `avatar` varchar(192) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `role_users_id` bigint(20) UNSIGNED NOT NULL,
  `password` varchar(192) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp(6) NULL DEFAULT NULL,
  `updated_at` timestamp(6) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `email_verified_at`, `avatar`, `status`, `role_users_id`, `password`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Globill Admin', 'admin@globillmedicalresources.com', NULL, 'no_avatar.png', 1, 1, '$2y$10$IFj6SwqC0Sxrsiv4YkCt.OJv1UV4mZrWuyLoRG7qt47mseP9mJ58u', NULL, NULL, NULL, NULL),
(2, 'Muhammad Mesum', 'mesum@gmail.com', NULL, 'no_avatar.png', 1, 2, '$2y$10$QP9J0YpeAqpxDElabdIFRO4ijb.tHyDj2spNwhuix72rmrISr38k2', NULL, '2023-10-18 15:49:57.000000', '2023-10-24 23:19:29.000000', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `announcements`
--
ALTER TABLE `announcements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `announcements_company_id` (`company_id`),
  ADD KEY `announcements_department_id` (`department_id`);

--
-- Indexes for table `arrangement_types`
--
ALTER TABLE `arrangement_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attendances`
--
ALTER TABLE `attendances`
  ADD PRIMARY KEY (`id`),
  ADD KEY `attendances_company_id` (`company_id`),
  ADD KEY `attendances_employee_id` (`employee_id`);

--
-- Indexes for table `awards`
--
ALTER TABLE `awards`
  ADD PRIMARY KEY (`id`),
  ADD KEY `awards_company_id` (`company_id`),
  ADD KEY `awards_department_id` (`department_id`),
  ADD KEY `awards_employee_id` (`employee_id`),
  ADD KEY `award_award_type_id` (`award_type_id`);

--
-- Indexes for table `award_types`
--
ALTER TABLE `award_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `clients_role_users_id` (`role_users_id`);

--
-- Indexes for table `companies`
--
ALTER TABLE `companies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `complaints`
--
ALTER TABLE `complaints`
  ADD PRIMARY KEY (`id`),
  ADD KEY `complaint_company_id` (`company_id`),
  ADD KEY `complaint_employee_from` (`employee_from`),
  ADD KEY `complaint_employee_against` (`employee_against`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `department_company_id` (`company_id`),
  ADD KEY `department_department_head` (`department_head`);

--
-- Indexes for table `deposits`
--
ALTER TABLE `deposits`
  ADD PRIMARY KEY (`id`),
  ADD KEY `deposit_account_id` (`account_id`),
  ADD KEY `deposit_category_id` (`deposit_category_id`),
  ADD KEY `deposit_payment_method_id` (`payment_method_id`);

--
-- Indexes for table `deposit_categories`
--
ALTER TABLE `deposit_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `designations`
--
ALTER TABLE `designations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `designation_company_id` (`company_id`),
  ADD KEY `designation_departement_id` (`department_id`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employees_role_users_id` (`role_users_id`),
  ADD KEY `employees_company_id` (`company_id`),
  ADD KEY `employees_department_id` (`department_id`),
  ADD KEY `employees_designation_id` (`designation_id`),
  ADD KEY `employees_office_shift_id` (`office_shift_id`);

--
-- Indexes for table `employee_accounts`
--
ALTER TABLE `employee_accounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_accounts_employee_id` (`employee_id`);

--
-- Indexes for table `employee_documents`
--
ALTER TABLE `employee_documents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `documents_employee_id` (`employee_id`);

--
-- Indexes for table `employee_experiences`
--
ALTER TABLE `employee_experiences`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_experience_employee_id` (`employee_id`);

--
-- Indexes for table `employee_project`
--
ALTER TABLE `employee_project`
  ADD KEY `employee_project_employee_id` (`employee_id`),
  ADD KEY `employee_project_project_id` (`project_id`);

--
-- Indexes for table `employee_task`
--
ALTER TABLE `employee_task`
  ADD KEY `employee_task_employee_id` (`employee_id`),
  ADD KEY `employee_task_task_id` (`task_id`);

--
-- Indexes for table `employee_training`
--
ALTER TABLE `employee_training`
  ADD KEY `employee_training_employee_id` (`employee_id`),
  ADD KEY `employee_training_training_id` (`training_id`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`),
  ADD KEY `event_company_id` (`company_id`),
  ADD KEY `event_department_id` (`department_id`);

--
-- Indexes for table `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `expenses_account_id` (`account_id`),
  ADD KEY `expenses_category_id` (`expense_category_id`),
  ADD KEY `expenses_payment_method_id` (`payment_method_id`);

--
-- Indexes for table `expense_categories`
--
ALTER TABLE `expense_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `holidays`
--
ALTER TABLE `holidays`
  ADD PRIMARY KEY (`id`),
  ADD KEY `holidays_company_id` (`company_id`);

--
-- Indexes for table `leaves`
--
ALTER TABLE `leaves`
  ADD PRIMARY KEY (`id`),
  ADD KEY `leave_employee_id` (`employee_id`),
  ADD KEY `leave_company_id` (`company_id`),
  ADD KEY `leave_department_id` (`department_id`),
  ADD KEY `leave_leave_type_id` (`leave_type_id`);

--
-- Indexes for table `leave_types`
--
ALTER TABLE `leave_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `office_shifts`
--
ALTER TABLE `office_shifts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `office_shift_company_id` (`company_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `payment_methods`
--
ALTER TABLE `payment_methods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `policies`
--
ALTER TABLE `policies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `policy_company_id` (`company_id`);

--
-- Indexes for table `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`id`),
  ADD KEY `projects_client_id` (`client_id`),
  ADD KEY `projects_company_id` (`company_id`);

--
-- Indexes for table `project_discussions`
--
ALTER TABLE `project_discussions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `project_discussions_project_id` (`project_id`),
  ADD KEY `project_discussions_user_id` (`user_id`);

--
-- Indexes for table `project_documents`
--
ALTER TABLE `project_documents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `project_documents_projet_id` (`project_id`);

--
-- Indexes for table `project_issues`
--
ALTER TABLE `project_issues`
  ADD PRIMARY KEY (`id`),
  ADD KEY `project_issues_project_id` (`project_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `settings_currency_id` (`currency_id`);

--
-- Indexes for table `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Tasks_project_id` (`project_id`),
  ADD KEY `Tasks_company_id` (`company_id`);

--
-- Indexes for table `task_discussions`
--
ALTER TABLE `task_discussions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `task_discussions_task_id` (`task_id`),
  ADD KEY `task_discussions_user_id` (`user_id`);

--
-- Indexes for table `task_documents`
--
ALTER TABLE `task_documents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tasks_doocuments_task_id` (`task_id`);

--
-- Indexes for table `trainers`
--
ALTER TABLE `trainers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `trainers_company_id` (`company_id`);

--
-- Indexes for table `trainings`
--
ALTER TABLE `trainings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `trainings_trainer_id` (`trainer_id`),
  ADD KEY `trainings_company_id` (`company_id`),
  ADD KEY `trainings_training_skill_id` (`training_skill_id`);

--
-- Indexes for table `training_skills`
--
ALTER TABLE `training_skills`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `travel`
--
ALTER TABLE `travel`
  ADD PRIMARY KEY (`id`),
  ADD KEY `travels_company_id` (`company_id`),
  ADD KEY `travels_employee_id` (`employee_id`),
  ADD KEY `travels_arrangement_type_id` (`arrangement_type_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `users_role_users_id` (`role_users_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `announcements`
--
ALTER TABLE `announcements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `arrangement_types`
--
ALTER TABLE `arrangement_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `attendances`
--
ALTER TABLE `attendances`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `awards`
--
ALTER TABLE `awards`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `award_types`
--
ALTER TABLE `award_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `companies`
--
ALTER TABLE `companies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `complaints`
--
ALTER TABLE `complaints`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `deposits`
--
ALTER TABLE `deposits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `deposit_categories`
--
ALTER TABLE `deposit_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `designations`
--
ALTER TABLE `designations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `employee_accounts`
--
ALTER TABLE `employee_accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employee_documents`
--
ALTER TABLE `employee_documents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employee_experiences`
--
ALTER TABLE `employee_experiences`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `expenses`
--
ALTER TABLE `expenses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `expense_categories`
--
ALTER TABLE `expense_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `holidays`
--
ALTER TABLE `holidays`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `leaves`
--
ALTER TABLE `leaves`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `leave_types`
--
ALTER TABLE `leave_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;

--
-- AUTO_INCREMENT for table `office_shifts`
--
ALTER TABLE `office_shifts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `payment_methods`
--
ALTER TABLE `payment_methods`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=112;

--
-- AUTO_INCREMENT for table `policies`
--
ALTER TABLE `policies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `projects`
--
ALTER TABLE `projects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `project_discussions`
--
ALTER TABLE `project_discussions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `project_documents`
--
ALTER TABLE `project_documents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `project_issues`
--
ALTER TABLE `project_issues`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tasks`
--
ALTER TABLE `tasks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `task_discussions`
--
ALTER TABLE `task_discussions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `task_documents`
--
ALTER TABLE `task_documents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `trainers`
--
ALTER TABLE `trainers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `trainings`
--
ALTER TABLE `trainings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `training_skills`
--
ALTER TABLE `training_skills`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `travel`
--
ALTER TABLE `travel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `announcements`
--
ALTER TABLE `announcements`
  ADD CONSTRAINT `announcements_company_id` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`),
  ADD CONSTRAINT `announcements_department_id` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`);

--
-- Constraints for table `attendances`
--
ALTER TABLE `attendances`
  ADD CONSTRAINT `attendances_company_id` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`),
  ADD CONSTRAINT `attendances_employee_id` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`);

--
-- Constraints for table `awards`
--
ALTER TABLE `awards`
  ADD CONSTRAINT `award_award_type_id` FOREIGN KEY (`award_type_id`) REFERENCES `award_types` (`id`),
  ADD CONSTRAINT `awards_company_id` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`),
  ADD CONSTRAINT `awards_department_id` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`),
  ADD CONSTRAINT `awards_employee_id` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`);

--
-- Constraints for table `clients`
--
ALTER TABLE `clients`
  ADD CONSTRAINT `clients_role_users_id` FOREIGN KEY (`role_users_id`) REFERENCES `roles` (`id`);

--
-- Constraints for table `complaints`
--
ALTER TABLE `complaints`
  ADD CONSTRAINT `complaint_company_id` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`),
  ADD CONSTRAINT `complaint_employee_against` FOREIGN KEY (`employee_against`) REFERENCES `employees` (`id`),
  ADD CONSTRAINT `complaint_employee_from` FOREIGN KEY (`employee_from`) REFERENCES `employees` (`id`);

--
-- Constraints for table `departments`
--
ALTER TABLE `departments`
  ADD CONSTRAINT `department_company_id` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`),
  ADD CONSTRAINT `department_department_head` FOREIGN KEY (`department_head`) REFERENCES `employees` (`id`);

--
-- Constraints for table `deposits`
--
ALTER TABLE `deposits`
  ADD CONSTRAINT `deposit_account_id` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`),
  ADD CONSTRAINT `deposit_category_id` FOREIGN KEY (`deposit_category_id`) REFERENCES `deposit_categories` (`id`),
  ADD CONSTRAINT `deposit_payment_method_id` FOREIGN KEY (`payment_method_id`) REFERENCES `payment_methods` (`id`);

--
-- Constraints for table `designations`
--
ALTER TABLE `designations`
  ADD CONSTRAINT `designation_company_id` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`),
  ADD CONSTRAINT `designation_departement_id` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`);

--
-- Constraints for table `employees`
--
ALTER TABLE `employees`
  ADD CONSTRAINT `employees_company_id` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`),
  ADD CONSTRAINT `employees_department_id` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`),
  ADD CONSTRAINT `employees_designation_id` FOREIGN KEY (`designation_id`) REFERENCES `designations` (`id`),
  ADD CONSTRAINT `employees_office_shift_id` FOREIGN KEY (`office_shift_id`) REFERENCES `office_shifts` (`id`),
  ADD CONSTRAINT `employees_role_users_id` FOREIGN KEY (`role_users_id`) REFERENCES `roles` (`id`);

--
-- Constraints for table `employee_accounts`
--
ALTER TABLE `employee_accounts`
  ADD CONSTRAINT `employee_accounts_employee_id` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`);

--
-- Constraints for table `employee_documents`
--
ALTER TABLE `employee_documents`
  ADD CONSTRAINT `documents_employee_id` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`);

--
-- Constraints for table `employee_experiences`
--
ALTER TABLE `employee_experiences`
  ADD CONSTRAINT `employee_experience_employee_id` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`);

--
-- Constraints for table `employee_project`
--
ALTER TABLE `employee_project`
  ADD CONSTRAINT `employee_project_employee_id` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`),
  ADD CONSTRAINT `employee_project_project_id` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`);

--
-- Constraints for table `employee_task`
--
ALTER TABLE `employee_task`
  ADD CONSTRAINT `employee_task_employee_id` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`),
  ADD CONSTRAINT `employee_task_task_id` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`);

--
-- Constraints for table `employee_training`
--
ALTER TABLE `employee_training`
  ADD CONSTRAINT `employee_training_employee_id` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`),
  ADD CONSTRAINT `employee_training_training_id` FOREIGN KEY (`training_id`) REFERENCES `trainings` (`id`);

--
-- Constraints for table `events`
--
ALTER TABLE `events`
  ADD CONSTRAINT `event_company_id` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`),
  ADD CONSTRAINT `event_department_id` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`);

--
-- Constraints for table `expenses`
--
ALTER TABLE `expenses`
  ADD CONSTRAINT `expenses_account_id` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`),
  ADD CONSTRAINT `expenses_category_id` FOREIGN KEY (`expense_category_id`) REFERENCES `expense_categories` (`id`),
  ADD CONSTRAINT `expenses_payment_method_id` FOREIGN KEY (`payment_method_id`) REFERENCES `payment_methods` (`id`);

--
-- Constraints for table `holidays`
--
ALTER TABLE `holidays`
  ADD CONSTRAINT `holidays_company_id` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`);

--
-- Constraints for table `leaves`
--
ALTER TABLE `leaves`
  ADD CONSTRAINT `leave_company_id` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`),
  ADD CONSTRAINT `leave_department_id` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`),
  ADD CONSTRAINT `leave_employee_id` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`),
  ADD CONSTRAINT `leave_leave_type_id` FOREIGN KEY (`leave_type_id`) REFERENCES `leave_types` (`id`);

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `office_shifts`
--
ALTER TABLE `office_shifts`
  ADD CONSTRAINT `office_shift_company_id` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`);

--
-- Constraints for table `policies`
--
ALTER TABLE `policies`
  ADD CONSTRAINT `policy_company_id` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`);

--
-- Constraints for table `projects`
--
ALTER TABLE `projects`
  ADD CONSTRAINT `projects_client_id` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`),
  ADD CONSTRAINT `projects_company_id` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`);

--
-- Constraints for table `project_discussions`
--
ALTER TABLE `project_discussions`
  ADD CONSTRAINT `project_discussions_project_id` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`),
  ADD CONSTRAINT `project_discussions_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `project_documents`
--
ALTER TABLE `project_documents`
  ADD CONSTRAINT `project_documents_projet_id` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`);

--
-- Constraints for table `project_issues`
--
ALTER TABLE `project_issues`
  ADD CONSTRAINT `project_issues_project_id` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`);

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `settings`
--
ALTER TABLE `settings`
  ADD CONSTRAINT `settings_currency_id` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`);

--
-- Constraints for table `tasks`
--
ALTER TABLE `tasks`
  ADD CONSTRAINT `Tasks_company_id` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`),
  ADD CONSTRAINT `Tasks_project_id` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`);

--
-- Constraints for table `task_discussions`
--
ALTER TABLE `task_discussions`
  ADD CONSTRAINT `task_discussions_task_id` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`),
  ADD CONSTRAINT `task_discussions_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `task_documents`
--
ALTER TABLE `task_documents`
  ADD CONSTRAINT `tasks_doocuments_task_id` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`);

--
-- Constraints for table `trainers`
--
ALTER TABLE `trainers`
  ADD CONSTRAINT `trainers_company_id` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`);

--
-- Constraints for table `trainings`
--
ALTER TABLE `trainings`
  ADD CONSTRAINT `trainings_company_id` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`),
  ADD CONSTRAINT `trainings_trainer_id` FOREIGN KEY (`trainer_id`) REFERENCES `trainers` (`id`),
  ADD CONSTRAINT `trainings_training_skill_id` FOREIGN KEY (`training_skill_id`) REFERENCES `training_skills` (`id`);

--
-- Constraints for table `travel`
--
ALTER TABLE `travel`
  ADD CONSTRAINT `travels_arrangement_type_id` FOREIGN KEY (`arrangement_type_id`) REFERENCES `arrangement_types` (`id`),
  ADD CONSTRAINT `travels_company_id` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`),
  ADD CONSTRAINT `travels_employee_id` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_users_id` FOREIGN KEY (`role_users_id`) REFERENCES `roles` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
