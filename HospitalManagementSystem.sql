CREATE TABLE `admitpatient_room` (
  `PatientID` int(10) NOT NULL,
  `Disease` varchar(50) DEFAULT NULL,
  `AdmitDate` date DEFAULT NULL,
  `RoomNo` int(5) DEFAULT NULL,
  `DoctorID` int(10) NOT NULL,
  `AP_Remarks` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`PatientID`),
  KEY `RoomNo` (`RoomNo`),
  KEY `DoctorID` (`DoctorID`),
  CONSTRAINT `admitpatient_room_ibfk_1` FOREIGN KEY (`RoomNo`) REFERENCES `room` (`RoomNo`),
  CONSTRAINT `admitpatient_room_ibfk_2` FOREIGN KEY (`DoctorID`) REFERENCES `doctor` (`DoctorID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1

CREATE TABLE `bill_room` (
  `DischargeID` int(5) NOT NULL AUTO_INCREMENT,
  `BillNo` int(15) NOT NULL,
  `BillingDate` date DEFAULT NULL,
  `RoomCharges` int(10) DEFAULT NULL,
  `ServiceCharges` int(10) DEFAULT NULL,
  `PaymentMode` varchar(20) DEFAULT NULL,
  `PaymentModeDetails` varchar(100) DEFAULT NULL,
  `TotalCharges` int(10) DEFAULT NULL,
  `NoOfDays` int(5) DEFAULT NULL,
  `TotalRoomCharges` int(10) DEFAULT NULL,
  PRIMARY KEY (`DischargeID`,`BillNo`),
  UNIQUE KEY `BillNo_UNIQUE` (`BillNo`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1

CREATE TABLE `dischargepatient_room` (
  `AdmitID` int(20) NOT NULL AUTO_INCREMENT,
  `DischargeDate` date DEFAULT NULL,
  `DP_Remarks` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`AdmitID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1

CREATE TABLE `doctor` (
  `DoctorID` int(10) NOT NULL AUTO_INCREMENT,
  `DoctorName` varchar(20) DEFAULT NULL,
  `FatherName` varchar(20) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `ContacNo` varchar(11) DEFAULT NULL,
  `Qualifications` varchar(50) DEFAULT NULL,
  `Gender` varchar(1) DEFAULT NULL,
  `BloodGroup` varchar(5) DEFAULT NULL,
  `DateOfJoining` date DEFAULT NULL,
  `Address` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`DoctorID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1


CREATE TABLE `patientregistration` (
  `PatientID` int(10) NOT NULL AUTO_INCREMENT,
  `PatientName` varchar(20) DEFAULT NULL,
  `Email` varchar(30) DEFAULT NULL,
  `ContactNo` varchar(11) DEFAULT NULL,
  `Age` int(2) DEFAULT NULL,
  `Remarks` varchar(100) DEFAULT NULL,
  `Gen` varchar(1) DEFAULT NULL,
  `BG` varchar(3) DEFAULT NULL,
  `Address` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`PatientID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1

CREATE TABLE `registration` (
  `name` varchar(20) DEFAULT NULL,
  `user_name` varchar(20) NOT NULL,
  `password` varchar(20) DEFAULT NULL,
  `email_id` varchar(30) DEFAULT NULL,
  `contact_no` int(11) DEFAULT NULL,
  PRIMARY KEY (`user_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1

CREATE TABLE `room` (
  `RoomNo` int(5) NOT NULL,
  `RoomType` varchar(10) DEFAULT NULL,
  `RoomCharges` int(10) DEFAULT NULL,
  `RoomStatus` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`RoomNo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1

CREATE TABLE `services` (
  `ServiceName` varchar(20) DEFAULT NULL,
  `ServiceDate` date DEFAULT NULL,
  `PatientID` int(10) DEFAULT NULL,
  `ServiceCharges` int(10) DEFAULT NULL,
  `ServiceID` int(10) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`ServiceID`),
  KEY `PatientID` (`PatientID`),
  CONSTRAINT `services_ibfk_1` FOREIGN KEY (`PatientID`) REFERENCES `patientregistration` (`PatientID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1

CREATE TABLE `users` (
  `user_name` varchar(20) NOT NULL,
  `password` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`user_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1