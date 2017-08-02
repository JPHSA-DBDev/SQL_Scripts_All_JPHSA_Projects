--p_0021_SP_005_MultipleMonths_B_and_C_values_v0.sql
/*
	SET THE DATE RANGE FIRST

	************************************************************************************
	This version assumes that all the data has been added to the ARCHIVE tables, 
		(using the script: p_0021_SP_001_INSERT_INTO_T003_T004_and_ARCHIVEs_from_uploaded_BillableServices_v6.sql)
		and this script pulls data from there.		
	Uses: 

			Line # ----- Source -----					Line Title
			Line: [4]----Source: [B-001]-----Description: [East Jefferson Health Center]
			Line: [5]----Source: [C-001]-----Description: [Adults]
			Line: [6]----Source: [B-001-C-001]-----Description: [Children]
			Line: [7]----Source: [B-002]-----Description: [West JeffersonHealth Center]
			Line: [8]----Source: [C-002]-----Description: [Adults]
			Line: [9]----Source: [(B-002 - C-002)]-----Description: [Children]
			Line: [10]----Source: [( B-001 + B-002)]-----Description: [Total Visits]
			Line: [11]----Source: [(C-001 + C-002)]-----Description: [Adults]
			Line: [12]----Source: [( B-001 + B-002) - (C-001 + C-002)]-----Description: [Children]
			Line: [35]----Source: [B-003]-----Description: [East Jefferson Health Center]
			Line: [36]----Source: [C-003]-----Description: [Adults]
			Line: [37]----Source: [(B-003 - C-003)]-----Description: [Children]
			Line: [38]----Source: [B-004]-----Description: [West JeffersonHealth Center]
			Line: [39]----Source: [C-004]-----Description: [Adults]
			Line: [40]----Source: [(B-004 - C-004)]-----Description: [Children]
			Line: [41]----Source: [(B-003 + B-004)]-----Description: [Total Visits]
			Line: [42]----Source: [(C-003 + C-004)]-----Description: [Adults]
			Line: [43]----Source: [(B-003 + B-004) - (C-003 + C-004)]-----Description: [Children]
			Line: [65]----Source: [( B-001 + B-002) + (B-003 + B-004)]-----Description: [Total Visits]


	Created: 03/14/2017
	Modified: 4/18/2017 for multiple months
	By: glenn garson
	************************************************************************************
*/
USE [Success];
GO


DECLARE @BeginDate_DateRange as date
DECLARE @EndDate_DateRange as date
SELECT @BeginDate_DateRange = '11-01-2016'
SELECT @EndDate_DateRange = '01-31-2017'	


IF OBJECT_ID('dbo.zzz_p0021_20_DataFromARCHIVE_for_DateRange') IS NOT NULL
    DROP TABLE dbo.zzz_p0021_20_DataFromARCHIVE_for_DateRange

SELECT [ARCHIVE_T003_PK]
      ,[CHECKMONTH]
	  , (SELECT 'TheCalculation' =  [Data_for_Year_YYYY] + '_' + [Data_for_Month_MM] ) AS [YYYY_MM]
      ,[Data_for_Month_MM]
      ,[Data_for_Year_YYYY]
      ,[Office_Location]
      ,[Office_Name]
      ,[Bill_Provider_Name]
      ,[Bill_Provider_Specialty]
      ,[Provider_Type]
      ,[Patient_Name]
      ,[Patient_No]
      ,[Patient_Birth_Date]
      ,[Check-In_Day]
      ,[Check-Out_Day]
      ,[CPT_Code]
      ,[Service]
      ,[CPT_Description]
      ,[Unit_Qty]
      ,[LOC]
      ,[Age_as_of_Check-In]
      ,[Adult]
      ,[DateTime_Archived]
INTO	dbo.zzz_p0021_20_DataFromARCHIVE_for_DateRange
FROM [Success].[dbo].[T003_ARCHIVE_Billable_Services_IDR]
WHERE	
		([Check-In_Day]  >= @BeginDate_DateRange)
		AND
		([Check-In_Day]  <= @EndDate_DateRange)


----------------------- Local Variables
   DECLARE @LineNumber int
   DECLARE @Source nvarchar(100)
   DECLARE @Title nvarchar(255)
----------------------------------------
IF OBJECT_ID('dbo.zzz_p0021_21_IDR_part_B_and_C') IS NOT NULL
    DROP TABLE dbo.zzz_p0021_21_IDR_part_B_and_C


