
CREATE TABLE `tblEDIType` (
  `EDITypeNo` INTEGER PRIMARY KEY AUTO_INCREMENT,
  `Name` NVARCHAR(50) NOT NULL

);

CREATE TABLE `tblEDIVersion` (
  `EDIVersionNo` INTEGER PRIMARY KEY AUTO_INCREMENT,
  `Version` NVARCHAR(50) NOT NULL,
  `EDITypeNo_FK` INTEGER NOT NULL,
  FOREIGN KEY (`EDITypeNo_FK`) REFERENCES `tblEDIType` (`EDITypeNo`) 
);

CREATE TABLE `tblSegmentTerminator` (
  `SegmentTerminatorNo` INTEGER PRIMARY KEY AUTO_INCREMENT,
  `TerminatorCode` INTEGER NOT NULL,
  `Terminator` NVARCHAR(10) NOT NULL
);

CREATE TABLE `tblErrorHandle` (
  `ErrorHandleNo` INTEGER PRIMARY KEY AUTO_INCREMENT,
  `ErrorHandleCode` INTEGER NOT NULL,
  `Description` NVARCHAR(50) NULL
);

CREATE TABLE `tblEDITransactionSet` (
  `TransactionSetNo` INTEGER PRIMARY KEY AUTO_INCREMENT,
  `TransactionSetID` NVARCHAR(50) NOT NULL,
  `Description` NVARCHAR(100) NULL,
  `InOut` BIT NOT NULL,
  `EDITypeNo_FK` INTEGER  NOT NULL,
  FOREIGN KEY (`EDITypeNo_FK`) REFERENCES `tblEDIType` (`EDITypeNo`)

);


CREATE TABLE `tblEDISegment` (
  `SegmentNo` INTEGER PRIMARY KEY AUTO_INCREMENT,
  `SegmentCode` NVARCHAR(50) NOT NULL
);


CREATE TABLE `tblTradingPartner` (
  `TradingPartnerNo` INTEGER PRIMARY KEY AUTO_INCREMENT,
  `TradingPartnerName` NVARCHAR(100) NOT NULL,
  `AuthorizationQual` NVARCHAR(50) NULL,
  `AuthorizationInfo` NVARCHAR(50) NULL,
  `SecurityQual` NVARCHAR(50) NULL,
  `SecurityInfo` NVARCHAR(50) NULL,
  `InterchangeSenderIDQual` NVARCHAR(50) NOT NULL,
  `InterchangeSenderID` NVARCHAR(50) NOT NULL,
  `InterchangeReceiverIDQual` NVARCHAR(50) NOT NULL,
  `InterchangeReceiverID` NVARCHAR(50) NOT NULL,
  `ApplicationSenderCode` NVARCHAR(50) NOT NULL,
  `ApplicationReceiverCode` NVARCHAR(50) NOT NULL,
  `ResponsibleAgencyCode` NVARCHAR(50) NULL,
  `SegmentTerminator` INTEGER  NOT NULL,
  `DataElementDelimiter` INTEGER NOT NULL,
  `RepetitionSep` INTEGER NULL,
  `InterchangeVersion` NVARCHAR(50) NOT NULL,
  `StandardVersion` INTEGER NOT NULL,
  `TestIndicator` BIT NOT NULL,
  `SubElementSep` INTEGER NOT NULL,
  `FunctionalAcknowledgement` INTEGER NULL DEFAULT 0,
  `OutBoundID` NVARCHAR(50) NULL,
  `Output997FilePath` NVARCHAR(100) NULL,
  `blnIsGSYear4` BIT DEFAULT 0 NULL,
  FOREIGN KEY (`SegmentTerminator`) REFERENCES `tblSegmentTerminator` (`SegmentTerminatorNo`),
  FOREIGN KEY (`DataElementDelimiter`) REFERENCES `tblSegmentTerminator` (`SegmentTerminatorNo`),
  FOREIGN KEY (`RepetitionSep`) REFERENCES `tblSegmentTerminator` (`SegmentTerminatorNo`),
  FOREIGN KEY (`StandardVersion`) REFERENCES `tblEDIVersion` (`EDIVersionNo`),
  FOREIGN KEY (`SubElementSep`) REFERENCES `tblSegmentTerminator` (`SegmentTerminatorNo`)    

);


CREATE TABLE `tblEDITransactionStructure` (
  `StructureNo` INTEGER PRIMARY KEY AUTO_INCREMENT,
  `Version` NVARCHAR(50) NOT NULL,
  `TransactionSetID` NVARCHAR(50) NOT NULL,
  `FunctionGroup` NVARCHAR(50) NOT NULL,
  `SegmentCode` NVARCHAR(50),
  `MinLength` INT NOT NULL,
  `MaxLength` INT NOT NULL,
  `EDITypeNo_FK` INTEGER NOT NULL,
  FOREIGN KEY (`EDITypeNo_FK`) REFERENCES `tblEDIType` (`EDITypeNo`)  

);

CREATE TABLE `tblOperator` (
  `OperatorNo` INTEGER PRIMARY KEY AUTO_INCREMENT,
  `OperatorCode` NVARCHAR(50) NOT NULL,
  `OperatorName` NVARCHAR(100) NOT NULL,
  `OperatorParameter` NVARCHAR(50) NULL
);


CREATE TABLE `tblTradingPartnerErrorHanding` (
  `TPErrorHandingNo` INTEGER PRIMARY KEY AUTO_INCREMENT,
  `TradingPartnerNo_FK` INTEGER NOT NULL, 
  `TransactionSetNo_FK` INTEGER NOT NULL,
  `ErrorHandleNo_FK` INTEGER NOT NULL,
  FOREIGN KEY (`TradingPartnerNo_FK`) REFERENCES `tblTradingPartner` (`TradingPartnerNo`),
  FOREIGN KEY (`TransactionSetNo_FK`) REFERENCES `tblEDITransactionSet` (`TransactionSetNo`),
  FOREIGN KEY (`ErrorHandleNo_FK`) REFERENCES `tblErrorHandle` (`ErrorHandleNo`)  
);

CREATE TABLE `tblEDITrasactionRawData` (
  `TransactionRawDataNo` INTEGER PRIMARY KEY AUTO_INCREMENT,
  `TransactionDate` DATETIME NOT NULL,
  `TradingPartnerNo_FK` INTEGER NOT NULL, 
  `TransactionSetNo_FK` INTEGER NOT NULL,
  `TransactionKey` NVARCHAR(50) NOT NULL,
  `InOut` BIT NOT NULL,
  `RawData` TEXT NOT NULL,
  `XMLData` TEXT NOT NULL,
  `InterchangeControlNum` NVARCHAR(50) NULL,
  `GroupControlNum` NVARCHAR(50) NULL,
  FOREIGN KEY (`TradingPartnerNo_FK`) REFERENCES `tblTradingPartner` (`TradingPartnerNo`),
  FOREIGN KEY (`TransactionSetNo_FK`) REFERENCES `tblEDITransactionSet` (`TransactionSetNo`)   
  
);

CREATE TABLE `tblErrorLog` (
  `ErrorLogNo` INTEGER PRIMARY KEY AUTO_INCREMENT,
  `LogDate` DATETIME NOT NULL,
  `TradingPartnerNo_FK` INTEGER NULL, 
  `TransactionSetNo_FK` INTEGER NULL,
  `TransactionRawDataNo_FK` INTEGER NULL,
  `ErrorMessage` NVARCHAR(200) NOT NULL,
  `LogType` INTEGER NOT NULL,
  FOREIGN KEY (`TradingPartnerNo_FK`) REFERENCES `tblTradingPartner` (`TradingPartnerNo`),
  FOREIGN KEY (`TransactionSetNo_FK`) REFERENCES `tblEDITransactionSet` (`TransactionSetNo`),
  FOREIGN KEY (`TransactionRawDataNo_FK`) REFERENCES `tblEDITrasactionRawData` (`TransactionRawDataNo`)
  
);

CREATE TABLE `tblInboundMapping` (
  `InboundMappingNo` INTEGER PRIMARY KEY AUTO_INCREMENT,
  `TradingPartnerNo_FK` INTEGER NOT NULL, 
  `TransactionSetNo_FK` INTEGER NOT NULL,
  `SegmentNo_FK` INTEGER NULL,
  `Postion` INTEGER NOT NULL,
  `TableName` NVARCHAR(50) NULL,
  `FieldName` NVARCHAR(50) NULL,
  `CommitDBAfterRead` BIT NOT NULL,
  `Note` NVARCHAR(200) NULL,
  `TransactionRawDataNo_FK` INTEGER NOT NULL,
  `IsInsert` BIT NULL DEFAULT 1,
  FOREIGN KEY (`TradingPartnerNo_FK`) REFERENCES `tblTradingPartner` (`TradingPartnerNo`),
  FOREIGN KEY (`TransactionSetNo_FK`) REFERENCES `tblEDITransactionSet` (`TransactionSetNo`),
  FOREIGN KEY (`SegmentNo_FK`) REFERENCES `tblEDISegment` (`SegmentNo`),
  FOREIGN KEY (`TransactionRawDataNo_FK`) REFERENCES `tblEDITrasactionRawData` (`TransactionRawDataNo`)    
  
);

CREATE TABLE `tblOutboundMapping` (
  `OutboundMappingNo` INTEGER PRIMARY KEY AUTO_INCREMENT,
  `TradingPartnerNo_FK` INTEGER NOT NULL , 
  `TransactionSetNo_FK` INTEGER  NOT NULL,
  `SegmentNo_FK` INTEGER NULL,
  `Postion` INTEGER NOT NULL,
  `Value` NVARCHAR(50) NULL,
  `XMLPathField` NVARCHAR(100)  NULL,
  `Note` NVARCHAR(200) NULL,
  `OutputEDIFilePath` NVARCHAR(200) NULL,
  `TransactionRawDataNo_FK` INTEGER NOT NULL,
  `SegmentNumber` INTEGER NOT NULL,
  FOREIGN KEY (`TradingPartnerNo_FK`) REFERENCES `tblTradingPartner` (`TradingPartnerNo`)  ,
  FOREIGN KEY (`TransactionSetNo_FK`) REFERENCES `tblEDITransactionSet` (`TransactionSetNo`),
  FOREIGN KEY (`SegmentNo_FK`) REFERENCES `tblEDISegment` (`SegmentNo`) ,
  FOREIGN KEY (`TransactionRawDataNo_FK`) REFERENCES `tblEDITrasactionRawData` (`TransactionRawDataNo`)    
);

CREATE TABLE `tblOperatorInboundMapping` (
  `OperatorMappingNo` INTEGER PRIMARY KEY AUTO_INCREMENT,
  `OperatorNo_FK` INTEGER NOT NULL,
  `InboundMappingNo_FK` INTEGER NOT NULL,
  `OperatorParameter` NVARCHAR(100) NULL,
  FOREIGN KEY (`OperatorNo_FK`) REFERENCES `tblOperator` (`OperatorNo`),
  FOREIGN KEY (`InboundMappingNo_FK`) REFERENCES `tblInboundMapping` (`InboundMappingNo`)    
);

CREATE TABLE `tblOperatorOutboundMapping` (
  `OperatorMappingNo` INTEGER PRIMARY KEY AUTO_INCREMENT,
  `OperatorNo_FK` INTEGER NOT NULL,
  `OutboundMappingNo_FK` INTEGER NOT NULL,
  `OperatorParameter` NVARCHAR(100) NULL,
  FOREIGN KEY (`OperatorNo_FK`) REFERENCES `tblOperator` (`OperatorNo`),
  FOREIGN KEY (`OutboundMappingNo_FK`) REFERENCES `tblOutboundMapping` (`OutboundMappingNo`)  
);


CREATE TABLE `tblInboundOutboundSetting` (
  `SettingNo` INTEGER PRIMARY KEY AUTO_INCREMENT,
  `SettingName` NVARCHAR(100) NOT NULL,
  `InOut` BIT NOT NULL,
  `Path` NVARCHAR(200),
  `IsArchive` BIT NOT NULL,
  `IsDelete` BIT NOT NULL,
  `IsCreate` BIT NOT NULL
);

 CREATE TABLE `tblInterchangeControlNumber` (
  `ControlNo` int PRIMARY KEY AUTO_INCREMENT NOT NULL,
  `InterchangeControlNumber` INT NOT NULL
);

CREATE TABLE `tblEDI_142_AMT`(
	`NO` int PRIMARY KEY AUTO_INCREMENT NOT NULL,
	`HdrKey` varchar(100) NULL,
	`LineKey` varchar(100) NULL,
	`AmtKey` varchar(100) NOT NULL,
	`AmountQualifier` varchar(50) NULL,
	`Amount` double NULL
 );


