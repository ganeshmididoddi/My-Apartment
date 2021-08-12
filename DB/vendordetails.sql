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
-- Table structure for table `vendordetails`
--

CREATE TABLE `vendordetails` (
  `id` bigint(10) NOT NULL,
  `code` varchar(200) NOT NULL,
  `name` varchar(200) NOT NULL,
  `number` bigint(12) NOT NULL,
  `address` varchar(500) NOT NULL,
  `cost` varchar(200) NOT NULL,
  `type` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `vendordetails`
--

INSERT INTO `vendordetails` (`id`, `code`, `name`, `number`, `address`, `cost`, `type`) VALUES
(2, '22', 'qwerty', 7489653250, 'qawsedrehfghjkl;lkjbvbnm,ldfghjkhgfngfvbnm,.', '500', 'Electrician'),
(3, '11', 'ionn', 3698520741, 'qazcdeerdd', '500', 'Electrician'),
(4, '11', 'popo', 3698520741, 'qwertfcxx', '699', 'Cable'),
(5, '22', 'trataf', 258093693, 'hafahus s sjs', '500', 'Electrician'),
(6, '11', 'tgcrf', 2585588, 'stdycjvjvdyg', '458', 'Plumber'),
(8, '11', 'ter', 25, 'trtefcf', '2580', 'Carpenter'),
(11, '11', 'qaaa', 784561230, 'qwertyghdw\ndysgdbjkf', '200', 'Electrician'),
(12, '22', 'trr', 9595970784, 'dgdjtkf f\ndhrhdhd\nthr', '500', 'Cater'),
(13, '22', 'ajpjqou', 961661613, 'jvgdgdhfjvkb', '507', 'Electrician'),
(14, '11', 'hhfg', 100, 'etdufhcjfuruf\nffv', '00', 'Emergency'),
(15, '11', 'haba', 258832131949, 'gahaujs\nyshsbjsja\nhhss', '250', 'Decorator'),
(16, '01', 'Raj Electrical', 2580258012, 'qwerhdjjsjs\nmumahaiia\ngahsjja', '200', 'Electrician'),
(17, '01', 'Om Hardware', 2580963125, 'gagahahhauahshs\nhshsuususjsnjs\nhshsjjs', '150', 'Plumber'),
(18, '01', ' sai interior', 25800288, 'tagagbakakabsbs\nyshwbbsns\nhsbsbs', '100', 'Renovation'),
(19, '01', 'frfood', 25809634, 'tagvana\nyshsbjsja\nusijsjsmuma\nhajaj', '00', 'Cater'),
(20, '01', 'wood art', 250963154949, 'hsjjsjsb\nywubsbsbs\nahutddgdhsj', '500', 'Carpenter'),
(21, '01', 'electric ', 1324648705, 'tahauuajsj\nhshsjsjsj\nhsbsb', '150', 'Electrician'),
(22, '01', 'khana ', 1234658790, 'trafvsyshbs\nyshsbjsja\nhshjsjs', '99', 'Cater');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `vendordetails`
--
ALTER TABLE `vendordetails`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `vendordetails`
--
ALTER TABLE `vendordetails`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
