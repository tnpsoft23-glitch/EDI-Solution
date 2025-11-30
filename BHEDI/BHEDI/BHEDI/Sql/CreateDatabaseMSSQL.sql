--------------------------------------------------------------------
-- script to create databse MSSQL 
--------------------------------------------------------------------

--------------------------------------------------------------------
-- Configuration table 
--------------------------------------------------------------------

CREATE TABLE [tblEDIType] (
  [EDITypeNo] INTEGER PRIMARY KEY IDENTITY (1,1),
  [Name] NVARCHAR(50) NOT NULL

);

CREATE TABLE [tblEDIVersion] (
  [EDIVersionNo] INTEGER PRIMARY KEY IDENTITY (1,1),
  [Version] NVARCHAR(50) NOT NULL,
  [EDITypeNo_FK] INTEGER FOREIGN KEY REFERENCES [tblEDIType] ([EDITypeNo]) NOT NULL
);

CREATE TABLE [tblSegmentTerminator] (
  [SegmentTerminatorNo] INTEGER PRIMARY KEY IDENTITY (1,1),
  [TerminatorCode] INTEGER NOT NULL,
  [Terminator] NVARCHAR(10) NOT NULL
);

CREATE TABLE [tblErrorHandle] (
  [ErrorHandleNo] INTEGER PRIMARY KEY IDENTITY (1,1),
  [ErrorHandleCode] INTEGER NOT NULL,
  [Description] NVARCHAR(50) NULL
);

CREATE TABLE [tblEDITransactionSet] (
  [TransactionSetNo] INTEGER PRIMARY KEY IDENTITY (1,1),
  [TransactionSetID] NVARCHAR(50) NOT NULL,
  [Description] NVARCHAR(100) NULL,
  [InOut] BIT NOT NULL,
  [EDITypeNo_FK] INTEGER FOREIGN KEY REFERENCES [tblEDIType] ([EDITypeNo]) NOT NULL

);


CREATE TABLE [tblEDISegment] (
  [SegmentNo] INTEGER PRIMARY KEY IDENTITY (1,1),
  [SegmentCode] NVARCHAR(50) NOT NULL
);


CREATE TABLE [tblTradingPartner] (
  [TradingPartnerNo] INTEGER PRIMARY KEY IDENTITY (1,1),
  [TradingPartnerName] NVARCHAR(100) NOT NULL,
  [AuthorizationQual] NVARCHAR(50) NULL,
  [AuthorizationInfo] NVARCHAR(50) NULL,
  [SecurityQual] NVARCHAR(50) NULL,
  [SecurityInfo] NVARCHAR(50) NULL,
  [InterchangeSenderIDQual] NVARCHAR(50) NOT NULL,
  [InterchangeSenderID] NVARCHAR(50) NOT NULL,
  [InterchangeReceiverIDQual] NVARCHAR(50) NOT NULL,
  [InterchangeReceiverID] NVARCHAR(50) NOT NULL,
  [ApplicationSenderCode] NVARCHAR(50) NOT NULL,
  [ApplicationReceiverCode] NVARCHAR(50) NOT NULL,
  [ResponsibleAgencyCode] NVARCHAR(50) NULL,
  [SegmentTerminator] INTEGER FOREIGN KEY REFERENCES [tblSegmentTerminator] ([SegmentTerminatorNo]) NOT NULL,
  [DataElementDelimiter] INTEGER FOREIGN KEY REFERENCES [tblSegmentTerminator] ([SegmentTerminatorNo]) NOT NULL,
  [RepetitionSep] INTEGER FOREIGN KEY REFERENCES [tblSegmentTerminator] ([SegmentTerminatorNo]) NULL,
  [InterchangeVersion] NVARCHAR(50) NOT NULL,
  [StandardVersion] INTEGER FOREIGN KEY REFERENCES [tblEDIVersion] ([EDIVersionNo]) NOT NULL,
  [TestIndicator] BIT NOT NULL,
  [SubElementSep] INTEGER FOREIGN KEY REFERENCES [tblSegmentTerminator] ([SegmentTerminatorNo]) NOT NULL,
  [FunctionalAcknowledgement] INTEGER NULL DEFAULT(0),
  [OutBoundID] NVARCHAR(50) NULL,
  [Output997FilePath] NVARCHAR(100) NULL,
  [blnIsGSYear4] BIT DEFAULT(0) NULL,
  [blnUseSCP] BIT DEFAULT(0) NULL,
  [SCPFolder] NVARCHAR(255) NULL
  
);


CREATE TABLE [tblEDITransactionStructure] (
  [StructureNo] INTEGER PRIMARY KEY IDENTITY (1,1),
  [Version] NVARCHAR(50) NOT NULL,
  [TransactionSetID] NVARCHAR(50) NOT NULL,
  [FunctionGroup] NVARCHAR(50) NOT NULL,
  [SegmentCode] NVARCHAR(50),
  [MinLength] INT NOT NULL,
  [MaxLength] INT NOT NULL,
  [EDITypeNo_FK] INTEGER FOREIGN KEY REFERENCES [tblEDIType] ([EDITypeNo]) NOT NULL

)

CREATE TABLE [tblOperator] (
  [OperatorNo] INTEGER PRIMARY KEY IDENTITY (1,1),
  [OperatorCode] NVARCHAR(50) NOT NULL,
  [OperatorName] NVARCHAR(100) NOT NULL,
  [OperatorParameter] NVARCHAR(50) NULL
);


CREATE TABLE [tblTradingPartnerErrorHanding] (
  [TPErrorHandingNo] INTEGER PRIMARY KEY IDENTITY (1,1),
  [TradingPartnerNo_FK] INTEGER FOREIGN KEY REFERENCES [tblTradingPartner] ([TradingPartnerNo])  NOT NULL, 
  [TransactionSetNo_FK] INTEGER FOREIGN KEY REFERENCES [tblEDITransactionSet] ([TransactionSetNo]) NOT NULL,
  [ErrorHandleNo_FK] INTEGER FOREIGN KEY REFERENCES [tblErrorHandle] ([ErrorHandleNo]) NOT NULL,
);


CREATE TABLE [tblTradingPartnerAutoCopy] (
  [TPAutoCopyNo] INTEGER PRIMARY KEY IDENTITY (1,1),
  [TradingPartnerNo_FK] INTEGER FOREIGN KEY REFERENCES [tblTradingPartner] ([TradingPartnerNo])  NOT NULL, 
  [TradingPartnerNo_AutoCopy_FK] INTEGER FOREIGN KEY REFERENCES [tblTradingPartner] ([TradingPartnerNo])  NOT NULL, 
  [TransactionSetNo_FK] INTEGER FOREIGN KEY REFERENCES [tblEDITransactionSet] ([TransactionSetNo]) NOT NULL
);


CREATE TABLE [tblEDITrasactionRawData] (
  [TransactionRawDataNo] INTEGER PRIMARY KEY IDENTITY (1,1),
  [TransactionDate] DATETIME NOT NULL,
  [TradingPartnerNo_FK] INTEGER FOREIGN KEY REFERENCES [tblTradingPartner] ([TradingPartnerNo])  NOT NULL, 
  [TransactionSetNo_FK] INTEGER FOREIGN KEY REFERENCES [tblEDITransactionSet] ([TransactionSetNo]) NOT NULL,
  [TransactionKey] NVARCHAR(50) NOT NULL,
  [InOut] BIT NOT NULL,
  [RawData] TEXT NOT NULL,
  [XMLData] TEXT NOT NULL,
  [InterchangeControlNum] NVARCHAR(50) NULL,
  [GroupControlNum] NVARCHAR(50) NULL
  
);

CREATE TABLE [tblErrorLog] (
  [ErrorLogNo] INTEGER PRIMARY KEY IDENTITY (1,1),
  [LogDate] DATETIME NOT NULL,
  [TradingPartnerNo_FK] INTEGER FOREIGN KEY REFERENCES [tblTradingPartner] ([TradingPartnerNo]) NULL, 
  [TransactionSetNo_FK] INTEGER FOREIGN KEY REFERENCES [tblEDITransactionSet] ([TransactionSetNo])  NULL,
  [TransactionRawDataNo_FK] INTEGER FOREIGN KEY REFERENCES [tblEDITrasactionRawData] ([TransactionRawDataNo])  NULL,
  [ErrorMessage] NVARCHAR(200) NOT NULL,
  [LogType] INTEGER NOT NULL
);

CREATE TABLE [tblInboundMapping] (
  [InboundMappingNo] INTEGER PRIMARY KEY IDENTITY (1,1),
  [TradingPartnerNo_FK] INTEGER FOREIGN KEY REFERENCES [tblTradingPartner] ([TradingPartnerNo]) NOT NULL, 
  [TransactionSetNo_FK] INTEGER FOREIGN KEY REFERENCES [tblEDITransactionSet] ([TransactionSetNo])  NOT NULL,
  [SegmentNo_FK] INTEGER FOREIGN KEY REFERENCES [tblEDISegment] ([SegmentNo])  NULL,
  [Postion] INTEGER NOT NULL,
  [TableName] NVARCHAR(50) NULL,
  [FieldName] NVARCHAR(50) NULL,
  [CommitDBAfterRead] BIT NOT NULL,
  [Note] NVARCHAR(200) NULL,
  [TransactionRawDataNo_FK] INTEGER FOREIGN KEY REFERENCES [tblEDITrasactionRawData] ([TransactionRawDataNo])  NOT NULL,
  [IsInsert] BIT NULL DEFAULT(1)

  
);

CREATE TABLE [tblOutboundMapping] (
  [OutboundMappingNo] INTEGER PRIMARY KEY IDENTITY (1,1),
  [TradingPartnerNo_FK] INTEGER FOREIGN KEY REFERENCES [tblTradingPartner] ([TradingPartnerNo])  NOT NULL , 
  [TransactionSetNo_FK] INTEGER FOREIGN KEY REFERENCES [tblEDITransactionSet] ([TransactionSetNo]) NOT NULL,
  [SegmentNo_FK] INTEGER FOREIGN KEY REFERENCES [tblEDISegment] ([SegmentNo])  NULL,
  [Postion] INTEGER NOT NULL,
  [Value] NVARCHAR(50) NULL,
  [XMLPathField] NVARCHAR(100)  NULL,
  [Note] NVARCHAR(200) NULL,
  [OutputEDIFilePath] NVARCHAR(200) NULL,
  [TransactionRawDataNo_FK] INTEGER FOREIGN KEY REFERENCES [tblEDITrasactionRawData] ([TransactionRawDataNo])  NOT NULL,
  [SegmentNumber] INTEGER NOT NULL
);

CREATE TABLE [tblOperatorInboundMapping] (
  [OperatorMappingNo] INTEGER PRIMARY KEY IDENTITY (1,1),
  [OperatorNo_FK] INTEGER FOREIGN KEY REFERENCES [tblOperator] ([OperatorNo]) NOT NULL,
  [InboundMappingNo_FK] INTEGER FOREIGN KEY REFERENCES [tblInboundMapping] ([InboundMappingNo])  NOT NULL,
  [OperatorParameter] NVARCHAR(100) NULL
);

CREATE TABLE [tblOperatorOutboundMapping] (
  [OperatorMappingNo] INTEGER PRIMARY KEY IDENTITY (1,1),
  [OperatorNo_FK] INTEGER FOREIGN KEY REFERENCES [tblOperator] ([OperatorNo]) NOT NULL,
  [OutboundMappingNo_FK] INTEGER FOREIGN KEY REFERENCES [tblOutboundMapping] ([OutboundMappingNo])  NOT NULL,
  [OperatorParameter] NVARCHAR(100) NULL
);


CREATE TABLE [tblInboundOutboundSetting] (
  [SettingNo] INTEGER PRIMARY KEY IDENTITY (1,1),
  [SettingName] NVARCHAR(100) NOT NULL,
  [InOut] BIT NOT NULL,
  [Path] NVARCHAR(200),
  [IsArchive] BIT NOT NULL,
  [IsDelete] BIT NOT NULL,
  [IsCreate] BIT NOT NULL
);

 CREATE TABLE [tblInterchangeControlNumber] (
  [ControlNo] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
  [InterchangeControlNumber] INT NOT NULL
);

 CREATE TABLE [tblTransmissionControlNumber] (
  [TransControlNo] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
  [TransmissionNumber] INT NOT NULL
);


--------------------------------------------------------------------
-- Transaction tables 
--------------------------------------------------------------------
CREATE TABLE [dbo].[tblEDI_142_AMT](
	[NO] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[HdrKey] [nvarchar](100) NULL,
	[LineKey] [nvarchar](100) NULL,
	[AmtKey] [nvarchar](100) NOT NULL,
	[AmountQualifier] [nvarchar](50) NULL,
	[Amount] [float] NULL
 );


CREATE TABLE [dbo].[tblEDI_142_DETAIL](
	[NO] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[HdrKey] [nvarchar](100)  NULL,
	[LineKey] [nvarchar](100) NULL,
	[DtlKey] [nvarchar](100) NOT NULL,
	[AssignedIdentification] [nvarchar](50) NULL,
	[ModelCodeQual] [nvarchar](50) NULL,
	[ModelCode] [nvarchar](50) NULL,
	[VehicleIDQual] [nvarchar](50) NULL,
	[VehicleIDNum] [nvarchar](50) NULL,
	[EngineNumQual] [nvarchar](50) NULL,
	[EngineNum] [nvarchar](50) NULL,
	[EngineModelQual] [nvarchar](50) NULL,
	[EngineModel] [nvarchar](50) NULL,
	[PrimaryFailedPartQual] [nvarchar](50) NULL,
	[PrimaryFailedPart] [nvarchar](50) NULL,
	[ModelYearQual] [nvarchar](50) NULL,
	[ModelYear] [nvarchar](50) NULL,
	[PartNumCodeQual] [nvarchar](50) NULL,
	[PartNumCode] [nvarchar](50) NULL,
	[PartDescQual] [nvarchar](50) NULL,
	[PartDesc] [nvarchar](100) NULL,
	[QuanityQual] [nvarchar](50) NULL,
	[Quantity] [int] NULL,
	[UnitMeasureCode] [nvarchar](50) NULL
);

CREATE TABLE [dbo].[tblEDI_142_DTM](
	[NO] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[HdrKey] [nvarchar](100) NULL,
	[LineKey] [nvarchar](100) NULL,
	[DtlKey] [nvarchar](100) NULL,
	[DtmKey] [nvarchar](100) NOT NULL,
	[Qualifier] [nvarchar](50) NULL,
	[dtmDate] [datetime] NULL,
	[Century] [int] NULL
);

