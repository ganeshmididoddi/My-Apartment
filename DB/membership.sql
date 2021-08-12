-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jul 24, 2020 at 04:58 PM
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
-- Table structure for table `membership`
--

CREATE TABLE `membership` (
  `id` bigint(10) NOT NULL,
  `code` varchar(200) NOT NULL,
  `amenities_id` bigint(10) NOT NULL,
  `amenities_name` varchar(200) NOT NULL,
  `r_id` bigint(10) NOT NULL,
  `amount` float NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `payment` varchar(200) NOT NULL DEFAULT 'notpaid'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `membership`
--

INSERT INTO `membership` (`id`, `code`, `amenities_id`, `amenities_name`, `r_id`, `amount`, `start_date`, `end_date`, `payment`) VALUES
(6, '22', 5, 'fdf', 3, 1000, '2020-06-24', '2021-06-24', 'notpaid'),
(7, '22', 5, 'fdf', 3, 100, '2020-06-24', '2020-07-24', 'notpaid'),
(21, '11', 2, 'regfh', 2, 100, '2020-07-09', '2020-08-09', 'paid'),
(23, '22', 5, 'fdf', 4, 100, '2020-07-09', '2020-08-09', 'notpaid'),
(28, '11', 2, 'regfh', 1, 100, '2020-07-11', '2020-08-11', 'paid'),
(30, '11', 2, 'regfh', 1, 100, '2020-07-14', '2020-08-14', 'paid'),
(32, '11', 2, 'regfh', 1, 100, '2020-07-19', '2020-08-19', 'paid'),
(33, '11', 14, 'fagsvs', 1, 646, '2020-07-19', '2020-08-19', 'paid'),
(34, '11', 2, 'regfh', 1, 100, '2020-07-20', '2020-08-20', 'notpaid'),
(35, '11', 14, 'fagsvs', 1, 646, '2020-07-20', '2020-08-20', 'paid'),
(36, '11', 2, 'regfh', 1, 100, '2020-07-21', '2020-08-21', 'notpaid'),
(41, '01', 20, 'FITNESS CLUB', 29, 500, '2020-07-21', '2020-08-21', 'notpaid'),
(42, '01', 20, 'FITNESS CLUB', 29, 5000, '2020-07-21', '2021-07-21', 'notpaid'),
(43, '01', 20, 'FITNESS CLUB', 41, 2500, '2020-07-22', '2020-10-22', 'paid'),
(44, '01', 20, 'FITNESS CLUB', 35, 500, '2020-07-22', '2020-08-22', 'notpaid'),
(45, '01', 20, 'FITNESS CLUB', 35, 2500, '2020-07-22', '2020-10-22', 'notpaid'),
(46, '01', 20, 'FITNESS CLUB', 35, 5000, '2020-07-22', '2021-07-22', 'notpaid');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `membership`
--
ALTER TABLE `membership`
  ADD PRIMARY KEY (`id`),
  ADD KEY `amenities_id` (`amenities_id`),
  ADD KEY `r_id` (`r_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `membership`
--
ALTER TABLE `membership`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `membership`
--
ALTER TABLE `membership`
  ADD CONSTRAINT `membership_ibfk_1` FOREIGN KEY (`amenities_id`) REFERENCES `amenities` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `membership_ibfk_2` FOREIGN KEY (`r_id`) REFERENCES `registration` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
