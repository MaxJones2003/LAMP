-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 21, 2026 at 04:26 AM
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
-- Database: `cop4331`
--

-- --------------------------------------------------------

--
-- Table structure for table `colors`
--

CREATE TABLE `colors` (
  `ID` int(11) NOT NULL,
  `Name` varchar(50) NOT NULL DEFAULT '',
  `UserID` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `colors`
--

INSERT INTO `colors` (`ID`, `Name`, `UserID`) VALUES
(1, 'Blue', 1),
(2, 'White', 1),
(3, 'Black', 1),
(4, 'Magenta', 1),
(5, 'Yellow', 1),
(6, 'Cyan', 1),
(7, 'Salmon', 1),
(8, 'Chartreuse', 1),
(9, 'Lime', 1),
(10, 'Light Blue', 1),
(11, 'Light Gray', 1),
(12, 'Light Red', 1),
(13, 'Light Green', 1),
(14, 'Chiffon', 1),
(15, 'Fuscia', 1),
(16, 'Brown', 1),
(17, 'Beige', 1),
(18, 'Blue', 3),
(19, 'White', 3),
(20, 'Black', 3),
(21, 'Gray', 3),
(22, 'Magenta', 3),
(23, 'Yellow', 3),
(24, 'Cyan', 3),
(25, 'Salmon', 3),
(26, 'Chartreuse', 3),
(27, 'Lime', 3),
(28, 'Light Blue', 3),
(29, 'Light Gray', 3),
(30, 'Light Red', 3),
(31, 'Light Green', 3),
(32, 'Chiffon', 3),
(33, 'Fuscia', 3),
(34, 'Brown', 3),
(35, 'Beige', 3);

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `ID` int(11) NOT NULL,
  `FirstName` varchar(50) NOT NULL DEFAULT '',
  `LastName` varchar(50) NOT NULL DEFAULT '',
  `Phone` varchar(50) NOT NULL DEFAULT '',
  `Email` varchar(50) NOT NULL DEFAULT '',
  `UserID` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `ID` int(11) NOT NULL,
  `FirstName` varchar(50) NOT NULL DEFAULT '',
  `LastName` varchar(50) NOT NULL DEFAULT '',
  `Login` varchar(50) NOT NULL DEFAULT '',
  `Password` varchar(50) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`ID`, `FirstName`, `LastName`, `Login`, `Password`) VALUES
(1, 'Rick', 'Leinecker', 'RickL', 'COP4331'),
(2, 'Sam', 'Hill', 'SamH', 'Test'),
(3, 'Rick', 'Leinecker', 'RickL', '5832a71366768098cceb7095efb774f2'),
(4, 'Sam', 'Hill', 'SamH', '0cbc6611f5540bd0809a388dc95a615b');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `colors`
--
ALTER TABLE `colors`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `colors`
--
ALTER TABLE `colors`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