CREATE TABLE [dbo].[tblEDI_142_HEADER](
	[NO] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[HdrKey] [nvarchar](100) NOT NULL,
	[ISAControlNum] [nvarchar](50) NULL,
	[ISASenderID] [nvarchar](50) NULL,
	[GSControlNum] [nvarchar](50) NULL,
	[GSSenderID] [nvarchar](50) NULL,
	[TransSetID] [nvarchar](50) NULL,
	[TransSetControlNum] [nvarchar](50) NULL,
	[TransSetPurpose] [nvarchar](50) NULL,
	[WarrantyClaimRefNum] [nvarchar](50) NULL,
	[GeneratedDateTime] [datetime] NULL,
	[DateAdded] [datetime] DEFAULT GETDATE() NOT NULL,
	[SubmitDateTime] [datetime] NULL,
	[blnRepFlag] [bit] DEFAULT (1) NULL,
	[GSReceiverID] [nvarchar](50) NULL
);

CREATE TABLE [dbo].[tblEDI_142_IT1](
	[NO] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[HdrKey] [nvarchar](100) NULL,
	[LineKey] [nvarchar](100) NULL,
	[It1Key] [nvarchar](100) NOT NULL,
	[AssignedID] [nvarchar](50) NULL,
	[LaborHours] [float] NULL,
	[UnitMeasurementCode] [nvarchar](50) NULL,
	[LaborCost] [float] NULL
);

CREATE TABLE [dbo].[tblEDI_142_LINE](
	[NO] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[HdrKey] [nvarchar](100) NULL,
	[LineKey] [nvarchar](100) NOT NULL,
	[AssignedNum] [nvarchar](50) NULL,
	[ReceiverClaimNumQual] [nvarchar](50) NULL,
	[ReceiverClaimNum] [nvarchar](50) NULL,
	[BussinessTypeQual] [nvarchar](50) NULL,
	[BussinessType] [nvarchar](50) NULL,
	[StateCodeQual] [nvarchar](50) NULL,
	[StateCode] [nvarchar](50) NULL,
	[AdjustmentMemoQual] [nvarchar](50) NULL,
	[AdjustmentMemoNum] [nvarchar](50) NULL,
	[DistributorClaimNumQual] [nvarchar](50) NULL,
	[DistributorClaimNum] [nvarchar](50) NULL,
	[DistributorCodeQual] [nvarchar](50) NULL,
	[DistributorCode] [nvarchar](50) NULL,
	[DistributorNameQual] [nvarchar](50) NULL,
	[DistributorName] [nvarchar](50) NULL,
	[ClaimClassCodeQual] [nvarchar](50) NULL,
	[ClaimClassCode] [nvarchar](50) NULL,
	[ClaimClassCodeDescQual] [nvarchar](50) NULL,
	[ClaimClassCodeDesc] [nvarchar](50) NULL,
	[MajorModelSeriesQual] [nvarchar](50) NULL,
	[MajorModelSeries] [nvarchar](50) NULL,
	[MajorModelDescQual] [nvarchar](50) NULL,
	[MajorModelDesc] [nvarchar](50) NULL
);

CREATE TABLE [dbo].[tblEDI_142_MSG](
	[NO] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[HdrKey] [nvarchar](100) NULL,
	[LineKey] [nvarchar](100) NULL,
	[PrrKey] [nvarchar](100) NULL,
	[MsgKey] [nvarchar](100) NOT NULL,
	[Message] [nvarchar](500) NULL
);

CREATE TABLE [dbo].[tblEDI_142_N1](
	[NO] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[HdrKey] [nvarchar](100) NULL,
	[N1Key] [nvarchar](100) NOT NULL,
	[EntityIDCode] [nvarchar](50) NULL,
	[Name] [nvarchar](100) NULL,
	[SplIDCodeQual] [nvarchar](10) NULL,
	[Code] [nvarchar](50) NULL,
	[CorpName] [nvarchar](100) NULL,
	[Address1] [nvarchar](100) NULL,
	[Address2] [nvarchar](100) NULL,
	[City] [nvarchar](50) NULL,
	[State] [nvarchar](50) NULL,
	[Zip] [nvarchar](50) NULL,
	[Country] [nvarchar](50) NULL,
	[ContactCode] [nvarchar](10) NULL,
	[ContactName] [nvarchar](100) NULL,
	[CommQual] [nvarchar](10) NULL,
	[CommNum] [nvarchar](50) NULL,
	[SCACCodeQual] [nvarchar](10) NULL,
	[SCACCode] [nvarchar](50) NULL
);

CREATE TABLE [dbo].[tblEDI_142_PRR](
	[NO] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[HdrKey] [nvarchar](100) NULL,
	[LineKey] [nvarchar](100) NULL,
	[PrrKey] [nvarchar](100) NOT NULL,
	[AssignedID] [nvarchar](50) NULL,
	[ComplaintCode] [nvarchar](50) NULL,
	[Description] [nvarchar](100) NULL
);

CREATE TABLE [dbo].[tblEDI_142_REP](
	[NO] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[HdrKey] [nvarchar](100) NULL,
	[LineKey] [nvarchar](100) NULL,
	[RepKey] [nvarchar](100) NOT NULL,
	[AssignedID] [nvarchar](50) NULL,
	[IDQualifier] [nvarchar](50) NULL,
	[ID] [nvarchar](50) NULL
);

CREATE TABLE [dbo].[tblEDI_142_SSS](
	[NO] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[HdrKey] [nvarchar](100) NULL,
	[LineKey] [nvarchar](100) NULL,
	[DtlKey] [nvarchar](100) NULL,
	[SssKey] [nvarchar](100) NOT NULL,
	[Indicator] [nvarchar](50) NULL,
	[AgencyQualifierCode] [nvarchar](50) NULL,
	[SpecialServicesCode] [nvarchar](50) NULL,
	[Rate] [float] NULL,
	[TotalAmount] [float] NULL,
	[SupplierAmount] [float] NULL
);

CREATE TABLE [dbo].[tblEDI_810_HEADER](
	[NO] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[HdrKey] [nvarchar](100) NOT NULL,
	[ISAControlNum] [nvarchar](50) NULL,
	[ISASenderID] [nvarchar](50) NULL,
	[GSControlNum] [nvarchar](50) NULL,
	[GSSenderID] [nvarchar](50) NULL,
	[TransSetID] [nvarchar](50) NULL,
	[TransSetControlNum] [nvarchar](50) NULL,
	[InvoiceDate] [datetime] NULL,
	[InvoiceNumber] [nvarchar](50) NULL,
	[TranTypeCode] [nvarchar](50) NULL,
	[TransSetPurpose] [nvarchar](50) NULL,
	[EntityIDCode] [nvarchar](50) NULL,
	[CurrencyCode] [nvarchar](50) NULL,
	[TermsBasisDateCode] [nvarchar](50) NULL,
	[TermsDiscPercent] [float] NULL,
	[TermsDiscDaysDue] [int] NULL,
	[TermsNetDueDate] [datetime] NULL,
	[TermsNetDays] [int] NULL,
	[GeneratedDateTime] [datetime] NULL,
	[DateAdded] [datetime] DEFAULT GETDATE() NOT NULL,
	[SubmitDateTime] [datetime] NULL,
	[Amount] [float] NULL,
	[TaxTypeCode] [nvarchar](50) NULL,
	[TaxAmount] [float] NULL,
	[TaxPercent] [float] NULL,
	[TaxIDNum] [nvarchar](50) NULL,
	[blnRepFlag] [bit] DEFAULT (1) NULL,
	[GSReceiverID] [nvarchar](50) NULL

	);

CREATE TABLE [dbo].[tblEDI_810_LINE](
	[NO] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[LineKey] [nvarchar](100) NOT NULL,
	[HdrKey] [nvarchar](100) NULL,
	[AssignedID] [nvarchar](50) NULL,
	[QtyInvoiced] [float] NULL,
	[UOM] [nvarchar](50) NULL,
	[UnitPrice] [float] NULL,
	[UnitPriceCode] [nvarchar](50) NULL,
	[ItemDescType] [nvarchar](50) NULL,
	[Description] [nvarchar](50) NULL,
	[RefQual] [nvarchar](50) NULL,
	[PartNumber] [nvarchar](50) NULL,
	[DtmQual] [nvarchar](50) NULL,
	[Date] [datetime] NULL
);

CREATE TABLE [dbo].[tblEDI_810_N1](
	[NO] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[HdrKey] [nvarchar](100) NULL,
	[LineKey] [nvarchar](100) NULL,
	[N1Key] [nvarchar](100) NOT NULL,
	[EntityIDCode] [nvarchar](50) NULL,
	[CodeQual] [nvarchar](50) NULL,
	[Name] [nvarchar](100) NULL,
	[Code] [nvarchar](50) NULL,
	[Address1] [nvarchar](100) NULL,
	[Address2] [nvarchar](100) NULL,
	[City] [nvarchar](50) NULL,
	[State] [nvarchar](50) NULL,
	[Zip] [nvarchar](50) NULL,
	[Country] [nvarchar](50) NULL,
	[ContactCode] [nvarchar](50) NULL,
	[ContactName] [nvarchar](100) NULL
);

CREATE TABLE [dbo].[tblEDI_820_ADX](
	[NO] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[AdxKey] [nvarchar](100) NOT NULL,
	[LineKey] [nvarchar](100) NULL,
	[HdrKey] [nvarchar](100) NULL,
	[AdjMonetaryAmount] [float] NULL,
	[AdjReasonCode] [nvarchar](50) NULL,
	[AdjIDQual] [nvarchar](50) NULL,
	[AdjReferenceID] [nvarchar](50) NULL
);

CREATE TABLE [dbo].[tblEDI_820_DTM](
	[NO] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[DtmKey] [nvarchar](100) NOT NULL,
	[HdrKey] [nvarchar](100) NULL,
	[LineKey] [nvarchar](100) NULL,
	[AdxKey] [nvarchar](100) NULL,
	[IT1Key] [nvarchar](100) NULL,
	[RefKey] [nvarchar](100) NULL,
	[RMRKey] [nvarchar](100) NULL,
	[N1Key] [nvarchar](100) NULL,
	[DtmQual] [nvarchar](50) NULL,
	[Date] [datetime] NULL

	);

CREATE TABLE [dbo].[tblEDI_820_HEADER](
	[NO] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[HdrKey] [nvarchar](100) NOT NULL,
	[ISAControlNum] [nvarchar](50) NULL,
	[ISASenderID] [nvarchar](50) NULL,
	[GSControlNum] [nvarchar](50) NULL,
	[GSSenderID] [nvarchar](50) NULL,
	[TransSetID] [nvarchar](50) NULL,
	[TransSetControlNum] [nvarchar](50) NULL,
	[TransHandlingCode] [nvarchar](50) NULL,
	[TotalPaymentAmount] [float] NULL,
	[CreditDebitFlagCode] [varchar](50) NULL,
	[PaymentMethodCode] [nvarchar](50) NULL,
	[PaymentFormatCode] [nvarchar](50) NULL,
	[SupplierIDNumQual] [nvarchar](50) NULL,
	[SupplierID] [nvarchar](50) NULL,
	[SupplierAcctNumQual] [nvarchar](50) NULL,
	[SupplierAcctNum] [nvarchar](50) NULL,
	[RemittanceDate] [datetime] NULL,
	[TraceTypeNum] [nvarchar](50) NULL,
	[TraceRefNum1] [nvarchar](50) NULL,
	[OrgCompanyID] [nvarchar](50) NULL,
	[TraceRefNum2] [nvarchar](50) NULL,
	[EntityIDCode] [nvarchar](50) NULL,
	[CurrencyCode] [nvarchar](50) NULL,
	[GeneratedDateTime] [datetime] NULL,
	[DateAdded] [datetime] DEFAULT GETDATE() NOT NULL,
	[SubmitDateTime] [datetime] NULL,
	[blnRepFlag] [bit] DEFAULT (1) NULL,
	[GSReceiverID] [nvarchar](50) NULL,
	[blnImportSimply] [bit] DEFAULT (1) NULL,
	blnEmailFlag BIT DEFAULT(0) NULL
	);

CREATE TABLE [dbo].[tblEDI_820_IT1](
	[NO] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[IT1Key] [nvarchar](100) NOT NULL,
	[HdrKey] [nvarchar](100) NULL,
	[LineKey] [nvarchar](100) NULL,
	[AdxKey] [nvarchar](100) NULL,
	[RMRKey] [nvarchar](100) NULL,
	[AssignedID] [nvarchar](50) NULL,
	[QtyInvoiced] [float] NULL,
	[UOM] [nvarchar](50) NULL,
	[UnitPrice] [float] NULL,
	[UnitPriceCode] [nvarchar](50) NULL

	);

CREATE TABLE [dbo].[tblEDI_820_LINE](
	[NO] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[LineKey] [nvarchar](100) NOT NULL,
	[HdrKey] [nvarchar](100) NULL,
	[AssignedNum] [nvarchar](50) NULL,
	[EntityIDCode] [nvarchar](50) NULL,
	[EntityIDCodeQual] [nvarchar](50) NULL,
	[ShipToCode] [nvarchar](50) NULL,
	[ShipToIDCode] [nvarchar](50) NULL,
	[ShipToCodeQual] [nvarchar](50) NULL,
	[ShipToNum] [nvarchar](50) NULL,
	[TaxIDNum] [nvarchar](50) NULL,
	[TaxPaymentTypeCode] [nvarchar](50) NULL,
	[TaxDate] [datetime] NULL,
	[TaxInfoID] [nvarchar](50) NULL,
	[TaxAmount] [float] NULL,
	[LoopHeaderIDCode] [nvarchar](50) NULL,
	[LoopTrailerIDCode] [nvarchar](50) NULL

	);

CREATE TABLE [dbo].[tblEDI_820_TAX](
	[NO] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[TaxKey] [nvarchar](100) NOT NULL,
	[LineKey] [nvarchar](100) NULL,
	[HdrKey] [nvarchar](100) NULL,
	[TaxIDNum] [nvarchar](50) NULL,
	[TaxPaymentTypeCode] [nvarchar](50) NULL,
	[TaxDate] [datetime] NULL,
	[TaxInfoID] [nvarchar](50) NULL,
	[TaxAmount] [float] NULL
);