CREATE TABLE [dbo].[zzz_p0021_21_IDR_part_B_and_C]
(
		[IDR_a_b_PK] [int] IDENTITY(1,1) NOT NULL,		
		[LineNumber] [int] NOT NULL,
		[Source] nvarchar(100) NOT NULL,
		[Line_Title] nvarchar(255) NOT NULL,
		[DateTime_Created] [datetime] NOT NULL CONSTRAINT IDR_a_b_TheDateTime_Default_GETDATE DEFAULT GETDATE(),
		[Result] [int] NOT NULL,
		[YYYY_MM] nvarchar(7),
		[IDR_a_b_RowVersion] [timestamp] NULL
	,CONSTRAINT [zzz_p0021_21_IDR_part_B_and_C$IDR_a_b_PK] PRIMARY KEY NONCLUSTERED 
		(
			[IDR_a_b_PK] ASC
		)
		WITH 
				(
					PAD_INDEX  = OFF, 
					STATISTICS_NORECOMPUTE  = OFF, 
					IGNORE_DUP_KEY = OFF, 
					ALLOW_ROW_LOCKS  = ON, 
					ALLOW_PAGE_LOCKS  = ON
				) ON [PRIMARY]
)

--Line: [4]----Source: [B-001]-----Description: [East Jefferson Health Center] =================================START

SELECT @LineNumber = 4
SELECT @Source = '[B-001]'
SELECT @Title = '[East Jefferson Health Center]'
;
WITH cte_Line_4
AS
(
	SELECT distinct
		  [Office_Location],
		  [Bill_Provider_Name],
		  [Patient_No],
		  [Patient_Name],
		  [Check-In_Day],
		  --------------------New Distinct fields below this line
		  [YYYY_MM]
	  FROM [Success].[dbo].[zzz_p0021_20_DataFromARCHIVE_for_DateRange]
	  Where (
				[Office_Location] = 'EB JeffCare'
				AND
				Bill_Provider_Specialty = 'FAMILY PRACTICE'
			)
)


INSERT INTO [Success].[dbo].[zzz_p0021_21_IDR_part_B_and_C] 
		(
		[LineNumber],
		[Source],
		[Line_Title],
		[YYYY_MM],
		[Result]
		)
SELECT DISTINCT
			@LineNumber as [LineNumber]
			,@Source as [Source]
			,@Title as [Title]
			,[YYYY_MM]
			, Count(*) OVER(PARTITION BY [YYYY_MM]) As [Result]
FROM cte_Line_4 
ORDER BY YYYY_MM



--SELECT * from [Success].[dbo].[zzz_p0021_21_IDR_part_B_and_C] 

----Line: [5]----Source: [C-001]-----Description: [Adults] =================================START

SELECT @LineNumber = 5
SELECT @Source = '[C-001]'
SELECT @Title = '[Adults]'
;
WITH cte_Line_5
AS
(
	SELECT distinct
		  [Office_Location],
		  [Bill_Provider_Name],
		  [Patient_No],
		  [Patient_Name],
		  [Check-In_Day],
		  --------------------New Distinct fields below this line
		  [YYYY_MM]
	  FROM [Success].[dbo].[zzz_p0021_20_DataFromARCHIVE_for_DateRange]
	  Where (
				[Office_Location] = 'EB JeffCare'
				AND
				Bill_Provider_Specialty = 'FAMILY PRACTICE'
				AND
				Adult = 1
			)
)
INSERT INTO [Success].[dbo].[zzz_p0021_21_IDR_part_B_and_C] 
		(
		[LineNumber],
		[Source],
		[Line_Title],
		[YYYY_MM],
		[Result]
		)
SELECT DISTINCT
			@LineNumber as [LineNumber]
			,@Source as [Source]
			,@Title as [Title]
			,[YYYY_MM]
			, Count(*) OVER(PARTITION BY [YYYY_MM]) As [Result]
FROM cte_Line_5 
ORDER BY YYYY_MM

----Line: [6]----Source: [B-001-C-001]-----Description: [Children]

SELECT @LineNumber = 6
SELECT @Source = '[B-001-C-001]'
SELECT @Title = '[Children]'