CREATE TABLE `tblEDI_142_DETAIL`(
	`NO` int PRIMARY KEY AUTO_INCREMENT NOT NULL,
	`HdrKey` varchar(100)  NULL,
	`LineKey` varchar(100) NULL,
	`DtlKey` varchar(100) NOT NULL,
	`AssignedIdentification` varchar(50) NULL,
	`ModelCodeQual` varchar(50) NULL,
	`ModelCode` varchar(50) NULL,
	`VehicleIDQual` varchar(50) NULL,
	`VehicleIDNum` varchar(50) NULL,
	`EngineNumQual` varchar(50) NULL,
	`EngineNum` varchar(50) NULL,
	`EngineModelQual` varchar(50) NULL,
	`EngineModel` varchar(50) NULL,
	`PrimaryFailedPartQual` varchar(50) NULL,
	`PrimaryFailedPart` varchar(50) NULL,
	`ModelYearQual` varchar(50) NULL,
	`ModelYear` varchar(50) NULL,
	`PartNumCodeQual` varchar(50) NULL,
	`PartNumCode` varchar(50) NULL,
	`PartDescQual` varchar(50) NULL,
	`PartDesc` varchar(100) NULL,
	`QuanityQual` varchar(50) NULL,
	`Quantity` int NULL,
	`UnitMeasureCode` varchar(50) NULL
);

CREATE TABLE `tblEDI_142_DTM`(
	`NO` int PRIMARY KEY AUTO_INCREMENT NOT NULL,
	`HdrKey` varchar(100) NULL,
	`LineKey` varchar(100) NULL,
	`DtlKey` varchar(100) NULL,
	`DtmKey` varchar(100) NOT NULL,
	`Qualifier` varchar(50) NULL,
	`dtmDate` datetime NULL,
	`Century` int NULL
);

CREATE TABLE `tblEDI_142_HEADER`(
	`NO` int PRIMARY KEY AUTO_INCREMENT NOT NULL,
	`HdrKey` varchar(100) NOT NULL,
	`ISAControlNum` varchar(50) NULL,
	`ISASenderID` varchar(50) NULL,
	`GSControlNum` varchar(50) NULL,
	`GSSenderID` varchar(50) NULL,
	`TransSetID` varchar(50) NULL,
	`TransSetControlNum` varchar(50) NULL,
	`TransSetPurpose` varchar(50) NULL,
	`WarrantyClaimRefNum` varchar(50) NULL,
	`GeneratedDateTime` datetime NULL,
	`DateAdded` datetime NOT NULL,
	`SubmitDateTime` datetime NULL,
	`blnRepFlag` tinyint DEFAULT 1 NULL,
	`GSReceiverID` varchar(50) NULL
);

CREATE TRIGGER `tblEDI_142_HEADER_INSERT` BEFORE INSERT ON `tblEDI_142_HEADER`
FOR EACH ROW 
SET new.DateAdded = now();


CREATE TABLE `tblEDI_142_IT1`(
	`NO` int PRIMARY KEY AUTO_INCREMENT NOT NULL,
	`HdrKey` varchar(100) NULL,
	`LineKey` varchar(100) NULL,
	`It1Key` varchar(100) NOT NULL,
	`AssignedID` varchar(50) NULL,
	`LaborHours` double NULL,
	`UnitMeasurementCode` varchar(50) NULL,
	`LaborCost` double NULL
);

CREATE TABLE `tblEDI_142_LINE`(
	`NO` int PRIMARY KEY AUTO_INCREMENT NOT NULL,
	`HdrKey` varchar(100) NULL,
	`LineKey` varchar(100) NOT NULL,
	`AssignedNum` varchar(50) NULL,
	`ReceiverClaimNumQual` varchar(50) NULL,
	`ReceiverClaimNum` varchar(50) NULL,
	`BussinessTypeQual` varchar(50) NULL,
	`BussinessType` varchar(50) NULL,
	`StateCodeQual` varchar(50) NULL,
	`StateCode` varchar(50) NULL,
	`AdjustmentMemoQual` varchar(50) NULL,
	`AdjustmentMemoNum` varchar(50) NULL,
	`DistributorClaimNumQual` varchar(50) NULL,
	`DistributorClaimNum` varchar(50) NULL,
	`DistributorCodeQual` varchar(50) NULL,
	`DistributorCode` varchar(50) NULL,
	`DistributorNameQual` varchar(50) NULL,
	`DistributorName` varchar(50) NULL,
	`ClaimClassCodeQual` varchar(50) NULL,
	`ClaimClassCode` varchar(50) NULL,
	`ClaimClassCodeDescQual` varchar(50) NULL,
	`ClaimClassCodeDesc` varchar(50) NULL,
	`MajorModelSeriesQual` varchar(50) NULL,
	`MajorModelSeries` varchar(50) NULL,
	`MajorModelDescQual` varchar(50) NULL,
	`MajorModelDesc` varchar(50) NULL
);

CREATE TABLE `tblEDI_142_MSG`(
	`NO` int PRIMARY KEY AUTO_INCREMENT NOT NULL,
	`HdrKey` varchar(100) NULL,
	`LineKey` varchar(100) NULL,
	`PrrKey` varchar(100) NULL,
	`MsgKey` varchar(100) NOT NULL,
	`Message` varchar(500) NULL
);

CREATE TABLE `tblEDI_142_N1`(
	`NO` int PRIMARY KEY AUTO_INCREMENT NOT NULL,
	`HdrKey` varchar(100) NULL,
	`N1Key` varchar(100) NOT NULL,
	`EntityIDCode` varchar(50) NULL,
	`Name` varchar(100) NULL,
	`SplIDCodeQual` varchar(10) NULL,
	`Code` varchar(50) NULL,
	`CorpName` varchar(100) NULL,
	`Address1` varchar(100) NULL,
	`Address2` varchar(100) NULL,
	`City` varchar(50) NULL,
	`State` varchar(50) NULL,
	`Zip` varchar(50) NULL,
	`Country` varchar(50) NULL,
	`ContactCode` varchar(10) NULL,
	`ContactName` varchar(100) NULL,
	`CommQual` varchar(10) NULL,
	`CommNum` varchar(50) NULL,
	`SCACCodeQual` varchar(10) NULL,
	`SCACCode` varchar(50) NULL
);

CREATE TABLE `tblEDI_142_PRR`(
	`NO` int PRIMARY KEY AUTO_INCREMENT NOT NULL,
	`HdrKey` varchar(100) NULL,
	`LineKey` varchar(100) NULL,
	`PrrKey` varchar(100) NOT NULL,
	`AssignedID` varchar(50) NULL,
	`ComplaintCode` varchar(50) NULL,
	`Description` varchar(100) NULL
);

CREATE TABLE `tblEDI_142_REP`(
	`NO` int PRIMARY KEY AUTO_INCREMENT NOT NULL,
	`HdrKey` varchar(100) NULL,
	`LineKey` varchar(100) NULL,
	`RepKey` varchar(100) NOT NULL,
	`AssignedID` varchar(50) NULL,
	`IDQualifier` varchar(50) NULL,
	`ID` varchar(50) NULL
);

CREATE TABLE `tblEDI_142_SSS`(
	`NO` int PRIMARY KEY AUTO_INCREMENT NOT NULL,
	`HdrKey` varchar(100) NULL,
	`LineKey` varchar(100) NULL,
	`DtlKey` varchar(100) NULL,
	`SssKey` varchar(100) NOT NULL,
	`Indicator` varchar(50) NULL,
	`AgencyQualifierCode` varchar(50) NULL,
	`SpecialServicesCode` varchar(50) NULL,
	`Rate` double NULL,
	`TotalAmount` double NULL,
	`SupplierAmount` double NULL
);

CREATE TABLE `tblEDI_810_HEADER`(
	`NO` int PRIMARY KEY AUTO_INCREMENT NOT NULL,
	`HdrKey` varchar(100) NOT NULL,
	`ISAControlNum` varchar(50) NULL,
	`ISASenderID` varchar(50) NULL,
	`GSControlNum` varchar(50) NULL,
	`GSSenderID` varchar(50) NULL,
	`TransSetID` varchar(50) NULL,
	`TransSetControlNum` varchar(50) NULL,
	`InvoiceDate` datetime NULL,
	`InvoiceNumber` varchar(50) NULL,
	`TranTypeCode` varchar(50) NULL,
	`TransSetPurpose` varchar(50) NULL,
	`EntityIDCode` varchar(50) NULL,
	`CurrencyCode` varchar(50) NULL,
	`TermsBasisDateCode` varchar(50) NULL,
	`TermsDiscPercent` double NULL,
	`TermsDiscDaysDue` int NULL,
	`TermsNetDueDate` datetime NULL,
	`TermsNetDays` int NULL,
	`GeneratedDateTime` datetime NULL,
	`DateAdded` datetime NOT NULL,
	`SubmitDateTime` datetime NULL,
	`Amount` double NULL,
	`TaxTypeCode` varchar(50) NULL,
	`TaxAmount` double NULL,
	`TaxPercent` double NULL,
	`TaxIDNum` varchar(50) NULL,
	`blnRepFlag` tinyint DEFAULT 1 NULL,
	`GSReceiverID` varchar(50) NULL

	);

CREATE TRIGGER `tblEDI_810_HEADER_INSERT` BEFORE INSERT ON `tblEDI_810_HEADER`
FOR EACH ROW 
SET new.DateAdded = now();	
	
CREATE TABLE `tblEDI_810_LINE`(
	`NO` int PRIMARY KEY AUTO_INCREMENT NOT NULL,
	`LineKey` varchar(100) NOT NULL,
	`HdrKey` varchar(100) NULL,
	`AssignedID` varchar(50) NULL,
	`QtyInvoiced` double NULL,
	`UOM` varchar(50) NULL,
	`UnitPrice` double NULL,
	`UnitPriceCode` varchar(50) NULL,
	`ItemDescType` varchar(50) NULL,
	`Description` varchar(50) NULL,
	`RefQual` varchar(50) NULL,
	`PartNumber` varchar(50) NULL,
	`DtmQual` varchar(50) NULL,
	`Date` datetime NULL
);

CREATE TABLE `tblEDI_810_N1`(
	`NO` int PRIMARY KEY AUTO_INCREMENT NOT NULL,
	`HdrKey` varchar(100) NULL,
	`LineKey` varchar(100) NULL,
	`N1Key` varchar(100) NOT NULL,
	`EntityIDCode` varchar(50) NULL,
	`CodeQual` varchar(50) NULL,
	`Name` varchar(100) NULL,
	`Code` varchar(50) NULL,
	`Address1` varchar(100) NULL,
	`Address2` varchar(100) NULL,
	`City` varchar(50) NULL,
	`State` varchar(50) NULL,
	`Zip` varchar(50) NULL,
	`Country` varchar(50) NULL,
	`ContactCode` varchar(50) NULL,
	`ContactName` varchar(100) NULL
);

CREATE TABLE `tblEDI_820_ADX`(
	`NO` int PRIMARY KEY AUTO_INCREMENT NOT NULL,
	`AdxKey` varchar(100) NOT NULL,
	`LineKey` varchar(100) NULL,
	`HdrKey` varchar(100) NULL,
	`AdjMonetaryAmount` double NULL,
	`AdjReasonCode` varchar(50) NULL,
	`AdjIDQual` varchar(50) NULL,
	`AdjReferenceID` varchar(50) NULL
);

CREATE TABLE `tblEDI_820_DTM`(
	`NO` int PRIMARY KEY AUTO_INCREMENT NOT NULL,
	`DtmKey` varchar(100) NOT NULL,
	`HdrKey` varchar(100) NULL,
	`LineKey` varchar(100) NULL,
	`AdxKey` varchar(100) NULL,
	`IT1Key` varchar(100) NULL,
	`RefKey` varchar(100) NULL,
	`RMRKey` varchar(100) NULL,
	`N1Key` varchar(100) NULL,
	`DtmQual` varchar(50) NULL,
	`Date` datetime NULL

	);

CREATE TABLE `tblEDI_820_HEADER`(
	`NO` int PRIMARY KEY AUTO_INCREMENT NOT NULL,
	`HdrKey` varchar(100) NOT NULL,
	`ISAControlNum` varchar(50) NULL,
	`ISASenderID` varchar(50) NULL,
	`GSControlNum` varchar(50) NULL,
	`GSSenderID` varchar(50) NULL,
	`TransSetID` varchar(50) NULL,
	`TransSetControlNum` varchar(50) NULL,
	`TransHandlingCode` varchar(50) NULL,
	`TotalPaymentAmount` double NULL,
	`CreditDebitFlagCode` varchar(50) NULL,
	`PaymentMethodCode` varchar(50) NULL,
	`PaymentFormatCode` varchar(50) NULL,
	`SupplierIDNumQual` varchar(50) NULL,
	`SupplierID` varchar(50) NULL,
	`SupplierAcctNumQual` varchar(50) NULL,
	`SupplierAcctNum` varchar(50) NULL,
	`RemittanceDate` datetime NULL,
	`TraceTypeNum` varchar(50) NULL,
	`TraceRefNum1` varchar(50) NULL,
	`OrgCompanyID` varchar(50) NULL,
	`TraceRefNum2` varchar(50) NULL,
	`EntityIDCode` varchar(50) NULL,
	`CurrencyCode` varchar(50) NULL,
	`GeneratedDateTime` datetime NULL,
	`DateAdded` datetime NOT NULL,
	`SubmitDateTime` datetime NULL,
	`blnRepFlag` tinyint DEFAULT 1 NULL,
	`GSReceiverID` varchar(50) NULL,
	`blnImportSimply` tinyint DEFAULT 1 NULL,
	blnEmailFlag BIT DEFAULT 0 NULL
	);

