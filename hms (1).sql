-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3307
-- Generation Time: Dec 10, 2024 at 03:41 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hms`
--

-- --------------------------------------------------------

--
-- Table structure for table `appointment`
--

CREATE TABLE `appointment` (
  `Doctor_Name` varchar(20) DEFAULT NULL,
  `Hospital` varchar(20) DEFAULT NULL,
  `Branch` varchar(20) DEFAULT NULL,
  `Patient_ID` varchar(20) DEFAULT NULL,
  `Password` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
--
-- Dumping data for table `appointment`
--
INSERT INTO `appointment` (`Doctor_Name`, `Hospital`, `Branch`, `Patient_ID`, `Password`) VALUES
('gdfgdf', 'fgfdg', 'fdgfdg', 'dfgfdg', 'ffdg'),
('sffds', 'hira', 'fuck', '1742', '789'),
('hfg', 'fghfgh', 'fghfgh', 'fghfgh', 'oiouiyu');

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

CREATE TABLE `attendance` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `entering_time` time DEFAULT NULL,
  `leaving_time` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
--
-- Dumping data for table `attendance`
--
INSERT INTO `attendance` (`id`, `name`, `entering_time`, `leaving_time`) VALUES
(1, 'Rafiq Ahmed', '09:00:00', '17:00:00'),
(2, 'Nazia Islam', '09:15:00', '17:30:00'),
(3, 'Samiul Haque', '08:45:00', '16:45:00'),
(4, 'Mariam Khatun', '09:05:00', '17:10:00'),
(5, 'Tariqul Hasan', '08:55:00', '16:50:00');

-- --------------------------------------------------------

--
-- Table structure for table `billing`
--

CREATE TABLE `billing` (
  `bill_id` int(11) NOT NULL,
  `patient_id` int(11) DEFAULT NULL,
  `total_amount` decimal(10,2) DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  `payment_status` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `billing`
--

INSERT INTO `billing` (`bill_id`, `patient_id`, `total_amount`, `payment_date`, `payment_status`) VALUES
(1, 1, 5000.00, '2024-04-10', 'Paid'),
(2, 2, 7500.50, '2024-03-30', 'Paid'),
(3, 3, 3200.75, '2024-02-25', 'Pending'),
(4, 4, 8900.00, '2024-04-15', 'Paid'),
(5, 5, 4500.25, '2024-03-11', 'Paid');

-- --------------------------------------------------------

--
-- Table structure for table `doctors`
--

CREATE TABLE `doctors` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `specialist` varchar(100) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `room_no` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
--
-- Dumping data for table `doctors`
--
INSERT INTO `doctors` (`id`, `name`, `phone`, `specialist`, `address`, `room_no`) VALUES
(1, 'Dr. Mahmudul Hasan', '01712345678', 'Cardiologist', 'Dhaka, Bangladesh', '101'),
(2, 'Dr. Sharmin Akter', '01898765432', 'Neurologist', 'Chittagong, Bangladesh', '102'),
(3, 'Dr. Tanvir Rahman', '01611223344', 'Orthopedic Surgeon', 'Sylhet, Bangladesh', '201'),
(4, 'Dr. Farhana Jahan', '01599887766', 'Pediatrician', 'Khulna, Bangladesh', '202'),
(5, 'Dr. Anwarul Islam', '01977665544', 'Dermatologist', 'Rajshahi, Bangladesh', '301');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `department` varchar(100) DEFAULT NULL,
  `joining_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`id`, `name`, `phone`, `department`, `joining_date`) VALUES
(1, 'Rafiq Ahmed', '01712345678', 'Human Resources', '2020-03-15'),
(2, 'Nazia Islam', '01898765432', 'IT Department', '2019-07-22'),
(3, 'Samiul Haque', '01611223344', 'Finance', '2021-01-10'),
(4, 'Mariam Khatun', '01599887766', 'Marketing', '2018-11-05'),
(5, 'Tariqul Hasan', '01977665544', 'Operations', '2022-06-18');

-- --------------------------------------------------------

--
-- Table structure for table `fourth_class_employee`
--

CREATE TABLE `fourth_class_employee` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `work` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `fourth_class_employee`
--

INSERT INTO `fourth_class_employee` (`id`, `name`, `address`, `work`) VALUES
(1, 'Abdul Karim', 'Dhaka, Bangladesh', 'Cleaning'),
(2, 'Hasina Begum', 'Chittagong, Bangladesh', 'Washing'),
(3, 'Jamal Uddin', 'Sylhet, Bangladesh', 'Dustbin Management'),
(4, 'Shirin Akter', 'Khulna, Bangladesh', 'Cleaning'),
(5, 'Rahim Mia', 'Rajshahi, Bangladesh', 'Washing');