;WITH CTE_4minus5
AS 
(
SELECT  
      [LineNumber]
      ,[Source]
      ,[Line_Title]
      ,[DateTime_Created]
      ,(SELECT     'TheCalculation' = 
			 CASE 
						WHEN [LineNumber] = 4 
						   THEN [Result] 
						WHEN [LineNumber] = 5 
						   THEN -[Result] 
						ELSE 0 
				   END) as [Result] 	  	  		  
	  
      ,[YYYY_MM]

  FROM [Success].[dbo].[zzz_p0021_21_IDR_part_B_and_C]
    WHERE 
		[LineNumber] = 4
		or 
		[LineNumber] = 5
)

--SELECT * FROM CTE_4minus5

,CTE_4minus5_RESULTS
AS
(
SELECT DISTINCT
      SUM([Result]) OVER(PARTITION BY [YYYY_MM]) AS RESULT
      ,[YYYY_MM]
FROM CTE_4minus5

)


INSERT INTO [Success].[dbo].[zzz_p0021_21_IDR_part_B_and_C] 
		(
		[LineNumber],
		[Source],
		[Line_Title],
		[YYYY_MM],
		[Result]
		)
SELECT DISTINCT
			@LineNumber as [LineNumber]
			,@Source as [Source]
			,@Title as [Title]
			,[YYYY_MM]
			,[Result]
FROM CTE_4minus5_RESULTS 
ORDER BY YYYY_MM




----Line: [7]----Source: [B-002]-----Description: [West JeffersonHealth Center]

SELECT @LineNumber = 7
SELECT @Source = '[B-002]'
SELECT @Title = '[West JeffersonHealth Center]'

;
WITH cte_Line_7
AS
(
	SELECT distinct
		  [Office_Location],
		  [Bill_Provider_Name],
		  [Patient_No],
		  [Patient_Name],
		  [Check-In_Day],
		  --------------------New Distinct fields below this line
		  [YYYY_MM]
	  FROM [Success].[dbo].[zzz_p0021_20_DataFromARCHIVE_for_DateRange]
	  Where (
				[Office_Location] = 'WB JeffCare'
				AND
				Bill_Provider_Specialty = 'FAMILY PRACTICE'
			)
)


INSERT INTO [Success].[dbo].[zzz_p0021_21_IDR_part_B_and_C] 
		(
		[LineNumber],
		[Source],
		[Line_Title],
		[YYYY_MM],
		[Result]
		)
SELECT DISTINCT
			@LineNumber as [LineNumber]
			,@Source as [Source]
			,@Title as [Title]
			,[YYYY_MM]
			, Count(*) OVER(PARTITION BY [YYYY_MM]) As [Result]
FROM cte_Line_7 
ORDER BY YYYY_MM


----Line: [8]----Source: [C-002]-----Description: [Adults]

SELECT @LineNumber =8
SELECT @Source = '[C-002]'
SELECT @Title = '[Adults]'
;
WITH cte_Line_8
AS
(
	SELECT distinct
		  [Office_Location],
		  [Bill_Provider_Name],
		  [Patient_No],
		  [Patient_Name],
		  [Check-In_Day],
		  --------------------New Distinct fields below this line
		  [YYYY_MM]
	  FROM [Success].[dbo].[zzz_p0021_20_DataFromARCHIVE_for_DateRange]
	  --Where (
			--	[Office_Location] = 'WB JeffCare'
			--	AND
			--	Bill_Provider_Specialty = 'FAMILY PRACTICE'
			--)

	  Where (
				[Office_Location] = 'WB JeffCare'
				AND
				Bill_Provider_Specialty = 'FAMILY PRACTICE'
				AND
				Adult = 1
			)

)


INSERT INTO [Success].[dbo].[zzz_p0021_21_IDR_part_B_and_C] 
		(
		[LineNumber],
		[Source],
		[Line_Title],
		[YYYY_MM],
		[Result]
		)
SELECT DISTINCT
			@LineNumber as [LineNumber]
			,@Source as [Source]
			,@Title as [Title]
			,[YYYY_MM]
			, Count(*) OVER(PARTITION BY [YYYY_MM]) As [Result]
FROM cte_Line_8 
ORDER BY YYYY_MM



----Line: [9]----Source: [(B-002 - C-002)]-----Description: [Children]


SELECT @LineNumber =9
SELECT @Source = '[(B-002 - C-002)]'
SELECT @Title = '[Children]'



