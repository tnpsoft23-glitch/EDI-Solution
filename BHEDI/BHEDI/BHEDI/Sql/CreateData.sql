-- Error Handle
  INSERT INTO tblErrorHandle(ErrorHandleCode,[Description])
  VALUES (0,'Do not check');
  
  INSERT INTO tblErrorHandle(ErrorHandleCode,[Description])
  VALUES (1,'Check all');
  
  INSERT INTO tblErrorHandle(ErrorHandleCode,[Description])
  VALUES (2,'Do not check mandatory segments missing');

  INSERT INTO tblErrorHandle(ErrorHandleCode,[Description])
  VALUES (3,'Do not check unrecognized segments');

  INSERT INTO tblErrorHandle(ErrorHandleCode,[Description])
  VALUES (4,'Do not check max loops');

-- EDI Type
  INSERT INTO tblEDIType(Name)
  VALUES ('X12');

  INSERT INTO tblEDIType(Name)
  VALUES ('EDIFACT');

  INSERT INTO tblEDIType(Name)
  VALUES ('VDA');

-- EDI Version
INSERT INTO tblEDIVersion([Version],[EDITypeNo_FK])
  VALUES ('002000',1);
  
  INSERT INTO tblEDIVersion([Version],[EDITypeNo_FK])
  VALUES ('002001',1);
 
  INSERT INTO tblEDIVersion([Version],[EDITypeNo_FK])
  VALUES ('002002',1);
  
  INSERT INTO tblEDIVersion([Version],[EDITypeNo_FK])
  VALUES ('002003',1);
   
  INSERT INTO tblEDIVersion([Version],[EDITypeNo_FK])
  VALUES ('002040',1);
  
  INSERT INTO tblEDIVersion([Version],[EDITypeNo_FK])
  VALUES ('002042',1);
 
  INSERT INTO tblEDIVersion([Version],[EDITypeNo_FK])
  VALUES ('003010',1);
  
  INSERT INTO tblEDIVersion([Version],[EDITypeNo_FK])
  VALUES ('003011',1);
 
  INSERT INTO tblEDIVersion([Version],[EDITypeNo_FK])
  VALUES ('003012',1);
  
  INSERT INTO tblEDIVersion([Version],[EDITypeNo_FK])
  VALUES ('003020',1);
 
  INSERT INTO tblEDIVersion([Version],[EDITypeNo_FK])
  VALUES ('003021',1);
  
  INSERT INTO tblEDIVersion([Version],[EDITypeNo_FK])
  VALUES ('003022',1);
   
  INSERT INTO tblEDIVersion([Version],[EDITypeNo_FK])
  VALUES ('003030',1);
  
  INSERT INTO tblEDIVersion([Version],[EDITypeNo_FK])
  VALUES ('003031',1);
 
  INSERT INTO tblEDIVersion([Version],[EDITypeNo_FK])
  VALUES ('003032',1);
  
  INSERT INTO tblEDIVersion([Version],[EDITypeNo_FK])
  VALUES ('003040',1);
 
  INSERT INTO tblEDIVersion([Version],[EDITypeNo_FK])
  VALUES ('003041',1);
  
  INSERT INTO tblEDIVersion([Version],[EDITypeNo_FK])
  VALUES ('003042',1);
 
  INSERT INTO tblEDIVersion([Version],[EDITypeNo_FK])
  VALUES ('003050',1);
  
  INSERT INTO tblEDIVersion([Version],[EDITypeNo_FK])
  VALUES ('003051',1);
   
  INSERT INTO tblEDIVersion([Version],[EDITypeNo_FK])
  VALUES ('003052',1);
  
  INSERT INTO tblEDIVersion([Version],[EDITypeNo_FK])
  VALUES ('003060',1);
 
  INSERT INTO tblEDIVersion([Version],[EDITypeNo_FK])
  VALUES ('003061',1);
  
  INSERT INTO tblEDIVersion([Version],[EDITypeNo_FK])
  VALUES ('003062',1);
 
  INSERT INTO tblEDIVersion([Version],[EDITypeNo_FK])
  VALUES ('003070',1);
  
  INSERT INTO tblEDIVersion([Version],[EDITypeNo_FK])
  VALUES ('003071',1);
 
  INSERT INTO tblEDIVersion([Version],[EDITypeNo_FK])
  VALUES ('003072',1);
  
  INSERT INTO tblEDIVersion([Version],[EDITypeNo_FK])
  VALUES ('004010',1);
   
  INSERT INTO tblEDIVersion([Version],[EDITypeNo_FK])
  VALUES ('004011',1);
  
  INSERT INTO tblEDIVersion([Version],[EDITypeNo_FK])
  VALUES ('004012',1);
 
  INSERT INTO tblEDIVersion([Version],[EDITypeNo_FK])
  VALUES ('004020',1);
  
  INSERT INTO tblEDIVersion([Version],[EDITypeNo_FK])
  VALUES ('004021',1);
 

  INSERT INTO tblEDIVersion([Version],[EDITypeNo_FK])
  VALUES ('004022',1);
  
  INSERT INTO tblEDIVersion([Version],[EDITypeNo_FK])
  VALUES ('004030',1);
 
  INSERT INTO tblEDIVersion([Version],[EDITypeNo_FK])
  VALUES ('004031',1);
  
  INSERT INTO tblEDIVersion([Version],[EDITypeNo_FK])
  VALUES ('004032',1);
   
  INSERT INTO tblEDIVersion([Version],[EDITypeNo_FK])
  VALUES ('004040',1);
  
  INSERT INTO tblEDIVersion([Version],[EDITypeNo_FK])
  VALUES ('004041',1);
 
  INSERT INTO tblEDIVersion([Version],[EDITypeNo_FK])
  VALUES ('004042',1);
  
  INSERT INTO tblEDIVersion([Version],[EDITypeNo_FK])
  VALUES ('004050',1);
 
  INSERT INTO tblEDIVersion([Version],[EDITypeNo_FK])
  VALUES ('004051',1);
  
  INSERT INTO tblEDIVersion([Version],[EDITypeNo_FK])
  VALUES ('004060',1);
 
  INSERT INTO tblEDIVersion([Version],[EDITypeNo_FK])
  VALUES ('004061',1);
  
  INSERT INTO tblEDIVersion([Version],[EDITypeNo_FK])
  VALUES ('005010',1);
   
  INSERT INTO tblEDIVersion([Version],[EDITypeNo_FK])
  VALUES ('005011',1);
  
  INSERT INTO tblEDIVersion([Version],[EDITypeNo_FK])
  VALUES ('005020',1);
 
  INSERT INTO tblEDIVersion([Version],[EDITypeNo_FK])
  VALUES ('005021',1);
  
  INSERT INTO tblEDIVersion([Version],[EDITypeNo_FK])
  VALUES ('005022',1);
 
  INSERT INTO tblEDIVersion([Version],[EDITypeNo_FK])
  VALUES ('005030',1);
  
  INSERT INTO tblEDIVersion([Version],[EDITypeNo_FK])
  VALUES ('005031',1);
 
  INSERT INTO tblEDIVersion([Version],[EDITypeNo_FK])
  VALUES ('005032',1);
  
  INSERT INTO tblEDIVersion([Version],[EDITypeNo_FK])
  VALUES ('005040',1);
   
  INSERT INTO tblEDIVersion([Version],[EDITypeNo_FK])
  VALUES ('005041',1);
  
  INSERT INTO tblEDIVersion([Version],[EDITypeNo_FK])
  VALUES ('005042',1);
 
  INSERT INTO tblEDIVersion([Version],[EDITypeNo_FK])
  VALUES ('005050',1);
  
  INSERT INTO tblEDIVersion([Version],[EDITypeNo_FK])
  VALUES ('006010',1);
 
  INSERT INTO tblEDIVersion([Version],[EDITypeNo_FK])
  VALUES ('006020',1);

  INSERT INTO tblEDIVersion([Version],[EDITypeNo_FK])
  VALUES ('D00A',2);

  INSERT INTO tblEDIVersion([Version],[EDITypeNo_FK])
  VALUES ('D00B',2);

  INSERT INTO tblEDIVersion([Version],[EDITypeNo_FK])
  VALUES ('D01A',2);

  INSERT INTO tblEDIVersion([Version],[EDITypeNo_FK])
  VALUES ('D01B',2);

  INSERT INTO tblEDIVersion([Version],[EDITypeNo_FK])
  VALUES ('D02A',2);

  INSERT INTO tblEDIVersion([Version],[EDITypeNo_FK])
  VALUES ('D02B',2);

   INSERT INTO tblEDIVersion([Version],[EDITypeNo_FK])
  VALUES ('D03A',2);

  INSERT INTO tblEDIVersion([Version],[EDITypeNo_FK])
  VALUES ('D03B',2);

  INSERT INTO tblEDIVersion([Version],[EDITypeNo_FK])
  VALUES ('D04A',2);

  INSERT INTO tblEDIVersion([Version],[EDITypeNo_FK])
  VALUES ('D04B',2);

    INSERT INTO tblEDIVersion([Version],[EDITypeNo_FK])
  VALUES ('D05A',2);

  INSERT INTO tblEDIVersion([Version],[EDITypeNo_FK])
  VALUES ('D05B',2);

  INSERT INTO tblEDIVersion([Version],[EDITypeNo_FK])
  VALUES ('D06A',2);

  INSERT INTO tblEDIVersion([Version],[EDITypeNo_FK])
  VALUES ('D06B',2);

  INSERT INTO tblEDIVersion([Version],[EDITypeNo_FK])
  VALUES ('D07A',2);

  INSERT INTO tblEDIVersion([Version],[EDITypeNo_FK])
  VALUES ('D07B',2);

  INSERT INTO tblEDIVersion([Version],[EDITypeNo_FK])
  VALUES ('D08A',2);

  INSERT INTO tblEDIVersion([Version],[EDITypeNo_FK])
  VALUES ('D08B',2);

  INSERT INTO tblEDIVersion([Version],[EDITypeNo_FK])
  VALUES ('D09A',2);

  INSERT INTO tblEDIVersion([Version],[EDITypeNo_FK])
  VALUES ('D09B',2);

  INSERT INTO tblEDIVersion([Version],[EDITypeNo_FK])
  VALUES ('D10A',2);

  INSERT INTO tblEDIVersion([Version],[EDITypeNo_FK])
  VALUES ('D10B',2);

  INSERT INTO tblEDIVersion([Version],[EDITypeNo_FK])
  VALUES ('D11A',2);

  INSERT INTO tblEDIVersion([Version],[EDITypeNo_FK])
  VALUES ('D11B',2);

  INSERT INTO tblEDIVersion([Version],[EDITypeNo_FK])
  VALUES ('D12A',2);

  INSERT INTO tblEDIVersion([Version],[EDITypeNo_FK])
  VALUES ('D12B',2);

  INSERT INTO tblEDIVersion([Version],[EDITypeNo_FK])
  VALUES ('D13A',2);

  INSERT INTO tblEDIVersion([Version],[EDITypeNo_FK])
  VALUES ('D13B',2);

  INSERT INTO tblEDIVersion([Version],[EDITypeNo_FK])
  VALUES ('D14A',2);

  INSERT INTO tblEDIVersion([Version],[EDITypeNo_FK])
  VALUES ('D93A',2);

  INSERT INTO tblEDIVersion([Version],[EDITypeNo_FK])
  VALUES ('D94A',2);

  INSERT INTO tblEDIVersion([Version],[EDITypeNo_FK])
  VALUES ('D94B',2);

  INSERT INTO tblEDIVersion([Version],[EDITypeNo_FK])
  VALUES ('D95A',2);

  INSERT INTO tblEDIVersion([Version],[EDITypeNo_FK])
  VALUES ('D95B',2);

  INSERT INTO tblEDIVersion([Version],[EDITypeNo_FK])
  VALUES ('D96A',2);

  INSERT INTO tblEDIVersion([Version],[EDITypeNo_FK])
  VALUES ('D96B',2);

  INSERT INTO tblEDIVersion([Version],[EDITypeNo_FK])
  VALUES ('D97A',2);

  INSERT INTO tblEDIVersion([Version],[EDITypeNo_FK])
  VALUES ('D97B',2);

  INSERT INTO tblEDIVersion([Version],[EDITypeNo_FK])
  VALUES ('D98A',2);

  INSERT INTO tblEDIVersion([Version],[EDITypeNo_FK])
  VALUES ('D98B',2);

  INSERT INTO tblEDIVersion([Version],[EDITypeNo_FK])
  VALUES ('D99A',2);

  INSERT INTO tblEDIVersion([Version],[EDITypeNo_FK])
  VALUES ('D99B',2);

  INSERT INTO tblEDIVersion([Version],[EDITypeNo_FK])
  VALUES ('01',3);


  INSERT INTO tblEDIVersion([Version],[EDITypeNo_FK])
  VALUES ('02',3);