CREATE TABLE [dbo].[tblEDI_820_N1](
	[NO] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[HdrKey] [nvarchar](100) NULL,
	[LineKey] [nvarchar](100) NULL,
	[N1Key] [nvarchar](100) NOT NULL,
	[EntityIDCode] [nvarchar](50) NULL,
	[CodeQual] [nvarchar](50) NULL,
	[Name] [nvarchar](100) NULL,
	[Code] [nvarchar](50) NULL,
	[Address1] [nvarchar](100) NULL,
	[Address2] [nvarchar](100) NULL,
	[City] [nvarchar](50) NULL,
	[State] [nvarchar](50) NULL,
	[Zip] [nvarchar](50) NULL,
	[Country] [nvarchar](50) NULL,
	[ContactCode] [nvarchar](50) NULL,
	[ContactName] [nvarchar](100) NULL,
	[ContactNum1Qual] [nvarchar](50) NULL,
	[ContactNum1] [nvarchar](50) NULL,
	[ContactNum2Qual] [nvarchar](50) NULL,
	[ContactNum2] [nvarchar](50) NULL,
	[EmailQual] [nvarchar](50) NULL,
	[Email] [nvarchar](100) NULL,
	[PlantID] [nvarchar](50) NULL
	);

CREATE TABLE [dbo].[tblEDI_820_REF](
	[NO] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[RefKey] [nvarchar](100) NOT NULL,
	[HdrKey] [nvarchar](100) NULL,
	[LineKey] [nvarchar](100) NULL,
	[AdxKey] [nvarchar](100) NULL,
	[IT1Key] [nvarchar](100) NULL,
	[RMRKey] [nvarchar](100) NULL,
	[N1Key] [nvarchar](100) NULL,
	[RefQual] [nvarchar](50) NULL,
	[RefNum] [nvarchar](100) NULL,
	[Description] [nvarchar](50) NULL

	);

CREATE TABLE [dbo].[tblEDI_820_RMR](
	[NO] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[RMRKey] [nvarchar](100) NOT NULL,
	[LineKey] [nvarchar](100) NULL,
	[HdrKey] [nvarchar](100) NULL,
	[N1Key] [nvarchar](100) NULL,
	[RemittanceIDQual] [nvarchar](50) NULL,
	[RemittanceID] [nvarchar](50) NULL,
	[RemittancePayActionCode] [nvarchar](50) NULL,
	[NetAmount] [float] NULL,
	[GrossAmount] [float] NULL,
	[DiscountAmount] [float] NULL,
	[AdjReasonCode] [nvarchar](50) NULL,
	[Description] [nvarchar](100) NULL

	);

CREATE TABLE [dbo].[tblEDI_820_SAC](
	[NO] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[SACKey] [nvarchar](100) NOT NULL,
	[HdrKey] [nvarchar](100) NULL,
	[LineKey] [nvarchar](100) NULL,
	[AdxKey] [nvarchar](100) NULL,
	[RMRKey] [nvarchar](100) NULL,
	[IT1Key] [nvarchar](100) NULL,
	[ChargeID] [nvarchar](50) NULL,
	[ChargeCode] [nvarchar](50) NULL,
	[Amount] [float] NULL,
	[Rate] [float] NULL,
	[UOM] [nvarchar](50) NULL,
	[Quantity] [float] NULL,
	[ChargeHandlingCode] [nvarchar](50) NULL,
	[Description] [nvarchar](100) NULL,
	[ChargeNum] [nvarchar](50) NULL
	
	);

CREATE TABLE [dbo].[tblEDI_820_SLN](
	[NO] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[SLNKey] [nvarchar](100) NOT NULL,
	[HdrKey] [nvarchar](100) NULL,
	[LineKey] [nvarchar](100) NULL,
	[AdxKey] [nvarchar](100) NULL,
	[IT1Key] [nvarchar](100) NULL,
	[AssignedID] [nvarchar](50) NULL,
	[RelationshipCode] [nvarchar](50) NULL,
	[UnitPrice] [float] NULL,
	[BasisofUnitPriceCode] [nvarchar](50) NULL,
	[Quantity] [float] NULL,
	[UOM] [nvarchar](50) NULL

	);

CREATE TABLE [dbo].[tblEDI_824_DETAIL](
	[NO] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[DtlKey] [nvarchar](100) NOT NULL,
	[HdrKey] [nvarchar](100) NULL,
	[LineKey] [nvarchar](100) NULL,
	[ApplErrConditionCode] [nvarchar](50) NULL,
	[ErrorDescrp] [nvarchar](300) NULL,
	[ErrorData] [nvarchar](300) NULL
  );	

CREATE TABLE [dbo].[tblEDI_824_DTM](
	[NO] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[DtmKey] [nvarchar](100) NOT NULL,
	[HdrKey] [nvarchar](100) NULL,
	[LineKey] [nvarchar](100) NULL,
	[DtmQual] [nvarchar](50) NULL,
	[Date] [datetime] NULL,
	[TimeCode] [nvarchar](50) NULL

	);

CREATE TABLE [dbo].[tblEDI_824_HEADER](
	[NO] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[HdrKey] [nvarchar](100) NOT NULL,
	[ISAControlNum] [nvarchar](50) NULL,
	[ISASenderID] [nvarchar](50) NULL,
	[GSControlNum] [nvarchar](50) NULL,
	[GSSenderID] [nvarchar](50) NULL,
	[TransSetID] [nvarchar](50) NULL,
	[TransSetControlNum] [nvarchar](50) NULL,
	[TransSetPurpose] [nvarchar](50) NULL,
	[ApplicationAdviceNum] [nvarchar](50) NULL,
	[GeneratedDateTime] [datetime] NULL,
	[DateAdded] [datetime] DEFAULT GETDATE() NOT NULL,
	[SubmitDateTime] [datetime] NULL,
	[blnRepFlag] [bit] DEFAULT (1) NULL,
	[GSReceiverID] [nvarchar](50) NULL,
	[blnEmailFlag] [bit] DEFAULT (0) NULL
	);

CREATE TABLE [dbo].[tblEDI_824_LINE](
	[NO] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[LineKey] [nvarchar](100) NOT NULL,
	[HdrKey] [nvarchar](100) NULL,
	[AppAcknowledgmentCode] [nvarchar](50) NULL,
	[OrgDocumentNumQual] [nvarchar](50) NULL,
	[OrgDocumentNum] [nvarchar](50) NULL,
	[OrgCreateDateTime] [datetime] NULL,
	[TranSetIDCode] [nvarchar](50) NULL

	);

CREATE TABLE [dbo].[tblEDI_824_N1](
	[NO] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[HdrKey] [nvarchar](100) NULL,
	[LineKey] [nvarchar](100) NULL,
	[N1Key] [nvarchar](100) NOT NULL,
	[EntityIDCode] [nvarchar](50) NULL,
	[CodeQual] [nvarchar](50) NULL,
	[Name] [nvarchar](100) NULL,
	[Code] [nvarchar](50) NULL,
	[Address1] [nvarchar](100) NULL,
	[Address2] [nvarchar](100) NULL,
	[City] [nvarchar](50) NULL,
	[State] [nvarchar](50) NULL,
	[Zip] [nvarchar](50) NULL,
	[Country] [nvarchar](50) NULL,
	[ContactCode] [nvarchar](50) NULL,
	[ContactName] [nvarchar](100) NULL
	);

CREATE TABLE [dbo].[tblEDI_824_NTE](
	[NO] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[NteKey] [nvarchar](100) NOT NULL,
	[HdrKey] [nvarchar](100) NULL,
	[LineKey] [nvarchar](100) NULL,
	[DtlKey] [nvarchar](100) NULL,
	[NoteRefCode] [nvarchar](50) NULL,
	[Description] [nvarchar](200) NULL

	);

CREATE TABLE [dbo].[tblEDI_824_QTY](
	[NO] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[QtyKey] [nvarchar](100) NOT NULL,
	[HdrKey] [nvarchar](100) NULL,
	[LineKey] [nvarchar](100) NULL,
	[QtyQual] [nvarchar](50) NULL,
	[Quantity] [float] NULL
	);

CREATE TABLE [dbo].[tblEDI_824_REF](
	[NO] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[HdrKey] [nvarchar](100) NULL,
	[LineKey] [nvarchar](100) NULL,
	[RefKey] [nvarchar](100) NOT NULL,
	[RefQual] [nvarchar](50) NULL,
	[RefNum] [nvarchar](100) NULL,
	[Description] [nvarchar](200) NULL

);

CREATE TABLE [dbo].[tblEDI_830_ATH](
	[NO] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[HdrKey] [nvarchar](100) NULL,
	[LineKey] [nvarchar](100) NULL,
	[AthKey] [nvarchar](100) NOT NULL,
	[ResourceAuthCode] [nvarchar](50) NULL,
	[ResourceAuth_ThruDate] [datetime] NULL,
	[CumAthQty] [float] NULL,
	[CumStartDate] [datetime] NULL

	);

CREATE TABLE [dbo].[tblEDI_830_DETAIL](
	[NO] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[HdrKey] [nvarchar](100) NULL,
	[LineKey] [nvarchar](100) NULL,
	[DtlKey] [nvarchar](100) NOT NULL,
	[FstQty] [float] NULL,
	[DiffQty] [float] NULL,
	[ForecastQual] [nvarchar](50) NULL,
	[ForecastTimeQual] [nvarchar](50) NULL,
	[DatePeriodStart] [datetime] NULL,
	[DatePeriodEnd] [datetime] NULL,
	[DateTimeQual] [nvarchar](50) NULL,
	[RefNumQual] [nvarchar](50) NULL,
	[RefNum] [nvarchar](50) NULL,
	[ShipPatternCode] [nvarchar](50) NULL,
	[ShipPatternTimeCode] [nvarchar](50) NULL,
	[ReleaseNumber] [nvarchar](50) NULL

);

CREATE TABLE [dbo].[tblEDI_830_HEADER](
	[NO] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[HdrKey] [nvarchar](100) NOT NULL,
	[ISASenderID] [nvarchar](50) NULL,
	[SubmitDateTime] [datetime] NULL,
	[ISAControlNum] [nvarchar](50) NULL,
	[GSSenderID] [nvarchar](50) NULL,
	[GSControlNum] [nvarchar](50) NULL,
	[TransSetID] [nvarchar](50) NULL,
	[TransSetControlNum] [nvarchar](50) NULL,
	[TransSetPurpose] [nvarchar](50) NULL,
	[ReferenceID] [nvarchar](50) NULL,
	[ReleaseNumber] [nvarchar](20) NULL,
	[ScheduleTypeQual] [nvarchar](50) NULL,
	[ScheduleQtyQual] [nvarchar](50) NULL,
	[ForecastHorizonDateStart] [datetime] NULL,
	[ForecastHorizonEndDate] [datetime] NULL,
	[GeneratedDateTime] [datetime] NULL,
	[ContactNumber] [nvarchar](50) NULL,
	[AdminFuncCode_hdr] [nvarchar](50) NULL,
	[AdminContact_hdr] [nvarchar](100) NULL,
	[AdminCommNumQual_hdr] [nvarchar](50) NULL,
	[AdminPhone_hdr] [nvarchar](50) NULL,
	[Note] [nvarchar](1000) NULL,
	[RtgSeqCode] [nvarchar](50) NULL,
	[IDCodeQual] [nvarchar](50) NULL,
	[SCACCode] [nvarchar](50) NULL,
	[TransportationType] [nvarchar](50) NULL,
	[DateAdded] [datetime] DEFAULT GETDATE() NOT NULL,
	[CummsDateStart] [datetime] NULL,
	[PlantID] [nvarchar](50) NULL,
	[PONum] [nvarchar](50) NULL,
	[PlantName] [nvarchar](50) NULL,
	[CorpName] [nvarchar](50) NULL,
	[PlannerName] [nvarchar](50) NULL,
	[RefNum] [nvarchar](50) NULL,
	[CTT01] [nvarchar](50) NULL,
	[CTT02] [nvarchar](50) NULL,
	[DateQual] [nvarchar](50) NULL,
	[CreateDate] [datetime] NULL,
	[blnRepFlag] [bit] DEFAULT (1) NULL,
	[GSReceiverID] [nvarchar](50) NULL,
	[blnEmailFlag] [bit] DEFAULT (0) NULL

	);

CREATE TABLE [dbo].[tblEDI_830_LINE](
	[NO] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[HdrKey] [nvarchar](100) NULL,
	[LineKey] [nvarchar](100) NOT NULL,
	[ProdIDQual] [nvarchar](50) NULL,
	[BuyersPartID] [nvarchar](50) NULL,
	[ProdServiceQual] [nvarchar](50) NULL,
	[PONum] [nvarchar](50) NULL,
	[PartDescQual] [nvarchar](50) NULL,
	[PartDescription] [nvarchar](100) NULL,
	[ReleaseNumQual] [nvarchar](50) NULL,
	[ReleaseNum] [nvarchar](50) NULL,
	[SubLineAssignID] [nvarchar](50) NULL,
	[SubLineConfigCode] [nvarchar](50) NULL,
	[SubLineQty] [int] NULL,
	[SubLineUOM] [nvarchar](50) NULL,
	[SubLineProdServQual] [nvarchar](50) NULL,
	[SubLineProdServID] [nvarchar](50) NULL,
	[PartRelStatusCode] [nvarchar](50) NULL,
	[PartRelDescription] [nvarchar](200) NULL,
	[ProdItmDescType] [nvarchar](50) NULL,
	[ProdItmCharCode] [nvarchar](50) NULL,
	[ProdItmDescription] [nvarchar](200) NULL,
	[MeasurementRefID] [nvarchar](50) NULL,
	[MeasurementQual] [nvarchar](50) NULL,
	[MeasurementVal] [nvarchar](50) NULL,
	[UoBMeasurementCode] [nvarchar](50) NULL,
	[RangeMax] [nvarchar](50) NULL,
	[RoutingSeqCode] [nvarchar](50) NULL,
	[IDCodeQual] [nvarchar](50) NULL,
	[TransIDCode] [nvarchar](50) NULL,
	[TransMethodCode] [nvarchar](50) NULL,
	[AdminFuncCode_lin] [nvarchar](50) NULL,
	[AdminContact_lin] [nvarchar](100) NULL,
	[AdminCommNumQual_lin] [nvarchar](50) NULL,
	[AdminPhone_lin] [nvarchar](50) NULL,
	[MarksNumQual] [nvarchar](50) NULL,
	[MarksNum] [nvarchar](50) NULL,
	[QtyPerCont] [int] NULL,
	[ContType] [nvarchar](50) NULL,
	[UOM] [nvarchar](50) NULL,
	[UnitPrice] [float] NULL,
	[ReferenceNum] [nvarchar](50) NULL,
	[SupplierPartID] [nvarchar](50) NULL,
	[DCPartLevel] [nvarchar](50) NULL,
	[BuyersEngChangeLevel] [nvarchar](50) NULL,
	[EngChangeLevel] [nvarchar](50) NULL,
	[CTT01] [nvarchar](50) NULL,
	[CTT02] [nvarchar](50) NULL
	);

