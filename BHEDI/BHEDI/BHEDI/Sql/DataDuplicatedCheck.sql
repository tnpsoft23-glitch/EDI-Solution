-- for both version ---

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

--- Not for Daido version ---

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
/****** Object:  UserDefinedFunction [dbo].[f_EDI_142_DupCheck_2]    Script Date: 4/2/2015 5:55:57 PM ******/
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
/****** Object:  UserDefinedFunction [dbo].[f_EDI_810_DupCheck_1]    Script Date: 4/2/2015 5:55:57 PM ******/
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
/****** Object:  UserDefinedFunction [dbo].[f_EDI_810_DupCheck_2]    Script Date: 4/2/2015 5:55:57 PM ******/
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
/****** Object:  UserDefinedFunction [dbo].[f_EDI_820_DupCheck_1]    Script Date: 4/2/2015 5:55:57 PM ******/
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

SELECT                  h1.HdrKey, h1.SubmitDateTime, h1.ISAControlNum, h1.GSControlNum, h1.TransSetControlNum,h1.GSReceiverID
FROM                     tblEDI_820_HEADER AS h1 INNER JOIN
                                  tblEDI_820_HEADER AS h2 ON h1.ISAControlNum = h2.ISAControlNum AND h1.GSControlNum = h2.GSControlNum AND 
                                  h1.TransSetControlNum = h2.TransSetControlNum
WHERE                   (h1.blnRepFlag = 1) AND (h2.blnRepFlag = 1)
GROUP BY          h1.HdrKey, h1. SubmitDateTime, h1.ISAControlNum, h1.GSControlNum, h1.TransSetControlNum,h1.GSReceiverID
HAVING  h1.SubmitDateTime = MIN(h2.SubmitDateTime)

)

GO
/****** Object:  UserDefinedFunction [dbo].[f_EDI_820_DupCheck_2]    Script Date: 4/2/2015 5:55:57 PM ******/
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
SELECT                  NO, ISAControlNum, GSControlNum, TransSetControlNum,h1.GSReceiverID
FROM                     tblEDI_820_HEADER AS h1
WHERE                   (blnRepFlag = 0)
)

GO
/****** Object:  UserDefinedFunction [dbo].[f_EDI_824_DupCheck_1]    Script Date: 4/2/2015 5:55:57 PM ******/
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
/****** Object:  UserDefinedFunction [dbo].[f_EDI_824_DupCheck_2]    Script Date: 4/2/2015 5:55:57 PM ******/
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
/****** Object:  UserDefinedFunction [dbo].[f_EDI_830_DupCheck_1]    Script Date: 4/2/2015 5:55:57 PM ******/
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

SELECT                  h1.HdrKey, h1.SubmitDateTime, h1.ISAControlNum, h1.GSControlNum, h1.TransSetControlNum,h1.GSReceiverID
FROM                     tblEDI_830_HEADER AS h1 INNER JOIN
                                  tblEDI_830_HEADER AS h2 ON h1.ISAControlNum = h2.ISAControlNum AND h1.GSControlNum = h2.GSControlNum AND 
                                  h1.TransSetControlNum = h2.TransSetControlNum
WHERE                   (h1.blnRepFlag = 1) AND (h2.blnRepFlag = 1)
GROUP BY          h1.HdrKey, h1. SubmitDateTime, h1.ISAControlNum, h1.GSControlNum, h1.TransSetControlNum,h1.GSReceiverID
HAVING  h1.SubmitDateTime = MIN(h2.SubmitDateTime)

)

GO
/****** Object:  UserDefinedFunction [dbo].[f_EDI_830_DupCheck_2]    Script Date: 4/2/2015 5:55:57 PM ******/
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
SELECT                  NO, ISAControlNum, GSControlNum, TransSetControlNum,h1.GSReceiverID
FROM                     tblEDI_830_HEADER AS h1
WHERE                   (blnRepFlag = 0)
)

GO
/****** Object:  UserDefinedFunction [dbo].[f_EDI_832_DupCheck_1]    Script Date: 4/2/2015 5:55:57 PM ******/
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
/****** Object:  UserDefinedFunction [dbo].[f_EDI_832_DupCheck_2]    Script Date: 4/2/2015 5:55:57 PM ******/
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
/****** Object:  UserDefinedFunction [dbo].[f_EDI_850_DupCheck_1]    Script Date: 4/2/2015 5:55:57 PM ******/
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

