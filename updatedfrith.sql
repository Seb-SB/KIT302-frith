-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 16, 2022 at 05:17 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `frith`
--

-- --------------------------------------------------------

--
-- Table structure for table `accountbusinessowner`
--

CREATE TABLE `accountbusinessowner` (
  `BusinessID` int(10) UNSIGNED NOT NULL,
  `StatusID` varchar(32) NOT NULL,
  `PoolID` int(10) UNSIGNED NOT NULL,
  `BusinessName` varchar(255) NOT NULL,
  `ABN` varchar(255) NOT NULL,
  `EmailAddress` varchar(255) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `ManagerFirstName` varchar(32) NOT NULL,
  `ManagerLastName` varchar(32) NOT NULL,
  `PhoneNumber` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `accountbusinessowner`
--

INSERT INTO `accountbusinessowner` (`BusinessID`, `StatusID`, `PoolID`, `BusinessName`, `ABN`, `EmailAddress`, `Password`, `ManagerFirstName`, `ManagerLastName`, `PhoneNumber`) VALUES
(1, 'Approved', 12, 'bussiness1', '1212', '123@mail.com', '122', '1212', '1212', '041111111'),
(12, 'Approved', 12, 'bussiness12', '12121', '456@mail.com', '121212', '12121', '122', '04222222');

-- --------------------------------------------------------

--
-- Table structure for table `accountsecurityfirm`
--

CREATE TABLE `accountsecurityfirm` (
  `FirmID` int(10) UNSIGNED NOT NULL,
  `StatusID` varchar(32) NOT NULL,
  `FirmName` varchar(255) NOT NULL,
  `ABN` varchar(255) NOT NULL,
  `EmailAddress` varchar(255) NOT NULL,
  `PhoneNumber` varchar(20) NOT NULL,
  `ManagerFirstName` varchar(32) NOT NULL,
  `ManagerLastName` varchar(32) NOT NULL,
  `Password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `accountsecurityfirm`
--

INSERT INTO `accountsecurityfirm` (`FirmID`, `StatusID`, `FirmName`, `ABN`, `EmailAddress`, `PhoneNumber`, `ManagerFirstName`, `ManagerLastName`, `Password`) VALUES
(1, 'Approved', '12', '12', '12', '12', '12', '12', '12');

-- --------------------------------------------------------

--
-- Table structure for table `accountsecurityguard`
--

CREATE TABLE `accountsecurityguard` (
  `GuardKey` varchar(32) NOT NULL,
  `FirstName` varchar(32) NOT NULL,
  `LastName` varchar(32) NOT NULL,
  `PhoneNumber` varchar(20) NOT NULL,
  `EmailAddress` varchar(255) NOT NULL,
  `Password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `accountsecurityguard`
--

INSERT INTO `accountsecurityguard` (`GuardKey`, `FirstName`, `LastName`, `PhoneNumber`, `EmailAddress`, `Password`) VALUES
('12', '12', '12', '12', '12', '12');

-- --------------------------------------------------------

--
-- Table structure for table `accountsystemadministrator`
--

CREATE TABLE `accountsystemadministrator` (
  `AdministratorID` int(10) UNSIGNED NOT NULL,
  `EmailAddress` varchar(255) NOT NULL,
  `Password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `accountsystemadministrator`
--

INSERT INTO `accountsystemadministrator` (`AdministratorID`, `EmailAddress`, `Password`) VALUES
(1, 'admin@projectfrith.com.au', '123456');

-- --------------------------------------------------------

--
-- Table structure for table `creationstatus`
--

CREATE TABLE `creationstatus` (
  `StatusID` varchar(32) NOT NULL,
  `Colour` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `creationstatus`
--

INSERT INTO `creationstatus` (`StatusID`, `Colour`) VALUES
('Approved', '#46eb34'),
('Pending', '#eb8334'),
('Rejected', '#eb3a34');

-- --------------------------------------------------------

--
-- Table structure for table `eventdetails`
--

CREATE TABLE `eventdetails` (
  `EventID` int(10) UNSIGNED NOT NULL,
  `BusinessID` int(10) UNSIGNED NOT NULL,
  `LevelID` varchar(1) NOT NULL,
  `TimeSubmitted` datetime NOT NULL,
  `EventTitle` varchar(255) NOT NULL,
  `NumPerpetrators` int(10) NOT NULL,
  `Description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `firmuniquekey`
--

CREATE TABLE `firmuniquekey` (
  `GuardKey` varchar(32) NOT NULL,
  `FirmID` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `firmuniquekey`
--

INSERT INTO `firmuniquekey` (`GuardKey`, `FirmID`) VALUES
('12', 1);

-- --------------------------------------------------------

--
-- Table structure for table `guardablearea`
--

CREATE TABLE `guardablearea` (
  `AreaID` int(10) UNSIGNED NOT NULL,
  `BusinessID` int(10) UNSIGNED NOT NULL,
  `AreaName` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `guardablearea`
--

INSERT INTO `guardablearea` (`AreaID`, `BusinessID`, `AreaName`) VALUES
(1, 12, 'area1(business12)'),
(3, 1, 'area3(business1)'),
(12, 1, 'area12(business1)');

-- --------------------------------------------------------

--
-- Table structure for table `incidentreport`
--

CREATE TABLE `incidentreport` (
  `ReportID` int(10) UNSIGNED NOT NULL,
  `GuardKey` varchar(32) NOT NULL,
  `BusinessID` int(10) UNSIGNED NOT NULL,
  `TimeSubmitted` datetime NOT NULL,
  `IncidentType` varchar(60) NOT NULL,
  `SpecificArea` varchar(60) NOT NULL,
  `Description` varchar(255) NOT NULL,
  `PartiesInvolved` varchar(255) NOT NULL,
  `Witnesses` varchar(255) NOT NULL,
  `ReportFiled` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `informationpool`
--

CREATE TABLE `informationpool` (
  `PoolID` int(10) UNSIGNED NOT NULL,
  `PoolName` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `informationpool`
--

INSERT INTO `informationpool` (`PoolID`, `PoolName`) VALUES
(12, '121212');

-- --------------------------------------------------------

--
-- Table structure for table `severitylevel`
--

CREATE TABLE `severitylevel` (
  `LevelID` varchar(1) NOT NULL,
  `Severity` varchar(32) NOT NULL,
  `Colour` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `severitylevel`
--

INSERT INTO `severitylevel` (`LevelID`, `Severity`, `Colour`) VALUES
('D', 'Danger', '#262424'),
('H', 'High', '#eb4034'),
('I', 'Informative', '#3489eb'),
('L', 'Low', '#ebc934'),
('M', 'Medium', '#eb9334');

-- --------------------------------------------------------

--
-- Table structure for table `shiftdetails`
--

CREATE TABLE `shiftdetails` (
  `ShiftID` int(10) UNSIGNED NOT NULL,
  `GuardKey` varchar(32) NOT NULL,
  `BusinessID` int(10) UNSIGNED NOT NULL,
  `AreaID` int(10) UNSIGNED NOT NULL,
  `TimeStarted` varchar(20) NOT NULL,
  `Status` int(255) DEFAULT NULL,
  `TimeFinished` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `shiftdetails`
--

INSERT INTO `shiftdetails` (`ShiftID`, `GuardKey`, `BusinessID`, `AreaID`, `TimeStarted`, `Status`, `TimeFinished`) VALUES
(12, '12', 12, 1, '16Sep,2022 12:59:54', 0, '16Sep,2022 13:11:35'),
(122, '12', 1, 3, '16Sep,2022 12:59:49', 0, '16Sep,2022 13:11:30');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accountbusinessowner`
--
ALTER TABLE `accountbusinessowner`
  ADD PRIMARY KEY (`BusinessID`) USING BTREE,
  ADD UNIQUE KEY `EmailAddress` (`EmailAddress`) USING BTREE,
  ADD UNIQUE KEY `ABN` (`ABN`) USING BTREE,
  ADD KEY `StatusID` (`StatusID`) USING BTREE,
  ADD KEY `PoolID` (`PoolID`) USING BTREE;

--
-- Indexes for table `accountsecurityfirm`
--
ALTER TABLE `accountsecurityfirm`
  ADD PRIMARY KEY (`FirmID`) USING BTREE,
  ADD UNIQUE KEY `EmailAddress` (`EmailAddress`) USING BTREE,
  ADD UNIQUE KEY `ABN` (`ABN`) USING BTREE,
  ADD KEY `StatusID` (`StatusID`) USING BTREE;

--
-- Indexes for table `accountsecurityguard`
--
ALTER TABLE `accountsecurityguard`
  ADD PRIMARY KEY (`GuardKey`) USING BTREE,
  ADD UNIQUE KEY `EmailAddress` (`EmailAddress`) USING BTREE;

--
-- Indexes for table `accountsystemadministrator`
--
ALTER TABLE `accountsystemadministrator`
  ADD PRIMARY KEY (`AdministratorID`) USING BTREE,
  ADD UNIQUE KEY `EmailAddress` (`EmailAddress`) USING BTREE;

--
-- Indexes for table `creationstatus`
--
ALTER TABLE `creationstatus`
  ADD PRIMARY KEY (`StatusID`) USING BTREE;

--
-- Indexes for table `eventdetails`
--
ALTER TABLE `eventdetails`
  ADD PRIMARY KEY (`EventID`) USING BTREE,
  ADD KEY `BusinessID` (`BusinessID`) USING BTREE,
  ADD KEY `LevelID` (`LevelID`) USING BTREE;

--
-- Indexes for table `firmuniquekey`
--
ALTER TABLE `firmuniquekey`
  ADD PRIMARY KEY (`GuardKey`) USING BTREE,
  ADD UNIQUE KEY `GuardKey` (`GuardKey`) USING BTREE,
  ADD KEY `FirmID` (`FirmID`) USING BTREE;

--
-- Indexes for table `guardablearea`
--
ALTER TABLE `guardablearea`
  ADD PRIMARY KEY (`AreaID`) USING BTREE,
  ADD KEY `BusinessID` (`BusinessID`) USING BTREE;

--
-- Indexes for table `incidentreport`
--
ALTER TABLE `incidentreport`
  ADD PRIMARY KEY (`ReportID`) USING BTREE,
  ADD KEY `GuardKey` (`GuardKey`) USING BTREE,
  ADD KEY `BusinessID` (`BusinessID`) USING BTREE;

--
-- Indexes for table `informationpool`
--
ALTER TABLE `informationpool`
  ADD PRIMARY KEY (`PoolID`) USING BTREE;

--
-- Indexes for table `severitylevel`
--
ALTER TABLE `severitylevel`
  ADD PRIMARY KEY (`LevelID`) USING BTREE;

--
-- Indexes for table `shiftdetails`
--
ALTER TABLE `shiftdetails`
  ADD PRIMARY KEY (`ShiftID`) USING BTREE,
  ADD KEY `GuardKey` (`GuardKey`) USING BTREE,
  ADD KEY `BusinessID` (`BusinessID`) USING BTREE,
  ADD KEY `AreaID` (`AreaID`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accountbusinessowner`
--
ALTER TABLE `accountbusinessowner`
  MODIFY `BusinessID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `accountsecurityfirm`
--
ALTER TABLE `accountsecurityfirm`
  MODIFY `FirmID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `accountsystemadministrator`
--
ALTER TABLE `accountsystemadministrator`
  MODIFY `AdministratorID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `eventdetails`
--
ALTER TABLE `eventdetails`
  MODIFY `EventID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `guardablearea`
--
ALTER TABLE `guardablearea`
  MODIFY `AreaID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `incidentreport`
--
ALTER TABLE `incidentreport`
  MODIFY `ReportID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `informationpool`
--
ALTER TABLE `informationpool`
  MODIFY `PoolID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `shiftdetails`
--
ALTER TABLE `shiftdetails`
  MODIFY `ShiftID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=123;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `accountbusinessowner`
--
ALTER TABLE `accountbusinessowner`
  ADD CONSTRAINT `accountbusinessowner_ibfk_1` FOREIGN KEY (`StatusID`) REFERENCES `creationstatus` (`StatusID`),
  ADD CONSTRAINT `accountbusinessowner_ibfk_2` FOREIGN KEY (`PoolID`) REFERENCES `informationpool` (`PoolID`);

--
-- Constraints for table `accountsecurityfirm`
--
ALTER TABLE `accountsecurityfirm`
  ADD CONSTRAINT `accountsecurityfirm_ibfk_1` FOREIGN KEY (`StatusID`) REFERENCES `creationstatus` (`StatusID`);

--
-- Constraints for table `accountsecurityguard`
--
ALTER TABLE `accountsecurityguard`
  ADD CONSTRAINT `accountsecurityguard_ibfk_1` FOREIGN KEY (`GuardKey`) REFERENCES `firmuniquekey` (`GuardKey`);

--
-- Constraints for table `eventdetails`
--
ALTER TABLE `eventdetails`
  ADD CONSTRAINT `eventdetails_ibfk_1` FOREIGN KEY (`BusinessID`) REFERENCES `accountbusinessowner` (`BusinessID`),
  ADD CONSTRAINT `eventdetails_ibfk_2` FOREIGN KEY (`LevelID`) REFERENCES `severitylevel` (`LevelID`);

--
-- Constraints for table `firmuniquekey`
--
ALTER TABLE `firmuniquekey`
  ADD CONSTRAINT `firmuniquekey_ibfk_1` FOREIGN KEY (`FirmID`) REFERENCES `accountsecurityfirm` (`FirmID`);

--
-- Constraints for table `guardablearea`
--
ALTER TABLE `guardablearea`
  ADD CONSTRAINT `guardablearea_ibfk_1` FOREIGN KEY (`BusinessID`) REFERENCES `accountbusinessowner` (`BusinessID`);

--
-- Constraints for table `incidentreport`
--
ALTER TABLE `incidentreport`
  ADD CONSTRAINT `incidentreport_ibfk_1` FOREIGN KEY (`GuardKey`) REFERENCES `accountsecurityguard` (`GuardKey`),
  ADD CONSTRAINT `incidentreport_ibfk_2` FOREIGN KEY (`BusinessID`) REFERENCES `accountbusinessowner` (`BusinessID`);

--
-- Constraints for table `shiftdetails`
--
ALTER TABLE `shiftdetails`
  ADD CONSTRAINT `shiftdetails_ibfk_1` FOREIGN KEY (`GuardKey`) REFERENCES `accountsecurityguard` (`GuardKey`),
  ADD CONSTRAINT `shiftdetails_ibfk_2` FOREIGN KEY (`BusinessID`) REFERENCES `accountbusinessowner` (`BusinessID`),
  ADD CONSTRAINT `shiftdetails_ibfk_3` FOREIGN KEY (`AreaID`) REFERENCES `guardablearea` (`AreaID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
