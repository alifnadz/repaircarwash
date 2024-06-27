-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 26, 2024 at 09:45 AM
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
-- Database: `loginsystem`
--

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `booking_id` int(11) NOT NULL,
  `book_status` varchar(255) NOT NULL,
  `book_date` date NOT NULL,
  `serv_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `timeslot_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `service_type` int(11) NOT NULL,
  `date` date NOT NULL,
  `time` varchar(50) NOT NULL,
  `contact` varchar(15) NOT NULL,
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contact_us`
--

CREATE TABLE `contact_us` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `created_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contact_us`
--

INSERT INTO `contact_us` (`id`, `name`, `email`, `subject`, `message`, `created_date`) VALUES
(10, 'Sayapengguna1', 'hanggmana07@gmail.com', '', 'saya suka website ini! boleh berkenalan :)', '0000-00-00 00:00:00'),
(11, 'Hensem', 'njn@gmail.com', '', 'This website loads incredibly fast. It\'s refreshing to not have to wait for pages to load, which makes my browsing experience so much better.', '0000-00-00 00:00:00'),
(13, 'Luqman', 'nasilemakkfc907@gmail.com', '', 'This website is really easy to use!', '0000-00-00 00:00:00'),
(16, 'ali', 'hanggmana907@gmail.com', 'dsdsds', 'ccccccccccccccccccccccccccccccccc', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `if not exists ``users```
--

CREATE TABLE `if not exists ``users``` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `create_datetime – datetime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `service`
--

CREATE TABLE `service` (
  `serv_id` int(11) NOT NULL,
  `serv_type` varchar(255) NOT NULL,
  `serv_price` decimal(10,2) NOT NULL,
  `serv_desc` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `service`
--

INSERT INTO `service` (`serv_id`, `serv_type`, `serv_price`, `serv_desc`) VALUES
(1, 'Normal', 0.00, NULL),
(2, 'Water Wax', 0.00, NULL),
(3, 'Deep Clean', 0.00, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `timeslot`
--

CREATE TABLE `timeslot` (
  `timeslot_id` int(11) NOT NULL,
  `time` varchar(50) NOT NULL,
  `serv_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `timeslot`
--

INSERT INTO `timeslot` (`timeslot_id`, `time`, `serv_id`) VALUES
(17, '09:00 AM - 09:30 AM', NULL),
(18, '09:30 AM - 10:00 AM', NULL),
(19, '10:00 AM - 10:30 AM', NULL),
(20, '10:30 AM - 11:00 AM', NULL),
(21, '11:00 AM - 11:30AM', NULL),
(22, '11:30 AM - 12:00 PM', NULL),
(23, '12:00 PM - 12:30 PM', NULL),
(24, '12:30 PM - 01:00 PM', NULL),
(26, '02:30 PM - 03:00 PM', NULL),
(27, '03:00 PM - 03:30 PM', NULL),
(28, '03:30 PM - 04:00 PM', NULL),
(29, '04:00 PM - 04:30 PM', NULL),
(30, '04:30 PM - 05:00 PM', NULL),
(31, '05:00 PM - 05:30 PM', NULL),
(32, '05:30 PM - 06:00 PM', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `user_phoneNo` int(10) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `name`, `username`, `user_phoneNo`, `email`, `password`) VALUES
(23, 'luqman', 'nurhakim', 163292584, 'hanggmana907@gmail.com', 'abcd1234'),
(24, 'Ahmad', 'Ahmad', 119389405, 'afifsi@gmail.com', '$2y$10$a/sYhsznxvgIKFQ/KA6RhORSWNg/RN6H.huokdBbwFM'),
(25, 'ahmad', 'ahmad', 119389405, 'afifsi@gmail.com', '$2y$10$a/sYhsznxvgIKFQ/KA6RhORSWNg/RN6H.huokdBbwFM'),
(26, 'luq', 'luqman', 163292584, 'hanggmana907@gmail.com', '$2y$10$IL54yuY7Rvq8jwyBgFgZLOW3VOlXucpegWL0XvUxBgl'),
(27, '', 'luqman', 0, 'hanggmana07@gmail.com', 'e19d5cd5af0378da05f63f891c7467af'),
(28, 'Ahmad', 'Ahmad', 163689117, 'hanggmana07@gmail.com', '$2y$10$a89Tsy3qPaa3CtSNg7iwmew7brRJlLvymHphUaou32b'),
(29, 'ali', 'admin', 163292584, 'hanggmana907@gmail.com', '$2y$10$6JwFtHXNhUYvY0cOl4mRkuxmrWrFKkgEbcgSqFsFKAx'),
(30, 'safi', 'safi', 163292584, 'hanggmana907@gmail.com', '$2y$10$YFtf3J3WyAemS50GsN9jK.Wgf9H.rru40JbiNF/ZC7k'),
(31, 'admin', 'admin', 173942527, 'nasilemakkfc907@gmail.com', '$2y$10$Nnn9fI/hS8/4qHq6pfqrPu/R6tI3vyg8tqQabsJNC/K'),
(32, 'luqman nurhakim', 'luqman', 163292584, 'hanggmana907@gmail.com', '$2y$10$SEPSQygLnokLLYNm2FZKf.9rWzrE0mjqfdVUru/SknA');

-- --------------------------------------------------------

--
-- Table structure for table `users_backup`
--

CREATE TABLE `users_backup` (
  `user_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `user_phoneNo` int(10) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users_backup`
--

INSERT INTO `users_backup` (`user_id`, `name`, `username`, `user_phoneNo`, `email`, `password`) VALUES
(1, 'luqman', 'admin', 163292584, 'hanggmana907@gmail.com', '$2y$10$CjW.gBuscX62rUxZ2xetq./0XeePyr7cHHUN1rmfpVJ'),
(2, 'syamil', 'syamil', 163689117, 'j@gmail.com', '$2y$10$2j75iEVCzE05iBHJ3cnIuOgRw8sAFEfDHzaMtuAwMU0'),
(4, 'ali', 'ali', 163292584, 'luqmanrosli907@gmail.com', '$2y$10$eNw874KWVsXSczNLFwUd3.0OE27hXBNnhDADjmfqwv/'),
(5, 'ali', 'ali', 163292584, 'luqmanrosli907@gmail.com', '$2y$10$LyPDAzGYMWlQNW1d21SjbuZvRlxQUEIovN3JFfs7Xoj');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`booking_id`),
  ADD KEY `serv_id` (`serv_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `timeslot_id` (`timeslot_id`);

--
-- Indexes for table `contact_us`
--
ALTER TABLE `contact_us`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `service`
--
ALTER TABLE `service`
  ADD PRIMARY KEY (`serv_id`);

--
-- Indexes for table `timeslot`
--
ALTER TABLE `timeslot`
  ADD PRIMARY KEY (`timeslot_id`),
  ADD KEY `serv_id` (`serv_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `users_backup`
--
ALTER TABLE `users_backup`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contact_us`
--
ALTER TABLE `contact_us`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `users_backup`
--
ALTER TABLE `users_backup`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `booking`
--
ALTER TABLE `booking`
  ADD CONSTRAINT `booking_ibfk_1` FOREIGN KEY (`serv_id`) REFERENCES `service` (`serv_id`),
  ADD CONSTRAINT `booking_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `booking_ibfk_3` FOREIGN KEY (`timeslot_id`) REFERENCES `timeslot` (`timeslot_id`) ON UPDATE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
