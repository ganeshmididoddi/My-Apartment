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
-- Table structure for table `notice`
--

CREATE TABLE `notice` (
  `id` bigint(10) NOT NULL,
  `code` varchar(200) NOT NULL,
  `subject` varchar(500) NOT NULL,
  `description` mediumtext NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `notice`
--

INSERT INTO `notice` (`id`, `code`, `subject`, `description`, `date`, `time`) VALUES
(1, '11', 'meeting	', 'today at 7pm ', '2020-06-18', '12:57:50'),
(2, '11', 'bhdvc', 'hdghgfgjjk', '2020-06-18', '12:59:06'),
(3, '11', 'hello', 'hughjhj', '2020-06-29', '18:18:32'),
(4, '11', 'yhhjk', 'hhjkkmnn\n\nytujnnn\nyyjkk\n\n\n\nionmm', '2020-06-29', '18:20:49'),
(5, '11', 'hikij', 'kn', '2020-06-29', '18:23:07'),
(6, '11', 'hr', 'gbjb\n', '2020-06-30', '19:09:12'),
(7, '11', 'hahsbbsnsnsjsj', 'yhshsnnsbskaoahsbbx z', '2020-07-20', '11:47:45'),
(8, '01', 'hello ', 'good evening', '2020-07-20', '15:57:17'),
(9, '', '', '', '2020-07-21', '07:33:01'),
(10, '', '', '', '2020-07-21', '07:44:43'),
(11, '01', 'hello ', 'stay home stay safe', '2020-07-24', '13:49:35');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `notice`
--
ALTER TABLE `notice`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `notice`
--
ALTER TABLE `notice`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
