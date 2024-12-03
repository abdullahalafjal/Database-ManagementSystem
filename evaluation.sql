-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 03, 2024 at 08:52 PM
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
-- Database: `evaluation`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateEmployeeSalary` (IN `empID` INT, IN `newSalary` DECIMAL(10,2))   BEGIN
    UPDATE EmployeeSalary
    SET Salary = newSalary
    WHERE EmployeeID = empID;

    SELECT CONCAT('Salary updated successfully for EmployeeID: ', empID) AS Message;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `DepartmentID` int(11) NOT NULL,
  `DepartmentName` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`DepartmentID`, `DepartmentName`) VALUES
(101, 'CSE'),
(102, 'CIS'),
(103, 'EEE'),
(104, 'IT');

-- --------------------------------------------------------

--
-- Stand-in structure for view `employeedetails`
-- (See below for the actual view)
--
CREATE TABLE `employeedetails` (
`EmployeeID` int(11)
,`EmployeeName` varchar(100)
,`DepartmentName` varchar(100)
,`Salary` decimal(10,2)
);

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `EmployeeID` int(11) NOT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `Age` int(20) DEFAULT NULL,
  `DepartmentID` int(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`EmployeeID`, `Name`, `Age`, `DepartmentID`) VALUES
(1, 'Sohag', 25, 101),
(2, 'Tarek', 30, 102),
(3, 'Kamal', 27, 103),
(4, 'Jamal', 24, 104),
(5, 'Mehedi', 22, 101),
(6, 'JIM', 19, 102);

--
-- Triggers `employees`
--
DELIMITER $$
CREATE TRIGGER `BeforeInsertEmployee` BEFORE INSERT ON `employees` FOR EACH ROW BEGIN
    IF NEW.Age < 18 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Employee must be at least 18 years old';
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `employeesalary`
--

CREATE TABLE `employeesalary` (
  `SalaryID` int(11) NOT NULL,
  `EmployeeID` int(20) DEFAULT NULL,
  `Salary` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employeesalary`
--

INSERT INTO `employeesalary` (`SalaryID`, `EmployeeID`, `Salary`) VALUES
(1, 1, 50000.00),
(2, 2, 65000.00),
(3, 3, 55000.00),
(4, 4, 58000.00);

-- --------------------------------------------------------

--
-- Structure for view `employeedetails`
--
DROP TABLE IF EXISTS `employeedetails`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `employeedetails`  AS SELECT `employees`.`EmployeeID` AS `EmployeeID`, `employees`.`Name` AS `EmployeeName`, `departments`.`DepartmentName` AS `DepartmentName`, `employeesalary`.`Salary` AS `Salary` FROM ((`employees` join `departments` on(`employees`.`DepartmentID` = `departments`.`DepartmentID`)) join `employeesalary` on(`employees`.`EmployeeID` = `employeesalary`.`EmployeeID`)) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`DepartmentID`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`EmployeeID`),
  ADD KEY `DepartmentID` (`DepartmentID`);

--
-- Indexes for table `employeesalary`
--
ALTER TABLE `employeesalary`
  ADD PRIMARY KEY (`SalaryID`),
  ADD KEY `EmployeeID` (`EmployeeID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `employees`
--
ALTER TABLE `employees`
  ADD CONSTRAINT `employees_ibfk_1` FOREIGN KEY (`DepartmentID`) REFERENCES `departments` (`DepartmentID`);

--
-- Constraints for table `employeesalary`
--
ALTER TABLE `employeesalary`
  ADD CONSTRAINT `employeesalary_ibfk_1` FOREIGN KEY (`EmployeeID`) REFERENCES `employees` (`EmployeeID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