;WITH CTE_7minus8
AS 
(
SELECT  
      [LineNumber]
      ,[Source]
      ,[Line_Title]
      ,[DateTime_Created]
      ,(SELECT     'TheCalculation' = 
			 CASE 
						WHEN [LineNumber] = 7 
						   THEN [Result] 
						WHEN [LineNumber] = 8 
						   THEN -[Result] 
						ELSE 0 
				   END) as [Result] 	  	  		  
	  
      ,[YYYY_MM]

  FROM [Success].[dbo].[zzz_p0021_21_IDR_part_B_and_C]
    WHERE 
		[LineNumber] = 7
		or 
		[LineNumber] = 8
)


,CTE_7minus8_RESULTS
AS
(
SELECT DISTINCT
      SUM([Result]) OVER(PARTITION BY [YYYY_MM]) AS RESULT
      ,[YYYY_MM]
FROM CTE_7minus8

)


INSERT INTO [Success].[dbo].[zzz_p0021_21_IDR_part_B_and_C] 
		(
		[LineNumber],
		[Source],
		[Line_Title],
		[YYYY_MM],
		[Result]
		)
SELECT DISTINCT
			@LineNumber as [LineNumber]
			,@Source as [Source]
			,@Title as [Title]
			,[YYYY_MM]
			,[Result]
FROM CTE_7minus8_RESULTS 
ORDER BY YYYY_MM



----Line: [10]----Source: [( B-001 + B-002)]-----Description: [Total Visits]


SELECT @LineNumber =10
SELECT @Source = '[( B-001 + B-002)]'
SELECT @Title = '[Total Visits]'

;WITH CTE_4plus7
AS 
(
SELECT  
      [LineNumber]
      ,[Source]
      ,[Line_Title]
      ,[DateTime_Created]
      ,(SELECT     'TheCalculation' = 
			 CASE 
						WHEN [LineNumber] = 4 
						   THEN [Result] 
						WHEN [LineNumber] = 7 
						   THEN [Result] 
						ELSE 0 
				   END) as [Result] 	  	  		  
	  
      ,[YYYY_MM]

  FROM [Success].[dbo].[zzz_p0021_21_IDR_part_B_and_C]
    WHERE 
		[LineNumber] = 4
		or 
		[LineNumber] = 7
)


,CTE_4plus7_RESULTS
AS
(
SELECT DISTINCT
      SUM([Result]) OVER(PARTITION BY [YYYY_MM]) AS RESULT
      ,[YYYY_MM]
FROM CTE_4plus7

)


INSERT INTO [Success].[dbo].[zzz_p0021_21_IDR_part_B_and_C] 
		(
		[LineNumber],
		[Source],
		[Line_Title],
		[YYYY_MM],
		[Result]
		)
SELECT DISTINCT
			@LineNumber as [LineNumber]
			,@Source as [Source]
			,@Title as [Title]
			,[YYYY_MM]
			,[Result]
FROM CTE_4plus7_RESULTS 
ORDER BY YYYY_MM



----Line: [11]----Source: [(C-001 + C-002)]-----Description: [Adults]


SELECT @LineNumber =11
SELECT @Source = '[(C-001 + C-002)]'
SELECT @Title = '[Adults]'


;WITH CTE_5plus8
AS 
(
SELECT  
      [LineNumber]
      ,[Source]
      ,[Line_Title]
      ,[DateTime_Created]
      ,(SELECT     'TheCalculation' = 
			 CASE 
						WHEN [LineNumber] = 5 
						   THEN [Result] 
						WHEN [LineNumber] = 8 
						   THEN [Result] 
						ELSE 0 
				   END) as [Result] 	  	  		  
	  
      ,[YYYY_MM]

  FROM [Success].[dbo].[zzz_p0021_21_IDR_part_B_and_C]
    WHERE 
		[LineNumber] = 5
		or 
		[LineNumber] = 8
)


,CTE_5plus8_RESULTS
AS
(
SELECT DISTINCT
      SUM([Result]) OVER(PARTITION BY [YYYY_MM]) AS RESULT
      ,[YYYY_MM]
FROM CTE_5plus8

)


INSERT INTO [Success].[dbo].[zzz_p0021_21_IDR_part_B_and_C] 
		(
		[LineNumber],
		[Source],
		[Line_Title],
		[YYYY_MM],
		[Result]
		)
SELECT DISTINCT
			@LineNumber as [LineNumber]
			,@Source as [Source]
			,@Title as [Title]
			,[YYYY_MM]
			,[Result]
FROM CTE_5plus8_RESULTS 
ORDER BY YYYY_MM


----Line: [12]----Source: [( B-001 + B-002) - (C-001 + C-002)]-----Description: [Children]