SELECT                  h1.HdrKey, h1.SubmitDateTime, h1.ISAControlNum, h1.GSControlNum, h1.TransSetControlNum,h1.GSReceiverID
FROM                     tblEDI_850_HEADER AS h1 INNER JOIN
                                  tblEDI_850_HEADER AS h2 ON h1.ISAControlNum = h2.ISAControlNum AND h1.GSControlNum = h2.GSControlNum AND 
                                  h1.TransSetControlNum = h2.TransSetControlNum
WHERE                   (h1.blnRepFlag = 1) AND (h2.blnRepFlag = 1)
GROUP BY          h1.HdrKey, h1. SubmitDateTime, h1.ISAControlNum, h1.GSControlNum, h1.TransSetControlNum,h1.GSReceiverID
HAVING  h1.SubmitDateTime = MIN(h2.SubmitDateTime)

)

GO
/****** Object:  UserDefinedFunction [dbo].[f_EDI_850_DupCheck_2]    Script Date: 4/2/2015 5:55:57 PM ******/
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
SELECT                  NO, ISAControlNum, GSControlNum, TransSetControlNum,h1.GSReceiverID
FROM                     tblEDI_850_HEADER AS h1
WHERE                   (blnRepFlag = 0)
)

GO
/****** Object:  UserDefinedFunction [dbo].[f_EDI_856_DupCheck_1]    Script Date: 4/2/2015 5:55:57 PM ******/
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
/****** Object:  UserDefinedFunction [dbo].[f_EDI_856_DupCheck_2]    Script Date: 4/2/2015 5:55:57 PM ******/
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
/****** Object:  UserDefinedFunction [dbo].[f_EDI_860_DupCheck_1]    Script Date: 4/2/2015 5:55:57 PM ******/
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
/****** Object:  UserDefinedFunction [dbo].[f_EDI_860_DupCheck_2]    Script Date: 4/2/2015 5:55:57 PM ******/
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
/****** Object:  UserDefinedFunction [dbo].[f_EDI_861_DupCheck_1]    Script Date: 4/2/2015 5:55:57 PM ******/
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
/****** Object:  UserDefinedFunction [dbo].[f_EDI_861_DupCheck_2]    Script Date: 4/2/2015 5:55:57 PM ******/
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
/****** Object:  UserDefinedFunction [dbo].[f_EDI_862_DupCheck_1]    Script Date: 4/2/2015 5:55:57 PM ******/
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

SELECT                  h1.HdrKey, h1.SubmitDateTime, h1.ISAControlNum, h1.GSControlNum, h1.TransSetControlNum,h1.GSReceiverID
FROM                     tblEDI_862_HEADER AS h1 INNER JOIN
                                  tblEDI_862_HEADER AS h2 ON h1.ISAControlNum = h2.ISAControlNum AND h1.GSControlNum = h2.GSControlNum AND 
                                  h1.TransSetControlNum = h2.TransSetControlNum
WHERE                   (h1.blnRepFlag = 1) AND (h2.blnRepFlag = 1)
GROUP BY          h1.HdrKey, h1. SubmitDateTime, h1.ISAControlNum, h1.GSControlNum, h1.TransSetControlNum,h1.GSReceiverID
HAVING  h1.SubmitDateTime = MIN(h2.SubmitDateTime)

)

GO
/****** Object:  UserDefinedFunction [dbo].[f_EDI_862_DupCheck_2]    Script Date: 4/2/2015 5:55:57 PM ******/
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
SELECT                  NO, ISAControlNum, GSControlNum, TransSetControlNum,GSReceiverID
FROM                     tblEDI_862_HEADER AS h1
WHERE                   (blnRepFlag = 0)
)

GO
/****** Object:  UserDefinedFunction [dbo].[f_EDI_864_DupCheck_1]    Script Date: 4/2/2015 5:55:57 PM ******/
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
/****** Object:  UserDefinedFunction [dbo].[f_EDI_864_DupCheck_2]    Script Date: 4/2/2015 5:55:57 PM ******/
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
/****** Object:  UserDefinedFunction [dbo].[f_EDI_997_DupCheck_1]    Script Date: 4/2/2015 5:55:57 PM ******/
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

SELECT     h1.HdrKey, h1.SubmitDateTime, h1.ISAControlNum, h1.GSControlNum, h1.TransSetControlNum,h1.GSReceiverID
FROM         tblEDI_997_HEADER AS h1 INNER JOIN
                      tblEDI_997_HEADER AS h2 ON h1.ISAControlNum = h2.ISAControlNum AND h1.GSControlNum = h2.GSControlNum AND 
                      h1.TransSetControlNum = h2.TransSetControlNum
WHERE     (h1.blnRepFlag = 1) AND (h2.blnRepFlag = 1)
GROUP BY h1.HdrKey, h1.SubmitDateTime, h1.ISAControlNum, h1.GSControlNum, h1.TransSetControlNum,h1.GSReceiverID
HAVING      (h1.SubmitDateTime = MIN(h2.SubmitDateTime))

)

