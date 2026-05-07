-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 07, 2026 at 04:48 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `staff_management_systems`
--

-- --------------------------------------------------------

--
-- Table structure for table `allowances`
--

CREATE TABLE `allowances` (
  `allowance_id` int(11) NOT NULL,
  `salary_id` int(11) NOT NULL,
  `allowance_type` enum('meals','housing','transport') NOT NULL,
  `amount` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `allowances`
--

INSERT INTO `allowances` (`allowance_id`, `salary_id`, `allowance_type`, `amount`) VALUES
(65, 1, 'transport', 100000.00),
(66, 1, 'housing', 200000.00),
(67, 2, 'transport', 150000.00),
(68, 3, 'transport', 50000.00),
(69, 4, 'meals', 100000.00),
(70, 5, 'transport', 120000.00),
(71, 6, 'housing', 60000.00),
(72, 7, 'transport', 120000.00),
(73, 8, 'meals', 70000.00);

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

CREATE TABLE `attendance` (
  `attendance_id` int(11) NOT NULL,
  `staff_id` int(11) NOT NULL,
  `workdate` date NOT NULL,
  `check_in` time DEFAULT NULL,
  `check_out` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `attendance`
--

INSERT INTO `attendance` (`attendance_id`, `staff_id`, `workdate`, `check_in`, `check_out`) VALUES
(1, 1, '2026-05-05', '08:00:00', '17:00:00'),
(2, 2, '2026-05-05', '08:00:00', '17:00:00'),
(3, 3, '2026-05-05', '08:00:00', '17:00:00'),
(4, 4, '2026-05-05', '08:00:00', '17:00:00'),
(5, 5, '2026-05-05', '08:00:00', '17:00:00'),
(6, 6, '2026-05-05', '08:00:00', '17:00:00'),
(7, 7, '2026-05-05', '08:00:00', '17:00:00'),
(8, 8, '2026-05-05', '08:00:00', '17:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `department_id` int(11) NOT NULL,
  `department_name` varchar(100) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`department_id`, `department_name`, `description`) VALUES
(1, 'Management', 'Top company leadership'),
(2, 'Administration', 'Office administration and records'),
(3, 'Finance', 'Accounting and payroll operations'),
(4, 'Sales', 'Land sales and customer handling'),
(5, 'Human Resource', 'Staff coordination and welfare');

-- --------------------------------------------------------

--
-- Table structure for table `login_account`
--

CREATE TABLE `login_account` (
  `account_id` int(11) NOT NULL,
  `staff_id` int(11) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password_hash` varchar(50) DEFAULT NULL,
  `role` varchar(100) DEFAULT NULL,
  `last_login` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `login_account`
--

INSERT INTO `login_account` (`account_id`, `staff_id`, `username`, `password_hash`, `role`, `last_login`) VALUES
(1, 1, 'aahabwe', 'hash001', 'admin', '2026-05-05'),
(2, 2, 'mbaseega', 'hash002', 'manager', '2026-05-05'),
(3, 3, 'pkebirungi', 'hash003', 'staff', '2026-05-05'),
(4, 4, 'mochum', 'hash004', 'staff', '2026-05-05'),
(5, 5, 'aatukwase', 'hash005', 'staff', '2026-05-05'),
(6, 6, 'mnakato', 'hash006', 'staff', '2026-05-05'),
(7, 7, 'dmuwonge', 'hash007', 'manager', '2026-05-05'),
(8, 8, 'natim', 'hash008', 'staff', '2026-05-05');

-- --------------------------------------------------------

--
-- Table structure for table `position`
--

CREATE TABLE `position` (
  `position_id` int(11) NOT NULL,
  `position_name` varchar(100) DEFAULT NULL,
  `salary_scale` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `position`
--

INSERT INTO `position` (`position_id`, `position_name`, `salary_scale`) VALUES
(1, 'CEO', 5000000.00),
(2, 'Director', 3500000.00),
(3, 'Secretary', 1200000.00),
(4, 'Accountant', 2200000.00),
(5, 'Sales Agent', 1500000.00),
(6, 'Head of Department', 2800000.00),
(7, 'Administrator', 1800000.00);

-- --------------------------------------------------------

--
-- Table structure for table `salary`
--

CREATE TABLE `salary` (
  `salary_id` int(11) NOT NULL,
  `staff_id` int(11) NOT NULL,
  `gross_salary` decimal(10,2) NOT NULL,
  `pay_period` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `salary`
--

INSERT INTO `salary` (`salary_id`, `staff_id`, `gross_salary`, `pay_period`) VALUES
(1, 1, 5000000.00, '2026-05'),
(2, 2, 3500000.00, '2026-05'),
(3, 3, 1200000.00, '2026-05'),
(4, 4, 2200000.00, '2026-05'),
(5, 5, 1500000.00, '2026-05'),
(6, 6, 1500000.00, '2026-05'),
(7, 7, 2800000.00, '2026-05'),
(8, 8, 1800000.00, '2026-05');

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `staff_id` int(11) NOT NULL,
  `staff_name` varchar(100) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `address` varchar(50) NOT NULL,
  `date_of_birth` date DEFAULT NULL,
  `status` varchar(50) NOT NULL,
  `hire_date` date NOT NULL,
  `phone` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`staff_id`, `staff_name`, `gender`, `email`, `address`, `date_of_birth`, `status`, `hire_date`, `phone`) VALUES
(1, 'Allan Ahabwe', 'Male', 'aahabwe@reestate.com', 'Mbarara', '2000-10-01', 'Active', '2025-01-10', '0701000001'),
(2, 'Mangadalena Baseega', 'Female', 'bmangadalena@reestate.com', 'Bushenyi', '1999-04-03', 'Active', '2025-01-15', '0701000002'),
(3, 'Patricia Kebirungi', 'Female', 'patriciakeb@reestate.com', 'Kasese', '1998-03-06', 'Active', '2025-02-01', '0701000003'),
(4, 'Marcus Ochum', 'Male', 'marcusochum@reestate.com', 'Rubirizi', '1996-07-04', 'Active', '2025-02-05', '0701000004'),
(5, 'Atukwase Avin', 'Male', 'avintukwase@reestate.com', 'Rukampala', '2001-04-08', 'Active', '2025-03-01', '0701000005'),
(6, 'Mariam Nakato', 'Female', 'mariam.nakato@reestate.com', 'Kabohe', '1997-02-07', 'Active', '2025-03-10', '0701000006'),
(7, 'David Muwonge', 'Male', 'david.muwonge@reestate.com', 'Ishaka', '2002-09-11', 'Active', '2025-01-20', '0701000007'),
(8, 'Nancy Atim', 'Female', 'nancy.atim@reestate.com', 'Kabale', '1995-05-09', 'Active', '2025-04-01', '0701000008');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `allowances`
--
ALTER TABLE `allowances`
  ADD PRIMARY KEY (`allowance_id`),
  ADD KEY `salary_id` (`salary_id`);

--
-- Indexes for table `attendance`
--
ALTER TABLE `attendance`
  ADD PRIMARY KEY (`attendance_id`),
  ADD KEY `staff_id` (`staff_id`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`department_id`);

--
-- Indexes for table `login_account`
--
ALTER TABLE `login_account`
  ADD PRIMARY KEY (`account_id`),
  ADD KEY `staff_id` (`staff_id`);

--
-- Indexes for table `position`
--
ALTER TABLE `position`
  ADD PRIMARY KEY (`position_id`);

--
-- Indexes for table `salary`
--
ALTER TABLE `salary`
  ADD PRIMARY KEY (`salary_id`),
  ADD KEY `staff_id` (`staff_id`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`staff_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `allowances`
--
ALTER TABLE `allowances`
  MODIFY `allowance_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;

--
-- AUTO_INCREMENT for table `attendance`
--
ALTER TABLE `attendance`
  MODIFY `attendance_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `department_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `login_account`
--
ALTER TABLE `login_account`
  MODIFY `account_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `position`
--
ALTER TABLE `position`
  MODIFY `position_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `salary`
--
ALTER TABLE `salary`
  MODIFY `salary_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `staff_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `allowances`
--
ALTER TABLE `allowances`
  ADD CONSTRAINT `allowances_ibfk_1` FOREIGN KEY (`salary_id`) REFERENCES `salary` (`salary_id`),
  ADD CONSTRAINT `allowances_ibfk_2` FOREIGN KEY (`salary_id`) REFERENCES `salary` (`salary_id`);

--
-- Constraints for table `attendance`
--
ALTER TABLE `attendance`
  ADD CONSTRAINT `attendance_ibfk_1` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`staff_id`);

--
-- Constraints for table `login_account`
--
ALTER TABLE `login_account`
  ADD CONSTRAINT `login_account_ibfk_1` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`staff_id`);

--
-- Constraints for table `salary`
--
ALTER TABLE `salary`
  ADD CONSTRAINT `salary_ibfk_1` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`staff_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
