-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 19, 2021 at 07:11 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `codesmashersblog`
--

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `sno` int(11) NOT NULL,
  `name` text NOT NULL,
  `phone_num` int(11) NOT NULL,
  `mes` varchar(1000) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`sno`, `name`, `phone_num`, `mes`, `date`, `email`) VALUES
(1, 'arpit', 94551277, 'hello', '2021-02-16 19:53:58', '111aj@gmail.com'),
(2, 'Arpit Jain', 2147483647, '', '0000-00-00 00:00:00', '111arpit1@gmail.com'),
(3, 'Arpit Jain', 2147483647, 'a', '0000-00-00 00:00:00', '111arpit1@gmail.com'),
(4, 'Arpit Jain', 2147483647, 'q', '0000-00-00 00:00:00', '111arpit1@mail.com'),
(5, 'Arpit Jain', 2147483647, 'aaa', '2021-02-17 10:46:37', 'excelresearchpapers@gmail.com'),
(6, 'Arpit Jain', 2147483647, 'aaaaaaaaaaaaa', '2021-02-17 11:03:31', 'arpit456jain@gmail.com'),
(7, 'Arpit Jain', 2147483647, 'aaaaaaaaaaaaa', '2021-02-17 11:04:10', 'arpit456jain@gmail.com'),
(8, 'Arpit Jain', 2147483647, 'aaaaaaaaaaaaa', '2021-02-17 11:05:23', 'arpit456jain@gmail.com'),
(9, 'Arpit Jain', 2147483647, 'aaaaaaaaaaaaa', '2021-02-17 11:08:51', 'arpit456jain@gmail.com'),
(10, 'Arpit Jain', 2147483647, 'aaaaaaaaaaaaa', '2021-02-17 11:11:15', 'arpit456jain@gmail.com'),
(11, 'Arpit Jain', 2147483647, 'w', '2021-02-17 11:12:06', 'arpit456jain@gmail.com'),
(12, 'Arpit Jain', 2147483647, 'hello', '2021-02-17 11:13:29', '111arpit1@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `sno` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `content` text NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`sno`, `title`, `slug`, `content`, `date`) VALUES
(1, 'first post title', 'first-post2', 'thiiiiiiiiis isss firrrrsssssttttt postttt', '2021-02-16 18:30:00'),
(2, 'second', 'test', 'aaaaaaaaa', '2021-02-19 12:29:13'),
(3, 'assignment', 'test', 'aaaaaaaaa', '2021-02-19 12:29:30'),
(4, 'assignment', 'test', 'aaaaaaaaa', '2021-02-19 12:29:37'),
(5, 'assignment', 'test', 'aaaaaaaaa', '2021-02-19 12:30:10'),
(6, 'wdfw', 'test', 'aaaaaaaaaqq', '2021-02-19 12:37:45');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`sno`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`sno`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `sno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `sno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
