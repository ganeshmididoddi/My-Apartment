-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jul 24, 2020 at 05:04 PM
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

-- --------------------------------------------------------

--
-- Table structure for table `building`
--

CREATE TABLE `building` (
  `code` varchar(200) NOT NULL,
  `name` varchar(200) NOT NULL,
  `pin` varchar(200) NOT NULL,
  `address` varchar(200) NOT NULL,
  `landmark` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `building`
--

INSERT INTO `building` (`code`, `name`, `pin`, `address`, `landmark`) VALUES
('01', 'Sahayadri Bldg', '400033', 'New hind mill mahada colony,\nCotton Green\nMumbai 33', 'Ghodapdeo'),
('11', 'bn', '400000', 'dgfdhf\nfjhmn', 'poii'),
('22', 'qbc', '485580', 'gagauah\nyegvehsjs\njshsb', 'mumbai'),
('33', '123', '528', 'gavabbans', 'hsbsn');

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
-- Indexes for table `amenities`
--
ALTER TABLE `amenities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `building`
--
ALTER TABLE `building`
  ADD PRIMARY KEY (`code`);

--
-- Indexes for table `complaint`
--
ALTER TABLE `complaint`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `membership`
--
ALTER TABLE `membership`
  ADD PRIMARY KEY (`id`),
  ADD KEY `amenities_id` (`amenities_id`),
  ADD KEY `r_id` (`r_id`);

--
-- Indexes for table `notice`
--
ALTER TABLE `notice`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `profile`
--
ALTER TABLE `profile`
  ADD PRIMARY KEY (`r_id`);

--
-- Indexes for table `registration`
--
ALTER TABLE `registration`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vendordetails`
--
ALTER TABLE `vendordetails`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `amenities`
--
ALTER TABLE `amenities`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `complaint`
--
ALTER TABLE `complaint`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `membership`
--
ALTER TABLE `membership`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `notice`
--
ALTER TABLE `notice`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `registration`
--
ALTER TABLE `registration`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `vendordetails`
--
ALTER TABLE `vendordetails`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `membership`
--
ALTER TABLE `membership`
  ADD CONSTRAINT `membership_ibfk_1` FOREIGN KEY (`amenities_id`) REFERENCES `amenities` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `membership_ibfk_2` FOREIGN KEY (`r_id`) REFERENCES `registration` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `profile`
--
ALTER TABLE `profile`
  ADD CONSTRAINT `profile_ibfk_1` FOREIGN KEY (`r_id`) REFERENCES `registration` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