GO
/****** Object:  UserDefinedFunction [dbo].[f_EDI_997_DupCheck_2]    Script Date: 4/2/2015 5:55:57 PM ******/
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
SELECT                  NO, ISAControlNum, GSControlNum, TransSetControlNum,h1.GSReceiverID
FROM                     tblEDI_997_HEADER AS h1
WHERE                   (blnRepFlag = 0)
)


GO

/****** Object:  StoredProcedure [dbo].[s_EDI_Trigger_HDR_142_DupCheck]    Script Date: 4/2/2015 5:55:57 PM ******/
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

UPDATE                h3
SET                          blnRepFlag = 0
FROM                     dbo.f_EDI_142_DupCheck_1() AS h1 LEFT OUTER JOIN
                                  dbo.f_EDI_142_DupCheck_2() AS h2 ON h1.ISAControlNum = h2.ISAControlNum AND h1.GSControlNum = h2.GSControlNum AND 
                                  h1.TransSetControlNum = h2.TransSetControlNum AND h1.GSReceiverID = h2.GSReceiverID INNER JOIN
                                  tblEDI_142_HEADER AS h3 ON h1.HdrKey = h3.HdrKey
WHERE                   (h2.ISAControlNum IS NULL) AND (h2.GSControlNum IS NULL) AND (h2.TransSetControlNum IS NULL)

END

GO
/****** Object:  StoredProcedure [dbo].[s_EDI_Trigger_HDR_810_DupCheck]    Script Date: 4/2/2015 5:55:57 PM ******/
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
/****** Object:  StoredProcedure [dbo].[s_EDI_Trigger_HDR_820_DupCheck]    Script Date: 4/2/2015 5:55:57 PM ******/
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

UPDATE                h3
SET                          blnRepFlag = 0
FROM                     dbo.f_EDI_820_DupCheck_1() AS h1 LEFT OUTER JOIN
                                  dbo.f_EDI_820_DupCheck_2() AS h2 ON h1.ISAControlNum = h2.ISAControlNum AND h1.GSControlNum = h2.GSControlNum AND 
                                  h1.TransSetControlNum = h2.TransSetControlNum AND h1.GSReceiverID = h2.GSReceiverID INNER JOIN
                                  tblEDI_820_HEADER AS h3 ON h1.HdrKey = h3.HdrKey
WHERE                   (h2.ISAControlNum IS NULL) AND (h2.GSControlNum IS NULL) AND (h2.TransSetControlNum IS NULL)

END

GO
/****** Object:  StoredProcedure [dbo].[s_EDI_Trigger_HDR_824_DupCheck]    Script Date: 4/2/2015 5:55:57 PM ******/
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
/****** Object:  StoredProcedure [dbo].[s_EDI_Trigger_HDR_830_DupCheck]    Script Date: 4/2/2015 5:55:57 PM ******/
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

UPDATE                h3
SET                          blnRepFlag = 0
FROM                     dbo.f_EDI_830_DupCheck_1() AS h1 LEFT OUTER JOIN
                                  dbo.f_EDI_830_DupCheck_2() AS h2 ON h1.ISAControlNum = h2.ISAControlNum AND h1.GSControlNum = h2.GSControlNum AND 
                                  h1.TransSetControlNum = h2.TransSetControlNum AND h1.GSReceiverID = h2.GSReceiverID INNER JOIN
                                  tblEDI_830_HEADER AS h3 ON h1.HdrKey = h3.HdrKey
WHERE                   (h2.ISAControlNum IS NULL) AND (h2.GSControlNum IS NULL) AND (h2.TransSetControlNum IS NULL)

END

GO
/****** Object:  StoredProcedure [dbo].[s_EDI_Trigger_HDR_832_DupCheck]    Script Date: 4/2/2015 5:55:57 PM ******/
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
/****** Object:  StoredProcedure [dbo].[s_EDI_Trigger_HDR_850_DupCheck]    Script Date: 4/2/2015 5:55:57 PM ******/
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

UPDATE                h3
SET                          blnRepFlag = 0
FROM                     dbo.f_EDI_850_DupCheck_1() AS h1 LEFT OUTER JOIN
                                  dbo.f_EDI_850_DupCheck_2() AS h2 ON h1.ISAControlNum = h2.ISAControlNum AND h1.GSControlNum = h2.GSControlNum AND 
                                  h1.TransSetControlNum = h2.TransSetControlNum AND h1.GSReceiverID = h2.GSReceiverID INNER JOIN
                                  tblEDI_850_HEADER AS h3 ON h1.HdrKey = h3.HdrKey