SELECT @LineNumber =12
SELECT @Source = '[( B-001 + B-002) - (C-001 + C-002)]'
SELECT @Title = '[Children]'


;WITH CTE_4plus7minus5minus8
AS 
(
SELECT  
      [LineNumber]
      ,[Source]
      ,[Line_Title]
      ,[DateTime_Created]
      ,(SELECT     'TheCalculation' = 
			 CASE 
						WHEN [LineNumber] = 4 
						   THEN [Result] 
						WHEN [LineNumber] = 7 
						   THEN [Result] 
						WHEN [LineNumber] = 5 
						   THEN -[Result] 
						WHEN [LineNumber] = 8 
						   THEN -[Result] 
						ELSE 0 
				   END) as [Result] 	  	  		  
	  
      ,[YYYY_MM]

  FROM [Success].[dbo].[zzz_p0021_21_IDR_part_B_and_C]
    WHERE 
		[LineNumber] = 4
		or 
		[LineNumber] = 7
		or 
		[LineNumber] = 5
		or 
		[LineNumber] = 8
)


,CTE_4plus7minus5minus8_RESULTS
AS
(
SELECT DISTINCT
      SUM([Result]) OVER(PARTITION BY [YYYY_MM]) AS RESULT
      ,[YYYY_MM]
FROM CTE_4plus7minus5minus8

)


INSERT INTO [Success].[dbo].[zzz_p0021_21_IDR_part_B_and_C] 
		(
		[LineNumber],
		[Source],
		[Line_Title],
		[YYYY_MM],
		[Result]
		)
SELECT DISTINCT
			@LineNumber as [LineNumber]
			,@Source as [Source]
			,@Title as [Title]
			,[YYYY_MM]
			,[Result]
FROM CTE_4plus7minus5minus8_RESULTS 
ORDER BY YYYY_MM



----Line: [35]----Source: [B-003]-----Description: [East Jefferson Health Center]

SELECT @LineNumber = 35
SELECT @Source = '[B-003]'
SELECT @Title = '[East Jefferson Health Center]'

;
WITH cte_Line_35
AS
(
	SELECT distinct
		  [Office_Location],
		  [Bill_Provider_Name],
		  [Patient_No],
		  [Patient_Name],
		  [Check-In_Day],
		  --------------------New Distinct fields below this line
		  [YYYY_MM]
	  FROM [Success].[dbo].[zzz_p0021_20_DataFromARCHIVE_for_DateRange]

	  Where (
				[Office_Location] = 'EB JeffCare'
				AND
				Bill_Provider_Specialty in ('FQHC - PSYCHIATRY', 'PSYCHIATRY')
			)

)


INSERT INTO [Success].[dbo].[zzz_p0021_21_IDR_part_B_and_C] 
		(
		[LineNumber],
		[Source],
		[Line_Title],
		[YYYY_MM],
		[Result]
		)
SELECT DISTINCT
			@LineNumber as [LineNumber]
			,@Source as [Source]
			,@Title as [Title]
			,[YYYY_MM]
			, Count(*) OVER(PARTITION BY [YYYY_MM]) As [Result]
FROM cte_Line_35 
ORDER BY YYYY_MM

----Line: [36]----Source: [C-003]-----Description: [Adults]


SELECT @LineNumber = 36
SELECT @Source = '[C-003]'
SELECT @Title = '[Adults]'

;
WITH cte_Line_36
AS
(
	SELECT distinct
		  [Office_Location],
		  [Bill_Provider_Name],
		  [Patient_No],
		  [Patient_Name],
		  [Check-In_Day],
		  --------------------New Distinct fields below this line
		  [YYYY_MM]
	  FROM [Success].[dbo].[zzz_p0021_20_DataFromARCHIVE_for_DateRange]

	  Where (
				[Office_Location] = 'EB JeffCare'
				AND
				Bill_Provider_Specialty in ('FQHC - PSYCHIATRY', 'PSYCHIATRY')
				AND
				Adult = 1
			)

)


INSERT INTO [Success].[dbo].[zzz_p0021_21_IDR_part_B_and_C] 
		(
		[LineNumber],
		[Source],
		[Line_Title],
		[YYYY_MM],
		[Result]
		)
SELECT DISTINCT
			@LineNumber as [LineNumber]
			,@Source as [Source]
			,@Title as [Title]
			,[YYYY_MM]
			, Count(*) OVER(PARTITION BY [YYYY_MM]) As [Result]