CREATE TABLE [dbo].[tblEDI_830_N1](
	[NO] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[HdrKey] [nvarchar](100) NULL,
	[LineKey] [nvarchar](100) NULL,
	[N1Key] [nvarchar](100) NOT NULL,
	[EntityIDCode] [nvarchar](50) NULL,
	[Name] [nvarchar](100) NULL,
	[SplIDCodeQual] [nvarchar](50) NULL,
	[Code] [nvarchar](50) NULL,
	[CorpName] [nvarchar](100) NULL,
	[Address1] [nvarchar](100) NULL,
	[Address2] [nvarchar](100) NULL,
	[City] [nvarchar](50) NULL,
	[State] [nvarchar](50) NULL,
	[Zip] [nvarchar](50) NULL,
	[Country] [nvarchar](50) NULL,
	[ContactCode] [nvarchar](10) NULL,
	[ContactName] [nvarchar](100) NULL,
	[CommQual] [nvarchar](10) NULL,
	[CommNum] [nvarchar](50) NULL
	);

CREATE TABLE [dbo].[tblEDI_830_REF](
	[NO] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[HdrKey] [nvarchar](100) NULL,
	[LineKey] [nvarchar](100) NULL,
	[DtlKey] [nvarchar](100) NULL,
	[N1Key] [nvarchar](100) NULL,
	[ShpKey] [nvarchar](100) NULL,
	[RefKey] [nvarchar](100) NOT NULL,
	[RefQual] [nvarchar](10) NULL,
	[RefNum] [nvarchar](100) NULL,
	[Description] [nvarchar](200) NULL

);

CREATE TABLE [dbo].[tblEDI_830_SHP](
	[NO] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[HdrKey] [nvarchar](100) NULL,
	[LineKey] [nvarchar](100) NULL,
	[ShpKey] [nvarchar](100) NOT NULL,
	[QtyQual] [nvarchar](50) NULL,
	[ShipQty] [float] NULL,
	[DateQual] [nvarchar](50) NULL,
	[BegInventoryDate] [datetime] NULL,
	[LastShipDate] [datetime] NULL,
	[ShipDate] [datetime] NULL
	);

CREATE TABLE [dbo].[tblEDI_830_SLN](
	[NO] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[HdrKey] [nvarchar](50) NULL,
	[LineKey] [nvarchar](50) NULL,
	[SlnKey] [nvarchar](50) NOT NULL,
	[AssignedID] [nvarchar](50) NULL,
	[ConfigCode] [nvarchar](50) NULL,
	[Qty] [int] NULL,
	[UOM] [nvarchar](10) NULL,
	[ProdServiceIDQual] [nvarchar](10) NULL,
	[ProdServiceID] [nvarchar](50) NULL,
	[ProdServiceIDQual2] [nvarchar](10) NULL,
	[ProdServiceID2] [nvarchar](50) NULL
);

CREATE TABLE [dbo].[tblEDI_830_DTM](
	[NO] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[HdrKey] [nvarchar](100) NULL,
	[LineKey] [nvarchar](100) NULL,
	[DtlKey] [nvarchar](100) NULL,
	[DtmKey] [nvarchar](100) NOT NULL,
	[Qualifier] [nvarchar](50) NULL,
	[dtmDate] [datetime] NULL
);


CREATE TABLE [dbo].[tblEDI_832_DETAIL](
	[NO] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[DtlKey] [nvarchar](100) NOT NULL,
	[LineKey] [nvarchar](100) NULL,
	[HdrKey] [nvarchar](100) NULL,
	[PriceIDCode] [nvarchar](50) NULL,
	[UnitPrice] [float] NULL,
	[PricingQty] [float] NULL,
	[UOM] [nvarchar](50) NULL,
	[EntityIDCode] [nvarchar](50) NULL,
	[CurrencyCode] [nvarchar](50) NULL
);

CREATE TABLE [dbo].[tblEDI_832_DTM](
	[NO] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[DtmKey] [nvarchar](100) NOT NULL,
	[HdrKey] [nvarchar](100) NULL,
	[LineKey] [nvarchar](100) NULL,
	[DtlKey] [nvarchar](100) NULL,
	[DtmQual] [nvarchar](50) NULL,
	[Date] [datetime] NULL
	);

CREATE TABLE [dbo].[tblEDI_832_HEADER](
	[NO] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[HdrKey] [nvarchar](100) NOT NULL,
	[ISAControlNum] [nvarchar](50) NULL,
	[ISASenderID] [nvarchar](50) NULL,
	[GSControlNum] [nvarchar](50) NULL,
	[GSSenderID] [nvarchar](50) NULL,
	[TransSetID] [nvarchar](50) NULL,
	[TransSetControlNum] [nvarchar](50) NULL,
	[CatalogPurposeCode] [nvarchar](50) NULL,
	[TransSetPurposeCode] [nvarchar](50) NULL,
	[DateQual] [nvarchar](50) NULL,
	[GeneratedDateTime] [datetime] NULL,
	[DateAdded] [datetime] DEFAULT GETDATE() NOT NULL,
	[SubmitDateTime] [datetime] NULL,
	[blnRepFlag] [bit] DEFAULT (1) NULL,
	[GSReceiverID] [nvarchar](50) NULL
	);

CREATE TABLE [dbo].[tblEDI_832_LINE](
	[NO] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[LineKey] [nvarchar](100) NOT NULL,
	[HdrKey] [nvarchar](100) NULL,
	[ProdIDQual] [nvarchar](50) NULL,
	[BuyersPartID] [nvarchar](50) NULL,
	[DCPartLevelQual] [nvarchar](50) NULL,
	[DCPartLevel] [nvarchar](50) NULL,
	[PartDscrptQual] [nvarchar](50) NULL,
	[PartDescription] [nvarchar](100) NULL
);

CREATE TABLE [dbo].[tblEDI_832_N1](
	[NO] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[N1Key] [nvarchar](100) NOT NULL,
	[HdrKey] [nvarchar](100) NULL,
	[EntityIDCode] [nvarchar](50) NULL,
	[Name] [nvarchar](50) NULL,
	[CodeQual] [nvarchar](50) NULL,
	[Code] [nvarchar](50) NULL,
	[CorporateName] [nvarchar](50) NULL,
	[ContactCode] [nvarchar](50) NULL,
	[ContactName] [nvarchar](50) NULL,
	[ContactNum1Qual] [nvarchar](50) NULL,
	[ContactNum1] [nvarchar](50) NULL,
	[ContactNum2Qual] [nvarchar](50) NULL,
	[ContactNum2] [nvarchar](50) NULL,
	[EmailQual] [nvarchar](50) NULL,
	[Email] [nvarchar](100) NULL,
	[PlantID] [nvarchar](50) NULL
	);

CREATE TABLE [dbo].[tblEDI_832_REF](
	[NO] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[RefKey] [nvarchar](100) NOT NULL,
	[DtlKey] [nvarchar](100) NULL,
	[LineKey] [nvarchar](100) NULL,
	[HdrKey] [nvarchar](100) NULL,
	[PriceQual] [nvarchar](50) NULL,
	[PriceReference] [nvarchar](50) NULL,
	[PriceRefDescrp] [nvarchar](100) NULL
 );

CREATE TABLE [dbo].[tblEDI_850_CTP](
	[NO] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[HdrKey] [nvarchar](50) NULL,
	[LineKey] [nvarchar](50) NULL,
	[CtpKey] [nvarchar](50) NOT NULL,
	[PriceIDCode] [nvarchar](50) NULL,
	[UnitPrice] [float] NULL

	);

CREATE TABLE [dbo].[tblEDI_850_DTM](
	[NO] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[HdrKey] [nvarchar](50) NULL,
	[LineKey] [nvarchar](50) NULL,
	[DtlKey] [nvarchar](50) NULL,
	[DtmKey] [nvarchar](50) NOT NULL,
	[DtmQual] [nvarchar](50) NULL,
	[Date] [datetime] NULL

);

CREATE TABLE [dbo].[tblEDI_850_HEADER](
	[NO] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[HdrKey] [nvarchar](100) NOT NULL,
	[ISASenderID] [nvarchar](50) NULL,
	[ISAControlNum] [nvarchar](50) NULL,
	[SubmitDateTime] [datetime] NULL,
	[GSSenderID] [nvarchar](50) NULL,
	[GSControlNum] [nvarchar](50) NULL,
	[TransSetID] [nvarchar](50) NULL,
	[TransSetControlNum] [nvarchar](50) NULL,
	[TransSetPurpose] [nvarchar](50) NULL,
	[POTypeCode] [nvarchar](50) NULL,
	[PONum] [nvarchar](50) NULL,
	[ReleaseNum] [nvarchar](50) NULL,
	[PODate] [datetime] NULL,
	[NTE_NoteRefCode] [nvarchar](50) NULL,
	[NTE_FreeFormMsg] [nvarchar](50) NULL,
	[EntityIDCode] [nvarchar](10) NULL,
	[Currency] [nvarchar](50) NULL,
	[ExchangeRate] [float] NULL,
	[FOBShpMethod] [nvarchar](50) NULL,
	[FOBLocationQual] [nvarchar](50) NULL,
	[FOBDescription] [nvarchar](200) NULL,
	[FOBLocationQual2] [nvarchar](50) NULL,
	[FOBDescription2] [nvarchar](200) NULL,
	[TransMethod] [nvarchar](50) NULL,
	[CarrierName] [nvarchar](100) NULL,
	[DateAdded] [datetime] DEFAULT GETDATE() NOT NULL,
	[GeneratedDateTime] [datetime] NULL,
	[AdminFuncCode_hdr] [nvarchar](50) NULL,
	[AdminContact_hdr] [nvarchar](100) NULL,
	[AdminCommNumQual_hdr] [nvarchar](50) NULL,
	[AdminPhone_hdr] [nvarchar](50) NULL,
	[CTPClass] [nvarchar](50) NULL,
	[STPPriceQual] [nvarchar](50) NULL,
	[TextMessageCode] [nvarchar](10) NULL,
	[Check864] [nvarchar](50) NULL,
	[blnRepFlag] [bit] DEFAULT (1) NULL,
	[FOBTransTermsQual] [nvarchar](50) NULL,
	[FOBTransTermsCode] [nvarchar](50) NULL,
	[GSReceiverID] [nvarchar](50) NULL
	);

CREATE TABLE [dbo].[tblEDI_850_ITA](
	[NO] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[HdrKey] [nvarchar](50) NULL,
	[LineKey] [nvarchar](50) NULL,
	[ItaKey] [nvarchar](50) NOT NULL,
	[AllowanceID] [nvarchar](10) NULL,
	[SpecialServiceCode] [nvarchar](50) NULL,
	[AllowanceMethodofHdlCode] [nvarchar](50) NULL,
	[AllowanceNum] [nvarchar](50) NULL,
	[AllowanceTtlAmt] [nvarchar](50) NULL,
	[UBMsrCode] [nvarchar](50) NULL,
	[Description] [nvarchar](50) NULL,
	[SpecialChargeCode] [nvarchar](50) NULL
);

CREATE TABLE [dbo].[tblEDI_850_ITD](
	[NO] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[HdrKey] [nvarchar](100) NULL,
	[LineKey] [nvarchar](100) NULL,
	[ItdKey] [nvarchar](100) NOT NULL,
	[TermsTypeCode] [nvarchar](100) NULL,
	[TermsBasisDateCode] [nvarchar](100) NULL,
	[TermsDiscountPercent] [float] NULL,
	[TermsDiscountDueDate] [datetime] NULL,
	[TermsDiscountDaysDue] [int] NULL,
	[TermsNetDueDate] [datetime] NULL,
	[TermsNetDays] [int] NULL,
	[TermsDiscountAmt] [float] NULL,
	[TermsDifferredDueDate] [datetime] NULL,
	[DifferredAmtDue] [float] NULL,
	[PctOfInvoicePayable] [float] NULL,
	[Description] [nvarchar](100) NULL,
	[DayOfMonth] [int] NULL
	);

CREATE TABLE [dbo].[tblEDI_850_LINE](
	[NO] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[HdrKey] [nvarchar](100) NULL,
	[LineKey] [nvarchar](100) NOT NULL,
	[PONum] [nvarchar](50) NULL,
	[POLineNum] [nvarchar](50) NULL,
	[QtyOrdered] [float] NULL,
	[UOM] [nvarchar](50) NULL,
	[UnitPrice] [float] NULL,
	[MfgBasePartNumQual] [nvarchar](50) NULL,
	[BuyersPartID] [nvarchar](50) NULL,
	[DCPartLevelQual] [nvarchar](10) NULL,
	[DCPartLevel] [nvarchar](50) NULL,
	[PartDescQual] [nvarchar](10) NULL,
	[PartDescription] [nvarchar](100) NULL,
	[ProjectNumQual] [nvarchar](10) NULL,
	[ProjectNum] [nvarchar](50) NULL,
	[EntityIDCode] [nvarchar](10) NULL,
	[CurrencyCode] [nvarchar](50) NULL,
	[BuyersEngChangeLevel] [nvarchar](50) NULL,
	[EngChangeLevel] [nvarchar](50) NULL
	);

CREATE TABLE [dbo].[tblEDI_850_N1](
	[NO] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[HdrKey] [nvarchar](100) NULL,
	[LineKey] [nvarchar](100) NULL,
	[N1Key] [nvarchar](100) NOT NULL,
	[EntityIDCode] [nvarchar](50) NULL,
	[Name] [nvarchar](100) NULL,
	[SplIDCodeQual] [nvarchar](10) NULL,
	[Code] [nvarchar](50) NULL,
	[CorpName] [nvarchar](100) NULL,
	[Address1] [nvarchar](100) NULL,
	[Address2] [nvarchar](100) NULL,
	[City] [nvarchar](50) NULL,
	[State] [nvarchar](50) NULL,
	[Zip] [nvarchar](50) NULL,
	[Country] [nvarchar](50) NULL,
	[ContactCode] [nvarchar](10) NULL,
	[ContactName] [nvarchar](100) NULL,
	[CommQual] [nvarchar](10) NULL,
	[CommNum] [nvarchar](50) NULL,
	[SCACCodeQual] [nvarchar](10) NULL,
	[SCACCode] [nvarchar](50) NULL
	);

CREATE TABLE [dbo].[tblEDI_850_N9](
	[NO] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[HdrKey] [nvarchar](100) NULL,
	[LineKey] [nvarchar](100) NULL,
	[N9Key] [nvarchar](100) NOT NULL,
	[RefQual] [nvarchar](50) NULL,
	[RefNum] [nvarchar](100) NULL,
	[Description] [nvarchar](200) NULL,
	[Msg] [nvarchar](200) NULL
	);

