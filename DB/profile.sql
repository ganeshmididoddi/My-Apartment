-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jul 24, 2020 at 04:59 PM
-- Server version: 10.3.16-MariaDB
-- PHP Version: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `id14380702_apartment`
--

-- --------------------------------------------------------

--
-- Table structure for table `profile`
--

CREATE TABLE `profile` (
  `r_id` bigint(10) NOT NULL,
  `name` varchar(200) NOT NULL DEFAULT '----',
  `email` varchar(200) NOT NULL DEFAULT '----',
  `ph_number` bigint(12) NOT NULL DEFAULT 0,
  `code` varchar(200) NOT NULL DEFAULT '----',
  `room_no` varchar(200) NOT NULL DEFAULT '----',
  `profession` varchar(200) NOT NULL DEFAULT '----',
  `type` varchar(200) NOT NULL DEFAULT '----'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `profile`
--

INSERT INTO `profile` (`r_id`, `name`, `email`, `ph_number`, `code`, `room_no`, `profession`, `type`) VALUES
(1, 'aa', 'aa', 789654, '11', '546', 'svtdgvdhjaaa', 'Owner'),
(2, 'Admin', 'bb', 7894465213, '11', '24', 'adminnn', 'Owner'),
(3, 'cc', 'cc', 0, '22', '22', '', ''),
(34, 'Poshetty', 'poshetty', 9969372997, '01', '11', 'Tailor', 'Rent'),
(35, 'neeraj', 'neerajdumbare@ternaengg.ac.in', 0, '01', '66', '----', '----'),
(36, 'Harsh Sukale', 'sukaleharsh23@gmail.com', 0, '01', '20', '----', '----'),
(37, 'Tanvi Mhatre', 'tanvimhatre02@gmail.com', 0, '01', '02', '----', '----'),
(38, 'Prathamesh pradeep patil', 'prathameshpatil361@gmail.com', 0, '01', '808', '----', '----'),
(41, 'Omkar Kasulwar', 'kasulwaromkar@gmail.com', 0, '01', '7', 'Hrithik commited', 'Owner'),
(44, 'qq', 'qq', 0, '01', '11', '----', '----'),
(45, 'ww', 'ww', 0, '01', '22', '----', '----'),
(46, 'ganesh ', 'ss', 0, '11', '10', '----', '----'),
(47, 'ad', 'ad', 0, '05', '45', '----', '----');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `profile`
--
ALTER TABLE `profile`
  ADD PRIMARY KEY (`r_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `profile`
--
ALTER TABLE `profile`
  ADD CONSTRAINT `profile_ibfk_1` FOREIGN KEY (`r_id`) REFERENCES `registration` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
