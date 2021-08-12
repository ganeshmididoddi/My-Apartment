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
-- Table structure for table `complaint`
--

CREATE TABLE `complaint` (
  `id` bigint(10) NOT NULL,
  `code` varchar(200) NOT NULL,
  `subject` varchar(500) NOT NULL,
  `description` mediumtext NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `complaint`
--

INSERT INTO `complaint` (`id`, `code`, `subject`, `description`, `date`, `time`) VALUES
(1, '11', 'lift erreo', 'qwerttyugfzcvhn\njhgfghj', '2020-06-18', '15:19:08'),
(2, '11', 'vendors', 'not added\n', '2020-06-19', '17:11:24'),
(3, '11', '', '', '2020-06-26', '00:39:54'),
(4, '11', 'haha s', 'gavbs s', '2020-06-30', '13:14:56'),
(5, '11', 'haha s', 'gavbs s', '2020-06-30', '13:15:00'),
(6, '11', 'hellog', 'tfhugbj', '2020-06-30', '13:53:10'),
(7, '11', 'ytyt', 'pljhjhc ', '2020-06-30', '13:55:39'),
(8, '11', 'shf', 'duff', '2020-06-30', '13:56:50'),
(9, '11', 'thg', 'gdu', '2020-06-30', '13:57:44'),
(10, '11', 'rd', 'dc', '2020-06-30', '14:00:19'),
(11, '11', 'ytyt', 'trtr', '2020-06-30', '14:03:49'),
(12, '22', 'fgcc', 'hcvbhnb', '2020-06-30', '14:07:23'),
(13, '22', 'hrh', 'ughjc', '2020-06-30', '14:08:32'),
(14, '11', 'tyffv', 'ccvvbccvvb BBB ', '2020-07-18', '00:40:16'),
(15, '11', 'gahahsbsbs', 'shsbbsjsjsks.ubsb', '2020-07-20', '11:46:31'),
(16, '01', 'itutufjcnv', 'fhcjcufititih', '2020-07-20', '16:01:35'),
(17, '01', 'ghhnbkkkm', 'ghhjiufdsfghhjkknn\nhgvbnnnmmmmmm', '2020-07-21', '08:06:06'),
(18, '01', 'hshshsnannananana', 'habsbanna\na\najhsnsjakkam', '2020-07-21', '13:14:27'),
(19, '01', 'Water not coming', 'Since the water not coming on the bldg tank', '2020-07-22', '05:47:41'),
(20, '01', 'Zatu', 'Loudu\n', '2020-07-22', '18:54:57');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `complaint`
--
ALTER TABLE `complaint`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `complaint`
--
ALTER TABLE `complaint`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