CREATE TABLE [dbo].[tblEDI_850_NTE](
	[NO] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[NteKey] [nvarchar](100) NOT NULL,
	[HdrKey] [nvarchar](100) NULL,
	[LineKey] [nvarchar](100) NULL,
	[DtlKey] [nvarchar](100) NULL,
	[NoteRefCode] [nvarchar](50) NULL,
	[Description] [nvarchar](200) NULL
	);

CREATE TABLE [dbo].[tblEDI_850_PID](
	[NO] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[HdrKey] [nvarchar](50) NULL,
	[LineKey] [nvarchar](50) NULL,
	[PidKey] [nvarchar](50) NOT NULL,
	[ItemDescType] [nvarchar](10) NULL,
	[ProductCharCode] [nvarchar](10) NULL,
	[ItemDescQual] [nvarchar](10) NULL,
	[ProductDescCode] [nvarchar](10) NULL,
	[Description] [nvarchar](200) NULL,
	[SLPCode] [nvarchar](10) NULL,
	[SlnKey] [nvarchar](100) NULL
	);

CREATE TABLE [dbo].[tblEDI_850_PO3](
	[NO] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[HdrKey] [nvarchar](50) NULL,
	[LineKey] [nvarchar](50) NULL,
	[PO3Key] [nvarchar](50) NOT NULL,
	[ChangeReasonCode] [nvarchar](10) NULL,
	[PriceQual] [nvarchar](10) NULL,
	[UnitPrice] [float] NULL,
	[BasisOfUnitPriceCode] [nvarchar](10) NULL,
	[Quantity] [int] NULL,
	[UnitBasisMsrCode] [nvarchar](50) NULL
	);

CREATE TABLE [dbo].[tblEDI_850_REF](
	[NO] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[HdrKey] [nvarchar](100) NULL,
	[LineKey] [nvarchar](100) NULL,
	[RefKey] [nvarchar](100) NOT NULL,
	[RefQual] [nvarchar](10) NULL,
	[RefNum] [nvarchar](100) NULL,
	[Description] [nvarchar](200) NULL
	);


CREATE TABLE [dbo].[tblEDI_850_SAC](
	[NO] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[HdrKey] [nvarchar](100) NULL,
	[LineKey] [nvarchar](100) NULL,
	[SacKey] [nvarchar](100) NOT NULL,
	[AllowanceChargeIndicator] [nvarchar](50) NULL,
	[SACCode] [nvarchar](50) NULL,
	[AgencyQual] [nvarchar](50) NULL,
	[AgencyCode] [nvarchar](50) NULL,
	[Amount] [float] NULL,
	[MethodHandlingCode] [nvarchar](50) NULL,
	[Description] [nvarchar](100) NULL
	);

CREATE TABLE [dbo].[tblEDI_850_SCH](
	[NO] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[HdrKey] [nvarchar](100) NULL,
	[LineKey] [nvarchar](100) NULL,
	[SchKey] [nvarchar](100) NOT NULL,
	[EntityIDCode] [nvarchar](100) NULL,
	[Name] [nvarchar](100) NULL,
	[Qty] [int] NULL,
	[UOM] [nvarchar](100) NULL,
	[Description] [nvarchar](100) NULL,
	[DtmReqQual] [nvarchar](100) NULL,
	[DeliveryReqDate] [datetime] NULL,
	[DtmPromisedQual] [nvarchar](100) NULL,
	[DeliveryPromisedDate] [datetime] NULL,
	[ContainerQty] [int] NULL,
	[ContainerType] [nvarchar](100) NULL,
	[N1Key] [nvarchar](100) NULL
	);

CREATE TABLE [dbo].[tblEDI_850_SHH](
	[NO] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[HdrKey] [nvarchar](50) NULL,
	[LineKey] [nvarchar](50) NULL,
	[ShhKey] [nvarchar](50) NOT NULL,
	[SchedulingCode] [nvarchar](10) NULL,
	[DtmQual] [nvarchar](50) NULL,
	[Date] [datetime] NULL,
	[Description] [nvarchar](200) NULL
	);

CREATE TABLE [dbo].[tblEDI_850_SLN](
	[NO] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[HdrKey] [nvarchar](100) NULL,
	[LineKey] [nvarchar](100) NULL,
	[SlnKey] [nvarchar](100) NOT NULL,
	[AssignedID] [nvarchar](50) NULL,
	[RelationshipCode] [nvarchar](50) NULL,
	[ProductIDQual] [nvarchar](50) NULL,
	[ProductID] [nvarchar](50) NULL
	);

CREATE TABLE [dbo].[tblEDI_856_HEADER](
	[NO] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[HdrKey] [nvarchar](100) NOT NULL,
	[ISAControlNum] [nvarchar](50) NULL,
	[ISASenderID] [nvarchar](50) NULL,
	[GSControlNum] [nvarchar](50) NULL,
	[GSSenderID] [nvarchar](50) NULL,
	[TransSetID] [nvarchar](50) NULL,
	[TransSetControlNum] [nvarchar](50) NULL,
	[TransSetPurpose] [nvarchar](50) NULL,
	[ASNNumber] [nvarchar](50) NULL,
	[GeneratedDateTime] [datetime] NULL,
	[DateAdded] [datetime] DEFAULT GETDATE() NOT NULL,
	[SubmitDateTime] [datetime] NULL,
	[DateQual] [nvarchar](50) NULL,
	[ShipDate] [datetime] NULL,
	[HashTotal] [int] NULL,
	[blnRepFlag] [bit] DEFAULT (1) NULL,
	[GSReceiverID] [nvarchar](50) NULL,
	blnEmailFlag BIT DEFAULT(0) NULL
	);

CREATE TABLE [dbo].[tblEDI_856_HL2](
	[NO] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[HdrKey] [nvarchar](100) NULL,
	[LineKey] [nvarchar](100) NULL,
	[HL2Key] [nvarchar](100) NOT NULL,
	[HLIDNo] [nvarchar](50) NULL,
	[HLParentIDNo] [nvarchar](50) NULL,
	[HLCode] [nvarchar](50) NULL,
	[PkgIDQual] [nvarchar](50) NULL,
	[PkgType] [nvarchar](50) NULL,
	[ReturnSNIDQual] [nvarchar](50) NULL,
	[ReturnSN] [nvarchar](50) NULL,
	[MasterMixLabelQual] [nvarchar](50) NULL,
	[MasterMixSN] [nvarchar](50) NULL
	);

CREATE TABLE [dbo].[tblEDI_856_HL3](
	[NO] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[HdrKey] [nvarchar](100) NULL,
	[LineKey] [nvarchar](100) NULL,
	[HL2Key] [nvarchar](100) NULL,
	[HL3Key] [nvarchar](100) NOT NULL,
	[HLIDNo] [nvarchar](50) NULL,
	[HLParentIDNo] [nvarchar](50) NULL,
	[HLCode] [nvarchar](50) NULL,
	[PartNoQual] [nvarchar](50) NULL,
	[PartNo] [nvarchar](50) NULL,
	[DCPartLevelQual] [nvarchar](50) NULL,
	[DCPartLevel] [nvarchar](50) NULL,
	[LotNoQual] [nvarchar](50) NULL,
	[LotNo] [nvarchar](50) NULL,
	[ShipSchedQual] [nvarchar](50) NULL,
	[ShipSchedNo] [nvarchar](50) NULL,
	[ProjNoQual] [nvarchar](50) NULL,
	[ProjNo] [nvarchar](50) NULL,
	[POQual] [nvarchar](50) NULL,
	[PONo] [nvarchar](50) NULL,
	[IPPTag1Qual] [nvarchar](50) NULL,
	[IPPTag1No] [nvarchar](50) NULL,
	[IPPTag1ReasonQual] [nvarchar](50) NULL,
	[IPPTag1ReasonCode] [nvarchar](50) NULL,
	[IPPTag2Qual] [nvarchar](50) NULL,
	[IPPTag2No] [nvarchar](50) NULL,
	[IPPTag2ReasonQual] [nvarchar](50) NULL,
	[IPPTag2ReasonCode] [nvarchar](50) NULL,
	[SupplierLotNoQual] [nvarchar](50) NULL,
	[SupplierLotNo] [nvarchar](50) NULL,
	[ReturnSNIDQual] [nvarchar](50) NULL,
	[ReturnSN] [nvarchar](50) NULL,
	[ContPkgIDQual] [nvarchar](50) NULL,
	[ContPkgType] [nvarchar](50) NULL,
	[CountryOfOrgQual] [nvarchar](50) NULL,
	[CountryOfOrg] [nvarchar](50) NULL,
	[Quantity] [float] NULL,
	[UOM] [nvarchar](50) NULL,
	[ContLabelQual] [nvarchar](50) NULL,
	[ContLabelSN] [nvarchar](50) NULL
	);

CREATE TABLE [dbo].[tblEDI_856_LINE](
	[NO] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[LineKey] [nvarchar](100) NOT NULL,
	[HdrKey] [nvarchar](100) NULL,
	[HLIDNo] [nvarchar](50) NULL,
	[HLCode] [nvarchar](50) NULL,
	[WeightQual] [nvarchar](50) NULL,
	[Weight] [float] NULL,
	[UOM] [nvarchar](50) NULL,
	[SCACCodeQual] [nvarchar](50) NULL,
	[SCACCode] [nvarchar](50) NULL,
	[TrackingNo] [nvarchar](50) NULL,
	[EquipDescCode] [nvarchar](50) NULL,
	[TrailerNo] [nvarchar](50) NULL,
	[SpecialHandlingCode] [nvarchar](50) NULL,
	[BOLQual] [nvarchar](50) NULL,
	[BOLNo] [nchar](10) NULL
	);

CREATE TABLE [dbo].[tblEDI_856_N1](
	[NO] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[HdrKey] [nvarchar](100) NULL,
	[LineKey] [nvarchar](100) NULL,
	[N1Key] [nvarchar](100) NOT NULL,
	[EntityIDCode] [nvarchar](50) NULL,
	[CodeQual] [nvarchar](50) NULL,
	[Code] [nvarchar](50) NULL
	);

CREATE TABLE [dbo].[tblEDI_856_DTM](
	[NO] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[DtmKey] [nvarchar](100) NOT NULL,
	[HdrKey] [nvarchar](100) NULL,
	[LineKey] [nvarchar](100) NULL,
	[DtmQual] [nvarchar](50) NULL,
	[Date] [datetime] NULL
)

CREATE TABLE [dbo].[tblEDI_856_REF](
	[NO] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[RefKey] [nvarchar](100) NOT NULL,
	[HL3Key] [nvarchar](100) NULL,
	[HL2Key] [nvarchar](100) NULL,
	[LineKey] [nvarchar](100) NULL,
	[HdrKey] [nvarchar](100) NULL,
	[RefQual] [nvarchar](50) NULL,
	[RefNum] [nvarchar](100) NULL
)


CREATE TABLE [dbo].[tblEDI_860_CTP](
	[NO] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[HdrKey] [nvarchar](50) NULL,
	[LineKey] [nvarchar](50) NULL,
	[CtpKey] [nvarchar](50) NOT NULL,
	[PriceIDCode] [nvarchar](50) NULL,
	[UnitPrice] [float] NULL
	);

CREATE TABLE [dbo].[tblEDI_860_DTM](
	[NO] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[HdrKey] [nvarchar](50) NULL,
	[LineKey] [nvarchar](50) NULL,
	[DtmKey] [nvarchar](50) NOT NULL,
	[DtmQual] [nvarchar](50) NULL,
	[Date] [datetime] NULL
	);

CREATE TABLE [dbo].[tblEDI_860_HEADER](
	[NO] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[HdrKey] [nvarchar](100) NOT NULL,
	[ISASenderID] [nvarchar](50) NULL,
	[ISAControlNum] [nvarchar](50) NULL,
	[SubmitDateTime] [datetime] NULL,
	[GSSenderID] [nvarchar](50) NULL,
	[GSControlNum] [nvarchar](50) NULL,
	[TransSetID] [nvarchar](50) NULL,
	[TransSetControlNum] [nvarchar](50) NULL,
	[TransSetPurpose] [nvarchar](50) NULL,
	[POTypeCode] [nvarchar](50) NULL,
	[PONum] [nvarchar](50) NULL,
	[ChangeOrderSeqNum] [nvarchar](50) NULL,
	[PODate] [datetime] NULL,
	[EntityIDCode] [nvarchar](10) NULL,
	[Currency] [nvarchar](50) NULL,
	[ExchangeRate] [float] NULL,
	[FOBShpMethod] [nvarchar](50) NULL,
	[FOBLocationQual] [nvarchar](50) NULL,
	[FOBDescription] [nvarchar](200) NULL,
	[FOBLocationQual2] [nvarchar](50) NULL,
	[FOBDescription2] [nvarchar](200) NULL,
	[TransMethod] [nvarchar](50) NULL,
	[CarrierName] [nvarchar](100) NULL,
	[DateAdded] [datetime] DEFAULT GETDATE() NOT NULL,
	[GeneratedDateTime] [datetime] NULL,
	[AdminFuncCode_hdr] [nvarchar](50) NULL,
	[AdminContact_hdr] [nvarchar](100) NULL,
	[AdminCommNumQual_hdr] [nvarchar](50) NULL,
	[AdminPhone_hdr] [nvarchar](50) NULL,
	[CTPClass] [nvarchar](50) NULL,
	[STPPriceQual] [nvarchar](50) NULL,
	[TextMessageCode] [nvarchar](10) NULL,
	[Check864] [nvarchar](50) NULL,
	[blnRepFlag] [bit] DEFAULT (1) NULL,
	[ReleaseNum] [nvarchar](50) NULL,
	[FOBTransTermsQual] [nvarchar](50) NULL,
	[FOBTransTermsCode] [nvarchar](50) NULL,
	[GSReceiverID] [nvarchar](50) NULL
	);


CREATE TABLE [dbo].[tblEDI_860_ITA](
	[NO] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[HdrKey] [nvarchar](50) NULL,
	[LineKey] [nvarchar](50) NULL,
	[ItaKey] [nvarchar](50) NOT NULL,
	[AllowanceID] [nvarchar](10) NULL,
	[SpecialServiceCode] [nvarchar](50) NULL,
	[AllowanceMethodofHdlCode] [nvarchar](50) NULL,
	[AllowanceNum] [nvarchar](50) NULL,
	[AllowanceTtlAmt] [nvarchar](50) NULL,
	[UBMsrCode] [nvarchar](50) NULL,
	[Description] [nvarchar](50) NULL,
	[SpecialChargeCode] [nvarchar](50) NULL
	);