---Trasaction Set
INSERT INTO tblEDITransactionSet(TransactionSetID,Description,InOut,EDITypeNo_FK) VALUES('142','Product Service Claim',0,1)
INSERT INTO tblEDITransactionSet(TransactionSetID,Description,InOut,EDITypeNo_FK) VALUES('810','Invoice',0,1)
INSERT INTO tblEDITransactionSet(TransactionSetID,Description,InOut,EDITypeNo_FK) VALUES('810','Invoice',1,1)
INSERT INTO tblEDITransactionSet(TransactionSetID,Description,InOut,EDITypeNo_FK) VALUES('820','Payment Order/Remittance Advice',0,1)
INSERT INTO tblEDITransactionSet(TransactionSetID,Description,InOut,EDITypeNo_FK) VALUES('824','Application Advice',0,1)
INSERT INTO tblEDITransactionSet(TransactionSetID,Description,InOut,EDITypeNo_FK) VALUES('830','Planning Schedule with Release Capability',0,1)
INSERT INTO tblEDITransactionSet(TransactionSetID,Description,InOut,EDITypeNo_FK) VALUES('832','Price/Sales Catalog',0,1)
INSERT INTO tblEDITransactionSet(TransactionSetID,Description,InOut,EDITypeNo_FK) VALUES('850','Purchase Order',0,1)
INSERT INTO tblEDITransactionSet(TransactionSetID,Description,InOut,EDITypeNo_FK) VALUES('856','Ship Notice/Manifest',0,1)
INSERT INTO tblEDITransactionSet(TransactionSetID,Description,InOut,EDITypeNo_FK) VALUES('856','Ship Notice/Manifest',1,1)
INSERT INTO tblEDITransactionSet(TransactionSetID,Description,InOut,EDITypeNo_FK) VALUES('860','Purchase Order Change Request',0,1)
INSERT INTO tblEDITransactionSet(TransactionSetID,Description,InOut,EDITypeNo_FK) VALUES('861','Receiving Advice/Acceptance Certificate',0,1)
INSERT INTO tblEDITransactionSet(TransactionSetID,Description,InOut,EDITypeNo_FK) VALUES('862','Shipping Schedule',0,1)
INSERT INTO tblEDITransactionSet(TransactionSetID,Description,InOut,EDITypeNo_FK) VALUES('864','Text Message',0,1)
INSERT INTO tblEDITransactionSet(TransactionSetID,Description,InOut,EDITypeNo_FK) VALUES('997','Functional Acknowledgment',0,1)
INSERT INTO tblEDITransactionSet(TransactionSetID,Description,InOut,EDITypeNo_FK) VALUES('997','Functional Acknowledgment',1,1)
INSERT INTO tblEDITransactionSet(TransactionSetID,Description,InOut,EDITypeNo_FK) VALUES('CONTRL','Functional Acknowledgment',1,2)
INSERT INTO tblEDITransactionSet(TransactionSetID,Description,InOut,EDITypeNo_FK) VALUES('CONTRL','Functional Acknowledgment',0,2)
INSERT INTO tblEDITransactionSet(TransactionSetID,Description,InOut,EDITypeNo_FK) VALUES('DELFOR','Delivery Schedule Message',0,2)
INSERT INTO tblEDITransactionSet(TransactionSetID,Description,InOut,EDITypeNo_FK) VALUES('DELJIT','Delivery Just In Time Message',0,2)
INSERT INTO tblEDITransactionSet(TransactionSetID,Description,InOut,EDITypeNo_FK) VALUES('DESADV','Despatch Advice',0,2)
INSERT INTO tblEDITransactionSet(TransactionSetID,Description,InOut,EDITypeNo_FK) VALUES('RECADV','Receiving Advise Message',0,2)
INSERT INTO tblEDITransactionSet(TransactionSetID,Description,InOut,EDITypeNo_FK) VALUES('APERAK','Application Acknowledgment Message ',0,2)