FROM cte_Line_36 
ORDER BY YYYY_MM

----Line: [37]----Source: [(B-003 - C-003)]-----Description: [Children]

SELECT @LineNumber =37
SELECT @Source = '[(B-003 - C-003)]'
SELECT @Title = '[Children]'

;WITH CTE_35minus36
AS 
(
SELECT  
      [LineNumber]
      ,[Source]
      ,[Line_Title]
      ,[DateTime_Created]
      ,(SELECT     'TheCalculation' = 
			 CASE 
						WHEN [LineNumber] = 35 
						   THEN [Result] 
						WHEN [LineNumber] = 36 
						   THEN -[Result] 
						ELSE 0 
				   END) as [Result] 	  	  		  
	  
      ,[YYYY_MM]

  FROM [Success].[dbo].[zzz_p0021_21_IDR_part_B_and_C]
    WHERE 
		[LineNumber] = 35
		or 
		[LineNumber] = 36
)

--SELECT * FROM CTE_35minus36

,CTE_35minus36_RESULTS
AS
(
SELECT DISTINCT
      SUM([Result]) OVER(PARTITION BY [YYYY_MM]) AS RESULT
      ,[YYYY_MM]
FROM CTE_35minus36

)


INSERT INTO [Success].[dbo].[zzz_p0021_21_IDR_part_B_and_C] 
		(
		[LineNumber],
		[Source],
		[Line_Title],
		[YYYY_MM],
		[Result]
		)
SELECT DISTINCT
			@LineNumber as [LineNumber]
			,@Source as [Source]
			,@Title as [Title]
			,[YYYY_MM]
			,[Result]
FROM CTE_35minus36_RESULTS 
ORDER BY YYYY_MM

----Line: [38]----Source: [B-004]-----Description: [West JeffersonHealth Center]

SELECT @LineNumber = 38
SELECT @Source = '[B-004]'
SELECT @Title = '[West JeffersonHealth Center]'

;
WITH cte_Line_38
AS
(
	SELECT distinct
		  [Office_Location],
		  [Bill_Provider_Name],
		  [Patient_No],
		  [Patient_Name],
		  [Check-In_Day],
		  --------------------New Distinct fields below this line
		  [YYYY_MM]
	  FROM [Success].[dbo].[zzz_p0021_20_DataFromARCHIVE_for_DateRange]
	  Where (
				[Office_Location] = 'WB JeffCare'
				AND
				Bill_Provider_Specialty in ('FQHC - PSYCHIATRY', 'PSYCHIATRY')
			)
)


INSERT INTO [Success].[dbo].[zzz_p0021_21_IDR_part_B_and_C] 
		(
		[LineNumber],
		[Source],
		[Line_Title],
		[YYYY_MM],
		[Result]
		)
SELECT DISTINCT
			@LineNumber as [LineNumber]
			,@Source as [Source]
			,@Title as [Title]
			,[YYYY_MM]
			, Count(*) OVER(PARTITION BY [YYYY_MM]) As [Result]
FROM cte_Line_38 
ORDER BY YYYY_MM

----Line: [39]----Source: [C-004]-----Description: [Adults]

SELECT @LineNumber =39
SELECT @Source = '[C-004]'
SELECT @Title = '[Adults]'

;
WITH cte_Line_39
AS
(
	SELECT distinct
		  [Office_Location],
		  [Bill_Provider_Name],
		  [Patient_No],
		  [Patient_Name],
		  [Check-In_Day],
		  --------------------New Distinct fields below this line
		  [YYYY_MM]
	  FROM [Success].[dbo].[zzz_p0021_20_DataFromARCHIVE_for_DateRange]
	  Where (
				[Office_Location] = 'WB JeffCare'
				AND
				Bill_Provider_Specialty in ('FQHC - PSYCHIATRY', 'PSYCHIATRY')
				AND
				Adult = 1
			)

)


INSERT INTO [Success].[dbo].[zzz_p0021_21_IDR_part_B_and_C] 
		(
		[LineNumber],
		[Source],
		[Line_Title],
		[YYYY_MM],
		[Result]
		)
SELECT DISTINCT
			@LineNumber as [LineNumber]
			,@Source as [Source]
			,@Title as [Title]
			,[YYYY_MM]
			, Count(*) OVER(PARTITION BY [YYYY_MM]) As [Result]
FROM cte_Line_39 
ORDER BY YYYY_MM