CREATE TABLE [dbo].[tblEDI_860_ITD](
	[NO] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[HdrKey] [nvarchar](100) NULL,
	[LineKey] [nvarchar](100) NULL,
	[ItdKey] [nvarchar](100) NOT NULL,
	[TermsTypeCode] [nvarchar](100) NULL,
	[TermsBasisDateCode] [nvarchar](100) NULL,
	[TermsDiscountPercent] [float] NULL,
	[TermsDiscountDueDate] [datetime] NULL,
	[TermsDiscountDaysDue] [int] NULL,
	[TermsNetDueDate] [datetime] NULL,
	[TermsNetDays] [int] NULL,
	[TermsDiscountAmt] [float] NULL,
	[TermsDifferredDueDate] [datetime] NULL,
	[DifferredAmtDue] [float] NULL,
	[PctOfInvoicePayable] [float] NULL,
	[Description] [nvarchar](100) NULL,
	[DayOfMonth] [int] NULL
	);

CREATE TABLE [dbo].[tblEDI_860_LINE](
	[NO] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[HdrKey] [nvarchar](100) NULL,
	[LineKey] [nvarchar](100) NOT NULL,
	[PONum] [nvarchar](50) NULL,
	[POLineNum] [nvarchar](50) NULL,
	[LineItemChange] [nvarchar](50) NULL,
	[QtyOrdered] [float] NULL,
	[QtyLeftToRcv] [float] NULL,
	[UOM] [nvarchar](50) NULL,
	[UnitPrice] [float] NULL,
	[ProdID1Qual] [nvarchar](50) NULL,
	[ProdID1] [nvarchar](50) NULL,
	[ProdID2Qual] [nvarchar](50) NULL,
	[ProdID2] [nvarchar](50) NULL,
	[ProdID3Qual] [nvarchar](50) NULL,
	[ProdID3] [nvarchar](50) NULL,
	[CurrencyCode] [nvarchar](50) NULL,
	[UOMCode] [nvarchar](50) NULL
	);

CREATE TABLE [dbo].[tblEDI_860_MSG](
	[NO] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[MsgKey] [nvarchar](100) NOT NULL,
	[N9Key] [nvarchar](100) NULL,
	[HdrKey] [nvarchar](100) NULL,
	[MsgText] [nvarchar](1000) NULL
	);

CREATE TABLE [dbo].[tblEDI_860_N1](
	[NO] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[HdrKey] [nvarchar](100) NULL,
	[LineKey] [nvarchar](100) NULL,
	[N1Key] [nvarchar](100) NOT NULL,
	[EntityIDCode] [nvarchar](50) NULL,
	[Name] [nvarchar](100) NULL,
	[SplIDCodeQual] [nvarchar](10) NULL,
	[Code] [nvarchar](50) NULL,
	[Address1] [nvarchar](100) NULL,
	[Address2] [nvarchar](100) NULL,
	[City] [nvarchar](50) NULL,
	[State] [nvarchar](50) NULL,
	[Zip] [nvarchar](50) NULL,
	[Country] [nvarchar](50) NULL,
	[ContactCode] [nvarchar](10) NULL,
	[ContactName] [nvarchar](100) NULL,
	[CommQual] [nvarchar](10) NULL,
	[CommNum] [nvarchar](50) NULL,
	[SCACCodeQual] [nvarchar](10) NULL,
	[SCACCode] [nvarchar](50) NULL,
	[CorpName] [nvarchar](50) NULL,
	[CommQual2] [nvarchar](10) NULL,
	[CommNum2] [nvarchar](50) NULL
	);


CREATE TABLE [dbo].[tblEDI_860_N9](
	[NO] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[HdrKey] [nvarchar](100) NULL,
	[LineKey] [nvarchar](100) NULL,
	[N9Key] [nvarchar](100) NOT NULL,
	[RefQual] [nvarchar](50) NULL,
	[RefNum] [nvarchar](100) NULL,
	[Description] [nvarchar](200) NULL,
	[Msg] [nvarchar](200) NULL
	);

CREATE TABLE [dbo].[tblEDI_860_NTE](
	[NO] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[NteKey] [nvarchar](100) NOT NULL,
	[HdrKey] [nvarchar](100) NULL,
	[LineKey] [nvarchar](100) NULL,
	[DtlKey] [nvarchar](100) NULL,
	[NoteRefCode] [nvarchar](50) NULL,
	[Description] [nvarchar](200) NULL,
	[N9Key] [nvarchar](100) NULL
	);

CREATE TABLE [dbo].[tblEDI_860_PID](
	[NO] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[HdrKey] [nvarchar](50) NULL,
	[LineKey] [nvarchar](50) NULL,
	[PidKey] [nvarchar](50) NOT NULL,
	[ItemDescType] [nvarchar](10) NULL,
	[ProductCharCode] [nvarchar](10) NULL,
	[ItemDescQual] [nvarchar](10) NULL,
	[ProductDescCode] [nvarchar](10) NULL,
	[Description] [nvarchar](200) NULL,
	[SLPCode] [nvarchar](10) NULL,
	[SlnKey] [nvarchar](100) NULL
	);

CREATE TABLE [dbo].[tblEDI_860_PKG](
	[NO] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[HdrKey] [nvarchar](100) NULL,
	[LineKey] [nvarchar](100) NULL,
	[PkgKey] [nvarchar](100) NOT NULL,
	[ItemDescrpType] [nvarchar](50) NULL,
	[PkgCharCode] [nvarchar](50) NULL,
	[PkgDescription] [nvarchar](100) NULL

	);

CREATE TABLE [dbo].[tblEDI_860_PO3](
	[NO] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[HdrKey] [nvarchar](50) NULL,
	[LineKey] [nvarchar](50) NULL,
	[PO3Key] [nvarchar](50) NOT NULL,
	[ChangeReasonCode] [nvarchar](10) NULL,
	[PriceQual] [nvarchar](10) NULL,
	[UnitPrice] [float] NULL,
	[BasisOfUnitPriceCode] [nvarchar](10) NULL,
	[Quantity] [int] NULL,
	[UnitBasisMsrCode] [nvarchar](50) NULL

	);

CREATE TABLE [dbo].[tblEDI_860_REF](
	[NO] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[HdrKey] [nvarchar](100) NULL,
	[LineKey] [nvarchar](100) NULL,
	[RefKey] [nvarchar](100) NOT NULL,
	[RefQual] [nvarchar](10) NULL,
	[RefNum] [nvarchar](100) NULL,
	[Description] [nvarchar](200) NULL
	);

CREATE TABLE [dbo].[tblEDI_860_SAC](
	[NO] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[HdrKey] [nvarchar](100) NULL,
	[LineKey] [nvarchar](100) NULL,
	[SacKey] [nvarchar](100) NOT NULL,
	[AllowanceChargeIndicator] [nvarchar](50) NULL,
	[SACCode] [nvarchar](50) NULL,
	[AgencyQual] [nvarchar](50) NULL,
	[AgencyCode] [nvarchar](50) NULL,
	[Amount] [float] NULL,
	[MethodHandlingCode] [nvarchar](50) NULL,
	[Description] [nvarchar](100) NULL
	);


CREATE TABLE [dbo].[tblEDI_860_SCH](
	[NO] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[HdrKey] [nvarchar](100) NULL,
	[LineKey] [nvarchar](100) NULL,
	[SchKey] [nvarchar](100) NOT NULL,
	[EntityIDCode] [nvarchar](100) NULL,
	[Name] [nvarchar](100) NULL,
	[Qty] [int] NULL,
	[UOM] [nvarchar](100) NULL,
	[Description] [nvarchar](100) NULL,
	[DtmReqQual] [nvarchar](100) NULL,
	[DeliveryReqDate] [datetime] NULL,
	[DtmPromisedQual] [nvarchar](100) NULL,
	[DeliveryPromisedDate] [datetime] NULL,
	[ContainerQty] [int] NULL,
	[ContainerType] [nvarchar](100) NULL,
	[AssignedID] [nvarchar](50) NULL,
	[N1Key] [nvarchar](100) NULL
	);

CREATE TABLE [dbo].[tblEDI_860_SHH](
	[NO] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[HdrKey] [nvarchar](50) NULL,
	[ShhKey] [nvarchar](50) NOT NULL,
	[SchedulingCode] [nvarchar](10) NULL,
	[DtmQual] [nvarchar](50) NULL,
	[Date] [datetime] NULL,
	[Description] [nvarchar](200) NULL
	);

CREATE TABLE [dbo].[tblEDI_860_SLN](
	[NO] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[HdrKey] [nvarchar](100) NULL,
	[LineKey] [nvarchar](100) NULL,
	[SlnKey] [nvarchar](100) NOT NULL,
	[AssignedID] [nvarchar](50) NULL,
	[RelationshipCode] [nvarchar](50) NULL,
	[ProductIDQual] [nvarchar](50) NULL,
	[ProductID] [nvarchar](50) NULL
	);

CREATE TABLE [dbo].[tblEDI_860_TD5](
	[NO] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[TD5Key] [nvarchar](100) NOT NULL,
	[HdrKey] [nvarchar](100) NULL,
	[TransMethod] [nvarchar](50) NULL,
	[CarrierName] [nvarchar](100) NULL
	);

CREATE TABLE [dbo].[tblEDI_861_DTM](
	[NO] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[HdrKey] [nvarchar](50) NULL,
	[DtmKey] [nvarchar](50) NOT NULL,
	[DtmQual] [nvarchar](50) NULL,
	[Date] [datetime] NULL,
	[TimeCode] [nvarchar](50) NULL
	);

CREATE TABLE [dbo].[tblEDI_861_HEADER](
	[NO] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[HdrKey] [nvarchar](100) NOT NULL,
	[ISASenderID] [nvarchar](50) NULL,
	[ISAControlNum] [nvarchar](50) NULL,
	[GSSenderID] [nvarchar](50) NULL,
	[GSControlNum] [nvarchar](50) NULL,
	[TransSetID] [nvarchar](50) NULL,
	[TransSetControlNum] [nvarchar](50) NULL,
	[TransSetPurpose] [nvarchar](50) NULL,
	[ReceivingAdviceNum] [nvarchar](50) NULL,
	[ReceivingAdviceTypeCode] [nvarchar](50) NULL,
	[GeneratedDateTime] [datetime] NULL,
	[DateQual] [nvarchar](50) NULL,
	[ReceiptDateTime] [datetime] NULL,
	[DateAdded] [datetime] DEFAULT GETDATE() NOT NULL,
	[SubmitDateTime] [datetime] NULL,
	[blnRepFlag] [bit] DEFAULT (1) NULL,
	[GSReceiverID] [nvarchar](50) NULL
	);

CREATE TABLE [dbo].[tblEDI_861_LINE](
	[NO] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[HdrKey] [nvarchar](100) NULL,
	[LineKey] [nvarchar](100) NOT NULL,
	[RecvdQty] [float] NULL,
	[RecvdQtyUOM] [nvarchar](50) NULL,
	[RecvdConditionCode] [nvarchar](50) NULL,
	[ReturnQty] [float] NULL,
	[ReturnQtyUOM] [nvarchar](50) NULL,
	[QuestionQty] [float] NULL,
	[QuestionQtyUOM] [nvarchar](50) NULL,
	[QuestionConditionCode] [nvarchar](50) NULL,
	[Question2Qty] [float] NULL,
	[Question2QtyUOM] [nvarchar](50) NULL,
	[Question2ConditionCode] [nvarchar](50) NULL,
	[ShippedUnit] [float] NULL,
	[ShippedUnitUOM] [nvarchar](50) NULL,
	[ProdIDQual] [nvarchar](50) NULL,
	[BuyersPartID] [nvarchar](50) NULL,
	[ProdIDQual2] [nvarchar](50) NULL,
	[BuyersEngChangeLevel] [nvarchar](50) NULL,
	[ShipScheduleQual] [nvarchar](50) NULL,
	[ShipScheduleNum] [nvarchar](50) NULL,
	[ProjNumQual] [nvarchar](50) NULL,
	[ProjNum] [nvarchar](50) NULL,
	[POQual] [nvarchar](50) NULL,
	[PONum] [nvarchar](50) NULL,
	[ContainerLabelSNQual] [nvarchar](50) NULL,
	[ContainerLabelSN] [nvarchar](100) NULL,
	[PalletLabelSNQual] [nvarchar](50) NULL,
	[PalletLabelSN] [nvarchar](100) NULL,
	[BOLNum] [nvarchar](50) NULL,
	[ASN_PLNum] [nvarchar](50) NULL,
	[ItemDescriptionType] [nvarchar](50) NULL,
	[ItemDescriptionCode] [nvarchar](50) NULL,
	[ItemDescription] [nvarchar](150) NULL
	);

CREATE TABLE [dbo].[tblEDI_861_N1](
	[NO] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[HdrKey] [nvarchar](100) NULL,
	[LineKey] [nvarchar](100) NULL,
	[N1Key] [nvarchar](100) NOT NULL,
	[EntityIDCode] [nvarchar](50) NULL,
	[CodeQual] [nvarchar](50) NULL,
	[Name] [nvarchar](100) NULL,
	[Code] [nvarchar](50) NULL,
	[Address1] [nvarchar](100) NULL,
	[Address2] [nvarchar](100) NULL,
	[City] [nvarchar](50) NULL,
	[State] [nvarchar](50) NULL,
	[Zip] [nvarchar](50) NULL,
	[Country] [nvarchar](50) NULL,
	[ContactCode] [nvarchar](50) NULL,
	[ContactName] [nvarchar](100) NULL
	);

CREATE TABLE [dbo].[tblEDI_861_REF](
	[NO] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[HdrKey] [nvarchar](100) NULL,
	[LineKey] [nvarchar](100) NULL,
	[RefKey] [nvarchar](100) NOT NULL,
	[RefQual] [nvarchar](10) NULL,
	[RefNum] [nvarchar](100) NULL,
	[Description] [nvarchar](200) NULL,
	[RefID] [nvarchar](100) NULL
	);

CREATE TABLE [dbo].[tblEDI_862_ATH](
	[NO] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[HdrKey] [nvarchar](100) NULL,
	[LineKey] [nvarchar](100) NULL,
	[AthKey] [nvarchar](100) NOT NULL,
	[ResourceAuthCode] [nvarchar](50) NULL,
	[ResourceAuth_ThruDate] [datetime] NULL,
	[CumAthQty] [nvarchar](50) NULL,
	[AthQty] [nvarchar](50) NULL,
	[CumStartDate] [datetime] NULL
	);