CREATE TRIGGER `tblEDI_820_HEADER_INSERT` BEFORE INSERT ON `tblEDI_820_HEADER`
FOR EACH ROW 
SET new.DateAdded = now();	
	
CREATE TABLE `tblEDI_820_IT1`(
	`NO` int PRIMARY KEY AUTO_INCREMENT NOT NULL,
	`IT1Key` varchar(100) NOT NULL,
	`HdrKey` varchar(100) NULL,
	`LineKey` varchar(100) NULL,
	`AdxKey` varchar(100) NULL,
	`RMRKey` varchar(100) NULL,
	`AssignedID` varchar(50) NULL,
	`QtyInvoiced` double NULL,
	`UOM` varchar(50) NULL,
	`UnitPrice` double NULL,
	`UnitPriceCode` varchar(50) NULL

	);

CREATE TABLE `tblEDI_820_LINE`(
	`NO` int PRIMARY KEY AUTO_INCREMENT NOT NULL,
	`LineKey` varchar(100) NOT NULL,
	`HdrKey` varchar(100) NULL,
	`AssignedNum` varchar(50) NULL,
	`EntityIDCode` varchar(50) NULL,
	`EntityIDCodeQual` varchar(50) NULL,
	`ShipToCode` varchar(50) NULL,
	`ShipToIDCode` varchar(50) NULL,
	`ShipToCodeQual` varchar(50) NULL,
	`ShipToNum` varchar(50) NULL,
	`TaxIDNum` varchar(50) NULL,
	`TaxPaymentTypeCode` varchar(50) NULL,
	`TaxDate` datetime NULL,
	`TaxInfoID` varchar(50) NULL,
	`TaxAmount` double NULL,
	`LoopHeaderIDCode` varchar(50) NULL,
	`LoopTrailerIDCode` varchar(50) NULL

	);

CREATE TABLE `tblEDI_820_TAX`(
	`NO` int PRIMARY KEY AUTO_INCREMENT NOT NULL,
	`TaxKey` varchar(100) NOT NULL,
	`LineKey` varchar(100) NULL,
	`HdrKey` varchar(100) NULL,
	`TaxIDNum` varchar(50) NULL,
	`TaxPaymentTypeCode` varchar(50) NULL,
	`TaxDate` datetime NULL,
	`TaxInfoID` varchar(50) NULL,
	`TaxAmount` double NULL
);


CREATE TABLE `tblEDI_820_N1`(
	`NO` int PRIMARY KEY AUTO_INCREMENT NOT NULL,
	`HdrKey` varchar(100) NULL,
	`LineKey` varchar(100) NULL,
	`N1Key` varchar(100) NOT NULL,
	`EntityIDCode` varchar(50) NULL,
	`CodeQual` varchar(50) NULL,
	`Name` varchar(100) NULL,
	`Code` varchar(50) NULL,
	`Address1` varchar(100) NULL,
	`Address2` varchar(100) NULL,
	`City` varchar(50) NULL,
	`State` varchar(50) NULL,
	`Zip` varchar(50) NULL,
	`Country` varchar(50) NULL,
	`ContactCode` varchar(50) NULL,
	`ContactName` varchar(100) NULL,
	`ContactNum1Qual` varchar(50) NULL,
	`ContactNum1` varchar(50) NULL,
	`ContactNum2Qual` varchar(50) NULL,
	`ContactNum2` varchar(50) NULL,
	`EmailQual` varchar(50) NULL,
	`Email` varchar(100) NULL,
	`PlantID` varchar(50) NULL
	);

CREATE TABLE `tblEDI_820_REF`(
	`NO` int PRIMARY KEY AUTO_INCREMENT NOT NULL,
	`RefKey` varchar(100) NOT NULL,
	`HdrKey` varchar(100) NULL,
	`LineKey` varchar(100) NULL,
	`AdxKey` varchar(100) NULL,
	`IT1Key` varchar(100) NULL,
	`RMRKey` varchar(100) NULL,
	`N1Key` varchar(100) NULL,
	`RefQual` varchar(50) NULL,
	`RefNum` varchar(100) NULL,
	`Description` varchar(50) NULL

	);

CREATE TABLE `tblEDI_820_RMR`(
	`NO` int PRIMARY KEY AUTO_INCREMENT NOT NULL,
	`RMRKey` varchar(100) NOT NULL,
	`LineKey` varchar(100) NULL,
	`HdrKey` varchar(100) NULL,
	`N1Key` varchar(100) NULL,
	`RemittanceIDQual` varchar(50) NULL,
	`RemittanceID` varchar(50) NULL,
	`RemittancePayActionCode` varchar(50) NULL,
	`NetAmount` double NULL,
	`GrossAmount` double NULL,
	`DiscountAmount` double NULL,
	`AdjReasonCode` varchar(50) NULL,
	`Description` varchar(100) NULL

	);

CREATE TABLE `tblEDI_820_SAC`(
	`NO` int PRIMARY KEY AUTO_INCREMENT NOT NULL,
	`SACKey` varchar(100) NOT NULL,
	`HdrKey` varchar(100) NULL,
	`LineKey` varchar(100) NULL,
	`AdxKey` varchar(100) NULL,
	`RMRKey` varchar(100) NULL,
	`IT1Key` varchar(100) NULL,
	`ChargeID` varchar(50) NULL,
	`ChargeCode` varchar(50) NULL,
	`Amount` double NULL,
	`Rate` double NULL,
	`UOM` varchar(50) NULL,
	`Quantity` double NULL,
	`ChargeHandlingCode` varchar(50) NULL,
	`Description` varchar(100) NULL,
	`ChargeNum` varchar(50) NULL
	
	);

CREATE TABLE `tblEDI_820_SLN`(
	`NO` int PRIMARY KEY AUTO_INCREMENT NOT NULL,
	`SLNKey` varchar(100) NOT NULL,
	`HdrKey` varchar(100) NULL,
	`LineKey` varchar(100) NULL,
	`AdxKey` varchar(100) NULL,
	`IT1Key` varchar(100) NULL,
	`AssignedID` varchar(50) NULL,
	`RelationshipCode` varchar(50) NULL,
	`UnitPrice` double NULL,
	`BasisofUnitPriceCode` varchar(50) NULL,
	`Quantity` double NULL,
	`UOM` varchar(50) NULL

	);

CREATE TABLE `tblEDI_824_DETAIL`(
	`NO` int PRIMARY KEY AUTO_INCREMENT NOT NULL,
	`DtlKey` varchar(100) NOT NULL,
	`HdrKey` varchar(100) NULL,
	`LineKey` varchar(100) NULL,
	`ApplErrConditionCode` varchar(50) NULL,
	`ErrorDescrp` varchar(300) NULL,
	`ErrorData` varchar(300) NULL
  );	

CREATE TABLE `tblEDI_824_DTM`(
	`NO` int PRIMARY KEY AUTO_INCREMENT NOT NULL,
	`DtmKey` varchar(100) NOT NULL,
	`HdrKey` varchar(100) NULL,
	`LineKey` varchar(100) NULL,
	`DtmQual` varchar(50) NULL,
	`Date` datetime NULL,
	`TimeCode` varchar(50) NULL

	);

CREATE TABLE `tblEDI_824_HEADER`(
	`NO` int PRIMARY KEY AUTO_INCREMENT NOT NULL,
	`HdrKey` varchar(100) NOT NULL,
	`ISAControlNum` varchar(50) NULL,
	`ISASenderID` varchar(50) NULL,
	`GSControlNum` varchar(50) NULL,
	`GSSenderID` varchar(50) NULL,
	`TransSetID` varchar(50) NULL,
	`TransSetControlNum` varchar(50) NULL,
	`TransSetPurpose` varchar(50) NULL,
	`ApplicationAdviceNum` varchar(50) NULL,
	`GeneratedDateTime` datetime NULL,
	`DateAdded` datetime NOT NULL,
	`SubmitDateTime` datetime NULL,
	`blnRepFlag` tinyint DEFAULT 1 NULL,
	`GSReceiverID` varchar(50) NULL,
	`blnEmailFlag` tinyint DEFAULT 0 NULL
	);

CREATE TRIGGER `tblEDI_824_HEADER_INSERT` BEFORE INSERT ON `tblEDI_824_HEADER`
FOR EACH ROW 
SET new.DateAdded = now();	
	
CREATE TABLE `tblEDI_824_LINE`(
	`NO` int PRIMARY KEY AUTO_INCREMENT NOT NULL,
	`LineKey` varchar(100) NOT NULL,
	`HdrKey` varchar(100) NULL,
	`AppAcknowledgmentCode` varchar(50) NULL,
	`OrgDocumentNumQual` varchar(50) NULL,
	`OrgDocumentNum` varchar(50) NULL,
	`OrgCreateDateTime` datetime NULL,
	`TranSetIDCode` varchar(50) NULL

	);

CREATE TABLE `tblEDI_824_N1`(
	`NO` int PRIMARY KEY AUTO_INCREMENT NOT NULL,
	`HdrKey` varchar(100) NULL,
	`LineKey` varchar(100) NULL,
	`N1Key` varchar(100) NOT NULL,
	`EntityIDCode` varchar(50) NULL,
	`CodeQual` varchar(50) NULL,
	`Name` varchar(100) NULL,
	`Code` varchar(50) NULL,
	`Address1` varchar(100) NULL,
	`Address2` varchar(100) NULL,
	`City` varchar(50) NULL,
	`State` varchar(50) NULL,
	`Zip` varchar(50) NULL,
	`Country` varchar(50) NULL,
	`ContactCode` varchar(50) NULL,
	`ContactName` varchar(100) NULL
	);

CREATE TABLE `tblEDI_824_NTE`(
	`NO` int PRIMARY KEY AUTO_INCREMENT NOT NULL,
	`NteKey` varchar(100) NOT NULL,
	`HdrKey` varchar(100) NULL,
	`LineKey` varchar(100) NULL,
	`DtlKey` varchar(100) NULL,
	`NoteRefCode` varchar(50) NULL,
	`Description` varchar(200) NULL

	);

CREATE TABLE `tblEDI_824_QTY`(
	`NO` int PRIMARY KEY AUTO_INCREMENT NOT NULL,
	`QtyKey` varchar(100) NOT NULL,
	`HdrKey` varchar(100) NULL,
	`LineKey` varchar(100) NULL,
	`QtyQual` varchar(50) NULL,
	`Quantity` double NULL
	);

CREATE TABLE `tblEDI_824_REF`(
	`NO` int PRIMARY KEY AUTO_INCREMENT NOT NULL,
	`HdrKey` varchar(100) NULL,
	`LineKey` varchar(100) NULL,
	`RefKey` varchar(100) NOT NULL,
	`RefQual` varchar(50) NULL,
	`RefNum` varchar(100) NULL,
	`Description` varchar(200) NULL

);

CREATE TABLE `tblEDI_830_ATH`(
	`NO` int PRIMARY KEY AUTO_INCREMENT NOT NULL,
	`HdrKey` varchar(100) NULL,
	`LineKey` varchar(100) NULL,
	`AthKey` varchar(100) NOT NULL,
	`ResourceAuthCode` varchar(50) NULL,
	`ResourceAuth_ThruDate` datetime NULL,
	`CumAthQty` double NULL,
	`CumStartDate` datetime NULL

	);

CREATE TABLE `tblEDI_830_DETAIL`(
	`NO` int PRIMARY KEY AUTO_INCREMENT NOT NULL,
	`HdrKey` varchar(100) NULL,
	`LineKey` varchar(100) NULL,
	`DtlKey` varchar(100) NOT NULL,
	`FstQty` double NULL,
	`DiffQty` double NULL,
	`ForecastQual` varchar(50) NULL,
	`ForecastTimeQual` varchar(50) NULL,
	`DatePeriodStart` datetime NULL,
	`DatePeriodEnd` datetime NULL,
	`DateTimeQual` varchar(50) NULL,
	`RefNumQual` varchar(50) NULL,
	`RefNum` varchar(50) NULL,
	`ShipPatternCode` varchar(50) NULL,
	`ShipPatternTimeCode` varchar(50) NULL,
	`ReleaseNumber` varchar(50) NULL

);

