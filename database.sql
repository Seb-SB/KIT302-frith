DROP TABLE IF EXISTS EventDetails;
DROP TABLE IF EXISTS IncidentReport;
DROP TABLE IF EXISTS ShiftDetails;
DROP TABLE IF EXISTS GuardableArea;
DROP TABLE IF EXISTS AccountBusinessOwner;
DROP TABLE IF EXISTS AccountSecurityGuard;
DROP TABLE IF EXISTS FirmUniqueKey;
DROP TABLE IF EXISTS AccountSecurityFirm;
DROP TABLE IF EXISTS AccountSystemAdministrator;
DROP TABLE IF EXISTS InformationPool;
DROP TABLE IF EXISTS SeverityLevel;
DROP TABLE IF EXISTS CreationStatus;

-- Account Creation Status Table
CREATE TABLE CreationStatus (
	StatusID varchar(32) NOT NULL,
	Colour varchar(32) NOT NULL,
	PRIMARY KEY (StatusID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Incident Report Severity Level Table
CREATE TABLE SeverityLevel (
	LevelID varchar(1) NOT NULL,
	Severity varchar(32) NOT NULL,
	Colour varchar(32) NOT NULL,
	PRIMARY KEY (LevelID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Information Pool Table
CREATE TABLE InformationPool (
	PoolID int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
	PoolName varchar(255) NOT NULL,
	PRIMARY KEY (PoolID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- System Administrator Account Table
CREATE TABLE AccountSystemAdministrator (
	AdministratorID int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
	EmailAddress varchar(255) NOT NULL,
	Password varchar(255) NOT NULL,
	PRIMARY KEY (AdministratorID),
	UNIQUE (EmailAddress)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Security Firm Account Table
CREATE TABLE AccountSecurityFirm (
	FirmID int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
	StatusID varchar(32) NOT NULL,
	FirmName varchar(255) NOT NULL,
	ABN varchar(255) NOT NULL,
	EmailAddress varchar(255) NOT NULL,
	PhoneNumber varchar(20) NOT NULL,
	ManagerFirstName varchar(32) NOT NULL,
	ManagerLastName varchar(32) NOT NULL,
	Password varchar(255) NOT NULL,
	PRIMARY KEY (FirmID),
	FOREIGN KEY (StatusID) REFERENCES CreationStatus (StatusID),
	UNIQUE (EmailAddress),
	UNIQUE (ABN)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Unique Key For Security Firms Table
CREATE TABLE FirmUniqueKey (
	GuardKey varchar(32) NOT NULL,
	FirmID int(10) UNSIGNED NOT NULL,
	PRIMARY KEY (GuardKey),
	FOREIGN KEY (FirmID) REFERENCES AccountSecurityFirm (FirmID),
	UNIQUE (GuardKey)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Security Guard Account Table
CREATE TABLE AccountSecurityGuard (
	GuardKey varchar(32) NOT NULL,
	FirstName varchar(32) NOT NULL,
	LastName varchar(32) NOT NULL,
	PhoneNumber varchar(20) NOT NULL,
	EmailAddress varchar(255) NOT NULL,
	Password varchar(255) NOT NULL,
	PRIMARY KEY (GuardKey),
	FOREIGN KEY (GuardKey) REFERENCES FirmUniqueKey (GuardKey),
	UNIQUE (EmailAddress)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Business Owner Account Table
CREATE TABLE AccountBusinessOwner (
	BusinessID int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
	StatusID varchar(32) NOT NULL,
	PoolID int(10) UNSIGNED NOT NULL,
	BusinessName varchar(255) NOT NULL,
	ABN varchar(255) NOT NULL,
	EmailAddress varchar(255) NOT NULL,
	Password varchar(255) NOT NULL,
	ManagerFirstName varchar(32) NOT NULL,
	ManagerLastName varchar(32) NOT NULL,
	PhoneNumber varchar(20) NOT NULL,
	PRIMARY KEY (BusinessID),
	FOREIGN KEY (StatusID) REFERENCES CreationStatus (StatusID),
	FOREIGN KEY (PoolID) REFERENCES InformationPool (PoolID),
	UNIQUE (EmailAddress),
	UNIQUE (ABN)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Guardable Area Table
CREATE TABLE GuardableArea (
	AreaID int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
	BusinessID int(10) UNSIGNED NOT NULL,
	AreaName varchar(255) NOT NULL,
	PRIMARY KEY (AreaID),
	FOREIGN KEY (BusinessID) REFERENCES AccountBusinessOwner (BusinessID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Shift Details Table
CREATE TABLE ShiftDetails (
	ShiftID int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
	GuardKey varchar(32) NOT NULL,
	BusinessID int(10) UNSIGNED NOT NULL,
	AreaID int(10) UNSIGNED NOT NULL,
	TimeStarted datetime NOT NULL,
	PRIMARY KEY (ShiftID),
	FOREIGN KEY (GuardKey) REFERENCES AccountSecurityGuard (GuardKey),
	FOREIGN KEY (BusinessID) REFERENCES AccountBusinessOwner (BusinessID),
	FOREIGN KEY (AreaID) REFERENCES GuardableArea (AreaID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Incident Report Table
CREATE TABLE IncidentReport (
	ReportID int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
	GuardKey varchar(32) NOT NULL,
	BusinessID int(10) UNSIGNED NOT NULL,
	TimeSubmitted datetime NOT NULL,
	IncidentType varchar(60) NOT NULL,
	SpecificArea varchar(60) NOT NULL,
	Description varchar(255) NOT NULL,
	PartiesInvolved varchar(255) NOT NULL,
	Witnesses varchar(255) NOT NULL,
	ReportFiled char(1) NOT NULL,
	PRIMARY KEY (ReportID),
	FOREIGN KEY (GuardKey) REFERENCES AccountSecurityGuard (GuardKey),
	FOREIGN KEY (BusinessID) REFERENCES AccountBusinessOwner (BusinessID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Event Details Table
CREATE TABLE EventDetails (
	EventID int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
	BusinessID int(10) UNSIGNED NOT NULL,
	LevelID varchar(1) NOT NULL,
	TimeSubmitted datetime NOT NULL,
	EventTitle varchar(255) NOT NULL,
	NumPerpetrators int(10) NOT NULL,
	Description varchar(255) NOT NULL,
	PRIMARY KEY (EventID),
	FOREIGN KEY (BusinessID) REFERENCES AccountBusinessOwner (BusinessID),
	FOREIGN KEY (LevelID) REFERENCES SeverityLevel (LevelID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO CreationStatus (StatusID, Colour) VALUES ("Pending", "#eb8334");
INSERT INTO CreationStatus (StatusID, Colour) VALUES ("Approved", "#46eb34");
INSERT INTO CreationStatus (StatusID, Colour) VALUES ("Rejected", "#eb3a34");

INSERT INTO SeverityLevel (LevelID, Severity, Colour) VALUES ("I", "Informative", "#3489eb");
INSERT INTO SeverityLevel (LevelID, Severity, Colour) VALUES ("L", "Low", "#ebc934");
INSERT INTO SeverityLevel (LevelID, Severity, Colour) VALUES ("M", "Medium", "#eb9334");
INSERT INTO SeverityLevel (LevelID, Severity, Colour) VALUES ("H", "High", "#eb4034");
INSERT INTO SeverityLevel (LevelID, Severity, Colour) VALUES ("D", "Danger", "#262424");

INSERT INTO AccountSystemAdministrator (EmailAddress, Password) VALUES ("admin@projectfrith.com.au", "78B9A6C6AF1855F961DC0B35AFEE1862935B792DE2B8E8C38453D9C20FC3987E");