INSERT INTO tblEDITransactionSet(TransactionSetID,Description,InOut,EDITypeNo_FK) VALUES('850','Purchase Order',1,1)
INSERT INTO tblEDITransactionSet(TransactionSetID,Description,InOut,EDITypeNo_FK) VALUES('812','Credit/Debit Adjustment',0,1)

INSERT INTO tblEDITransactionSet(TransactionSetID,Description,InOut,EDITypeNo_FK) VALUES('4095','Delivery Call-Offs',0,3)
INSERT INTO tblEDITransactionSet(TransactionSetID,Description,InOut,EDITypeNo_FK) VALUES('4913','Shipping Notice',1,3)
INSERT INTO tblEDITransactionSet(TransactionSetID,Description,InOut,EDITypeNo_FK) VALUES('846','Inventory Inquiry/Advice',0,1)

INSERT INTO tblEDITransactionSet(TransactionSetID,Description,InOut,EDITypeNo_FK) VALUES('855','Purchase Order Acknowledgment',0,1)
INSERT INTO tblEDITransactionSet(TransactionSetID,Description,InOut,EDITypeNo_FK) VALUES('855','Purchase Order Acknowledgment',1,1)

INSERT INTO tblEDITransactionSet(TransactionSetID,Description,InOut,EDITypeNo_FK) VALUES('ORDERS','Purchase Order',0,2)

