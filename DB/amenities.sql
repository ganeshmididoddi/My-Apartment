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
-- Table structure for table `amenities`
--

CREATE TABLE `amenities` (
  `id` bigint(10) NOT NULL,
  `code` varchar(200) NOT NULL,
  `type` varchar(200) NOT NULL,
  `name` varchar(200) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `number` bigint(10) NOT NULL,
  `monthly` float DEFAULT NULL,
  `quarterly` float DEFAULT NULL,
  `yearly` float DEFAULT NULL,
  `openspacecharge` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `amenities`
--

INSERT INTO `amenities` (`id`, `code`, `type`, `name`, `description`, `number`, `monthly`, `quarterly`, `yearly`, `openspacecharge`) VALUES
(2, '11', 'Swimming Pool', 'regfh', '', 7894561230, 100, 300, 5000, 0),
(5, '22', 'Swimming Pool', 'fdf', 'qwetrjyhjm\ndgvcx', 7894561230, 100, 300, 1000, 0),
(14, '11', 'GYM', 'fagsvs', 'gvsvs', 549494, 646, 2000, 6798, 0),
(20, '01', 'GYM', 'FITNESS CLUB', 'A gym is a club, building, or large room, usually containing special equipment, where people go to do physical exercise and get fit. While the lads are golfing, I work out in the gym. ... Gym is the activity of doing physical exercises in a gym, especially at school.', 12346587870, 500, 2500, 5000, NULL),
(21, '01', 'OpenSpace', 'KUMARAGAM', 'As its name hints, Kumaragam Smart Venue is a smart budget wedding lawn in Coimbatore. It is encompassed by rich green trees. It is a sumptuous setting to have your stupendous wedding and gathering. The warm and welcoming feel of the scene spreads in a lovely vibe. It has a sprawling grass lawn for having an open-air occasion. It likewise has a meal corridor that is extensive enough to suit an enormous social affair.', 12346587879, NULL, NULL, NULL, 2000);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `amenities`
--
ALTER TABLE `amenities`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `amenities`
--
ALTER TABLE `amenities`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