CREATE TABLE `tblEDI_830_HEADER`(
	`NO` int PRIMARY KEY AUTO_INCREMENT NOT NULL,
	`HdrKey` varchar(100) NOT NULL,
	`ISASenderID` varchar(50) NULL,
	`SubmitDateTime` datetime NULL,
	`ISAControlNum` varchar(50) NULL,
	`GSSenderID` varchar(50) NULL,
	`GSControlNum` varchar(50) NULL,
	`TransSetID` varchar(50) NULL,
	`TransSetControlNum` varchar(50) NULL,
	`TransSetPurpose` varchar(50) NULL,
	`ReferenceID` varchar(50) NULL,
	`ReleaseNumber` varchar(20) NULL,
	`ScheduleTypeQual` varchar(50) NULL,
	`ScheduleQtyQual` varchar(50) NULL,
	`ForecastHorizonDateStart` datetime NULL,
	`ForecastHorizonEndDate` datetime NULL,
	`GeneratedDateTime` datetime NULL,
	`ContactNumber` varchar(50) NULL,
	`AdminFuncCode_hdr` varchar(50) NULL,
	`AdminContact_hdr` varchar(100) NULL,
	`AdminCommNumQual_hdr` varchar(50) NULL,
	`AdminPhone_hdr` varchar(50) NULL,
	`Note` varchar(1000) NULL,
	`RtgSeqCode` varchar(50) NULL,
	`IDCodeQual` varchar(50) NULL,
	`SCACCode` varchar(50) NULL,
	`TransportationType` varchar(50) NULL,
	`DateAdded` datetime NOT NULL,
	`CummsDateStart` datetime NULL,
	`PlantID` varchar(50) NULL,
	`PONum` varchar(50) NULL,
	`PlantName` varchar(50) NULL,
	`CorpName` varchar(50) NULL,
	`PlannerName` varchar(50) NULL,
	`RefNum` varchar(50) NULL,
	`CTT01` varchar(50) NULL,
	`CTT02` varchar(50) NULL,
	`DateQual` varchar(50) NULL,
	`CreateDate` datetime NULL,
	`blnRepFlag` tinyint DEFAULT 1 NULL,
	`GSReceiverID` varchar(50) NULL,
	`blnEmailFlag` tinyint DEFAULT 0 NULL

	);

CREATE TRIGGER `tblEDI_830_HEADER_INSERT` BEFORE INSERT ON `tblEDI_830_HEADER`
FOR EACH ROW 
SET new.DateAdded = now();	
	
CREATE TABLE `tblEDI_830_LINE`(
	`NO` int PRIMARY KEY AUTO_INCREMENT NOT NULL,
	`HdrKey` varchar(100) NULL,
	`LineKey` varchar(100) NOT NULL,
	`ProdIDQual` varchar(50) NULL,
	`BuyersPartID` varchar(50) NULL,
	`ProdServiceQual` varchar(50) NULL,
	`PONum` varchar(50) NULL,
	`PartDescQual` varchar(50) NULL,
	`PartDescription` varchar(100) NULL,
	`ReleaseNumQual` varchar(50) NULL,
	`ReleaseNum` varchar(50) NULL,
	`SubLineAssignID` varchar(50) NULL,
	`SubLineConfigCode` varchar(50) NULL,
	`SubLineQty` int NULL,
	`SubLineUOM` varchar(50) NULL,
	`SubLineProdServQual` varchar(50) NULL,
	`SubLineProdServID` varchar(50) NULL,
	`PartRelStatusCode` varchar(50) NULL,
	`PartRelDescription` varchar(200) NULL,
	`ProdItmDescType` varchar(50) NULL,
	`ProdItmCharCode` varchar(50) NULL,
	`ProdItmDescription` varchar(200) NULL,
	`MeasurementRefID` varchar(50) NULL,
	`MeasurementQual` varchar(50) NULL,
	`MeasurementVal` varchar(50) NULL,
	`UoBMeasurementCode` varchar(50) NULL,
	`RangeMax` varchar(50) NULL,
	`RoutingSeqCode` varchar(50) NULL,
	`IDCodeQual` varchar(50) NULL,
	`TransIDCode` varchar(50) NULL,
	`TransMethodCode` varchar(50) NULL,
	`AdminFuncCode_lin` varchar(50) NULL,
	`AdminContact_lin` varchar(100) NULL,
	`AdminCommNumQual_lin` varchar(50) NULL,
	`AdminPhone_lin` varchar(50) NULL,
	`MarksNumQual` varchar(50) NULL,
	`MarksNum` varchar(50) NULL,
	`QtyPerCont` int NULL,
	`ContType` varchar(50) NULL,
	`UOM` varchar(50) NULL,
	`UnitPrice` double NULL,
	`ReferenceNum` varchar(50) NULL,
	`SupplierPartID` varchar(50) NULL,
	`DCPartLevel` varchar(50) NULL,
	`BuyersEngChangeLevel` varchar(50) NULL,
	`EngChangeLevel` varchar(50) NULL,
	`CTT01` varchar(50) NULL,
	`CTT02` varchar(50) NULL
	);

CREATE TABLE `tblEDI_830_N1`(
	`NO` int PRIMARY KEY AUTO_INCREMENT NOT NULL,
	`HdrKey` varchar(100) NULL,
	`LineKey` varchar(100) NULL,
	`N1Key` varchar(100) NOT NULL,
	`EntityIDCode` varchar(50) NULL,
	`Name` varchar(100) NULL,
	`SplIDCodeQual` varchar(50) NULL,
	`Code` varchar(50) NULL,
	`CorpName` varchar(100) NULL,
	`Address1` varchar(100) NULL,
	`Address2` varchar(100) NULL,
	`City` varchar(50) NULL,
	`State` varchar(50) NULL,
	`Zip` varchar(50) NULL,
	`Country` varchar(50) NULL,
	`ContactCode` varchar(10) NULL,
	`ContactName` varchar(100) NULL,
	`CommQual` varchar(10) NULL,
	`CommNum` varchar(50) NULL
	);

CREATE TABLE `tblEDI_830_REF`(
	`NO` int PRIMARY KEY AUTO_INCREMENT NOT NULL,
	`HdrKey` varchar(100) NULL,
	`LineKey` varchar(100) NULL,
	`DtlKey` varchar(100) NULL,
	`N1Key` varchar(100) NULL,
	`ShpKey` varchar(100) NULL,
	`RefKey` varchar(100) NOT NULL,
	`RefQual` varchar(10) NULL,
	`RefNum` varchar(100) NULL,
	`Description` varchar(200) NULL

);

CREATE TABLE `tblEDI_830_SHP`(
	`NO` int PRIMARY KEY AUTO_INCREMENT NOT NULL,
	`HdrKey` varchar(100) NULL,
	`LineKey` varchar(100) NULL,
	`ShpKey` varchar(100) NOT NULL,
	`QtyQual` varchar(50) NULL,
	`ShipQty` double NULL,
	`DateQual` varchar(50) NULL,
	`BegInventoryDate` datetime NULL,
	`LastShipDate` datetime NULL,
	`ShipDate` datetime NULL
	);

CREATE TABLE `tblEDI_830_SLN`(
	`NO` int PRIMARY KEY AUTO_INCREMENT NOT NULL,
	`HdrKey` varchar(50) NULL,
	`LineKey` varchar(50) NULL,
	`SlnKey` varchar(50) NOT NULL,
	`AssignedID` varchar(50) NULL,
	`ConfigCode` varchar(50) NULL,
	`Qty` int NULL,
	`UOM` varchar(10) NULL,
	`ProdServiceIDQual` varchar(10) NULL,
	`ProdServiceID` varchar(50) NULL,
	`ProdServiceIDQual2` varchar(10) NULL,
	`ProdServiceID2` varchar(50) NULL
);

CREATE TABLE `tblEDI_830_DTM`(
	`NO` int PRIMARY KEY AUTO_INCREMENT NOT NULL,
	`HdrKey` varchar(100) NULL,
	`LineKey` varchar(100) NULL,
	`DtlKey` varchar(100) NULL,
	`DtmKey` varchar(100) NOT NULL,
	`Qualifier` varchar(50) NULL,
	`dtmDate` datetime NULL
);


CREATE TABLE `tblEDI_832_DETAIL`(
	`NO` int PRIMARY KEY AUTO_INCREMENT NOT NULL,
	`DtlKey` varchar(100) NOT NULL,
	`LineKey` varchar(100) NULL,
	`HdrKey` varchar(100) NULL,
	`PriceIDCode` varchar(50) NULL,
	`UnitPrice` double NULL,
	`PricingQty` double NULL,
	`UOM` varchar(50) NULL,
	`EntityIDCode` varchar(50) NULL,
	`CurrencyCode` varchar(50) NULL
);

CREATE TABLE `tblEDI_832_DTM`(
	`NO` int PRIMARY KEY AUTO_INCREMENT NOT NULL,
	`DtmKey` varchar(100) NOT NULL,
	`HdrKey` varchar(100) NULL,
	`LineKey` varchar(100) NULL,
	`DtlKey` varchar(100) NULL,
	`DtmQual` varchar(50) NULL,
	`Date` datetime NULL
	);

CREATE TABLE `tblEDI_832_HEADER`(
	`NO` int PRIMARY KEY AUTO_INCREMENT NOT NULL,
	`HdrKey` varchar(100) NOT NULL,
	`ISAControlNum` varchar(50) NULL,
	`ISASenderID` varchar(50) NULL,
	`GSControlNum` varchar(50) NULL,
	`GSSenderID` varchar(50) NULL,
	`TransSetID` varchar(50) NULL,
	`TransSetControlNum` varchar(50) NULL,
	`CatalogPurposeCode` varchar(50) NULL,
	`TransSetPurposeCode` varchar(50) NULL,
	`DateQual` varchar(50) NULL,
	`GeneratedDateTime` datetime NULL,
	`DateAdded` datetime NOT NULL,
	`SubmitDateTime` datetime NULL,
	`blnRepFlag` tinyint DEFAULT 1 NULL,
	`GSReceiverID` varchar(50) NULL
	);

CREATE TRIGGER `tblEDI_832_HEADER_INSERT` BEFORE INSERT ON `tblEDI_832_HEADER`
FOR EACH ROW 
SET new.DateAdded = now();	
	
CREATE TABLE `tblEDI_832_LINE`(
	`NO` int PRIMARY KEY AUTO_INCREMENT NOT NULL,
	`LineKey` varchar(100) NOT NULL,
	`HdrKey` varchar(100) NULL,
	`ProdIDQual` varchar(50) NULL,
	`BuyersPartID` varchar(50) NULL,
	`DCPartLevelQual` varchar(50) NULL,
	`DCPartLevel` varchar(50) NULL,
	`PartDscrptQual` varchar(50) NULL,
	`PartDescription` varchar(100) NULL
);

CREATE TABLE `tblEDI_832_N1`(
	`NO` int PRIMARY KEY AUTO_INCREMENT NOT NULL,
	`N1Key` varchar(100) NOT NULL,
	`HdrKey` varchar(100) NULL,
	`EntityIDCode` varchar(50) NULL,
	`Name` varchar(50) NULL,
	`CodeQual` varchar(50) NULL,
	`Code` varchar(50) NULL,
	`CorporateName` varchar(50) NULL,
	`ContactCode` varchar(50) NULL,
	`ContactName` varchar(50) NULL,
	`ContactNum1Qual` varchar(50) NULL,
	`ContactNum1` varchar(50) NULL,
	`ContactNum2Qual` varchar(50) NULL,
	`ContactNum2` varchar(50) NULL,
	`EmailQual` varchar(50) NULL,
	`Email` varchar(100) NULL,
	`PlantID` varchar(50) NULL
	);

CREATE TABLE `tblEDI_832_REF`(
	`NO` int PRIMARY KEY AUTO_INCREMENT NOT NULL,
	`RefKey` varchar(100) NOT NULL,
	`DtlKey` varchar(100) NULL,
	`LineKey` varchar(100) NULL,
	`HdrKey` varchar(100) NULL,
	`PriceQual` varchar(50) NULL,
	`PriceReference` varchar(50) NULL,
	`PriceRefDescrp` varchar(100) NULL
 );

CREATE TABLE `tblEDI_850_CTP`(
	`NO` int PRIMARY KEY AUTO_INCREMENT NOT NULL,
	`HdrKey` varchar(50) NULL,
	`LineKey` varchar(50) NULL,
	`CtpKey` varchar(50) NOT NULL,
	`PriceIDCode` varchar(50) NULL,
	`UnitPrice` double NULL

	);

CREATE TABLE `tblEDI_850_DTM`(
	`NO` int PRIMARY KEY AUTO_INCREMENT NOT NULL,
	`HdrKey` varchar(50) NULL,
	`LineKey` varchar(50) NULL,
	`DtmKey` varchar(50) NOT NULL,
	`DtmQual` varchar(50) NULL,
	`Date` datetime NULL

);