INSERT INTO tblEDITransactionSet(TransactionSetID,Description,InOut,EDITypeNo_FK) VALUES('INVOIC','Invoice Message',1,2)

--Separate Character
 DECLARE @CHR AS INT;
  SET @CHR = 0;
  
  WHILE @CHR < 256
   BEGIN
	INSERT INTO tblSegmentTerminator(TerminatorCode,Terminator)
	VALUES (@CHR,CHAR(@CHR))

	SET @CHR = @CHR + 1;

	END

 -- Operator
  INSERT INTO tblOperator(OperatorCode,OperatorName)
	VALUES ('CK','Create Key')

	INSERT INTO tblOperator(OperatorCode,OperatorName)
	VALUES ('TR','Trim')

	INSERT INTO tblOperator(OperatorCode,OperatorName)
	VALUES ('AB','Add By')

	INSERT INTO tblOperator(OperatorCode,OperatorName)
	VALUES ('ABV','Add By Variable')

	INSERT INTO tblOperator(OperatorCode,OperatorName)
	VALUES ('SB','Subtract By')

	INSERT INTO tblOperator(OperatorCode,OperatorName)
	VALUES ('SBV','Subtract By Variable')

	INSERT INTO tblOperator(OperatorCode,OperatorName)
	VALUES ('DB','Divide By')

	INSERT INTO tblOperator(OperatorCode,OperatorName)
	VALUES ('DBV','Divide By Variable')

	INSERT INTO tblOperator(OperatorCode,OperatorName)
	VALUES ('MB','Multi By')

	INSERT INTO tblOperator(OperatorCode,OperatorName)
	VALUES ('MBV','Multi By Variable')


	INSERT INTO tblOperator(OperatorCode,OperatorName)
	VALUES ('RP','Replace')

	INSERT INTO tblOperator(OperatorCode,OperatorName)
	VALUES ('ATL','Add Text On Left')

	INSERT INTO tblOperator(OperatorCode,OperatorName)
	VALUES ('ATR','Add Text On Right')

	INSERT INTO tblOperator(OperatorCode,OperatorName)
	VALUES ('AVL','Add Variable On Left')

	INSERT INTO tblOperator(OperatorCode,OperatorName)
	VALUES ('AVR','Add Variable On Right')

	INSERT INTO tblOperator(OperatorCode,OperatorName)
	VALUES ('SV','Store To Variable')

	INSERT INTO tblOperator(OperatorCode,OperatorName)
	VALUES ('BE','Blank Current Expression')

	INSERT INTO tblOperator(OperatorCode,OperatorName)
	VALUES ('DC1','Convert CCYYMMDD To MM-DD-CCYY')

	INSERT INTO tblOperator(OperatorCode,OperatorName)
	VALUES ('DC2','Convert CCYYMMDD To MM/DD/CCYY')

	INSERT INTO tblOperator(OperatorCode,OperatorName)
	VALUES ('DC3','Convert CCYYMMDD To YYMMDD')

	INSERT INTO tblOperator(OperatorCode,OperatorName)
	VALUES ('DC4','Convert DD?MM?CCYY To CCYYMMDD')

	INSERT INTO tblOperator(OperatorCode,OperatorName)
	VALUES ('DC5','Convert MM?DD???YY To CCYYMMDD')

	INSERT INTO tblOperator(OperatorCode,OperatorName)
	VALUES ('DC6','Convert MM?DD???YY To YYMMDD')

	INSERT INTO tblOperator(OperatorCode,OperatorName)
	VALUES ('DC7','Convert YYMMDD To CCYYMMDD')

	INSERT INTO tblOperator(OperatorCode,OperatorName)
	VALUES ('DC8','Convert YYMMDD To MM-DD-CCYY')

	INSERT INTO tblOperator(OperatorCode,OperatorName)
	VALUES ('DC9','Convert YYMMDD To MM-DD-YY')

	INSERT INTO tblOperator(OperatorCode,OperatorName)
	VALUES ('DC10','Convert YYMMDD To MM/DD/CCYY')

	INSERT INTO tblOperator(OperatorCode,OperatorName)
	VALUES ('DC11','Convert YYMMDD To MM/DD/YY')

	INSERT INTO tblOperator(OperatorCode,OperatorName)
	VALUES ('DC12','Convert HHMM To HH:MM')

	INSERT INTO tblOperator(OperatorCode,OperatorName)
	VALUES ('DC13','Convert HHMMSS To HH:MM:SS')


	INSERT INTO tblOperator(OperatorCode,OperatorName)
	VALUES ('UC','Upper Case')

	INSERT INTO tblOperator(OperatorCode,OperatorName)
	VALUES ('LC','Lower Case')

	INSERT INTO tblOperator(OperatorCode,OperatorName)
	VALUES ('ST','Substring')

	INSERT INTO tblOperator(OperatorCode,OperatorName)
	VALUES ('PL','Pad Left')

	INSERT INTO tblOperator(OperatorCode,OperatorName)
	VALUES ('PR','Pad Right')

	INSERT INTO tblOperator(OperatorCode,OperatorName)
	VALUES ('NOT1','Do Notthing If Blank')

	INSERT INTO tblOperator(OperatorCode,OperatorName)
	VALUES ('NOT2','Do Notthing If Zero')

	INSERT INTO tblOperator(OperatorCode,OperatorName)
	VALUES ('GETD','Get Date')

	INSERT INTO tblOperator(OperatorCode,OperatorName)
	VALUES ('GETT','Get Time')

	INSERT INTO tblOperator(OperatorCode,OperatorName)
	VALUES ('DC14','Convert HH:MM:SS To HHMMSS')

	INSERT INTO tblOperator(OperatorCode,OperatorName)
	VALUES ('DC15','Convert HH:MM:SS To HHMM')

	INSERT INTO tblOperator(OperatorCode,OperatorName)
	VALUES ('SPLIT','Split And Get Element')

	INSERT INTO tblOperator(OperatorCode,OperatorName)
	VALUES ('CLEAR_VAR','Clear Variable Value')

	INSERT INTO tblOperator(OperatorCode,OperatorName)
	VALUES ('DC16','Convert YYWW or YYMM to Date')


	INSERT INTO tblOperator(OperatorCode,OperatorName)
	VALUES ('GETDNOW','Get Current Date')

	INSERT INTO tblOperator(OperatorCode,OperatorName)
	VALUES ('GETTNOW','Get Current Time')

	INSERT INTO tblOperator(OperatorCode,OperatorName)
	VALUES ('CONVDEC','Covert To Decimal')

	INSERT INTO tblOperator(OperatorCode,OperatorName)
	VALUES ('GETTIMEZONE','Get Time Zone Code')


	INSERT INTO tblERPType(ERPNo,ERPName)
	VALUES (1,'EKK SAP')

	INSERT INTO tblERPType(ERPNo,ERPName)
	VALUES (2,'UVI ERP')

	INSERT INTO tblOperator(OperatorCode,OperatorName)
	VALUES ('GETTSNOW','Get Current Time Until Second')


   -- EDI Segment
   INSERT INTO tblEDISegment(SegmentCode)
   SELECT SegmentCode
   FROM tblEDITransactionStructure
   where SegmentCode NOT IN (select SegmentCode from tblEDISegment)
   GROUP BY SegmentCode