WHERE                   (h2.ISAControlNum IS NULL) AND (h2.GSControlNum IS NULL) AND (h2.TransSetControlNum IS NULL)

END

GO
/****** Object:  StoredProcedure [dbo].[s_EDI_Trigger_HDR_856_DupCheck]    Script Date: 4/2/2015 5:55:57 PM ******/
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

UPDATE                h3
SET                          blnRepFlag = 0
FROM                     dbo.f_EDI_856_DupCheck_1() AS h1 LEFT OUTER JOIN
                                  dbo.f_EDI_856_DupCheck_2() AS h2 ON h1.ISAControlNum = h2.ISAControlNum AND h1.GSControlNum = h2.GSControlNum AND 
                                  h1.TransSetControlNum = h2.TransSetControlNum AND h1.GSReceiverID = h2.GSReceiverID INNER JOIN
                                  tblEDI_856_HEADER AS h3 ON h1.HdrKey = h3.HdrKey
WHERE                   (h2.ISAControlNum IS NULL) AND (h2.GSControlNum IS NULL) AND (h2.TransSetControlNum IS NULL)

END

GO
/****** Object:  StoredProcedure [dbo].[s_EDI_Trigger_HDR_860_DupCheck]    Script Date: 4/2/2015 5:55:57 PM ******/
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

UPDATE                h3
SET                          blnRepFlag = 0
FROM                     dbo.f_EDI_860_DupCheck_1() AS h1 LEFT OUTER JOIN
                                  dbo.f_EDI_860_DupCheck_2() AS h2 ON h1.ISAControlNum = h2.ISAControlNum AND h1.GSControlNum = h2.GSControlNum AND 
                                  h1.TransSetControlNum = h2.TransSetControlNum AND h1.GSReceiverID = h2.GSReceiverID INNER JOIN
                                  tblEDI_860_HEADER AS h3 ON h1.HdrKey = h3.HdrKey
WHERE                   (h2.ISAControlNum IS NULL) AND (h2.GSControlNum IS NULL) AND (h2.TransSetControlNum IS NULL)

END

GO
/****** Object:  StoredProcedure [dbo].[s_EDI_Trigger_HDR_861_DupCheck]    Script Date: 4/2/2015 5:55:57 PM ******/
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
/****** Object:  StoredProcedure [dbo].[s_EDI_Trigger_HDR_862_DupCheck]    Script Date: 4/2/2015 5:55:57 PM ******/
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

UPDATE                h3
SET                          blnRepFlag = 0
FROM                     dbo.f_EDI_862_DupCheck_1() AS h1 LEFT OUTER JOIN
                                  dbo.f_EDI_862_DupCheck_2() AS h2 ON h1.ISAControlNum = h2.ISAControlNum AND h1.GSControlNum = h2.GSControlNum AND 
                                  h1.TransSetControlNum = h2.TransSetControlNum AND h1.GSReceiverID = h2.GSReceiverID INNER JOIN
                                  tblEDI_862_HEADER AS h3 ON h1.HdrKey = h3.HdrKey
WHERE                   (h2.ISAControlNum IS NULL) AND (h2.GSControlNum IS NULL) AND (h2.TransSetControlNum IS NULL)

END

GO
/****** Object:  StoredProcedure [dbo].[s_EDI_Trigger_HDR_864_DupCheck]    Script Date: 4/2/2015 5:55:57 PM ******/
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
/****** Object:  StoredProcedure [dbo].[s_EDI_Trigger_HDR_997_DupCheck]    Script Date: 4/2/2015 5:55:57 PM ******/
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

UPDATE                h3
SET                          blnRepFlag = 0
FROM                     dbo.f_EDI_997_DupCheck_1() AS h1 LEFT OUTER JOIN
                                  dbo.f_EDI_997_DupCheck_2() AS h2 ON h1.ISAControlNum = h2.ISAControlNum AND h1.GSControlNum = h2.GSControlNum AND 
                                  h1.TransSetControlNum = h2.TransSetControlNum AND h1.GSReceiverID = h2.GSReceiverID INNER JOIN
                                  tblEDI_997_HEADER AS h3 ON h1.HdrKey = h3.HdrKey
WHERE                   (h2.ISAControlNum IS NULL) AND (h2.GSControlNum IS NULL) AND (h2.TransSetControlNum IS NULL)

END

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

/****** Object:  StoredProcedure [dbo].[s_EDI_Trigger_HDR_DupCheck_Bundles]    Script Date: 4/2/2015 5:55:57 PM ******/
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
END

GO

