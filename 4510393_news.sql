-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: fdb1030.awardspace.net
-- Generation Time: Aug 03, 2024 at 11:06 AM
-- Server version: 8.0.32
-- PHP Version: 8.1.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `4510393_news`
--

-- --------------------------------------------------------

--
-- Table structure for table `authors`
--

CREATE TABLE `authors` (
  `author_id` int NOT NULL,
  `author_name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `authors`
--

INSERT INTO `authors` (`author_id`, `author_name`) VALUES
(1, 'Hussain'),
(2, 'Hasan'),
(3, 'Fatima'),
(8, 'jana'),
(13, 'dr mhmad');

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE `images` (
  `image_id` int NOT NULL,
  `image_url` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `news_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `images`
--

INSERT INTO `images` (`image_id`, `image_url`, `news_id`) VALUES
(1, 'http://newsmobile.atwebpages.com/public_html/images/pic1.jpg', 1),
(2, 'http://newsmobile.atwebpages.com/public_html/images/pic2.jpg', 2),
(3, 'http://newsmobile.atwebpages.com/public_html/images/images.png', 3),
(4, 'http://newsmobile.atwebpages.com/public_html/images/pic1.jpg', 4),
(5, 'http://newsmobile.atwebpages.com/public_html/images/pic1.jpg', 5),
(6, 'http://newsmobile.atwebpages.com/public_html/images/pic2.jpg', 6),
(7, 'http://newsmobile.atwebpages.com/public_html/images/images.png', 7),
(8, 'http://newsmobile.atwebpages.com/public_html/images/pic1.jpg', 8),
(9, 'http://newsmobile.atwebpages.com/public_html/images/pic2.jpg', 9);

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `news_id` int NOT NULL,
  `text` text COLLATE utf8mb3_unicode_ci NOT NULL,
  `author_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `news`
--

INSERT INTO `news` (`news_id`, `text`, `author_id`) VALUES
(1, 'News 1 for Hussain', 1),
(2, 'News 2 for Hussain', 1),
(3, 'News 3 for Hussain', 1),
(4, 'News 1 for Hasan', 2),
(5, 'News 2 for Hasan', 2),
(6, 'News 3 for Hasan', 2),
(7, 'News 1 for Fatima', 3),
(8, 'News 2 for Fatima', 3),
(9, 'News 3 for Fatima', 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `authors`
--
ALTER TABLE `authors`
  ADD PRIMARY KEY (`author_id`);

--
-- Indexes for table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`image_id`),
  ADD KEY `news_id` (`news_id`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`news_id`),
  ADD KEY `author_id` (`author_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `authors`
--
ALTER TABLE `authors`
  MODIFY `author_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `images`
--
ALTER TABLE `images`
  MODIFY `image_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `news`
--
ALTER TABLE `news`
  MODIFY `news_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `images`
--
ALTER TABLE `images`
  ADD CONSTRAINT `images_ibfk_1` FOREIGN KEY (`news_id`) REFERENCES `news` (`news_id`);

--
-- Constraints for table `news`
--
ALTER TABLE `news`
  ADD CONSTRAINT `news_ibfk_1` FOREIGN KEY (`author_id`) REFERENCES `authors` (`author_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