CREATE TABLE `tblEDI_850_HEADER`(
	`NO` int PRIMARY KEY AUTO_INCREMENT NOT NULL,
	`HdrKey` varchar(100) NOT NULL,
	`ISASenderID` varchar(50) NULL,
	`ISAControlNum` varchar(50) NULL,
	`SubmitDateTime` datetime NULL,
	`GSSenderID` varchar(50) NULL,
	`GSControlNum` varchar(50) NULL,
	`TransSetID` varchar(50) NULL,
	`TransSetControlNum` varchar(50) NULL,
	`TransSetPurpose` varchar(50) NULL,
	`POTypeCode` varchar(50) NULL,
	`PONum` varchar(50) NULL,
	`ReleaseNum` varchar(50) NULL,
	`PODate` datetime NULL,
	`NTE_NoteRefCode` varchar(50) NULL,
	`NTE_FreeFormMsg` varchar(50) NULL,
	`EntityIDCode` varchar(10) NULL,
	`Currency` varchar(50) NULL,
	`ExchangeRate` double NULL,
	`FOBShpMethod` varchar(50) NULL,
	`FOBLocationQual` varchar(50) NULL,
	`FOBDescription` varchar(200) NULL,
	`FOBLocationQual2` varchar(50) NULL,
	`FOBDescription2` varchar(200) NULL,
	`TransMethod` varchar(50) NULL,
	`CarrierName` varchar(100) NULL,
	`DateAdded` datetime NOT NULL,
	`GeneratedDateTime` datetime NULL,
	`AdminFuncCode_hdr` varchar(50) NULL,
	`AdminContact_hdr` varchar(100) NULL,
	`AdminCommNumQual_hdr` varchar(50) NULL,
	`AdminPhone_hdr` varchar(50) NULL,
	`CTPClass` varchar(50) NULL,
	`STPPriceQual` varchar(50) NULL,
	`TextMessageCode` varchar(10) NULL,
	`Check864` varchar(50) NULL,
	`blnRepFlag` tinyint DEFAULT 1 NULL,
	`FOBTransTermsQual` varchar(50) NULL,
	`FOBTransTermsCode` varchar(50) NULL,
	`GSReceiverID` varchar(50) NULL
	);

CREATE TRIGGER `tblEDI_850_HEADER_INSERT` BEFORE INSERT ON `tblEDI_850_HEADER`
FOR EACH ROW 
SET new.DateAdded = now();	
	
CREATE TABLE `tblEDI_850_ITA`(
	`NO` int PRIMARY KEY AUTO_INCREMENT NOT NULL,
	`HdrKey` varchar(50) NULL,
	`LineKey` varchar(50) NULL,
	`ItaKey` varchar(50) NOT NULL,
	`AllowanceID` varchar(10) NULL,
	`SpecialServiceCode` varchar(50) NULL,
	`AllowanceMethodofHdlCode` varchar(50) NULL,
	`AllowanceNum` varchar(50) NULL,
	`AllowanceTtlAmt` varchar(50) NULL,
	`UBMsrCode` varchar(50) NULL,
	`Description` varchar(50) NULL,
	`SpecialChargeCode` varchar(50) NULL
);

CREATE TABLE `tblEDI_850_ITD`(
	`NO` int PRIMARY KEY AUTO_INCREMENT NOT NULL,
	`HdrKey` varchar(100) NULL,
	`LineKey` varchar(100) NULL,
	`ItdKey` varchar(100) NOT NULL,
	`TermsTypeCode` varchar(100) NULL,
	`TermsBasisDateCode` varchar(100) NULL,
	`TermsDiscountPercent` double NULL,
	`TermsDiscountDueDate` datetime NULL,
	`TermsDiscountDaysDue` int NULL,
	`TermsNetDueDate` datetime NULL,
	`TermsNetDays` int NULL,
	`TermsDiscountAmt` double NULL,
	`TermsDifferredDueDate` datetime NULL,
	`DifferredAmtDue` double NULL,
	`PctOfInvoicePayable` double NULL,
	`Description` varchar(100) NULL,
	`DayOfMonth` int NULL
	);

CREATE TABLE `tblEDI_850_LINE`(
	`NO` int PRIMARY KEY AUTO_INCREMENT NOT NULL,
	`HdrKey` varchar(100) NULL,
	`LineKey` varchar(100) NOT NULL,
	`PONum` varchar(50) NULL,
	`POLineNum` varchar(50) NULL,
	`QtyOrdered` double NULL,
	`UOM` varchar(50) NULL,
	`UnitPrice` double NULL,
	`MfgBasePartNumQual` varchar(50) NULL,
	`BuyersPartID` varchar(50) NULL,
	`DCPartLevelQual` varchar(10) NULL,
	`DCPartLevel` varchar(50) NULL,
	`PartDescQual` varchar(10) NULL,
	`PartDescription` varchar(100) NULL,
	`ProjectNumQual` varchar(10) NULL,
	`ProjectNum` varchar(50) NULL,
	`EntityIDCode` varchar(10) NULL,
	`CurrencyCode` varchar(50) NULL,
	`BuyersEngChangeLevel` varchar(50) NULL,
	`EngChangeLevel` varchar(50) NULL
	);

CREATE TABLE `tblEDI_850_N1`(
	`NO` int PRIMARY KEY AUTO_INCREMENT NOT NULL,
	`HdrKey` varchar(100) NULL,
	`LineKey` varchar(100) NULL,
	`N1Key` varchar(100) NOT NULL,
	`EntityIDCode` varchar(50) NULL,
	`Name` varchar(100) NULL,
	`SplIDCodeQual` varchar(10) NULL,
	`Code` varchar(50) NULL,
	`CorpName` varchar(100) NULL,
	`Address1` varchar(100) NULL,
	`Address2` varchar(100) NULL,
	`City` varchar(50) NULL,
	`State` varchar(50) NULL,
	`Zip` varchar(50) NULL,
	`Country` varchar(50) NULL,
	`ContactCode` varchar(10) NULL,
	`ContactName` varchar(100) NULL,
	`CommQual` varchar(10) NULL,
	`CommNum` varchar(50) NULL,
	`SCACCodeQual` varchar(10) NULL,
	`SCACCode` varchar(50) NULL
	);

CREATE TABLE `tblEDI_850_N9`(
	`NO` int PRIMARY KEY AUTO_INCREMENT NOT NULL,
	`HdrKey` varchar(100) NULL,
	`LineKey` varchar(100) NULL,
	`N9Key` varchar(100) NOT NULL,
	`RefQual` varchar(50) NULL,
	`RefNum` varchar(100) NULL,
	`Description` varchar(200) NULL,
	`Msg` varchar(200) NULL
	);

CREATE TABLE `tblEDI_850_NTE`(
	`NO` int PRIMARY KEY AUTO_INCREMENT NOT NULL,
	`NteKey` varchar(100) NOT NULL,
	`HdrKey` varchar(100) NULL,
	`LineKey` varchar(100) NULL,
	`DtlKey` varchar(100) NULL,
	`NoteRefCode` varchar(50) NULL,
	`Description` varchar(200) NULL
	);

CREATE TABLE `tblEDI_850_PID`(
	`NO` int PRIMARY KEY AUTO_INCREMENT NOT NULL,
	`HdrKey` varchar(50) NULL,
	`LineKey` varchar(50) NULL,
	`PidKey` varchar(50) NOT NULL,
	`ItemDescType` varchar(10) NULL,
	`ProductCharCode` varchar(10) NULL,
	`ItemDescQual` varchar(10) NULL,
	`ProductDescCode` varchar(10) NULL,
	`Description` varchar(200) NULL,
	`SLPCode` varchar(10) NULL,
	`SlnKey` varchar(100) NULL
	);

CREATE TABLE `tblEDI_850_PO3`(
	`NO` int PRIMARY KEY AUTO_INCREMENT NOT NULL,
	`HdrKey` varchar(50) NULL,
	`LineKey` varchar(50) NULL,
	`PO3Key` varchar(50) NOT NULL,
	`ChangeReasonCode` varchar(10) NULL,
	`PriceQual` varchar(10) NULL,
	`UnitPrice` double NULL,
	`BasisOfUnitPriceCode` varchar(10) NULL,
	`Quantity` int NULL,
	`UnitBasisMsrCode` varchar(50) NULL
	);

CREATE TABLE `tblEDI_850_REF`(
	`NO` int PRIMARY KEY AUTO_INCREMENT NOT NULL,
	`HdrKey` varchar(100) NULL,
	`LineKey` varchar(100) NULL,
	`RefKey` varchar(100) NOT NULL,
	`RefQual` varchar(10) NULL,
	`RefNum` varchar(100) NULL,
	`Description` varchar(200) NULL
	);


CREATE TABLE `tblEDI_850_SAC`(
	`NO` int PRIMARY KEY AUTO_INCREMENT NOT NULL,
	`HdrKey` varchar(100) NULL,
	`LineKey` varchar(100) NULL,
	`SacKey` varchar(100) NOT NULL,
	`AllowanceChargeIndicator` varchar(50) NULL,
	`SACCode` varchar(50) NULL,
	`AgencyQual` varchar(50) NULL,
	`AgencyCode` varchar(50) NULL,
	`Amount` double NULL,
	`MethodHandlingCode` varchar(50) NULL,
	`Description` varchar(100) NULL
	);

CREATE TABLE `tblEDI_850_SCH`(
	`NO` int PRIMARY KEY AUTO_INCREMENT NOT NULL,
	`HdrKey` varchar(100) NULL,
	`LineKey` varchar(100) NULL,
	`SchKey` varchar(100) NOT NULL,
	`EntityIDCode` varchar(100) NULL,
	`Name` varchar(100) NULL,
	`Qty` int NULL,
	`UOM` varchar(100) NULL,
	`Description` varchar(100) NULL,
	`DtmReqQual` varchar(100) NULL,
	`DeliveryReqDate` datetime NULL,
	`DtmPromisedQual` varchar(100) NULL,
	`DeliveryPromisedDate` datetime NULL,
	`ContainerQty` int NULL,
	`ContainerType` varchar(100) NULL,
	`N1Key` varchar(100) NULL
	);

CREATE TABLE `tblEDI_850_SHH`(
	`NO` int PRIMARY KEY AUTO_INCREMENT NOT NULL,
	`HdrKey` varchar(50) NULL,
	`LineKey` varchar(50) NULL,
	`ShhKey` varchar(50) NOT NULL,
	`SchedulingCode` varchar(10) NULL,
	`DtmQual` varchar(50) NULL,
	`Date` datetime NULL,
	`Description` varchar(200) NULL
	);

CREATE TABLE `tblEDI_850_SLN`(
	`NO` int PRIMARY KEY AUTO_INCREMENT NOT NULL,
	`HdrKey` varchar(100) NULL,
	`LineKey` varchar(100) NULL,
	`SlnKey` varchar(100) NOT NULL,
	`AssignedID` varchar(50) NULL,
	`RelationshipCode` varchar(50) NULL,
	`ProductIDQual` varchar(50) NULL,
	`ProductID` varchar(50) NULL
	);

CREATE TABLE `tblEDI_856_HEADER`(
	`NO` int PRIMARY KEY AUTO_INCREMENT NOT NULL,
	`HdrKey` varchar(100) NOT NULL,
	`ISAControlNum` varchar(50) NULL,
	`ISASenderID` varchar(50) NULL,
	`GSControlNum` varchar(50) NULL,
	`GSSenderID` varchar(50) NULL,
	`TransSetID` varchar(50) NULL,
	`TransSetControlNum` varchar(50) NULL,
	`TransSetPurpose` varchar(50) NULL,
	`ASNNumber` varchar(50) NULL,
	`GeneratedDateTime` datetime NULL,
	`DateAdded` datetime NOT NULL,
	`SubmitDateTime` datetime NULL,
	`DateQual` varchar(50) NULL,
	`ShipDate` datetime NULL,
	`HashTotal` int NULL,
	`blnRepFlag` tinyint DEFAULT 1 NULL,
	`GSReceiverID` varchar(50) NULL,
	blnEmailFlag BIT DEFAULT 0 NULL
	);

CREATE TRIGGER `tblEDI_856_HEADER_INSERT` BEFORE INSERT ON `tblEDI_856_HEADER`
FOR EACH ROW 
SET new.DateAdded = now();
	