CREATE TABLE [dbo].[tblEDI_862_DETAIL](
	[NO] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[HdrKey] [nvarchar](100) NULL,
	[LineKey] [nvarchar](100) NULL,
	[DtlKey] [nvarchar](100) NOT NULL,
	[TotalDailyQty] [float] NULL,
	[DiffQty] [float] NULL,
	[ForecastQual] [nvarchar](50) NULL,
	[ForecastTimeQual] [nvarchar](50) NULL,
	[FST_DeliveryShipmentDate] [datetime] NULL,
	[DateTimeQual] [nvarchar](50) NULL,
	[DeliveryShipDate] [datetime] NULL,
	[RefNumQual] [nvarchar](50) NULL,
	[RefNum] [nvarchar](50) NULL
	);


CREATE TABLE [dbo].[tblEDI_862_DTM](
	[NO] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[HdrKey] [nvarchar](50) NULL,
	[LineKey] [nvarchar](50) NULL,
	[DtlKey] [nvarchar](50) NULL,
	[FstKey] [nvarchar](50) NULL,
	[DtmKey] [nvarchar](50) NOT NULL,
	[DtmQual] [nvarchar](50) NULL,
	[CreateDateTime] [datetime] NULL,
	[TimeCode] [nvarchar](50) NULL
	);

CREATE TABLE [dbo].[tblEDI_862_EXPORT](
	[NO] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[ExportNo] [int] NOT NULL,
	[JitKey] [nvarchar](100) NOT NULL,
	[ExportQty] [float] NULL,
	[PONum] [nvarchar](50) NULL,
	[PONum_Suffix] [int] NULL,
	[ExportDateTime] [datetime] NULL
	);

CREATE TABLE [dbo].[tblEDI_862_HEADER](
	[NO] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[HdrKey] [nvarchar](100) NOT NULL,
	[ISASenderID] [nvarchar](50) NULL,
	[ISAControlNum] [nvarchar](50) NULL,
	[SubmitDateTime] [datetime] NULL,
	[GSSenderID] [nvarchar](50) NULL,
	[GSControlNum] [nvarchar](50) NULL,
	[TransSetID] [nvarchar](50) NULL,
	[TransSetControlNum] [nvarchar](50) NULL,
	[TransSetPurpose] [nvarchar](50) NULL,
	[ReferenceID] [nvarchar](50) NULL,
	[GeneratedDateTime] [datetime] NULL,
	[ScheduleTypeQual] [nvarchar](50) NULL,
	[HorizonStartDate] [datetime] NULL,
	[HorizonEndDate] [datetime] NULL,
	[ReleaseNumber] [nvarchar](20) NULL,
	[ContactNumber] [nvarchar](20) NULL,
	[PONum] [nvarchar](20) NULL,
	[ScheduleQtyQual] [nvarchar](50) NULL,
	[AdminFuncCode_hdr] [nvarchar](50) NULL,
	[AdminContact_hdr] [nvarchar](100) NULL,
	[AdminCommNumQual_hdr] [nvarchar](50) NULL,
	[AdminPhone_hdr] [nvarchar](50) NULL,
	[DateAdded] [datetime] DEFAULT GETDATE() NOT NULL,
	[blnRepFlag] [bit] DEFAULT (1) NULL,
	[GSReceiverID] [nvarchar](50) NULL,
	[blnEmailFlag] [bit] DEFAULT (0) NULL

	);

CREATE TABLE [dbo].[tblEDI_862_JIT](
	[NO] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[HdrKey] [nvarchar](100) NULL,
	[LineKey] [nvarchar](100) NULL,
	[DtlKey] [nvarchar](100) NULL,
	[JitKey] [nvarchar](100) NOT NULL,
	[Quantity] [float] NULL,
	[DeliveryShipTime] [datetime] NULL,
	[HondaLotNumberQual] [nvarchar](10) NULL,
	[HondaLotNumber] [nvarchar](50) NULL,
	[SmallLotDeliveryBatchNumQual] [nvarchar](10) NULL,
	[SmallLotDeliveryBatchNum] [nvarchar](50) NULL,
	[LotSequenceNumQual] [nvarchar](10) NULL,
	[LotSequenceNum] [nvarchar](50) NULL,
	[ShipScheduleOrderNumQual] [nvarchar](50) NULL,
	[ShipScheduleOrderNum] [nvarchar](50) NULL,
	[blnPrint] [bit] NULL,
	[ShipmentTimeQual] [nvarchar](50) NULL,
	[ShipmentTime] [datetime] NULL
	);

CREATE TABLE [dbo].[tblEDI_862_LINE](
	[NO] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[HdrKey] [nvarchar](100) NULL,
	[LineKey] [nvarchar](100) NOT NULL,
	[AssignedID] [nvarchar](50) NULL,
	[PartIDQual] [nvarchar](10) NULL,
	[BuyersPartID] [nvarchar](50) NULL,
	[DCPartLevelQual] [nvarchar](10) NULL,
	[DCPartLevel] [nvarchar](50) NULL,
	[PartDescQual] [nvarchar](10) NULL,
	[PartDescription] [nvarchar](100) NULL,
	[PartLevelShipScheduleNumQual] [nvarchar](10) NULL,
	[PartLevelShipScheduleNum] [nvarchar](50) NULL,
	[ProjectNoQual] [nvarchar](10) NULL,
	[ProjectNo] [nvarchar](50) NULL,
	[PackagingCode] [nvarchar](50) NULL,
	[QtyPerContainer] [int] NULL,
	[ContainerType] [nvarchar](50) NULL,
	[WeightQual] [nvarchar](10) NULL,
	[Weight] [nvarchar](50) NULL,
	[TD1UOM] [nvarchar](10) NULL,
	[EquipDescCode] [nvarchar](10) NULL,
	[EquipNum] [nvarchar](50) NULL,
	[RoutingSeqCode] [nchar](10) NULL,
	[SCACCodeQual] [nvarchar](10) NULL,
	[SCACCode] [nvarchar](50) NULL,
	[TransMethodTypeCode] [nvarchar](50) NULL,
	[Routing] [nvarchar](50) NULL,
	[ShipOrdStatusCode] [nvarchar](50) NULL,
	[LocationQual] [nvarchar](50) NULL,
	[LocationID] [nvarchar](50) NULL,
	[TransDirectionCode] [nvarchar](50) NULL,
	[TransTimeDirectionQual] [nvarchar](50) NULL,
	[TransTime] [nvarchar](50) NULL,
	[UOM] [nvarchar](50) NULL,
	[UnitPrice] [float] NULL,
	[NoteRefCode] [nvarchar](10) NULL,
	[FreeFormMsg] [nvarchar](200) NULL,
	[AdminFuncCode_lin] [nvarchar](50) NULL,
	[AdminContact_lin] [nvarchar](100) NULL,
	[AdminCommNumQual_lin] [nvarchar](50) NULL,
	[AdminPhone_lin] [nvarchar](50) NULL,
	[PalletType] [nvarchar](50) NULL
	);

CREATE TABLE [dbo].[tblEDI_862_N1](
	[NO] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[HdrKey] [nvarchar](100) NULL,
	[LineKey] [nvarchar](100) NULL,
	[N1Key] [nvarchar](100) NOT NULL,
	[EntityIDCode] [nvarchar](50) NULL,
	[Name] [nvarchar](100) NULL,
	[SqlNumQual] [nvarchar](10) NULL,
	[Code] [nvarchar](50) NULL,
	[CorpName] [nvarchar](100) NULL,
	[Address1] [nvarchar](100) NULL,
	[Address2] [nvarchar](100) NULL,
	[City] [nvarchar](50) NULL,
	[State] [nvarchar](50) NULL,
	[Zip] [nvarchar](50) NULL,
	[Country] [nvarchar](50) NULL,
	[ContactCode] [nvarchar](10) NULL,
	[ContactName] [nvarchar](100) NULL,
	[CommQual] [nvarchar](10) NULL,
	[CommNum] [nvarchar](50) NULL,
	[NNALogContact] [nvarchar](100) NULL,
	[Check864] [nvarchar](100) NULL,
	[BuyerName] [nvarchar](100) NULL,
	[RequestorName] [nvarchar](100) NULL
	);

CREATE TABLE [dbo].[tblEDI_862_REF](
	[NO] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[HdrKey] [nvarchar](100) NULL,
	[LineKey] [nvarchar](100) NULL,
	[DtlKey] [nvarchar](100) NULL,
	[ShpKey] [nvarchar](100) NULL,
	[RefKey] [nvarchar](100) NOT NULL,
	[RefQual] [nvarchar](10) NULL,
	[RefNum] [nvarchar](100) NULL,
	[Description] [nvarchar](200) NULL
	);

CREATE TABLE [dbo].[tblEDI_862_SHP](
	[NO] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[HdrKey] [nvarchar](100) NULL,
	[LineKey] [nvarchar](100) NULL,
	[ShpKey] [nvarchar](100) NOT NULL,
	[QtyQual] [nvarchar](100) NULL,
	[ShipQty] [float] NULL,
	[DateQual] [nvarchar](50) NULL,
	[LastShipDate] [datetime] NULL,
	[BegInventoryDate] [datetime] NULL
	);

CREATE TABLE [dbo].[tblEDI_864_DTM](
	[NO] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[DtmKey] [nvarchar](100) NOT NULL,
	[HdrKey] [nvarchar](100) NULL,
	[DtmQual] [nvarchar](50) NULL,
	[Date] [datetime] NULL,
	[TimeCode] [nvarchar](50) NULL
	);

CREATE TABLE [dbo].[tblEDI_864_HEADER](
	[NO] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[HdrKey] [nvarchar](100) NOT NULL,
	[ISAControlNum] [nvarchar](50) NULL,
	[ISASenderID] [nvarchar](50) NULL,
	[GSControlNum] [nvarchar](50) NULL,
	[GSSenderID] [nvarchar](50) NULL,
	[TransSetID] [nvarchar](50) NULL,
	[TransSetControlNum] [nvarchar](50) NULL,
	[TransSetPurpose] [nvarchar](50) NULL,
	[TransTypeCode] [nvarchar](50) NULL,
	[TransDescription] [nvarchar](100) NULL,
	[GeneratedDateTime] [datetime] NULL,
	[DateAdded] [datetime] DEFAULT GETDATE() NOT NULL,
	[SubmitDateTime] [datetime] NULL,
	[blnRepFlag] [bit] DEFAULT (1) NULL,
	[GSReceiverID] [nvarchar](50) NULL
	);

CREATE TABLE [dbo].[tblEDI_864_LINE](
	[NO] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[LineKey] [nvarchar](100) NOT NULL,
	[HdrKey] [nvarchar](100) NULL,
	[DocumentIDNum] [nvarchar](50) NULL,
	[Description] [nvarchar](100) NULL,
	[PageWidth] [int] NULL,
	[PageLengthLines] [int] NULL
	);

CREATE TABLE [dbo].[tblEDI_864_MSG](
	[NO] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[MsgKey] [nvarchar](100) NOT NULL,
	[HdrKey] [nvarchar](100) NULL,
	[LineKey] [nvarchar](100) NULL,
	[MsgText] [nvarchar](1000) NULL,
	[CarriageControlCode] [nvarchar](50) NULL
	);

CREATE TABLE [dbo].[tblEDI_864_N1](
	[NO] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[HdrKey] [nvarchar](100) NULL,
	[LineKey] [nvarchar](100) NULL,
	[N1Key] [nvarchar](100) NOT NULL,
	[EntityIDCode] [nvarchar](50) NULL,
	[CodeQual] [nvarchar](50) NULL,
	[Name] [nvarchar](100) NULL,
	[CorporationName] [nvarchar](100) NULL,
	[AdditionalName] [nvarchar](100) NULL,
	[Code] [nvarchar](50) NULL,
	[Address1] [nvarchar](100) NULL,
	[Address2] [nvarchar](100) NULL,
	[City] [nvarchar](50) NULL,
	[State] [nvarchar](50) NULL,
	[Zip] [nvarchar](50) NULL,
	[Country] [nvarchar](50) NULL,
	[ContactCode] [nvarchar](50) NULL,
	[ContactName] [nvarchar](100) NULL,
	[ContactNum1Qual] [nvarchar](50) NULL,
	[ContactNumber1] [nvarchar](50) NULL,
	[ContactNum2Qual] [nvarchar](50) NULL,
	[ContactNumber2] [nvarchar](50) NULL
	);


CREATE TABLE [dbo].[tblEDI_997_DETAIL](
	[NO] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[DtlKey] [nvarchar](100) NULL,
	[HdrKey] [nvarchar](100) NULL,
	[LineKey] [nvarchar](100) NULL,
	[SegmentIDCode] [nvarchar](50) NULL,
	[SegmentPosition] [int] NULL,
	[LoopIDCode] [nvarchar](50) NULL,
	[SegmentCode1] [nvarchar](50) NULL,
	[SegmentCode2] [nvarchar](50) NULL,
	[SegmentCode3] [nvarchar](50) NULL,
	[SegmentCode4] [nvarchar](50) NULL,
	[SegmentCode5] [nvarchar](50) NULL,
	[ElementPosition] [int] NULL,
	[ElementRefNum] [nvarchar](50) NULL,
	[ElementSyntaxErrorCode] [nvarchar](50) NULL,
	[CopyBadDataElement] [nvarchar](100) NULL
) ;

CREATE TABLE [dbo].[tblEDI_997_HEADER](
	[NO] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[HdrKey] [nvarchar](100) NOT NULL,
	[ISAControlNum] [nvarchar](50) NULL,
	[ISASenderID] [nvarchar](50) NULL,
	[GSControlNum] [nvarchar](50) NULL,
	[GSSenderID] [nvarchar](50) NULL,
	[TransSetID] [nvarchar](50) NULL,
	[TransSetControlNum] [nvarchar](50) NULL,
	[FunctionalIDCode] [nvarchar](50) NULL,
	[GroupControlNum] [nvarchar](50) NULL,
	[FunctionalGroupAckCode] [nvarchar](50) NULL,
	[NumofTransSetsIncluded] [int] NULL,
	[NumofReceivedTransSets] [int] NULL,
	[NumofAcceptedTransSets] [int] NULL,
	[SubmitDateTime] [datetime] NULL,
	[DateAdded] [datetime] DEFAULT GETDATE() NOT NULL,
	[GeneratedDateTime] [datetime] NULL,
	[FunctionalGroupNoteCode1] [nvarchar](50) NULL,
	[FunctionalGroupNoteCode2] [nvarchar](50) NULL,
	[FunctionalGroupNoteCode3] [nvarchar](50) NULL,
	[FunctionalGroupNoteCode4] [nvarchar](50) NULL,
	[FunctionalGroupNoteCode5] [nvarchar](50) NULL,
	[blnRepFlag] [bit] DEFAULT (1) NULL,
	[GSReceiverID] [nvarchar](50) NULL,
	[blnEmailFlag] [bit] DEFAULT (0) NULL

	);