----Line: [40]----Source: [(B-004 - C-004)]-----Description: [Children]

SELECT @LineNumber =40
SELECT @Source = '[(B-004 - C-004)]'
SELECT @Title = '[Children]'


;WITH CTE_38minus39
AS 
(
SELECT  
      [LineNumber]
      ,[Source]
      ,[Line_Title]
      ,[DateTime_Created]
      ,(SELECT     'TheCalculation' = 
			 CASE 
						WHEN [LineNumber] = 38 
						   THEN [Result] 
						WHEN [LineNumber] = 39 
						   THEN -[Result] 
						ELSE 0 
				   END) as [Result] 	  	  		  
	  
      ,[YYYY_MM]

  FROM [Success].[dbo].[zzz_p0021_21_IDR_part_B_and_C]
    WHERE 
		[LineNumber] = 38
		or 
		[LineNumber] = 39
)

--SELECT * FROM CTE_38minus39

,CTE_38minus39_RESULTS
AS
(
SELECT DISTINCT
      SUM([Result]) OVER(PARTITION BY [YYYY_MM]) AS RESULT
      ,[YYYY_MM]
FROM CTE_38minus39

)


INSERT INTO [Success].[dbo].[zzz_p0021_21_IDR_part_B_and_C] 
		(
		[LineNumber],
		[Source],
		[Line_Title],
		[YYYY_MM],
		[Result]
		)
SELECT DISTINCT
			@LineNumber as [LineNumber]
			,@Source as [Source]
			,@Title as [Title]
			,[YYYY_MM]
			,[Result]
FROM CTE_38minus39_RESULTS 
ORDER BY YYYY_MM

----Line: [41]----Source: [(B-003 + B-004)]-----Description: [Total Visits]

SELECT @LineNumber =41
SELECT @Source = '[(B-003 + B-004)]'
SELECT @Title = '[Total Visits]'


;WITH CTE_35plus38
AS 
(
SELECT  
      [LineNumber]
      ,[Source]
      ,[Line_Title]
      ,[DateTime_Created]
      ,(SELECT     'TheCalculation' = 
			 CASE 
						WHEN [LineNumber] = 35 
						   THEN [Result] 
						WHEN [LineNumber] = 38 
						   THEN [Result] 
						ELSE 0 
				   END) as [Result] 	  	  		  
	  
      ,[YYYY_MM]

  FROM [Success].[dbo].[zzz_p0021_21_IDR_part_B_and_C]
    WHERE 
		[LineNumber] = 35
		or 
		[LineNumber] = 38
)


,CTE_35plus38_RESULTS
AS
(
SELECT DISTINCT
      SUM([Result]) OVER(PARTITION BY [YYYY_MM]) AS RESULT
      ,[YYYY_MM]
FROM CTE_35plus38

)


INSERT INTO [Success].[dbo].[zzz_p0021_21_IDR_part_B_and_C] 
		(
		[LineNumber],
		[Source],
		[Line_Title],
		[YYYY_MM],
		[Result]
		)
SELECT DISTINCT
			@LineNumber as [LineNumber]
			,@Source as [Source]
			,@Title as [Title]
			,[YYYY_MM]
			,[Result]
FROM CTE_35plus38_RESULTS 
ORDER BY YYYY_MM


----Line: [42]----Source: [(C-003 + C-004)]-----Description: [Adults]

SELECT @LineNumber =42
SELECT @Source = '[(C-003 + C-004)]'
SELECT @Title = '[Adults]'


;WITH CTE_36plus39
AS 
(
SELECT  
      [LineNumber]
      ,[Source]
      ,[Line_Title]
      ,[DateTime_Created]
      ,(SELECT     'TheCalculation' = 
			 CASE 
						WHEN [LineNumber] = 36 
						   THEN [Result] 
						WHEN [LineNumber] = 39 
						   THEN [Result] 
						ELSE 0 
				   END) as [Result] 	  	  		  
	  
      ,[YYYY_MM]

  FROM [Success].[dbo].[zzz_p0021_21_IDR_part_B_and_C]
    WHERE 
		[LineNumber] = 36
		or 
		[LineNumber] = 39
)


,CTE_36plus39_RESULTS
AS
(
SELECT DISTINCT
      SUM([Result]) OVER(PARTITION BY [YYYY_MM]) AS RESULT
      ,[YYYY_MM]
FROM CTE_36plus39

)


