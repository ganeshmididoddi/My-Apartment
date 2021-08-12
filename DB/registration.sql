-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jul 24, 2020 at 05:00 PM
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
-- Table structure for table `registration`
--

CREATE TABLE `registration` (
  `id` bigint(10) NOT NULL,
  `name` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL,
  `superadmincode` varchar(200) DEFAULT NULL,
  `code` varchar(200) NOT NULL,
  `roomno` varchar(200) NOT NULL,
  `usertype` varchar(200) NOT NULL,
  `status` varchar(100) NOT NULL DEFAULT 'notactive'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `registration`
--

INSERT INTO `registration` (`id`, `name`, `email`, `password`, `superadmincode`, `code`, `roomno`, `usertype`, `status`) VALUES
(1, 'aa', 'aa', 'aa', NULL, '11', '1', 'Residence', 'active'),
(2, 'bb', 'bb', 'bb', NULL, '11', '2', 'Admin', 'active'),
(3, 'cc', 'cc', 'cc', NULL, '22', '22', 'Residence', 'active'),
(4, 'dd', 'dd', 'dd', NULL, '22', '12', 'Admin', 'active'),
(29, 'Ganesh Mididoddi', 'ganeshmididoddi@gmail.com', 'ganesh', NULL, '01', '11', 'Admin', 'active'),
(31, 'mamta', 'mamta.mididoddi@gmail.com', 'mamta@123', NULL, '01', '2209', 'Residence', 'active'),
(32, 'ganesh', 'ganesh', 'ganesh', NULL, '01', '12', 'Residence', 'active'),
(34, 'Poshetty', 'poshetty', 'poshetty', NULL, '01', '11', 'Residence', 'active'),
(35, 'neeraj', 'neerajdumbare@ternaengg.ac.in', 'Terna123', NULL, '01', '66', 'Residence', 'active'),
(36, 'Harsh Sukale', 'sukaleharsh23@gmail.com', 'harsh123', NULL, '01', '20', 'Residence', 'active'),
(37, 'Tanvi Mhatre', 'tanvimhatre02@gmail.com', 'tanu0206', NULL, '01', '02', 'Residence', 'active'),
(38, 'Prathamesh pradeep patil', 'prathameshpatil361@gmail.com', 'ganesh123', NULL, '01', '808', 'Residence', 'active'),
(41, 'Omkar Kasulwar', 'kasulwaromkar@gmail.com', 'om123', NULL, '01', '7', 'Residence', 'active'),
(44, 'qq', 'qq', 'qq', '', '01', '11', 'Residence', 'notactive'),
(45, 'ww', 'ww', 'ww', '01', '01', '22', 'Admin', 'notactive'),
(46, 'ganesh ', 'ss', 'ss', '', '111', '10', 'SuperAdmin', 'active'),
(47, 'ad', 'ad', 'ad', '111', '05', '45', 'Admin', 'active');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `registration`
--
ALTER TABLE `registration`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `registration`
--
ALTER TABLE `registration`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
