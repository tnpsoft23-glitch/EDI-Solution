USE [BHEDI]
GO
/****** Object:  UserDefinedFunction [dbo].[f_GetASNNumberFromRawData]    Script Date: 11/29/2025 5:58:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--- EDI reports ---
CREATE FUNCTION [dbo].[f_GetASNNumberFromRawData]
(
       @rawData Text
) 
RETURNS NVARCHAR(9)
 
AS
BEGIN
 
 
	DECLARE @strASNRaw NVARCHAR(20),@ASNNum NVARCHAR(9);
	
	-- 997 find ASN Num from AK1
	--- 824 find ASN Num from OTI 
	IF  CHARINDEX('BSN',@rawData) > 0 
		SELECT @strASNRaw = SUBSTRING(SUBSTRING(@rawData,CHARINDEX('BSN',@rawData),20),8,9)
	
	ELSE
		SELECT @strASNRaw = SUBSTRING(SUBSTRING(@rawData,CHARINDEX('OTI',@rawData),20),11,9)

		
	DECLARE @i INT,@len INT;
	SET @i = 1;
	SET @len = LEN(@strASNRaw);
	SET @ASNNum = '';

	WHILE @i <= @len
	BEGIN
		--IF SUBSTRING(@strASNRaw,@i,1) LIKE '%[0-9]%'
		IF SUBSTRING(@strASNRaw,@i,1) NOT LIKE '%[^a-zA-Z0-9]%'
			SET @ASNNum = @ASNNum + SUBSTRING(@strASNRaw,@i,1);
		ELSE
			BREAK;	

		SET @i = @i + 1;
	END

	RETURN dbo.fnGetPaddedString(9, 'L', '0',@ASNNum)
 
END

GO
/****** Object:  UserDefinedFunction [dbo].[fnGetPaddedString]    Script Date: 11/29/2025 5:58:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[fnGetPaddedString]
(
 -- Add the parameters for the function here
 @intLength int, --The length for the output string
 @strPaddingSide varchar(1), --L for Left Padding and R for Right Padding
 @strPadWith varchar(1), --Character to pad with
 @strToPad varchar(250)
)
RETURNS varchar(1000)
AS
BEGIN
 -- Declare the return variable here
 DECLARE @Result varchar(1000)
 
 if @strPaddingSide = 'L'
  Select @Result = REPLICATE(@strPadWith, @intLength -  
                   LEN(ISNULL(@strToPad,''))) + ISNULL(@strToPad, '')
 else
  Select @Result = ISNULL(@strToPad, '') + REPLICATE(@strPadWith, 
                   @intLength -  LEN(ISNULL(@strToPad,'')))
 RETURN @Result
END

GO
/****** Object:  Table [dbo].[tblEDI_142_AMT]    Script Date: 11/29/2025 5:58:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEDI_142_AMT](
	[NO] [int] IDENTITY(1,1) NOT NULL,
	[HdrKey] [nvarchar](100) NULL,
	[LineKey] [nvarchar](100) NULL,
	[AmtKey] [nvarchar](100) NOT NULL,
	[AmountQualifier] [nvarchar](50) NULL,
	[Amount] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[NO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEDI_142_DETAIL]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEDI_142_DETAIL](
	[NO] [int] IDENTITY(1,1) NOT NULL,
	[HdrKey] [nvarchar](100) NULL,
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
	[UnitMeasureCode] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[NO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEDI_142_DTM]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEDI_142_DTM](
	[NO] [int] IDENTITY(1,1) NOT NULL,
	[HdrKey] [nvarchar](100) NULL,
	[LineKey] [nvarchar](100) NULL,
	[DtlKey] [nvarchar](100) NULL,
	[DtmKey] [nvarchar](100) NOT NULL,
	[Qualifier] [nvarchar](50) NULL,
	[dtmDate] [datetime] NULL,
	[Century] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[NO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEDI_142_HEADER]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEDI_142_HEADER](
	[NO] [int] IDENTITY(1,1) NOT NULL,
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
	[DateAdded] [datetime] NOT NULL,
	[SubmitDateTime] [datetime] NULL,
	[blnRepFlag] [bit] NULL,
	[GSReceiverID] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[NO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEDI_142_IT1]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEDI_142_IT1](
	[NO] [int] IDENTITY(1,1) NOT NULL,
	[HdrKey] [nvarchar](100) NULL,
	[LineKey] [nvarchar](100) NULL,
	[It1Key] [nvarchar](100) NOT NULL,
	[AssignedID] [nvarchar](50) NULL,
	[LaborHours] [float] NULL,
	[UnitMeasurementCode] [nvarchar](50) NULL,
	[LaborCost] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[NO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEDI_142_LINE]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEDI_142_LINE](
	[NO] [int] IDENTITY(1,1) NOT NULL,
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
	[MajorModelDesc] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[NO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEDI_142_MSG]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEDI_142_MSG](
	[NO] [int] IDENTITY(1,1) NOT NULL,
	[HdrKey] [nvarchar](100) NULL,
	[LineKey] [nvarchar](100) NULL,
	[PrrKey] [nvarchar](100) NULL,
	[MsgKey] [nvarchar](100) NOT NULL,
	[Message] [nvarchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[NO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEDI_142_N1]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEDI_142_N1](
	[NO] [int] IDENTITY(1,1) NOT NULL,
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
	[SCACCode] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[NO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEDI_142_PRR]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEDI_142_PRR](
	[NO] [int] IDENTITY(1,1) NOT NULL,
	[HdrKey] [nvarchar](100) NULL,
	[LineKey] [nvarchar](100) NULL,
	[PrrKey] [nvarchar](100) NOT NULL,
	[AssignedID] [nvarchar](50) NULL,
	[ComplaintCode] [nvarchar](50) NULL,
	[Description] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[NO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEDI_142_REP]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEDI_142_REP](
	[NO] [int] IDENTITY(1,1) NOT NULL,
	[HdrKey] [nvarchar](100) NULL,
	[LineKey] [nvarchar](100) NULL,
	[RepKey] [nvarchar](100) NOT NULL,
	[AssignedID] [nvarchar](50) NULL,
	[IDQualifier] [nvarchar](50) NULL,
	[ID] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[NO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEDI_142_SSS]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEDI_142_SSS](
	[NO] [int] IDENTITY(1,1) NOT NULL,
	[HdrKey] [nvarchar](100) NULL,
	[LineKey] [nvarchar](100) NULL,
	[DtlKey] [nvarchar](100) NULL,
	[SssKey] [nvarchar](100) NOT NULL,
	[Indicator] [nvarchar](50) NULL,
	[AgencyQualifierCode] [nvarchar](50) NULL,
	[SpecialServicesCode] [nvarchar](50) NULL,
	[Rate] [float] NULL,
	[TotalAmount] [float] NULL,
	[SupplierAmount] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[NO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEDI_4095_DETAIL]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEDI_4095_DETAIL](
	[NO] [int] IDENTITY(1,1) NOT NULL,
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
	[CallOfQty] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[NO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEDI_4095_DTM]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEDI_4095_DTM](
	[NO] [int] IDENTITY(1,1) NOT NULL,
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
	[CUMAchievedQty] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[NO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEDI_4095_HEADER]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEDI_4095_HEADER](
	[NO] [int] IDENTITY(1,1) NOT NULL,
	[HdrKey] [nvarchar](100) NOT NULL,
	[VersionNumber] [nvarchar](50) NULL,
	[SenderID] [nvarchar](50) NULL,
	[ReceiverID] [nvarchar](50) NULL,
	[TransmissionNumberOld] [nvarchar](50) NULL,
	[TransmissionNumberNew] [nvarchar](50) NULL,
	[TransmissionDate] [datetime] NULL,
	[CUMStartDate] [datetime] NULL,
	[DateAdded] [datetime] NOT NULL,
	[blnRepFlag] [bit] NULL,
	[blnEmailFlag] [bit] NULL,
	[blnEmailErrorFlag] [bit] NULL,
	[blnImport] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[NO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEDI_4095_LINE]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEDI_4095_LINE](
	[NO] [int] IDENTITY(1,1) NOT NULL,
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
	[StockLocation] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[NO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEDI_4095_PACKAGE]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEDI_4095_PACKAGE](
	[NO] [int] IDENTITY(1,1) NOT NULL,
	[PkgKey] [nvarchar](100) NOT NULL,
	[HdrKey] [nvarchar](100) NULL,
	[LineKey] [nvarchar](100) NULL,
	[DtlKey] [nvarchar](100) NULL,
	[VersionNumber] [nvarchar](50) NULL,
	[CustomerPackagingCode] [nvarchar](50) NULL,
	[VendorPackagingCode] [nvarchar](50) NULL,
	[QtyPerContainer] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[NO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEDI_810_HEADER]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEDI_810_HEADER](
	[NO] [int] IDENTITY(1,1) NOT NULL,
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
	[DateAdded] [datetime] NOT NULL,
	[SubmitDateTime] [datetime] NULL,
	[Amount] [float] NULL,
	[TaxTypeCode] [nvarchar](50) NULL,
	[TaxAmount] [float] NULL,
	[TaxPercent] [float] NULL,
	[TaxIDNum] [nvarchar](50) NULL,
	[blnRepFlag] [bit] NULL,
	[GSReceiverID] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[NO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEDI_810_LINE]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEDI_810_LINE](
	[NO] [int] IDENTITY(1,1) NOT NULL,
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
	[Date] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[NO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEDI_810_N1]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEDI_810_N1](
	[NO] [int] IDENTITY(1,1) NOT NULL,
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
PRIMARY KEY CLUSTERED 
(
	[NO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEDI_812_HEADER]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEDI_812_HEADER](
	[NO] [int] IDENTITY(1,1) NOT NULL,
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
	[DateAdded] [datetime] NOT NULL,
	[CreateDate] [datetime] NULL,
	[blnRepFlag] [bit] NULL,
	[GSReceiverID] [nvarchar](50) NULL,
	[blnEmailFlag] [bit] NULL,
	[blnEmailErrorFlag] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[NO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEDI_812_LINE]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEDI_812_LINE](
	[NO] [int] IDENTITY(1,1) NOT NULL,
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
	[ChargeDescription] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[NO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEDI_812_N1]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEDI_812_N1](
	[NO] [int] IDENTITY(1,1) NOT NULL,
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
	[CommNum] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[NO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEDI_812_REF]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEDI_812_REF](
	[NO] [int] IDENTITY(1,1) NOT NULL,
	[HdrKey] [nvarchar](100) NULL,
	[LineKey] [nvarchar](100) NULL,
	[RefKey] [nvarchar](100) NOT NULL,
	[RefQual] [nvarchar](10) NULL,
	[RefNum] [nvarchar](100) NULL,
	[Description] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[NO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEDI_820_ADX]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEDI_820_ADX](
	[NO] [int] IDENTITY(1,1) NOT NULL,
	[AdxKey] [nvarchar](100) NOT NULL,
	[LineKey] [nvarchar](100) NULL,
	[HdrKey] [nvarchar](100) NULL,
	[AdjMonetaryAmount] [float] NULL,
	[AdjReasonCode] [nvarchar](50) NULL,
	[AdjIDQual] [nvarchar](50) NULL,
	[AdjReferenceID] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[NO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEDI_820_DTM]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEDI_820_DTM](
	[NO] [int] IDENTITY(1,1) NOT NULL,
	[DtmKey] [nvarchar](100) NOT NULL,
	[HdrKey] [nvarchar](100) NULL,
	[LineKey] [nvarchar](100) NULL,
	[AdxKey] [nvarchar](100) NULL,
	[IT1Key] [nvarchar](100) NULL,
	[RefKey] [nvarchar](100) NULL,
	[RMRKey] [nvarchar](100) NULL,
	[N1Key] [nvarchar](100) NULL,
	[DtmQual] [nvarchar](50) NULL,
	[Date] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[NO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEDI_820_HEADER]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEDI_820_HEADER](
	[NO] [int] IDENTITY(1,1) NOT NULL,
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
	[DateAdded] [datetime] NOT NULL,
	[SubmitDateTime] [datetime] NULL,
	[blnRepFlag] [bit] NULL,
	[GSReceiverID] [nvarchar](50) NULL,
	[blnImportSimply] [bit] NULL,
	[blnEmailFlag] [bit] NULL,
	[blnEmailErrorFlag] [bit] NULL,
	[blnImport] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[NO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEDI_820_IT1]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEDI_820_IT1](
	[NO] [int] IDENTITY(1,1) NOT NULL,
	[IT1Key] [nvarchar](100) NOT NULL,
	[HdrKey] [nvarchar](100) NULL,
	[LineKey] [nvarchar](100) NULL,
	[AdxKey] [nvarchar](100) NULL,
	[RMRKey] [nvarchar](100) NULL,
	[AssignedID] [nvarchar](50) NULL,
	[QtyInvoiced] [float] NULL,
	[UOM] [nvarchar](50) NULL,
	[UnitPrice] [float] NULL,
	[UnitPriceCode] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[NO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEDI_820_LINE]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEDI_820_LINE](
	[NO] [int] IDENTITY(1,1) NOT NULL,
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
	[LoopTrailerIDCode] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[NO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEDI_820_N1]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEDI_820_N1](
	[NO] [int] IDENTITY(1,1) NOT NULL,
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
	[PlantID] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[NO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEDI_820_REF]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEDI_820_REF](
	[NO] [int] IDENTITY(1,1) NOT NULL,
	[RefKey] [nvarchar](100) NOT NULL,
	[HdrKey] [nvarchar](100) NULL,
	[LineKey] [nvarchar](100) NULL,
	[AdxKey] [nvarchar](100) NULL,
	[IT1Key] [nvarchar](100) NULL,
	[RMRKey] [nvarchar](100) NULL,
	[N1Key] [nvarchar](100) NULL,
	[RefQual] [nvarchar](50) NULL,
	[RefNum] [nvarchar](100) NULL,
	[Description] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[NO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEDI_820_RMR]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEDI_820_RMR](
	[NO] [int] IDENTITY(1,1) NOT NULL,
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
	[Description] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[NO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEDI_820_SAC]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEDI_820_SAC](
	[NO] [int] IDENTITY(1,1) NOT NULL,
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
	[ChargeNum] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[NO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEDI_820_SLN]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEDI_820_SLN](
	[NO] [int] IDENTITY(1,1) NOT NULL,
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
	[UOM] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[NO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEDI_820_TAX]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEDI_820_TAX](
	[NO] [int] IDENTITY(1,1) NOT NULL,
	[TaxKey] [nvarchar](100) NOT NULL,
	[LineKey] [nvarchar](100) NULL,
	[HdrKey] [nvarchar](100) NULL,
	[TaxIDNum] [nvarchar](50) NULL,
	[TaxPaymentTypeCode] [nvarchar](50) NULL,
	[TaxDate] [datetime] NULL,
	[TaxInfoID] [nvarchar](50) NULL,
	[TaxAmount] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[NO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEDI_824_DETAIL]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEDI_824_DETAIL](
	[NO] [int] IDENTITY(1,1) NOT NULL,
	[DtlKey] [nvarchar](100) NOT NULL,
	[HdrKey] [nvarchar](100) NULL,
	[LineKey] [nvarchar](100) NULL,
	[ApplErrConditionCode] [nvarchar](50) NULL,
	[ErrorDescrp] [nvarchar](300) NULL,
	[ErrorData] [nvarchar](300) NULL,
PRIMARY KEY CLUSTERED 
(
	[NO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEDI_824_DTM]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEDI_824_DTM](
	[NO] [int] IDENTITY(1,1) NOT NULL,
	[DtmKey] [nvarchar](100) NOT NULL,
	[HdrKey] [nvarchar](100) NULL,
	[LineKey] [nvarchar](100) NULL,
	[DtmQual] [nvarchar](50) NULL,
	[Date] [datetime] NULL,
	[TimeCode] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[NO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEDI_824_HEADER]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEDI_824_HEADER](
	[NO] [int] IDENTITY(1,1) NOT NULL,
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
	[DateAdded] [datetime] NOT NULL,
	[SubmitDateTime] [datetime] NULL,
	[blnRepFlag] [bit] NULL,
	[GSReceiverID] [nvarchar](50) NULL,
	[blnEmailFlag] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[NO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEDI_824_LINE]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEDI_824_LINE](
	[NO] [int] IDENTITY(1,1) NOT NULL,
	[LineKey] [nvarchar](100) NOT NULL,
	[HdrKey] [nvarchar](100) NULL,
	[AppAcknowledgmentCode] [nvarchar](50) NULL,
	[OrgDocumentNumQual] [nvarchar](50) NULL,
	[OrgDocumentNum] [nvarchar](50) NULL,
	[OrgCreateDateTime] [datetime] NULL,
	[TranSetIDCode] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[NO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEDI_824_N1]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEDI_824_N1](
	[NO] [int] IDENTITY(1,1) NOT NULL,
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
PRIMARY KEY CLUSTERED 
(
	[NO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEDI_824_NTE]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEDI_824_NTE](
	[NO] [int] IDENTITY(1,1) NOT NULL,
	[NteKey] [nvarchar](100) NOT NULL,
	[HdrKey] [nvarchar](100) NULL,
	[LineKey] [nvarchar](100) NULL,
	[DtlKey] [nvarchar](100) NULL,
	[NoteRefCode] [nvarchar](50) NULL,
	[Description] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[NO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEDI_824_QTY]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEDI_824_QTY](
	[NO] [int] IDENTITY(1,1) NOT NULL,
	[QtyKey] [nvarchar](100) NOT NULL,
	[HdrKey] [nvarchar](100) NULL,
	[LineKey] [nvarchar](100) NULL,
	[QtyQual] [nvarchar](50) NULL,
	[Quantity] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[NO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEDI_824_REF]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEDI_824_REF](
	[NO] [int] IDENTITY(1,1) NOT NULL,
	[HdrKey] [nvarchar](100) NULL,
	[LineKey] [nvarchar](100) NULL,
	[RefKey] [nvarchar](100) NOT NULL,
	[RefQual] [nvarchar](50) NULL,
	[RefNum] [nvarchar](100) NULL,
	[Description] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[NO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEDI_830_ATH]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEDI_830_ATH](
	[NO] [int] IDENTITY(1,1) NOT NULL,
	[HdrKey] [nvarchar](100) NULL,
	[LineKey] [nvarchar](100) NULL,
	[AthKey] [nvarchar](100) NOT NULL,
	[ResourceAuthCode] [nvarchar](50) NULL,
	[ResourceAuth_ThruDate] [datetime] NULL,
	[CumAthQty] [float] NULL,
	[CumStartDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[NO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEDI_830_DETAIL]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEDI_830_DETAIL](
	[NO] [int] IDENTITY(1,1) NOT NULL,
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
	[ReleaseNumber] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[NO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEDI_830_DTM]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEDI_830_DTM](
	[NO] [int] IDENTITY(1,1) NOT NULL,
	[HdrKey] [nvarchar](100) NULL,
	[LineKey] [nvarchar](100) NULL,
	[DtlKey] [nvarchar](100) NULL,
	[DtmKey] [nvarchar](100) NOT NULL,
	[Qualifier] [nvarchar](50) NULL,
	[dtmDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[NO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEDI_830_HEADER]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEDI_830_HEADER](
	[NO] [int] IDENTITY(1,1) NOT NULL,
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
	[ReleaseNumber] [nvarchar](50) NULL,
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
	[DateAdded] [datetime] NOT NULL,
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
	[blnRepFlag] [bit] NULL,
	[GSReceiverID] [nvarchar](50) NULL,
	[blnEmailFlag] [bit] NULL,
	[blnExportExcel] [bit] NULL,
	[blnEmailErrorFlag] [bit] NULL,
	[blnImport] [bit] NULL,
 CONSTRAINT [PK__tblEDI_830_HEADE__03F0984C] PRIMARY KEY CLUSTERED 
(
	[NO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEDI_830_LINE]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEDI_830_LINE](
	[NO] [int] IDENTITY(1,1) NOT NULL,
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
	[CTT02] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[NO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEDI_830_N1]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEDI_830_N1](
	[NO] [int] IDENTITY(1,1) NOT NULL,
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
	[CommNum] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[NO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEDI_830_REF]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEDI_830_REF](
	[NO] [int] IDENTITY(1,1) NOT NULL,
	[HdrKey] [nvarchar](100) NULL,
	[LineKey] [nvarchar](100) NULL,
	[DtlKey] [nvarchar](100) NULL,
	[N1Key] [nvarchar](100) NULL,
	[ShpKey] [nvarchar](100) NULL,
	[RefKey] [nvarchar](100) NOT NULL,
	[RefQual] [nvarchar](10) NULL,
	[RefNum] [nvarchar](100) NULL,
	[Description] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[NO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEDI_830_SHP]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEDI_830_SHP](
	[NO] [int] IDENTITY(1,1) NOT NULL,
	[HdrKey] [nvarchar](100) NULL,
	[LineKey] [nvarchar](100) NULL,
	[ShpKey] [nvarchar](100) NOT NULL,
	[QtyQual] [nvarchar](50) NULL,
	[ShipQty] [float] NULL,
	[DateQual] [nvarchar](50) NULL,
	[BegInventoryDate] [datetime] NULL,
	[LastShipDate] [datetime] NULL,
	[ShipDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[NO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEDI_830_SLN]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEDI_830_SLN](
	[NO] [int] IDENTITY(1,1) NOT NULL,
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
	[ProdServiceID2] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[NO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEDI_832_DETAIL]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEDI_832_DETAIL](
	[NO] [int] IDENTITY(1,1) NOT NULL,
	[DtlKey] [nvarchar](100) NOT NULL,
	[LineKey] [nvarchar](100) NULL,
	[HdrKey] [nvarchar](100) NULL,
	[PriceIDCode] [nvarchar](50) NULL,
	[UnitPrice] [float] NULL,
	[PricingQty] [float] NULL,
	[UOM] [nvarchar](50) NULL,
	[EntityIDCode] [nvarchar](50) NULL,
	[CurrencyCode] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[NO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEDI_832_DTM]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEDI_832_DTM](
	[NO] [int] IDENTITY(1,1) NOT NULL,
	[DtmKey] [nvarchar](100) NOT NULL,
	[HdrKey] [nvarchar](100) NULL,
	[LineKey] [nvarchar](100) NULL,
	[DtlKey] [nvarchar](100) NULL,
	[DtmQual] [nvarchar](50) NULL,
	[Date] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[NO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEDI_832_HEADER]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEDI_832_HEADER](
	[NO] [int] IDENTITY(1,1) NOT NULL,
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
	[DateAdded] [datetime] NOT NULL,
	[SubmitDateTime] [datetime] NULL,
	[blnRepFlag] [bit] NULL,
	[GSReceiverID] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[NO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEDI_832_LINE]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEDI_832_LINE](
	[NO] [int] IDENTITY(1,1) NOT NULL,
	[LineKey] [nvarchar](100) NOT NULL,
	[HdrKey] [nvarchar](100) NULL,
	[ProdIDQual] [nvarchar](50) NULL,
	[BuyersPartID] [nvarchar](50) NULL,
	[DCPartLevelQual] [nvarchar](50) NULL,
	[DCPartLevel] [nvarchar](50) NULL,
	[PartDscrptQual] [nvarchar](50) NULL,
	[PartDescription] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[NO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEDI_832_N1]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEDI_832_N1](
	[NO] [int] IDENTITY(1,1) NOT NULL,
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
	[PlantID] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[NO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEDI_832_REF]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEDI_832_REF](
	[NO] [int] IDENTITY(1,1) NOT NULL,
	[RefKey] [nvarchar](100) NOT NULL,
	[DtlKey] [nvarchar](100) NULL,
	[LineKey] [nvarchar](100) NULL,
	[HdrKey] [nvarchar](100) NULL,
	[PriceQual] [nvarchar](50) NULL,
	[PriceReference] [nvarchar](50) NULL,
	[PriceRefDescrp] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[NO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEDI_846_DETAIL]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEDI_846_DETAIL](
	[NO] [int] IDENTITY(1,1) NOT NULL,
	[HdrKey] [nvarchar](100) NULL,
	[LineKey] [nvarchar](100) NULL,
	[DtlKey] [nvarchar](100) NOT NULL,
	[UOM] [nvarchar](5) NULL,
	[UnitPrice] [float] NULL,
	[UnitPriceCode] [nvarchar](5) NULL,
	[QtyQual] [nvarchar](5) NULL,
	[Qty] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[NO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEDI_846_DTM]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEDI_846_DTM](
	[NO] [int] IDENTITY(1,1) NOT NULL,
	[HdrKey] [nvarchar](50) NULL,
	[LineKey] [nvarchar](100) NULL,
	[DtmKey] [nvarchar](50) NOT NULL,
	[DtmQual] [nvarchar](5) NULL,
	[Date] [datetime] NULL,
	[TimeCode] [nvarchar](5) NULL,
PRIMARY KEY CLUSTERED 
(
	[NO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEDI_846_HEADER]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEDI_846_HEADER](
	[NO] [int] IDENTITY(1,1) NOT NULL,
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
	[DateAdded] [datetime] NOT NULL,
	[CreateDate] [datetime] NULL,
	[blnRepFlag] [bit] NULL,
	[GSReceiverID] [nvarchar](50) NULL,
	[blnEmailFlag] [bit] NULL,
	[blnEmailErrorFlag] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[NO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEDI_846_LINE]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEDI_846_LINE](
	[NO] [int] IDENTITY(1,1) NOT NULL,
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
	[ProdID5] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[NO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEDI_846_N1]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEDI_846_N1](
	[NO] [int] IDENTITY(1,1) NOT NULL,
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
PRIMARY KEY CLUSTERED 
(
	[NO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEDI_846_REF]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEDI_846_REF](
	[NO] [int] IDENTITY(1,1) NOT NULL,
	[HdrKey] [nvarchar](100) NULL,
	[LineKey] [nvarchar](100) NULL,
	[RefKey] [nvarchar](100) NOT NULL,
	[RefQual] [nvarchar](10) NULL,
	[RefNum] [nvarchar](100) NULL,
	[Description] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[NO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEDI_850_CTP]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEDI_850_CTP](
	[NO] [int] IDENTITY(1,1) NOT NULL,
	[HdrKey] [nvarchar](50) NULL,
	[LineKey] [nvarchar](50) NULL,
	[CtpKey] [nvarchar](50) NOT NULL,
	[PriceIDCode] [nvarchar](50) NULL,
	[UnitPrice] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[NO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEDI_850_DTM]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEDI_850_DTM](
	[NO] [int] IDENTITY(1,1) NOT NULL,
	[HdrKey] [nvarchar](50) NULL,
	[LineKey] [nvarchar](50) NULL,
	[DtmKey] [nvarchar](50) NOT NULL,
	[DtmQual] [nvarchar](50) NULL,
	[Date] [datetime] NULL,
	[DtlKey] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[NO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEDI_850_HEADER]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEDI_850_HEADER](
	[NO] [int] IDENTITY(1,1) NOT NULL,
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
	[DateAdded] [datetime] NOT NULL,
	[GeneratedDateTime] [datetime] NULL,
	[AdminFuncCode_hdr] [nvarchar](50) NULL,
	[AdminContact_hdr] [nvarchar](100) NULL,
	[AdminCommNumQual_hdr] [nvarchar](50) NULL,
	[AdminPhone_hdr] [nvarchar](50) NULL,
	[CTPClass] [nvarchar](50) NULL,
	[STPPriceQual] [nvarchar](50) NULL,
	[TextMessageCode] [nvarchar](10) NULL,
	[Check864] [nvarchar](50) NULL,
	[blnRepFlag] [bit] NULL,
	[FOBTransTermsQual] [nvarchar](50) NULL,
	[FOBTransTermsCode] [nvarchar](50) NULL,
	[GSReceiverID] [nvarchar](50) NULL,
	[blnEmailFlag] [bit] NULL,
	[blnEmailErrorFlag] [bit] NULL,
	[blnImport] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[NO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEDI_850_ITA]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEDI_850_ITA](
	[NO] [int] IDENTITY(1,1) NOT NULL,
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
	[SpecialChargeCode] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[NO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEDI_850_ITD]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEDI_850_ITD](
	[NO] [int] IDENTITY(1,1) NOT NULL,
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
	[DayOfMonth] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[NO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEDI_850_LINE]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEDI_850_LINE](
	[NO] [int] IDENTITY(1,1) NOT NULL,
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
	[EngChangeLevel] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[NO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEDI_850_N1]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEDI_850_N1](
	[NO] [int] IDENTITY(1,1) NOT NULL,
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
	[SCACCode] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[NO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEDI_850_N9]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEDI_850_N9](
	[NO] [int] IDENTITY(1,1) NOT NULL,
	[HdrKey] [nvarchar](100) NULL,
	[LineKey] [nvarchar](100) NULL,
	[N9Key] [nvarchar](100) NOT NULL,
	[RefQual] [nvarchar](50) NULL,
	[RefNum] [nvarchar](100) NULL,
	[Description] [nvarchar](200) NULL,
	[Msg] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[NO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEDI_850_NTE]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEDI_850_NTE](
	[NO] [int] IDENTITY(1,1) NOT NULL,
	[NteKey] [nvarchar](100) NOT NULL,
	[HdrKey] [nvarchar](100) NULL,
	[LineKey] [nvarchar](100) NULL,
	[DtlKey] [nvarchar](100) NULL,
	[NoteRefCode] [nvarchar](50) NULL,
	[Description] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[NO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEDI_850_PID]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEDI_850_PID](
	[NO] [int] IDENTITY(1,1) NOT NULL,
	[HdrKey] [nvarchar](50) NULL,
	[LineKey] [nvarchar](50) NULL,
	[PidKey] [nvarchar](50) NOT NULL,
	[ItemDescType] [nvarchar](10) NULL,
	[ProductCharCode] [nvarchar](10) NULL,
	[ItemDescQual] [nvarchar](10) NULL,
	[ProductDescCode] [nvarchar](10) NULL,
	[Description] [nvarchar](200) NULL,
	[SLPCode] [nvarchar](10) NULL,
	[SlnKey] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[NO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEDI_850_PO3]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEDI_850_PO3](
	[NO] [int] IDENTITY(1,1) NOT NULL,
	[HdrKey] [nvarchar](50) NULL,
	[LineKey] [nvarchar](50) NULL,
	[PO3Key] [nvarchar](50) NOT NULL,
	[ChangeReasonCode] [nvarchar](10) NULL,
	[PriceQual] [nvarchar](10) NULL,
	[UnitPrice] [float] NULL,
	[BasisOfUnitPriceCode] [nvarchar](10) NULL,
	[Quantity] [int] NULL,
	[UnitBasisMsrCode] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[NO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEDI_850_REF]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEDI_850_REF](
	[NO] [int] IDENTITY(1,1) NOT NULL,
	[HdrKey] [nvarchar](100) NULL,
	[LineKey] [nvarchar](100) NULL,
	[RefKey] [nvarchar](100) NOT NULL,
	[RefQual] [nvarchar](10) NULL,
	[RefNum] [nvarchar](100) NULL,
	[Description] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[NO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEDI_850_SAC]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEDI_850_SAC](
	[NO] [int] IDENTITY(1,1) NOT NULL,
	[HdrKey] [nvarchar](100) NULL,
	[LineKey] [nvarchar](100) NULL,
	[SacKey] [nvarchar](100) NOT NULL,
	[AllowanceChargeIndicator] [nvarchar](50) NULL,
	[SACCode] [nvarchar](50) NULL,
	[AgencyQual] [nvarchar](50) NULL,
	[AgencyCode] [nvarchar](50) NULL,
	[Amount] [float] NULL,
	[MethodHandlingCode] [nvarchar](50) NULL,
	[Description] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[NO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEDI_850_SCH]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEDI_850_SCH](
	[NO] [int] IDENTITY(1,1) NOT NULL,
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
	[N1Key] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[NO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEDI_850_SHH]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEDI_850_SHH](
	[NO] [int] IDENTITY(1,1) NOT NULL,
	[HdrKey] [nvarchar](50) NULL,
	[LineKey] [nvarchar](50) NULL,
	[ShhKey] [nvarchar](50) NOT NULL,
	[SchedulingCode] [nvarchar](10) NULL,
	[DtmQual] [nvarchar](50) NULL,
	[Date] [datetime] NULL,
	[Description] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[NO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEDI_850_SLN]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEDI_850_SLN](
	[NO] [int] IDENTITY(1,1) NOT NULL,
	[HdrKey] [nvarchar](100) NULL,
	[LineKey] [nvarchar](100) NULL,
	[SlnKey] [nvarchar](100) NOT NULL,
	[AssignedID] [nvarchar](50) NULL,
	[RelationshipCode] [nvarchar](50) NULL,
	[ProductIDQual] [nvarchar](50) NULL,
	[ProductID] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[NO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEDI_856_DTM]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEDI_856_DTM](
	[NO] [int] IDENTITY(1,1) NOT NULL,
	[DtmKey] [nvarchar](100) NOT NULL,
	[HdrKey] [nvarchar](100) NULL,
	[LineKey] [nvarchar](100) NULL,
	[DtmQual] [nvarchar](50) NULL,
	[Date] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[NO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEDI_856_HEADER]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEDI_856_HEADER](
	[NO] [int] IDENTITY(1,1) NOT NULL,
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
	[DateAdded] [datetime] NOT NULL,
	[SubmitDateTime] [datetime] NULL,
	[DateQual] [nvarchar](50) NULL,
	[ShipDate] [datetime] NULL,
	[HashTotal] [int] NULL,
	[blnRepFlag] [bit] NULL,
	[GSReceiverID] [nvarchar](50) NULL,
	[blnEmailFlag] [bit] NULL,
	[blnEmailErrorFlag] [bit] NULL,
	[blnImport] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[NO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEDI_856_HL2]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEDI_856_HL2](
	[NO] [int] IDENTITY(1,1) NOT NULL,
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
	[MasterMixSN] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[NO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEDI_856_HL2_HL3]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEDI_856_HL2_HL3](
	[NO] [int] IDENTITY(1,1) NOT NULL,
	[HdrKey] [nvarchar](100) NULL,
	[LineKey] [nvarchar](100) NULL,
	[HL2HL3Key] [nvarchar](100) NOT NULL,
	[HLIDNo] [nvarchar](50) NULL,
	[HLParentIDNo] [nvarchar](50) NULL,
	[HLCode] [nvarchar](50) NULL,
	[PkgIDQual] [nvarchar](50) NULL,
	[PkgType] [nvarchar](50) NULL,
	[ReturnSNIDQual] [nvarchar](50) NULL,
	[ReturnSN] [nvarchar](50) NULL,
	[MasterMixLabelQual] [nvarchar](50) NULL,
	[MasterMixSN] [nvarchar](50) NULL,
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
	[ContPkgIDQual] [nvarchar](50) NULL,
	[ContPkgType] [nvarchar](50) NULL,
	[CountryOfOrgQual] [nvarchar](50) NULL,
	[CountryOfOrg] [nvarchar](50) NULL,
	[Quantity] [float] NULL,
	[UOM] [nvarchar](50) NULL,
	[ContLabelQual] [nvarchar](50) NULL,
	[ContLabelSN] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[NO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEDI_856_HL3]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEDI_856_HL3](
	[NO] [int] IDENTITY(1,1) NOT NULL,
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
	[ContLabelSN] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[NO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEDI_856_LINE]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEDI_856_LINE](
	[NO] [int] IDENTITY(1,1) NOT NULL,
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
	[BOLNo] [nchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[NO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEDI_856_N1]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEDI_856_N1](
	[NO] [int] IDENTITY(1,1) NOT NULL,
	[HdrKey] [nvarchar](100) NULL,
	[LineKey] [nvarchar](100) NULL,
	[N1Key] [nvarchar](100) NOT NULL,
	[EntityIDCode] [nvarchar](50) NULL,
	[CodeQual] [nvarchar](50) NULL,
	[Code] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[NO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEDI_856_QTY]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEDI_856_QTY](
	[NO] [int] IDENTITY(1,1) NOT NULL,
	[QtyKey] [nvarchar](100) NOT NULL,
	[HL3Key] [nvarchar](100) NULL,
	[HL2Key] [nvarchar](100) NULL,
	[LineKey] [nvarchar](100) NULL,
	[HdrKey] [nvarchar](100) NULL,
	[QtyQual] [nvarchar](50) NULL,
	[Quantity] [float] NULL,
	[UOM] [nvarchar](50) NULL,
	[Measurement] [float] NULL,
	[UnitMeasure] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[NO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEDI_856_REF]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEDI_856_REF](
	[NO] [int] IDENTITY(1,1) NOT NULL,
	[RefKey] [nvarchar](100) NOT NULL,
	[HL3Key] [nvarchar](100) NULL,
	[HL2Key] [nvarchar](100) NULL,
	[LineKey] [nvarchar](100) NULL,
	[HdrKey] [nvarchar](100) NULL,
	[RefQual] [nvarchar](50) NULL,
	[RefNum] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[NO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEDI_860_CTP]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEDI_860_CTP](
	[NO] [int] IDENTITY(1,1) NOT NULL,
	[HdrKey] [nvarchar](50) NULL,
	[LineKey] [nvarchar](50) NULL,
	[CtpKey] [nvarchar](50) NOT NULL,
	[PriceIDCode] [nvarchar](50) NULL,
	[UnitPrice] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[NO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEDI_860_DTM]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEDI_860_DTM](
	[NO] [int] IDENTITY(1,1) NOT NULL,
	[HdrKey] [nvarchar](50) NULL,
	[LineKey] [nvarchar](50) NULL,
	[DtmKey] [nvarchar](50) NOT NULL,
	[DtmQual] [nvarchar](50) NULL,
	[Date] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[NO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEDI_860_HEADER]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEDI_860_HEADER](
	[NO] [int] IDENTITY(1,1) NOT NULL,
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
	[DateAdded] [datetime] NOT NULL,
	[GeneratedDateTime] [datetime] NULL,
	[AdminFuncCode_hdr] [nvarchar](50) NULL,
	[AdminContact_hdr] [nvarchar](100) NULL,
	[AdminCommNumQual_hdr] [nvarchar](50) NULL,
	[AdminPhone_hdr] [nvarchar](50) NULL,
	[CTPClass] [nvarchar](50) NULL,
	[STPPriceQual] [nvarchar](50) NULL,
	[TextMessageCode] [nvarchar](10) NULL,
	[Check864] [nvarchar](50) NULL,
	[blnRepFlag] [bit] NULL,
	[ReleaseNum] [nvarchar](50) NULL,
	[FOBTransTermsQual] [nvarchar](50) NULL,
	[FOBTransTermsCode] [nvarchar](50) NULL,
	[GSReceiverID] [nvarchar](50) NULL,
	[blnEmailFlag] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[NO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEDI_860_ITA]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEDI_860_ITA](
	[NO] [int] IDENTITY(1,1) NOT NULL,
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
	[SpecialChargeCode] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[NO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEDI_860_ITD]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEDI_860_ITD](
	[NO] [int] IDENTITY(1,1) NOT NULL,
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
	[DayOfMonth] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[NO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEDI_860_LINE]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEDI_860_LINE](
	[NO] [int] IDENTITY(1,1) NOT NULL,
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
	[UOMCode] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[NO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEDI_860_MSG]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEDI_860_MSG](
	[NO] [int] IDENTITY(1,1) NOT NULL,
	[MsgKey] [nvarchar](100) NOT NULL,
	[N9Key] [nvarchar](100) NULL,
	[HdrKey] [nvarchar](100) NULL,
	[MsgText] [nvarchar](1000) NULL,
PRIMARY KEY CLUSTERED 
(
	[NO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEDI_860_N1]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEDI_860_N1](
	[NO] [int] IDENTITY(1,1) NOT NULL,
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
	[CommNum2] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[NO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEDI_860_N9]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEDI_860_N9](
	[NO] [int] IDENTITY(1,1) NOT NULL,
	[HdrKey] [nvarchar](100) NULL,
	[LineKey] [nvarchar](100) NULL,
	[N9Key] [nvarchar](100) NOT NULL,
	[RefQual] [nvarchar](50) NULL,
	[RefNum] [nvarchar](100) NULL,
	[Description] [nvarchar](200) NULL,
	[Msg] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[NO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEDI_860_NTE]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEDI_860_NTE](
	[NO] [int] IDENTITY(1,1) NOT NULL,
	[NteKey] [nvarchar](100) NOT NULL,
	[HdrKey] [nvarchar](100) NULL,
	[LineKey] [nvarchar](100) NULL,
	[DtlKey] [nvarchar](100) NULL,
	[NoteRefCode] [nvarchar](50) NULL,
	[Description] [nvarchar](200) NULL,
	[N9Key] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[NO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEDI_860_PID]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEDI_860_PID](
	[NO] [int] IDENTITY(1,1) NOT NULL,
	[HdrKey] [nvarchar](50) NULL,
	[LineKey] [nvarchar](50) NULL,
	[PidKey] [nvarchar](50) NOT NULL,
	[ItemDescType] [nvarchar](10) NULL,
	[ProductCharCode] [nvarchar](10) NULL,
	[ItemDescQual] [nvarchar](10) NULL,
	[ProductDescCode] [nvarchar](10) NULL,
	[Description] [nvarchar](200) NULL,
	[SLPCode] [nvarchar](10) NULL,
	[SlnKey] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[NO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEDI_860_PKG]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEDI_860_PKG](
	[NO] [int] IDENTITY(1,1) NOT NULL,
	[HdrKey] [nvarchar](100) NULL,
	[LineKey] [nvarchar](100) NULL,
	[PkgKey] [nvarchar](100) NOT NULL,
	[ItemDescrpType] [nvarchar](50) NULL,
	[PkgCharCode] [nvarchar](50) NULL,
	[PkgDescription] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[NO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEDI_860_PO3]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEDI_860_PO3](
	[NO] [int] IDENTITY(1,1) NOT NULL,
	[HdrKey] [nvarchar](50) NULL,
	[LineKey] [nvarchar](50) NULL,
	[PO3Key] [nvarchar](50) NOT NULL,
	[ChangeReasonCode] [nvarchar](10) NULL,
	[PriceQual] [nvarchar](10) NULL,
	[UnitPrice] [float] NULL,
	[BasisOfUnitPriceCode] [nvarchar](10) NULL,
	[Quantity] [int] NULL,
	[UnitBasisMsrCode] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[NO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEDI_860_REF]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEDI_860_REF](
	[NO] [int] IDENTITY(1,1) NOT NULL,
	[HdrKey] [nvarchar](100) NULL,
	[LineKey] [nvarchar](100) NULL,
	[RefKey] [nvarchar](100) NOT NULL,
	[RefQual] [nvarchar](10) NULL,
	[RefNum] [nvarchar](100) NULL,
	[Description] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[NO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEDI_860_SAC]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEDI_860_SAC](
	[NO] [int] IDENTITY(1,1) NOT NULL,
	[HdrKey] [nvarchar](100) NULL,
	[LineKey] [nvarchar](100) NULL,
	[SacKey] [nvarchar](100) NOT NULL,
	[AllowanceChargeIndicator] [nvarchar](50) NULL,
	[SACCode] [nvarchar](50) NULL,
	[AgencyQual] [nvarchar](50) NULL,
	[AgencyCode] [nvarchar](50) NULL,
	[Amount] [float] NULL,
	[MethodHandlingCode] [nvarchar](50) NULL,
	[Description] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[NO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEDI_860_SCH]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEDI_860_SCH](
	[NO] [int] IDENTITY(1,1) NOT NULL,
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
	[N1Key] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[NO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEDI_860_SHH]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEDI_860_SHH](
	[NO] [int] IDENTITY(1,1) NOT NULL,
	[HdrKey] [nvarchar](50) NULL,
	[ShhKey] [nvarchar](50) NOT NULL,
	[SchedulingCode] [nvarchar](10) NULL,
	[DtmQual] [nvarchar](50) NULL,
	[Date] [datetime] NULL,
	[Description] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[NO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEDI_860_SLN]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEDI_860_SLN](
	[NO] [int] IDENTITY(1,1) NOT NULL,
	[HdrKey] [nvarchar](100) NULL,
	[LineKey] [nvarchar](100) NULL,
	[SlnKey] [nvarchar](100) NOT NULL,
	[AssignedID] [nvarchar](50) NULL,
	[RelationshipCode] [nvarchar](50) NULL,
	[ProductIDQual] [nvarchar](50) NULL,
	[ProductID] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[NO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEDI_860_TD5]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEDI_860_TD5](
	[NO] [int] IDENTITY(1,1) NOT NULL,
	[TD5Key] [nvarchar](100) NOT NULL,
	[HdrKey] [nvarchar](100) NULL,
	[TransMethod] [nvarchar](50) NULL,
	[CarrierName] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[NO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEDI_861_DTM]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEDI_861_DTM](
	[NO] [int] IDENTITY(1,1) NOT NULL,
	[HdrKey] [nvarchar](50) NULL,
	[DtmKey] [nvarchar](50) NOT NULL,
	[DtmQual] [nvarchar](50) NULL,
	[Date] [datetime] NULL,
	[TimeCode] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[NO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEDI_861_HEADER]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEDI_861_HEADER](
	[NO] [int] IDENTITY(1,1) NOT NULL,
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
	[DateAdded] [datetime] NOT NULL,
	[SubmitDateTime] [datetime] NULL,
	[blnRepFlag] [bit] NULL,
	[GSReceiverID] [nvarchar](50) NULL,
	[blnEmailFlag] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[NO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEDI_861_LINE]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEDI_861_LINE](
	[NO] [int] IDENTITY(1,1) NOT NULL,
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
	[ItemDescription] [nvarchar](150) NULL,
PRIMARY KEY CLUSTERED 
(
	[NO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEDI_861_N1]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEDI_861_N1](
	[NO] [int] IDENTITY(1,1) NOT NULL,
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
PRIMARY KEY CLUSTERED 
(
	[NO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEDI_861_REF]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEDI_861_REF](
	[NO] [int] IDENTITY(1,1) NOT NULL,
	[HdrKey] [nvarchar](100) NULL,
	[LineKey] [nvarchar](100) NULL,
	[RefKey] [nvarchar](100) NOT NULL,
	[RefQual] [nvarchar](10) NULL,
	[RefNum] [nvarchar](100) NULL,
	[Description] [nvarchar](200) NULL,
	[RefID] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[NO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEDI_862_ATH]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEDI_862_ATH](
	[NO] [int] IDENTITY(1,1) NOT NULL,
	[HdrKey] [nvarchar](100) NULL,
	[LineKey] [nvarchar](100) NULL,
	[AthKey] [nvarchar](100) NOT NULL,
	[ResourceAuthCode] [nvarchar](50) NULL,
	[ResourceAuth_ThruDate] [datetime] NULL,
	[CumAthQty] [nvarchar](50) NULL,
	[AthQty] [nvarchar](50) NULL,
	[CumStartDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[NO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEDI_862_DETAIL]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEDI_862_DETAIL](
	[NO] [int] IDENTITY(1,1) NOT NULL,
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
	[RefNum] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[NO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEDI_862_DTM]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEDI_862_DTM](
	[NO] [int] IDENTITY(1,1) NOT NULL,
	[HdrKey] [nvarchar](50) NULL,
	[LineKey] [nvarchar](50) NULL,
	[DtlKey] [nvarchar](50) NULL,
	[FstKey] [nvarchar](50) NULL,
	[DtmKey] [nvarchar](50) NOT NULL,
	[DtmQual] [nvarchar](50) NULL,
	[CreateDateTime] [datetime] NULL,
	[TimeCode] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[NO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEDI_862_EXPORT]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEDI_862_EXPORT](
	[NO] [int] IDENTITY(1,1) NOT NULL,
	[ExportNo] [int] NOT NULL,
	[JitKey] [nvarchar](100) NOT NULL,
	[ExportQty] [float] NULL,
	[PONum] [nvarchar](50) NULL,
	[PONum_Suffix] [int] NULL,
	[ExportDateTime] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[NO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEDI_862_HEADER]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEDI_862_HEADER](
	[NO] [int] IDENTITY(1,1) NOT NULL,
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
	[ReleaseNumber] [nvarchar](50) NULL,
	[ContactNumber] [nvarchar](20) NULL,
	[PONum] [nvarchar](20) NULL,
	[ScheduleQtyQual] [nvarchar](50) NULL,
	[AdminFuncCode_hdr] [nvarchar](50) NULL,
	[AdminContact_hdr] [nvarchar](100) NULL,
	[AdminCommNumQual_hdr] [nvarchar](50) NULL,
	[AdminPhone_hdr] [nvarchar](50) NULL,
	[DateAdded] [datetime] NOT NULL,
	[blnRepFlag] [bit] NULL,
	[GSReceiverID] [nvarchar](50) NULL,
	[blnEmailFlag] [bit] NULL,
	[blnEmailErrorFlag] [bit] NULL,
	[blnImport] [bit] NULL,
 CONSTRAINT [PK__tblEDI_862_HEADE__04AFB25B] PRIMARY KEY CLUSTERED 
(
	[NO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEDI_862_JIT]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEDI_862_JIT](
	[NO] [int] IDENTITY(1,1) NOT NULL,
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
	[ShipmentTime] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[NO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEDI_862_LINE]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEDI_862_LINE](
	[NO] [int] IDENTITY(1,1) NOT NULL,
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
	[PalletType] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[NO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEDI_862_N1]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEDI_862_N1](
	[NO] [int] IDENTITY(1,1) NOT NULL,
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
	[RequestorName] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[NO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEDI_862_REF]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEDI_862_REF](
	[NO] [int] IDENTITY(1,1) NOT NULL,
	[HdrKey] [nvarchar](100) NULL,
	[LineKey] [nvarchar](100) NULL,
	[DtlKey] [nvarchar](100) NULL,
	[ShpKey] [nvarchar](100) NULL,
	[RefKey] [nvarchar](100) NOT NULL,
	[RefQual] [nvarchar](10) NULL,
	[RefNum] [nvarchar](100) NULL,
	[Description] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[NO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEDI_862_SHP]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEDI_862_SHP](
	[NO] [int] IDENTITY(1,1) NOT NULL,
	[HdrKey] [nvarchar](100) NULL,
	[LineKey] [nvarchar](100) NULL,
	[ShpKey] [nvarchar](100) NOT NULL,
	[QtyQual] [nvarchar](100) NULL,
	[ShipQty] [float] NULL,
	[DateQual] [nvarchar](50) NULL,
	[LastShipDate] [datetime] NULL,
	[BegInventoryDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[NO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEDI_864_DTM]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEDI_864_DTM](
	[NO] [int] IDENTITY(1,1) NOT NULL,
	[DtmKey] [nvarchar](100) NOT NULL,
	[HdrKey] [nvarchar](100) NULL,
	[DtmQual] [nvarchar](50) NULL,
	[Date] [datetime] NULL,
	[TimeCode] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[NO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEDI_864_HEADER]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEDI_864_HEADER](
	[NO] [int] IDENTITY(1,1) NOT NULL,
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
	[DateAdded] [datetime] NOT NULL,
	[SubmitDateTime] [datetime] NULL,
	[blnRepFlag] [bit] NULL,
	[GSReceiverID] [nvarchar](50) NULL,
	[blnEmailFlag] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[NO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEDI_864_LINE]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEDI_864_LINE](
	[NO] [int] IDENTITY(1,1) NOT NULL,
	[LineKey] [nvarchar](100) NOT NULL,
	[HdrKey] [nvarchar](100) NULL,
	[DocumentIDNum] [nvarchar](50) NULL,
	[Description] [nvarchar](100) NULL,
	[PageWidth] [int] NULL,
	[PageLengthLines] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[NO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEDI_864_MSG]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEDI_864_MSG](
	[NO] [int] IDENTITY(1,1) NOT NULL,
	[MsgKey] [nvarchar](100) NOT NULL,
	[HdrKey] [nvarchar](100) NULL,
	[LineKey] [nvarchar](100) NULL,
	[MsgText] [nvarchar](1000) NULL,
	[CarriageControlCode] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[NO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEDI_864_N1]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEDI_864_N1](
	[NO] [int] IDENTITY(1,1) NOT NULL,
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
	[ContactNumber2] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[NO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEDI_997_DETAIL]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEDI_997_DETAIL](
	[NO] [int] IDENTITY(1,1) NOT NULL,
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
	[CopyBadDataElement] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[NO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEDI_997_HEADER]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEDI_997_HEADER](
	[NO] [int] IDENTITY(1,1) NOT NULL,
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
	[DateAdded] [datetime] NOT NULL,
	[GeneratedDateTime] [datetime] NULL,
	[FunctionalGroupNoteCode1] [nvarchar](50) NULL,
	[FunctionalGroupNoteCode2] [nvarchar](50) NULL,
	[FunctionalGroupNoteCode3] [nvarchar](50) NULL,
	[FunctionalGroupNoteCode4] [nvarchar](50) NULL,
	[FunctionalGroupNoteCode5] [nvarchar](50) NULL,
	[blnRepFlag] [bit] NULL,
	[GSReceiverID] [nvarchar](50) NULL,
	[blnEmailFlag] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[NO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEDI_997_LINE]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEDI_997_LINE](
	[NO] [int] IDENTITY(1,1) NOT NULL,
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
	[TranSetNoteCode5] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[NO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEDISegment]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEDISegment](
	[SegmentNo] [int] IDENTITY(1,1) NOT NULL,
	[SegmentCode] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SegmentNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEDITransactionSet]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEDITransactionSet](
	[TransactionSetNo] [int] IDENTITY(1,1) NOT NULL,
	[TransactionSetID] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](100) NULL,
	[InOut] [bit] NOT NULL,
	[EDITypeNo_FK] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TransactionSetNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEDITransactionStructure]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEDITransactionStructure](
	[StructureNo] [int] IDENTITY(1,1) NOT NULL,
	[Version] [nvarchar](50) NOT NULL,
	[TransactionSetID] [nvarchar](50) NOT NULL,
	[FunctionGroup] [nvarchar](50) NOT NULL,
	[SegmentCode] [nvarchar](50) NULL,
	[MinLength] [int] NOT NULL,
	[MaxLength] [int] NOT NULL,
	[EDITypeNo_FK] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[StructureNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEDITrasactionRawData]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEDITrasactionRawData](
	[TransactionRawDataNo] [int] IDENTITY(1,1) NOT NULL,
	[TransactionDate] [datetime] NOT NULL,
	[TradingPartnerNo_FK] [int] NOT NULL,
	[TransactionSetNo_FK] [int] NOT NULL,
	[TransactionKey] [nvarchar](50) NOT NULL,
	[InOut] [bit] NOT NULL,
	[RawData] [text] NOT NULL,
	[XMLData] [text] NOT NULL,
	[InterchangeControlNum] [nvarchar](50) NULL,
	[GroupControlNum] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[TransactionRawDataNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEDIType]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEDIType](
	[EDITypeNo] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[EDITypeNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEDIVersion]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEDIVersion](
	[EDIVersionNo] [int] IDENTITY(1,1) NOT NULL,
	[Version] [nvarchar](50) NOT NULL,
	[EDITypeNo_FK] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[EDIVersionNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblERPType]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblERPType](
	[ERPNo] [int] NOT NULL,
	[ERPName] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ERPNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblErrorHandle]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblErrorHandle](
	[ErrorHandleNo] [int] IDENTITY(1,1) NOT NULL,
	[ErrorHandleCode] [int] NOT NULL,
	[Description] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ErrorHandleNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblErrorLog]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblErrorLog](
	[ErrorLogNo] [int] IDENTITY(1,1) NOT NULL,
	[LogDate] [datetime] NOT NULL,
	[TradingPartnerNo_FK] [int] NULL,
	[TransactionSetNo_FK] [int] NULL,
	[TransactionRawDataNo_FK] [int] NULL,
	[ErrorMessage] [nvarchar](200) NOT NULL,
	[LogType] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ErrorLogNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblInboundMapping]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblInboundMapping](
	[InboundMappingNo] [int] IDENTITY(1,1) NOT NULL,
	[TradingPartnerNo_FK] [int] NOT NULL,
	[TransactionSetNo_FK] [int] NOT NULL,
	[SegmentNo_FK] [int] NULL,
	[Postion] [int] NOT NULL,
	[TableName] [nvarchar](50) NULL,
	[FieldName] [nvarchar](50) NULL,
	[CommitDBAfterRead] [bit] NOT NULL,
	[Note] [nvarchar](200) NULL,
	[TransactionRawDataNo_FK] [int] NOT NULL,
	[IsInsert] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[InboundMappingNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblInboundOutboundSetting]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblInboundOutboundSetting](
	[SettingNo] [int] IDENTITY(1,1) NOT NULL,
	[SettingName] [nvarchar](100) NOT NULL,
	[InOut] [bit] NOT NULL,
	[Path] [nvarchar](200) NULL,
	[IsArchive] [bit] NOT NULL,
	[IsDelete] [bit] NOT NULL,
	[IsCreate] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SettingNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblInterchangeControlNumber]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblInterchangeControlNumber](
	[ControlNo] [int] IDENTITY(1,1) NOT NULL,
	[InterchangeControlNumber] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ControlNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOperator]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOperator](
	[OperatorNo] [int] IDENTITY(1,1) NOT NULL,
	[OperatorCode] [nvarchar](50) NOT NULL,
	[OperatorName] [nvarchar](100) NOT NULL,
	[OperatorParameter] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[OperatorNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOperatorInboundMapping]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOperatorInboundMapping](
	[OperatorMappingNo] [int] IDENTITY(1,1) NOT NULL,
	[OperatorNo_FK] [int] NOT NULL,
	[InboundMappingNo_FK] [int] NOT NULL,
	[OperatorParameter] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[OperatorMappingNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOperatorOutboundMapping]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOperatorOutboundMapping](
	[OperatorMappingNo] [int] IDENTITY(1,1) NOT NULL,
	[OperatorNo_FK] [int] NOT NULL,
	[OutboundMappingNo_FK] [int] NOT NULL,
	[OperatorParameter] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[OperatorMappingNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOutboundMapping]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOutboundMapping](
	[OutboundMappingNo] [int] IDENTITY(1,1) NOT NULL,
	[TradingPartnerNo_FK] [int] NOT NULL,
	[TransactionSetNo_FK] [int] NOT NULL,
	[SegmentNo_FK] [int] NULL,
	[Postion] [int] NOT NULL,
	[Value] [nvarchar](50) NULL,
	[XMLPathField] [nvarchar](100) NULL,
	[Note] [nvarchar](200) NULL,
	[OutputEDIFilePath] [nvarchar](200) NULL,
	[TransactionRawDataNo_FK] [int] NOT NULL,
	[SegmentNumber] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[OutboundMappingNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblSegmentTerminator]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblSegmentTerminator](
	[SegmentTerminatorNo] [int] IDENTITY(1,1) NOT NULL,
	[TerminatorCode] [int] NOT NULL,
	[Terminator] [nvarchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SegmentTerminatorNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblTradingPartner]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTradingPartner](
	[TradingPartnerNo] [int] IDENTITY(1,1) NOT NULL,
	[TradingPartnerName] [nvarchar](100) NOT NULL,
	[AuthorizationQual] [nvarchar](50) NULL,
	[AuthorizationInfo] [nvarchar](50) NULL,
	[SecurityQual] [nvarchar](50) NULL,
	[SecurityInfo] [nvarchar](50) NULL,
	[InterchangeSenderIDQual] [nvarchar](50) NOT NULL,
	[InterchangeSenderID] [nvarchar](50) NOT NULL,
	[InterchangeReceiverIDQual] [nvarchar](50) NOT NULL,
	[InterchangeReceiverID] [nvarchar](50) NOT NULL,
	[ApplicationSenderCode] [nvarchar](50) NOT NULL,
	[ApplicationReceiverCode] [nvarchar](50) NOT NULL,
	[ResponsibleAgencyCode] [nvarchar](50) NULL,
	[SegmentTerminator] [int] NOT NULL,
	[DataElementDelimiter] [int] NOT NULL,
	[RepetitionSep] [int] NULL,
	[InterchangeVersion] [nvarchar](50) NOT NULL,
	[StandardVersion] [int] NOT NULL,
	[TestIndicator] [bit] NOT NULL,
	[SubElementSep] [int] NOT NULL,
	[FunctionalAcknowledgement] [int] NULL,
	[OutBoundID] [nvarchar](50) NULL,
	[Output997FilePath] [nvarchar](100) NULL,
	[blnIsGSYear4] [bit] NULL,
	[blnUseSCP] [bit] NULL,
	[SCPFolder] [nvarchar](255) NULL,
	[ERPNo_FK] [int] NULL,
	[blnUseUNA] [bit] NULL,
 CONSTRAINT [PK__tblTradingPartne__09DE7BCC] PRIMARY KEY CLUSTERED 
(
	[TradingPartnerNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblTradingPartnerAutoCopy]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTradingPartnerAutoCopy](
	[TPAutoCopyNo] [int] IDENTITY(1,1) NOT NULL,
	[TradingPartnerNo_FK] [int] NOT NULL,
	[TradingPartnerNo_AutoCopy_FK] [int] NOT NULL,
	[TransactionSetNo_FK] [int] NOT NULL,
	[blnCopyIDFromTradingPartner] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[TPAutoCopyNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblTradingPartnerErrorHanding]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTradingPartnerErrorHanding](
	[TPErrorHandingNo] [int] IDENTITY(1,1) NOT NULL,
	[TradingPartnerNo_FK] [int] NOT NULL,
	[TransactionSetNo_FK] [int] NOT NULL,
	[ErrorHandleNo_FK] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TPErrorHandingNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblTransmissionControlNumber]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTransmissionControlNumber](
	[TransControlNo] [int] IDENTITY(1,1) NOT NULL,
	[TransmissionNumber] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TransControlNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[f_EDI_142_DupCheck_1]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- EDI DATA DUPLCAITE CHECK
CREATE FUNCTION [dbo].[f_EDI_142_DupCheck_1] 
(	
)
RETURNS TABLE 
AS
RETURN 
(

SELECT     h1.HdrKey, h1.SubmitDateTime, h1.ISAControlNum, h1.GSControlNum, h1.TransSetControlNum,h1.GSReceiverID
FROM         tblEDI_142_HEADER AS h1 INNER JOIN
                      tblEDI_142_HEADER AS h2 ON h1.ISAControlNum = h2.ISAControlNum AND h1.GSControlNum = h2.GSControlNum AND 
                      h1.TransSetControlNum = h2.TransSetControlNum
WHERE     (h1.blnRepFlag = 1) AND (h2.blnRepFlag = 1)
GROUP BY h1.HdrKey, h1.SubmitDateTime, h1.ISAControlNum, h1.GSControlNum, h1.TransSetControlNum,h1.GSReceiverID
HAVING      (h1.SubmitDateTime = MIN(h2.SubmitDateTime))

)

GO
/****** Object:  UserDefinedFunction [dbo].[f_EDI_142_DupCheck_2]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[f_EDI_142_DupCheck_2] 
(	
)
RETURNS TABLE 
AS
RETURN 
(
SELECT                  NO, ISAControlNum, GSControlNum, TransSetControlNum,GSReceiverID
FROM                     tblEDI_142_HEADER AS h1
WHERE                   (blnRepFlag = 0)
)

GO
/****** Object:  UserDefinedFunction [dbo].[f_EDI_4095_DupCheck_1]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[f_EDI_4095_DupCheck_1] 
(	
)
RETURNS TABLE 
AS
RETURN 
(

SELECT                  h1.HdrKey, h1.TransmissionDate, h1.TransmissionNumberOld, h1.TransmissionNumberNew,h1.SenderID,h1.ReceiverID
FROM                     tblEDI_4095_HEADER AS h1 INNER JOIN
                                  tblEDI_4095_HEADER AS h2 ON h1.TransmissionNumberOld = h2.TransmissionNumberOld AND h1.TransmissionNumberNew = h2.TransmissionNumberNew
WHERE                   (h1.blnRepFlag = 1) AND (h2.blnRepFlag = 1)
GROUP BY          h1.HdrKey, h1.TransmissionDate, h1.TransmissionNumberOld, h1.TransmissionNumberNew,h1.SenderID,h1.ReceiverID
HAVING  h1.TransmissionDate = MIN(h2.TransmissionDate)

)


GO
/****** Object:  UserDefinedFunction [dbo].[f_EDI_4095_DupCheck_2]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[f_EDI_4095_DupCheck_2] 
(	
)
RETURNS TABLE 
AS
RETURN 
(
SELECT                  NO, TransmissionNumberOld, TransmissionNumberNew,h1.ReceiverID,h1.SenderID
FROM                     tblEDI_4095_HEADER AS h1
WHERE                   (blnRepFlag = 0)
)

GO
/****** Object:  UserDefinedFunction [dbo].[f_EDI_810_DupCheck_1]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[f_EDI_810_DupCheck_1] 
(	
)
RETURNS TABLE 
AS
RETURN 
(

SELECT     h1.HdrKey, h1.SubmitDateTime, h1.ISAControlNum, h1.GSControlNum, h1.TransSetControlNum,h1.GSReceiverID
FROM         tblEDI_810_HEADER AS h1 INNER JOIN
                      tblEDI_810_HEADER AS h2 ON h1.ISAControlNum = h2.ISAControlNum AND h1.GSControlNum = h2.GSControlNum AND 
                      h1.TransSetControlNum = h2.TransSetControlNum
WHERE     (h1.blnRepFlag = 1) AND (h2.blnRepFlag = 1)
GROUP BY h1.HdrKey, h1.SubmitDateTime, h1.ISAControlNum, h1.GSControlNum, h1.TransSetControlNum,h1.GSReceiverID
HAVING      (h1.SubmitDateTime = MIN(h2.SubmitDateTime))

)

GO
/****** Object:  UserDefinedFunction [dbo].[f_EDI_810_DupCheck_2]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[f_EDI_810_DupCheck_2] 
(	
)
RETURNS TABLE 
AS
RETURN 
(
SELECT                  NO, ISAControlNum, GSControlNum, TransSetControlNum,h1.GSReceiverID
FROM                     tblEDI_810_HEADER AS h1
WHERE                   (blnRepFlag = 0)
)

GO
/****** Object:  UserDefinedFunction [dbo].[f_EDI_812_DupCheck_1]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[f_EDI_812_DupCheck_1] 
(	
)
RETURNS TABLE 
AS
RETURN 
(

SELECT                  h1.HdrKey, h1.SubmitDateTime, h1.ISAControlNum, h1.GSControlNum, h1.TransSetControlNum,h1.GSReceiverID,h1.ISASenderID
FROM                     tblEDI_812_HEADER AS h1 INNER JOIN
                                  tblEDI_812_HEADER AS h2 ON h1.ISAControlNum = h2.ISAControlNum AND h1.GSControlNum = h2.GSControlNum AND 
                                  h1.TransSetControlNum = h2.TransSetControlNum
WHERE                   (h1.blnRepFlag = 1) AND (h2.blnRepFlag = 1)
GROUP BY          h1.HdrKey, h1. SubmitDateTime, h1.ISAControlNum, h1.GSControlNum, h1.TransSetControlNum,h1.GSReceiverID,h1.ISASenderID
HAVING  h1.SubmitDateTime = MIN(h2.SubmitDateTime)

)
GO
/****** Object:  UserDefinedFunction [dbo].[f_EDI_812_DupCheck_2]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
 
 CREATE FUNCTION [dbo].[f_EDI_812_DupCheck_2] 
(	
)
RETURNS TABLE 
AS
RETURN 
(
SELECT                  NO, ISAControlNum, GSControlNum, TransSetControlNum,h1.GSReceiverID,h1.ISASenderID
FROM                     tblEDI_812_HEADER AS h1
WHERE                   (blnRepFlag = 0)
)

GO
/****** Object:  UserDefinedFunction [dbo].[f_EDI_820_DupCheck_1]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE FUNCTION [dbo].[f_EDI_820_DupCheck_1] 
(	
)
RETURNS TABLE 
AS
RETURN 
(

SELECT                  h1.HdrKey, h1.SubmitDateTime, h1.ISAControlNum, h1.GSControlNum, h1.TransSetControlNum,h1.GSReceiverID,h1.ISASenderID
FROM                     tblEDI_820_HEADER AS h1 INNER JOIN
                                  tblEDI_820_HEADER AS h2 ON h1.ISAControlNum = h2.ISAControlNum AND h1.GSControlNum = h2.GSControlNum AND 
                                  h1.TransSetControlNum = h2.TransSetControlNum
WHERE                   (h1.blnRepFlag = 1) AND (h2.blnRepFlag = 1)
GROUP BY          h1.HdrKey, h1. SubmitDateTime, h1.ISAControlNum, h1.GSControlNum, h1.TransSetControlNum,h1.GSReceiverID,h1.ISASenderID
HAVING  h1.SubmitDateTime = MIN(h2.SubmitDateTime)

)


GO
/****** Object:  UserDefinedFunction [dbo].[f_EDI_820_DupCheck_2]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE FUNCTION [dbo].[f_EDI_820_DupCheck_2] 
(	
)
RETURNS TABLE 
AS
RETURN 
(
SELECT                  NO, ISAControlNum, GSControlNum, TransSetControlNum,h1.GSReceiverID,h1.ISASenderID
FROM                     tblEDI_820_HEADER AS h1
WHERE                   (blnRepFlag = 0)
)


GO
/****** Object:  UserDefinedFunction [dbo].[f_EDI_824_DupCheck_1]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[f_EDI_824_DupCheck_1] 
(	
)
RETURNS TABLE 
AS
RETURN 
(

SELECT     h1.HdrKey, h1.SubmitDateTime, h1.ISAControlNum, h1.GSControlNum, h1.TransSetControlNum,h1.GSReceiverID
FROM         tblEDI_824_HEADER AS h1 INNER JOIN
                      tblEDI_824_HEADER AS h2 ON h1.ISAControlNum = h2.ISAControlNum AND h1.GSControlNum = h2.GSControlNum AND 
                      h1.TransSetControlNum = h2.TransSetControlNum
WHERE     (h1.blnRepFlag = 1) AND (h2.blnRepFlag = 1)
GROUP BY h1.HdrKey, h1.SubmitDateTime, h1.ISAControlNum, h1.GSControlNum, h1.TransSetControlNum,h1.GSReceiverID
HAVING      (h1.SubmitDateTime = MIN(h2.SubmitDateTime))

)

GO
/****** Object:  UserDefinedFunction [dbo].[f_EDI_824_DupCheck_2]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[f_EDI_824_DupCheck_2] 
(	
)
RETURNS TABLE 
AS
RETURN 
(
SELECT                  NO, ISAControlNum, GSControlNum, TransSetControlNum,h1.GSReceiverID
FROM                     tblEDI_824_HEADER AS h1
WHERE                   (blnRepFlag = 0)
)

GO
/****** Object:  UserDefinedFunction [dbo].[f_EDI_830_DupCheck_1]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE FUNCTION [dbo].[f_EDI_830_DupCheck_1] 
(	
)
RETURNS TABLE 
AS
RETURN 
(

SELECT                  h1.HdrKey, h1.SubmitDateTime, h1.ISAControlNum, h1.GSControlNum, h1.TransSetControlNum,h1.GSReceiverID,h1.ISASenderID,h1.ReleaseNumber
FROM                     tblEDI_830_HEADER AS h1 INNER JOIN
                                  tblEDI_830_HEADER AS h2 ON h1.ISAControlNum = h2.ISAControlNum AND h1.GSControlNum = h2.GSControlNum AND 
                                  h1.TransSetControlNum = h2.TransSetControlNum
WHERE                   (h1.blnRepFlag = 1) AND (h2.blnRepFlag = 1)
GROUP BY          h1.HdrKey, h1. SubmitDateTime, h1.ISAControlNum, h1.GSControlNum, h1.TransSetControlNum,h1.GSReceiverID,h1.ISASenderID,h1.ReleaseNumber
HAVING  h1.SubmitDateTime = MIN(h2.SubmitDateTime)

)



GO
/****** Object:  UserDefinedFunction [dbo].[f_EDI_830_DupCheck_2]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE FUNCTION [dbo].[f_EDI_830_DupCheck_2] 
(	
)
RETURNS TABLE 
AS
RETURN 
(
SELECT                  NO, ISAControlNum, GSControlNum, TransSetControlNum,h1.GSReceiverID,h1.ISASenderID,h1.ReleaseNumber
FROM                     tblEDI_830_HEADER AS h1
WHERE                   (blnRepFlag = 0)
)



GO
/****** Object:  UserDefinedFunction [dbo].[f_EDI_832_DupCheck_1]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[f_EDI_832_DupCheck_1] 
(	
)
RETURNS TABLE 
AS
RETURN 
(

SELECT     h1.HdrKey, h1.SubmitDateTime, h1.ISAControlNum, h1.GSControlNum, h1.TransSetControlNum,h1.GSReceiverID
FROM         tblEDI_832_HEADER AS h1 INNER JOIN
                      tblEDI_832_HEADER AS h2 ON h1.ISAControlNum = h2.ISAControlNum AND h1.GSControlNum = h2.GSControlNum AND 
                      h1.TransSetControlNum = h2.TransSetControlNum
WHERE     (h1.blnRepFlag = 1) AND (h2.blnRepFlag = 1)
GROUP BY h1.HdrKey, h1.SubmitDateTime, h1.ISAControlNum, h1.GSControlNum, h1.TransSetControlNum,h1.GSReceiverID
HAVING      (h1.SubmitDateTime = MIN(h2.SubmitDateTime))

)

GO
/****** Object:  UserDefinedFunction [dbo].[f_EDI_832_DupCheck_2]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[f_EDI_832_DupCheck_2] 
(	
)
RETURNS TABLE 
AS
RETURN 
(
SELECT                  NO, ISAControlNum, GSControlNum, TransSetControlNum,h1.GSReceiverID
FROM                     tblEDI_832_HEADER AS h1
WHERE                   (blnRepFlag = 0)
)

GO
/****** Object:  UserDefinedFunction [dbo].[f_EDI_846_DupCheck_1]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


 
CREATE FUNCTION [dbo].[f_EDI_846_DupCheck_1] 
(	
)
RETURNS TABLE 
AS
RETURN 
(

SELECT     h1.HdrKey, h1.SubmitDateTime, h1.ISAControlNum, h1.GSControlNum, h1.TransSetControlNum,h1.GSReceiverID
FROM         tblEDI_846_HEADER AS h1 INNER JOIN
                      tblEDI_846_HEADER AS h2 ON h1.ISAControlNum = h2.ISAControlNum AND h1.GSControlNum = h2.GSControlNum AND 
                      h1.TransSetControlNum = h2.TransSetControlNum
WHERE     (h1.blnRepFlag = 1) AND (h2.blnRepFlag = 1)
GROUP BY h1.HdrKey, h1.SubmitDateTime, h1.ISAControlNum, h1.GSControlNum, h1.TransSetControlNum,h1.GSReceiverID
HAVING      (h1.SubmitDateTime = MIN(h2.SubmitDateTime))

)

GO
/****** Object:  UserDefinedFunction [dbo].[f_EDI_846_DupCheck_2]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[f_EDI_846_DupCheck_2] 
(	
)
RETURNS TABLE 
AS
RETURN 
(
SELECT                  NO, ISAControlNum, GSControlNum, TransSetControlNum,GSReceiverID
FROM                     tblEDI_846_HEADER AS h1
WHERE                   (blnRepFlag = 0)
)
GO
/****** Object:  UserDefinedFunction [dbo].[f_EDI_850_DupCheck_1]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE FUNCTION [dbo].[f_EDI_850_DupCheck_1] 
(	
)
RETURNS TABLE 
AS
RETURN 
(

SELECT                  h1.HdrKey, h1.SubmitDateTime, h1.ISAControlNum, h1.GSControlNum, h1.TransSetControlNum,h1.GSReceiverID,h1.ISASenderID
FROM                     tblEDI_850_HEADER AS h1 INNER JOIN
                                  tblEDI_850_HEADER AS h2 ON h1.ISAControlNum = h2.ISAControlNum AND h1.GSControlNum = h2.GSControlNum AND 
                                  h1.TransSetControlNum = h2.TransSetControlNum
WHERE                   (h1.blnRepFlag = 1) AND (h2.blnRepFlag = 1)
GROUP BY          h1.HdrKey, h1. SubmitDateTime, h1.ISAControlNum, h1.GSControlNum, h1.TransSetControlNum,h1.GSReceiverID,h1.ISASenderID
HAVING  h1.SubmitDateTime = MIN(h2.SubmitDateTime)

)


GO
/****** Object:  UserDefinedFunction [dbo].[f_EDI_850_DupCheck_2]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE FUNCTION [dbo].[f_EDI_850_DupCheck_2] 
(	
)
RETURNS TABLE 
AS
RETURN 
(
SELECT                  NO, ISAControlNum, GSControlNum, TransSetControlNum,h1.GSReceiverID,h1.ISASenderID
FROM                     tblEDI_850_HEADER AS h1
WHERE                   (blnRepFlag = 0)
)


GO
/****** Object:  UserDefinedFunction [dbo].[f_EDI_856_DupCheck_1]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[f_EDI_856_DupCheck_1] 
(	
)
RETURNS TABLE 
AS
RETURN 
(

SELECT     h1.HdrKey, h1.SubmitDateTime, h1.ISAControlNum, h1.GSControlNum, h1.TransSetControlNum,h1.GSReceiverID
FROM         tblEDI_856_HEADER AS h1 INNER JOIN
                      tblEDI_856_HEADER AS h2 ON h1.ISAControlNum = h2.ISAControlNum AND h1.GSControlNum = h2.GSControlNum AND 
                      h1.TransSetControlNum = h2.TransSetControlNum
WHERE     (h1.blnRepFlag = 1) AND (h2.blnRepFlag = 1)
GROUP BY h1.HdrKey, h1.SubmitDateTime, h1.ISAControlNum, h1.GSControlNum, h1.TransSetControlNum,h1.GSReceiverID
HAVING      (h1.SubmitDateTime = MIN(h2.SubmitDateTime))

)

GO
/****** Object:  UserDefinedFunction [dbo].[f_EDI_856_DupCheck_2]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[f_EDI_856_DupCheck_2] 
(	
)
RETURNS TABLE 
AS
RETURN 
(
SELECT                  NO, ISAControlNum, GSControlNum, TransSetControlNum,h1.GSReceiverID
FROM                     tblEDI_856_HEADER AS h1
WHERE                   (blnRepFlag = 0)
)


GO
/****** Object:  UserDefinedFunction [dbo].[f_EDI_860_DupCheck_1]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[f_EDI_860_DupCheck_1] 
(	
)
RETURNS TABLE 
AS
RETURN 
(

SELECT     h1.HdrKey, h1.SubmitDateTime, h1.ISAControlNum, h1.GSControlNum, h1.TransSetControlNum,h1.GSReceiverID
FROM         tblEDI_860_HEADER AS h1 INNER JOIN
                      tblEDI_860_HEADER AS h2 ON h1.ISAControlNum = h2.ISAControlNum AND h1.GSControlNum = h2.GSControlNum AND 
                      h1.TransSetControlNum = h2.TransSetControlNum
WHERE     (h1.blnRepFlag = 1) AND (h2.blnRepFlag = 1)
GROUP BY h1.HdrKey, h1.SubmitDateTime, h1.ISAControlNum, h1.GSControlNum, h1.TransSetControlNum,h1.GSReceiverID
HAVING      (h1.SubmitDateTime = MIN(h2.SubmitDateTime))

)


GO
/****** Object:  UserDefinedFunction [dbo].[f_EDI_860_DupCheck_2]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[f_EDI_860_DupCheck_2] 
(	
)
RETURNS TABLE 
AS
RETURN 
(
SELECT                  NO, ISAControlNum, GSControlNum, TransSetControlNum,h1.GSReceiverID
FROM                     tblEDI_860_HEADER AS h1
WHERE                   (blnRepFlag = 0)
)

GO
/****** Object:  UserDefinedFunction [dbo].[f_EDI_861_DupCheck_1]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[f_EDI_861_DupCheck_1] 
(	
)
RETURNS TABLE 
AS
RETURN 
(

SELECT     h1.HdrKey, h1.SubmitDateTime, h1.ISAControlNum, h1.GSControlNum, h1.TransSetControlNum,h1.GSReceiverID
FROM         tblEDI_861_HEADER AS h1 INNER JOIN
                      tblEDI_861_HEADER AS h2 ON h1.ISAControlNum = h2.ISAControlNum AND h1.GSControlNum = h2.GSControlNum AND 
                      h1.TransSetControlNum = h2.TransSetControlNum
WHERE     (h1.blnRepFlag = 1) AND (h2.blnRepFlag = 1)
GROUP BY h1.HdrKey, h1.SubmitDateTime, h1.ISAControlNum, h1.GSControlNum, h1.TransSetControlNum,h1.GSReceiverID
HAVING      (h1.SubmitDateTime = MIN(h2.SubmitDateTime))

)

GO
/****** Object:  UserDefinedFunction [dbo].[f_EDI_861_DupCheck_2]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[f_EDI_861_DupCheck_2] 
(	
)
RETURNS TABLE 
AS
RETURN 
(
SELECT                  NO, ISAControlNum, GSControlNum, TransSetControlNum,GSReceiverID
FROM                     tblEDI_861_HEADER AS h1
WHERE                   (blnRepFlag = 0)
)

GO
/****** Object:  UserDefinedFunction [dbo].[f_EDI_862_DupCheck_1]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE FUNCTION [dbo].[f_EDI_862_DupCheck_1] 
(	
)
RETURNS TABLE 
AS
RETURN 
(

SELECT                  h1.HdrKey, h1.SubmitDateTime, h1.ISAControlNum, h1.GSControlNum, h1.TransSetControlNum,h1.GSReceiverID,h1.ISASenderID,h1.ReleaseNumber
FROM                     tblEDI_862_HEADER AS h1 INNER JOIN
                                  tblEDI_862_HEADER AS h2 ON h1.ISAControlNum = h2.ISAControlNum AND h1.GSControlNum = h2.GSControlNum AND 
                                  h1.TransSetControlNum = h2.TransSetControlNum
WHERE                   (h1.blnRepFlag = 1) AND (h2.blnRepFlag = 1)
GROUP BY          h1.HdrKey, h1. SubmitDateTime, h1.ISAControlNum, h1.GSControlNum, h1.TransSetControlNum,h1.GSReceiverID,h1.ISASenderID,h1.ReleaseNumber
HAVING  h1.SubmitDateTime = MIN(h2.SubmitDateTime)

)



GO
/****** Object:  UserDefinedFunction [dbo].[f_EDI_862_DupCheck_2]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE FUNCTION [dbo].[f_EDI_862_DupCheck_2] 
(	
)
RETURNS TABLE 
AS
RETURN 
(
SELECT                  NO, ISAControlNum, GSControlNum, TransSetControlNum,GSReceiverID,h1.ISASenderID,h1.ReleaseNumber
FROM                     tblEDI_862_HEADER AS h1
WHERE                   (blnRepFlag = 0)
)



GO
/****** Object:  UserDefinedFunction [dbo].[f_EDI_864_DupCheck_1]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[f_EDI_864_DupCheck_1] 
(	
)
RETURNS TABLE 
AS
RETURN 
(

SELECT     h1.HdrKey, h1.SubmitDateTime, h1.ISAControlNum, h1.GSControlNum, h1.TransSetControlNum,h1.GSReceiverID
FROM         tblEDI_864_HEADER AS h1 INNER JOIN
                      tblEDI_864_HEADER AS h2 ON h1.ISAControlNum = h2.ISAControlNum AND h1.GSControlNum = h2.GSControlNum AND 
                      h1.TransSetControlNum = h2.TransSetControlNum
WHERE     (h1.blnRepFlag = 1) AND (h2.blnRepFlag = 1)
GROUP BY h1.HdrKey, h1.SubmitDateTime, h1.ISAControlNum, h1.GSControlNum, h1.TransSetControlNum,h1.GSReceiverID
HAVING      (h1.SubmitDateTime = MIN(h2.SubmitDateTime))

)

GO
/****** Object:  UserDefinedFunction [dbo].[f_EDI_864_DupCheck_2]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[f_EDI_864_DupCheck_2] 
(	
)
RETURNS TABLE 
AS
RETURN 
(
SELECT                  NO, ISAControlNum, GSControlNum, TransSetControlNum,h1.GSReceiverID
FROM                     tblEDI_864_HEADER AS h1
WHERE                   (blnRepFlag = 0)
)

GO
/****** Object:  UserDefinedFunction [dbo].[f_EDI_997_DupCheck_1]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE FUNCTION [dbo].[f_EDI_997_DupCheck_1] 
(	
)
RETURNS TABLE 
AS
RETURN 
(

SELECT     h1.HdrKey, h1.SubmitDateTime, h1.ISAControlNum, h1.GSControlNum, h1.TransSetControlNum,h1.GSReceiverID,h1.ISASenderID
FROM         tblEDI_997_HEADER AS h1 INNER JOIN
                      tblEDI_997_HEADER AS h2 ON h1.ISAControlNum = h2.ISAControlNum AND h1.GSControlNum = h2.GSControlNum AND 
                      h1.TransSetControlNum = h2.TransSetControlNum
WHERE     (h1.blnRepFlag = 1) AND (h2.blnRepFlag = 1)
GROUP BY h1.HdrKey, h1.SubmitDateTime, h1.ISAControlNum, h1.GSControlNum, h1.TransSetControlNum,h1.GSReceiverID,h1.ISASenderID
HAVING      (h1.SubmitDateTime = MIN(h2.SubmitDateTime))

)


GO
/****** Object:  UserDefinedFunction [dbo].[f_EDI_997_DupCheck_2]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE FUNCTION [dbo].[f_EDI_997_DupCheck_2] 
(	
)
RETURNS TABLE 
AS
RETURN 
(
SELECT                  NO, ISAControlNum, GSControlNum, TransSetControlNum,h1.GSReceiverID,h1.ISASenderID
FROM                     tblEDI_997_HEADER AS h1
WHERE                   (blnRepFlag = 0)
)



GO
ALTER TABLE [dbo].[tblEDI_142_HEADER] ADD  DEFAULT (getdate()) FOR [DateAdded]
GO
ALTER TABLE [dbo].[tblEDI_142_HEADER] ADD  DEFAULT ((1)) FOR [blnRepFlag]
GO
ALTER TABLE [dbo].[tblEDI_4095_HEADER] ADD  DEFAULT (getdate()) FOR [DateAdded]
GO
ALTER TABLE [dbo].[tblEDI_4095_HEADER] ADD  DEFAULT ((1)) FOR [blnRepFlag]
GO
ALTER TABLE [dbo].[tblEDI_4095_HEADER] ADD  DEFAULT ((0)) FOR [blnEmailFlag]
GO
ALTER TABLE [dbo].[tblEDI_4095_HEADER] ADD  DEFAULT ((0)) FOR [blnEmailErrorFlag]
GO
ALTER TABLE [dbo].[tblEDI_4095_HEADER] ADD  DEFAULT ((0)) FOR [blnImport]
GO
ALTER TABLE [dbo].[tblEDI_810_HEADER] ADD  DEFAULT (getdate()) FOR [DateAdded]
GO
ALTER TABLE [dbo].[tblEDI_810_HEADER] ADD  DEFAULT ((1)) FOR [blnRepFlag]
GO
ALTER TABLE [dbo].[tblEDI_812_HEADER] ADD  DEFAULT (getdate()) FOR [DateAdded]
GO
ALTER TABLE [dbo].[tblEDI_812_HEADER] ADD  DEFAULT ((1)) FOR [blnRepFlag]
GO
ALTER TABLE [dbo].[tblEDI_812_HEADER] ADD  DEFAULT ((0)) FOR [blnEmailFlag]
GO
ALTER TABLE [dbo].[tblEDI_812_HEADER] ADD  DEFAULT ((0)) FOR [blnEmailErrorFlag]
GO
ALTER TABLE [dbo].[tblEDI_820_HEADER] ADD  DEFAULT (getdate()) FOR [DateAdded]
GO
ALTER TABLE [dbo].[tblEDI_820_HEADER] ADD  DEFAULT ((1)) FOR [blnRepFlag]
GO
ALTER TABLE [dbo].[tblEDI_820_HEADER] ADD  DEFAULT ((0)) FOR [blnImportSimply]
GO
ALTER TABLE [dbo].[tblEDI_820_HEADER] ADD  DEFAULT ((0)) FOR [blnEmailFlag]
GO
ALTER TABLE [dbo].[tblEDI_820_HEADER] ADD  DEFAULT ((0)) FOR [blnEmailErrorFlag]
GO
ALTER TABLE [dbo].[tblEDI_820_HEADER] ADD  DEFAULT ((0)) FOR [blnImport]
GO
ALTER TABLE [dbo].[tblEDI_824_HEADER] ADD  DEFAULT (getdate()) FOR [DateAdded]
GO
ALTER TABLE [dbo].[tblEDI_824_HEADER] ADD  DEFAULT ((1)) FOR [blnRepFlag]
GO
ALTER TABLE [dbo].[tblEDI_824_HEADER] ADD  DEFAULT ((0)) FOR [blnEmailFlag]
GO
ALTER TABLE [dbo].[tblEDI_830_HEADER] ADD  CONSTRAINT [DF__tblEDI_83__DateA__04E4BC85]  DEFAULT (getdate()) FOR [DateAdded]
GO
ALTER TABLE [dbo].[tblEDI_830_HEADER] ADD  CONSTRAINT [DF__tblEDI_83__blnRe__05D8E0BE]  DEFAULT ((1)) FOR [blnRepFlag]
GO
ALTER TABLE [dbo].[tblEDI_830_HEADER] ADD  CONSTRAINT [DF__tblEDI_83__blnEm__06CD04F7]  DEFAULT ((0)) FOR [blnEmailFlag]
GO
ALTER TABLE [dbo].[tblEDI_830_HEADER] ADD  CONSTRAINT [DF__tblEDI_83__blnEm__0662F0A3]  DEFAULT ((0)) FOR [blnEmailErrorFlag]
GO
ALTER TABLE [dbo].[tblEDI_830_HEADER] ADD  DEFAULT ((0)) FOR [blnImport]
GO
ALTER TABLE [dbo].[tblEDI_832_HEADER] ADD  DEFAULT (getdate()) FOR [DateAdded]
GO
ALTER TABLE [dbo].[tblEDI_832_HEADER] ADD  DEFAULT ((1)) FOR [blnRepFlag]
GO
ALTER TABLE [dbo].[tblEDI_846_HEADER] ADD  DEFAULT (getdate()) FOR [DateAdded]
GO
ALTER TABLE [dbo].[tblEDI_846_HEADER] ADD  DEFAULT ((1)) FOR [blnRepFlag]
GO
ALTER TABLE [dbo].[tblEDI_846_HEADER] ADD  DEFAULT ((0)) FOR [blnEmailFlag]
GO
ALTER TABLE [dbo].[tblEDI_846_HEADER] ADD  DEFAULT ((0)) FOR [blnEmailErrorFlag]
GO
ALTER TABLE [dbo].[tblEDI_850_HEADER] ADD  DEFAULT (getdate()) FOR [DateAdded]
GO
ALTER TABLE [dbo].[tblEDI_850_HEADER] ADD  DEFAULT ((1)) FOR [blnRepFlag]
GO
ALTER TABLE [dbo].[tblEDI_850_HEADER] ADD  DEFAULT ((0)) FOR [blnEmailFlag]
GO
ALTER TABLE [dbo].[tblEDI_850_HEADER] ADD  DEFAULT ((0)) FOR [blnEmailErrorFlag]
GO
ALTER TABLE [dbo].[tblEDI_850_HEADER] ADD  DEFAULT ((0)) FOR [blnImport]
GO
ALTER TABLE [dbo].[tblEDI_856_HEADER] ADD  DEFAULT (getdate()) FOR [DateAdded]
GO
ALTER TABLE [dbo].[tblEDI_856_HEADER] ADD  DEFAULT ((1)) FOR [blnRepFlag]
GO
ALTER TABLE [dbo].[tblEDI_856_HEADER] ADD  DEFAULT ((0)) FOR [blnEmailFlag]
GO
ALTER TABLE [dbo].[tblEDI_856_HEADER] ADD  DEFAULT ((0)) FOR [blnEmailErrorFlag]
GO
ALTER TABLE [dbo].[tblEDI_856_HEADER] ADD  DEFAULT ((0)) FOR [blnImport]
GO
ALTER TABLE [dbo].[tblEDI_860_HEADER] ADD  DEFAULT (getdate()) FOR [DateAdded]
GO
ALTER TABLE [dbo].[tblEDI_860_HEADER] ADD  DEFAULT ((1)) FOR [blnRepFlag]
GO
ALTER TABLE [dbo].[tblEDI_861_HEADER] ADD  DEFAULT (getdate()) FOR [DateAdded]
GO
ALTER TABLE [dbo].[tblEDI_861_HEADER] ADD  DEFAULT ((1)) FOR [blnRepFlag]
GO
ALTER TABLE [dbo].[tblEDI_861_HEADER] ADD  DEFAULT ((0)) FOR [blnEmailFlag]
GO
ALTER TABLE [dbo].[tblEDI_862_HEADER] ADD  CONSTRAINT [DF__tblEDI_86__DateA__05A3D694]  DEFAULT (getdate()) FOR [DateAdded]
GO
ALTER TABLE [dbo].[tblEDI_862_HEADER] ADD  CONSTRAINT [DF__tblEDI_86__blnRe__0697FACD]  DEFAULT ((1)) FOR [blnRepFlag]
GO
ALTER TABLE [dbo].[tblEDI_862_HEADER] ADD  CONSTRAINT [DF__tblEDI_86__blnEm__078C1F06]  DEFAULT ((0)) FOR [blnEmailFlag]
GO
ALTER TABLE [dbo].[tblEDI_862_HEADER] ADD  CONSTRAINT [DF__tblEDI_86__blnEm__093F5D4E]  DEFAULT ((0)) FOR [blnEmailErrorFlag]
GO
ALTER TABLE [dbo].[tblEDI_862_HEADER] ADD  DEFAULT ((0)) FOR [blnImport]
GO
ALTER TABLE [dbo].[tblEDI_864_HEADER] ADD  DEFAULT (getdate()) FOR [DateAdded]
GO
ALTER TABLE [dbo].[tblEDI_864_HEADER] ADD  DEFAULT ((1)) FOR [blnRepFlag]
GO
ALTER TABLE [dbo].[tblEDI_864_HEADER] ADD  DEFAULT ((0)) FOR [blnEmailFlag]
GO
ALTER TABLE [dbo].[tblEDI_997_HEADER] ADD  DEFAULT (getdate()) FOR [DateAdded]
GO
ALTER TABLE [dbo].[tblEDI_997_HEADER] ADD  DEFAULT ((1)) FOR [blnRepFlag]
GO
ALTER TABLE [dbo].[tblEDI_997_HEADER] ADD  DEFAULT ((0)) FOR [blnEmailFlag]
GO
ALTER TABLE [dbo].[tblInboundMapping] ADD  DEFAULT ((1)) FOR [IsInsert]
GO
ALTER TABLE [dbo].[tblTradingPartner] ADD  CONSTRAINT [DF__tblTradin__Funct__0F975522]  DEFAULT ((0)) FOR [FunctionalAcknowledgement]
GO
ALTER TABLE [dbo].[tblTradingPartner] ADD  DEFAULT ((0)) FOR [blnIsGSYear4]
GO
ALTER TABLE [dbo].[tblTradingPartner] ADD  DEFAULT ((0)) FOR [blnUseSCP]
GO
ALTER TABLE [dbo].[tblTradingPartner] ADD  DEFAULT ((0)) FOR [blnUseUNA]
GO
ALTER TABLE [dbo].[tblTradingPartnerAutoCopy] ADD  DEFAULT ((0)) FOR [blnCopyIDFromTradingPartner]
GO
ALTER TABLE [dbo].[tblEDITransactionSet]  WITH CHECK ADD FOREIGN KEY([EDITypeNo_FK])
REFERENCES [dbo].[tblEDIType] ([EDITypeNo])
GO
ALTER TABLE [dbo].[tblEDITransactionStructure]  WITH CHECK ADD FOREIGN KEY([EDITypeNo_FK])
REFERENCES [dbo].[tblEDIType] ([EDITypeNo])
GO
ALTER TABLE [dbo].[tblEDITrasactionRawData]  WITH CHECK ADD  CONSTRAINT [FK__tblEDITra__Tradi__1BFD2C07] FOREIGN KEY([TradingPartnerNo_FK])
REFERENCES [dbo].[tblTradingPartner] ([TradingPartnerNo])
GO
ALTER TABLE [dbo].[tblEDITrasactionRawData] CHECK CONSTRAINT [FK__tblEDITra__Tradi__1BFD2C07]
GO
ALTER TABLE [dbo].[tblEDITrasactionRawData]  WITH CHECK ADD FOREIGN KEY([TransactionSetNo_FK])
REFERENCES [dbo].[tblEDITransactionSet] ([TransactionSetNo])
GO
ALTER TABLE [dbo].[tblEDIVersion]  WITH CHECK ADD FOREIGN KEY([EDITypeNo_FK])
REFERENCES [dbo].[tblEDIType] ([EDITypeNo])
GO
ALTER TABLE [dbo].[tblErrorLog]  WITH CHECK ADD  CONSTRAINT [FK__tblErrorL__Tradi__1FCDBCEB] FOREIGN KEY([TradingPartnerNo_FK])
REFERENCES [dbo].[tblTradingPartner] ([TradingPartnerNo])
GO
ALTER TABLE [dbo].[tblErrorLog] CHECK CONSTRAINT [FK__tblErrorL__Tradi__1FCDBCEB]
GO
ALTER TABLE [dbo].[tblErrorLog]  WITH CHECK ADD FOREIGN KEY([TransactionSetNo_FK])
REFERENCES [dbo].[tblEDITransactionSet] ([TransactionSetNo])
GO
ALTER TABLE [dbo].[tblErrorLog]  WITH CHECK ADD FOREIGN KEY([TransactionRawDataNo_FK])
REFERENCES [dbo].[tblEDITrasactionRawData] ([TransactionRawDataNo])
GO
ALTER TABLE [dbo].[tblInboundMapping]  WITH CHECK ADD FOREIGN KEY([SegmentNo_FK])
REFERENCES [dbo].[tblEDISegment] ([SegmentNo])
GO
ALTER TABLE [dbo].[tblInboundMapping]  WITH CHECK ADD  CONSTRAINT [FK__tblInboun__Tradi__24927208] FOREIGN KEY([TradingPartnerNo_FK])
REFERENCES [dbo].[tblTradingPartner] ([TradingPartnerNo])
GO
ALTER TABLE [dbo].[tblInboundMapping] CHECK CONSTRAINT [FK__tblInboun__Tradi__24927208]
GO
ALTER TABLE [dbo].[tblInboundMapping]  WITH CHECK ADD FOREIGN KEY([TransactionSetNo_FK])
REFERENCES [dbo].[tblEDITransactionSet] ([TransactionSetNo])
GO
ALTER TABLE [dbo].[tblInboundMapping]  WITH CHECK ADD FOREIGN KEY([TransactionRawDataNo_FK])
REFERENCES [dbo].[tblEDITrasactionRawData] ([TransactionRawDataNo])
GO
ALTER TABLE [dbo].[tblOperatorInboundMapping]  WITH CHECK ADD FOREIGN KEY([InboundMappingNo_FK])
REFERENCES [dbo].[tblInboundMapping] ([InboundMappingNo])
GO
ALTER TABLE [dbo].[tblOperatorInboundMapping]  WITH CHECK ADD FOREIGN KEY([OperatorNo_FK])
REFERENCES [dbo].[tblOperator] ([OperatorNo])
GO
ALTER TABLE [dbo].[tblOperatorOutboundMapping]  WITH CHECK ADD FOREIGN KEY([OperatorNo_FK])
REFERENCES [dbo].[tblOperator] ([OperatorNo])
GO
ALTER TABLE [dbo].[tblOperatorOutboundMapping]  WITH CHECK ADD FOREIGN KEY([OutboundMappingNo_FK])
REFERENCES [dbo].[tblOutboundMapping] ([OutboundMappingNo])
GO
ALTER TABLE [dbo].[tblOutboundMapping]  WITH CHECK ADD FOREIGN KEY([SegmentNo_FK])
REFERENCES [dbo].[tblEDISegment] ([SegmentNo])
GO
ALTER TABLE [dbo].[tblOutboundMapping]  WITH CHECK ADD  CONSTRAINT [FK__tblOutbou__Tradi__2B3F6F97] FOREIGN KEY([TradingPartnerNo_FK])
REFERENCES [dbo].[tblTradingPartner] ([TradingPartnerNo])
GO
ALTER TABLE [dbo].[tblOutboundMapping] CHECK CONSTRAINT [FK__tblOutbou__Tradi__2B3F6F97]
GO
ALTER TABLE [dbo].[tblOutboundMapping]  WITH CHECK ADD FOREIGN KEY([TransactionSetNo_FK])
REFERENCES [dbo].[tblEDITransactionSet] ([TransactionSetNo])
GO
ALTER TABLE [dbo].[tblOutboundMapping]  WITH CHECK ADD FOREIGN KEY([TransactionRawDataNo_FK])
REFERENCES [dbo].[tblEDITrasactionRawData] ([TransactionRawDataNo])
GO
ALTER TABLE [dbo].[tblTradingPartner]  WITH CHECK ADD  CONSTRAINT [FK__tblTradin__DataE__0BC6C43E] FOREIGN KEY([DataElementDelimiter])
REFERENCES [dbo].[tblSegmentTerminator] ([SegmentTerminatorNo])
GO
ALTER TABLE [dbo].[tblTradingPartner] CHECK CONSTRAINT [FK__tblTradin__DataE__0BC6C43E]
GO
ALTER TABLE [dbo].[tblTradingPartner]  WITH CHECK ADD  CONSTRAINT [FK__tblTradin__Repet__0CBAE877] FOREIGN KEY([RepetitionSep])
REFERENCES [dbo].[tblSegmentTerminator] ([SegmentTerminatorNo])
GO
ALTER TABLE [dbo].[tblTradingPartner] CHECK CONSTRAINT [FK__tblTradin__Repet__0CBAE877]
GO
ALTER TABLE [dbo].[tblTradingPartner]  WITH CHECK ADD  CONSTRAINT [FK__tblTradin__Segme__0AD2A005] FOREIGN KEY([SegmentTerminator])
REFERENCES [dbo].[tblSegmentTerminator] ([SegmentTerminatorNo])
GO
ALTER TABLE [dbo].[tblTradingPartner] CHECK CONSTRAINT [FK__tblTradin__Segme__0AD2A005]
GO
ALTER TABLE [dbo].[tblTradingPartner]  WITH CHECK ADD  CONSTRAINT [FK__tblTradin__Stand__0DAF0CB0] FOREIGN KEY([StandardVersion])
REFERENCES [dbo].[tblEDIVersion] ([EDIVersionNo])
GO
ALTER TABLE [dbo].[tblTradingPartner] CHECK CONSTRAINT [FK__tblTradin__Stand__0DAF0CB0]
GO
ALTER TABLE [dbo].[tblTradingPartner]  WITH CHECK ADD  CONSTRAINT [FK__tblTradin__SubEl__0EA330E9] FOREIGN KEY([SubElementSep])
REFERENCES [dbo].[tblSegmentTerminator] ([SegmentTerminatorNo])
GO
ALTER TABLE [dbo].[tblTradingPartner] CHECK CONSTRAINT [FK__tblTradin__SubEl__0EA330E9]
GO
ALTER TABLE [dbo].[tblTradingPartnerAutoCopy]  WITH CHECK ADD FOREIGN KEY([TradingPartnerNo_FK])
REFERENCES [dbo].[tblTradingPartner] ([TradingPartnerNo])
GO
ALTER TABLE [dbo].[tblTradingPartnerAutoCopy]  WITH CHECK ADD FOREIGN KEY([TradingPartnerNo_AutoCopy_FK])
REFERENCES [dbo].[tblTradingPartner] ([TradingPartnerNo])
GO
ALTER TABLE [dbo].[tblTradingPartnerAutoCopy]  WITH CHECK ADD FOREIGN KEY([TransactionSetNo_FK])
REFERENCES [dbo].[tblEDITransactionSet] ([TransactionSetNo])
GO
ALTER TABLE [dbo].[tblTradingPartnerErrorHanding]  WITH CHECK ADD FOREIGN KEY([ErrorHandleNo_FK])
REFERENCES [dbo].[tblErrorHandle] ([ErrorHandleNo])
GO
ALTER TABLE [dbo].[tblTradingPartnerErrorHanding]  WITH CHECK ADD  CONSTRAINT [FK__tblTradin__Tradi__173876EA] FOREIGN KEY([TradingPartnerNo_FK])
REFERENCES [dbo].[tblTradingPartner] ([TradingPartnerNo])
GO
ALTER TABLE [dbo].[tblTradingPartnerErrorHanding] CHECK CONSTRAINT [FK__tblTradin__Tradi__173876EA]
GO
ALTER TABLE [dbo].[tblTradingPartnerErrorHanding]  WITH CHECK ADD FOREIGN KEY([TransactionSetNo_FK])
REFERENCES [dbo].[tblEDITransactionSet] ([TransactionSetNo])
GO
/****** Object:  StoredProcedure [dbo].[EDI_Import_Payment_Simply]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		BH
-- Create date: 04/05/2016 
-- Description:	Import payment data to Simply acounting from 820 data
-- =============================================
CREATE PROCEDURE [dbo].[EDI_Import_Payment_Simply] 
	-- Add the parameters for the stored procedure here
	@HdrKey NVARCHAR(100) = '',
	@LineKey NVARCHAR(100) = '',
	@AccountChecking INT = 10300000,
	@AccountReceivable INT = 11000000,
	@IsUpdateCheckingAmount BIT = 1 -- one time update to avoid values may have been changed since it was last read error

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	-- process error
	DECLARE @ErrorNumber INT,@ErrorProcedure NVARCHAR(200),@ErrorLine INT,@ErrorMessage NVARCHAR(4000)
	BEGIN TRY

		DECLARE @cmd varchar(1000);
	
		-- Get KPA account information
		DECLARE @KPACompanyID INT;
		SELECT @KPACompanyID = Lid FROM LS_KPA...tCompany
		DECLARE @CurrencyCode NVARCHAR(10),@CurrencyNo INT
		SELECT @CurrencyCode = u.sCurrCode,@CurrencyNo = u.Lid FROM LS_KPA...tCompOth c LEFT JOIN LS_KPA...tCurrncy u ON (u.lId = c.lHmCurrId)

		-- Simply user log-in
		DECLARE @SimplyLoginID AS INT;
		SELECT @SimplyLoginID = lId FROM LS_KPA...tUser WHERE sName = 'bhedi'

		-- job log file
		IF OBJECT_ID(N'tempdb.dbo.##tLog', N'U') IS NULL
			CREATE TABLE ##tLog  -- create global temporary table at tempdb #: temporary table ##global variable . bcp will start in another session need to use global table
				(
					LogData NVARCHAR(1000)
			)


		DECLARE @tHdrKey TABLE(HdrKey NVARCHAR(100),PaymentAmt DECIMAL(10,2),ReceiptDate DATETIME);

		IF ISNULL(@HdrKey,'') <> ''
			INSERT @tHdrKey SELECT Hdrkey,TotalPaymentAmount,RemittanceDate FROM  BHEDI.dbo.tblEDI_820_HEADER WHERE HdrKey = @HdrKey
		ELSE -- import all data 
			INSERT @tHdrKey 
			SELECT HdrKey,TotalPaymentAmount,RemittanceDate FROM BHEDI.dbo.tblEDI_820_HEADER WHERE DATEDIFF(day,DateAdded,GETDATE()) = 0 AND blnRepFlag = 0 AND blnImportSimply = 0 
   
		-- Line data
		DECLARE @TotalPaymentAmount DECIMAL(10,2),@PaymentAmount DECIMAL(10,2),@ReceiptDate AS DATETIME, @InvoiceID NVARCHAR(50),@GrossAmount DECIMAL(10,2);  
		
		-- Total amount
		SET @TotalPaymentAmount = 0;
				
		-- simply variable
		DECLARE @CustomerNo INT,@NextJournalID INT,@NextBRTID INT,@NextRCPID INT,@NextReceiptNo NVARCHAR(10),@NextCusTrDtKey INT,@lid INT;
		DECLARE @CustomerID NVARCHAR(50),@Address1 NVARCHAR(200),@Address2 NVARCHAR(200),@City NVARCHAR(50),@State NVARCHAR(10),@ZipCode NVARCHAR(10) ;

		-- LOOP ON HDRKEY
		DECLARE HdrKey_cursor CURSOR FOR SELECT HdrKey,PaymentAmt,ReceiptDate FROM  @tHdrKey

		OPEN HdrKey_cursor 
		FETCH NEXT FROM HdrKey_cursor INTO @HdrKey,@PaymentAmount,@ReceiptDate


		WHILE @@FETCH_STATUS = 0
		BEGIN
		
			-- Clear Log job 
			DELETE FROM ##tLog

			INSERT ##tLog VALUES(CONVERT(NVARCHAR(30),GETDATE(),121) + ' : start import' )
			
			SET @TotalPaymentAmount = @TotalPaymentAmount + @PaymentAmount;

			DECLARE LineKey_cursor CURSOR FOR
		
				SELECT  rmr.RemittanceID AS InvoiceID,rmr.GrossAmount
				FROM
					BHEDI.dbo.tblEDI_820_line AS l 
					INNER JOIN BHEDI.dbo.tblEDI_820_rmr AS rmr ON l.HdrKey = rmr.HdrKey AND l.LineKey = rmr.LineKey
				WHERE l.HdrKey = @HdrKey AND CASE WHEN ISNULL(@LineKey,'') = '' THEN l.LineKey ELSE @LineKey END = l.LineKey
			
			OPEN LineKey_cursor
			FETCH NEXT FROM LineKey_cursor INTO @InvoiceID,@GrossAmount
		
			-- Loop on Line data

			WHILE @@FETCH_STATUS = 0
			BEGIN	
			
				-- check invoice data in Simply
				INSERT ##tLog VALUES(CONVERT(NVARCHAR(30),GETDATE(),121) + ' : check invoice#: ' +  @InvoiceID)
				
				-- Check Invoice data
				SET @CustomerNo = NULL;
				SELECT @CustomerNo = i.LVenCusId FROM LS_KPA...tITRec AS i WHERE i.sSource1 = @InvoiceID;
				
				-- Check Receipt data is already created
				SET @lid = NULL;
				SELECT @lid = d.lId  FROM LS_KPA...tcustr as h INNER JOIN LS_KPA...tcustrdt as d ON h.lid = d.lCusTrid where h.sSource = @InvoiceID and d.nTranType = 1	;
				

				IF @CustomerNo IS NOT NULL AND @lid IS NULL 
				BEGIN
					INSERT ##tLog VALUES(CONVERT(NVARCHAR(30),GETDATE(),121) + ' : OK')
				
					INSERT ##tLog VALUES(CONVERT(NVARCHAR(30),GETDATE(),121) + ' : posting payment for invoice#: ' + @InvoiceID)

					-- post payment
					-- get JournalEnt next key
					SELECT @NextJournalID = lNextId FROM LS_KPA...tNxtPIds WHERE lId = 100 -- 100 tJourEnt key
					UPDATE OPENQUERY(LS_KPA,'SELECT lNextId,lId FROM tNxtPIds where lId = 100') SET lNextId = @NextJournalID + 1

					-- Contains receipt information for batch printing and automatic adjustments.
					-- get next receipt not
					SELECT @NextReceiptNo =  CASE WHEN ISNUMERIC(sSource) = 1 THEN CAST(sSource AS INT) + 1 ELSE sSource END
					FROM 
					(	select MAX(CASE WHEN ISNUMERIC(sSource) = 1 THEN CAST(sSource AS INT) ELSE  sSource END) AS sSource from LS_KPA...trcpthdr
					 ) AS R

					-- post journal entry
					INSERT ##tLog VALUES(CONVERT(NVARCHAR(30),GETDATE(),121) + ' : posting Journal Entry: tjourent')
					INSERT INTO LS_KPA...tjourent VALUES (@NextJournalID, GETDATE(), CONVERT(NVARCHAR(20),GETDATE(),114), 'bhedi', 'winsim', @ReceiptDate, 2, 0, @NextReceiptNo, 'BHEDI - Customer Payments'
						,@CurrencyNo, 0,@CustomerNo , 0, ' ', NULL, 0, @KPACompanyID, 1, 0, 0)
				
					-- post checking account information for the journal entry
					INSERT ##tLog VALUES(CONVERT(NVARCHAR(30),GETDATE(),121) + ' : posting checking account information for the journal entry: tjentact')
					INSERT INTO LS_KPA...tjentact VALUES (@NextJournalID, 1, @AccountChecking, @GrossAmount, 0, NULL, 0, @KPACompanyID)

				

					-- post account receivable information for the journal entry
					INSERT ##tLog VALUES(CONVERT(NVARCHAR(30),GETDATE(),121) + ' : posting receivable account information for the journal entry: tjentact')
					INSERT INTO LS_KPA...tjentact VALUES (@NextJournalID, 2, @AccountReceivable, (-1)*@GrossAmount, 0, NULL, 0, @KPACompanyID)
								 
					-- get next tBRTr key
					SELECT @NextBRTID =  lNextId FROM LS_KPA...tNxtPIds WHERE lId = 25  -- tBRTr key
					UPDATE OPENQUERY(LS_KPA,'SELECT lNextId,lId FROM tNxtPIds where lId = 25') SET lNextId = @NextBRTID + 1
				
					-- post account reconciliation transactions
					INSERT ##tLog VALUES(CONVERT(NVARCHAR(30),GETDATE(),121) + ' : posting account reconciliation transactions: tbrtr')
					INSERT INTO LS_KPA...tbrtr VALUES (@NextBRTID, 1, @AccountChecking, GETDATE(), CONVERT(NVARCHAR(20),GETDATE(),114), 'bhedi', 'winsim', 7, 7, 2, NULL, 0,
							'BHEDI - Customer Payments', GETDATE(), @GrossAmount, 0, @NextJournalID, @NextReceiptNo, @CurrencyNo, @GrossAmount, 0, 0, 0, 0, 0, 0)

					-- get next tRcpHdr key
					SELECT @NextRCPID = lNextId FROM LS_KPA...tNxtPIds WHERE lId = 223  -- tRcpHdr key
					UPDATE OPENQUERY(LS_KPA,'SELECT lNextId,lId FROM tNxtPIds where lId = 223') SET lNextId = @NextRCPID + 1
 

					-- post Contains receipt information for batch printing and automatic adjustments
					-- header
					SELECT @CustomerID = sName,@Address1 = sStreet1,@Address2 = sStreet2,@City = sCity,@State = sProvState,@ZipCode = sPostalZip FROM LS_KPA...tcustomr WHERE lid=@CustomerNo
					INSERT ##tLog VALUES(CONVERT(NVARCHAR(30),GETDATE(),121) + ' : posting receipt header information: trcpthdr')
					INSERT INTO LS_KPA...trcpthdr VALUES (@NextRCPID, GETDATE(), CONVERT(NVARCHAR(20),GETDATE(),114), 'bhedi', 'winsim', @CustomerNo, 1, @ReceiptDate, @NextReceiptNo, @CustomerID, '', @Address1,
							@City + ',' + @State + ' ' + @ZipCode, '', '', '', @AccountChecking, @CurrencyNo,@GrossAmount , 0, 0, 0, 0, 'bhedi', 0, 1, @NextJournalID, 0, 0, 0, NULL, 0, NULL, 18101, 0, 14, 0, 'Test1', 0, 0, 0, 0, 0, 0, 0)
				
					-- detail
					INSERT ##tLog VALUES(CONVERT(NVARCHAR(30),GETDATE(),121) + ' : posting receipt detail information: trcpthdr')
					SELECT @NextCusTrDtKey = lNextId FROM LS_KPA...tNxtPIds WHERE lId = 54 -- tCusTrDt key
					UPDATE OPENQUERY(LS_KPA,'SELECT lNextId,lId FROM tNxtPIds where lId = 54') SET lNextId = @NextCusTrDtKey + 1

					SELECT @lid = lid FROM LS_KPA...tcustr WHERE lcusid = @CustomerNo and sSource = @InvoiceID

					--Contains customer transaction details.
					INSERT INTO LS_KPA...tcustrdt VALUES (@NextCusTrDtKey, GETDATE(), CONVERT(NVARCHAR(20),GETDATE(),114), 'bhedi', 'winsim', @lid,@ReceiptDate , (-1)*@GrossAmount, 0, @NextReceiptNo, 
						1, @AccountChecking, 0, 0, 0, @NextRCPID, 0, 0, @GrossAmount, 0)
					
					INSERT ##tLog VALUES(CONVERT(NVARCHAR(30),GETDATE(),121) + ' : posted payment for invoice#: ' + @InvoiceID)

				END
				ELSE
					INSERT ##tLog VALUES(CONVERT(NVARCHAR(30),GETDATE(),121) + ' : invoice#: ' +  @InvoiceID + ' does not exist in Simply or receipt data is created already')


				FETCH NEXT FROM LineKey_cursor INTO @InvoiceID,@GrossAmount

			END
		
			CLOSE LineKey_cursor
			DEALLOCATE LineKey_cursor
			
			-- change import status
			UPDATE BHEDI.dbo.tblEDI_820_HEADER SET blnImportSimply = 1 WHERE HdrKey = @HdrKey
			
			INSERT ##tLog VALUES(CONVERT(NVARCHAR(30),GETDATE(),121) + ' : end import' )

			-- Write log file
			SET @cmd = 'bcp ##tLog out C:\BeachHead\BHEDI\LOG\' + @HdrKey + '.txt -c -T'
			EXEC master..xp_cmdshell @cmd

			FETCH NEXT FROM HdrKey_cursor INTO @HdrKey,@PaymentAmount,@ReceiptDate

		END 
		
					
		-- Free memory
		CLOSE HdrKey_cursor
		DEALLOCATE HdrKey_cursor
		
		DROP TABLE ##tLog

		-- Finally update checking and receivable account the total amount
		IF @TotalPaymentAmount > 0 and @IsUpdateCheckingAmount = 1 
		BEGIN


			-- update checking account
			SET @cmd = 'UPDATE OPENQUERY(LS_KPA, ''SELECT dYtc,lId FROM taccount where lId = ' + CONVERT(NVARCHAR(20),@AccountChecking) 
				+ ''') SET dYtc = dYtc + ' + CONVERT(NVARCHAR(20),@TotalPaymentAmount) ;
			PRINT @cmd
			EXEC (@cmd)

			-- update receivable account
			SET @cmd = 'UPDATE OPENQUERY(LS_KPA, ''SELECT dYtc,lId FROM taccount where lId = ' + CONVERT(NVARCHAR(20),@AccountReceivable) 
				+ ''') SET dYtc = dYtc - ' + CONVERT(NVARCHAR(20),@TotalPaymentAmount) ;
			PRINT @cmd
			EXEC (@cmd)

		END

	END TRY

	BEGIN CATCH -- process SQL error

		SELECT @ErrorNumber = ERROR_NUMBER()
			,@ErrorProcedure = ERROR_PROCEDURE()
			,@ErrorLine = ERROR_LINE()
			,@ErrorMessage = ERROR_MESSAGE()

		IF OBJECT_ID(N'tempdb.dbo.##tLog', N'U') IS NOT NULL
		BEGIN
			
			INSERT ##tLog VALUES('Error Number: ' + CONVERT(NVARCHAR(10),@ErrorNumber) + ' in procedure: ' + @ErrorProcedure + ' at line: ' + CONVERT(NVARCHAR(10),@ErrorLine))
			INSERT ##tLog VALUES('Error Message: ' + @ErrorMessage)
			
			-- Write log file
			SET @cmd = 'bcp ##tLog out C:\BeachHead\BHEDI\LOG\' + @HdrKey + '.txt -c -T'
			EXEC master..xp_cmdshell @cmd

			DROP TABLE ##tLog

		END
		ELSE
		BEGIN 
			INSERT [BHEDI].[dbo].[tblErrorLog](LogDate,TradingPartnerNo_FK,TransactionSetNo_FK,TransactionRawDataNo_FK,ErrorMessage,LogType)
			VALUES(GETDATE(),NULL,NULL,NULL,LEFT(@ErrorMessage + ' at line: ' + CONVERT(NVARCHAR(10),@ErrorLine),200),2)
		END
		
		-- close cursor
		IF (SELECT CURSOR_STATUS('global','LineKey_cursor')) >= -1
		BEGIN
			IF (SELECT CURSOR_STATUS('global','LineKey_cursor')) > -1
				BEGIN
					CLOSE LineKey_cursor
				END
			DEALLOCATE LineKey_cursor
		END
		
		IF (SELECT CURSOR_STATUS('global','HdrKey_cursor')) >= -1
		BEGIN
			IF (SELECT CURSOR_STATUS('global','HdrKey_cursor')) > -1
				BEGIN
					CLOSE HdrKey_cursor
				END
			DEALLOCATE HdrKey_cursor
		END


		SELECT 	@ErrorNumber AS ErrorNumber, @ErrorProcedure AS ErrorProcedure, @ErrorLine AS ErrorLine, @ErrorMessage AS ErrorMessage

	END CATCH

END


GO
/****** Object:  StoredProcedure [dbo].[EDI_Import_Payment_Simply_Update_Checking_Amount]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		BH
-- Create date: 04/05/2016 
-- Description:	Import payment data to Simply acounting from 820 data
-- =============================================
CREATE PROCEDURE [dbo].[EDI_Import_Payment_Simply_Update_Checking_Amount] 
	@TotalPaymentAmount DECIMAL(10,2),
	@AccountChecking INT = 10300000,
	@AccountReceivable INT = 11000000

AS
BEGIN

	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @cmd varchar(1000);

	BEGIN TRY

			SET @cmd = 'UPDATE OPENQUERY(LS_KPA, ''SELECT dYtc,lId FROM taccount where lId = ' + CONVERT(NVARCHAR(20),@AccountChecking) 
				+ ''') SET dYtc = dYtc + ' + CONVERT(NVARCHAR(20),@TotalPaymentAmount) ;
			
			EXEC (@cmd)

			-- update receivable account
			SET @cmd = 'UPDATE OPENQUERY(LS_KPA, ''SELECT dYtc,lId FROM taccount where lId = ' + CONVERT(NVARCHAR(20),@AccountReceivable) 
				+ ''') SET dYtc = dYtc - ' + CONVERT(NVARCHAR(20),@TotalPaymentAmount) ;
			EXEC (@cmd)



	END TRY
	BEGIN CATCH 
			DECLARE @ErrorNumber INT,@ErrorProcedure NVARCHAR(200),@ErrorLine INT,@ErrorMessage NVARCHAR(4000)

			SELECT @ErrorNumber = ERROR_NUMBER()
			,@ErrorProcedure = ERROR_PROCEDURE()
			,@ErrorLine = ERROR_LINE()
			,@ErrorMessage = ERROR_MESSAGE()

			INSERT [BHEDI].[dbo].[tblErrorLog](LogDate,TradingPartnerNo_FK,TransactionSetNo_FK,TransactionRawDataNo_FK,ErrorMessage,LogType)
			VALUES(GETDATE(),NULL,NULL,NULL,LEFT(@ErrorMessage + ' at line: ' + CONVERT(NVARCHAR(10),@ErrorLine),200),2)

	END CATCH

END
GO
/****** Object:  StoredProcedure [dbo].[s_ASN_GetEDI]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[s_ASN_GetEDI] 
	
	@ItemID NVARCHAR(50),
	@OrderNumber NVARCHAR(50),
	@PONumber NVARCHAR(50)
	
	AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	-- For Cooper Standard and Magna
	-- 830 Line Item Assign ID 
	DECLARE @ItemAssignedID830 NVARCHAR(50),@RefLotNum NVARCHAR(20),@RefLotSeq NVARCHAR(20);

	SELECT  TOP 1 @ItemAssignedID830 = l.SubLineAssignID,@RefLotNum = DK.RefNum,@RefLotSeq=ISNULL(LF.RefNum,'00001') FROM tblEDI_830_Line AS l 
		LEFT JOIN tblEDI_830_Ref AS DK ON l.LineKey = DK.LineKey AND DK.RefQual = 'DK'
		LEFT JOIN tblEDI_830_Ref AS LF ON l.LineKey = DK.LineKey AND LF.RefQual = 'LF'
		
		WHERE BuyersPartID = @ItemID AND (PONum = @PONumber OR PONum = @OrderNumber)
	ORDER BY l.No DESC

	-- For Polaris
	DECLARE @RoutingQual NVARCHAR(50),@RouteOrder NVARCHAR(50),@PTransMethod NVARCHAR(50),@RouteRef NVARCHAR(50),@PEquipNumber NVARCHAR(50),@SealNumber NVARCHAR(50),@PLocationQual NVARCHAR(50),@PLocationID NVARCHAR(50);
	DECLARE @ItemAssignedID862 NVARCHAR(50),@FinalDeliveryHouse NVARCHAR(20);
	SET @FinalDeliveryHouse = '';

	SELECT TOP 1 @RoutingQual = SCACCodeQual, @RouteRef = RoutingSeqCode, @RouteOrder = Routing,@PTransMethod = TransMethodTypeCode, @PEquipNumber =EquipDescCode,
				@SealNumber = EquipNum,@PLocationQual = LocationQual, @PLocationID = LocationID, @ItemAssignedID862 = AssignedID
		FROM tblEDI_862_Line WHERE BuyersPartID = @ItemID AND (DCPartLevel = @PONumber OR DCPartLevel = @OrderNumber)
		ORDER BY [No] DESC

	-- For CNH
	DECLARE @RefCSCNQual NVARCHAR(10),@RefCSCN NVARCHAR(10),@ReturnableContainerQual NVARCHAR(10),@ReturnableContainer NVARCHAR(50),@StandardPackQtyIDQual NVARCHAR(10),@StandardParkQty NVARCHAR(10);
	DECLARE @ProjectNum NVARCHAR(10), @ReleaseNumber NVARCHAR(10);
	SET @RefCSCNQual = 'ZZ';
	SET @RefCSCN = 'CSCN';
	SET @ReturnableContainerQual = '';
	SET @ReturnableContainer = '';
	SET @StandardPackQtyIDQual = '';
	SET @StandardParkQty = '';
	SET @ReleaseNumber = '';
	SET @ProjectNum= '';

	--- For ASC
	DECLARE @POLineNum NVARCHAR(50),@DrawingRevisionQual NVARCHAR(10),@DrawingRevision NVARCHAR(50);
	SELECT  TOP 1 @POLineNum = POLineNum,@DrawingRevisionQual = DCPartLevelQual,@DrawingRevision=DCPartLevel FROM tblEDI_850_Header AS h INNER JOIN tblEDI_850_Line AS l ON h.HdrKey = l.HdrKey 
	WHERE BuyersPartID = @ItemID AND (l.PONum = @PONumber OR h.PONum = @PONumber)
	ORDER BY l.No DESC

	-- For GM
	DECLARE @LocationID NVARCHAR(50);
	SELECT TOP 1 @LocationID = r.RefNum FROM tblEDI_830_Line AS l INNER JOIN tblEDI_830_REF AS r ON l.HdrKey = r.HdrKey AND l.LineKey = r.LineKey 
		WHERE BuyersPartID = @ItemID AND r.RefQual = '11' ORDER BY l.No desc
	IF ISNULL(@LocationID,'') = '' 
		SELECT TOP 1 @LocationID = r.RefNum FROM tblEDI_862_Line AS l INNER JOIN tblEDI_862_REF AS r ON l.HdrKey = r.HdrKey AND l.LineKey = r.LineKey 
		WHERE BuyersPartID = @ItemID AND r.RefQual = '11' ORDER BY l.No desc


	SELECT @ItemAssignedID830 AS ItemAssignedID830,@RefLotNum AS RefLotNum ,@RefLotSeq AS RefLotSeq, @RoutingQual AS RoutingQual,@RouteOrder AS RouteOrder,@PTransMethod AS PTransMethod
		,@RouteRef AS RouteRef,@PEquipNumber AS PEquipNumber,@SealNumber AS SealNumber,@PLocationQual AS PLocationQual,@PLocationID AS PLocationID,@ItemAssignedID862 AS ItemAssignedID862,@FinalDeliveryHouse AS FinalDeliveryHouse 
		,@RefCSCNQual AS RefCSCNQual,@RefCSCN AS RefCSCN,@ReturnableContainerQual AS ReturnableContainerQual,@ReturnableContainer AS ReturnableContainer,@StandardPackQtyIDQual AS StandardPackQtyIDQual
		,@StandardParkQty AS StandardParkQty,@ProjectNum AS ProjectNum,@ReleaseNumber AS ReleaseNumber,@POLineNum AS POLineNum,@DrawingRevisionQual AS DrawingRevisionQual,@DrawingRevision AS DrawingRevision
		,@LocationID AS LocationID
		

END

GO
/****** Object:  StoredProcedure [dbo].[s_EDI_Trigger_HDR_142_DupCheck]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[s_EDI_Trigger_HDR_142_DupCheck] 
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

UPDATE tblEDI_142_Header SET GSReceiverID = M.GSReceiverID,ISASenderID = M.ISASenderID,SubmitDateTime = M.SubmitDateTime,GSControlNum = m.GSControlNum,
ISAControlNum = ISNULL(p.ISAControlNum,m.ISAControlNum),GSSenderID = m.GSSenderID, GeneratedDateTime = M.GeneratedDateTime
FROM tblEDI_142_Header AS P INNER JOIN 
(
	SELECT ISASenderID,SubmitDateTime,GSControlNum,GSReceiverID,GSSenderID,[NO],ISAControlNum,GeneratedDateTime
	FROM tblEDI_142_Header
	WHERE DateDiff(Day,DateAdded,GETDATE()) = 0 
	AND [NO] = (SELECT MAX([NO]) FROM  tblEDI_142_Header WHERE DateDiff(Day,DateAdded,GETDATE()) = 0 AND ISNULL(ISASenderID,'') <> '')
) AS M ON P.[NO] > M.[NO]

WHERE DateDiff(Day,P.DateAdded,GETDATE()) = 0 AND ISNULL(P.ISASenderID,'') = '' 

UPDATE                h3
SET                          blnRepFlag = 0
FROM                     dbo.f_EDI_142_DupCheck_1() AS h1 LEFT OUTER JOIN
                                  dbo.f_EDI_142_DupCheck_2() AS h2 ON h1.ISAControlNum = h2.ISAControlNum AND h1.GSControlNum = h2.GSControlNum AND 
                                  h1.TransSetControlNum = h2.TransSetControlNum AND h1.GSReceiverID = h2.GSReceiverID INNER JOIN
                                  tblEDI_142_HEADER AS h3 ON h1.HdrKey = h3.HdrKey
WHERE                   (h2.ISAControlNum IS NULL) AND (h2.GSControlNum IS NULL) AND (h2.TransSetControlNum IS NULL)

END


GO
/****** Object:  StoredProcedure [dbo].[s_EDI_Trigger_HDR_4095_DupCheck]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[s_EDI_Trigger_HDR_4095_DupCheck] 
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;



UPDATE                h3
SET                          blnRepFlag = 0
FROM                     dbo.f_EDI_4095_DupCheck_1() AS h1 LEFT OUTER JOIN
                                  dbo.f_EDI_4095_DupCheck_2() AS h2 ON h1.TransmissionNumberOld = h2.TransmissionNumberOld AND h1.TransmissionNumberNew = h2.TransmissionNumberNew AND 
                                 h1.ReceiverID = h2.ReceiverID AND h1.SenderID = h2.SenderID INNER JOIN
                                  tblEDI_4095_HEADER AS h3 ON h1.HdrKey = h3.HdrKey
WHERE                   (h2.TransmissionNumberOld IS NULL) AND (h2.TransmissionNumberNew IS NULL)

END

GO
/****** Object:  StoredProcedure [dbo].[s_EDI_Trigger_HDR_810_DupCheck]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[s_EDI_Trigger_HDR_810_DupCheck] 
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

UPDATE                h3
SET                          blnRepFlag = 0
FROM                     dbo.f_EDI_810_DupCheck_1() AS h1 LEFT OUTER JOIN
                                  dbo.f_EDI_810_DupCheck_2() AS h2 ON h1.ISAControlNum = h2.ISAControlNum AND h1.GSControlNum = h2.GSControlNum AND 
                                  h1.TransSetControlNum = h2.TransSetControlNum AND h1.GSReceiverID = h2.GSReceiverID INNER JOIN
                                  tblEDI_810_HEADER AS h3 ON h1.HdrKey = h3.HdrKey
WHERE                   (h2.ISAControlNum IS NULL) AND (h2.GSControlNum IS NULL) AND (h2.TransSetControlNum IS NULL)

END

GO
/****** Object:  StoredProcedure [dbo].[s_EDI_Trigger_HDR_812_DupCheck]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[s_EDI_Trigger_HDR_812_DupCheck] 
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;


UPDATE                h3
SET                          blnRepFlag = 0
FROM                     dbo.f_EDI_812_DupCheck_1() AS h1 LEFT OUTER JOIN
                                  dbo.f_EDI_812_DupCheck_2() AS h2 ON h1.ISAControlNum = h2.ISAControlNum AND h1.GSControlNum = h2.GSControlNum AND 
                                  h1.TransSetControlNum = h2.TransSetControlNum AND h1.GSReceiverID = h2.GSReceiverID AND h1.ISASenderID = h2.ISASenderID AND h1.ISASenderID = h2.ISASenderID  INNER JOIN
                                  tblEDI_812_HEADER AS h3 ON h1.HdrKey = h3.HdrKey
WHERE                   (h2.ISAControlNum IS NULL) AND (h2.GSControlNum IS NULL) AND (h2.TransSetControlNum IS NULL)

END

GO
/****** Object:  StoredProcedure [dbo].[s_EDI_Trigger_HDR_820_DupCheck]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






CREATE PROCEDURE [dbo].[s_EDI_Trigger_HDR_820_DupCheck] 
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

-- For Toyota, sometime they send data as multi release in one EDI file
-- KPA for USA
UPDATE tblEDI_820_Header SET GSReceiverID = M.GSReceiverID,ISASenderID = M.ISASenderID,SubmitDateTime = M.SubmitDateTime,GeneratedDateTime = M.GeneratedDateTime
  ,GSSenderID = m.GSSenderID,ISAControlNum = M.ISAControlNum,GSControlNum = M.GSControlNum
FROM tblEDI_820_Header AS P INNER JOIN 
(
	SELECT ISASenderID,SubmitDateTime,GSControlNum,GSReceiverID,GSSenderID,[NO],GeneratedDateTime,RemittanceDate,ISAControlNum
	FROM tblEDI_820_Header
	WHERE ISASenderID IN ('961659588') AND DateDiff(Day,DateAdded,GETDATE()) = 0 AND GSSenderID IN ('961659588') AND GSReceiverID IN( '616818696-69700')
	AND [NO] = (SELECT MIN([NO]) FROM  tblEDI_820_Header WHERE ISASenderID IN ('961659588') AND DateDiff(Day,DateAdded,GETDATE()) = 0 AND GSSenderID IN ('961659588') AND GSReceiverID IN( '616818696-69700'))
) AS M ON P.[NO] > M.[NO] AND P.ISASenderID = M.ISASenderID AND P.GSReceiverID = M.GSReceiverID 

WHERE DateDiff(Day,P.DateAdded,GETDATE()) = 0 AND ISNULL(P.SubmitDateTime,'') = '' 

-- UMD for USA
UPDATE tblEDI_820_Header SET GSReceiverID = M.GSReceiverID,ISASenderID = M.ISASenderID,SubmitDateTime = M.SubmitDateTime,GeneratedDateTime = M.GeneratedDateTime
  ,GSSenderID = m.GSSenderID,ISAControlNum = M.ISAControlNum,GSControlNum = M.GSControlNum
FROM tblEDI_820_Header AS P INNER JOIN 
(
	SELECT ISASenderID,SubmitDateTime,GSControlNum,GSReceiverID,GSSenderID,[NO],GeneratedDateTime,RemittanceDate,ISAControlNum
	FROM tblEDI_820_Header
	WHERE ISASenderID IN ('961659588') AND DateDiff(Day,DateAdded,GETDATE()) = 0 AND GSSenderID IN ('961659588') AND GSReceiverID IN('020774709-10250')
	AND [NO] = (SELECT MIN([NO]) FROM  tblEDI_820_Header WHERE ISASenderID IN ('961659588') AND DateDiff(Day,DateAdded,GETDATE()) = 0 AND GSSenderID IN ('961659588') AND GSReceiverID IN('020774709-10250'))
) AS M ON P.[NO] > M.[NO] AND P.ISASenderID = M.ISASenderID AND P.GSReceiverID = M.GSReceiverID 

WHERE DateDiff(Day,P.DateAdded,GETDATE()) = 0 AND ISNULL(P.SubmitDateTime,'') = '' 


-- KPA Canada
UPDATE tblEDI_820_Header SET GSReceiverID = M.GSReceiverID,ISASenderID = M.ISASenderID,SubmitDateTime = M.SubmitDateTime,GeneratedDateTime = M.GeneratedDateTime
  ,GSSenderID = m.GSSenderID,ISAControlNum = M.ISAControlNum,GSControlNum = M.GSControlNum
FROM tblEDI_820_Header AS P INNER JOIN 
(
	SELECT ISASenderID,SubmitDateTime,GSControlNum,GSReceiverID,GSSenderID,[NO],GeneratedDateTime,RemittanceDate,ISAControlNum
	FROM tblEDI_820_Header
	WHERE ISASenderID IN ('247267594') AND DateDiff(Day,DateAdded,GETDATE()) = 0 AND GSSenderID IN ('247267594') AND GSReceiverID = '616818696-69700'
	AND [NO] = (SELECT MAX([NO]) FROM  tblEDI_820_Header WHERE ISASenderID IN ('247267594') AND DateDiff(Day,DateAdded,GETDATE()) = 0 AND GSSenderID IN ('247267594') AND GSReceiverID = '616818696-69700')
) AS M ON P.[NO] > M.[NO] AND P.ISASenderID = M.ISASenderID AND P.GSReceiverID = M.GSReceiverID 

WHERE DateDiff(Day,P.DateAdded,GETDATE()) = 0 AND ISNULL(P.SubmitDateTime,'') = '' 



UPDATE                h3
SET                          blnRepFlag = 0
FROM                     dbo.f_EDI_820_DupCheck_1() AS h1 LEFT OUTER JOIN
                                  dbo.f_EDI_820_DupCheck_2() AS h2 ON h1.ISAControlNum = h2.ISAControlNum AND h1.GSControlNum = h2.GSControlNum AND 
                                  h1.TransSetControlNum = h2.TransSetControlNum AND h1.GSReceiverID = h2.GSReceiverID INNER JOIN
                                  tblEDI_820_HEADER AS h3 ON h1.HdrKey = h3.HdrKey
WHERE                   (h2.ISAControlNum IS NULL) AND (h2.GSControlNum IS NULL) AND (h2.TransSetControlNum IS NULL)

END





GO
/****** Object:  StoredProcedure [dbo].[s_EDI_Trigger_HDR_824_DupCheck]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[s_EDI_Trigger_HDR_824_DupCheck] 
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

UPDATE                h3
SET                          blnRepFlag = 0
FROM                     dbo.f_EDI_824_DupCheck_1() AS h1 LEFT OUTER JOIN
                                  dbo.f_EDI_824_DupCheck_2() AS h2 ON h1.ISAControlNum = h2.ISAControlNum AND h1.GSControlNum = h2.GSControlNum AND 
                                  h1.TransSetControlNum = h2.TransSetControlNum AND h1.GSReceiverID = h2.GSReceiverID INNER JOIN
                                  tblEDI_824_HEADER AS h3 ON h1.HdrKey = h3.HdrKey
WHERE                   (h2.ISAControlNum IS NULL) AND (h2.GSControlNum IS NULL) AND (h2.TransSetControlNum IS NULL)

END

GO
/****** Object:  StoredProcedure [dbo].[s_EDI_Trigger_HDR_830_DupCheck]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE PROCEDURE [dbo].[s_EDI_Trigger_HDR_830_DupCheck] 
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

-- For Faurecia Automotive, sometime they send data as multi release in one EDI file
UPDATE tblEDI_830_Header SET GSReceiverID = M.GSReceiverID,ISASenderID = M.ISASenderID,SubmitDateTime = M.SubmitDateTime,GSControlNum = m.GSControlNum,ReleaseNumber = ReleaseNumber + '-' + ISAControlNum
FROM tblEDI_830_Header AS P INNER JOIN 
(
	SELECT ISASenderID,SubmitDateTime,GSControlNum,GSReceiverID,GSSenderID,[NO]
	FROM tblEDI_830_Header
	WHERE ISASenderID IN ('966268034') AND DateDiff(Day,DateAdded,GETDATE()) = 0 AND GSSenderID IN ('966268034') AND GSReceiverID = '2489940295'
	AND [NO] = (SELECT MIN([NO]) FROM  tblEDI_830_Header WHERE ISASenderID IN ('966268034') AND DateDiff(Day,DateAdded,GETDATE()) = 0 AND GSSenderID IN ('966268034') AND GSReceiverID = '2489940295')
) AS M ON P.[NO] > M.[NO] AND P.ISASenderID = M.ISASenderID AND P.GSReceiverID = M.GSReceiverID 

WHERE DateDiff(Day,P.DateAdded,GETDATE()) = 0 AND ISNULL(P.SubmitDateTime,'') = '' AND P.GSSenderID IN  ('966268034')

-- Faurecia Mexico
UPDATE tblEDI_830_Header SET GSReceiverID = M.GSReceiverID,ISASenderID = M.ISASenderID,SubmitDateTime = M.SubmitDateTime,GSControlNum = m.GSControlNum,ReleaseNumber = ReleaseNumber + '-' + ISAControlNum
FROM tblEDI_830_Header AS P INNER JOIN 
(
	SELECT ISASenderID,SubmitDateTime,GSControlNum,GSReceiverID,GSSenderID,[NO]
	FROM tblEDI_830_Header
	WHERE ISASenderID IN ('812750889','811403062') AND DateDiff(Day,DateAdded,GETDATE()) = 0 AND GSSenderID IN ('812750889','811403062') AND GSReceiverID = '2489940295'
	AND [NO] = (SELECT MIN([NO]) FROM  tblEDI_830_Header WHERE ISASenderID IN ('812750889','811403062') AND DateDiff(Day,DateAdded,GETDATE()) = 0 AND GSSenderID IN ('812750889','811403062') AND GSReceiverID = '2489940295')
) AS M ON P.[NO] > M.[NO] AND P.ISASenderID = M.ISASenderID AND P.GSReceiverID = M.GSReceiverID 

WHERE DateDiff(Day,P.DateAdded,GETDATE()) = 0 AND ISNULL(P.SubmitDateTime,'') = '' AND P.GSSenderID IN  ('812750889','811403062')

-- GM 
UPDATE tblEDI_830_Header SET GSReceiverID = M.GSReceiverID,ISASenderID = M.ISASenderID,SubmitDateTime = M.SubmitDateTime,GSControlNum = m.GSControlNum,ReleaseNumber = ReleaseNumber + '-' + ISAControlNum
FROM tblEDI_830_Header AS P INNER JOIN 
(
	SELECT ISASenderID,SubmitDateTime,GSControlNum,GSReceiverID,GSSenderID,[NO]
	FROM tblEDI_830_Header
	WHERE ISASenderID IN ('O00130000FREUDFITACC') AND DateDiff(Day,DateAdded,GETDATE()) = 0 AND GSSenderID IN ('O00130000FREUDFITACC') AND GSReceiverID = '2489940296'
	AND [NO] = (SELECT MAX([NO]) FROM  tblEDI_830_Header WHERE ISASenderID IN ('O00130000FREUDFITACC') AND DateDiff(Day,DateAdded,GETDATE()) = 0 AND GSSenderID IN ('O00130000FREUDFITACC') AND GSReceiverID = '2489940296')
) AS M ON P.GSSenderID = M.GSSenderID AND P.[NO] > M.[NO]

WHERE DateDiff(Day,P.DateAdded,GETDATE()) = 0 AND ISNULL(P.SubmitDateTime,'') = '' AND P.GSSenderID IN  ('O00130000FREUDFITACC')



-- Nissan Service
UPDATE tblEDI_830_Header SET GSReceiverID = M.GSReceiverID,ISASenderID = M.ISASenderID,SubmitDateTime = M.SubmitDateTime,GSControlNum = m.GSControlNum,ISAControlNum = M.ISAControlNum,GSSenderID = M.GSSenderID
FROM tblEDI_830_Header AS P INNER JOIN 
(
	SELECT ISASenderID,SubmitDateTime,GSControlNum,GSReceiverID,GSSenderID,[NO],ISAControlNum
	FROM tblEDI_830_Header
	WHERE ISASenderID IN ('9013444134','9013444134TST') AND DateDiff(Day,DateAdded,GETDATE()) = 0 AND GSSenderID IN ('9013444134TST','9013444134') AND GSReceiverID = '2489940295'
	AND [NO] = (SELECT MIN([NO]) FROM  tblEDI_830_Header WHERE ISASenderID IN ('9013444134','9013444134TST') AND DateDiff(Day,DateAdded,GETDATE()) = 0 AND GSSenderID IN ('9013444134','9013444134TST') AND GSReceiverID = '2489940295')
) AS M ON P.[NO] > M.[NO] AND P.ISASenderID = M.ISASenderID AND P.GSReceiverID = M.GSReceiverID 

WHERE DateDiff(Day,P.DateAdded,GETDATE()) = 0 AND ISNULL(P.SubmitDateTime ,'') = ''

-- Spartan
UPDATE tblEDI_830_Header SET GSReceiverID = M.GSReceiverID,ISASenderID = M.ISASenderID,SubmitDateTime = M.SubmitDateTime,GSControlNum = m.GSControlNum,ISAControlNum = M.ISAControlNum,GSSenderID = M.GSSenderID,
					ReleaseNumber = ReleaseNumber + '-' + TransSetControlNum
FROM tblEDI_830_Header AS P INNER JOIN 
(
	SELECT ISASenderID,SubmitDateTime,GSControlNum,GSReceiverID,GSSenderID,[NO],ISAControlNum
	FROM tblEDI_830_Header
	WHERE ISASenderID IN ('SPARTAN-SP') AND DateDiff(Day,DateAdded,GETDATE()) = 0 AND GSSenderID IN ('SPARTAN-SP') AND GSReceiverID = '2489940295'
	AND [NO] = (SELECT MIN([NO]) FROM  tblEDI_830_Header WHERE ISASenderID IN ('SPARTAN-SP') AND DateDiff(Day,DateAdded,GETDATE()) = 0 AND GSSenderID IN ('SPARTAN-SP') AND GSReceiverID = '2489940295')
) AS M ON P.[NO] > M.[NO] AND P.ISASenderID = M.ISASenderID AND P.GSReceiverID = M.GSReceiverID 
WHERE DateDiff(Day,P.DateAdded,GETDATE()) = 0 AND ISNULL(P.SubmitDateTime,'') = ''


-- TMS
UPDATE tblEDI_830_Header SET GSReceiverID = M.GSReceiverID,ISASenderID = M.ISASenderID,SubmitDateTime = M.SubmitDateTime,GSControlNum = m.GSControlNum,ISAControlNum = M.ISAControlNum,GSSenderID = M.GSSenderID
					--ReleaseNumber = ReleaseNumber + '-' + TransSetControlNum
FROM tblEDI_830_Header AS P INNER JOIN 
(
	SELECT ISASenderID,SubmitDateTime,GSControlNum,GSReceiverID,GSSenderID,[NO],ISAControlNum
	FROM tblEDI_830_Header
	WHERE ISASenderID IN ('009595505') AND DateDiff(Day,DateAdded,GETDATE()) = 0 AND GSSenderID IN ('009595505') AND GSReceiverID IN ( '079714529')
	AND [NO] = (SELECT MIN([NO]) FROM  tblEDI_830_Header WHERE ISASenderID IN ('009595505') AND DateDiff(Day,DateAdded,GETDATE()) = 0 AND GSSenderID IN ('009595505') AND GSReceiverID IN ( '079714529'))
) AS M ON P.[NO] > M.[NO] AND P.ISASenderID = M.ISASenderID AND P.GSReceiverID = M.GSReceiverID 
WHERE DateDiff(Day,P.DateAdded,GETDATE()) = 0 AND ISNULL(P.SubmitDateTime,'') = ''

UPDATE tblEDI_830_Header SET GSReceiverID = M.GSReceiverID,ISASenderID = M.ISASenderID,SubmitDateTime = M.SubmitDateTime,GSControlNum = m.GSControlNum,ISAControlNum = M.ISAControlNum,GSSenderID = M.GSSenderID
					--ReleaseNumber = ReleaseNumber + '-' + TransSetControlNum
FROM tblEDI_830_Header AS P INNER JOIN 
(
	SELECT ISASenderID,SubmitDateTime,GSControlNum,GSReceiverID,GSSenderID,[NO],ISAControlNum
	FROM tblEDI_830_Header
	WHERE ISASenderID IN ('009595505') AND DateDiff(Day,DateAdded,GETDATE()) = 0 AND GSSenderID IN ('009595505') AND GSReceiverID IN ('174912642','17490854A')
	AND [NO] = (SELECT MIN([NO]) FROM  tblEDI_830_Header WHERE ISASenderID IN ('009595505') AND DateDiff(Day,DateAdded,GETDATE()) = 0 AND GSSenderID IN ('009595505') AND GSReceiverID IN ('174912642','17490854A'))
) AS M ON P.[NO] > M.[NO] AND P.ISASenderID = M.ISASenderID AND P.GSReceiverID = M.GSReceiverID 
WHERE DateDiff(Day,P.DateAdded,GETDATE()) = 0 AND ISNULL(P.SubmitDateTime,'') = ''


UPDATE                h3
SET                          blnRepFlag = 0
FROM                     dbo.f_EDI_830_DupCheck_1() AS h1 LEFT OUTER JOIN
                                  dbo.f_EDI_830_DupCheck_2() AS h2 ON h1.ISAControlNum = h2.ISAControlNum AND h1.GSControlNum = h2.GSControlNum AND 
                                  h1.TransSetControlNum = h2.TransSetControlNum AND h1.GSReceiverID = h2.GSReceiverID AND h1.ISASenderID = h2.ISASenderID AND h1.ISASenderID = h2.ISASenderID AND h1.ReleaseNumber = h2.ReleaseNumber INNER JOIN
                                  tblEDI_830_HEADER AS h3 ON h1.HdrKey = h3.HdrKey
WHERE                   (h2.ISAControlNum IS NULL) AND (h2.GSControlNum IS NULL) AND (h2.TransSetControlNum IS NULL)

END



















GO
/****** Object:  StoredProcedure [dbo].[s_EDI_Trigger_HDR_832_DupCheck]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[s_EDI_Trigger_HDR_832_DupCheck] 
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

UPDATE                h3
SET                          blnRepFlag = 0
FROM                     dbo.f_EDI_832_DupCheck_1() AS h1 LEFT OUTER JOIN
                                  dbo.f_EDI_832_DupCheck_2() AS h2 ON h1.ISAControlNum = h2.ISAControlNum AND h1.GSControlNum = h2.GSControlNum AND 
                                  h1.TransSetControlNum = h2.TransSetControlNum AND h1.GSReceiverID = h2.GSReceiverID INNER JOIN
                                  tblEDI_832_HEADER AS h3 ON h1.HdrKey = h3.HdrKey
WHERE                   (h2.ISAControlNum IS NULL) AND (h2.GSControlNum IS NULL) AND (h2.TransSetControlNum IS NULL)

END

GO
/****** Object:  StoredProcedure [dbo].[s_EDI_Trigger_HDR_846_DupCheck]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[s_EDI_Trigger_HDR_846_DupCheck] 
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

UPDATE                h3
SET                          blnRepFlag = 0
FROM                     dbo.f_EDI_846_DupCheck_1() AS h1 LEFT OUTER JOIN
                                  dbo.f_EDI_846_DupCheck_2() AS h2 ON h1.ISAControlNum = h2.ISAControlNum AND h1.GSControlNum = h2.GSControlNum AND 
                                  h1.TransSetControlNum = h2.TransSetControlNum AND h1.GSReceiverID = h2.GSReceiverID INNER JOIN
                                  tblEDI_846_HEADER AS h3 ON h1.HdrKey = h3.HdrKey
WHERE                   (h2.ISAControlNum IS NULL) AND (h2.GSControlNum IS NULL) AND (h2.TransSetControlNum IS NULL)

END

GO
/****** Object:  StoredProcedure [dbo].[s_EDI_Trigger_HDR_850_DupCheck]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE PROCEDURE [dbo].[s_EDI_Trigger_HDR_850_DupCheck] 
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

--UPDATE tblEDI_850_Header SET GSReceiverID = M.GSReceiverID,ISASenderID = M.ISASenderID,SubmitDateTime = M.SubmitDateTime,GSControlNum = m.GSControlNum,
--                             ISAControlNum = M.ISAControlNum, GSSenderID = M.GSSenderID
--FROM tblEDI_850_Header AS P INNER JOIN 
--(
--	SELECT ISASenderID,SubmitDateTime,GSControlNum,GSReceiverID,GSSenderID,[NO],ISAControlNum
--	FROM tblEDI_850_Header
--	WHERE ISNULL(ISASenderID,'') <> '' AND DateDiff(Day,DateAdded,GETDATE()) = 0 
--	AND [NO] = (SELECT MAX([NO]) FROM  tblEDI_850_Header WHERE ISNULL(ISASenderID,'') <> '' AND DateDiff(Day,DateAdded,GETDATE()) = 0)
--) AS M ON P.[NO] > M.[NO]
--
--WHERE DateDiff(Day,P.DateAdded,GETDATE()) = 0 AND ISNULL(P.ISASenderID,'') = '' AND ISNULL(P.GSSenderID,'') = '' 

UPDATE                h3
SET                          blnRepFlag = 0
FROM                     dbo.f_EDI_850_DupCheck_1() AS h1 LEFT OUTER JOIN
                                  dbo.f_EDI_850_DupCheck_2() AS h2 ON h1.ISAControlNum = h2.ISAControlNum AND h1.GSControlNum = h2.GSControlNum AND 
                                  h1.TransSetControlNum = h2.TransSetControlNum AND h1.GSReceiverID = h2.GSReceiverID AND h1.ISASenderID = h2.ISASenderID INNER JOIN
                                  tblEDI_850_HEADER AS h3 ON h1.HdrKey = h3.HdrKey
WHERE                   (h2.ISAControlNum IS NULL) AND (h2.GSControlNum IS NULL) AND (h2.TransSetControlNum IS NULL)

END




GO
/****** Object:  StoredProcedure [dbo].[s_EDI_Trigger_HDR_856_DupCheck]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO







CREATE PROCEDURE [dbo].[s_EDI_Trigger_HDR_856_DupCheck] 
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

-- TAKAHATA
UPDATE tblEDI_856_Header SET GSReceiverID = M.GSReceiverID,ISASenderID = M.ISASenderID,SubmitDateTime = M.SubmitDateTime,GSControlNum = m.GSControlNum,
GeneratedDateTime = M.GeneratedDateTime,ISAControlNum = M.ISAControlNum,GSSenderID = M.GSSenderID
FROM tblEDI_856_Header AS P INNER JOIN 
(
	SELECT ISASenderID,SubmitDateTime,GSControlNum,GSReceiverID,GSSenderID,[NO],ISAControlNum,GeneratedDateTime
	FROM tblEDI_856_Header
	WHERE ISASenderID IN ('4232868100') AND DateDiff(Day,DateAdded,GETDATE()) = 0 AND GSSenderID IN ('TAKAHATA') AND GSReceiverID = '079714529'
	AND [NO] = (SELECT MIN([NO]) FROM  tblEDI_856_Header WHERE ISASenderID IN ('4232868100') AND DateDiff(Day,DateAdded,GETDATE()) = 0 AND GSSenderID IN ('TAKAHATA') AND GSReceiverID = '079714529')
) AS M ON P.[NO] > M.[NO] AND P.ISASenderID = M.ISASenderID AND P.GSReceiverID = M.GSReceiverID 

WHERE DateDiff(Day,P.DateAdded,GETDATE()) = 0 AND ISNULL(P.SubmitDateTime,'') = ''


-- EIM, EIF and SIMRAX
UPDATE tblEDI_856_Header SET GSReceiverID = M.GSReceiverID,ISASenderID = M.ISASenderID,SubmitDateTime = M.SubmitDateTime,GSControlNum = m.GSControlNum,
GeneratedDateTime = M.GeneratedDateTime,ISAControlNum = M.ISAControlNum,GSSenderID = M.GSSenderID
FROM tblEDI_856_Header AS P INNER JOIN 
(
	SELECT ISASenderID,SubmitDateTime,GSControlNum,GSReceiverID,GSSenderID,[NO],ISAControlNum,GeneratedDateTime
	FROM tblEDI_856_Header
	WHERE ISASenderID IN ('E90A2','ECARFRN','78664803E90') AND DateDiff(Day,DateAdded,GETDATE()) = 0 
	AND [NO] = (SELECT MIN([NO]) FROM  tblEDI_856_Header WHERE ISASenderID IN ('E90A2','ECARFRN','78664803E90') AND DateDiff(Day,DateAdded,GETDATE()) = 0)
) AS M ON P.[NO] > M.[NO] AND P.ISASenderID = M.ISASenderID AND P.GSReceiverID = M.GSReceiverID 

WHERE DateDiff(Day,P.DateAdded,GETDATE()) = 0 AND ISNULL(P.SubmitDateTime,'') = ''





UPDATE                h3
SET                          blnRepFlag = 0
FROM                     dbo.f_EDI_856_DupCheck_1() AS h1 LEFT OUTER JOIN
                                  dbo.f_EDI_856_DupCheck_2() AS h2 ON h1.ISAControlNum = h2.ISAControlNum AND h1.GSControlNum = h2.GSControlNum AND 
                                  h1.TransSetControlNum = h2.TransSetControlNum AND h1.GSReceiverID = h2.GSReceiverID INNER JOIN
                                  tblEDI_856_HEADER AS h3 ON h1.HdrKey = h3.HdrKey
WHERE                   (h2.ISAControlNum IS NULL) AND (h2.GSControlNum IS NULL) AND (h2.TransSetControlNum IS NULL)

END







GO
/****** Object:  StoredProcedure [dbo].[s_EDI_Trigger_HDR_860_DupCheck]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[s_EDI_Trigger_HDR_860_DupCheck] 
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

--
--UPDATE tblEDI_860_Header SET GSReceiverID = M.GSReceiverID,ISASenderID = M.ISASenderID,SubmitDateTime = M.SubmitDateTime,
--		GSControlNum = m.GSControlNum,GeneratedDateTime = M.GeneratedDateTime,ISAControlNum = M.ISAControlNum
--		,GSSenderID = M.GSSenderID
--FROM tblEDI_860_Header AS P INNER JOIN 
--(
--	SELECT ISASenderID,SubmitDateTime,GSControlNum,GSReceiverID,GSSenderID,[NO],GeneratedDateTime,ISAControlNum 
--	FROM tblEDI_860_Header
--	WHERE ISASenderID IN ('3304991210') AND DateDiff(Day,DateAdded,GETDATE()) = 0 AND GSSenderID IN ('3304991210') AND GSReceiverID = '2489940295'
--	AND [NO] = (SELECT MAX([NO]) FROM  tblEDI_860_Header WHERE ISASenderID IN ('3304991210') AND DateDiff(Day,DateAdded,GETDATE()) = 0 AND GSSenderID IN ('3304991210') AND GSReceiverID = '2489940295')
--) AS M ON P.[NO] > M.[NO] AND ISNULL(P.ISASenderID,'') = ''



UPDATE                h3
SET                          blnRepFlag = 0
FROM                     dbo.f_EDI_860_DupCheck_1() AS h1 LEFT OUTER JOIN
                                  dbo.f_EDI_860_DupCheck_2() AS h2 ON h1.ISAControlNum = h2.ISAControlNum AND h1.GSControlNum = h2.GSControlNum AND 
                                  h1.TransSetControlNum = h2.TransSetControlNum AND h1.GSReceiverID = h2.GSReceiverID INNER JOIN
                                  tblEDI_860_HEADER AS h3 ON h1.HdrKey = h3.HdrKey
WHERE                   (h2.ISAControlNum IS NULL) AND (h2.GSControlNum IS NULL) AND (h2.TransSetControlNum IS NULL)

END



GO
/****** Object:  StoredProcedure [dbo].[s_EDI_Trigger_HDR_861_DupCheck]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[s_EDI_Trigger_HDR_861_DupCheck] 
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

UPDATE                h3
SET                          blnRepFlag = 0
FROM                     dbo.f_EDI_861_DupCheck_1() AS h1 LEFT OUTER JOIN
                                  dbo.f_EDI_861_DupCheck_2() AS h2 ON h1.ISAControlNum = h2.ISAControlNum AND h1.GSControlNum = h2.GSControlNum AND 
                                  h1.TransSetControlNum = h2.TransSetControlNum AND h1.GSReceiverID = h2.GSReceiverID INNER JOIN
                                  tblEDI_861_HEADER AS h3 ON h1.HdrKey = h3.HdrKey
WHERE                   (h2.ISAControlNum IS NULL) AND (h2.GSControlNum IS NULL) AND (h2.TransSetControlNum IS NULL)

END

GO
/****** Object:  StoredProcedure [dbo].[s_EDI_Trigger_HDR_862_DupCheck]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO











CREATE PROCEDURE [dbo].[s_EDI_Trigger_HDR_862_DupCheck] 
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;


-- GM 
UPDATE tblEDI_862_Header SET GSReceiverID = M.GSReceiverID,ISASenderID = M.ISASenderID,SubmitDateTime = M.SubmitDateTime,GSControlNum = m.GSControlNum,ReleaseNumber = ReleaseNumber + '-' + ISAControlNum
FROM tblEDI_862_Header AS P INNER JOIN 
(
	SELECT ISASenderID,SubmitDateTime,GSControlNum,GSReceiverID,GSSenderID,[NO]
	FROM tblEDI_862_Header
	WHERE ISASenderID IN ('O00130000FREUDFITACC') AND DateDiff(Day,DateAdded,GETDATE()) = 0 AND GSSenderID IN ('O00130000FREUDFITACC') AND GSReceiverID = '2489940296'
	AND [NO] = (SELECT MAX([NO]) FROM  tblEDI_862_Header WHERE ISASenderID IN ('O00130000FREUDFITACC') AND DateDiff(Day,DateAdded,GETDATE()) = 0 AND GSSenderID IN ('O00130000FREUDFITACC') AND GSReceiverID = '2489940296')
) AS M ON P.GSSenderID = M.GSSenderID AND P.[NO] > M.[NO]

WHERE DateDiff(Day,P.DateAdded,GETDATE()) = 0 AND ISNULL(P.SubmitDateTime,'') = '' AND P.GSSenderID IN  ('O00130000FREUDFITACC')


-- SPARTAN and TMS
UPDATE tblEDI_862_Header SET GSReceiverID = M.GSReceiverID,ISASenderID = M.ISASenderID,SubmitDateTime = M.SubmitDateTime,GSControlNum = m.GSControlNum,ISAControlNum = M.ISAControlNum, GSSenderID = M.GSSenderID
FROM tblEDI_862_Header AS P INNER JOIN 
(
	SELECT ISASenderID,SubmitDateTime,GSControlNum,GSReceiverID,GSSenderID,[NO],ISAControlNum
	FROM tblEDI_862_Header
	WHERE ISASenderID IN ('SPARTAN-SP') AND DateDiff(Day,DateAdded,GETDATE()) = 0 AND GSSenderID IN ('SPARTAN-SP') AND GSReceiverID = '2489940295'
	AND [NO] = (SELECT MIN([NO]) FROM  tblEDI_862_Header WHERE ISASenderID IN ('SPARTAN-SP') AND DateDiff(Day,DateAdded,GETDATE()) = 0 AND GSSenderID IN ('SPARTAN-SP') AND GSReceiverID = '2489940295')
) AS M ON P.[NO] > M.[NO] AND P.ISASenderID = M.ISASenderID AND P.GSReceiverID = M.GSReceiverID 

WHERE DateDiff(Day,P.DateAdded,GETDATE()) = 0 AND ISNULL(P.SubmitDateTime,'') = '' 

-- TMS
UPDATE tblEDI_862_Header SET GSReceiverID = M.GSReceiverID,ISASenderID = M.ISASenderID,SubmitDateTime = M.SubmitDateTime,GSControlNum = m.GSControlNum,ISAControlNum = M.ISAControlNum, GSSenderID = M.GSSenderID
FROM tblEDI_862_Header AS P INNER JOIN 
(
	SELECT ISASenderID,SubmitDateTime,GSControlNum,GSReceiverID,GSSenderID,[NO],ISAControlNum
	FROM tblEDI_862_Header
	WHERE ISASenderID IN ('009595505') AND DateDiff(Day,DateAdded,GETDATE()) = 0 AND GSSenderID IN ('009595505') AND GSReceiverID IN ( '079714529')
	AND [NO] = (SELECT MIN([NO]) FROM  tblEDI_862_Header WHERE ISASenderID IN ('009595505') AND DateDiff(Day,DateAdded,GETDATE()) = 0 AND GSSenderID IN ('009595505') AND GSReceiverID IN ( '079714529'))
) AS M ON P.[NO] > M.[NO] AND P.ISASenderID = M.ISASenderID AND P.GSReceiverID = M.GSReceiverID 

WHERE DateDiff(Day,P.DateAdded,GETDATE()) = 0 AND ISNULL(P.SubmitDateTime,'') = '' 


UPDATE tblEDI_862_Header SET GSReceiverID = M.GSReceiverID,ISASenderID = M.ISASenderID,SubmitDateTime = M.SubmitDateTime,GSControlNum = m.GSControlNum,ISAControlNum = M.ISAControlNum, GSSenderID = M.GSSenderID
FROM tblEDI_862_Header AS P INNER JOIN 
(
	SELECT ISASenderID,SubmitDateTime,GSControlNum,GSReceiverID,GSSenderID,[NO],ISAControlNum
	FROM tblEDI_862_Header
	WHERE ISASenderID IN ('009595505') AND DateDiff(Day,DateAdded,GETDATE()) = 0 AND GSSenderID IN ('009595505') AND GSReceiverID IN ('174912642','17490854A')
	AND [NO] = (SELECT MIN([NO]) FROM  tblEDI_862_Header WHERE ISASenderID IN ('009595505') AND DateDiff(Day,DateAdded,GETDATE()) = 0 AND GSSenderID IN ('009595505') AND GSReceiverID IN ( '174912642','17490854A'))
) AS M ON P.[NO] > M.[NO] AND P.ISASenderID = M.ISASenderID AND P.GSReceiverID = M.GSReceiverID 

WHERE DateDiff(Day,P.DateAdded,GETDATE()) = 0 AND ISNULL(P.SubmitDateTime,'') = '' 


-- polaris
	UPDATE tblEDI_862_Header SET SubmitDateTime = M.SubmitDateTime,GSControlNum = m.GSControlNum,ISAControlNum = M.ISAControlNum + '-' + PONum,GSSenderID = M.GSSenderID
	FROM tblEDI_862_Header AS P INNER JOIN 
	(
		SELECT ISASenderID,SubmitDateTime,GSControlNum,GSReceiverID,GSSenderID,[NO],ISAControlNum
		FROM tblEDI_862_Header
		WHERE ISASenderID IN ('2184632312') AND DateDiff(Day,DateAdded,GETDATE()) = 0 AND GSSenderID IN ('2184632312') AND GSReceiverID IN ('2489940295')
		AND [NO] = (SELECT MIN([NO]) FROM  tblEDI_862_Header WHERE ISASenderID IN ('2184632312') AND DateDiff(Day,DateAdded,GETDATE()) = 0 AND GSSenderID IN ('2184632312') AND GSReceiverID IN ( '2489940295'))
	) AS M ON P.[NO] > M.[NO] AND P.ISASenderID = M.ISASenderID AND P.GSReceiverID = M.GSReceiverID 

	WHERE DateDiff(Day,P.DateAdded,GETDATE()) = 0 AND ISNULL(P.SubmitDateTime,'') = '' 



UPDATE                h3
SET                          blnRepFlag = 0
FROM                     dbo.f_EDI_862_DupCheck_1() AS h1 LEFT OUTER JOIN
                                  dbo.f_EDI_862_DupCheck_2() AS h2 ON h1.ISAControlNum = h2.ISAControlNum AND h1.GSControlNum = h2.GSControlNum AND 
                                  h1.TransSetControlNum = h2.TransSetControlNum AND h1.GSReceiverID = h2.GSReceiverID AND h1.ISASenderID = h2.ISASenderID AND h1.ReleaseNumber = h2.ReleaseNumber INNER JOIN
                                  tblEDI_862_HEADER AS h3 ON h1.HdrKey = h3.HdrKey
WHERE                   (h2.ISAControlNum IS NULL) AND (h2.GSControlNum IS NULL) AND (h2.TransSetControlNum IS NULL)

END











GO
/****** Object:  StoredProcedure [dbo].[s_EDI_Trigger_HDR_864_DupCheck]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[s_EDI_Trigger_HDR_864_DupCheck] 
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

UPDATE                h3
SET                          blnRepFlag = 0
FROM                     dbo.f_EDI_864_DupCheck_1() AS h1 LEFT OUTER JOIN
                                  dbo.f_EDI_864_DupCheck_2() AS h2 ON h1.ISAControlNum = h2.ISAControlNum AND h1.GSControlNum = h2.GSControlNum AND 
                                  h1.TransSetControlNum = h2.TransSetControlNum AND h1.GSReceiverID = h2.GSReceiverID INNER JOIN
                                  tblEDI_864_HEADER AS h3 ON h1.HdrKey = h3.HdrKey
WHERE                   (h2.ISAControlNum IS NULL) AND (h2.GSControlNum IS NULL) AND (h2.TransSetControlNum IS NULL)

END

GO
/****** Object:  StoredProcedure [dbo].[s_EDI_Trigger_HDR_997_DupCheck]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE PROCEDURE [dbo].[s_EDI_Trigger_HDR_997_DupCheck] 
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;


UPDATE tblEDI_997_Header SET GSReceiverID = M.GSReceiverID,ISASenderID = M.ISASenderID,SubmitDateTime = M.SubmitDateTime,GSControlNum = m.GSControlNum,
  ISAControlNum = M.ISAControlNum + '-' + CONVERT(NVARCHAR(10),P.[NO]),GSSenderID = m.GSSenderID,TransSetID = m.TransSetID
FROM tblEDI_997_Header AS P INNER JOIN 
(
	SELECT ISASenderID,SubmitDateTime,GSControlNum,GSReceiverID,GSSenderID,[NO],ISAControlNum,TransSetID
	FROM tblEDI_997_Header
	WHERE [NO] = (SELECT MAX([NO]) FROM  tblEDI_997_Header WHERE DateDiff(Day,DateAdded,GETDATE()) = 0 AND ISNULL(ISASenderID,'') <> '')
) AS M ON  P.[NO] > M.[NO]
WHERE DateDiff(Day,P.DateAdded,GETDATE()) = 0 AND ISNULL(P.ISASenderID,'') = ''





UPDATE                h3
SET                          blnRepFlag = 0
FROM                     dbo.f_EDI_997_DupCheck_1() AS h1 LEFT OUTER JOIN
                                  dbo.f_EDI_997_DupCheck_2() AS h2 ON h1.ISAControlNum = h2.ISAControlNum AND h1.GSControlNum = h2.GSControlNum AND 
                                  h1.TransSetControlNum = h2.TransSetControlNum AND h1.GSReceiverID = h2.GSReceiverID AND h1.ISASenderID = h2.ISASenderID INNER JOIN
                                  tblEDI_997_HEADER AS h3 ON h1.HdrKey = h3.HdrKey
WHERE                   (h2.ISAControlNum IS NULL) AND (h2.GSControlNum IS NULL) AND (h2.TransSetControlNum IS NULL)

END





GO
/****** Object:  StoredProcedure [dbo].[s_EDI_Trigger_HDR_DupCheck_Bundles]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE PROCEDURE [dbo].[s_EDI_Trigger_HDR_DupCheck_Bundles]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	EXEC s_EDI_Trigger_HDR_830_DupCheck
	EXEC s_EDI_Trigger_HDR_850_DupCheck
	EXEC s_EDI_Trigger_HDR_862_DupCheck

	EXEC s_EDI_Trigger_HDR_810_DupCheck
	EXEC s_EDI_Trigger_HDR_820_DupCheck
	EXEC s_EDI_Trigger_HDR_824_DupCheck
	EXEC s_EDI_Trigger_HDR_832_DupCheck
	EXEC s_EDI_Trigger_HDR_856_DupCheck
	EXEC s_EDI_Trigger_HDR_860_DupCheck
	EXEC s_EDI_Trigger_HDR_861_DupCheck
	EXEC s_EDI_Trigger_HDR_864_DupCheck
	EXEC s_EDI_Trigger_HDR_997_DupCheck
	EXEC s_EDI_Trigger_HDR_142_DupCheck
	EXEC s_EDI_Trigger_HDR_812_DupCheck
	
	EXEC s_EDI_Trigger_HDR_4095_DupCheck	
	EXEC s_EDI_Trigger_HDR_846_DupCheck	
END




GO
/****** Object:  StoredProcedure [dbo].[s_Export_820]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[s_Export_820] 
	
	@HdrKey NVARCHAR(100)
	
	AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT  td.TradingPartnerName,
		h.ISASenderID,ISNULL(h.SubmitDateTime,h.DateAdded) AS SubmitDateTime,
		h.TotalPaymentAmount,h.TransHandlingCode,h.CreditDebitFlagCode,h.PaymentMethodCode,
		CASE WHEN ISNULL(h.RemittanceDate,'') = '' THEN '1/1/1900' ELSE h.RemittanceDate END AS RemittanceDate,
		h.TraceRefNum1,h.TraceRefNum2,h.EntityIDCode,h.CurrencyCode,
		ST.ST_CodeQual,ST.ST_Code,SU.SU_CodeQual,SU.SU_Code,SC.ContactCode,SC.ContactName,SC.ContactNum1Qual,SC.ContactNum1,
		rmr.RemittanceIDQual,rmr.RemittanceID,rmr.GrossAmount,rmr.DiscountAmount,
		CASE WHEN ISNULL(dtm1.Date,'') = '' THEN '1/1/1900' ELSE dtm1.Date END AS InvoiceDate,
		it1.AssignedID,it1.QtyInvoiced,it1.UOM,it1.UnitPrice,it1.UnitPriceCode,
		r1.RefNum AS BOLNumber,
		r2.RefNum AS PKNumber,
		r3.RefNum AS PONumber,
		r4.RefNum AS PartNumber,
		r5.RefNum AS PlantNumber,
		CASE WHEN ISNULL(dtm2.Date,'') = '' THEN '1/1/1900' ELSE dtm2.Date END AS ShipDate,
		r6.RefNum AS ItemLineNumber
		

	FROM tblEDI_820_Header AS h
		INNER JOIN tblTradingPartner AS td ON h.ISASenderID COLLATE SQL_Latin1_General_CP1_CI_AS = td.InterchangeSenderID COLLATE SQL_Latin1_General_CP1_CI_AS AND h.GSReceiverID COLLATE SQL_Latin1_General_CP1_CI_AS = td.InterchangeReceiverID COLLATE SQL_Latin1_General_CP1_CI_AS
										AND h.GSSenderID COLLATE SQL_Latin1_General_CP1_CI_AS  = td.ApplicationSenderCode COLLATE SQL_Latin1_General_CP1_CI_AS 
		LEFT JOIN (SELECT HdrKey,Code AS ST_Code,CodeQual AS ST_CodeQual FROM tblEDI_820_N1 WHERE HdrKey = @HdrKey AND EntityIDCode='PR' GROUP BY HdrKey,Code,CodeQual) AS ST ON h.HdrKey = ST.HdrKey
		LEFT JOIN (SELECT HdrKey,Code AS SU_Code,CodeQual AS SU_CodeQual FROM tblEDI_820_N1 WHERE HdrKey = @HdrKey AND EntityIDCode='PE' GROUP BY HdrKey,Code,CodeQual) AS SU ON h.HdrKey = SU.HdrKey
		LEFT JOIN (SELECT HdrKey,ContactCode,ContactName,ContactNum1Qual,ContactNum1 FROM tblEDI_820_N1 WHERE HdrKey = @HdrKey AND ISNULL(EntityIDCode,'') = '' GROUP BY HdrKey,ContactCode,ContactName,ContactNum1Qual,ContactNum1) AS SC ON h.HdrKey = SC.HdrKey
		LEFT JOIN tblEDI_820_rmr AS rmr ON h.HdrKey = rmr.HdrKey 
		LEFT JOIN BHEDI.dbo.tblEDI_820_dtm AS dtm1 ON rmr.HdrKey = dtm1.HdrKey AND rmr.RMRKey = dtm1.RMRKey AND dtm1.DtmQual = '003'
		LEFT JOIN BHEDI.dbo.tblEDI_820_IT1 AS it1 ON rmr.HdrKey = it1.HdrKey AND rmr.RMRKey = it1.RMRKey
		LEFT JOIN BHEDI.dbo.tblEDI_820_dtm AS dtm2 ON it1.HdrKey = dtm2.HdrKey AND it1.RMRKey = dtm2.RMRKey AND it1.IT1Key = dtm2.IT1Key AND dtm2.DtmQual = '011'
		LEFT JOIN BHEDI.dbo.tblEDI_820_ref AS r1 ON it1.HdrKey = r1.HdrKey AND it1.RMRKey = r1.RMRKey AND it1.IT1Key = r1.IT1Key AND r1.RefQual = 'BM'
		LEFT JOIN BHEDI.dbo.tblEDI_820_ref AS r2 ON it1.HdrKey = r2.HdrKey AND it1.RMRKey = r2.RMRKey AND it1.IT1Key = r2.IT1Key AND r2.RefQual = 'PK'
		LEFT JOIN BHEDI.dbo.tblEDI_820_ref AS r3 ON it1.HdrKey = r3.HdrKey AND it1.RMRKey = r3.RMRKey AND it1.IT1Key = r3.IT1Key AND r3.RefQual = 'PO'
		LEFT JOIN BHEDI.dbo.tblEDI_820_ref AS r4 ON it1.HdrKey = r4.HdrKey AND it1.RMRKey = r4.RMRKey AND it1.IT1Key = r4.IT1Key AND r4.RefQual = 'PM'
		LEFT JOIN BHEDI.dbo.tblEDI_820_ref AS r5 ON it1.HdrKey = r5.HdrKey AND it1.RMRKey = r5.RMRKey AND it1.IT1Key = r5.IT1Key AND r5.RefQual = 'PE'
		LEFT JOIN BHEDI.dbo.tblEDI_820_ref AS r6 ON it1.HdrKey = r6.HdrKey AND it1.RMRKey = r6.RMRKey AND it1.IT1Key = r6.IT1Key AND r6.RefQual = 'IX'
			

	WHERE h.HdrKey = @HdrKey

	ORDER BY rmr.NO, it1.NO
    
END
GO
/****** Object:  StoredProcedure [dbo].[s_Export_824]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[s_Export_824] 
	
	@HdrKey NVARCHAR(100)
	
	AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT  td.TradingPartnerName,
		h.ISASenderID,h.ApplicationAdviceNum,ISNULL(h.SubmitDateTime,h.DateAdded) AS SubmitDateTime,
	SP.SP_CodeQual,SP.SP_Code,ST.ST_CodeQual,ST.ST_Code,SU.SU_CodeQual,SU.SU_Code,l.AppAcknowledgmentCode,l.OrgDocumentNum,
	CASE WHEN ISNULL(l.OrgCreateDateTime,'') = '' THEN '1/1/1900' ELSE l.OrgCreateDateTime END AS OrgCreateDateTime,
	d.ApplErrConditionCode,REPLACE(d.ErrorDescrp,',',' ') AS ErrorDescrp,nte.NoteRefCode,REPLACE(nte.Description,',',' ') AS Description
	
	FROM tblEDI_824_Header AS h
		INNER JOIN tblTradingPartner AS td ON h.ISASenderID COLLATE SQL_Latin1_General_CP1_CI_AS = td.InterchangeSenderID COLLATE SQL_Latin1_General_CP1_CI_AS AND h.GSReceiverID COLLATE SQL_Latin1_General_CP1_CI_AS = td.InterchangeReceiverID COLLATE SQL_Latin1_General_CP1_CI_AS
										AND h.GSSenderID COLLATE SQL_Latin1_General_CP1_CI_AS  = td.ApplicationSenderCode COLLATE SQL_Latin1_General_CP1_CI_AS 
		LEFT JOIN (SELECT HdrKey,CASE WHEN ISNULL(Code,'') <> '' THEN Code ELSE Name END AS ST_Code,CASE WHEN ISNULL(CodeQual,'') <> '' THEN CodeQual ELSE '92' END AS ST_CodeQual FROM tblEDI_824_N1 WHERE HdrKey = @HdrKey AND EntityIDCode='ST' GROUP BY HdrKey,Code,CodeQual,Name) AS ST ON h.HdrKey = ST.HdrKey
		LEFT JOIN (SELECT HdrKey,Code AS SU_Code,CodeQual AS SU_CodeQual FROM tblEDI_824_N1 WHERE HdrKey = @HdrKey AND EntityIDCode='SU' GROUP BY HdrKey,Code,CodeQual) AS SU ON h.HdrKey = SU.HdrKey
		LEFT JOIN (SELECT HdrKey,Code AS SP_Code,CodeQual AS SP_CodeQual,ContactName AS SP_ContactName FROM tblEDI_824_N1 WHERE HdrKey = @HdrKey AND EntityIDCode IN ('16','BY') GROUP BY HdrKey,Code,CodeQual,ContactName) AS SP ON h.HdrKey = SP.HdrKey
		LEFT JOIN tblEDI_824_Line AS l ON h.HdrKey = l.HdrKey
		LEFT JOIN tblEDI_824_Detail AS d ON l.HdrKey = d.HdrKey AND l.LineKey = d.LineKey
		LEFT JOIN tblEDI_824_NTE AS nte ON d.HdrKey = nte.HdrKey AND d.LineKey = nte.LineKey AND d.DtlKey = nte.DtlKey

	WHERE h.HdrKey = @HdrKey

	ORDER BY l.[NO],d.[NO],nte.[NO]
    
END
GO
/****** Object:  StoredProcedure [dbo].[s_Export_830]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE PROCEDURE [dbo].[s_Export_830] 
	
	@HdrKey NVARCHAR(100)
	
	AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @TransSetID NVARCHAR(50),@GSReceiverID NVARCHAR(50);
	SELECT @TransSetID = TransSetID,@GSReceiverID = GSReceiverID FROM tblEDI_830_Header WHERE HdrKey =  @HdrKey

	IF @TransSetID = 'DELFOR' -- GM


				
				SELECT  
					h.ReleaseNumber,ISNULL(h.SubmitDateTime,h.DateAdded) AS SubmitDateTime,h.TransSetPurpose,h.ReferenceID,h.ScheduleTypeQual,
					CASE WHEN ISNULL(dtm3.dtmDate,'') = '' THEN '1/1/1900' ELSE dtm3.dtmDate END AS ForecastHorizonDateStart,
					CASE WHEN ISNULL(dtm5.dtmDate,'') = '' THEN '1/1/1900' ELSE dtm5.dtmDate END AS ForecastHorizonEndDate,
					h.PONum,'' AS dtm_Qualifier, 
					'1/1/1900' AS dtm_dtmDate
					,td.TradingPartnerName,h.ISASenderID,
					'' AS SF_CodeQual,'' AS SF_Code,n1.SplIDCodeQual AS ST_CodeQual,n1.Code AS ST_Code,n2.SplIDCodeQual AS SU_CodeQual,n2.Code AS SU_Code,'' AS SU_ContactName,n3.SplIDCodeQual AS SP_CodeQual,n3.Code AS SP_Code,'' AS SP_ContactName,

					'' AS MI_CodeQual,'' AS MI_Code,'' AS BT_CodeQual,'' AS BT_Code,'' AS LocationQual,'' AS LocationCode,
					d1.ReleaseNumber AS d_ReleaseNumber,l.BuyersPartID,l.PONum AS l_PONum,
					REPLACE(REPLACE(REPLACE(l.PartDescription,',',' '),'-',' '),'+',' ') AS PartDescription,
			
					'' AS DCPartLevel,l.SupplierPartID,

					'' AS l_ContractNumber,
					'' AS CommonityCode,
					'' AS ManuafactureCode,
					'' AS ReturnableContainer,
					l.SubLineAssignID,l.UOM,l.UnitPrice,'TE' AS UnitPriceCode,'USD' AS PriceCode,'BY' AS PriceIDCode,
					'' AS DK_Code,'' AS DP_Code,'' AS HS_Code,'' AS LF_Code,'' AS RF_Code,

					'' AS STL_CodeQual,'' AS STL_Code,

					'' AS ContractPerson,
					'' AS ExpeditorName,
					'' AS CommuEX,
					'' AS CommuFX,
					l.AdminPhone_lin AS ContactPhone,d1.ShipPatternCode,d1.ShipPatternTimeCode,CASE WHEN ISNULL(d1.RefNum,'') <> '' THEN d1.RefNum ELSE ref.RefNum END AS OrderNumber, 
					'' AS LastShipNum,
			
					'1/1/1900' AS LastShipDate,

					NULL AS ShipQty,d2.FstQty AS CUMQty,

					CASE WHEN ISNULL(dtm1.dtmDate,'') = '' THEN  '1/1/1900' ELSE dtm1.dtmDate END AS BegInventoryDate,


					CASE WHEN ISNULL(dtm2.dtmDate,'') = '' THEN  '1/1/1900' ELSE dtm2.dtmDate END  AS EndInventoryDate,
			
					dtm4.dtmDate AS DatePeriodStart

			
					,d1.FstQty,
					
					CASE WHEN d1.ForecastQual = '1'  THEN 'F' WHEN d1.ForecastQual = '4'  THEN 'P' END AS ForecastQual,
					
					d1.ForecastTimeQual,d1.ForecastQual AS ForecastQualOrg

						
			FROM 
			BHEDI.dbo.tblEDI_830_HEADER AS h  
			INNER JOIN tblTradingPartner AS td ON h.ISASenderID COLLATE SQL_Latin1_General_CP1_CI_AS = td.InterchangeSenderID COLLATE SQL_Latin1_General_CP1_CI_AS AND h.GSReceiverID COLLATE SQL_Latin1_General_CP1_CI_AS = td.InterchangeReceiverID COLLATE SQL_Latin1_General_CP1_CI_AS
						AND h.GSSenderID COLLATE SQL_Latin1_General_CP1_CI_AS  = td.ApplicationSenderCode COLLATE SQL_Latin1_General_CP1_CI_AS 
			LEFT JOIN
	
			BHEDI.dbo.tblEDI_830_N1 AS n1 ON h.HdrKey = n1.HdrKey AND n1.EntityIDCode IN ('ST') LEFT JOIN
			BHEDI.dbo.tblEDI_830_N1 AS n2 ON h.HdrKey = n2.HdrKey AND n2.EntityIDCode IN ('SU') LEFT JOIN
			BHEDI.dbo.tblEDI_830_N1 AS n3 ON h.HdrKey = n3.HdrKey AND n3.EntityIDCode IN ('MI') INNER JOIN

			BHEDI.dbo.tblEDI_830_LINE AS l ON h.HdrKey = l.HdrKey INNER JOIN
			
			BHEDI.dbo.tblEDI_830_DETAIL AS d1 ON l.HdrKey = d1.HdrKey and l.LineKey = d1.LineKey AND d1.DiffQty = 1    INNER JOIN
			BHEDI.dbo.tblEDI_830_DTM AS dtm4 ON d1.HdrKey COLLATE SQL_Latin1_General_CP1_CI_AS= dtm4.HdrKey COLLATE SQL_Latin1_General_CP1_CI_AS and d1.LineKey COLLATE SQL_Latin1_General_CP1_CI_AS = dtm4.LineKey COLLATE SQL_Latin1_General_CP1_CI_AS AND d1.DtlKey COLLATE SQL_Latin1_General_CP1_CI_AS = dtm4.DtlKey COLLATE SQL_Latin1_General_CP1_CI_AS 
									AND dtm4.Qualifier IN ('2','158')
	
			LEFT JOIN BHEDI.dbo.tblEDI_830_REF AS ref ON l.LineKey = ref.LineKey AND ref.RefQual = 'ON' LEFT JOIN 

			BHEDI.dbo.tblEDI_830_DETAIL AS d2 ON l.HdrKey  = d2.HdrKey  
				and l.LineKey  = d2.LineKey  
				AND d2.DiffQty = 3 LEFT JOIN

				BHEDI.dbo.tblEDI_830_DTM AS dtm1 ON d2.HdrKey COLLATE SQL_Latin1_General_CP1_CI_AS = dtm1.HdrKey COLLATE SQL_Latin1_General_CP1_CI_AS 
				and d2.LineKey COLLATE SQL_Latin1_General_CP1_CI_AS = dtm1.LineKey COLLATE SQL_Latin1_General_CP1_CI_AS 
				AND d2.DtlKey COLLATE SQL_Latin1_General_CP1_CI_AS = dtm1.DtlKey COLLATE SQL_Latin1_General_CP1_CI_AS  AND dtm1.Qualifier IN ('51') LEFT JOIN
			BHEDI.dbo.tblEDI_830_DTM AS dtm2 ON d2.HdrKey COLLATE SQL_Latin1_General_CP1_CI_AS = dtm2.HdrKey COLLATE SQL_Latin1_General_CP1_CI_AS
			and d2.LineKey COLLATE SQL_Latin1_General_CP1_CI_AS = dtm2.LineKey COLLATE SQL_Latin1_General_CP1_CI_AS 
			AND d2.DtlKey COLLATE SQL_Latin1_General_CP1_CI_AS = dtm2.DtlKey COLLATE SQL_Latin1_General_CP1_CI_AS  AND dtm2.Qualifier IN ('11','52') 
			LEFT JOIN BHEDI.dbo.tblEDI_830_DTM AS dtm3 ON h.HdrKey COLLATE SQL_Latin1_General_CP1_CI_AS = dtm3.HdrKey AND dtm3.Qualifier = '158' AND ISNULL(dtm3.LineKey,'') = '' AND ISNULL(dtm3.DtlKey,'') = ''
			LEFT JOIN BHEDI.dbo.tblEDI_830_DTM AS dtm5 ON h.HdrKey COLLATE SQL_Latin1_General_CP1_CI_AS = dtm5.HdrKey AND dtm5.Qualifier = '159' AND ISNULL(dtm5.LineKey,'') = '' AND ISNULL(dtm5.DtlKey,'') = '' 
			 

			WHERE h.HdrKey = @HdrKey AND dtm4.dtmDate IS NOT NULL 

			ORDER BY l.NO,d1.NO,dtm4.NO

	
	ELSE IF @GSReceiverID IN ('18982A') -- Chrysler send mutiple SHip-To by Line Item
				SELECT  DISTINCT
				h.ReleaseNumber,ISNULL(h.SubmitDateTime,h.DateAdded) AS SubmitDateTime,h.TransSetPurpose,h.ReferenceID,h.ScheduleTypeQual,
				CASE WHEN ISNULL(h.ForecastHorizonDateStart,'') = '' THEN '1/1/1900' ELSE h.ForecastHorizonDateStart END AS ForecastHorizonDateStart,
				CASE WHEN ISNULL(h.ForecastHorizonEndDate,'') = '' THEN '1/1/1900' ELSE h.ForecastHorizonEndDate END AS ForecastHorizonEndDate,
				h.PONum,dtm.Qualifier AS dtm_Qualifier, 
				CASE WHEN ISNULL(dtm.dtmDate,'') = '' THEN '1/1/1900' ELSE dtm.dtmDate END AS dtm_dtmDate
				,td.TradingPartnerName,h.ISASenderID,
				SF.SF_CodeQual,SF.SF_Code,ST.ST_CodeQual,ST.ST_Code,SU.SU_CodeQual,SU.SU_Code,SU.SU_ContactName,SP.SP_CodeQual,SP.SP_Code,SP.SP_ContactName,
				MI.MI_CodeQual,MI.MI_Code,BT.BT_CodeQual,BT.BT_Code,'' AS LocationQual,'' AS LocationCode,
				d.ReleaseNumber AS d_ReleaseNumber,l.BuyersPartID,l.PONum AS l_PONum,
				REPLACE(REPLACE(REPLACE(l.PartDescription,',',' '),'-',' '),'+',' ') AS PartDescription,
			
				CASE WHEN l.EngChangeLevel NOT IN ('CR','HD','MF','RC') THEN l.DCPartLevel ELSE '' END AS DCPartLevel,l.SupplierPartID,

				CASE WHEN l.MarksNumQual = 'CR' THEN l.MarksNum ELSE '' END AS l_ContractNumber,
				CASE WHEN l.MarksNumQual = 'HD' THEN l.MarksNum ELSE '' END AS CommonityCode,
				CASE WHEN l.MarksNumQual = 'MF' THEN l.MarksNum ELSE '' END AS ManuafactureCode,
				CASE WHEN l.MarksNumQual = 'RC' THEN l.MarksNum ELSE '' END AS ReturnableContainer,
				l.SubLineAssignID,l.UOM,l.UnitPrice,'TE' AS UnitPriceCode,'USD' AS PriceCode,'BY' AS PriceIDCode,
				DK.RefNum AS DK_Code,DP.RefNum AS DP_Code,HS.RefNum AS HS_Code,LF.RefNum AS LF_Code,RF.RefNum AS RF_Code,

				STL.STL_CodeQual,STL.STL_Code,

				CASE WHEN l.AdminFuncCode_lin <> 'EX' THEN l.AdminContact_lin ELSE '' END AS ContractPerson,
				CASE WHEN l.AdminFuncCode_lin = 'EX' THEN l.AdminContact_lin ELSE '' END AS ExpeditorName,
				CASE WHEN l.AdminCommNumQual_lin = 'EM' THEN l.AdminCommNumQual_lin ELSE '' END AS CommuEX,
				CASE WHEN l.AdminCommNumQual_lin = 'FX' THEN l.AdminCommNumQual_lin ELSE '' END AS CommuFX,
				l.AdminPhone_lin AS ContactPhone,d.ShipPatternCode,d.ShipPatternTimeCode,d.RefNum AS OrderNumber, 
				SI.RefNum AS LastShipNum,
			
				CASE WHEN ISNULL(SH.LastShipDate,'') = '' AND ISNULL(SH.ShipDate,'') = '' THEN '1/1/1900'
				   WHEN ISNULL(SH.LastShipDate,'') <> '' THEN SH.LastShipDate
				   WHEN ISNULL(SH.ShipDate,'') <> '' THEN SH.ShipDate END AS LastShipDate,

				SH.ShipQty,CUM.ShipQty AS CUMQty,

				CASE WHEN ISNULL(CUM.LastShipDate,'') = '' AND ISNULL(CUM.ShipDate,'') = '' THEN '1/1/1900'
				   WHEN ISNULL(CUM.LastShipDate,'') <> '' THEN CUM.LastShipDate
				   WHEN ISNULL(CUM.ShipDate,'') <> '' THEN CUM.ShipDate END AS BegInventoryDate,


				CASE WHEN ISNULL(CUM.BegInventoryDate,'') = '' THEN '1/1/1900' ELSE CUM.BegInventoryDate END AS EndInventoryDate,
			
				CASE WHEN ISNULL(d.DatePeriodStart,'') = '' THEN '1/1/1900' ELSE d.DatePeriodStart END AS DatePeriodStart

			
				,d.FstQty,CASE WHEN d.ForecastQual = 'C' THEN 'F' ELSE 'P' END AS ForecastQual,d.ForecastTimeQual,d.ForecastQual AS ForecastQualOrg

			 
	
		FROM tblEDI_830_Header AS h
			LEFT JOIN tblEDI_830_DTM AS dtm ON h.HdrKey COLLATE SQL_Latin1_General_CP1_CI_AS = dtm.HdrKey COLLATE SQL_Latin1_General_CP1_CI_AS AND ISNULL(dtm.LineKey,'') = '' AND ISNULL(dtm.DtlKey,'') = '' 
			INNER JOIN tblTradingPartner AS td ON h.ISASenderID COLLATE SQL_Latin1_General_CP1_CI_AS = td.InterchangeSenderID COLLATE SQL_Latin1_General_CP1_CI_AS AND h.GSReceiverID COLLATE SQL_Latin1_General_CP1_CI_AS = td.InterchangeReceiverID COLLATE SQL_Latin1_General_CP1_CI_AS
						AND h.GSSenderID COLLATE SQL_Latin1_General_CP1_CI_AS  = td.ApplicationSenderCode COLLATE SQL_Latin1_General_CP1_CI_AS 
			LEFT JOIN (SELECT HdrKey,Code AS SU_Code,SplIDCodeQual AS SU_CodeQual,ContactName AS SU_ContactName FROM tblEDI_830_N1 WHERE HdrKey = @HdrKey AND EntityIDCode='SU' GROUP BY HdrKey,Code,SplIDCodeQual,ContactName) AS SU ON h.HdrKey = SU.HdrKey
			LEFT JOIN (SELECT HdrKey,Code AS SP_Code,SplIDCodeQual AS SP_CodeQual,ContactName AS SP_ContactName FROM tblEDI_830_N1 WHERE HdrKey = @HdrKey AND EntityIDCode IN ('16','BY') GROUP BY HdrKey,Code,SplIDCodeQual,ContactName) AS SP ON h.HdrKey = SP.HdrKey
			LEFT JOIN (SELECT HdrKey,Code AS MI_Code,SplIDCodeQual AS MI_CodeQual FROM tblEDI_830_N1 WHERE HdrKey = @HdrKey AND EntityIDCode='MI' GROUP BY HdrKey,Code,SplIDCodeQual) AS MI ON h.HdrKey = MI.HdrKey
			LEFT JOIN (SELECT HdrKey,Code AS BT_Code,SplIDCodeQual AS BT_CodeQual FROM tblEDI_830_N1 WHERE HdrKey = @HdrKey AND EntityIDCode='BT' GROUP BY HdrKey,Code,SplIDCodeQual) AS BT ON h.HdrKey = BT.HdrKey
			INNER JOIN tblEDI_830_Line AS l ON h.HdrKey = l.HdrKey 
			INNER JOIN (SELECT HdrKey,Code AS SF_Code,SplIDCodeQual AS SF_CodeQual,LineKey FROM tblEDI_830_N1 WHERE HdrKey = @HdrKey AND EntityIDCode='SF' GROUP BY HdrKey,Code,SplIDCodeQual,LineKey) AS SF ON h.HdrKey = SF.HdrKey AND l.LineKey = SF.LineKey
			INNER JOIN (SELECT HdrKey,Code AS ST_Code,SplIDCodeQual AS ST_CodeQual,LineKey FROM tblEDI_830_N1 WHERE HdrKey = @HdrKey AND EntityIDCode='ST' GROUP BY HdrKey,Code,SplIDCodeQual,LineKey) AS ST ON h.HdrKey = ST.HdrKey AND l.LineKey = ST.LineKey

			INNER JOIN tblEDI_830_Detail AS d ON l.HdrKey = d.HdrKey AND l.LineKey = d.LineKey
			LEFT JOIN tblEDI_830_REF AS DK ON l.HdrKey = DK.HdrKey AND l.LineKey = DK.LineKey AND  DK.RefQual = 'DK'
			LEFT JOIN tblEDI_830_REF AS DP ON l.HdrKey = DP.HdrKey AND l.LineKey = DP.LineKey AND  DP.RefQual = 'DP'
			LEFT JOIN tblEDI_830_REF AS HS ON l.HdrKey = HS.HdrKey AND l.LineKey = HS.LineKey AND  HS.RefQual = 'HS'
			LEFT JOIN tblEDI_830_REF AS LF ON l.HdrKey = LF.HdrKey AND l.LineKey = LF.LineKey AND  LF.RefQual = 'LF'
			LEFT JOIN tblEDI_830_REF AS RF ON l.HdrKey = RF.HdrKey AND l.LineKey = RF.LineKey AND  RF.RefQual = 'RF'
			LEFT JOIN tblEDI_830_REF AS SI ON l.HdrKey = SI.HdrKey AND l.LineKey = SI.LineKey AND  SI.RefQual IN ('SI','SH','PK')
			LEFT JOIN tblEDI_830_SHP AS SH ON l.HdrKey = SH.HdrKey AND l.LineKey = SH.LineKey AND SH.QtyQual = '01'
			LEFT JOIN tblEDI_830_SHP AS CUM ON l.HdrKey = CUM.HdrKey AND l.LineKey = CUM.LineKey AND CUM.QtyQual = '02'
			LEFT JOIN (SELECT HdrKey,LineKey,Code AS STL_Code,SplIDCodeQual AS STL_CodeQual FROM tblEDI_830_N1 WHERE HdrKey = @HdrKey AND EntityIDCode='ST' AND ISNULL(LineKey,'') <> '' GROUP BY HdrKey,LineKey,Code,SplIDCodeQual) AS STL ON l.HdrKey = STL.HdrKey AND l.LineKey = STL.LineKey

		WHERE h.HdrKey = @HdrKey AND l.PONum NOT IN ('NA','N/A')

	ELSE -- Other trading partner
		SELECT  DISTINCT
				h.ReleaseNumber,ISNULL(h.SubmitDateTime,h.DateAdded) AS SubmitDateTime,h.TransSetPurpose,h.ReferenceID,h.ScheduleTypeQual,
				CASE WHEN ISNULL(h.ForecastHorizonDateStart,'') = '' THEN '1/1/1900' ELSE h.ForecastHorizonDateStart END AS ForecastHorizonDateStart,
				CASE WHEN ISNULL(h.ForecastHorizonEndDate,'') = '' THEN '1/1/1900' ELSE h.ForecastHorizonEndDate END AS ForecastHorizonEndDate,
				h.PONum,dtm.Qualifier AS dtm_Qualifier, 
				CASE WHEN ISNULL(dtm.dtmDate,'') = '' THEN '1/1/1900' ELSE dtm.dtmDate END AS dtm_dtmDate
				,td.TradingPartnerName,h.ISASenderID,
				SF.SF_CodeQual,SF.SF_Code,ST.ST_CodeQual,ST.ST_Code,SU.SU_CodeQual,SU.SU_Code,SU.SU_ContactName,SP.SP_CodeQual,SP.SP_Code,SP.SP_ContactName,
				MI.MI_CodeQual,MI.MI_Code,BT.BT_CodeQual,BT.BT_Code,'' AS LocationQual,'' AS LocationCode,
				d.ReleaseNumber AS d_ReleaseNumber,l.BuyersPartID,l.PONum AS l_PONum,
				REPLACE(REPLACE(REPLACE(l.PartDescription,',',' '),'-',' '),'+',' ') AS PartDescription,
			
				CASE WHEN l.EngChangeLevel NOT IN ('CR','HD','MF','RC') THEN l.DCPartLevel ELSE '' END AS DCPartLevel,l.SupplierPartID,

				CASE WHEN l.MarksNumQual = 'CR' THEN l.MarksNum ELSE '' END AS l_ContractNumber,
				CASE WHEN l.MarksNumQual = 'HD' THEN l.MarksNum ELSE '' END AS CommonityCode,
				CASE WHEN l.MarksNumQual = 'MF' THEN l.MarksNum ELSE '' END AS ManuafactureCode,
				CASE WHEN l.MarksNumQual = 'RC' THEN l.MarksNum ELSE '' END AS ReturnableContainer,
				l.SubLineAssignID,l.UOM,l.UnitPrice,'TE' AS UnitPriceCode,'USD' AS PriceCode,'BY' AS PriceIDCode,
				DK.RefNum AS DK_Code,DP.RefNum AS DP_Code,HS.RefNum AS HS_Code,LF.RefNum AS LF_Code,RF.RefNum AS RF_Code,

				STL.STL_CodeQual,STL.STL_Code,

				CASE WHEN l.AdminFuncCode_lin <> 'EX' THEN l.AdminContact_lin ELSE '' END AS ContractPerson,
				CASE WHEN l.AdminFuncCode_lin = 'EX' THEN l.AdminContact_lin ELSE '' END AS ExpeditorName,
				CASE WHEN l.AdminCommNumQual_lin = 'EM' THEN l.AdminCommNumQual_lin ELSE '' END AS CommuEX,
				CASE WHEN l.AdminCommNumQual_lin = 'FX' THEN l.AdminCommNumQual_lin ELSE '' END AS CommuFX,
				l.AdminPhone_lin AS ContactPhone,d.ShipPatternCode,d.ShipPatternTimeCode,d.RefNum AS OrderNumber, 
				SI.RefNum AS LastShipNum,
			
				CASE WHEN ISNULL(SH.LastShipDate,'') = '' AND ISNULL(SH.ShipDate,'') = '' THEN '1/1/1900'
				   WHEN ISNULL(SH.LastShipDate,'') <> '' THEN SH.LastShipDate
				   WHEN ISNULL(SH.ShipDate,'') <> '' THEN SH.ShipDate END AS LastShipDate,

				SH.ShipQty,CUM.ShipQty AS CUMQty,

				CASE WHEN ISNULL(CUM.LastShipDate,'') = '' AND ISNULL(CUM.ShipDate,'') = '' THEN '1/1/1900'
				   WHEN ISNULL(CUM.LastShipDate,'') <> '' THEN CUM.LastShipDate
				   WHEN ISNULL(CUM.ShipDate,'') <> '' THEN CUM.ShipDate END AS BegInventoryDate,


				CASE WHEN ISNULL(CUM.BegInventoryDate,'') = '' THEN '1/1/1900' ELSE CUM.BegInventoryDate END AS EndInventoryDate,
			
				CASE WHEN ISNULL(d.DatePeriodStart,'') = '' THEN '1/1/1900' ELSE d.DatePeriodStart END AS DatePeriodStart

			
				,d.FstQty,CASE WHEN d.ForecastQual = 'C' THEN 'F' ELSE 'P' END AS ForecastQual,d.ForecastTimeQual,d.ForecastQual AS ForecastQualOrg

			 
	
		FROM tblEDI_830_Header AS h
			LEFT JOIN tblEDI_830_DTM AS dtm ON h.HdrKey COLLATE SQL_Latin1_General_CP1_CI_AS = dtm.HdrKey COLLATE SQL_Latin1_General_CP1_CI_AS AND ISNULL(dtm.LineKey,'') = '' AND ISNULL(dtm.DtlKey,'') = '' 
			INNER JOIN tblTradingPartner AS td ON h.ISASenderID COLLATE SQL_Latin1_General_CP1_CI_AS = td.InterchangeSenderID COLLATE SQL_Latin1_General_CP1_CI_AS AND h.GSReceiverID COLLATE SQL_Latin1_General_CP1_CI_AS = td.InterchangeReceiverID COLLATE SQL_Latin1_General_CP1_CI_AS
						AND h.GSSenderID COLLATE SQL_Latin1_General_CP1_CI_AS  = td.ApplicationSenderCode COLLATE SQL_Latin1_General_CP1_CI_AS 
			LEFT JOIN (SELECT HdrKey,Code AS SF_Code,SplIDCodeQual AS SF_CodeQual FROM tblEDI_830_N1 WHERE HdrKey = @HdrKey AND EntityIDCode='SF' GROUP BY HdrKey,Code,SplIDCodeQual) AS SF ON h.HdrKey = SF.HdrKey
			LEFT JOIN (SELECT HdrKey,Code AS ST_Code,SplIDCodeQual AS ST_CodeQual FROM tblEDI_830_N1 WHERE HdrKey = @HdrKey AND EntityIDCode='ST' GROUP BY HdrKey,Code,SplIDCodeQual) AS ST ON h.HdrKey = ST.HdrKey
			LEFT JOIN (SELECT HdrKey,Code AS SU_Code,SplIDCodeQual AS SU_CodeQual,ContactName AS SU_ContactName FROM tblEDI_830_N1 WHERE HdrKey = @HdrKey AND EntityIDCode='SU' GROUP BY HdrKey,Code,SplIDCodeQual,ContactName) AS SU ON h.HdrKey = SU.HdrKey
			LEFT JOIN (SELECT HdrKey,Code AS SP_Code,SplIDCodeQual AS SP_CodeQual,ContactName AS SP_ContactName FROM tblEDI_830_N1 WHERE HdrKey = @HdrKey AND EntityIDCode IN ('16','BY') GROUP BY HdrKey,Code,SplIDCodeQual,ContactName) AS SP ON h.HdrKey = SP.HdrKey
			LEFT JOIN (SELECT HdrKey,Code AS MI_Code,SplIDCodeQual AS MI_CodeQual FROM tblEDI_830_N1 WHERE HdrKey = @HdrKey AND EntityIDCode='MI' GROUP BY HdrKey,Code,SplIDCodeQual) AS MI ON h.HdrKey = MI.HdrKey
			LEFT JOIN (SELECT HdrKey,Code AS BT_Code,SplIDCodeQual AS BT_CodeQual FROM tblEDI_830_N1 WHERE HdrKey = @HdrKey AND EntityIDCode='BT' GROUP BY HdrKey,Code,SplIDCodeQual) AS BT ON h.HdrKey = BT.HdrKey
			INNER JOIN tblEDI_830_Line AS l ON h.HdrKey = l.HdrKey 
			INNER JOIN tblEDI_830_Detail AS d ON l.HdrKey = d.HdrKey AND l.LineKey = d.LineKey
			LEFT JOIN tblEDI_830_REF AS DK ON l.HdrKey = DK.HdrKey AND l.LineKey = DK.LineKey AND  DK.RefQual = 'DK'
			LEFT JOIN tblEDI_830_REF AS DP ON l.HdrKey = DP.HdrKey AND l.LineKey = DP.LineKey AND  DP.RefQual = 'DP'
			LEFT JOIN tblEDI_830_REF AS HS ON l.HdrKey = HS.HdrKey AND l.LineKey = HS.LineKey AND  HS.RefQual = 'HS'
			LEFT JOIN tblEDI_830_REF AS LF ON l.HdrKey = LF.HdrKey AND l.LineKey = LF.LineKey AND  LF.RefQual = 'LF'
			LEFT JOIN tblEDI_830_REF AS RF ON l.HdrKey = RF.HdrKey AND l.LineKey = RF.LineKey AND  RF.RefQual = 'RF'
			LEFT JOIN tblEDI_830_REF AS SI ON l.HdrKey = SI.HdrKey AND l.LineKey = SI.LineKey AND  SI.RefQual IN ('SI','SH','PK')
			LEFT JOIN tblEDI_830_SHP AS SH ON l.HdrKey = SH.HdrKey AND l.LineKey = SH.LineKey AND SH.QtyQual = '01'
			LEFT JOIN tblEDI_830_SHP AS CUM ON l.HdrKey = CUM.HdrKey AND l.LineKey = CUM.LineKey AND CUM.QtyQual = '02'
			LEFT JOIN (SELECT HdrKey,LineKey,Code AS STL_Code,SplIDCodeQual AS STL_CodeQual FROM tblEDI_830_N1 WHERE HdrKey = @HdrKey AND EntityIDCode='ST' AND ISNULL(LineKey,'') <> '' GROUP BY HdrKey,LineKey,Code,SplIDCodeQual) AS STL ON l.HdrKey = STL.HdrKey AND l.LineKey = STL.LineKey

		WHERE h.HdrKey = @HdrKey

		--ORDER BY l.[NO],d.[NO]
END




GO
/****** Object:  StoredProcedure [dbo].[s_Export_850]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE PROCEDURE [dbo].[s_Export_850] 
	
	@HdrKey NVARCHAR(100)
	
	AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT a.
	SET NOCOUNT ON;


	DECLARE @Msg NVARCHAR(2000);
	SELECT @Msg = COALESCE(@Msg + ' ', '') + msg 
	FROM BHEDI.dbo.tblEDI_850_n9 
	WHERE HdrKey = @HdrKey

	IF ISNULL(@Msg,'') = ''
		SELECT @Msg = COALESCE(@Msg + ' ', '') + [description] 
		FROM BHEDI.dbo.tblEDI_850_NTE 
		WHERE HdrKey = @HdrKey
		GROUP BY [description] 



	SELECT DISTINCT h.PONum,h.ReleaseNum,CASE WHEN ISNULL(h.PODate,'') = '' THEN '1/1/1900' ELSE h.PODate END AS PODate,
	ISNULL(h.SubmitDateTime,h.DateAdded) AS SubmitDateTime,td.TradingPartnerName,h.ISASenderID,h.TransSetPurpose,h.POTypeCode,
	REPLACE(msg.Msg,',','') AS Msg,h.Currency,h.FOBShpMethod,
	h.FOBLocationQual,h.FOBDescription,SC.ContactCode,SC.ContactName,SC.CommQual,SC.CommNum,BT.BT_CodeQual,BT.BT_Code,ST.ST_CodeQual,ST.ST_Code,
	SF.SF_CodeQual,SF.SF_Code,SU.SU_CodeQual,SU.SU_Code,l.BuyersPartID,
	CASE WHEN ISNULL(l.PartDescription,'') = '' THEN PID.Description ELSE l.PartDescription END AS PartDescription,
	
	DR.Description AS EngDrawNum,l.DCPartLevel,l.POLineNum,
	l.QtyOrdered,l.UnitPrice,l.UOM,
	CASE WHEN ISNULL(sch.DtmReqQual,'') <> '' THEN sch.DtmReqQual ELSE dtm.DtmQual END AS DtmQual,
	CASE WHEN ISNULL(sch.DeliveryReqDate,'') <> '' THEN sch.DeliveryReqDate ELSE dtm.Date END AS DeliveryReqDate,
	ISNULL(sch.Qty,l.QtyOrdered) AS Qty
	,@Msg AS EMessage
	,Itd.Description AS PaymentTerm,ref.RefNum AS ReferenceNumber
	
	FROM tblEDI_850_Header AS h
		INNER JOIN tblTradingPartner AS td ON REPLACE(h.ISASenderID,'PSAP','04000') COLLATE SQL_Latin1_General_CP1_CI_AS = td.InterchangeSenderID COLLATE SQL_Latin1_General_CP1_CI_AS AND h.GSReceiverID COLLATE SQL_Latin1_General_CP1_CI_AS = td.InterchangeReceiverID COLLATE SQL_Latin1_General_CP1_CI_AS
								AND  REPLACE(h.GSSenderID,'PSAP','04000') COLLATE SQL_Latin1_General_CP1_CI_AS  = td.ApplicationSenderCode COLLATE SQL_Latin1_General_CP1_CI_AS 
		LEFT JOIN tblEDI_850_N9 AS msg ON h.HdrKey = msg.HdrKey 
		LEFT JOIN (SELECT HdrKey,ContactCode,ContactName,CommQual,CommNum FROM tblEDI_850_N1 WHERE HdrKey = @HdrKey AND ISNULL(EntityIDCode,'') = '' AND ISNULL(Code,'') = '' AND ISNULL(ContactCode,'') <> '' AND ISNULL(ContactName,'') <> '' AND ISNULL(CommQual,'') <> '' AND ISNULL(CommNum,'') <> ''  GROUP BY HdrKey,ContactCode,ContactName,CommQual,CommNum) AS SC ON h.HdrKey = SC.HdrKey
		LEFT JOIN (SELECT HdrKey,Code AS BT_Code,SplIDCodeQual AS BT_CodeQual FROM tblEDI_850_N1 WHERE HdrKey = @HdrKey AND EntityIDCode='BT' GROUP BY HdrKey,Code,SplIDCodeQual) AS BT ON h.HdrKey = BT.HdrKey
		LEFT JOIN (SELECT HdrKey,Code AS SF_Code,SplIDCodeQual AS SF_CodeQual FROM tblEDI_850_N1 WHERE HdrKey = @HdrKey AND EntityIDCode='SF' GROUP BY HdrKey,Code,SplIDCodeQual) AS SF ON h.HdrKey = SF.HdrKey
		LEFT JOIN (SELECT HdrKey,Code AS ST_Code,SplIDCodeQual AS ST_CodeQual FROM tblEDI_850_N1 WHERE HdrKey = @HdrKey AND EntityIDCode='ST' GROUP BY HdrKey,Code,SplIDCodeQual) AS ST ON h.HdrKey = ST.HdrKey
		LEFT JOIN (SELECT HdrKey,Code AS SU_Code,SplIDCodeQual AS SU_CodeQual FROM tblEDI_850_N1 WHERE HdrKey = @HdrKey AND EntityIDCode='SU' GROUP BY HdrKey,Code,SplIDCodeQual) AS SU ON h.HdrKey = SU.HdrKey
		INNER JOIN tblEDI_850_LINE AS l ON h.HdrKey = l.HdrKey 
		LEFT JOIN tblEDI_850_SCH AS sch ON l.HdrKey = sch.HdrKey AND l.LineKey = sch.LineKey
		LEFT JOIN tblEDI_850_DTM AS dtm ON l.HdrKey = dtm.HdrKey AND l.LineKey = dtm.LineKey
		LEFT JOIN tblEDI_850_REF AS DR ON l.HdrKey = DR.HdrKey AND DR.RefNum = 'DR' 
		LEFT JOIN 
		(
			SELECT TOP 1 HdrKey,LineKey,Description FROM tblEDI_850_PID  WHERE HdrKey = @HdrKey
			ORDER BY NO
		) AS PID ON l.HdrKey = PID.HdrKey AND l.LineKey = PID.LineKey
		LEFT JOIN tblEDI_850_ITD as Itd on h.HdrKey = Itd.HdrKey
		left join tblEDI_850_REF AS ref ON l.HdrKey = ref.HdrKey and l.LineKey =  ref.LineKey AND ref.RefQual IN ('AAJ','CA','IT','MF','MY','PZ','RQ')



	WHERE h.HdrKey = @HdrKey

	--ORDER BY l.[NO],sch.[NO],dtm.[NO]
    
END




GO
/****** Object:  StoredProcedure [dbo].[s_Export_856]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[s_Export_856] 
	
	@HdrKey NVARCHAR(100)
	
	AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @t856 TABLE(DataNo INT,TradingPartnerName NVARCHAR(100),ISASenderID NVARCHAR(50),TradingPartnerNameCust NVARCHAR(100),ISASenderIDCust NVARCHAR(50),ASNNumber NVARCHAR(50),
						TransSetPurpose NVARCHAR(10),SendDate DATETIME,SubmitDateTime DATETIME,ShipDate DATETIME,WeightQual NVARCHAR(10),Weight FLOAT,UOM NVARCHAR(10),SCACCode NVARCHAR(50),
						EquipDescCode NVARCHAR(50),TrailerNo NVARCHAR(50),BOL NVARCHAR(50),PlantIDQual NVARCHAR(10),PlantID NVARCHAR(50),ShipToIDQual NVARCHAR(10),ShipToID NVARCHAR(50),
						SuplierDQual NVARCHAR(10),SupplierID NVARCHAR(50),ShipQty INT,PalletPkgCode NVARCHAR(50),PalletSerialNum NVARCHAR(50),CustomerPartID NVARCHAR(50),CustomerPO NVARCHAR(50),
						ReleaseNumber NVARCHAR(50),LotNum NVARCHAR(50),ContainerPkgCode NVARCHAR(50),ContainerQty INT,ContainerSerialNum NVARCHAR(50));

INSERT INTO @t856
SELECT	d.NO,td.TradingPartnerName,RTRIM(LTRIM(h.ISASenderID)) AS ISASenderID,
		tdcd.TradingPartnerName AS TradingPartnerNameCust, tdcd.InterchangeSenderID AS  ISASenderIDCust,h.ASNNumber,h.TransSetPurpose,
		CASE WHEN ISNULL(h.ShipDate,'') = '' THEN '1/1/1900' ELSE h.ShipDate END AS SendDate,
		ISNULL(h.SubmitDateTime,h.DateAdded) AS SubmitDateTime,
		CASE WHEN ISNULL(dtm1.Date,'') = '' THEN '1/1/1900' ELSE dtm1.Date END  AS ShipDate,
		l.WeightQual,l.Weight,l.UOM,l.SCACCode,l.EquipDescCode,l.TrailerNo,r.RefNum  AS BOL,
		n3.CodeQual AS PlantIDQual, n3.Code AS PlantID,
		n1.CodeQual AS ShipToIDQual,n1.Code AS ShipToID,
		n2.CodeQual AS SuplierDQual,n2.Code AS SupplierID,
		qty.Quantity AS ShipQty,

		CASE WHEN d.PartNoQual <> 'BP' THEN d.PartNo ELSE '' END AS PalletPkgCode,CASE WHEN d.PartNoQual <> 'BP' THEN r1.RefNum ELSE '' END AS PalletSerialNum, 
		CASE WHEN d.PartNoQual = 'BP' THEN d.PartNo ELSE '' END AS CustomerPartID,
		CASE WHEN d.PartNoQual = 'BP' THEN d.PONo ELSE '' END AS CustomerPO,
		CASE WHEN d.PartNoQual = 'BP' THEN d.ShipSchedNo ELSE '' END AS ReleaseNumber,
		CASE WHEN d.PartNoQual = 'BP' THEN d.SupplierLotNo ELSE '' END AS LotNum,
		CASE WHEN d.PartNoQual = 'BP' THEN d.ContPkgType ELSE '' END AS ContainerPkgCode,
		CASE WHEN d.PartNoQual = 'BP' THEN qty.Quantity ELSE '' END AS ContainerQty,
		CASE WHEN d.PartNoQual = 'BP' THEN r1.RefNum ELSE '' END AS ContainerSerialNum
						
		FROM 
		tblEDI_856_HEADER AS h  
				INNER JOIN tblTradingPartner AS td ON h.ISASenderID COLLATE SQL_Latin1_General_CP1_CI_AS = td.InterchangeSenderID COLLATE SQL_Latin1_General_CP1_CI_AS AND h.GSReceiverID COLLATE SQL_Latin1_General_CP1_CI_AS = td.InterchangeReceiverID COLLATE SQL_Latin1_General_CP1_CI_AS
										AND h.GSSenderID COLLATE SQL_Latin1_General_CP1_CI_AS  = td.ApplicationSenderCode COLLATE SQL_Latin1_General_CP1_CI_AS 
				INNER JOIN tblTradingPartnerAutoCopy AS tdc ON td.TradingPartnerNo = tdc.TradingPartnerNo_FK
				INNER JOIN tblTradingPartner AS tdcd ON tdc.TradingPartnerNo_AutoCopy_FK = tdcd.TradingPartnerNo
		LEFT JOIN
		tblEDI_856_DTM AS dtm1 ON h.HdrKey COLLATE SQL_Latin1_General_CP1_CI_AS = dtm1.HdrKey COLLATE SQL_Latin1_General_CP1_CI_AS AND dtm1.DtmQual = '011' LEFT JOIN 
		tblEDI_856_N1 AS n1 ON h.HdrKey = n1.HdrKey AND n1.EntityIDCode IN ('ST') LEFT JOIN
		tblEDI_856_N1 AS n2 ON h.HdrKey = n2.HdrKey AND n2.EntityIDCode IN ('SU') LEFT JOIN
		tblEDI_856_N1 AS n3 ON h.HdrKey = n3.HdrKey AND n3.EntityIDCode IN ('16') LEFT JOIN
		tblEDI_856_LINE AS l ON h.HdrKey = l.HdrKey LEFT JOIN
		tblEDI_856_REF AS r ON h.HdrKey COLLATE SQL_Latin1_General_CP1_CI_AS = r.HdrKey COLLATE SQL_Latin1_General_CP1_CI_AS AND ISNULL(r.HL2Key,'') = '' AND r.RefQual = 'BM' LEFT JOIN 
		tblEDI_856_HL2_HL3 AS d ON h.HdrKey COLLATE SQL_Latin1_General_CP1_CI_AS = d.HdrKey COLLATE SQL_Latin1_General_CP1_CI_AS /*AND d.PartNoQual = 'BP'*/ LEFT JOIN 
		tblEDI_856_REF AS r1 ON d.HdrKey COLLATE SQL_Latin1_General_CP1_CI_AS = r1.HdrKey COLLATE SQL_Latin1_General_CP1_CI_AS AND d.HL2HL3Key COLLATE SQL_Latin1_General_CP1_CI_AS =  r1.HL2Key COLLATE SQL_Latin1_General_CP1_CI_AS AND r1.RefQual IN ('LS','MS') LEFT  JOIN 
		tblEDI_856_QTY AS qty ON d.HdrKey COLLATE SQL_Latin1_General_CP1_CI_AS = qty.HdrKey COLLATE SQL_Latin1_General_CP1_CI_AS AND d.HL2HL3Key COLLATE SQL_Latin1_General_CP1_CI_AS =  qty.HL2Key COLLATE SQL_Latin1_General_CP1_CI_AS

		WHERE h.HdrKey = @HdrKey 

		ORDER BY l.NO,d.NO,r1.No

		DECLARE @DataNo INT,@PalletPkgCode NVARCHAR(50),@PalletSerialNum NVARCHAR(50),@TempPalletSerialNum NVARCHAR(50),@TempPalletPkgCode NVARCHAR(50),@CustomerPartID NVARCHAR(50),@ContainerQty INT,@ShipQty INT; 
		SET @TempPalletSerialNum = '';
		SET @TempPalletPkgCode = '';
		SET @ShipQty = 0;

		DECLARE Data_cursor CURSOR FOR SELECT DataNo,PalletPkgCode,PalletSerialNum,CustomerPartID,ContainerQty FROM @t856 ORDER BY DataNo
		OPEN Data_cursor
		FETCH NEXT FROM Data_cursor INTO @DataNo,@PalletPkgCode,@PalletSerialNum,@CustomerPartID,@ContainerQty

		WHILE @@FETCH_STATUS = 0
		BEGIN
			
			IF @TempPalletSerialNum <> @PalletSerialNum AND ISNULL(@PalletSerialNum,'') <> ''
			BEGIN
				
				IF @TempPalletSerialNum <> '' 
					UPDATE @t856 SET ShipQty = @ShipQty WHERE PalletSerialNum = @TempPalletSerialNum
				
				SET @TempPalletSerialNum = @PalletSerialNum;
				SET @TempPalletPkgCode = @PalletPkgCode;
				SET @ShipQty = 0;

			END

			UPDATE @t856 SET PalletSerialNum = @TempPalletSerialNum,PalletPkgCode = @TempPalletPkgCode  WHERE DataNo = @DataNo
			SET @ShipQty = @ShipQty + @ContainerQty;

			FETCH NEXT FROM Data_cursor INTO @DataNo,@PalletPkgCode,@PalletSerialNum,@CustomerPartID,@ContainerQty

		END

		CLOSE Data_cursor
		DEALLOCATE Data_cursor

		UPDATE @t856 SET ShipQty = @ShipQty WHERE PalletSerialNum = @TempPalletSerialNum

		SELECT TradingPartnerName ,ISASenderID ,TradingPartnerNameCust ,ISASenderIDCust ,ASNNumber ,
						TransSetPurpose ,SendDate ,SubmitDateTime ,ShipDate ,WeightQual ,Weight ,UOM ,SCACCode ,
						EquipDescCode ,TrailerNo ,BOL ,PlantIDQual ,PlantID ,ShipToIDQual ,ShipToID ,
						SuplierDQual ,SupplierID ,ShipQty ,PalletPkgCode ,PalletSerialNum ,CustomerPartID ,CustomerPO ,
						ReleaseNumber ,LotNum ,ContainerPkgCode ,ContainerQty ,ContainerSerialNum  
						
		FROM @t856 WHERE ISNULL(CustomerPartID,'') <> '' ORDER BY DataNo

    