INSERT INTO [Success].[dbo].[zzz_p0021_21_IDR_part_B_and_C] 
		(
		[LineNumber],
		[Source],
		[Line_Title],
		[YYYY_MM],
		[Result]
		)
SELECT DISTINCT
			@LineNumber as [LineNumber]
			,@Source as [Source]
			,@Title as [Title]
			,[YYYY_MM]
			,[Result]
FROM CTE_36plus39_RESULTS 
ORDER BY YYYY_MM



----Line: [43]----Source: [(B-003 + B-004) - (C-003 + C-004)]-----Description: [Children]

SELECT @LineNumber =43
SELECT @Source = '[(B-003 + B-004) - (C-003 + C-004)]'
SELECT @Title = '[Children]'


;WITH CTE_35plus38minus36minus39
AS 
(
SELECT  
      [LineNumber]
      ,[Source]
      ,[Line_Title]
      ,[DateTime_Created]
      ,(SELECT     'TheCalculation' = 
			 CASE 
						WHEN [LineNumber] = 35 
						   THEN [Result] 
						WHEN [LineNumber] = 38 
						   THEN [Result] 
						WHEN [LineNumber] = 36 
						   THEN -[Result] 
						WHEN [LineNumber] = 39 
						   THEN -[Result] 
						ELSE 0 
				   END) as [Result] 	  	  		  
	  
      ,[YYYY_MM]

  FROM [Success].[dbo].[zzz_p0021_21_IDR_part_B_and_C]
    WHERE 
		[LineNumber] = 35
		or 
		[LineNumber] = 38
		or 
		[LineNumber] = 36
		or 
		[LineNumber] = 39
)


,CTE_35plus38minus36minus39_RESULTS
AS
(
SELECT DISTINCT
      SUM([Result]) OVER(PARTITION BY [YYYY_MM]) AS RESULT
      ,[YYYY_MM]
FROM CTE_35plus38minus36minus39

)


INSERT INTO [Success].[dbo].[zzz_p0021_21_IDR_part_B_and_C] 
		(
		[LineNumber],
		[Source],
		[Line_Title],
		[YYYY_MM],
		[Result]
		)
SELECT DISTINCT
			@LineNumber as [LineNumber]
			,@Source as [Source]
			,@Title as [Title]
			,[YYYY_MM]
			,[Result]
FROM CTE_35plus38minus36minus39_RESULTS 
ORDER BY YYYY_MM

----	Line: [65]----Source: [( B-001 + B-002) + (B-003 + B-004)]-----Description: [Total Visits]

SELECT @LineNumber =65
SELECT @Source = '[( B-001 + B-002) + (B-003 + B-004)]'
SELECT @Title = ' [Total Visits]'


;WITH CTE_4plus7plus35plus38
AS 
(
SELECT  
      [LineNumber]
      ,[Source]
      ,[Line_Title]
      ,[DateTime_Created]
      ,(SELECT     'TheCalculation' = 
			 CASE 
						WHEN [LineNumber] = 4 
						   THEN [Result] 
						WHEN [LineNumber] = 7 
						   THEN [Result] 
						WHEN [LineNumber] = 35 
						   THEN [Result] 
						WHEN [LineNumber] = 38 
						   THEN [Result] 
						ELSE 0 
				   END) as [Result] 	  	  		  
	  
      ,[YYYY_MM]

  FROM [Success].[dbo].[zzz_p0021_21_IDR_part_B_and_C]
    WHERE 
		[LineNumber] = 4
		or 
		[LineNumber] = 7
		or 
		[LineNumber] = 35
		or 
		[LineNumber] = 38
)


,CTE_4plus7plus35plus38_RESULTS
AS
(
SELECT DISTINCT
      SUM([Result]) OVER(PARTITION BY [YYYY_MM]) AS RESULT
      ,[YYYY_MM]
FROM CTE_4plus7plus35plus38

)


INSERT INTO [Success].[dbo].[zzz_p0021_21_IDR_part_B_and_C] 
		(
		[LineNumber],
		[Source],
		[Line_Title],
		[YYYY_MM],
		[Result]
		)
SELECT DISTINCT
			@LineNumber as [LineNumber]
			,@Source as [Source]
			,@Title as [Title]
			,[YYYY_MM]
			,[Result]
FROM CTE_4plus7plus35plus38_RESULTS 
ORDER BY YYYY_MM

-----RESULTS TABLE
SELECT * FROM  [Success].[dbo].[zzz_p0021_21_IDR_part_B_and_C]