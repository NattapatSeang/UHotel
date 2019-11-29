-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 29, 2019 at 05:39 PM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `uhoteldb`
--

-- --------------------------------------------------------

--
-- Table structure for table `abouthotel`
--

CREATE TABLE `abouthotel` (
  `popularity` text COLLATE utf8_unicode_ci NOT NULL,
  `slogan` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `location` text COLLATE utf8_unicode_ci NOT NULL,
  `address` text COLLATE utf8_unicode_ci NOT NULL,
  `pictureID` int(11) NOT NULL,
  `email` text COLLATE utf8_unicode_ci NOT NULL,
  `telephone` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `category` varchar(32) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `departmentID` int(11) NOT NULL,
  `departmentName` text COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `event`
--

CREATE TABLE `event` (
  `eventID` int(11) NOT NULL,
  `eventName` text COLLATE utf8_unicode_ci NOT NULL,
  `pictureID` int(11) NOT NULL,
  `roomID` int(10) NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `startDateTime` datetime NOT NULL,
  `endDateTime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `facilities`
--

CREATE TABLE `facilities` (
  `name` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `pictureID` int(11) NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `picturegallery`
--

CREATE TABLE `picturegallery` (
  `pictureID` int(11) NOT NULL,
  `name` text COLLATE utf8_unicode_ci NOT NULL,
  `picture` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `picturetag`
--

CREATE TABLE `picturetag` (
  `pictureID` int(11) NOT NULL,
  `category` varchar(32) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `position`
--

CREATE TABLE `position` (
  `positionID` int(11) NOT NULL,
  `departmentID` int(11) NOT NULL,
  `positionName` text COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `pictureID` int(11) NOT NULL,
  `requirement` text COLLATE utf8_unicode_ci NOT NULL,
  `employmentType` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `positionrequire`
--

CREATE TABLE `positionrequire` (
  `positionID` int(11) NOT NULL,
  `announceDate` datetime NOT NULL,
  `closeDate` datetime NOT NULL,
  `stillAccept` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `promotion`
--

CREATE TABLE `promotion` (
  `promotionID` int(11) NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `pictureID` int(11) NOT NULL,
  `code` text COLLATE utf8_unicode_ci NOT NULL,
  `isPrivate` tinyint(4) NOT NULL,
  `startDateTime` datetime NOT NULL,
  `endDateTime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reservation`
--

CREATE TABLE `reservation` (
  `roomNo` int(11) NOT NULL,
  `reserveDateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `startDate` datetime NOT NULL,
  `endDate` datetime NOT NULL,
  `userID` int(11) NOT NULL,
  `promotionID` int(11) NOT NULL,
  `reservationStatus` tinyint(4) NOT NULL COMMENT '0 notCom, 1 Com',
  `customerAmount` int(11) NOT NULL,
  `isReservationDesk` tinyint(4) NOT NULL,
  `customerName` text COLLATE utf8_unicode_ci NOT NULL,
  `address` text COLLATE utf8_unicode_ci NOT NULL,
  `customerEmail` text COLLATE utf8_unicode_ci NOT NULL,
  `customerTel` text COLLATE utf8_unicode_ci NOT NULL,
  `specialRequest` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `review`
--

CREATE TABLE `review` (
  `userID` int(11) NOT NULL,
  `roomTypeName` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `review` text COLLATE utf8_unicode_ci NOT NULL,
  `reviewScore` tinyint(4) NOT NULL,
  `dateTime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `room`
--

CREATE TABLE `room` (
  `roomNo` int(11) NOT NULL,
  `roomTypeName` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL COMMENT '-1 out, 0 notAvai, 1 Avai'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roomtype`
--

CREATE TABLE `roomtype` (
  `roomTypeName` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `price` int(11) NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `pictureID` int(11) NOT NULL,
  `numberofBed` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `userID` int(11) NOT NULL,
  `password` text COLLATE utf8_unicode_ci NOT NULL,
  `fName` text COLLATE utf8_unicode_ci NOT NULL,
  `lName` text COLLATE utf8_unicode_ci NOT NULL,
  `email` text COLLATE utf8_unicode_ci NOT NULL,
  `phoneNo` text COLLATE utf8_unicode_ci NOT NULL,
  `isAdmin` tinyint(4) NOT NULL DEFAULT '-1' COMMENT '-1 is Cus, 0 Staff'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `abouthotel`
--
ALTER TABLE `abouthotel`
  ADD PRIMARY KEY (`slogan`),
  ADD KEY `pictureID` (`pictureID`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`departmentID`);

--
-- Indexes for table `event`
--
ALTER TABLE `event`
  ADD PRIMARY KEY (`eventID`),
  ADD KEY `pictureID` (`pictureID`),
  ADD KEY `roomID` (`roomID`);

--
-- Indexes for table `facilities`
--
ALTER TABLE `facilities`
  ADD PRIMARY KEY (`name`),
  ADD KEY `pictureID` (`pictureID`);

--
-- Indexes for table `picturegallery`
--
ALTER TABLE `picturegallery`
  ADD PRIMARY KEY (`pictureID`);

--
-- Indexes for table `picturetag`
--
ALTER TABLE `picturetag`
  ADD PRIMARY KEY (`category`,`pictureID`),
  ADD KEY `pictureID` (`pictureID`);

--
-- Indexes for table `position`
--
ALTER TABLE `position`
  ADD PRIMARY KEY (`positionID`),
  ADD KEY `pictureID` (`pictureID`),
  ADD KEY `departmentID` (`departmentID`);

--
-- Indexes for table `positionrequire`
--
ALTER TABLE `positionrequire`
  ADD PRIMARY KEY (`positionID`,`announceDate`);

--
-- Indexes for table `promotion`
--
ALTER TABLE `promotion`
  ADD PRIMARY KEY (`promotionID`),
  ADD KEY `pictureID` (`pictureID`);

--
-- Indexes for table `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`roomNo`,`reserveDateTime`),
  ADD KEY `userID` (`userID`),
  ADD KEY `promotionID` (`promotionID`);

--
-- Indexes for table `review`
--
ALTER TABLE `review`
  ADD PRIMARY KEY (`userID`,`roomTypeName`),
  ADD KEY `roomTypeName` (`roomTypeName`);

--
-- Indexes for table `room`
--
ALTER TABLE `room`
  ADD PRIMARY KEY (`roomNo`),
  ADD KEY `roomTypeName` (`roomTypeName`);

--
-- Indexes for table `roomtype`
--
ALTER TABLE `roomtype`
  ADD PRIMARY KEY (`roomTypeName`),
  ADD KEY `pictureID` (`pictureID`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`userID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `departmentID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `event`
--
ALTER TABLE `event`
  MODIFY `eventID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `picturegallery`
--
ALTER TABLE `picturegallery`
  MODIFY `pictureID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `position`
--
ALTER TABLE `position`
  MODIFY `positionID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `promotion`
--
ALTER TABLE `promotion`
  MODIFY `promotionID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `userID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `abouthotel`
--
ALTER TABLE `abouthotel`
  ADD CONSTRAINT `abouthotel_ibfk_1` FOREIGN KEY (`pictureID`) REFERENCES `picturegallery` (`pictureID`);

--
-- Constraints for table `event`
--
ALTER TABLE `event`
  ADD CONSTRAINT `event_ibfk_1` FOREIGN KEY (`pictureID`) REFERENCES `picturegallery` (`pictureID`),
  ADD CONSTRAINT `event_ibfk_2` FOREIGN KEY (`roomID`) REFERENCES `room` (`roomNo`);

--
-- Constraints for table `facilities`
--
ALTER TABLE `facilities`
  ADD CONSTRAINT `facilities_ibfk_1` FOREIGN KEY (`pictureID`) REFERENCES `picturegallery` (`pictureID`);

--
-- Constraints for table `picturetag`
--
ALTER TABLE `picturetag`
  ADD CONSTRAINT `picturetag_ibfk_1` FOREIGN KEY (`pictureID`) REFERENCES `picturegallery` (`pictureID`),
  ADD CONSTRAINT `picturetag_ibfk_2` FOREIGN KEY (`category`) REFERENCES `category` (`category`);

--
-- Constraints for table `position`
--
ALTER TABLE `position`
  ADD CONSTRAINT `position_ibfk_1` FOREIGN KEY (`pictureID`) REFERENCES `picturegallery` (`pictureID`),
  ADD CONSTRAINT `position_ibfk_2` FOREIGN KEY (`departmentID`) REFERENCES `department` (`departmentID`);

--
-- Constraints for table `positionrequire`
--
ALTER TABLE `positionrequire`
  ADD CONSTRAINT `positionrequire_ibfk_1` FOREIGN KEY (`positionID`) REFERENCES `position` (`positionID`);

--
-- Constraints for table `promotion`
--
ALTER TABLE `promotion`
  ADD CONSTRAINT `promotion_ibfk_1` FOREIGN KEY (`pictureID`) REFERENCES `picturegallery` (`pictureID`);

--
-- Constraints for table `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`roomNo`) REFERENCES `room` (`roomNo`),
  ADD CONSTRAINT `reservation_ibfk_2` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`),
  ADD CONSTRAINT `reservation_ibfk_3` FOREIGN KEY (`promotionID`) REFERENCES `promotion` (`promotionID`);

--
-- Constraints for table `review`
--
ALTER TABLE `review`
  ADD CONSTRAINT `review_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`),
  ADD CONSTRAINT `review_ibfk_2` FOREIGN KEY (`roomTypeName`) REFERENCES `roomtype` (`roomTypeName`);

--
-- Constraints for table `room`
--
ALTER TABLE `room`
  ADD CONSTRAINT `room_ibfk_1` FOREIGN KEY (`roomTypeName`) REFERENCES `roomtype` (`roomTypeName`);

--
-- Constraints for table `roomtype`
--
ALTER TABLE `roomtype`
  ADD CONSTRAINT `roomtype_ibfk_1` FOREIGN KEY (`pictureID`) REFERENCES `picturegallery` (`pictureID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
