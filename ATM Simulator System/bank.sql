-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 30, 2021 at 08:08 AM
-- Server version: 10.4.16-MariaDB
-- PHP Version: 7.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bank`
--

-- --------------------------------------------------------

--
-- Table structure for table `bankacc`
--

CREATE TABLE `bankacc` (
  `pin` varchar(6) NOT NULL,
  `deposit` varchar(15) NOT NULL,
  `withdraw` varchar(15) DEFAULT NULL,
  `balance` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bankacc`
--

INSERT INTO `bankacc` (`pin`, `deposit`, `withdraw`, `balance`) VALUES
('1000', '1000.0', NULL, '1000.0'),
('1000', '2000.0', NULL, '1000.0'),
('1000', '4000.0', NULL, '5000.0'),
('1000', '3333.0', NULL, '8333.0'),
('1000', '0.0', '1000.0', '7333.0');

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `cardno` varchar(16) NOT NULL,
  `pin` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`cardno`, `pin`) VALUES
('5040935967804699', '1000');

-- --------------------------------------------------------

--
-- Table structure for table `signup`
--

CREATE TABLE `signup` (
  `name` varchar(20) NOT NULL,
  `fname` varchar(20) NOT NULL,
  `date` varchar(6) NOT NULL,
  `month` varchar(12) NOT NULL,
  `year` varchar(6) NOT NULL,
  `gender` varchar(12) NOT NULL,
  `email` varchar(25) NOT NULL,
  `marital` varchar(10) NOT NULL,
  `address` varchar(50) NOT NULL,
  `city` varchar(20) NOT NULL,
  `pincode` varchar(10) NOT NULL,
  `state` varchar(20) NOT NULL,
  `formno` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `signup`
--

INSERT INTO `signup` (`name`, `fname`, `date`, `month`, `year`, `gender`, `email`, `marital`, `address`, `city`, `pincode`, `state`, `formno`) VALUES
('gani', 'mani', '1', 'January', '1990', 'Male', 'gani@gmail.com', 'Married', 'goa', 'goa', '403613', 'goa', '6985');

-- --------------------------------------------------------

--
-- Table structure for table `signup2`
--

CREATE TABLE `signup2` (
  `formno` varchar(12) NOT NULL,
  `religion` varchar(15) NOT NULL,
  `category` varchar(15) NOT NULL,
  `income` varchar(10) NOT NULL,
  `education` varchar(15) NOT NULL,
  `occupation` varchar(15) NOT NULL,
  `cnicno` varchar(15) NOT NULL,
  `bisp` varchar(20) NOT NULL,
  `senior` varchar(5) NOT NULL,
  `existing` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `signup2`
--

INSERT INTO `signup2` (`formno`, `religion`, `category`, `income`, `education`, `occupation`, `cnicno`, `bisp`, `senior`, `existing`) VALUES
('6985', 'Hindu', 'OBC', '<2,50,000', 'Graduate', 'Salaried', 'ch32', '316', 'No', 'No');

-- --------------------------------------------------------

--
-- Table structure for table `signup3`
--

CREATE TABLE `signup3` (
  `account` varchar(30) NOT NULL,
  `cardno` varchar(25) NOT NULL,
  `pin` varchar(15) NOT NULL,
  `service_required` varchar(100) NOT NULL,
  `formno` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `signup3`
--

INSERT INTO `signup3` (`account`, `cardno`, `pin`, `service_required`, `formno`) VALUES
('Saving Account', '5040935967804699', '1000', ' ATM Card', '6985');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bankacc`
--
ALTER TABLE `bankacc`
  ADD KEY `pin_2` (`pin`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD KEY `pin_3` (`pin`);

--
-- Indexes for table `signup`
--
ALTER TABLE `signup`
  ADD PRIMARY KEY (`formno`);

--
-- Indexes for table `signup2`
--
ALTER TABLE `signup2`
  ADD KEY `formno1` (`formno`);

--
-- Indexes for table `signup3`
--
ALTER TABLE `signup3`
  ADD PRIMARY KEY (`pin`),
  ADD KEY `formno2` (`formno`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bankacc`
--
ALTER TABLE `bankacc`
  ADD CONSTRAINT `pin_2` FOREIGN KEY (`pin`) REFERENCES `signup3` (`pin`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `login`
--
ALTER TABLE `login`
  ADD CONSTRAINT `pin_3` FOREIGN KEY (`pin`) REFERENCES `signup3` (`pin`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `signup2`
--
ALTER TABLE `signup2`
  ADD CONSTRAINT `formno1` FOREIGN KEY (`formno`) REFERENCES `signup` (`formno`);

--
-- Constraints for table `signup3`
--
ALTER TABLE `signup3`
  ADD CONSTRAINT `formno2` FOREIGN KEY (`formno`) REFERENCES `signup` (`formno`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