-- --------------------------------------------------------

--
-- Table structure for table `laboratory`
--

CREATE TABLE `laboratory` (
  `lab_test_id` int(11) NOT NULL,
  `patient_id` int(11) DEFAULT NULL,
  `test_name` varchar(100) DEFAULT NULL,
  `test_date` date DEFAULT NULL,
  `result` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `laboratory`
--

INSERT INTO `laboratory` (`lab_test_id`, `patient_id`, `test_name`, `test_date`, `result`) VALUES
(1, 1, 'Blood Sugar Test', '2024-04-03', 'Normal'),
(2, 2, 'Lung Function Test', '2024-03-22', 'Slight Obstruction'),
(3, 3, 'Blood Pressure Test', '2024-02-17', 'High BP'),
(4, 4, 'MRI Scan', '2024-04-07', 'Normal'),
(5, 5, 'Allergy Test', '2024-03-03', 'Positive for Pollen Allergy');

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `UserName` varchar(20) DEFAULT NULL,
  `Password` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `nurse`
--

CREATE TABLE `nurse` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `department` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `nurse`
--

INSERT INTO `nurse` (`id`, `name`, `address`, `department`) VALUES
(1, 'Ayesha Rahman', 'Dhaka, Bangladesh', 'Pediatrics'),
(2, 'Kamrul Hasan', 'Chittagong, Bangladesh', 'Emergency'),
(3, 'Farhana Akter', 'Sylhet, Bangladesh', 'Oncology'),
(4, 'Sajjad Karim', 'Khulna, Bangladesh', 'Cardiology'),
(5, 'Nasrin Jahan', 'Barisal, Bangladesh', 'Neurology');

-- --------------------------------------------------------

--
-- Table structure for table `operation_theater_booking`
--

CREATE TABLE `operation_theater_booking` (
  `booking_id` int(11) NOT NULL,
  `patient_id` int(11) DEFAULT NULL,
  `doctor_id` int(11) DEFAULT NULL,
  `theater_no` varchar(10) DEFAULT NULL,
  `operation_date` date DEFAULT NULL,
  `operation_time` time DEFAULT NULL,
  `operation_type` varchar(100) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `operation_theater_booking`
--

INSERT INTO `operation_theater_booking` (`booking_id`, `patient_id`, `doctor_id`, `theater_no`, `operation_date`, `operation_time`, `operation_type`, `status`) VALUES
(1, 1, 101, 'OT-1', '2024-04-15', '10:00:00', 'Appendectomy', 'Scheduled'),
(2, 2, 102, 'OT-2', '2024-04-18', '12:00:00', 'C-Section', 'Scheduled'),
(3, 3, 103, 'OT-3', '2024-04-20', '14:30:00', 'Gallbladder Removal', 'Cancelled'),
(4, 4, 104, 'OT-1', '2024-04-22', '09:00:00', 'Knee Replacement', 'Scheduled'),
(5, 5, 105, 'OT-2', '2024-04-25', '11:45:00', 'Hernia Repair', 'Completed');

-- --------------------------------------------------------

--
-- Stand-in structure for view `patienlist`
-- (See below for the actual view)
--
CREATE TABLE `patienlist` (
`Doctor_Name` varchar(20)
,`Hospital` varchar(20)
,`Branch` varchar(20)
);

-- --------------------------------------------------------

--
-- Table structure for table `patients`
--

CREATE TABLE `patients` (
  `patient_id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `admission_date` date DEFAULT NULL,
  `discharge_date` date DEFAULT NULL,
  `medical_history` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `patients`
--

INSERT INTO `patients` (`patient_id`, `name`, `dob`, `gender`, `phone`, `address`, `admission_date`, `discharge_date`, `medical_history`) VALUES
(1, 'Abdul Rahim', '1985-03-15', 'Male', '01712345678', 'Dhaka, Bangladesh', '2024-04-01', '2024-04-10', 'Diabetes'),
(2, 'Mariam Khatun', '1992-07-22', 'Female', '01898765432', 'Chittagong, Bangladesh', '2024-03-20', '2024-03-30', 'Asthma'),
(3, 'Kamal Hossain', '1978-01-10', 'Male', '01611223344', 'Sylhet, Bangladesh', '2024-02-15', '2024-02-25', 'Hypertension'),
(4, 'Shirin Akter', '2000-11-05', 'Female', '01599887766', 'Khulna, Bangladesh', '2024-04-05', '2024-04-15', 'Migraine'),
(5, 'Rashidul Islam', '1990-06-18', 'Male', '01977665544', 'Barisal, Bangladesh', '2024-03-01', '2024-03-11', 'Allergy');

-- --------------------------------------------------------

--
-- Table structure for table `pharmacy`
--

CREATE TABLE `pharmacy` (
  `medicine_no` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `manufacturing_date` date DEFAULT NULL,
  `expiry_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pharmacy`
--

INSERT INTO `pharmacy` (`medicine_no`, `name`, `manufacturing_date`, `expiry_date`) VALUES
(1, 'Paracitamol', '2023-01-15', '2025-01-15'),
(2, 'Histal', '2022-12-10', '2024-12-10'),
(3, 'Napa Extra', '2023-03-20', '2026-03-20'),
(4, 'Seclo', '2023-05-12', '2025-05-12'),
(5, 'Rizatriptan', '2023-02-18', '2026-02-18');

-- --------------------------------------------------------

--
-- Table structure for table `registration`
--

CREATE TABLE `registration` (
  `FirstName` varchar(20) DEFAULT NULL,
  `LastName` varchar(20) DEFAULT NULL,
  `Email` varchar(20) DEFAULT NULL,
  `UserName` varchar(20) DEFAULT NULL,
  `Password` varchar(20) DEFAULT NULL,
  `ConfirmPassword` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `registration`
--

INSERT INTO `registration` (`FirstName`, `LastName`, `Email`, `UserName`, `Password`, `ConfirmPassword`) VALUES
('sfdfsd', 'sdfsdv', 'xcvxcv', 'zvzxc', '123', '123'),
('afjal ', 'tosiba', 'afjal', 'hira', '123', '123'),
('fgf', 'fdgfgsdf', 'sgfdfh', 'mejbah', '753', '753'),
('fgfhdgifhd', 'fdgfdg', 'dfgfdg', 'mejbah', '159', '159');

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

CREATE TABLE `rooms` (
  `room_id` int(11) NOT NULL,
  `room_type` varchar(50) DEFAULT NULL,
  `capacity` int(11) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rooms`
--

INSERT INTO `rooms` (`room_id`, `room_type`, `capacity`, `status`) VALUES
(101, 'Single', 1, 'Occupied'),
(102, 'Double', 2, 'Available'),
(103, 'ICU', 1, 'Occupied'),
(104, 'General Ward', 6, 'Available'),
(105, 'Private', 1, 'Under Maintenance');

-- --------------------------------------------------------

--
-- Table structure for table `ward_boy`
--

CREATE TABLE `ward_boy` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `allocated_ward_no` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ward_boy`
--

INSERT INTO `ward_boy` (`id`, `name`, `phone`, `address`, `allocated_ward_no`) VALUES
(1, 'Azizur Rahman', '01712345678', 'Dhaka, Bangladesh', 'Ward 101'),
(2, 'Mokhlesur Alam', '01898765432', 'Chittagong, Bangladesh', 'Ward 202'),
(3, 'Shahida Begum', '01611223344', 'Sylhet, Bangladesh', 'Ward 303'),
(4, 'Rafiqul Islam', '01599887766', 'Khulna, Bangladesh', 'Ward 404'),
(5, 'Nasir Uddin', '01977665544', 'Barisal, Bangladesh', 'Ward 505');

-- --------------------------------------------------------

--
-- Structure for view `patienlist`
--
DROP TABLE IF EXISTS `patienlist`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `patienlist`  AS SELECT `appointment`.`Doctor_Name` AS `Doctor_Name`, `appointment`.`Hospital` AS `Hospital`, `appointment`.`Branch` AS `Branch` FROM `appointment` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attendance`
--
ALTER TABLE `attendance`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `billing`
--
ALTER TABLE `billing`
  ADD PRIMARY KEY (`bill_id`);

--
-- Indexes for table `doctors`
--
ALTER TABLE `doctors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fourth_class_employee`
--
ALTER TABLE `fourth_class_employee`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `laboratory`
--
ALTER TABLE `laboratory`
  ADD PRIMARY KEY (`lab_test_id`);

--
-- Indexes for table `nurse`
--
ALTER TABLE `nurse`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `operation_theater_booking`
--
ALTER TABLE `operation_theater_booking`
  ADD PRIMARY KEY (`booking_id`);

--
-- Indexes for table `patients`
--
ALTER TABLE `patients`
  ADD PRIMARY KEY (`patient_id`);

--
-- Indexes for table `pharmacy`
--
ALTER TABLE `pharmacy`
  ADD PRIMARY KEY (`medicine_no`);

--
-- Indexes for table `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`room_id`);

--
-- Indexes for table `ward_boy`
--
ALTER TABLE `ward_boy`
  ADD PRIMARY KEY (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