CREATE TABLE `tblEDI_856_HL2`(
	`NO` int PRIMARY KEY AUTO_INCREMENT NOT NULL,
	`HdrKey` varchar(100) NULL,
	`LineKey` varchar(100) NULL,
	`HL2Key` varchar(100) NOT NULL,
	`HLIDNo` varchar(50) NULL,
	`HLParentIDNo` varchar(50) NULL,
	`HLCode` varchar(50) NULL,
	`PkgIDQual` varchar(50) NULL,
	`PkgType` varchar(50) NULL,
	`ReturnSNIDQual` varchar(50) NULL,
	`ReturnSN` varchar(50) NULL,
	`MasterMixLabelQual` varchar(50) NULL,
	`MasterMixSN` varchar(50) NULL
	);

CREATE TABLE `tblEDI_856_HL3`(
	`NO` int PRIMARY KEY AUTO_INCREMENT NOT NULL,
	`HdrKey` varchar(100) NULL,
	`LineKey` varchar(100) NULL,
	`HL2Key` varchar(100) NULL,
	`HL3Key` varchar(100) NOT NULL,
	`HLIDNo` varchar(50) NULL,
	`HLParentIDNo` varchar(50) NULL,
	`HLCode` varchar(50) NULL,
	`PartNoQual` varchar(50) NULL,
	`PartNo` varchar(50) NULL,
	`DCPartLevelQual` varchar(50) NULL,
	`DCPartLevel` varchar(50) NULL,
	`LotNoQual` varchar(50) NULL,
	`LotNo` varchar(50) NULL,
	`ShipSchedQual` varchar(50) NULL,
	`ShipSchedNo` varchar(50) NULL,
	`ProjNoQual` varchar(50) NULL,
	`ProjNo` varchar(50) NULL,
	`POQual` varchar(50) NULL,
	`PONo` varchar(50) NULL,
	`IPPTag1Qual` varchar(50) NULL,
	`IPPTag1No` varchar(50) NULL,
	`IPPTag1ReasonQual` varchar(50) NULL,
	`IPPTag1ReasonCode` varchar(50) NULL,
	`IPPTag2Qual` varchar(50) NULL,
	`IPPTag2No` varchar(50) NULL,
	`IPPTag2ReasonQual` varchar(50) NULL,
	`IPPTag2ReasonCode` varchar(50) NULL,
	`SupplierLotNoQual` varchar(50) NULL,
	`SupplierLotNo` varchar(50) NULL,
	`ReturnSNIDQual` varchar(50) NULL,
	`ReturnSN` varchar(50) NULL,
	`ContPkgIDQual` varchar(50) NULL,
	`ContPkgType` varchar(50) NULL,
	`CountryOfOrgQual` varchar(50) NULL,
	`CountryOfOrg` varchar(50) NULL,
	`Quantity` double NULL,
	`UOM` varchar(50) NULL,
	`ContLabelQual` varchar(50) NULL,
	`ContLabelSN` varchar(50) NULL
	);

CREATE TABLE `tblEDI_856_LINE`(
	`NO` int PRIMARY KEY AUTO_INCREMENT NOT NULL,
	`LineKey` varchar(100) NOT NULL,
	`HdrKey` varchar(100) NULL,
	`HLIDNo` varchar(50) NULL,
	`HLCode` varchar(50) NULL,
	`WeightQual` varchar(50) NULL,
	`Weight` double NULL,
	`UOM` varchar(50) NULL,
	`SCACCodeQual` varchar(50) NULL,
	`SCACCode` varchar(50) NULL,
	`TrackingNo` varchar(50) NULL,
	`EquipDescCode` varchar(50) NULL,
	`TrailerNo` varchar(50) NULL,
	`SpecialHandlingCode` varchar(50) NULL,
	`BOLQual` varchar(50) NULL,
	`BOLNo` varchar(10) NULL
	);

CREATE TABLE `tblEDI_856_N1`(
	`NO` int PRIMARY KEY AUTO_INCREMENT NOT NULL,
	`HdrKey` varchar(100) NULL,
	`LineKey` varchar(100) NULL,
	`N1Key` varchar(100) NOT NULL,
	`EntityIDCode` varchar(50) NULL,
	`CodeQual` varchar(50) NULL,
	`Code` varchar(50) NULL
	);

CREATE TABLE `tblEDI_856_DTM`(
	`NO` int PRIMARY KEY AUTO_INCREMENT NOT NULL,
	`DtmKey` varchar(100) NOT NULL,
	`HdrKey` varchar(100) NULL,
	`LineKey` varchar(100) NULL,
	`DtmQual` varchar(50) NULL,
	`Date` datetime NULL
);

CREATE TABLE `tblEDI_856_REF`(
	`NO` int PRIMARY KEY AUTO_INCREMENT NOT NULL,
	`RefKey` varchar(100) NOT NULL,
	`HL3Key` varchar(100) NULL,
	`HL2Key` varchar(100) NULL,
	`LineKey` varchar(100) NULL,
	`HdrKey` varchar(100) NULL,
	`RefQual` varchar(50) NULL,
	`RefNum` varchar(100) NULL
);


CREATE TABLE `tblEDI_860_CTP`(
	`NO` int PRIMARY KEY AUTO_INCREMENT NOT NULL,
	`HdrKey` varchar(50) NULL,
	`LineKey` varchar(50) NULL,
	`CtpKey` varchar(50) NOT NULL,
	`PriceIDCode` varchar(50) NULL,
	`UnitPrice` double NULL
	);

CREATE TABLE `tblEDI_860_DTM`(
	`NO` int PRIMARY KEY AUTO_INCREMENT NOT NULL,
	`HdrKey` varchar(50) NULL,
	`LineKey` varchar(50) NULL,
	`DtmKey` varchar(50) NOT NULL,
	`DtmQual` varchar(50) NULL,
	`Date` datetime NULL
	);

CREATE TABLE `tblEDI_860_HEADER`(
	`NO` int PRIMARY KEY AUTO_INCREMENT NOT NULL,
	`HdrKey` varchar(100) NOT NULL,
	`ISASenderID` varchar(50) NULL,
	`ISAControlNum` varchar(50) NULL,
	`SubmitDateTime` datetime NULL,
	`GSSenderID` varchar(50) NULL,
	`GSControlNum` varchar(50) NULL,
	`TransSetID` varchar(50) NULL,
	`TransSetControlNum` varchar(50) NULL,
	`TransSetPurpose` varchar(50) NULL,
	`POTypeCode` varchar(50) NULL,
	`PONum` varchar(50) NULL,
	`ChangeOrderSeqNum` varchar(50) NULL,
	`PODate` datetime NULL,
	`EntityIDCode` varchar(10) NULL,
	`Currency` varchar(50) NULL,
	`ExchangeRate` double NULL,
	`FOBShpMethod` varchar(50) NULL,
	`FOBLocationQual` varchar(50) NULL,
	`FOBDescription` varchar(200) NULL,
	`FOBLocationQual2` varchar(50) NULL,
	`FOBDescription2` varchar(200) NULL,
	`TransMethod` varchar(50) NULL,
	`CarrierName` varchar(100) NULL,
	`DateAdded` datetime NOT NULL,
	`GeneratedDateTime` datetime NULL,
	`AdminFuncCode_hdr` varchar(50) NULL,
	`AdminContact_hdr` varchar(100) NULL,
	`AdminCommNumQual_hdr` varchar(50) NULL,
	`AdminPhone_hdr` varchar(50) NULL,
	`CTPClass` varchar(50) NULL,
	`STPPriceQual` varchar(50) NULL,
	`TextMessageCode` varchar(10) NULL,
	`Check864` varchar(50) NULL,
	`blnRepFlag` tinyint DEFAULT 1 NULL,
	`ReleaseNum` varchar(50) NULL,
	`FOBTransTermsQual` varchar(50) NULL,
	`FOBTransTermsCode` varchar(50) NULL,
	`GSReceiverID` varchar(50) NULL
	);

CREATE TRIGGER `tblEDI_860_HEADER_INSERT` BEFORE INSERT ON `tblEDI_860_HEADER`
FOR EACH ROW 
SET new.DateAdded = now();

CREATE TABLE `tblEDI_860_ITA`(
	`NO` int PRIMARY KEY AUTO_INCREMENT NOT NULL,
	`HdrKey` varchar(50) NULL,
	`LineKey` varchar(50) NULL,
	`ItaKey` varchar(50) NOT NULL,
	`AllowanceID` varchar(10) NULL,
	`SpecialServiceCode` varchar(50) NULL,
	`AllowanceMethodofHdlCode` varchar(50) NULL,
	`AllowanceNum` varchar(50) NULL,
	`AllowanceTtlAmt` varchar(50) NULL,
	`UBMsrCode` varchar(50) NULL,
	`Description` varchar(50) NULL,
	`SpecialChargeCode` varchar(50) NULL
	);

CREATE TABLE `tblEDI_860_ITD`(
	`NO` int PRIMARY KEY AUTO_INCREMENT NOT NULL,
	`HdrKey` varchar(100) NULL,
	`LineKey` varchar(100) NULL,
	`ItdKey` varchar(100) NOT NULL,
	`TermsTypeCode` varchar(100) NULL,
	`TermsBasisDateCode` varchar(100) NULL,
	`TermsDiscountPercent` double NULL,
	`TermsDiscountDueDate` datetime NULL,
	`TermsDiscountDaysDue` int NULL,
	`TermsNetDueDate` datetime NULL,
	`TermsNetDays` int NULL,
	`TermsDiscountAmt` double NULL,
	`TermsDifferredDueDate` datetime NULL,
	`DifferredAmtDue` double NULL,
	`PctOfInvoicePayable` double NULL,
	`Description` varchar(100) NULL,
	`DayOfMonth` int NULL
	);

CREATE TABLE `tblEDI_860_LINE`(
	`NO` int PRIMARY KEY AUTO_INCREMENT NOT NULL,
	`HdrKey` varchar(100) NULL,
	`LineKey` varchar(100) NOT NULL,
	`PONum` varchar(50) NULL,
	`POLineNum` varchar(50) NULL,
	`LineItemChange` varchar(50) NULL,
	`QtyOrdered` double NULL,
	`QtyLeftToRcv` double NULL,
	`UOM` varchar(50) NULL,
	`UnitPrice` double NULL,
	`ProdID1Qual` varchar(50) NULL,
	`ProdID1` varchar(50) NULL,
	`ProdID2Qual` varchar(50) NULL,
	`ProdID2` varchar(50) NULL,
	`ProdID3Qual` varchar(50) NULL,
	`ProdID3` varchar(50) NULL,
	`CurrencyCode` varchar(50) NULL,
	`UOMCode` varchar(50) NULL
	);

CREATE TABLE `tblEDI_860_MSG`(
	`NO` int PRIMARY KEY AUTO_INCREMENT NOT NULL,
	`MsgKey` varchar(100) NOT NULL,
	`N9Key` varchar(100) NULL,
	`HdrKey` varchar(100) NULL,
	`MsgText` varchar(1000) NULL
	);

CREATE TABLE `tblEDI_860_N1`(
	`NO` int PRIMARY KEY AUTO_INCREMENT NOT NULL,
	`HdrKey` varchar(100) NULL,
	`LineKey` varchar(100) NULL,
	`N1Key` varchar(100) NOT NULL,
	`EntityIDCode` varchar(50) NULL,
	`Name` varchar(100) NULL,
	`SplIDCodeQual` varchar(10) NULL,
	`Code` varchar(50) NULL,
	`Address1` varchar(100) NULL,
	`Address2` varchar(100) NULL,
	`City` varchar(50) NULL,
	`State` varchar(50) NULL,
	`Zip` varchar(50) NULL,
	`Country` varchar(50) NULL,
	`ContactCode` varchar(10) NULL,
	`ContactName` varchar(100) NULL,
	`CommQual` varchar(10) NULL,
	`CommNum` varchar(50) NULL,
	`SCACCodeQual` varchar(10) NULL,
	`SCACCode` varchar(50) NULL,
	`CorpName` varchar(50) NULL,
	`CommQual2` varchar(10) NULL,
	`CommNum2` varchar(50) NULL
	);


CREATE TABLE `tblEDI_860_N9`(
	`NO` int PRIMARY KEY AUTO_INCREMENT NOT NULL,
	`HdrKey` varchar(100) NULL,
	`LineKey` varchar(100) NULL,
	`N9Key` varchar(100) NOT NULL,
	`RefQual` varchar(50) NULL,
	`RefNum` varchar(100) NULL,
	`Description` varchar(200) NULL,
	`Msg` varchar(200) NULL
	);

CREATE TABLE `tblEDI_860_NTE`(
	`NO` int PRIMARY KEY AUTO_INCREMENT NOT NULL,
	`NteKey` varchar(100) NOT NULL,
	`HdrKey` varchar(100) NULL,
	`LineKey` varchar(100) NULL,
	`DtlKey` varchar(100) NULL,
	`NoteRefCode` varchar(50) NULL,
	`Description` varchar(200) NULL,
	`N9Key` varchar(100) NULL
	);

