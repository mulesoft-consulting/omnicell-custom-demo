-- B2B.B2B_Partner_Info definition

CREATE TABLE `B2B_Partner_Info` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `PartnerName` varchar(100) DEFAULT NULL,
  `Interchange_ID_Qualifier` varchar(100) DEFAULT NULL,
  `Interchange_ID` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;