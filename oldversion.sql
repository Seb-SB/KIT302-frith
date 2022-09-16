/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 50728
 Source Host           : localhost:3306
 Source Schema         : frith

 Target Server Type    : MySQL
 Target Server Version : 50728
 File Encoding         : 65001

 Date: 22/08/2022 23:43:05
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for accountbusinessowner
-- ----------------------------
DROP TABLE IF EXISTS `accountbusinessowner`;
CREATE TABLE `accountbusinessowner`  (
  `BusinessID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `StatusID` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `PoolID` int(10) UNSIGNED NOT NULL,
  `BusinessName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ABN` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `EmailAddress` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ManagerFirstName` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ManagerLastName` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `PhoneNumber` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`BusinessID`) USING BTREE,
  UNIQUE INDEX `EmailAddress`(`EmailAddress`) USING BTREE,
  UNIQUE INDEX `ABN`(`ABN`) USING BTREE,
  INDEX `StatusID`(`StatusID`) USING BTREE,
  INDEX `PoolID`(`PoolID`) USING BTREE,
  CONSTRAINT `accountbusinessowner_ibfk_1` FOREIGN KEY (`StatusID`) REFERENCES `creationstatus` (`StatusID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `accountbusinessowner_ibfk_2` FOREIGN KEY (`PoolID`) REFERENCES `informationpool` (`PoolID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of accountbusinessowner
-- ----------------------------
INSERT INTO `accountbusinessowner` VALUES (1, 'Approved', 12, 'bussiness1', '1212', '212', '122', '1212', '1212', '1212');
INSERT INTO `accountbusinessowner` VALUES (12, 'Approved', 12, 'bussiness2', '12121', '121212', '121212', '12121', '122', '121212');

-- ----------------------------
-- Table structure for accountsecurityfirm
-- ----------------------------
DROP TABLE IF EXISTS `accountsecurityfirm`;
CREATE TABLE `accountsecurityfirm`  (
  `FirmID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `StatusID` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `FirmName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ABN` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `EmailAddress` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `PhoneNumber` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ManagerFirstName` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ManagerLastName` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`FirmID`) USING BTREE,
  UNIQUE INDEX `EmailAddress`(`EmailAddress`) USING BTREE,
  UNIQUE INDEX `ABN`(`ABN`) USING BTREE,
  INDEX `StatusID`(`StatusID`) USING BTREE,
  CONSTRAINT `accountsecurityfirm_ibfk_1` FOREIGN KEY (`StatusID`) REFERENCES `creationstatus` (`StatusID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of accountsecurityfirm
-- ----------------------------
INSERT INTO `accountsecurityfirm` VALUES (1, 'Approved', '12', '12', '12', '12', '12', '12', '12');

-- ----------------------------
-- Table structure for accountsecurityguard
-- ----------------------------
DROP TABLE IF EXISTS `accountsecurityguard`;
CREATE TABLE `accountsecurityguard`  (
  `GuardKey` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `FirstName` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `LastName` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `PhoneNumber` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `EmailAddress` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`GuardKey`) USING BTREE,
  UNIQUE INDEX `EmailAddress`(`EmailAddress`) USING BTREE,
  CONSTRAINT `accountsecurityguard_ibfk_1` FOREIGN KEY (`GuardKey`) REFERENCES `firmuniquekey` (`GuardKey`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of accountsecurityguard
-- ----------------------------
INSERT INTO `accountsecurityguard` VALUES ('12', '12', '12', '12', '12', '12');

-- ----------------------------
-- Table structure for accountsystemadministrator
-- ----------------------------
DROP TABLE IF EXISTS `accountsystemadministrator`;
CREATE TABLE `accountsystemadministrator`  (
  `AdministratorID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `EmailAddress` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`AdministratorID`) USING BTREE,
  UNIQUE INDEX `EmailAddress`(`EmailAddress`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of accountsystemadministrator
-- ----------------------------
INSERT INTO `accountsystemadministrator` VALUES (1, 'admin@projectfrith.com.au', '123456');

-- ----------------------------
-- Table structure for creationstatus
-- ----------------------------
DROP TABLE IF EXISTS `creationstatus`;
CREATE TABLE `creationstatus`  (
  `StatusID` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Colour` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`StatusID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of creationstatus
-- ----------------------------
INSERT INTO `creationstatus` VALUES ('Approved', '#46eb34');
INSERT INTO `creationstatus` VALUES ('Pending', '#eb8334');
INSERT INTO `creationstatus` VALUES ('Rejected', '#eb3a34');

-- ----------------------------
-- Table structure for eventdetails
-- ----------------------------
DROP TABLE IF EXISTS `eventdetails`;
CREATE TABLE `eventdetails`  (
  `EventID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `BusinessID` int(10) UNSIGNED NOT NULL,
  `LevelID` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `TimeSubmitted` datetime(0) NOT NULL,
  `EventTitle` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `NumPerpetrators` int(10) NOT NULL,
  `Description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`EventID`) USING BTREE,
  INDEX `BusinessID`(`BusinessID`) USING BTREE,
  INDEX `LevelID`(`LevelID`) USING BTREE,
  CONSTRAINT `eventdetails_ibfk_1` FOREIGN KEY (`BusinessID`) REFERENCES `accountbusinessowner` (`BusinessID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `eventdetails_ibfk_2` FOREIGN KEY (`LevelID`) REFERENCES `severitylevel` (`LevelID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for firmuniquekey
-- ----------------------------
DROP TABLE IF EXISTS `firmuniquekey`;
CREATE TABLE `firmuniquekey`  (
  `GuardKey` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `FirmID` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`GuardKey`) USING BTREE,
  UNIQUE INDEX `GuardKey`(`GuardKey`) USING BTREE,
  INDEX `FirmID`(`FirmID`) USING BTREE,
  CONSTRAINT `firmuniquekey_ibfk_1` FOREIGN KEY (`FirmID`) REFERENCES `accountsecurityfirm` (`FirmID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of firmuniquekey
-- ----------------------------
INSERT INTO `firmuniquekey` VALUES ('12', 1);

-- ----------------------------
-- Table structure for guardablearea
-- ----------------------------
DROP TABLE IF EXISTS `guardablearea`;
CREATE TABLE `guardablearea`  (
  `AreaID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `BusinessID` int(10) UNSIGNED NOT NULL,
  `AreaName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`AreaID`) USING BTREE,
  INDEX `BusinessID`(`BusinessID`) USING BTREE,
  CONSTRAINT `guardablearea_ibfk_1` FOREIGN KEY (`BusinessID`) REFERENCES `accountbusinessowner` (`BusinessID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of guardablearea
-- ----------------------------
INSERT INTO `guardablearea` VALUES (1, 12, 'area2');
INSERT INTO `guardablearea` VALUES (3, 1, 'area3');
INSERT INTO `guardablearea` VALUES (12, 1, 'area1');

-- ----------------------------
-- Table structure for incidentreport
-- ----------------------------
DROP TABLE IF EXISTS `incidentreport`;
CREATE TABLE `incidentreport`  (
  `ReportID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `GuardKey` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `BusinessID` int(10) UNSIGNED NOT NULL,
  `TimeSubmitted` datetime(0) NOT NULL,
  `IncidentType` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `SpecificArea` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `PartiesInvolved` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Witnesses` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ReportFiled` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`ReportID`) USING BTREE,
  INDEX `GuardKey`(`GuardKey`) USING BTREE,
  INDEX `BusinessID`(`BusinessID`) USING BTREE,
  CONSTRAINT `incidentreport_ibfk_1` FOREIGN KEY (`GuardKey`) REFERENCES `accountsecurityguard` (`GuardKey`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `incidentreport_ibfk_2` FOREIGN KEY (`BusinessID`) REFERENCES `accountbusinessowner` (`BusinessID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for informationpool
-- ----------------------------
DROP TABLE IF EXISTS `informationpool`;
CREATE TABLE `informationpool`  (
  `PoolID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `PoolName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`PoolID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of informationpool
-- ----------------------------
INSERT INTO `informationpool` VALUES (12, '121212');

-- ----------------------------
-- Table structure for severitylevel
-- ----------------------------
DROP TABLE IF EXISTS `severitylevel`;
CREATE TABLE `severitylevel`  (
  `LevelID` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Severity` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Colour` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`LevelID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of severitylevel
-- ----------------------------
INSERT INTO `severitylevel` VALUES ('D', 'Danger', '#262424');
INSERT INTO `severitylevel` VALUES ('H', 'High', '#eb4034');
INSERT INTO `severitylevel` VALUES ('I', 'Informative', '#3489eb');
INSERT INTO `severitylevel` VALUES ('L', 'Low', '#ebc934');
INSERT INTO `severitylevel` VALUES ('M', 'Medium', '#eb9334');

-- ----------------------------
-- Table structure for shiftdetails
-- ----------------------------
DROP TABLE IF EXISTS `shiftdetails`;
CREATE TABLE `shiftdetails`  (
  `ShiftID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `GuardKey` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `BusinessID` int(10) UNSIGNED NOT NULL,
  `AreaID` int(10) UNSIGNED NOT NULL,
  `TimeStarted` datetime(0) NOT NULL,
  `status` int(255) NULL DEFAULT NULL,
  PRIMARY KEY (`ShiftID`) USING BTREE,
  INDEX `GuardKey`(`GuardKey`) USING BTREE,
  INDEX `BusinessID`(`BusinessID`) USING BTREE,
  INDEX `AreaID`(`AreaID`) USING BTREE,
  CONSTRAINT `shiftdetails_ibfk_1` FOREIGN KEY (`GuardKey`) REFERENCES `accountsecurityguard` (`GuardKey`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `shiftdetails_ibfk_2` FOREIGN KEY (`BusinessID`) REFERENCES `accountbusinessowner` (`BusinessID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `shiftdetails_ibfk_3` FOREIGN KEY (`AreaID`) REFERENCES `guardablearea` (`AreaID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 123 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of shiftdetails
-- ----------------------------
INSERT INTO `shiftdetails` VALUES (12, '12', 1, 1, '2022-08-22 02:07:59', 0);
INSERT INTO `shiftdetails` VALUES (122, '12', 12, 3, '2022-08-24 02:08:22', 0);

SET FOREIGN_KEY_CHECKS = 1;
