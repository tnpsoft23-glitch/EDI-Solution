
-- X12 ISA AND GE
  INSERT INTO [tblEDITransactionStructure]([Version],[TransactionSetID],[FunctionGroup],[SegmentCode],[MinLength],[MaxLength],[EDITypeNo_FK])

  SELECT [Version],[TransactionSetID],[FunctionGroup],'ISA',1,1,1
  FROM [tblEDITransactionStructure]
   WHERE [EDITypeNo_FK] = 1
  GROUP BY [Version],[TransactionSetID],[FunctionGroup]


  INSERT INTO [tblEDITransactionStructure]([Version],[TransactionSetID],[FunctionGroup],[SegmentCode],[MinLength],[MaxLength],[EDITypeNo_FK])

  SELECT [Version],[TransactionSetID],[FunctionGroup],'GE',1,1,1
  FROM [tblEDITransactionStructure]
   WHERE [EDITypeNo_FK] = 1
  GROUP BY [Version],[TransactionSetID],[FunctionGroup]

  INSERT INTO [tblEDITransactionStructure]([Version],[TransactionSetID],[FunctionGroup],[SegmentCode],[MinLength],[MaxLength],[EDITypeNo_FK])

  SELECT [Version],[TransactionSetID],[FunctionGroup],'GS',1,1,1
  FROM [tblEDITransactionStructure]
   WHERE [EDITypeNo_FK] = 1
  GROUP BY [Version],[TransactionSetID],[FunctionGroup]


  INSERT INTO [tblEDITransactionStructure]([Version],[TransactionSetID],[FunctionGroup],[SegmentCode],[MinLength],[MaxLength],[EDITypeNo_FK])

  SELECT [Version],[TransactionSetID],[FunctionGroup],'UNT',0,1,1
  FROM [tblEDITransactionStructure]
  WHERE [TransactionSetID] = '862'
  GROUP BY [Version],[TransactionSetID],[FunctionGroup]

    INSERT INTO [tblEDITransactionStructure]([Version],[TransactionSetID],[FunctionGroup],[SegmentCode],[MinLength],[MaxLength],[EDITypeNo_FK])

  SELECT [Version],[TransactionSetID],[FunctionGroup],'RMT',0,1,1
  FROM [tblEDITransactionStructure]
  WHERE [TransactionSetID] = '820'
  GROUP BY [Version],[TransactionSetID],[FunctionGroup]

   INSERT INTO [tblEDITransactionStructure]([Version],[TransactionSetID],[FunctionGroup],[SegmentCode],[MinLength],[MaxLength],[EDITypeNo_FK])

  SELECT [Version],[TransactionSetID],[FunctionGroup],'ISA',1,1,1
  FROM [tblEDITransactionStructure]
  WHERE [TransactionSetID] = '861'
  GROUP BY [Version],[TransactionSetID],[FunctionGroup]

    INSERT INTO [tblEDITransactionStructure]([Version],[TransactionSetID],[FunctionGroup],[SegmentCode],[MinLength],[MaxLength],[EDITypeNo_FK])

  SELECT [Version],[TransactionSetID],[FunctionGroup],'GS',1,1,1
  FROM [tblEDITransactionStructure]
  WHERE [TransactionSetID] = '861'
  GROUP BY [Version],[TransactionSetID],[FunctionGroup]

  INSERT INTO [tblEDITransactionStructure]([Version],[TransactionSetID],[FunctionGroup],[SegmentCode],[MinLength],[MaxLength],[EDITypeNo_FK])

  SELECT [Version],[TransactionSetID],[FunctionGroup],'GE',1,1,1
  FROM [tblEDITransactionStructure]
  WHERE [TransactionSetID] = '861'
  GROUP BY [Version],[TransactionSetID],[FunctionGroup]


INSERT INTO [tblEDITransactionStructure]([Version],[TransactionSetID],[FunctionGroup],[SegmentCode],[MinLength],[MaxLength],[EDITypeNo_FK])

  SELECT [Version],[TransactionSetID],[FunctionGroup],'IEA',1,1,1
  FROM [tblEDITransactionStructure]
  WHERE [TransactionSetID] = '861'
  GROUP BY [Version],[TransactionSetID],[FunctionGroup]


  SELECT [Version],[TransactionSetID],[FunctionGroup],'ISA',1,1,1
  FROM [tblEDITransactionStructure]
  WHERE [TransactionSetID] = '846'
  GROUP BY [Version],[TransactionSetID],[FunctionGroup]

    INSERT INTO [tblEDITransactionStructure]([Version],[TransactionSetID],[FunctionGroup],[SegmentCode],[MinLength],[MaxLength],[EDITypeNo_FK])

  SELECT [Version],[TransactionSetID],[FunctionGroup],'GS',1,1,1
  FROM [tblEDITransactionStructure]
  WHERE [TransactionSetID] = '846'
  GROUP BY [Version],[TransactionSetID],[FunctionGroup]

  INSERT INTO [tblEDITransactionStructure]([Version],[TransactionSetID],[FunctionGroup],[SegmentCode],[MinLength],[MaxLength],[EDITypeNo_FK])

  SELECT [Version],[TransactionSetID],[FunctionGroup],'GE',1,1,1
  FROM [tblEDITransactionStructure]
  WHERE [TransactionSetID] = '846'
  GROUP BY [Version],[TransactionSetID],[FunctionGroup]