END
GO
/****** Object:  StoredProcedure [dbo].[s_Export_860]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[s_Export_860] 
	
	@HdrKey NVARCHAR(100)
	
	AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @Msg NVARCHAR(2000);
	--SELECT @Msg = COALESCE(@Msg + ' ', '') + msg 
	--FROM BHEDI.dbo.tblEDI_850_n9 
	--WHERE HdrKey = @HdrKey

	--IF ISNULL(@Msg,'') = ''
		SELECT @Msg = COALESCE(@Msg + ' ', '') + [description] 
		FROM BHEDI.dbo.tblEDI_860_NTE 
		WHERE HdrKey = @HdrKey
		GROUP BY [description] 

	SELECT  h.PONum,h.ReleaseNum,CASE WHEN ISNULL(h.PODate,'') = '' THEN '1/1/1900' ELSE h.PODate END AS PODate,
	ISNULL(h.SubmitDateTime,h.DateAdded) AS SubmitDateTime,td.TradingPartnerName,h.ISASenderID,h.TransSetPurpose,h.POTypeCode,
	REPLACE(msg.MsgText,',','') AS Msg,h.Currency,h.ChangeOrderSeqNum,h.FOBShpMethod,
	h.FOBLocationQual,h.FOBDescription,
	SC.ContactCode,SC.ContactName,SC.CommQual,SC.CommNum,
	BT.BT_CodeQual,BT.BT_Code,ST.ST_CodeQual,ST.ST_Code,
	SF.SF_CodeQual,SF.SF_Code,SU.SU_CodeQual,SU.SU_Code,l.ProdID1 AS BuyersPartID,
	REPLACE(PID.Description,',','') AS PartDescription,
	
	DR.Description AS EngDrawNum,l.ProdID2,l.POLineNum,l.LineItemChange,
	l.QtyOrdered,l.QtyLeftToRcv,l.UnitPrice,l.UOMCode,
	dtm.DtmQual  AS DtmQual,
	CASE WHEN ISNULL(dtm.Date,'') = '' THEN '1/1/1900' ELSE dtm.Date END AS DeliveryReqDate,
	l.QtyOrdered AS Qty
	,@Msg AS EMessage
	,ISNULL(Itd.Description,'') AS PaymentTerm,ISNULL(ref.Description,'') AS ReferenceNumber
	FROM tblEDI_860_Header AS h
		INNER JOIN tblTradingPartner AS td ON h.ISASenderID  COLLATE SQL_Latin1_General_CP1_CI_AS = CASE WHEN td.InterchangeSenderID = 'PSAP' THEN '04000' ELSE td.InterchangeSenderID END COLLATE SQL_Latin1_General_CP1_CI_AS AND h.GSReceiverID COLLATE SQL_Latin1_General_CP1_CI_AS = td.InterchangeReceiverID COLLATE SQL_Latin1_General_CP1_CI_AS
							AND h.GSSenderID COLLATE SQL_Latin1_General_CP1_CI_AS  = td.ApplicationSenderCode COLLATE SQL_Latin1_General_CP1_CI_AS 
		LEFT JOIN tblEDI_860_MSG AS msg ON h.HdrKey = msg.HdrKey 
		LEFT JOIN (SELECT HdrKey,ContactCode,ContactName,CommQual,CommNum FROM tblEDI_860_N1 WHERE HdrKey = @HdrKey AND ISNULL(EntityIDCode,'') = '' AND ISNULL(Code,'') = '' GROUP BY HdrKey,ContactCode,ContactName,CommQual,CommNum) AS SC ON h.HdrKey = SC.HdrKey
		LEFT JOIN (SELECT HdrKey,Code AS BT_Code,SplIDCodeQual AS BT_CodeQual FROM tblEDI_860_N1 WHERE HdrKey = @HdrKey AND EntityIDCode='BT' GROUP BY HdrKey,Code,SplIDCodeQual) AS BT ON h.HdrKey = BT.HdrKey
		LEFT JOIN (SELECT HdrKey,Code AS SF_Code,SplIDCodeQual AS SF_CodeQual FROM tblEDI_860_N1 WHERE HdrKey = @HdrKey AND EntityIDCode='SF' GROUP BY HdrKey,Code,SplIDCodeQual) AS SF ON h.HdrKey = SF.HdrKey
		LEFT JOIN (SELECT HdrKey,Code AS ST_Code,SplIDCodeQual AS ST_CodeQual FROM tblEDI_860_N1 WHERE HdrKey = @HdrKey AND EntityIDCode='ST' GROUP BY HdrKey,Code,SplIDCodeQual) AS ST ON h.HdrKey = ST.HdrKey
		LEFT JOIN (SELECT HdrKey,Code AS SU_Code,SplIDCodeQual AS SU_CodeQual FROM tblEDI_860_N1 WHERE HdrKey = @HdrKey AND EntityIDCode='SU' GROUP BY HdrKey,Code,SplIDCodeQual) AS SU ON h.HdrKey = SU.HdrKey
		INNER JOIN tblEDI_860_LINE AS l ON h.HdrKey = l.HdrKey 
		LEFT JOIN tblEDI_860_DTM AS dtm ON l.HdrKey = dtm.HdrKey AND l.LineKey = dtm.LineKey
		LEFT JOIN tblEDI_860_REF AS DR ON l.HdrKey = DR.HdrKey AND DR.RefNum = 'DR' 
		LEFT JOIN 
		(
			SELECT TOP 1 HdrKey,LineKey,Description FROM tblEDI_860_PID  WHERE HdrKey = @HdrKey
			ORDER BY NO
		) AS PID ON l.HdrKey = PID.HdrKey AND l.LineKey = PID.LineKey

		LEFT JOIN tblEDI_860_ITD as Itd on h.HdrKey = Itd.HdrKey
		left join tblEDI_860_REF AS ref ON l.HdrKey = ref.HdrKey and l.LineKey =  ref.LineKey AND ref.RefNum IN ('PZ')

	WHERE h.HdrKey = @HdrKey

	ORDER BY l.[NO],dtm.[NO]
    
END


GO
/****** Object:  StoredProcedure [dbo].[s_Export_861]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[s_Export_861] 
	
	@HdrKey NVARCHAR(100)
	
	AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT  td.TradingPartnerName,
		h.ISASenderID,ISNULL(h.SubmitDateTime,h.DateAdded) AS SubmitDateTime,
		h.ReceivingAdviceNum,h.TransSetPurpose,h.ReceivingAdviceTypeCode,
		
		SF.SF_CodeQual,SF.SF_Code,ST.ST_CodeQual,ST.ST_Code,SU.SU_CodeQual,SU.SU_Code,MI.MI_CodeQual,MI.MI_Code,


		r1.RefNum AS BOLNumber,r2.RefNum AS PKNumber,
		CASE WHEN ISNULL(dtm1.Date,'') = '' THEN '1/1/1900' ELSE dtm1.Date END AS ShipDate,
		CASE WHEN ISNULL(dtm2.Date,'') = '' THEN '1/1/1900' ELSE dtm2.Date END AS ReceiveDate,
		CASE WHEN ISNULL(dtm3.Date,'') = '' THEN '1/1/1900' ELSE dtm3.Date END AS ProcessDate,
		r3.RefQual AS CarrierCodeQual, r3.RefNum AS CarrierCode,r4.RefNum AS EquipCode,r4.Description AS EquipNumber,
		l.RecvdQty,l.RecvdQtyUOM,l.ReturnQty,l.ReturnQtyUOM,l.QuestionQty,l.QuestionQtyUOM,l.BuyersPartID,

		r5.RefNum AS PKNumberLine,r6.RefNum AS DockReceiveNum		
		

	FROM tblEDI_861_Header AS h
		INNER JOIN tblTradingPartner AS td ON h.ISASenderID COLLATE SQL_Latin1_General_CP1_CI_AS = td.InterchangeSenderID COLLATE SQL_Latin1_General_CP1_CI_AS AND h.GSReceiverID COLLATE SQL_Latin1_General_CP1_CI_AS = td.InterchangeReceiverID COLLATE SQL_Latin1_General_CP1_CI_AS
										AND h.GSSenderID COLLATE SQL_Latin1_General_CP1_CI_AS  = td.ApplicationSenderCode COLLATE SQL_Latin1_General_CP1_CI_AS 
		
		LEFT JOIN (SELECT HdrKey,Code AS SF_Code,CodeQual AS SF_CodeQual FROM tblEDI_861_N1 WHERE HdrKey = @HdrKey AND EntityIDCode='SF' GROUP BY HdrKey,Code,CodeQual) AS SF ON h.HdrKey = SF.HdrKey
		LEFT JOIN (SELECT HdrKey,Code AS ST_Code,CodeQual AS ST_CodeQual FROM tblEDI_861_N1 WHERE HdrKey = @HdrKey AND EntityIDCode='ST' GROUP BY HdrKey,Code,CodeQual) AS ST ON h.HdrKey = ST.HdrKey
		LEFT JOIN (SELECT HdrKey,Code AS SU_Code,CodeQual AS SU_CodeQual FROM tblEDI_861_N1 WHERE HdrKey = @HdrKey AND EntityIDCode='SU' GROUP BY HdrKey,Code,CodeQual) AS SU ON h.HdrKey = SU.HdrKey
		LEFT JOIN (SELECT HdrKey,Code AS MI_Code,CodeQual AS MI_CodeQual FROM tblEDI_861_N1 WHERE HdrKey = @HdrKey AND EntityIDCode='MA' GROUP BY HdrKey,Code,CodeQual) AS MI ON h.HdrKey = MI.HdrKey
		LEFT JOIN tblEDI_861_REF AS r1 ON h.HdrKey = r1.HdrKey AND r1.RefQual = 'BM'
		LEFT JOIN tblEDI_861_REF AS r2 ON h.HdrKey = r2.HdrKey AND r2.RefQual = 'SI'
		LEFT JOIN tblEDI_861_DTM AS dtm1 ON h.HdrKey = dtm1.HdrKey AND dtm1.dtmQual = '011'
		LEFT JOIN tblEDI_861_DTM AS dtm2 ON h.HdrKey = dtm2.HdrKey AND dtm2.dtmQual = '050'
		LEFT JOIN tblEDI_861_DTM AS dtm3 ON h.HdrKey = dtm3.HdrKey AND dtm3.dtmQual = '009'
		LEFT JOIN tblEDI_861_REF AS r3 ON h.HdrKey = r3.HdrKey AND r3.RefQual = '92'
		LEFT JOIN tblEDI_861_REF AS r4 ON h.HdrKey = r4.HdrKey AND r4.RefQual = 'TL'
		INNER JOIN tblEDI_861_LINE AS l ON h.HdrKey = l.HdrKey
		LEFT JOIN tblEDI_861_REF AS r5 ON l.HdrKey = r5.HdrKey AND l.LineKey = r5.LineKey AND r5.RefQual = 'PK'
		LEFT JOIN tblEDI_861_REF AS r6 ON l.HdrKey = r6.HdrKey AND l.LineKey = r6.LineKey AND r6.RefQual = 'DR'

			

	WHERE h.HdrKey = @HdrKey

	ORDER BY l.NO
    
END
GO
/****** Object:  StoredProcedure [dbo].[s_Export_862]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[s_Export_862] 
	
	@HdrKey NVARCHAR(100)
	
	AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @TransSetID NVARCHAR(50);
	SELECT @TransSetID = TransSetID FROM tblEDI_862_Header WHERE HdrKey =  @HdrKey

	DECLARE @SenderID NVARCHAR(50);
	SELECT @SenderID = ISASenderID FROM tblEDI_862_Header WHERE HdrKey =  @HdrKey

	IF @TransSetID = 'DELJIT' -- GM
	BEGIN 
		-- update item id for packaging information
		DECLARE @862Line  TABLE(RecordNo INT,ItemID NVARCHAR(50),PackagingCode NVARCHAR(50),ContainerCode NVARCHAR(50),LineKey NVARCHAR(100),HdrKey NVARCHAR(100));


		INSERT INTO @862Line
		SELECT [NO], BuyersPartID,PackagingCode,ContainerType,LineKey,HdrKey FROM BHEDI.dbo.tblEDI_862_LINE WHERE HdrKey = @HdrKey

		DECLARE @RecordNo INT,@ItemID NVARCHAR(50),@CurrentNo INT;

		DECLARE LineKey_cursor CURSOR FOR SELECT RecordNo,ItemID FROM @862Line ORDER BY RecordNo
		OPEN LineKey_cursor
		FETCH NEXT FROM LineKey_cursor INTO @RecordNo ,@ItemID 


		WHILE @@FETCH_STATUS = 0
		BEGIN
		
			SET @CurrentNo = @RecordNo;
			IF ISNULL(@ItemID,'') <> ''
			
				UPDATE @862Line SET ItemID = @ItemID WHERE RecordNo <= @CurrentNo AND ISNULL(ItemID,'') = ''

			FETCH NEXT FROM LineKey_cursor INTO @RecordNo ,@ItemID 

		END

		CLOSE LineKey_cursor
		DEALLOCATE  LineKey_cursor

		

		SELECT
		
			h.ReleaseNumber,ISNULL(h.SubmitDateTime,h.DateAdded) AS SubmitDateTime,h.TransSetPurpose,h.ReferenceID,h.ScheduleTypeQual,
				CASE WHEN ISNULL(dtm1.CreateDateTime,'') = '' THEN '1/1/1900' ELSE dtm1.CreateDateTime END AS ForecastHorizonDateStart,
				CASE WHEN ISNULL(dtm2.CreateDateTime,'') = '' THEN '1/1/1900' ELSE dtm2.CreateDateTime END AS ForecastHorizonEndDate,
				h.PONum,td.TradingPartnerName,h.ISASenderID,
				'' AS SF_CodeQual,'' AS SF_Code,n1.SqlNumQual AS ST_CodeQual,n1.Code AS ST_Code,n2.SqlNumQual AS SU_CodeQual,n2.Code AS SU_Code,n3.SqlNumQual AS SP_CodeQual,n3.Code AS SP_Code,
				
				'' AS l_ReleaseNumber,l.ItemID AS BuyersPartID,
				
				''  AS l_PONum,
				'' AS PartDescription,
				NULL AS AssignedID,'' AS DK_Code,'' AS LF_Code,'' AS FinalDelivery,
				NULL AS CarrierName, NULL AS SealNumber,NULL AS RouteQual,NULL AS RouteReference,
				NULL AS RouteOrderNumber,NULL AS LocationQual,NULL AS LocationID,
				''  AS CommuEX,
				''  AS CommuTE,
				''  AS CommuFX,
				d1.RefNum AS OrderNumber,
				d2.TotalDailyQty AS CumAthQty ,
				

				CASE WHEN ISNULL(dtm3.CreateDateTime,'') = '' THEN '1/1/1900' ELSE dtm3.CreateDateTime END AS   CumStartDate,

				NULL AS ShipQty,
				CASE WHEN ISNULL(dtm6.CreateDateTime,'') = '' THEN '1/1/1900' ELSE dtm6.CreateDateTime END AS   LastShipDate,

				
				CASE WHEN ISNULL(dtm5.CreateDateTime,'') = '' THEN '1/1/1900' ELSE dtm5.CreateDateTime END AS CumEndDate,

				
				d3.TotalDailyQty AS TotalShipQy,
			
				dtm4.CreateDateTime  AS FST_DeliveryShipmentDate, 
			
				
				d1.TotalDailyQty  AS TotalDailyQty,
				
				CASE WHEN d1.ForecastQual = 'C' THEN 'F' ELSE 'P' END AS ForecastQual,d1.ForecastTimeQual


				,'1/1/1900'  AS EstArrivalDate
				,'1/1/1900'  AS ServiceStartDate
				,'1/1/1900'  AS ServiceEndDate
				,'1/1/1900'  AS PickupDate
				,'1/1/1900'  AS PlanShipDate
				,'EA' AS UOM
				,d1.ForecastQual AS ForecastQualOrg
				,'' AS LastShipNum 
						
		FROM 
		BHEDI.dbo.tblEDI_862_HEADER AS h  INNER JOIN
		BHEDI.dbo.tblTradingPartner AS td ON h.ISASenderID COLLATE SQL_Latin1_General_CP1_CI_AS = td.InterchangeSenderID COLLATE SQL_Latin1_General_CP1_CI_AS AND h.GSReceiverID COLLATE SQL_Latin1_General_CP1_CI_AS = td.InterchangeReceiverID COLLATE SQL_Latin1_General_CP1_CI_AS
						AND h.GSSenderID COLLATE SQL_Latin1_General_CP1_CI_AS  = td.ApplicationSenderCode COLLATE SQL_Latin1_General_CP1_CI_AS LEFT JOIN
		
	
		BHEDI.dbo.tblEDI_862_N1 AS n1 ON h.HdrKey = n1.HdrKey AND n1.EntityIDCode IN ('ST') LEFT JOIN
		BHEDI.dbo.tblEDI_862_N1 AS n2 ON h.HdrKey = n2.HdrKey AND n2.EntityIDCode IN ('SU') LEFT JOIN
		BHEDI.dbo.tblEDI_862_N1 AS n3 ON h.HdrKey = n3.HdrKey AND n3.EntityIDCode IN ('MI') INNER JOIN

		@862Line AS l ON h.HdrKey COLLATE SQL_Latin1_General_CP1_CI_AS= l.HdrKey  INNER JOIN
		BHEDI.dbo.tblEDI_862_DETAIL AS d1 ON l.HdrKey = d1.HdrKey COLLATE SQL_Latin1_General_CP1_CI_AS and l.LineKey  = d1.LineKey COLLATE SQL_Latin1_General_CP1_CI_AS AND d1.DiffQty=1 INNER JOIN
		BHEDI.dbo.tblEDI_862_DTM AS dtm4 ON d1.HdrKey = dtm4.HdrKey and d1.LineKey = dtm4.LineKey AND d1.DtlKey = dtm4.DtlKey AND dtm4.DtmQual IN ('10')
		
		LEFT JOIN BHEDI.dbo.tblEDI_862_DTM AS dtm1 ON h.HdrKey COLLATE SQL_Latin1_General_CP1_CI_AS = dtm1.HdrKey AND dtm1.DtmQual = '158' AND ISNULL(dtm1.LineKey,'') = '' AND ISNULL(dtm1.DtlKey,'') = ''
		LEFT JOIN BHEDI.dbo.tblEDI_862_DTM AS dtm2 ON h.HdrKey COLLATE SQL_Latin1_General_CP1_CI_AS = dtm2.HdrKey AND dtm2.DtmQual = '159' AND ISNULL(dtm2.LineKey,'') = '' AND ISNULL(dtm2.DtlKey,'') = '' 
		LEFT JOIN BHEDI.dbo.tblEDI_862_DETAIL AS d2 ON l.HdrKey = d2.HdrKey COLLATE SQL_Latin1_General_CP1_CI_AS and l.LineKey  = d2.LineKey COLLATE SQL_Latin1_General_CP1_CI_AS AND d2.DiffQty=79 
		LEFT JOIN BHEDI.dbo.tblEDI_862_DTM AS dtm3 ON d2.HdrKey = dtm3.HdrKey and d2.LineKey = dtm3.LineKey AND d2.DtlKey = dtm3.DtlKey AND dtm3.DtmQual ='51'
		LEFT JOIN BHEDI.dbo.tblEDI_862_DTM AS dtm5 ON d2.HdrKey = dtm5.HdrKey and d2.LineKey = dtm5.LineKey AND d2.DtlKey = dtm5.DtlKey AND dtm5.DtmQual ='52'
		LEFT JOIN BHEDI.dbo.tblEDI_862_DETAIL AS d3 ON l.HdrKey = d3.HdrKey COLLATE SQL_Latin1_General_CP1_CI_AS and l.LineKey  = d3.LineKey COLLATE SQL_Latin1_General_CP1_CI_AS AND d3.DiffQty=3 
		LEFT JOIN BHEDI.dbo.tblEDI_862_DTM AS dtm6 ON d3.HdrKey = dtm6.HdrKey and d3.LineKey = dtm6.LineKey AND d3.DtlKey = dtm6.DtlKey AND dtm6.DtmQual ='11'

		WHERE h.HdrKey = @HdrKey --AND dtm4.CreateDateTime IS NOT NULL

	    ORDER BY l.RecordNo,d1.NO,dtm4.NO

	
	END	


	ELSE


		SELECT  
				h.ReleaseNumber,ISNULL(h.SubmitDateTime,h.DateAdded) AS SubmitDateTime,h.TransSetPurpose,h.ReferenceID,h.ScheduleTypeQual,
				CASE WHEN ISNULL(h.HorizonStartDate,'') = '' THEN '1/1/1900' ELSE h.HorizonStartDate END AS ForecastHorizonDateStart,
				CASE WHEN ISNULL(h.HorizonEndDate,'') = '' THEN '1/1/1900' ELSE h.HorizonEndDate END AS ForecastHorizonEndDate,
				h.PONum,td.TradingPartnerName,h.ISASenderID,
				SF.SF_CodeQual,SF.SF_Code,ST.ST_CodeQual,ST.ST_Code,SU.SU_CodeQual,SU.SU_Code,SP.SP_CodeQual,SP.SP_Code,
				RE.RefNum AS l_ReleaseNumber,l.BuyersPartID,
				CASE WHEN l.DCPartLevelQual = 'PO' THEN l.DCPartLevel ELSE '' END AS l_PONum,
				REPLACE(REPLACE(REPLACE(l.PartDescription,',',' '),'-',' '),'+',' ') AS PartDescription,
				l.AssignedID,DK.RefNum AS DK_Code,LF.RefNum AS LF_Code,RE.Description AS FinalDelivery,
				l.EquipDescCode AS CarrierName, l.EquipNum AS SealNumber,l.SCACCodeQual AS RouteQual,l.RoutingSeqCode AS RouteReference,
				l.Routing AS RouteOrderNumber,l.LocationQual,l.LocationID,
				CASE WHEN l.AdminFuncCode_lin = 'EX' THEN l.AdminContact_lin 
					WHEN CT.ContactCode = 'EX' THEN CT.ContactName
					ELSE '' END AS CommuEX,
				CASE WHEN l.AdminCommNumQual_lin = 'TE' THEN l.AdminPhone_lin ELSE '' END AS CommuTE,
				CASE WHEN CT.CommQual = 'EM' THEN CT.CommNum ELSE '' END AS CommuFX,
				d.RefNum AS OrderNumber,ISNULL(ath.CumAthQty,shp2.ShipQty) AS CumAthQty ,
				CASE WHEN ISNULL(ath.CumStartDate,'') <> '' THEN ath.CumStartDate
					WHEN ISNULL(shp2.LastShipDate,'') <> '' THEN shp2.LastShipDate
					ELSE '1/1/1900' END AS CumStartDate,
				shp.ShipQty,
				CASE WHEN ISNULL(shp.LastShipDate,'') <> '' THEN shp.LastShipDate
					WHEN ISNULL(shp.BegInventoryDate,'') <> '' THEN shp.BegInventoryDate
					ELSE '1/1/1900' END AS LastShipDate
				,CASE WHEN ISNULL(ath.ResourceAuth_ThruDate,'') <> '' THEN ath.ResourceAuth_ThruDate ELSE '1/1/1900' END AS CumEndDate,
				shp2.ShipQty AS TotalShipQy,
			
				d.FST_DeliveryShipmentDate, 
			
			
				d.TotalDailyQty,CASE WHEN d.ForecastQual = 'C' THEN 'F' ELSE 'P' END AS ForecastQual,d.ForecastTimeQual


				,CASE WHEN ISNULL(dtm1.CreateDateTime,'') <> '' THEN dtm1.CreateDateTime ELSE '1/1/1900' END AS EstArrivalDate
				,CASE WHEN ISNULL(dtm2.CreateDateTime,'') <> '' THEN dtm2.CreateDateTime ELSE '1/1/1900' END AS ServiceStartDate
				,CASE WHEN ISNULL(dtm3.CreateDateTime,'') <> '' THEN dtm3.CreateDateTime ELSE '1/1/1900' END AS ServiceEndDate
				,CASE WHEN ISNULL(dtm4.CreateDateTime,'') <> '' THEN dtm4.CreateDateTime ELSE '1/1/1900' END AS PickupDate
				,CASE WHEN ISNULL(dtm5.CreateDateTime,'') <> '' THEN dtm5.CreateDateTime ELSE '1/1/1900' END AS PlanShipDate
				,l.UOM
				,d.ForecastQual AS ForecastQualOrg
				,ref.RefNum AS LastShipNum
	
		FROM tblEDI_862_Header AS h
			INNER JOIN tblTradingPartner AS td ON h.ISASenderID COLLATE SQL_Latin1_General_CP1_CI_AS = td.InterchangeSenderID COLLATE SQL_Latin1_General_CP1_CI_AS AND h.GSReceiverID COLLATE SQL_Latin1_General_CP1_CI_AS = td.InterchangeReceiverID COLLATE SQL_Latin1_General_CP1_CI_AS
						AND h.GSSenderID COLLATE SQL_Latin1_General_CP1_CI_AS  = td.ApplicationSenderCode COLLATE SQL_Latin1_General_CP1_CI_AS 
			LEFT JOIN (SELECT HdrKey,Code AS SF_Code,SqlNumQual AS SF_CodeQual FROM tblEDI_862_N1 WHERE HdrKey = @HdrKey AND EntityIDCode='SF' GROUP BY HdrKey,Code,SqlNumQual) AS SF ON h.HdrKey = SF.HdrKey
			LEFT JOIN (SELECT HdrKey,Code AS ST_Code,SqlNumQual AS ST_CodeQual FROM tblEDI_862_N1 WHERE HdrKey = @HdrKey AND EntityIDCode='ST' GROUP BY HdrKey,Code,SqlNumQual) AS ST ON h.HdrKey = ST.HdrKey
			LEFT JOIN (SELECT HdrKey,Code AS SU_Code,SqlNumQual AS SU_CodeQual FROM tblEDI_862_N1 WHERE HdrKey = @HdrKey AND EntityIDCode='SU' GROUP BY HdrKey,Code,SqlNumQual) AS SU ON h.HdrKey = SU.HdrKey
			LEFT JOIN (SELECT HdrKey,Code AS SP_Code,SqlNumQual AS SP_CodeQual FROM tblEDI_862_N1 WHERE HdrKey = @HdrKey AND EntityIDCode = 'SI' GROUP BY HdrKey,Code,SqlNumQual) AS SP ON h.HdrKey = SP.HdrKey
			INNER JOIN tblEDI_862_Line AS l ON h.HdrKey = l.HdrKey 
			INNER JOIN tblEDI_862_Detail AS d ON l.HdrKey = d.HdrKey AND l.LineKey = d.LineKey
			LEFT JOIN tblEDI_862_REF AS RE ON l.HdrKey = RE.HdrKey AND l.LineKey = RE.LineKey AND  RE.RefQual = 'RE'
			LEFT JOIN tblEDI_862_REF AS DK ON l.HdrKey = DK.HdrKey AND l.LineKey = DK.LineKey AND  DK.RefQual = 'DK'
			LEFT JOIN tblEDI_862_REF AS LF ON l.HdrKey = LF.HdrKey AND l.LineKey = LF.LineKey AND  LF.RefQual = 'LF'


			LEFT JOIN (SELECT HdrKey,ContactCode,ContactName,CommQual,CommNum FROM tblEDI_862_N1 WHERE HdrKey = @HdrKey AND ISNULL(EntityIDCode,'') = '' GROUP BY HdrKey,ContactCode,ContactName,CommQual,CommNum) AS CT ON h.HdrKey = CT.HdrKey
			LEFT JOIN tblEDI_862_SHP AS shp ON l.HdrKey = shp.HdrKey AND l.LineKey = shp.LineKey AND shp.QtyQual = '01'
			LEFT JOIN  tblEDI_862_SHP as shp2 on h.HdrKey = shp2.HdrKey AND l.LineKey = shp2.LineKey AND shp2.QtyQual = '02'
			LEFT JOIN  tblEDI_862_ATH as ath on h.HdrKey = ath.HdrKey AND l.LineKey = ath.LineKey AND ResourceAuthCode = 'PQ'

		
			LEFT JOIN tblEDI_862_DTM AS dtm1 ON d.HdrKey COLLATE SQL_Latin1_General_CP1_CI_AS = dtm1.HdrKey COLLATE SQL_Latin1_General_CP1_CI_AS 
				AND d.LineKey COLLATE SQL_Latin1_General_CP1_CI_AS = dtm1.LineKey COLLATE SQL_Latin1_General_CP1_CI_AS 
				AND d.DtlKey COLLATE SQL_Latin1_General_CP1_CI_AS = dtm1.DtlKey COLLATE SQL_Latin1_General_CP1_CI_AS 
				AND dtm1.DtmQual = '017'

			LEFT JOIN tblEDI_862_DTM AS dtm2 ON d.HdrKey COLLATE SQL_Latin1_General_CP1_CI_AS = dtm2.HdrKey COLLATE SQL_Latin1_General_CP1_CI_AS 
				AND d.LineKey COLLATE SQL_Latin1_General_CP1_CI_AS = dtm2.LineKey COLLATE SQL_Latin1_General_CP1_CI_AS 
				AND d.DtlKey COLLATE SQL_Latin1_General_CP1_CI_AS = dtm2.DtlKey COLLATE SQL_Latin1_General_CP1_CI_AS 
				AND dtm2.DtmQual = '150'

			LEFT JOIN tblEDI_862_DTM AS dtm3 ON d.HdrKey COLLATE SQL_Latin1_General_CP1_CI_AS = dtm3.HdrKey COLLATE SQL_Latin1_General_CP1_CI_AS 
				AND d.LineKey COLLATE SQL_Latin1_General_CP1_CI_AS = dtm3.LineKey COLLATE SQL_Latin1_General_CP1_CI_AS 
				AND d.DtlKey COLLATE SQL_Latin1_General_CP1_CI_AS = dtm3.DtlKey COLLATE SQL_Latin1_General_CP1_CI_AS 
				AND dtm3.DtmQual = '151'

			LEFT JOIN tblEDI_862_DTM AS dtm4 ON d.HdrKey COLLATE SQL_Latin1_General_CP1_CI_AS = dtm4.HdrKey COLLATE SQL_Latin1_General_CP1_CI_AS 
				AND d.LineKey COLLATE SQL_Latin1_General_CP1_CI_AS = dtm4.LineKey COLLATE SQL_Latin1_General_CP1_CI_AS 
				AND d.DtlKey COLLATE SQL_Latin1_General_CP1_CI_AS = dtm4.DtlKey COLLATE SQL_Latin1_General_CP1_CI_AS 
				AND dtm4.DtmQual = '118'


			LEFT JOIN tblEDI_862_DTM AS dtm5 ON d.HdrKey COLLATE SQL_Latin1_General_CP1_CI_AS = dtm5.HdrKey COLLATE SQL_Latin1_General_CP1_CI_AS 
				AND d.LineKey COLLATE SQL_Latin1_General_CP1_CI_AS = dtm5.LineKey COLLATE SQL_Latin1_General_CP1_CI_AS 
				AND d.DtlKey COLLATE SQL_Latin1_General_CP1_CI_AS = dtm5.DtlKey COLLATE SQL_Latin1_General_CP1_CI_AS 
				AND dtm5.DtmQual = '011'
			LEFT JOIN tblEDI_862_REF as ref ON l.HdrKey = ref.HdrKey AND l.LineKey = ref.LineKey AND ref.RefQual = 'SI'	


	WHERE h.HdrKey = @HdrKey

	ORDER BY l.[NO],d.[NO]
    
END


GO
/****** Object:  StoredProcedure [dbo].[s_Export_864]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[s_Export_864] 
	
	@HdrKey NVARCHAR(100)
	
	AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT  td.TradingPartnerName,
		h.ISASenderID,ISNULL(h.SubmitDateTime,h.DateAdded) AS SubmitDateTime,
		REPLACE(h.TransDescription,',',' ') AS TransDescription,h.TransSetPurpose,h.TransTypeCode,
		CASE WHEN ISNULL(dtm.Date,'') = '' THEN '1/1/1900' ELSE dtm.Date END AS PublishDate,
		SF.SF_Name,ST.ST_Name,
		l.DocumentIDNum,REPLACE(d.MsgText,',',' ') AS MsgText

		
		

	FROM tblEDI_864_Header AS h
		INNER JOIN tblTradingPartner AS td ON h.ISASenderID COLLATE SQL_Latin1_General_CP1_CI_AS = td.InterchangeSenderID COLLATE SQL_Latin1_General_CP1_CI_AS AND h.GSReceiverID COLLATE SQL_Latin1_General_CP1_CI_AS = td.InterchangeReceiverID COLLATE SQL_Latin1_General_CP1_CI_AS
										AND h.GSSenderID COLLATE SQL_Latin1_General_CP1_CI_AS  = td.ApplicationSenderCode COLLATE SQL_Latin1_General_CP1_CI_AS 
		
		LEFT JOIN (SELECT HdrKey,Name AS SF_Name FROM tblEDI_864_N1 WHERE HdrKey = @HdrKey AND EntityIDCode='FR' GROUP BY HdrKey,Name) AS SF ON h.HdrKey = SF.HdrKey
		LEFT JOIN (SELECT HdrKey,Name AS ST_Name FROM tblEDI_864_N1 WHERE HdrKey = @HdrKey AND EntityIDCode='TO' GROUP BY HdrKey,Name) AS ST ON h.HdrKey = ST.HdrKey
		LEFT JOIN tblEDI_864_DTM AS dtm ON h.HdrKey = dtm.HdrKey AND dtm.dtmQual = '043'
		INNER JOIN tblEDI_864_LINE AS l ON h.HdrKey = l.HdrKey 
		INNER JOIN tblEDI_864_MSG AS d ON l.HdrKey = d.HdrKey AND l.LineKey = d.LineKey
			

	WHERE h.HdrKey = @HdrKey

	ORDER BY l.NO
    
END
GO
/****** Object:  StoredProcedure [dbo].[s_Export_997]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[s_Export_997] 
	
	@HdrKey NVARCHAR(100)
	
	AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT  td.TradingPartnerName,
		RTRIM(LTRIM(h.ISASenderID)) AS ISASenderID,ISNULL(h.SubmitDateTime,h.DateAdded) AS SubmitDateTime,h.FunctionalIDCode,h.GroupControlNum,h.FunctionalGroupAckCode,
		h.NumofTransSetsIncluded,h.NumofReceivedTransSets,h.NumofAcceptedTransSets,
		dbo.f_GetASNNumberFromRawData(rd.RawData) AS ASNNum,
		h.FunctionalGroupAckCode AS AckCode
	
	FROM tblEDI_997_Header AS h
				INNER JOIN tblTradingPartner AS td ON h.ISASenderID COLLATE SQL_Latin1_General_CP1_CI_AS = td.InterchangeSenderID COLLATE SQL_Latin1_General_CP1_CI_AS AND h.GSReceiverID COLLATE SQL_Latin1_General_CP1_CI_AS = td.InterchangeReceiverID COLLATE SQL_Latin1_General_CP1_CI_AS
										AND h.GSSenderID COLLATE SQL_Latin1_General_CP1_CI_AS  = td.ApplicationSenderCode COLLATE SQL_Latin1_General_CP1_CI_AS 
				LEFT JOIN tblEDITrasactionRawData AS rd ON td.TradingPartnerNo = rd.TradingPartnerNo_FK AND h.GroupControlNum = rd.GroupControlNum
	WHERE h.HdrKey = @HdrKey

    
END
GO
/****** Object:  StoredProcedure [dbo].[s_GetEDITransaction]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[s_GetEDITransaction] 
	
	@TradingPartnerNo INT,
	@TradingPartnerName NVARCHAR(100),
	@DateFrom DATETIME,
	@DateTo DATETIME,
	@InOut INT
	
	AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SET @DateTo = DATEADD(DAY,1,@DateTo);
	IF @TradingPartnerName = '' 
		SELECT TradingPartnerName,TotalTransactions,TotalCharaters,DataType
		FROM
		(
		
			SELECT p.TradingPartnerName
				, COUNT(*) AS TotalTransactions
				,SUM(DATALENGTH(d.RawData)) AS TotalCharaters, 'Inbound' AS DataType 
			FROM  tblEDITrasactionRawData AS d INNER JOIN tblTradingPartner AS p ON d.TradingPartnerNo_FK = p.TradingPartnerNo
			WHERE d.TransactionDate >= @DateFrom AND d.TransactionDate <= @DateTo AND d.InOut = CASE WHEN @InOut <> 2 THEN 0 ELSE -1 END
					AND p.TradingPartnerNo = CASE WHEN @TradingPartnerNo = -1 THEN p.TradingPartnerNo ELSE @TradingPartnerNo END
 
					
			GROUP BY p.TradingPartnerName

			UNION ALL 
			SELECT p.TradingPartnerName
				, COUNT(*) AS TotalTransactions
				,SUM(DATALENGTH(d.RawData)) AS TotalCharaters, 'Outbound' AS DataType 
			FROM  tblEDITrasactionRawData AS d INNER JOIN tblTradingPartner AS p ON d.TradingPartnerNo_FK = p.TradingPartnerNo
			WHERE d.TransactionDate >= @DateFrom AND d.TransactionDate <= @DateTo AND d.InOut = CASE WHEN @InOut <> 1 THEN 1 ELSE -1 END
				AND p.TradingPartnerNo = CASE WHEN @TradingPartnerNo = -1 THEN p.TradingPartnerNo ELSE @TradingPartnerNo END
 
			GROUP BY p.TradingPartnerName
			) AS edi

		ORDER BY TradingPartnerName,DataType	
	ELSE
		SELECT TradingPartnerName,TotalTransactions,TotalCharaters,DataType
		FROM
		(
		
			SELECT p.TradingPartnerName
				, COUNT(*) AS TotalTransactions
				,SUM(DATALENGTH(d.RawData)) AS TotalCharaters, 'Inbound' AS DataType 
			FROM  tblEDITrasactionRawData AS d INNER JOIN tblTradingPartner AS p ON d.TradingPartnerNo_FK = p.TradingPartnerNo
			WHERE d.TransactionDate >= @DateFrom AND d.TransactionDate <= @DateTo AND d.InOut = CASE WHEN @InOut <> 2 THEN 0 ELSE -1 END
					AND p.TradingPartnerNo = CASE WHEN @TradingPartnerNo = -1 THEN p.TradingPartnerNo ELSE @TradingPartnerNo END
					AND p.TradingPartnerName LIKE '%' + @TradingPartnerName + '%'
					
			GROUP BY p.TradingPartnerName

			UNION ALL 
			SELECT p.TradingPartnerName
				, COUNT(*) AS TotalTransactions
				,SUM(DATALENGTH(d.RawData)) AS TotalCharaters, 'Outbound' AS DataType 
			FROM  tblEDITrasactionRawData AS d INNER JOIN tblTradingPartner AS p ON d.TradingPartnerNo_FK = p.TradingPartnerNo
			WHERE d.TransactionDate >= @DateFrom AND d.TransactionDate <= @DateTo AND d.InOut = CASE WHEN @InOut <> 1 THEN 1 ELSE -1 END
				AND p.TradingPartnerNo = CASE WHEN @TradingPartnerNo = -1 THEN p.TradingPartnerNo ELSE @TradingPartnerNo END
				AND p.TradingPartnerName LIKE '%' + @TradingPartnerName + '%'
			GROUP BY p.TradingPartnerName
			) AS edi

		ORDER BY TradingPartnerName,DataType	




END
GO
/****** Object:  StoredProcedure [dbo].[s_InboundMapping_ExportToCSV]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Create date: 04/23/2015
-- Description:	Export Inbound Mapping CSV File
-- =============================================
CREATE PROCEDURE [dbo].[s_InboundMapping_ExportToCSV]
	-- Add the parameters for the stored procedure here
	@TradingPartnerNo AS int,
	@TransactionSetNo AS int,
	@TransactionRawDataNo AS int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT seg.SegmentCode, im.Postion, im.TableName, im.FieldName, im.CommitDBAfterRead, im.isInsert,
			im.Note, ISNULL(NumDistTbl.NumDist, 1) AS NumDist, ROW_NUMBER() OVER (PARTITION BY im.InboundMappingNo ORDER BY im.InboundMappingNo, OperatorMappingNo) AS LineNum,
			op.OperatorCode, opim.OperatorParameter, rw.TransactionDate, rw.TransactionKey, rw.InOut, rw.InterchangeControlNum, rw.GroupControlNum, rw.RawData
	FROM tblInboundMapping im LEFT OUTER JOIN
			tblEDITrasactionRawData rw ON im.TransactionRawDataNo_FK = rw.TransactionRawDataNo LEFT OUTER JOIN
			tblTradingPartner tp ON im.TradingPartnerNo_FK = tp.TradingPartnerNo LEFT OUTER JOIN
			tblEDITransactionSet ets ON im.TransactionSetNo_FK = ets.TransactionSetNo LEFT OUTER JOIN
			tblEDISegment seg ON im.SegmentNo_FK = seg.SegmentNo LEFT OUTER JOIN
			tblOperatorInboundMapping opim ON im.InboundMappingNo = opim.InboundMappingNo_FK LEFT OUTER JOIN
			tblOperator op ON opim.OperatorNo_FK = op.OperatorNo LEFT OUTER JOIN
			(
				SELECT oim.InboundMappingNo_FK, count(*) AS NumDist
				FROM tblInboundMapping im JOIN
				tblOperatorInboundMapping oim ON im.InboundMappingNo = oim.InboundMappingNo_FK
				GROUP BY oim.InboundMappingNo_FK
			) AS NumDistTbl ON im.InboundMappingNo = NumDistTbl.InboundMappingNo_FK
	WHERE TradingPartnerNo = @TradingPartnerNo and TransactionSetNo = @TransactionSetNo and TransactionRawDataNo_FK = @TransactionRawDataNo
	ORDER BY im.InboundMappingNo

END
GO
/****** Object:  StoredProcedure [dbo].[s_Invoice_GetEDI]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[s_Invoice_GetEDI] 
	
	@ItemID NVARCHAR(50),
	@PONumber NVARCHAR(50)
	
	AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT  TOP 1 POLineNum FROM tblEDI_850_Header AS h INNER JOIN tblEDI_850_Line AS l ON h.HdrKey = l.HdrKey 
	WHERE BuyersPartID = @ItemID AND (l.PONum = @PONumber OR h.PONum = @PONumber)
	ORDER BY l.No DESC
END
GO
/****** Object:  StoredProcedure [dbo].[s_OutboundMapping_ExportToCSV]    Script Date: 11/29/2025 5:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Create date: 04/23/2015
-- Description:	Export Outbound Mapping CSV File
-- =============================================
CREATE PROCEDURE [dbo].[s_OutboundMapping_ExportToCSV]
	-- Add the parameters for the stored procedure here
	@TradingPartnerNo AS int,
	@TransactionSetNo AS int,
	@TransactionRawDataNo AS int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT seg.SegmentCode, om.Postion, om.Value, om.XMLPathField, om.SegmentNumber, om.Note, om.OutputEDIFilePath, 
			ISNULL(NumDistTbl.NumDist, 1) AS NumDist, ROW_NUMBER() OVER (PARTITION BY om.OutboundMappingNo ORDER BY om.OutboundMappingNo, OperatorMappingNo) AS LineNum,
			op.OperatorCode, opom.OperatorParameter, rw.XMLData, rw.TransactionDate, rw.TransactionKey, rw.InOut, rw.InterchangeControlNum, rw.GroupControlNum, rw.RawData
	FROM tblOutboundMapping om LEFT OUTER JOIN
			tblEDITrasactionRawData rw ON om.TransactionRawDataNo_FK = rw.TransactionRawDataNo LEFT OUTER JOIN
			tblTradingPartner tp ON om.TradingPartnerNo_FK = tp.TradingPartnerNo LEFT OUTER JOIN
			tblEDITransactionSet ets ON om.TransactionSetNo_FK = ets.TransactionSetNo LEFT OUTER JOIN
			tblEDISegment seg ON om.SegmentNo_FK = seg.SegmentNo LEFT OUTER JOIN
			tblOperatorOutboundMapping opom ON om.OutboundMappingNo = opom.OutboundMappingNo_FK LEFT OUTER JOIN
			tblOperator op ON opom.OperatorNo_FK = op.OperatorNo LEFT OUTER JOIN
			(
				SELECT oom.OutboundMappingNo_FK, count(*) AS NumDist
				FROM tblOutboundMapping om JOIN
				tblOperatorOutboundMapping oom ON om.OutboundMappingNo = oom.OutboundMappingNo_FK
				GROUP BY oom.OutboundMappingNo_FK
			) AS NumDistTbl ON om.OutboundMappingNo = NumDistTbl.OutboundMappingNo_FK
	WHERE TradingPartnerNo = @TradingPartnerNo and TransactionSetNo = @TransactionSetNo and TransactionRawDataNo_FK = @TransactionRawDataNo
	ORDER BY om.OutboundMappingNo
END
GO