CREATE TABLE `tblEDI_860_PID`(
	`NO` int PRIMARY KEY AUTO_INCREMENT NOT NULL,
	`HdrKey` varchar(50) NULL,
	`LineKey` varchar(50) NULL,
	`PidKey` varchar(50) NOT NULL,
	`ItemDescType` varchar(10) NULL,
	`ProductCharCode` varchar(10) NULL,
	`ItemDescQual` varchar(10) NULL,
	`ProductDescCode` varchar(10) NULL,
	`Description` varchar(200) NULL,
	`SLPCode` varchar(10) NULL,
	`SlnKey` varchar(100) NULL
	);

CREATE TABLE `tblEDI_860_PKG`(
	`NO` int PRIMARY KEY AUTO_INCREMENT NOT NULL,
	`HdrKey` varchar(100) NULL,
	`LineKey` varchar(100) NULL,
	`PkgKey` varchar(100) NOT NULL,
	`ItemDescrpType` varchar(50) NULL,
	`PkgCharCode` varchar(50) NULL,
	`PkgDescription` varchar(100) NULL

	);

CREATE TABLE `tblEDI_860_PO3`(
	`NO` int PRIMARY KEY AUTO_INCREMENT NOT NULL,
	`HdrKey` varchar(50) NULL,
	`LineKey` varchar(50) NULL,
	`PO3Key` varchar(50) NOT NULL,
	`ChangeReasonCode` varchar(10) NULL,
	`PriceQual` varchar(10) NULL,
	`UnitPrice` double NULL,
	`BasisOfUnitPriceCode` varchar(10) NULL,
	`Quantity` int NULL,
	`UnitBasisMsrCode` varchar(50) NULL

	);

CREATE TABLE `tblEDI_860_REF`(
	`NO` int PRIMARY KEY AUTO_INCREMENT NOT NULL,
	`HdrKey` varchar(100) NULL,
	`LineKey` varchar(100) NULL,
	`RefKey` varchar(100) NOT NULL,
	`RefQual` varchar(10) NULL,
	`RefNum` varchar(100) NULL,
	`Description` varchar(200) NULL
	);

CREATE TABLE `tblEDI_860_SAC`(
	`NO` int PRIMARY KEY AUTO_INCREMENT NOT NULL,
	`HdrKey` varchar(100) NULL,
	`LineKey` varchar(100) NULL,
	`SacKey` varchar(100) NOT NULL,
	`AllowanceChargeIndicator` varchar(50) NULL,
	`SACCode` varchar(50) NULL,
	`AgencyQual` varchar(50) NULL,
	`AgencyCode` varchar(50) NULL,
	`Amount` double NULL,
	`MethodHandlingCode` varchar(50) NULL,
	`Description` varchar(100) NULL
	);


CREATE TABLE `tblEDI_860_SCH`(
	`NO` int PRIMARY KEY AUTO_INCREMENT NOT NULL,
	`HdrKey` varchar(100) NULL,
	`LineKey` varchar(100) NULL,
	`SchKey` varchar(100) NOT NULL,
	`EntityIDCode` varchar(100) NULL,
	`Name` varchar(100) NULL,
	`Qty` int NULL,
	`UOM` varchar(100) NULL,
	`Description` varchar(100) NULL,
	`DtmReqQual` varchar(100) NULL,
	`DeliveryReqDate` datetime NULL,
	`DtmPromisedQual` varchar(100) NULL,
	`DeliveryPromisedDate` datetime NULL,
	`ContainerQty` int NULL,
	`ContainerType` varchar(100) NULL,
	`AssignedID` varchar(50) NULL,
	`N1Key` varchar(100) NULL
	);

CREATE TABLE `tblEDI_860_SHH`(
	`NO` int PRIMARY KEY AUTO_INCREMENT NOT NULL,
	`HdrKey` varchar(50) NULL,
	`ShhKey` varchar(50) NOT NULL,
	`SchedulingCode` varchar(10) NULL,
	`DtmQual` varchar(50) NULL,
	`Date` datetime NULL,
	`Description` varchar(200) NULL
	);

CREATE TABLE `tblEDI_860_SLN`(
	`NO` int PRIMARY KEY AUTO_INCREMENT NOT NULL,
	`HdrKey` varchar(100) NULL,
	`LineKey` varchar(100) NULL,
	`SlnKey` varchar(100) NOT NULL,
	`AssignedID` varchar(50) NULL,
	`RelationshipCode` varchar(50) NULL,
	`ProductIDQual` varchar(50) NULL,
	`ProductID` varchar(50) NULL
	);

CREATE TABLE `tblEDI_860_TD5`(
	`NO` int PRIMARY KEY AUTO_INCREMENT NOT NULL,
	`TD5Key` varchar(100) NOT NULL,
	`HdrKey` varchar(100) NULL,
	`TransMethod` varchar(50) NULL,
	`CarrierName` varchar(100) NULL
	);

CREATE TABLE `tblEDI_861_DTM`(
	`NO` int PRIMARY KEY AUTO_INCREMENT NOT NULL,
	`HdrKey` varchar(50) NULL,
	`DtmKey` varchar(50) NOT NULL,
	`DtmQual` varchar(50) NULL,
	`Date` datetime NULL,
	`TimeCode` varchar(50) NULL
	);

CREATE TABLE `tblEDI_861_HEADER`(
	`NO` int PRIMARY KEY AUTO_INCREMENT NOT NULL,
	`HdrKey` varchar(100) NOT NULL,
	`ISASenderID` varchar(50) NULL,
	`ISAControlNum` varchar(50) NULL,
	`GSSenderID` varchar(50) NULL,
	`GSControlNum` varchar(50) NULL,
	`TransSetID` varchar(50) NULL,
	`TransSetControlNum` varchar(50) NULL,
	`TransSetPurpose` varchar(50) NULL,
	`ReceivingAdviceNum` varchar(50) NULL,
	`ReceivingAdviceTypeCode` varchar(50) NULL,
	`GeneratedDateTime` datetime NULL,
	`DateQual` varchar(50) NULL,
	`ReceiptDateTime` datetime NULL,
	`DateAdded` datetime NOT NULL,
	`SubmitDateTime` datetime NULL,
	`blnRepFlag` tinyint DEFAULT 1 NULL,
	`GSReceiverID` varchar(50) NULL
	);

CREATE TRIGGER `tblEDI_861_HEADER_INSERT` BEFORE INSERT ON `tblEDI_861_HEADER`
FOR EACH ROW 
SET new.DateAdded = now();	
	
CREATE TABLE `tblEDI_861_LINE`(
	`NO` int PRIMARY KEY AUTO_INCREMENT NOT NULL,
	`HdrKey` varchar(100) NULL,
	`LineKey` varchar(100) NOT NULL,
	`RecvdQty` double NULL,
	`RecvdQtyUOM` varchar(50) NULL,
	`RecvdConditionCode` varchar(50) NULL,
	`ReturnQty` double NULL,
	`ReturnQtyUOM` varchar(50) NULL,
	`QuestionQty` double NULL,
	`QuestionQtyUOM` varchar(50) NULL,
	`QuestionConditionCode` varchar(50) NULL,
	`Question2Qty` double NULL,
	`Question2QtyUOM` varchar(50) NULL,
	`Question2ConditionCode` varchar(50) NULL,
	`ShippedUnit` double NULL,
	`ShippedUnitUOM` varchar(50) NULL,
	`ProdIDQual` varchar(50) NULL,
	`BuyersPartID` varchar(50) NULL,
	`ProdIDQual2` varchar(50) NULL,
	`BuyersEngChangeLevel` varchar(50) NULL,
	`ShipScheduleQual` varchar(50) NULL,
	`ShipScheduleNum` varchar(50) NULL,
	`ProjNumQual` varchar(50) NULL,
	`ProjNum` varchar(50) NULL,
	`POQual` varchar(50) NULL,
	`PONum` varchar(50) NULL,
	`ContainerLabelSNQual` varchar(50) NULL,
	`ContainerLabelSN` varchar(100) NULL,
	`PalletLabelSNQual` varchar(50) NULL,
	`PalletLabelSN` varchar(100) NULL,
	`BOLNum` varchar(50) NULL,
	`ASN_PLNum` varchar(50) NULL,
	`ItemDescriptionType` varchar(50) NULL,
	`ItemDescriptionCode` varchar(50) NULL,
	`ItemDescription` varchar(150) NULL
	);

CREATE TABLE `tblEDI_861_N1`(
	`NO` int PRIMARY KEY AUTO_INCREMENT NOT NULL,
	`HdrKey` varchar(100) NULL,
	`LineKey` varchar(100) NULL,
	`N1Key` varchar(100) NOT NULL,
	`EntityIDCode` varchar(50) NULL,
	`CodeQual` varchar(50) NULL,
	`Name` varchar(100) NULL,
	`Code` varchar(50) NULL,
	`Address1` varchar(100) NULL,
	`Address2` varchar(100) NULL,
	`City` varchar(50) NULL,
	`State` varchar(50) NULL,
	`Zip` varchar(50) NULL,
	`Country` varchar(50) NULL,
	`ContactCode` varchar(50) NULL,
	`ContactName` varchar(100) NULL
	);

CREATE TABLE `tblEDI_861_REF`(
	`NO` int PRIMARY KEY AUTO_INCREMENT NOT NULL,
	`HdrKey` varchar(100) NULL,
	`LineKey` varchar(100) NULL,
	`RefKey` varchar(100) NOT NULL,
	`RefQual` varchar(10) NULL,
	`RefNum` varchar(100) NULL,
	`Description` varchar(200) NULL,
	`RefID` varchar(100) NULL
	);

CREATE TABLE `tblEDI_862_ATH`(
	`NO` int PRIMARY KEY AUTO_INCREMENT NOT NULL,
	`HdrKey` varchar(100) NULL,
	`LineKey` varchar(100) NULL,
	`AthKey` varchar(100) NOT NULL,
	`ResourceAuthCode` varchar(50) NULL,
	`ResourceAuth_ThruDate` datetime NULL,
	`CumAthQty` varchar(50) NULL,
	`AthQty` varchar(50) NULL,
	`CumStartDate` datetime NULL
	);

CREATE TABLE `tblEDI_862_DETAIL`(
	`NO` int PRIMARY KEY AUTO_INCREMENT NOT NULL,
	`HdrKey` varchar(100) NULL,
	`LineKey` varchar(100) NULL,
	`DtlKey` varchar(100) NOT NULL,
	`TotalDailyQty` double NULL,
	`DiffQty` double NULL,
	`ForecastQual` varchar(50) NULL,
	`ForecastTimeQual` varchar(50) NULL,
	`FST_DeliveryShipmentDate` datetime NULL,
	`DateTimeQual` varchar(50) NULL,
	`DeliveryShipDate` datetime NULL,
	`RefNumQual` varchar(50) NULL,
	`RefNum` varchar(50) NULL
	);


CREATE TABLE `tblEDI_862_DTM`(
	`NO` int PRIMARY KEY AUTO_INCREMENT NOT NULL,
	`HdrKey` varchar(50) NULL,
	`LineKey` varchar(50) NULL,
	`DtlKey` varchar(50) NULL,
	`FstKey` varchar(50) NULL,
	`DtmKey` varchar(50) NOT NULL,
	`DtmQual` varchar(50) NULL,
	`CreateDateTime` datetime NULL,
	`TimeCode` varchar(50) NULL
	);

CREATE TABLE `tblEDI_862_EXPORT`(
	`NO` int PRIMARY KEY AUTO_INCREMENT NOT NULL,
	`ExportNo` int NOT NULL,
	`JitKey` varchar(100) NOT NULL,
	`ExportQty` double NULL,
	`PONum` varchar(50) NULL,
	`PONum_Suffix` int NULL,
	`ExportDateTime` datetime NULL
	);

CREATE TABLE `tblEDI_862_HEADER`(
	`NO` int PRIMARY KEY AUTO_INCREMENT NOT NULL,
	`HdrKey` varchar(100) NOT NULL,
	`ISASenderID` varchar(50) NULL,
	`ISAControlNum` varchar(50) NULL,
	`SubmitDateTime` datetime NULL,
	`GSSenderID` varchar(50) NULL,
	`GSControlNum` varchar(50) NULL,
	`TransSetID` varchar(50) NULL,
	`TransSetControlNum` varchar(50) NULL,
	`TransSetPurpose` varchar(50) NULL,
	`ReferenceID` varchar(50) NULL,
	`GeneratedDateTime` datetime NULL,
	`ScheduleTypeQual` varchar(50) NULL,
	`HorizonStartDate` datetime NULL,
	`HorizonEndDate` datetime NULL,
	`ReleaseNumber` varchar(20) NULL,
	`ContactNumber` varchar(20) NULL,
	`PONum` varchar(20) NULL,
	`ScheduleQtyQual` varchar(50) NULL,
	`AdminFuncCode_hdr` varchar(50) NULL,
	`AdminContact_hdr` varchar(100) NULL,
	`AdminCommNumQual_hdr` varchar(50) NULL,
	`AdminPhone_hdr` varchar(50) NULL,
	`DateAdded` datetime NOT NULL,
	`blnRepFlag` tinyint DEFAULT 1 NULL,
	`GSReceiverID` varchar(50) NULL,
	`blnEmailFlag` tinyint DEFAULT 0 NULL

	);