CREATE TABLE [dbo].[tblEDI_997_LINE](
	[NO] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[LineKey] [nvarchar](100) NOT NULL,
	[HdrKey] [nvarchar](100) NULL,
	[TranSetIDCode] [nvarchar](50) NULL,
	[TranSetControlNum] [nvarchar](50) NULL,
	[TranSetAckCode] [nvarchar](50) NULL,
	[TranSetSyntaxErrorCode] [nvarchar](50) NULL,
	[TranSetNoteCode1] [nvarchar](50) NULL,
	[TranSetNoteCode2] [nvarchar](50) NULL,
	[TranSetNoteCode3] [nvarchar](50) NULL,
	[TranSetNoteCode4] [nvarchar](50) NULL,
	[TranSetNoteCode5] [nvarchar](50) NULL
	);

  
ALTER TABLE tblEDI_820_HEADER ADD blnEmailErrorFlag BIT NULL DEFAULT 0
GO
ALTER TABLE tblEDI_830_HEADER ADD blnEmailErrorFlag BIT NULL DEFAULT 0
GO
ALTER TABLE tblEDI_850_HEADER ADD blnEmailErrorFlag BIT NULL DEFAULT 0
GO
ALTER TABLE tblEDI_856_HEADER ADD blnEmailErrorFlag BIT NULL DEFAULT 0
GO
ALTER TABLE tblEDI_862_HEADER ADD blnEmailErrorFlag BIT NULL DEFAULT 0
GO


CREATE TABLE [dbo].[tblEDI_812_HEADER](
	[NO] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[HdrKey] [nvarchar](100) NOT NULL,
	[ISASenderID] [nvarchar](50) NULL,
	[SubmitDateTime] [datetime] NULL,
	[ISAControlNum] [nvarchar](50) NULL,
	[GSSenderID] [nvarchar](50) NULL,
	[GSControlNum] [nvarchar](50) NULL,
	[TransSetID] [nvarchar](50) NULL,
	[TransSetControlNum] [nvarchar](50) NULL,
	[TransSetPurpose] [nvarchar](50) NULL,
	[AdjustmentNumber] [nvarchar](50) NULL,
	[AdjustmentDate] [datetime] NULL,
	[GeneratedDateTime] [datetime] NULL,
	[TotalAdjustmentAmount] [float] NULL,
	[CreditDebitType] [nvarchar](5) NULL,
	[InvoiceNumber] [nvarchar](50) NULL,
	[PONumber] [nvarchar](50) NULL,
	[TransactionType] [nvarchar](5) NULL,
	[DateAdded] [datetime] DEFAULT GETDATE() NOT NULL,
	[CreateDate] [datetime] NULL,
	[blnRepFlag] [bit] DEFAULT (1) NULL,
	[GSReceiverID] [nvarchar](50) NULL,
	[blnEmailFlag] [bit] DEFAULT (0) NULL,
	[blnEmailErrorFlag] [bit] DEFAULT (0) NULL

	);

GO


CREATE TABLE [dbo].[tblEDI_812_LINE](
	[NO] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[HdrKey] [nvarchar](100) NULL,
	[LineKey] [nvarchar](100) NOT NULL,
	[ProdIDQual] [nvarchar](50) NULL,
	[BuyersPartID] [nvarchar](50) NULL,
	[PartDescQual] [nvarchar](50) NULL,
	[PartDescription] [nvarchar](100) NULL,
	[AdjReasonCode] [nvarchar](10) NULL,
	[CreditDebitType] [nvarchar](5) NULL,
	[AdjustmentAmount] [float] NULL,
	[AdjustmentQty] [int] NULL,
	[UOM] [nvarchar](10) NULL,
	[UnitPrice] [float] NULL,
	[ChargeQual] [nvarchar](50) NULL,
	[ChargeDescription] [nvarchar](100) NULL
	
	);

GO

CREATE TABLE [dbo].[tblEDI_812_N1](
	[NO] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[HdrKey] [nvarchar](100) NULL,
	[LineKey] [nvarchar](100) NULL,
	[N1Key] [nvarchar](100) NOT NULL,
	[EntityIDCode] [nvarchar](50) NULL,
	[Name] [nvarchar](100) NULL,
	[SplIDCodeQual] [nvarchar](50) NULL,
	[Code] [nvarchar](50) NULL,
	[CorpName] [nvarchar](100) NULL,
	[Address1] [nvarchar](100) NULL,
	[Address2] [nvarchar](100) NULL,
	[City] [nvarchar](50) NULL,
	[State] [nvarchar](50) NULL,
	[Zip] [nvarchar](50) NULL,
	[Country] [nvarchar](50) NULL,
	[ContactCode] [nvarchar](10) NULL,
	[ContactName] [nvarchar](100) NULL,
	[CommQual] [nvarchar](10) NULL,
	[CommNum] [nvarchar](50) NULL
	);

GO


CREATE TABLE [dbo].[tblEDI_812_REF](
	[NO] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[HdrKey] [nvarchar](100) NULL,
	[LineKey] [nvarchar](100) NULL,
	[RefKey] [nvarchar](100) NOT NULL,
	[RefQual] [nvarchar](10) NULL,
	[RefNum] [nvarchar](100) NULL,
	[Description] [nvarchar](200) NULL
);

GO
 
CREATE TABLE [dbo].[tblEDI_4095_HEADER](
	[NO] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[HdrKey] [nvarchar](100) NOT NULL,
	[VersionNumber] [nvarchar](50) NULL,
	[SenderID] [nvarchar](50) NULL,
	[ReceiverID] [nvarchar](50) NULL,
	[TransmissionNumberOld] [nvarchar](50) NULL,
	[TransmissionNumberNew] [nvarchar](50) NULL,
	[TransmissionDate] [datetime] NULL,
	[CUMStartDate] [datetime] NULL,
	[DateAdded] [datetime] DEFAULT GETDATE() NOT NULL,
	[blnRepFlag] [bit] DEFAULT (1) NULL,
	[blnEmailFlag] [bit] DEFAULT (0) NULL,
	[blnEmailErrorFlag] [bit] DEFAULT (0) NULL
	);

GO


CREATE TABLE [dbo].[tblEDI_4095_LINE](
	[NO] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[LineKey] [nvarchar](100) NOT NULL,
	[HdrKey] [nvarchar](100) NULL,	
	[VersionNumber] [nvarchar](50) NULL,
	[PlantID] [nvarchar](50) NULL,
	[DeliveryNumberNew] [nvarchar](50) NULL,
	[DeliveryDateNew] [datetime] NULL,
	[DeliveryNumberOld] [nvarchar](50) NULL,
	[DeliveryDateOld] [datetime] NULL,
	[CustomerItemID] [nvarchar](50) NULL,
	[VendorItemID] [nvarchar](50) NULL,
	[OrderNumber] [nvarchar](50) NULL,
	[DockCode] [nvarchar](50) NULL,
	[CustomerClerkID] [nvarchar](50) NULL,
	[UnitOfMeasure] [nvarchar](50) NULL,
	[DeliveryFrequency] [nvarchar](50) NULL,
	[ManufacturingRelease] [nvarchar](50) NULL,
	[RequirementCode] [nvarchar](50) NULL,
	[AccountKey] [nvarchar](50) NULL,
	[StockLocation] [nvarchar](50) NULL

	);

	GO

CREATE TABLE [dbo].[tblEDI_4095_DETAIL](
	[NO] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[DtlKey] [nvarchar](100) NOT NULL,
	[HdrKey] [nvarchar](100) NULL,	
	[LineKey] [nvarchar](100) NULL,	
	[VersionNumber] [nvarchar](50) NULL,
	[LastReceiptDate] [datetime] NULL,
	[LastDeliveryNumber] [nvarchar](50) NULL,
	[LastShipDate] [datetime] NULL,
	[LastReceiptQty] [int] NULL,
	[CUMReceiptQty] [int] NULL,
	[CallOffDate] [nvarchar](50) NULL,
	[CallOfQty] [int] NULL
	
	);

GO



CREATE TABLE [dbo].[tblEDI_4095_DTM](
	[NO] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[DtmKey] [nvarchar](100) NOT NULL,
	[HdrKey] [nvarchar](100) NULL,	
	[LineKey] [nvarchar](100) NULL,	
	[DtlKey] [nvarchar](100) NULL,
	[VersionNumber] [nvarchar](50) NULL,
	
	[ManufacturingStartDate] [datetime] NULL,
	[ManufacturingEndDate] [datetime] NULL,
	[ManufacturingReqQty] [int] NULL,
	
	[MaterialStartDate] [datetime] NULL,
	[MaterialEndDate] [datetime] NULL,
	[MaterialReqQty] [int] NULL,
	[CustomerItemID] [nvarchar](50) NULL,
	[VendorItemID] [nvarchar](50) NULL,
	[PlanningHorizonDate] [datetime] NULL,
	[PointConsumption] [nvarchar](50) NULL,
	[CUMAchievedQty] [int] NULL

	
	);

GO


CREATE TABLE [dbo].[tblEDI_4095_PACKAGE](
	[NO] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[PkgKey] [nvarchar](100) NOT NULL,
	[HdrKey] [nvarchar](100) NULL,	
	[LineKey] [nvarchar](100) NULL,
	[DtlKey] [nvarchar](100) NULL,	
	[VersionNumber] [nvarchar](50) NULL,
	[CustomerPackagingCode] [nvarchar](50) NULL,
	[VendorPackagingCode] [nvarchar](50) NULL,
	[QtyPerContainer] [int] NULL
	

	);

GO


/* Update SQL from 10/23/2023*/
ALTER TABLE tblTradingPartner ADD blnUseSCP BIT NULL DEFAULT(0)
GO

ALTER TABLE tblTradingPartner ADD ERPNo_FK INT NULL 
GO



 CREATE TABLE [dbo].[tblEDI_846_HEADER](
	[NO] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[HdrKey] [nvarchar](100) NOT NULL,
	[ISASenderID] [nvarchar](50) NULL,
	[SubmitDateTime] [datetime] NULL,
	[ISAControlNum] [nvarchar](50) NULL,
	[GSSenderID] [nvarchar](50) NULL,
	[GSControlNum] [nvarchar](50) NULL,
	[TransSetID] [nvarchar](50) NULL,
	[TransSetControlNum] [nvarchar](50) NULL,
	[TransSetPurpose] [nvarchar](5) NULL,
	[ReportTypeCode] [nvarchar](5) NULL,
	[ReferenceNumber] [nvarchar](50) NULL,
	[GeneratedDateTime] [datetime] NULL,
	[ActionCode] [nvarchar](5) NULL,
	[DateAdded] [datetime] DEFAULT GETDATE() NOT NULL,
	[CreateDate] [datetime] NULL,
	[blnRepFlag] [bit] DEFAULT (1) NULL,
	[GSReceiverID] [nvarchar](50) NULL,
	[blnEmailFlag] [bit] DEFAULT (0) NULL,
	[blnEmailErrorFlag] [bit] DEFAULT (0) NULL

	);

GO

CREATE TABLE [dbo].[tblEDI_846_REF](
	[NO] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[HdrKey] [nvarchar](100) NULL,
	[LineKey] [nvarchar](100) NULL,
	[RefKey] [nvarchar](100) NOT NULL,
	[RefQual] [nvarchar](10) NULL,
	[RefNum] [nvarchar](100) NULL,
	[Description] [nvarchar](200) NULL
);
GO


CREATE TABLE [dbo].[tblEDI_846_N1](
	[NO] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[HdrKey] [nvarchar](100) NULL,
	[LineKey] [nvarchar](100) NULL,
	[N1Key] [nvarchar](100) NOT NULL,
	[EntityIDCode] [nvarchar](50) NULL,
	[CodeQual] [nvarchar](50) NULL,
	[Name] [nvarchar](100) NULL,
	[Code] [nvarchar](50) NULL,
	[Address1] [nvarchar](100) NULL,
	[Address2] [nvarchar](100) NULL,
	[City] [nvarchar](50) NULL,
	[State] [nvarchar](50) NULL,
	[Zip] [nvarchar](50) NULL,
	[Country] [nvarchar](50) NULL,
	[ContactCode] [nvarchar](50) NULL,
	[ContactName] [nvarchar](100) NULL
	);

GO

CREATE TABLE [dbo].[tblEDI_846_LINE](
	[NO] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[HdrKey] [nvarchar](100) NULL,
	[LineKey] [nvarchar](100) NOT NULL,
	[AssignedID] [nvarchar](50) NULL,
	[ProdID1Qual] [nvarchar](50) NULL,
	[ProdID1] [nvarchar](50) NULL,
	[ProdID2Qual] [nvarchar](50) NULL,
	[ProdID2] [nvarchar](50) NULL,
	[ProdID3Qual] [nvarchar](50) NULL,
	[ProdID3] [nvarchar](50) NULL,
	[ProdID4Qual] [nvarchar](50) NULL,
	[ProdID4] [nvarchar](50) NULL,
	[ProdID5Qual] [nvarchar](50) NULL,
	[ProdID5] [nvarchar](50) NULL
	);
GO


CREATE TABLE [dbo].[tblEDI_846_DTM](
	[NO] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[HdrKey] [nvarchar](50) NULL,
	[LineKey] [nvarchar](100) NULL,
	[DtmKey] [nvarchar](50) NOT NULL,
	[DtmQual] [nvarchar](5) NULL,
	[Date] [datetime] NULL,
	[TimeCode] [nvarchar](5) NULL
	);

GO


CREATE TABLE [dbo].[tblEDI_846_DETAIL](
	[NO] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[HdrKey] [nvarchar](100) NULL,
	[LineKey] [nvarchar](100) NULL,
	[DtlKey] [nvarchar](100) NOT NULL,
	[UOM] [nvarchar](5) NULL,
	[UnitPrice] [float] NULL,
	[UnitPriceCode] [nvarchar](5) NULL,
	[QtyQual] [nvarchar](5) NULL,
	[Qty] [float] NULL

  );
  
  GO	


CREATE TABLE [tblERPList] (
  [ERPNo] INTEGER PRIMARY KEY NOT NULL,
  [ERPName] NVARCHAR(100) NOT NULL
);
GO