INSERT INTO [tblEDITransactionStructure]([Version],[TransactionSetID],[FunctionGroup],[SegmentCode],[MinLength],[MaxLength],[EDITypeNo_FK])

  SELECT [Version],[TransactionSetID],[FunctionGroup],'IEA',1,1,1
  FROM [tblEDITransactionStructure]
  WHERE [TransactionSetID] = '846'
  GROUP BY [Version],[TransactionSetID],[FunctionGroup]

  INSERT INTO [tblEDITransactionStructure]([Version],[TransactionSetID],[FunctionGroup],[SegmentCode],[MinLength],[MaxLength],[EDITypeNo_FK])

  SELECT [Version],[TransactionSetID],[FunctionGroup],'IEA',1,1,1
  FROM [tblEDITransactionStructure]
   WHERE [EDITypeNo_FK] = 1
  GROUP BY [Version],[TransactionSetID],[FunctionGroup]

    INSERT INTO [tblEDITransactionStructure]([Version],[TransactionSetID],[FunctionGroup],[SegmentCode],[MinLength],[MaxLength],[EDITypeNo_FK])

  SELECT [Version],[TransactionSetID],[FunctionGroup],'BPS',0,1,1
  FROM [tblEDITransactionStructure]
  WHERE [TransactionSetID] = '142'
  GROUP BY [Version],[TransactionSetID],[FunctionGroup]

  UPDATE tblEDITransactionStructure
  SET MinLength = 0 
  WHERE SegmentCode in ('LQ','UNT','UIT')


  
   INSERT INTO [tblEDITransactionStructure]([Version],[TransactionSetID],[FunctionGroup],[SegmentCode],[MinLength],[MaxLength],[EDITypeNo_FK])

  SELECT [Version],'DELFOR',[FunctionGroup],[SegmentCode],1,1,2
  FROM [tblEDITransactionStructure]
  WHERE EDITypeNo_FK = 2 and [TransactionSetID] = 'CONTRL' and [SegmentCode] = 'UNB'
  GROUP BY [Version],[TransactionSetID],[FunctionGroup],[SegmentCode]

   INSERT INTO [tblEDITransactionStructure]([Version],[TransactionSetID],[FunctionGroup],[SegmentCode],[MinLength],[MaxLength],[EDITypeNo_FK])

  SELECT [Version],'DELFOR',[FunctionGroup],[SegmentCode],1,1,2
  FROM [tblEDITransactionStructure]
  WHERE EDITypeNo_FK = 2 and [TransactionSetID] = 'CONTRL' and [SegmentCode] = 'UNZ'
  GROUP BY [Version],[TransactionSetID],[FunctionGroup],[SegmentCode]
 

  INSERT INTO [tblEDITransactionStructure]([Version],[TransactionSetID],[FunctionGroup],[SegmentCode],[MinLength],[MaxLength],[EDITypeNo_FK])
   SELECT [Version],'DELJIT',[FunctionGroup],[SegmentCode],1,1,2
  FROM [tblEDITransactionStructure]
  WHERE EDITypeNo_FK = 2 and [TransactionSetID] = 'CONTRL' and [SegmentCode] = 'UNB'
  GROUP BY [Version],[TransactionSetID],[FunctionGroup],[SegmentCode]

   INSERT INTO [tblEDITransactionStructure]([Version],[TransactionSetID],[FunctionGroup],[SegmentCode],[MinLength],[MaxLength],[EDITypeNo_FK])

  SELECT [Version],'DELJIT',[FunctionGroup],[SegmentCode],1,1,2
  FROM [tblEDITransactionStructure]
  WHERE EDITypeNo_FK = 2 and [TransactionSetID] = 'CONTRL' and [SegmentCode] = 'UNZ'
  GROUP BY [Version],[TransactionSetID],[FunctionGroup],[SegmentCode]


  INSERT INTO [tblEDITransactionStructure]([Version],[TransactionSetID],[FunctionGroup],[SegmentCode],[MinLength],[MaxLength],[EDITypeNo_FK])
   SELECT [Version],'RECADV',[FunctionGroup],[SegmentCode],1,1,2
  FROM [tblEDITransactionStructure]
  WHERE EDITypeNo_FK = 2 and [TransactionSetID] = 'CONTRL' and [SegmentCode] = 'UNB'
  GROUP BY [Version],[TransactionSetID],[FunctionGroup],[SegmentCode]

   INSERT INTO [tblEDITransactionStructure]([Version],[TransactionSetID],[FunctionGroup],[SegmentCode],[MinLength],[MaxLength],[EDITypeNo_FK])

  SELECT [Version],'RECADV',[FunctionGroup],[SegmentCode],1,1,2
  FROM [tblEDITransactionStructure]
  WHERE EDITypeNo_FK = 2 and [TransactionSetID] = 'CONTRL' and [SegmentCode] = 'UNZ'
  GROUP BY [Version],[TransactionSetID],[FunctionGroup],[SegmentCode]


  
  INSERT INTO [tblEDITransactionStructure]([Version],[TransactionSetID],[FunctionGroup],[SegmentCode],[MinLength],[MaxLength],[EDITypeNo_FK])

  SELECT [Version],'APERAK',[FunctionGroup],[SegmentCode],1,1,2
  FROM [tblEDITransactionStructure]
  WHERE EDITypeNo_FK = 2 and [TransactionSetID] = 'CONTRL' and [SegmentCode] = 'UNB'
  GROUP BY [Version],[TransactionSetID],[FunctionGroup],[SegmentCode]

    INSERT INTO [tblEDITransactionStructure]([Version],[TransactionSetID],[FunctionGroup],[SegmentCode],[MinLength],[MaxLength],[EDITypeNo_FK])

  SELECT [Version],'APERAK',[FunctionGroup],[SegmentCode],1,1,2
  FROM [tblEDITransactionStructure]
  WHERE EDITypeNo_FK = 2 and [TransactionSetID] = 'CONTRL' and [SegmentCode] = 'UNZ'
  GROUP BY [Version],[TransactionSetID],[FunctionGroup],[SegmentCode]

   INSERT INTO [tblEDITransactionStructure]([Version],[TransactionSetID],[FunctionGroup],[SegmentCode],[MinLength],[MaxLength],[EDITypeNo_FK])
   SELECT [Version],'ORDERS',[FunctionGroup],[SegmentCode],1,1,2
  FROM [tblEDITransactionStructure]
  WHERE EDITypeNo_FK = 2 and [TransactionSetID] = 'CONTRL' and [SegmentCode] = 'UNB'
  GROUP BY [Version],[TransactionSetID],[FunctionGroup],[SegmentCode]

   INSERT INTO [tblEDITransactionStructure]([Version],[TransactionSetID],[FunctionGroup],[SegmentCode],[MinLength],[MaxLength],[EDITypeNo_FK])

  SELECT [Version],'ORDERS',[FunctionGroup],[SegmentCode],1,1,2
  FROM [tblEDITransactionStructure]
  WHERE EDITypeNo_FK = 2 and [TransactionSetID] = 'CONTRL' and [SegmentCode] = 'UNZ'
  GROUP BY [Version],[TransactionSetID],[FunctionGroup],[SegmentCode]


  UPDATE tblEDITransactionStructure
  SET MinLength = 0 
  WHERE SegmentCode in ('MSG','FA2') and TransactionSetId = '810'


    INSERT INTO [tblEDITransactionStructure]([Version],[TransactionSetID],[FunctionGroup],[SegmentCode],[MinLength],[MaxLength],[EDITypeNo_FK])

  SELECT [Version],[TransactionSetID],[FunctionGroup],'J2X',0,1,1
  FROM [tblEDITransactionStructure]
  WHERE [TransactionSetID] = '830'
  GROUP BY [Version],[TransactionSetID],[FunctionGroup]

  SELECT [Version],[TransactionSetID],[FunctionGroup],'ISA',1,1,1
  FROM [tblEDITransactionStructure]
  WHERE [TransactionSetID] = '846'
  GROUP BY [Version],[TransactionSetID],[FunctionGroup]

    INSERT INTO [tblEDITransactionStructure]([Version],[TransactionSetID],[FunctionGroup],[SegmentCode],[MinLength],[MaxLength],[EDITypeNo_FK])

  SELECT [Version],[TransactionSetID],[FunctionGroup],'GS',1,1,1
  FROM [tblEDITransactionStructure]
  WHERE [TransactionSetID] = '846'
  GROUP BY [Version],[TransactionSetID],[FunctionGroup]

  INSERT INTO [tblEDITransactionStructure]([Version],[TransactionSetID],[FunctionGroup],[SegmentCode],[MinLength],[MaxLength],[EDITypeNo_FK])

  SELECT [Version],[TransactionSetID],[FunctionGroup],'GE',1,1,1
  FROM [tblEDITransactionStructure]
  WHERE [TransactionSetID] = '846'
  GROUP BY [Version],[TransactionSetID],[FunctionGroup]


INSERT INTO [tblEDITransactionStructure]([Version],[TransactionSetID],[FunctionGroup],[SegmentCode],[MinLength],[MaxLength],[EDITypeNo_FK])

  SELECT [Version],[TransactionSetID],[FunctionGroup],'IEA',1,1,1
  FROM [tblEDITransactionStructure]
  WHERE [TransactionSetID] = '846'
  GROUP BY [Version],[TransactionSetID],[FunctionGroup]