CREATE TRIGGER `tblEDI_862_HEADER_INSERT` BEFORE INSERT ON `tblEDI_862_HEADER`
FOR EACH ROW 
SET new.DateAdded = now();	
	
CREATE TABLE `tblEDI_862_JIT`(
	`NO` int PRIMARY KEY AUTO_INCREMENT NOT NULL,
	`HdrKey` varchar(100) NULL,
	`LineKey` varchar(100) NULL,
	`DtlKey` varchar(100) NULL,
	`JitKey` varchar(100) NOT NULL,
	`Quantity` double NULL,
	`DeliveryShipTime` datetime NULL,
	`HondaLotNumberQual` varchar(10) NULL,
	`HondaLotNumber` varchar(50) NULL,
	`SmallLotDeliveryBatchNumQual` varchar(10) NULL,
	`SmallLotDeliveryBatchNum` varchar(50) NULL,
	`LotSequenceNumQual` varchar(10) NULL,
	`LotSequenceNum` varchar(50) NULL,
	`ShipScheduleOrderNumQual` varchar(50) NULL,
	`ShipScheduleOrderNum` varchar(50) NULL,
	`blnPrint` tinyint NULL,
	`ShipmentTimeQual` varchar(50) NULL,
	`ShipmentTime` datetime NULL
	);

CREATE TABLE `tblEDI_862_LINE`(
	`NO` int PRIMARY KEY AUTO_INCREMENT NOT NULL,
	`HdrKey` varchar(100) NULL,
	`LineKey` varchar(100) NOT NULL,
	`AssignedID` varchar(50) NULL,
	`PartIDQual` varchar(10) NULL,
	`BuyersPartID` varchar(50) NULL,
	`DCPartLevelQual` varchar(10) NULL,
	`DCPartLevel` varchar(50) NULL,
	`PartDescQual` varchar(10) NULL,
	`PartDescription` varchar(100) NULL,
	`PartLevelShipScheduleNumQual` varchar(10) NULL,
	`PartLevelShipScheduleNum` varchar(50) NULL,
	`ProjectNoQual` varchar(10) NULL,
	`ProjectNo` varchar(50) NULL,
	`PackagingCode` varchar(50) NULL,
	`QtyPerContainer` int NULL,
	`ContainerType` varchar(50) NULL,
	`WeightQual` varchar(10) NULL,
	`Weight` varchar(50) NULL,
	`TD1UOM` varchar(10) NULL,
	`EquipDescCode` varchar(10) NULL,
	`EquipNum` varchar(50) NULL,
	`RoutingSeqCode` varchar(10) NULL,
	`SCACCodeQual` varchar(10) NULL,
	`SCACCode` varchar(50) NULL,
	`TransMethodTypeCode` varchar(50) NULL,
	`Routing` varchar(50) NULL,
	`ShipOrdStatusCode` varchar(50) NULL,
	`LocationQual` varchar(50) NULL,
	`LocationID` varchar(50) NULL,
	`TransDirectionCode` varchar(50) NULL,
	`TransTimeDirectionQual` varchar(50) NULL,
	`TransTime` varchar(50) NULL,
	`UOM` varchar(50) NULL,
	`UnitPrice` double NULL,
	`NoteRefCode` varchar(10) NULL,
	`FreeFormMsg` varchar(200) NULL,
	`AdminFuncCode_lin` varchar(50) NULL,
	`AdminContact_lin` varchar(100) NULL,
	`AdminCommNumQual_lin` varchar(50) NULL,
	`AdminPhone_lin` varchar(50) NULL,
	`PalletType` varchar(50) NULL
	);

CREATE TABLE `tblEDI_862_N1`(
	`NO` int PRIMARY KEY AUTO_INCREMENT NOT NULL,
	`HdrKey` varchar(100) NULL,
	`LineKey` varchar(100) NULL,
	`N1Key` varchar(100) NOT NULL,
	`EntityIDCode` varchar(50) NULL,
	`Name` varchar(100) NULL,
	`SqlNumQual` varchar(10) NULL,
	`Code` varchar(50) NULL,
	`CorpName` varchar(100) NULL,
	`Address1` varchar(100) NULL,
	`Address2` varchar(100) NULL,
	`City` varchar(50) NULL,
	`State` varchar(50) NULL,
	`Zip` varchar(50) NULL,
	`Country` varchar(50) NULL,
	`ContactCode` varchar(10) NULL,
	`ContactName` varchar(100) NULL,
	`CommQual` varchar(10) NULL,
	`CommNum` varchar(50) NULL,
	`NNALogContact` varchar(100) NULL,
	`Check864` varchar(100) NULL,
	`BuyerName` varchar(100) NULL,
	`RequestorName` varchar(100) NULL
	);

CREATE TABLE `tblEDI_862_REF`(
	`NO` int PRIMARY KEY AUTO_INCREMENT NOT NULL,
	`HdrKey` varchar(100) NULL,
	`LineKey` varchar(100) NULL,
	`DtlKey` varchar(100) NULL,
	`ShpKey` varchar(100) NULL,
	`RefKey` varchar(100) NOT NULL,
	`RefQual` varchar(10) NULL,
	`RefNum` varchar(100) NULL,
	`Description` varchar(200) NULL
	);

CREATE TABLE `tblEDI_862_SHP`(
	`NO` int PRIMARY KEY AUTO_INCREMENT NOT NULL,
	`HdrKey` varchar(100) NULL,
	`LineKey` varchar(100) NULL,
	`ShpKey` varchar(100) NOT NULL,
	`QtyQual` varchar(100) NULL,
	`ShipQty` double NULL,
	`DateQual` varchar(50) NULL,
	`LastShipDate` datetime NULL,
	`BegInventoryDate` datetime NULL
	);

CREATE TABLE `tblEDI_864_DTM`(
	`NO` int PRIMARY KEY AUTO_INCREMENT NOT NULL,
	`DtmKey` varchar(100) NOT NULL,
	`HdrKey` varchar(100) NULL,
	`DtmQual` varchar(50) NULL,
	`Date` datetime NULL,
	`TimeCode` varchar(50) NULL
	);

CREATE TABLE `tblEDI_864_HEADER`(
	`NO` int PRIMARY KEY AUTO_INCREMENT NOT NULL,
	`HdrKey` varchar(100) NOT NULL,
	`ISAControlNum` varchar(50) NULL,
	`ISASenderID` varchar(50) NULL,
	`GSControlNum` varchar(50) NULL,
	`GSSenderID` varchar(50) NULL,
	`TransSetID` varchar(50) NULL,
	`TransSetControlNum` varchar(50) NULL,
	`TransSetPurpose` varchar(50) NULL,
	`TransTypeCode` varchar(50) NULL,
	`TransDescription` varchar(100) NULL,
	`GeneratedDateTime` datetime NULL,
	`DateAdded` datetime NOT NULL,
	`SubmitDateTime` datetime NULL,
	`blnRepFlag` tinyint DEFAULT 1 NULL,
	`GSReceiverID` varchar(50) NULL
	);

CREATE TRIGGER `tblEDI_864_HEADER_INSERT` BEFORE INSERT ON `tblEDI_864_HEADER`
FOR EACH ROW 
SET new.DateAdded = now();	
	
CREATE TABLE `tblEDI_864_LINE`(
	`NO` int PRIMARY KEY AUTO_INCREMENT NOT NULL,
	`LineKey` varchar(100) NOT NULL,
	`HdrKey` varchar(100) NULL,
	`DocumentIDNum` varchar(50) NULL,
	`Description` varchar(100) NULL,
	`PageWidth` int NULL,
	`PageLengthLines` int NULL
	);

CREATE TABLE `tblEDI_864_MSG`(
	`NO` int PRIMARY KEY AUTO_INCREMENT NOT NULL,
	`MsgKey` varchar(100) NOT NULL,
	`HdrKey` varchar(100) NULL,
	`LineKey` varchar(100) NULL,
	`MsgText` varchar(1000) NULL,
	`CarriageControlCode` varchar(50) NULL
	);

CREATE TABLE `tblEDI_864_N1`(
	`NO` int PRIMARY KEY AUTO_INCREMENT NOT NULL,
	`HdrKey` varchar(100) NULL,
	`LineKey` varchar(100) NULL,
	`N1Key` varchar(100) NOT NULL,
	`EntityIDCode` varchar(50) NULL,
	`CodeQual` varchar(50) NULL,
	`Name` varchar(100) NULL,
	`CorporationName` varchar(100) NULL,
	`AdditionalName` varchar(100) NULL,
	`Code` varchar(50) NULL,
	`Address1` varchar(100) NULL,
	`Address2` varchar(100) NULL,
	`City` varchar(50) NULL,
	`State` varchar(50) NULL,
	`Zip` varchar(50) NULL,
	`Country` varchar(50) NULL,
	`ContactCode` varchar(50) NULL,
	`ContactName` varchar(100) NULL,
	`ContactNum1Qual` varchar(50) NULL,
	`ContactNumber1` varchar(50) NULL,
	`ContactNum2Qual` varchar(50) NULL,
	`ContactNumber2` varchar(50) NULL
	);


CREATE TABLE `tblEDI_997_DETAIL`(
	`NO` int PRIMARY KEY AUTO_INCREMENT NOT NULL,
	`DtlKey` varchar(100) NULL,
	`HdrKey` varchar(100) NULL,
	`LineKey` varchar(100) NULL,
	`SegmentIDCode` varchar(50) NULL,
	`SegmentPosition` int NULL,
	`LoopIDCode` varchar(50) NULL,
	`SegmentCode1` varchar(50) NULL,
	`SegmentCode2` varchar(50) NULL,
	`SegmentCode3` varchar(50) NULL,
	`SegmentCode4` varchar(50) NULL,
	`SegmentCode5` varchar(50) NULL,
	`ElementPosition` int NULL,
	`ElementRefNum` varchar(50) NULL,
	`ElementSyntaxErrorCode` varchar(50) NULL,
	`CopyBadDataElement` varchar(100) NULL
) ;

CREATE TABLE `tblEDI_997_HEADER`(
	`NO` int PRIMARY KEY AUTO_INCREMENT NOT NULL,
	`HdrKey` varchar(100) NOT NULL,
	`ISAControlNum` varchar(50) NULL,
	`ISASenderID` varchar(50) NULL,
	`GSControlNum` varchar(50) NULL,
	`GSSenderID` varchar(50) NULL,
	`TransSetID` varchar(50) NULL,
	`TransSetControlNum` varchar(50) NULL,
	`FunctionalIDCode` varchar(50) NULL,
	`GroupControlNum` varchar(50) NULL,
	`FunctionalGroupAckCode` varchar(50) NULL,
	`NumofTransSetsIncluded` int NULL,
	`NumofReceivedTransSets` int NULL,
	`NumofAcceptedTransSets` int NULL,
	`SubmitDateTime` datetime NULL,
	`DateAdded` datetime NOT NULL,
	`GeneratedDateTime` datetime NULL,
	`FunctionalGroupNoteCode1` varchar(50) NULL,
	`FunctionalGroupNoteCode2` varchar(50) NULL,
	`FunctionalGroupNoteCode3` varchar(50) NULL,
	`FunctionalGroupNoteCode4` varchar(50) NULL,
	`FunctionalGroupNoteCode5` varchar(50) NULL,
	`blnRepFlag` tinyint DEFAULT 1 NULL,
	`GSReceiverID` varchar(50) NULL,
	`blnEmailFlag` tinyint DEFAULT 0 NULL

	);

CREATE TRIGGER `tblEDI_997_HEADER_INSERT` BEFORE INSERT ON `tblEDI_997_HEADER`
FOR EACH ROW 
SET new.DateAdded = now();	
	
CREATE TABLE `tblEDI_997_LINE`(
	`NO` int PRIMARY KEY AUTO_INCREMENT NOT NULL,
	`LineKey` varchar(100) NOT NULL,
	`HdrKey` varchar(100) NULL,
	`TranSetIDCode` varchar(50) NULL,
	`TranSetControlNum` varchar(50) NULL,
	`TranSetAckCode` varchar(50) NULL,
	`TranSetSyntaxErrorCode` varchar(50) NULL,
	`TranSetNoteCode1` varchar(50) NULL,
	`TranSetNoteCode2` varchar(50) NULL,
	`TranSetNoteCode3` varchar(50) NULL,
	`TranSetNoteCode4` varchar(50) NULL,
	`TranSetNoteCode5` varchar(50) NULL
	);

  
  

 
 
 


