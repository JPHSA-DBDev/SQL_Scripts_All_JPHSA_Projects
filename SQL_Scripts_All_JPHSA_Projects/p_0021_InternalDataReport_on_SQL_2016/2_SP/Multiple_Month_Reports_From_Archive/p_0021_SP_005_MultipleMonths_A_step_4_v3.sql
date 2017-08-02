--p_0021_SP_005_MultipleMonths_A_step_4_v3.sql

--===========================================================================
/* 	
 
	DESCIPTION: This 
	NOTE: 

	Line: [14] , Source: [A-001] , ______________________________ Description: [East Jefferson Health Center]  , _______ Bill_Provider_Specialty [FAMILY PRACTICE]
	Line: [15] , Source: [A-002] , ______________________________ Description: [Adults]  , _____________________________ Bill_Provider_Specialty [FAMILY PRACTICE]
	Line: [16] , Source: [(A-001 - A-002)] , ____________________ Description: [Children]  , ___________________________ Bill_Provider_Specialty [FAMILY PRACTICE]
	Line: [17] , Source: [A-003] , ______________________________ Description: [West Jefferson Health Center]  , _______ Bill_Provider_Specialty [FAMILY PRACTICE]
	Line: [18] , Source: [A-004] , ______________________________ Description: [Adults]  , _____________________________ Bill_Provider_Specialty [FAMILY PRACTICE]
	Line: [19] , Source: [(A-003 - A-004)] , ____________________ Description: [Children]  , ___________________________ Bill_Provider_Specialty [FAMILY PRACTICE]
	Line: [20] , Source: [(A-001 + A003)] , _____________________ Description: [Total Services]  , _____________________ Bill_Provider_Specialty [FAMILY PRACTICE]
	Line: [21] , Source: [(A-002 + A-004)] , ____________________ Description: [Adults]  , _____________________________ Bill_Provider_Specialty [FAMILY PRACTICE]
	Line: [22] , Source: [(A-001 - A-002) + (A-003 - A-004)] , __ Description: [Children]  , ___________________________ Bill_Provider_Specialty [FAMILY PRACTICE]
	Line: [24] , Source: [A-005] , ______________________________ Description: [East Jefferson Health Center]  , _______ Bill_Provider_Specialty [FAMILY PRACTICE]
	Line: [25] , Source: [A-006] , ______________________________ Description: [Adults]  , _____________________________ Bill_Provider_Specialty [FAMILY PRACTICE]
	Line: [26] , Source: [(A-005 - A-006)] , ____________________ Description: [Children]  , ___________________________ Bill_Provider_Specialty [FAMILY PRACTICE]
	Line: [27] , Source: [A-007] , ______________________________ Description: [West Jefferson Health Center]  , _______ Bill_Provider_Specialty [FAMILY PRACTICE]
	Line: [28] , Source: [A-008] , ______________________________ Description: [Adults]  , _____________________________ Bill_Provider_Specialty [FAMILY PRACTICE]
	Line: [29] , Source: [(A-007 - A-008)] , ____________________ Description: [Children]  , ___________________________ Bill_Provider_Specialty [FAMILY PRACTICE]
	Line: [30] , Source: [A-009] , ______________________________ Description: [Total Unduplicated Individuals Served]  ,  Bill_Provider_Specialty [FAMILY PRACTICE]
	Line: [31] , Source: [A-010] , ______________________________ Description: [Adults]  , _____________________________ Bill_Provider_Specialty [FAMILY PRACTICE]
	Line: [32] , Source: [(A-009 - A010)] , _____________________ Description: [Children]  , ___________________________ Bill_Provider_Specialty [FAMILY PRACTICE]
	Line: [46] , Source: [A-011] , ______________________________ Description: [East Jefferson Health Center]  , _______ Bill_Provider_Specialty [FQHC - PSYCHIATRY. PSYCHIATRY]
	Line: [47] , Source: [A-012] , ______________________________ Description: [Adults]  , _____________________________ Bill_Provider_Specialty [FQHC - PSYCHIATRY. PSYCHIATRY]
	Line: [48] , Source: [(A-011 - A-012)] , ____________________ Description: [Children]  , ___________________________ Bill_Provider_Specialty [FQHC - PSYCHIATRY. PSYCHIATRY]
	Line: [49] , Source: [A-013] , ______________________________ Description: [West JeffersonHealth Center]  , ________ Bill_Provider_Specialty [FQHC - PSYCHIATRY. PSYCHIATRY]
	Line: [50] , Source: [A-014] , ______________________________ Description: [Adults]  , _____________________________ Bill_Provider_Specialty [FQHC - PSYCHIATRY. PSYCHIATRY]
	Line: [51] , Source: [(A-013 - A-014)] , ____________________ Description: [Children]  , ___________________________ Bill_Provider_Specialty [FQHC - PSYCHIATRY. PSYCHIATRY]
	Line: [52] , Source: [(A-011 + A-013)] , ____________________ Description: [Total Services]  , _____________________ Bill_Provider_Specialty [FQHC - PSYCHIATRY. PSYCHIATRY]
	Line: [53] , Source: [(A-012 + A-014)] , ____________________ Description: [Adults]  , _____________________________ Bill_Provider_Specialty [FQHC - PSYCHIATRY. PSYCHIATRY]
	Line: [54] , Source: [(A-011 + A-013) - (A-012 + A-014)] , __ Description: [Children]  , ___________________________ Bill_Provider_Specialty [FQHC - PSYCHIATRY. PSYCHIATRY]
	Line: [56] , Source: [A-015] , ______________________________ Description: [East Jefferson Health Center]  , _______ Bill_Provider_Specialty [FQHC - PSYCHIATRY. PSYCHIATRY]
	Line: [57] , Source: [A-016] , ______________________________ Description: [Adults]  , _____________________________ Bill_Provider_Specialty [FQHC - PSYCHIATRY. PSYCHIATRY]
	Line: [58] , Source: [(A-015 - A-016)] , ____________________ Description: [Children]  , ___________________________ Bill_Provider_Specialty [FQHC - PSYCHIATRY. PSYCHIATRY]
	Line: [59] , Source: [A-017] , ______________________________ Description: [West Jefferson Health Center]  , _______ Bill_Provider_Specialty [FQHC - PSYCHIATRY. PSYCHIATRY]
	Line: [60] , Source: [A-018] , ______________________________ Description: [Adults]  , _____________________________ Bill_Provider_Specialty [FQHC - PSYCHIATRY. PSYCHIATRY]
	Line: [61] , Source: [(A-017 - A018)] , _____________________ Description: [Children]  , ___________________________ Bill_Provider_Specialty [FQHC - PSYCHIATRY. PSYCHIATRY]
	Line: [62] , Source: [A-019] , ______________________________ Description: [Total Unduplicated Individuals Served]  ,  Bill_Provider_Specialty [FQHC - PSYCHIATRY. PSYCHIATRY]
	Line: [63] , Source: [A-020] , ______________________________ Description: [Adults]  , _____________________________ Bill_Provider_Specialty [FQHC - PSYCHIATRY. PSYCHIATRY]
	Line: [64] , Source: [(A-019 - A-020)] , ____________________ Description: [Children]  , ___________________________ Bill_Provider_Specialty [FQHC - PSYCHIATRY. PSYCHIATRY]
	Line: [66] , Source: [(A-001 + A003) + (A-011 + A-013)] , ___ Description: [Total Services]  , _____________________ Bill_Provider_Specialty [FQHC - PSYCHIATRY. PSYCHIATRY]
	Line: [67] , Source: [A-021] , ______________________________ Description: [Total Unduplicated Individuals Served (JeffCare)]  ,  Bill_Provider_Specialty [FQHC - PSYCHIATRY. PSYCHIATRY]
	Line: [68] , Source: [A-022] , ______________________________ Description: [Adults]  , _____________________________ Bill_Provider_Specialty [FQHC - PSYCHIATRY. PSYCHIATRY]
	Line: [69] , Source: [(A-021 - A022)] , _____________________ Description: [Children]  , ___________________________ Bill_Provider_Specialty [FQHC - PSYCHIATRY. PSYCHIATRY]


	Created: 3/17/2012
	By: glenn garson

*/
--===========================================================================

USE Success
GO


USE [Success];
GO
----------------------- Local Variables
   DECLARE @LineNumber int
   DECLARE @Source nvarchar(100)
   DECLARE @Title nvarchar(255)
----------------------------------------
IF OBJECT_ID('dbo.zzz_p0021_25_MultipleMonths_IDR_part_A_results') IS NOT NULL
    DROP TABLE dbo.zzz_p0021_25_MultipleMonths_IDR_part_A_results


CREATE TABLE [dbo].[zzz_p0021_25_MultipleMonths_IDR_part_A_results]
(
		[IDR_a_PK] [int] IDENTITY(1,1) NOT NULL,		
		[LineNumber] [int] NOT NULL,
		[Source] nvarchar(100) NOT NULL,
		[Line_Title] nvarchar(255) NOT NULL,
		[DateTime_Created] [datetime] NOT NULL CONSTRAINT IDR_a_TheDateTime_Default_GETDATE DEFAULT GETDATE(),
		[Result] [int] NOT NULL,
		[YYYY_MM] nvarchar(7),
		[IDR_a_RowVersion] [timestamp] NULL
	,CONSTRAINT [zzz_p0021_25_MultipleMonths_IDR_part_A_results$IDR_a_PK] PRIMARY KEY NONCLUSTERED 
		(
			[IDR_a_PK] ASC
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

--	Line: [14] , Source: [A-001] , ______________________________ Description: [East Jefferson Health Center]  , _______ Bill_Provider_Specialty [FAMILY PRACTICE]

SELECT @LineNumber = 14
SELECT @Source = '[A-001]'
SELECT @Title = '[East Jefferson Health Center]'
;

--The first CTE is required b/c DISTINCT and SELECT OVER do  not play nice together
WITH cte_Line_14_a
AS
(
	SELECT distinct
		  t3.[LOC],
		  t3.[Bill_Provider_Name],
		  t3.[Patient_No],
		  t3.svc,
		  t3.[Check-In_Day],
		  --------------------New Distinct fields below this line
		  [YYYY_MM]

	  FROM [Success].[dbo].[zzz_p0021_24_MultipleMonths_for_Analysis_of_Part_A] t3
	  Where (
				upper(rtrim(ltrim(t3.TYPE))) = 'PC'
				AND
				upper(rtrim(ltrim(t3.[LOC]))) = 'EJ'
			)
),

cte_Line_14_b
AS
(
	SELECT 
		  [YYYY_MM]
		  , Count(*) OVER(PARTITION BY [YYYY_MM]) as Result

	  FROM cte_Line_14_a
)

INSERT INTO [Success].[dbo].[zzz_p0021_25_MultipleMonths_IDR_part_A_results] 
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
			,YYYY_MM
			,[Result]
FROM cte_Line_14_b
order by YYYY_MM


--	Line: [15] , Source: [A-002] , ______________________________ Description: [Adults]  , _____________________________ Bill_Provider_Specialty [FAMILY PRACTICE]


SELECT @LineNumber = 15
SELECT @Source = '[A-002]'
SELECT @Title = '[Adults]'
;

--The first CTE is required b/c DISTINCT and SELECT OVER do  not play nice together
WITH cte_Line_15_a
AS
(
	SELECT distinct
		  t3.[LOC],
		  t3.[Bill_Provider_Name],
		  t3.[Patient_No],
		  t3.svc,
		  t3.[Check-In_Day],
		  --------------------New Distinct fields below this line
		  [YYYY_MM]

	  FROM [Success].[dbo].[zzz_p0021_24_MultipleMonths_for_Analysis_of_Part_A] t3
	  Where (
				upper(rtrim(ltrim(t3.TYPE))) = 'PC'
				AND
				upper(rtrim(ltrim(t3.[LOC]))) = 'EJ'
				AND t3.Adult = 1
			)
),

cte_Line_15_b
AS
(
	SELECT 
		  [YYYY_MM]
		  , Count(*) OVER(PARTITION BY [YYYY_MM]) as Result

	  FROM cte_Line_15_a
)

INSERT INTO [Success].[dbo].[zzz_p0021_25_MultipleMonths_IDR_part_A_results] 
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
			,YYYY_MM
			,[Result]
FROM cte_Line_15_b
order by YYYY_MM



----Line: [16] , Source: [(A-001 - A-002)] , ____________________ Description: [Children]  , ___________________________ Bill_Provider_Specialty [FAMILY PRACTICE]

SELECT @LineNumber = 16
SELECT @Source = '[(A-001 - A-002)]'
SELECT @Title = '[Children]'
;
WITH CTE_14minus15
AS 
(
SELECT  
      [LineNumber]
      ,[Source]
      ,[Line_Title]
      ,[DateTime_Created]
      ,(SELECT     'TheCalculation' = 
			 CASE 
						WHEN [LineNumber] = 14 
						   THEN [Result] 
						WHEN [LineNumber] = 15 
						   THEN -[Result] 
						ELSE 0 
				   END) as [Result] 	  	  		  
	  
      ,[YYYY_MM]

  FROM [Success].[dbo].[zzz_p0021_25_MultipleMonths_IDR_part_A_results]
    WHERE 
		[LineNumber] = 14
		or 
		[LineNumber] = 15
)

--SELECT * FROM CTE_14minus15

,CTE_14minus15_RESULTS
AS
(
SELECT DISTINCT
      SUM([Result]) OVER(PARTITION BY [YYYY_MM]) AS RESULT
      ,[YYYY_MM]
FROM CTE_14minus15

)


INSERT INTO [Success].[dbo].[zzz_p0021_25_MultipleMonths_IDR_part_A_results] 
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
FROM CTE_14minus15_RESULTS 
ORDER BY YYYY_MM

----Line: [17] , Source: [A-003] , ______________________________ Description: [West Jefferson Health Center]  , _______ Bill_Provider_Specialty [FAMILY PRACTICE]
SELECT @LineNumber = 17
SELECT @Source = '[A-003]'
SELECT @Title = '[West Jefferson Health Center]'


--The first CTE is required b/c DISTINCT and SELECT OVER do  not play nice together
;WITH cte_Line_17_a
AS
(
	SELECT distinct
		  t3.[LOC],
		  t3.[Bill_Provider_Name],
		  t3.[Patient_No],
		  t3.svc,
		  t3.[Check-In_Day],
		  --------------------New Distinct fields below this line
		  [YYYY_MM]

	  FROM [Success].[dbo].[zzz_p0021_24_MultipleMonths_for_Analysis_of_Part_A] t3
	  Where (
				upper(rtrim(ltrim(t3.TYPE))) = 'PC'
				AND
				upper(rtrim(ltrim(t3.[LOC]))) = 'WJ'
				--AND t3.Adult = 1
			)
),

cte_Line_17_b
AS
(
	SELECT 
		  [YYYY_MM]
		  , Count(*) OVER(PARTITION BY [YYYY_MM]) as Result

	  FROM cte_Line_17_a
)

INSERT INTO [Success].[dbo].[zzz_p0021_25_MultipleMonths_IDR_part_A_results] 
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
			,YYYY_MM
			,[Result]
FROM cte_Line_17_b
order by YYYY_MM



----	Line: [18] , Source: [A-004] , ______________________________ Description: [Adults]  , _____________________________ Bill_Provider_Specialty [FAMILY PRACTICE]

SELECT @LineNumber = 18
SELECT @Source = '[A-004]'
SELECT @Title = '[Adults]'


--The first CTE is required b/c DISTINCT and SELECT OVER do  not play nice together
;WITH cte_Line_18_a
AS
(
	SELECT distinct
		  t3.[LOC],
		  t3.[Bill_Provider_Name],
		  t3.[Patient_No],
		  t3.svc,
		  t3.[Check-In_Day],
		  --------------------New Distinct fields below this line
		  [YYYY_MM]

	  FROM [Success].[dbo].[zzz_p0021_24_MultipleMonths_for_Analysis_of_Part_A] t3
	  Where (
				upper(rtrim(ltrim(t3.TYPE))) = 'PC'
				AND
				upper(rtrim(ltrim(t3.[LOC]))) = 'WJ'
				AND 
				t3.Adult = 1
			)

),

cte_Line_18_b
AS
(
	SELECT 
		  [YYYY_MM]
		  , Count(*) OVER(PARTITION BY [YYYY_MM]) as Result

	  FROM cte_Line_18_a
)

INSERT INTO [Success].[dbo].[zzz_p0021_25_MultipleMonths_IDR_part_A_results] 
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
			,YYYY_MM
			,[Result]
FROM cte_Line_18_b
order by YYYY_MM


----Line: [19] , Source: [(A-003 - A-004)] , ____________________ Description: [Children]  , ___________________________ Bill_Provider_Specialty [FAMILY PRACTICE]

SELECT @LineNumber = 19
SELECT @Source = '[(A-003 - A-004)]'
SELECT @Title = '[Children]'


;WITH CTE_17minus18
AS 
(
SELECT  
      [LineNumber]
      ,[Source]
      ,[Line_Title]
      ,[DateTime_Created]
      ,(SELECT     'TheCalculation' = 
			 CASE 
						WHEN [LineNumber] = 17 
						   THEN [Result] 
						WHEN [LineNumber] = 18 
						   THEN -[Result] 
						ELSE 0 
				   END) as [Result] 	  	  		  
	  
      ,[YYYY_MM]

  FROM [Success].[dbo].[zzz_p0021_25_MultipleMonths_IDR_part_A_results]
    WHERE 
		[LineNumber] = 17
		or 
		[LineNumber] = 18
)

--SELECT * FROM CTE_17minus18

,CTE_17minus18_RESULTS
AS
(
SELECT DISTINCT
      SUM([Result]) OVER(PARTITION BY [YYYY_MM]) AS RESULT
      ,[YYYY_MM]
FROM CTE_17minus18

)


INSERT INTO [Success].[dbo].[zzz_p0021_25_MultipleMonths_IDR_part_A_results] 
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
FROM CTE_17minus18_RESULTS 
ORDER BY YYYY_MM

----	Line: [20] , Source: [(A-001 + A003)] , _____________________ Description: [Total Services]  , _____________________ Bill_Provider_Specialty [FAMILY PRACTICE]

SELECT @LineNumber = 20
SELECT @Source = '[(A-001 + A003)]'
SELECT @Title = '[Total Services]'


;WITH CTE_14plus17
AS 
(
SELECT  
      [LineNumber]
      ,[Source]
      ,[Line_Title]
      ,[DateTime_Created]
      ,(SELECT     'TheCalculation' = 
			 CASE 
						WHEN [LineNumber] = 14 
						   THEN [Result] 
						WHEN [LineNumber] = 17 
						   THEN [Result] 
						ELSE 0 
				   END) as [Result] 	  	  		  
	  
      ,[YYYY_MM]

  FROM [Success].[dbo].[zzz_p0021_25_MultipleMonths_IDR_part_A_results]
    WHERE 
		[LineNumber] = 14
		or 
		[LineNumber] = 17
)


,CTE_14plus17_RESULTS
AS
(
SELECT DISTINCT
      SUM([Result]) OVER(PARTITION BY [YYYY_MM]) AS RESULT
      ,[YYYY_MM]
FROM CTE_14plus17

)


INSERT INTO [Success].[dbo].[zzz_p0021_25_MultipleMonths_IDR_part_A_results] 
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
FROM CTE_14plus17_RESULTS 
ORDER BY YYYY_MM



----Line: [21] , Source: [(A-002 + A-004)] , ____________________ Description: [Adults]  , _____________________________ Bill_Provider_Specialty [FAMILY PRACTICE]


SELECT @LineNumber = 21
SELECT @Source = '[(A-002 + A-004)]'
SELECT @Title = '[Adults]'

;WITH CTE_15plus18
AS 
(
SELECT  
      [LineNumber]
      ,[Source]
      ,[Line_Title]
      ,[DateTime_Created]
      ,(SELECT     'TheCalculation' = 
			 CASE 
						WHEN [LineNumber] = 15 
						   THEN [Result] 
						WHEN [LineNumber] = 18 
						   THEN [Result] 
						ELSE 0 
				   END) as [Result] 	  	  		  
	  
      ,[YYYY_MM]

  FROM [Success].[dbo].[zzz_p0021_25_MultipleMonths_IDR_part_A_results]
    WHERE 
		[LineNumber] = 15
		or 
		[LineNumber] = 18
)

--SELECT * FROM CTE_15plus18

,CTE_15plus18_RESULTS
AS
(
SELECT DISTINCT
      SUM([Result]) OVER(PARTITION BY [YYYY_MM]) AS RESULT
      ,[YYYY_MM]
FROM CTE_15plus18

)


INSERT INTO [Success].[dbo].[zzz_p0021_25_MultipleMonths_IDR_part_A_results] 
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
FROM CTE_15plus18_RESULTS 
ORDER BY YYYY_MM

----Line: [22] , Source: [(A-001 - A-002) + (A-003 - A-004)] , __ Description: [Children]  , ___________________________ Bill_Provider_Specialty [FAMILY PRACTICE]


SELECT @LineNumber = 22
SELECT @Source = '[(A-001 - A-002) + (A-003 - A-004)]'
SELECT @Title = '[Children]'


;WITH CTE_14plus17minus15minus18
AS 
(
SELECT  
      [LineNumber]
      ,[Source]
      ,[Line_Title]
      ,[DateTime_Created]
      ,(SELECT     'TheCalculation' = 
			 CASE 
						WHEN [LineNumber] = 14 
						   THEN [Result] 
						WHEN [LineNumber] = 17 
						   THEN [Result] 
						WHEN [LineNumber] = 15 
						   THEN -[Result] 
						WHEN [LineNumber] = 18 
						   THEN -[Result] 
						ELSE 0 
				   END) as [Result] 	  	  		  
	  
      ,[YYYY_MM]

  FROM [Success].[dbo].[zzz_p0021_25_MultipleMonths_IDR_part_A_results]
    WHERE 
		[LineNumber] = 14
		or 
		[LineNumber] = 17
		or 
		[LineNumber] = 15
		or 
		[LineNumber] = 18
)


,CTE_14plus17minus15minus18_RESULTS
AS
(
SELECT DISTINCT
      SUM([Result]) OVER(PARTITION BY [YYYY_MM]) AS RESULT
      ,[YYYY_MM]
FROM CTE_14plus17minus15minus18

)


INSERT INTO [Success].[dbo].[zzz_p0021_25_MultipleMonths_IDR_part_A_results] 
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
FROM CTE_14plus17minus15minus18_RESULTS 
ORDER BY YYYY_MM



----Line: [24] , Source: [A-005] , ______________________________ Description: [East Jefferson Health Center]  , _______ Bill_Provider_Specialty [FAMILY PRACTICE]


SELECT @LineNumber = 24
SELECT @Source = '[A-005]'
SELECT @Title = '[East Jefferson Health Center]'


--The first CTE is required b/c DISTINCT and SELECT OVER do  not play nice together
;WITH cte_Line_24_a
AS
(
	SELECT distinct
		  --t3.[LOC],
		  --t3.[Bill_Provider_Name],
		  t3.[Patient_No],
		  --t3.svc,
		  --t3.[Check-In_Day],
		  ----------------------New Distinct fields below this line
		  [YYYY_MM]

	  FROM [Success].[dbo].[zzz_p0021_24_MultipleMonths_for_Analysis_of_Part_A] t3
	  Where (
				upper(rtrim(ltrim(t3.TYPE))) = 'PC'
				AND
				upper(rtrim(ltrim(t3.[LOC]))) = 'EJ'
				--AND 
				--t3.Adult = 1
			)
),

cte_Line_24_b
AS
(
	SELECT 
		  [YYYY_MM]
		  , Count(*) OVER(PARTITION BY [YYYY_MM]) as Result

	  FROM cte_Line_24_a
)

INSERT INTO [Success].[dbo].[zzz_p0021_25_MultipleMonths_IDR_part_A_results] 
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
			,YYYY_MM
			,[Result]
FROM cte_Line_24_b
order by YYYY_MM



----	Line: [25] , Source: [A-006] , ______________________________ Description: [Adults]  , _____________________________ Bill_Provider_Specialty [FAMILY PRACTICE]


SELECT @LineNumber = 25
SELECT @Source = '[A-006]'
SELECT @Title = '[Adults]'


--The first CTE is required b/c DISTINCT and SELECT OVER do  not play nice together
;WITH cte_Line_25_a
AS
(
	SELECT distinct
		  t3.[Patient_No],
		  [YYYY_MM]

	  FROM [Success].[dbo].[zzz_p0021_24_MultipleMonths_for_Analysis_of_Part_A] t3
	  Where (
				upper(rtrim(ltrim(t3.TYPE))) = 'PC'
				AND
				upper(rtrim(ltrim(t3.[LOC]))) = 'EJ'
				AND 
				t3.Adult = 1
			)
),

cte_Line_25_b
AS
(
	SELECT 
		  [YYYY_MM]
		  , Count(*) OVER(PARTITION BY [YYYY_MM]) as Result

	  FROM cte_Line_25_a
)

INSERT INTO [Success].[dbo].[zzz_p0021_25_MultipleMonths_IDR_part_A_results] 
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
			,YYYY_MM
			,[Result]
FROM cte_Line_25_b
order by YYYY_MM


----Line: [26] , Source: [(A-005 - A-006)] , ____________________ Description: [Children]  , ___________________________ Bill_Provider_Specialty [FAMILY PRACTICE]

SELECT @LineNumber = 26
SELECT @Source = '[(A-005 - A-006)]'
SELECT @Title = '[Children]'

;WITH CTE_24minus25
AS 
(
SELECT  
      [LineNumber]
      ,[Source]
      ,[Line_Title]
      ,[DateTime_Created]
      ,(SELECT     'TheCalculation' = 
			 CASE 
						WHEN [LineNumber] = 24 
						   THEN [Result] 
						WHEN [LineNumber] = 25 
						   THEN -[Result] 
						ELSE 0 
				   END) as [Result] 	  	  		  
	  
      ,[YYYY_MM]

  FROM [Success].[dbo].[zzz_p0021_25_MultipleMonths_IDR_part_A_results]
    WHERE 
		[LineNumber] = 24
		or 
		[LineNumber] = 25
)

--SELECT * FROM CTE_24minus25

,CTE_24minus25_RESULTS
AS
(
SELECT DISTINCT
      SUM([Result]) OVER(PARTITION BY [YYYY_MM]) AS RESULT
      ,[YYYY_MM]
FROM CTE_24minus25

)


INSERT INTO [Success].[dbo].[zzz_p0021_25_MultipleMonths_IDR_part_A_results] 
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
FROM CTE_24minus25_RESULTS 
ORDER BY YYYY_MM


----Line: [27] , Source: [A-007] , ______________________________ Description: [West Jefferson Health Center]  , _______ Bill_Provider_Specialty [FAMILY PRACTICE]

SELECT @LineNumber = 27
SELECT @Source = '[A-007]'
SELECT @Title = '[West Jefferson Health Center]'

--The first CTE is required b/c DISTINCT and SELECT OVER do  not play nice together
;WITH cte_Line_27_a
AS
(
	SELECT distinct
		  t3.[Patient_No],
		  [YYYY_MM]

	  FROM [Success].[dbo].[zzz_p0021_24_MultipleMonths_for_Analysis_of_Part_A] t3
	  Where (
				upper(rtrim(ltrim(t3.TYPE))) = 'PC'
				AND
				upper(rtrim(ltrim(t3.[LOC]))) = 'WJ'
				--AND 
				--t3.Adult = 1
			)
),

cte_Line_27_b
AS
(
	SELECT 
		  [YYYY_MM]
		  , Count(*) OVER(PARTITION BY [YYYY_MM]) as Result

	  FROM cte_Line_27_a
)

INSERT INTO [Success].[dbo].[zzz_p0021_25_MultipleMonths_IDR_part_A_results] 
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
			,YYYY_MM
			,[Result]
FROM cte_Line_27_b
order by YYYY_MM



----Line: [28] , Source: [A-008] , ______________________________ Description: [Adults]  , _____________________________ Bill_Provider_Specialty [FAMILY PRACTICE]


SELECT @LineNumber = 28
SELECT @Source = '[A-008]'
SELECT @Title = '[Adults]'

--The first CTE is required b/c DISTINCT and SELECT OVER do  not play nice together
;WITH cte_Line_28_a
AS
(
	SELECT distinct
		  t3.[Patient_No],
		  [YYYY_MM]

	  FROM [Success].[dbo].[zzz_p0021_24_MultipleMonths_for_Analysis_of_Part_A] t3
	  Where (
				upper(rtrim(ltrim(t3.TYPE))) = 'PC'
				AND
				upper(rtrim(ltrim(t3.[LOC]))) = 'WJ'
				AND 
				t3.Adult = 1
			)
),

cte_Line_28_b
AS
(
	SELECT 
		  [YYYY_MM]
		  , Count(*) OVER(PARTITION BY [YYYY_MM]) as Result

	  FROM cte_Line_28_a
)

INSERT INTO [Success].[dbo].[zzz_p0021_25_MultipleMonths_IDR_part_A_results] 
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
			,YYYY_MM
			,[Result]
FROM cte_Line_28_b
order by YYYY_MM



----Line: [29] , Source: [(A-007 - A-008)] , ____________________ Description: [Children]  , ___________________________ Bill_Provider_Specialty [FAMILY PRACTICE]

SELECT @LineNumber = 29
SELECT @Source = '[(A-007 - A-008)]'
SELECT @Title = '[Children]'

--JUNK_aMINUSb__A.sql


;WITH CTE_27minus28
AS 
(
SELECT  
      [LineNumber]
      ,[Source]
      ,[Line_Title]
      ,[DateTime_Created]
      ,(SELECT     'TheCalculation' = 
			 CASE 
						WHEN [LineNumber] = 27 
						   THEN [Result] 
						WHEN [LineNumber] = 28 
						   THEN -[Result] 
						ELSE 0 
				   END) as [Result] 	  	  		  
	  
      ,[YYYY_MM]

  FROM [Success].[dbo].[zzz_p0021_25_MultipleMonths_IDR_part_A_results]
    WHERE 
		[LineNumber] = 27
		or 
		[LineNumber] = 28
)

--SELECT * FROM CTE_27minus28

,CTE_27minus28_RESULTS
AS
(
SELECT DISTINCT
      SUM([Result]) OVER(PARTITION BY [YYYY_MM]) AS RESULT
      ,[YYYY_MM]
FROM CTE_27minus28

)


INSERT INTO [Success].[dbo].[zzz_p0021_25_MultipleMonths_IDR_part_A_results] 
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
FROM CTE_27minus28_RESULTS 
ORDER BY YYYY_MM


--	--Line: [30] , Source: [A-009] , ______________________________ Description: [Total Unduplicated Individuals Served]  ,  Bill_Provider_Specialty [FAMILY PRACTICE]

SELECT @LineNumber = 30
SELECT @Source = '[A-009]'
SELECT @Title = '[Total Unduplicated Individuals Served]'


--The first CTE is required b/c DISTINCT and SELECT OVER do  not play nice together
;WITH cte_Line_30_a
AS
(
	SELECT distinct
		  t3.[Patient_No],
		  [YYYY_MM]

	  FROM [Success].[dbo].[zzz_p0021_24_MultipleMonths_for_Analysis_of_Part_A] t3
	  Where (
				upper(rtrim(ltrim(t3.TYPE))) = 'PC'
				--AND
				--upper(rtrim(ltrim(t3.[LOC]))) = 'WJ'
				--AND 
				--t3.Adult = 1
			)
),

cte_Line_30_b
AS
(
	SELECT 
		  [YYYY_MM]
		  , Count(*) OVER(PARTITION BY [YYYY_MM]) as Result

	  FROM cte_Line_30_a
)

INSERT INTO [Success].[dbo].[zzz_p0021_25_MultipleMonths_IDR_part_A_results] 
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
			,YYYY_MM
			,[Result]
FROM cte_Line_30_b
order by YYYY_MM



----	Line: [31] , Source: [A-010] , ______________________________ Description: [Adults]  , _____________________________ Bill_Provider_Specialty [FAMILY PRACTICE]

SELECT @LineNumber = 31
SELECT @Source = '[A-010]'
SELECT @Title = '[Adults]'


--The first CTE is required b/c DISTINCT and SELECT OVER do  not play nice together
;WITH cte_Line_31_a
AS
(
	SELECT distinct
		  t3.[Patient_No],
		  [YYYY_MM]

	  FROM [Success].[dbo].[zzz_p0021_24_MultipleMonths_for_Analysis_of_Part_A] t3
	  Where (
				upper(rtrim(ltrim(t3.TYPE))) = 'PC'
				--AND
				--upper(rtrim(ltrim(t3.[LOC]))) = 'WJ'
				AND 
				t3.Adult = 1
			)
),

cte_Line_31_b
AS
(
	SELECT 
		  [YYYY_MM]
		  , Count(*) OVER(PARTITION BY [YYYY_MM]) as Result

	  FROM cte_Line_31_a
)

INSERT INTO [Success].[dbo].[zzz_p0021_25_MultipleMonths_IDR_part_A_results] 
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
			,YYYY_MM
			,[Result]
FROM cte_Line_31_b
order by YYYY_MM


----	Line: [32] , Source: [(A-009 - A010)] , _____________________ Description: [Children]  , ___________________________ Bill_Provider_Specialty [FAMILY PRACTICE]


SELECT @LineNumber = 32
SELECT @Source = '[(A-009 - A010)]'
SELECT @Title = '[Children]'


;WITH CTE_30minus31
AS 
(
SELECT  
      [LineNumber]
      ,[Source]
      ,[Line_Title]
      ,[DateTime_Created]
      ,(SELECT     'TheCalculation' = 
			 CASE 
						WHEN [LineNumber] = 30 
						   THEN [Result] 
						WHEN [LineNumber] = 31 
						   THEN -[Result] 
						ELSE 0 
				   END) as [Result] 	  	  		  
	  
      ,[YYYY_MM]

  FROM [Success].[dbo].[zzz_p0021_25_MultipleMonths_IDR_part_A_results]
    WHERE 
		[LineNumber] = 30
		or 
		[LineNumber] = 31
)

--SELECT * FROM CTE_30minus31

,CTE_30minus31_RESULTS
AS
(
SELECT DISTINCT
      SUM([Result]) OVER(PARTITION BY [YYYY_MM]) AS RESULT
      ,[YYYY_MM]
FROM CTE_30minus31

)


INSERT INTO [Success].[dbo].[zzz_p0021_25_MultipleMonths_IDR_part_A_results] 
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
FROM CTE_30minus31_RESULTS 
ORDER BY YYYY_MM



----	Line: [46] , Source: [A-011] , ______________________________ Description: [East Jefferson Health Center]  , _______ Bill_Provider_Specialty [FQHC - PSYCHIATRY. PSYCHIATRY]


SELECT @LineNumber = 46
SELECT @Source = '[A-011]'
SELECT @Title = '[East Jefferson Health Center]'

;WITH cte_Line_46_a
AS
(
	SELECT distinct
		  t3.[LOC],
		  t3.[Bill_Provider_Name],
		  t3.[Patient_No],
		  t3.svc,
		  t3.[Check-In_Day],
		  --------------------New Distinct fields below this line
		  [YYYY_MM]

	  FROM [Success].[dbo].[zzz_p0021_24_MultipleMonths_for_Analysis_of_Part_A] t3
	  Where (
				upper(rtrim(ltrim(t3.TYPE))) = 'BH'
				AND
				upper(rtrim(ltrim(t3.[LOC]))) = 'EJ'
				--AND 
				--t3.Adult = 1
			)
),

cte_Line_46_b
AS
(
	SELECT 
		  [YYYY_MM]
		  , Count(*) OVER(PARTITION BY [YYYY_MM]) as Result

	  FROM cte_Line_46_a
)

INSERT INTO [Success].[dbo].[zzz_p0021_25_MultipleMonths_IDR_part_A_results] 
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
			,YYYY_MM
			,[Result]
FROM cte_Line_46_b
order by YYYY_MM



;

----	Line: [47] , Source: [A-012] , ______________________________ Description: [Adults]  , _____________________________ Bill_Provider_Specialty [FQHC - PSYCHIATRY. PSYCHIATRY]
SELECT @LineNumber = 47
SELECT @Source = '[A-012]'
SELECT @Title = '[Adults]'

--The first CTE is required b/c DISTINCT and SELECT OVER do  not play nice together
;WITH cte_Line_47_a
AS
(
	SELECT distinct
		  t3.[LOC],
		  t3.[Bill_Provider_Name],
		  t3.[Patient_No],
		  t3.svc,
		  t3.[Check-In_Day],
		  --------------------New Distinct fields below this line
		  [YYYY_MM]

	  FROM [Success].[dbo].[zzz_p0021_24_MultipleMonths_for_Analysis_of_Part_A] t3
	  Where (
				upper(rtrim(ltrim(t3.TYPE))) = 'BH'
				AND
				upper(rtrim(ltrim(t3.[LOC]))) = 'EJ'
				AND 
				t3.Adult = 1
			)
),

cte_Line_47_b
AS
(
	SELECT 
		  [YYYY_MM]
		  , Count(*) OVER(PARTITION BY [YYYY_MM]) as Result

	  FROM cte_Line_47_a
)

INSERT INTO [Success].[dbo].[zzz_p0021_25_MultipleMonths_IDR_part_A_results] 
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
			,YYYY_MM
			,[Result]
FROM cte_Line_47_b
order by YYYY_MM



----	Line: [48] , Source: [(A-011 - A-012)] , ____________________ Description: [Children]  , ___________________________ Bill_Provider_Specialty [FQHC - PSYCHIATRY. PSYCHIATRY]


SELECT @LineNumber = 48
SELECT @Source = '[(A-011 - A-012)]'
SELECT @Title = '[Children]'

;WITH CTE_46minus47
AS 
(
SELECT  
      [LineNumber]
      ,[Source]
      ,[Line_Title]
      ,[DateTime_Created]
      ,(SELECT     'TheCalculation' = 
			 CASE 
						WHEN [LineNumber] = 46
						   THEN [Result] 
						WHEN [LineNumber] = 47 
						   THEN -[Result] 
						ELSE 0 
				   END) as [Result] 	  	  		  
	  
      ,[YYYY_MM]

  FROM [Success].[dbo].[zzz_p0021_25_MultipleMonths_IDR_part_A_results]
    WHERE 
		[LineNumber] = 46
		or 
		[LineNumber] = 47
)

--SELECT * FROM CTE_46minus47

,CTE_46minus47_RESULTS
AS
(
SELECT DISTINCT
      SUM([Result]) OVER(PARTITION BY [YYYY_MM]) AS RESULT
      ,[YYYY_MM]
FROM CTE_46minus47

)


INSERT INTO [Success].[dbo].[zzz_p0021_25_MultipleMonths_IDR_part_A_results] 
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
FROM CTE_46minus47_RESULTS 
ORDER BY YYYY_MM




----	Line: [49] , Source: [A-013] , ______________________________ Description: [West JeffersonHealth Center]  , ________ Bill_Provider_Specialty [FQHC - PSYCHIATRY. PSYCHIATRY]


SELECT @LineNumber = 49
SELECT @Source = '[A-013]'
SELECT @Title = '[West JeffersonHealth Center]'

;WITH cte_Line_49_a
AS
(
	SELECT distinct
		  t3.[LOC],
		  t3.[Bill_Provider_Name],
		  t3.[Patient_No],
		  t3.svc,
		  t3.[Check-In_Day],
		  --------------------New Distinct fields below this line
		  [YYYY_MM]

	  FROM [Success].[dbo].[zzz_p0021_24_MultipleMonths_for_Analysis_of_Part_A] t3
	  Where (
				upper(rtrim(ltrim(t3.TYPE))) = 'BH'
				AND
				upper(rtrim(ltrim(t3.[LOC]))) = 'WJ'
				--AND 
				--t3.Adult = 1
			)
),

cte_Line_49_b
AS
(
	SELECT 
		  [YYYY_MM]
		  , Count(*) OVER(PARTITION BY [YYYY_MM]) as Result

	  FROM cte_Line_49_a
)

INSERT INTO [Success].[dbo].[zzz_p0021_25_MultipleMonths_IDR_part_A_results] 
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
			,YYYY_MM
			,[Result]
FROM cte_Line_49_b
order by YYYY_MM



----Line: [50] , Source: [A-014] , ______________________________ Description: [Adults]  , _____________________________ Bill_Provider_Specialty [FQHC - PSYCHIATRY. PSYCHIATRY]


SELECT @LineNumber = 50
SELECT @Source = '[A-014]'
SELECT @Title = '[Adults]'
;
WITH cte_Line_50_a
AS
(
	SELECT distinct
		  t3.[LOC],
		  t3.[Bill_Provider_Name],
		  t3.[Patient_No],
		  t3.svc,
		  t3.[Check-In_Day],
		  --------------------New Distinct fields below this line
		  [YYYY_MM]

	  FROM [Success].[dbo].[zzz_p0021_24_MultipleMonths_for_Analysis_of_Part_A] t3
	  Where (
				upper(rtrim(ltrim(t3.TYPE))) = 'BH'
				AND
				upper(rtrim(ltrim(t3.[LOC]))) = 'WJ'
				AND 
				t3.Adult = 1
			)
),

cte_Line_50_b
AS
(
	SELECT 
		  [YYYY_MM]
		  , Count(*) OVER(PARTITION BY [YYYY_MM]) as Result

	  FROM cte_Line_50_a
)

INSERT INTO [Success].[dbo].[zzz_p0021_25_MultipleMonths_IDR_part_A_results] 
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
			,YYYY_MM
			,[Result]
FROM cte_Line_50_b
order by YYYY_MM


----	Line: [51] , Source: [(A-013 - A-014)] , ____________________ Description: [Children]  , ___________________________ Bill_Provider_Specialty [FQHC - PSYCHIATRY. PSYCHIATRY]


SELECT @LineNumber = 51
SELECT @Source = '[(A-013 - A-014)]'
SELECT @Title = '[Children]'


;WITH CTE_49minus50
AS 
(
SELECT  
      [LineNumber]
      ,[Source]
      ,[Line_Title]
      ,[DateTime_Created]
      ,(SELECT     'TheCalculation' = 
			 CASE 
						WHEN [LineNumber] = 49
						   THEN [Result] 
						WHEN [LineNumber] = 50 
						   THEN -[Result] 
						ELSE 0 
				   END) as [Result] 	  	  		  
	  
      ,[YYYY_MM]

  FROM [Success].[dbo].[zzz_p0021_25_MultipleMonths_IDR_part_A_results]
    WHERE 
		[LineNumber] = 49
		or 
		[LineNumber] = 50
)

--SELECT * FROM CTE_49minus50

,CTE_49minus50_RESULTS
AS
(
SELECT DISTINCT
      SUM([Result]) OVER(PARTITION BY [YYYY_MM]) AS RESULT
      ,[YYYY_MM]
FROM CTE_49minus50

)


INSERT INTO [Success].[dbo].[zzz_p0021_25_MultipleMonths_IDR_part_A_results] 
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
FROM CTE_49minus50_RESULTS 
ORDER BY YYYY_MM

----Line: [52] , Source: [(A-011 + A-013)] , ____________________ Description: [Total Services]  , _____________________ Bill_Provider_Specialty [FQHC - PSYCHIATRY. PSYCHIATRY]


SELECT @LineNumber = 52
SELECT @Source = '[(A-011 + A-013)]'
SELECT @Title = '[Total Services]'


;WITH CTE_46plus49
AS 
(
SELECT  
      [LineNumber]
      ,[Source]
      ,[Line_Title]
      ,[DateTime_Created]
      ,(SELECT     'TheCalculation' = 
			 CASE 
						WHEN [LineNumber] = 46
						   THEN [Result] 
						WHEN [LineNumber] = 49 
						   THEN [Result] 
						ELSE 0 
				   END) as [Result] 	  	  		  
	  
      ,[YYYY_MM]

  FROM [Success].[dbo].[zzz_p0021_25_MultipleMonths_IDR_part_A_results]
    WHERE 
		[LineNumber] = 46
		or 
		[LineNumber] = 49
)


,CTE_46plus49_RESULTS
AS
(
SELECT DISTINCT
      SUM([Result]) OVER(PARTITION BY [YYYY_MM]) AS RESULT
      ,[YYYY_MM]
FROM CTE_46plus49

)


INSERT INTO [Success].[dbo].[zzz_p0021_25_MultipleMonths_IDR_part_A_results] 
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
FROM CTE_46plus49_RESULTS 
ORDER BY YYYY_MM


----	Line: [53] , Source: [(A-012 + A-014)] , ____________________ Description: [Adults]  , _____________________________ Bill_Provider_Specialty [FQHC - PSYCHIATRY. PSYCHIATRY]


SELECT @LineNumber = 53
SELECT @Source = '[(A-012 + A-014)]'
SELECT @Title = '[Adults]'


;WITH CTE_47plus50
AS 
(
SELECT  
      [LineNumber]
      ,[Source]
      ,[Line_Title]
      ,[DateTime_Created]
      ,(SELECT     'TheCalculation' = 
			 CASE 
						WHEN [LineNumber] = 47
						   THEN [Result] 
						WHEN [LineNumber] = 50 
						   THEN [Result] 
						ELSE 0 
				   END) as [Result] 	  	  		  
	  
      ,[YYYY_MM]

  FROM [Success].[dbo].[zzz_p0021_25_MultipleMonths_IDR_part_A_results]
    WHERE 
		[LineNumber] = 47
		or 
		[LineNumber] = 50
)


,CTE_47plus50_RESULTS
AS
(
SELECT DISTINCT
      SUM([Result]) OVER(PARTITION BY [YYYY_MM]) AS RESULT
      ,[YYYY_MM]
FROM CTE_47plus50

)


INSERT INTO [Success].[dbo].[zzz_p0021_25_MultipleMonths_IDR_part_A_results] 
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
FROM CTE_47plus50_RESULTS 
ORDER BY YYYY_MM

----Line: [54] , Source: [(A-011 + A-013) - (A-012 + A-014)] , __ Description: [Children]  , ___________________________ Bill_Provider_Specialty [FQHC - PSYCHIATRY. PSYCHIATRY]


SELECT @LineNumber = 54
SELECT @Source = '[(A-011 + A-013) - (A-012 + A-014)]'
SELECT @Title = '[Children]'


;WITH CTE_46plus49minus47minus50
AS 
(
SELECT  
      [LineNumber]
      ,[Source]
      ,[Line_Title]
      ,[DateTime_Created]
      ,(SELECT     'TheCalculation' = 
			 CASE 
						WHEN [LineNumber] = 46 
						   THEN [Result] 
						WHEN [LineNumber] = 49 
						   THEN [Result] 
						WHEN [LineNumber] = 47 
						   THEN -[Result] 
						WHEN [LineNumber] = 50 
						   THEN -[Result] 
						ELSE 0 
				   END) as [Result] 	  	  		  
	  
      ,[YYYY_MM]

  FROM [Success].[dbo].[zzz_p0021_25_MultipleMonths_IDR_part_A_results]
    WHERE 
		[LineNumber] = 46
		or 
		[LineNumber] = 49
		or 
		[LineNumber] = 47
		or 
		[LineNumber] = 50
)


,CTE_46plus49minus47minus50_RESULTS
AS
(
SELECT DISTINCT
      SUM([Result]) OVER(PARTITION BY [YYYY_MM]) AS RESULT
      ,[YYYY_MM]
FROM CTE_46plus49minus47minus50

)


INSERT INTO [Success].[dbo].[zzz_p0021_25_MultipleMonths_IDR_part_A_results] 
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
FROM CTE_46plus49minus47minus50_RESULTS 
ORDER BY YYYY_MM


----	Line: [56] , Source: [A-015] , ______________________________ Description: [East Jefferson Health Center]  , _______ Bill_Provider_Specialty [FQHC - PSYCHIATRY. PSYCHIATRY]

SELECT @LineNumber = 56
SELECT @Source = '[A-015]'
SELECT @Title = '[East Jefferson Health Center]'
;

--The first CTE is required b/c DISTINCT and SELECT OVER do  not play nice together
;WITH cte_Line_56_a
AS
(
	SELECT distinct
		  t3.[Patient_No],
		  [YYYY_MM]

	  FROM [Success].[dbo].[zzz_p0021_24_MultipleMonths_for_Analysis_of_Part_A] t3
	  Where (
				upper(rtrim(ltrim(t3.TYPE))) = 'BH'
				AND
				upper(rtrim(ltrim(t3.[LOC]))) = 'EJ'
				--AND 
				--t3.Adult = 1
			)
),

cte_Line_56_b
AS
(
	SELECT 
		  [YYYY_MM]
		  , Count(*) OVER(PARTITION BY [YYYY_MM]) as Result

	  FROM cte_Line_56_a
)

INSERT INTO [Success].[dbo].[zzz_p0021_25_MultipleMonths_IDR_part_A_results] 
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
			,YYYY_MM
			,[Result]
FROM cte_Line_56_b
order by YYYY_MM



----	Line: [57] , Source: [A-016] , ______________________________ Description: [Adults]  , _____________________________ Bill_Provider_Specialty [FQHC - PSYCHIATRY. PSYCHIATRY]

SELECT @LineNumber = 57
SELECT @Source = '[A-016]'
SELECT @Title = '[Adults]'
;

--The first CTE is required b/c DISTINCT and SELECT OVER do  not play nice together
;WITH cte_Line_57_a
AS
(
	SELECT distinct
		  t3.[Patient_No],
		  [YYYY_MM]

	  FROM [Success].[dbo].[zzz_p0021_24_MultipleMonths_for_Analysis_of_Part_A] t3
	  Where (
				upper(rtrim(ltrim(t3.TYPE))) = 'BH'
				AND
				upper(rtrim(ltrim(t3.[LOC]))) = 'EJ'
				AND 
				t3.Adult = 1
			)
),

cte_Line_57_b
AS
(
	SELECT 
		  [YYYY_MM]
		  , Count(*) OVER(PARTITION BY [YYYY_MM]) as Result

	  FROM cte_Line_57_a
)

INSERT INTO [Success].[dbo].[zzz_p0021_25_MultipleMonths_IDR_part_A_results] 
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
			,YYYY_MM
			,[Result]
FROM cte_Line_57_b
order by YYYY_MM



----	Line: [58] , Source: [(A-015 - A-016)] , ____________________ Description: [Children]  , ___________________________ Bill_Provider_Specialty [FQHC - PSYCHIATRY. PSYCHIATRY]

SELECT @LineNumber = 58
SELECT @Source = '[(A-015 - A-016)]'
SELECT @Title = '[Children]'


;WITH CTE_56minus57
AS 
(
SELECT  
      [LineNumber]
      ,[Source]
      ,[Line_Title]
      ,[DateTime_Created]
      ,(SELECT     'TheCalculation' = 
			 CASE 
						WHEN [LineNumber] = 56
						   THEN [Result] 
						WHEN [LineNumber] = 57 
						   THEN -[Result] 
						ELSE 0 
				   END) as [Result] 	  	  		  
	  
      ,[YYYY_MM]

  FROM [Success].[dbo].[zzz_p0021_25_MultipleMonths_IDR_part_A_results]
    WHERE 
		[LineNumber] = 56
		or 
		[LineNumber] = 57
)

--SELECT * FROM CTE_56minus57

,CTE_56minus57_RESULTS
AS
(
SELECT DISTINCT
      SUM([Result]) OVER(PARTITION BY [YYYY_MM]) AS RESULT
      ,[YYYY_MM]
FROM CTE_56minus57

)


INSERT INTO [Success].[dbo].[zzz_p0021_25_MultipleMonths_IDR_part_A_results] 
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
FROM CTE_56minus57_RESULTS 
ORDER BY YYYY_MM


----	Line: [59] , Source: [A-017] , ______________________________ Description: [West Jefferson Health Center]  , _______ Bill_Provider_Specialty [FQHC - PSYCHIATRY. PSYCHIATRY]

SELECT @LineNumber = 59
SELECT @Source = '[A-017]'
SELECT @Title = '[West Jefferson Health Center]'
;

--The first CTE is required b/c DISTINCT and SELECT OVER do  not play nice together
;WITH cte_Line_59_a
AS
(
	SELECT distinct
		  t3.[Patient_No],
		  [YYYY_MM]

	  FROM [Success].[dbo].[zzz_p0021_24_MultipleMonths_for_Analysis_of_Part_A] t3
	  Where (
				upper(rtrim(ltrim(t3.TYPE))) = 'BH'
				AND
				upper(rtrim(ltrim(t3.[LOC]))) = 'WJ'
				--AND 
				--t3.Adult = 1
			)
),

cte_Line_59_b
AS
(
	SELECT 
		  [YYYY_MM]
		  , Count(*) OVER(PARTITION BY [YYYY_MM]) as Result

	  FROM cte_Line_59_a
)

INSERT INTO [Success].[dbo].[zzz_p0021_25_MultipleMonths_IDR_part_A_results] 
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
			,YYYY_MM
			,[Result]
FROM cte_Line_59_b
order by YYYY_MM



----	Line: [60] , Source: [A-018] , ______________________________ Description: [Adults]  , _____________________________ Bill_Provider_Specialty [FQHC - PSYCHIATRY. PSYCHIATRY]


SELECT @LineNumber = 60
SELECT @Source = '[A-018]'
SELECT @Title = '[Adults]'
;

--The first CTE is required b/c DISTINCT and SELECT OVER do  not play nice together
;WITH cte_Line_60_a
AS
(
	SELECT distinct
		  t3.[Patient_No],
		  [YYYY_MM]

	  FROM [Success].[dbo].[zzz_p0021_24_MultipleMonths_for_Analysis_of_Part_A] t3
	  Where (
				upper(rtrim(ltrim(t3.TYPE))) = 'BH'
				AND
				upper(rtrim(ltrim(t3.[LOC]))) = 'WJ'
				AND 
				t3.Adult = 1
			)
),

cte_Line_60_b
AS
(
	SELECT 
		  [YYYY_MM]
		  , Count(*) OVER(PARTITION BY [YYYY_MM]) as Result

	  FROM cte_Line_60_a
)

INSERT INTO [Success].[dbo].[zzz_p0021_25_MultipleMonths_IDR_part_A_results] 
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
			,YYYY_MM
			,[Result]
FROM cte_Line_60_b
order by YYYY_MM


----Line: [61] , Source: [(A-017 - A018)] , _____________________ Description: [Children]  , ___________________________ Bill_Provider_Specialty [FQHC - PSYCHIATRY. PSYCHIATRY]


SELECT @LineNumber = 61
SELECT @Source = '[(A-017 - A018)]'
SELECT @Title = '[Children]'

--JUNK_aMINUSb__A.sql


;WITH CTE_59minus60
AS 
(
SELECT  
      [LineNumber]
      ,[Source]
      ,[Line_Title]
      ,[DateTime_Created]
      ,(SELECT     'TheCalculation' = 
			 CASE 
						WHEN [LineNumber] = 59
						   THEN [Result] 
						WHEN [LineNumber] = 60 
						   THEN -[Result] 
						ELSE 0 
				   END) as [Result] 	  	  		  
	  
      ,[YYYY_MM]

  FROM [Success].[dbo].[zzz_p0021_25_MultipleMonths_IDR_part_A_results]
    WHERE 
		[LineNumber] = 59
		or 
		[LineNumber] = 60
)

--SELECT * FROM CTE_59minus60

,CTE_59minus60_RESULTS
AS
(
SELECT DISTINCT
      SUM([Result]) OVER(PARTITION BY [YYYY_MM]) AS RESULT
      ,[YYYY_MM]
FROM CTE_59minus60

)


INSERT INTO [Success].[dbo].[zzz_p0021_25_MultipleMonths_IDR_part_A_results] 
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
FROM CTE_59minus60_RESULTS 
ORDER BY YYYY_MM


----	Line: [62] , Source: [A-019] , ______________________________ Description: [Total Unduplicated Individuals Served]  ,  Bill_Provider_Specialty [FQHC - PSYCHIATRY. PSYCHIATRY]

SELECT @LineNumber = 62
SELECT @Source = '[A-019]'
SELECT @Title = '[Total Unduplicated Individuals Served]'
;

--The first CTE is required b/c DISTINCT and SELECT OVER do  not play nice together
;WITH cte_Line_62_a
AS
(
	SELECT distinct
		  t3.[Patient_No],
		  [YYYY_MM]

	  FROM [Success].[dbo].[zzz_p0021_24_MultipleMonths_for_Analysis_of_Part_A] t3
	  Where (
				upper(rtrim(ltrim(t3.TYPE))) = 'BH'
				--AND
				--upper(rtrim(ltrim(t3.[LOC]))) = 'WJ'
				--AND 
				--t3.Adult = 1
			)
),

cte_Line_62_b
AS
(
	SELECT 
		  [YYYY_MM]
		  , Count(*) OVER(PARTITION BY [YYYY_MM]) as Result

	  FROM cte_Line_62_a
)

INSERT INTO [Success].[dbo].[zzz_p0021_25_MultipleMonths_IDR_part_A_results] 
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
			,YYYY_MM
			,[Result]
FROM cte_Line_62_b
order by YYYY_MM


----	Line: [63] , Source: [A-020] , ______________________________ Description: [Adults]  , _____________________________ Bill_Provider_Specialty [FQHC - PSYCHIATRY. PSYCHIATRY]


SELECT @LineNumber = 63
SELECT @Source = '[A-020]'
SELECT @Title = '[Adults]'
;

--The first CTE is required b/c DISTINCT and SELECT OVER do  not play nice together
;WITH cte_Line_63_a
AS
(
	SELECT distinct
		  t3.[Patient_No],
		  [YYYY_MM]

	  FROM [Success].[dbo].[zzz_p0021_24_MultipleMonths_for_Analysis_of_Part_A] t3
	  Where (
				upper(rtrim(ltrim(t3.TYPE))) = 'BH'
				--AND
				--upper(rtrim(ltrim(t3.[LOC]))) = 'WJ'
				AND 
				t3.Adult = 1
			)
),

cte_Line_63_b
AS
(
	SELECT 
		  [YYYY_MM]
		  , Count(*) OVER(PARTITION BY [YYYY_MM]) as Result

	  FROM cte_Line_63_a
)

INSERT INTO [Success].[dbo].[zzz_p0021_25_MultipleMonths_IDR_part_A_results] 
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
			,YYYY_MM
			,[Result]
FROM cte_Line_63_b
order by YYYY_MM


----	Line: [64] , Source: [(A-019 - A-020)] , ____________________ Description: [Children]  , ___________________________ Bill_Provider_Specialty [FQHC - PSYCHIATRY. PSYCHIATRY]


SELECT @LineNumber = 64
SELECT @Source = '[(A-019 - A-020)]'
SELECT @Title = '[Children]'
;

--JUNK_aMINUSb__A.sql

;WITH CTE_62minus63
AS 
(
SELECT  
      [LineNumber]
      ,[Source]
      ,[Line_Title]
      ,[DateTime_Created]
      ,(SELECT     'TheCalculation' = 
			 CASE 
						WHEN [LineNumber] = 62
						   THEN [Result] 
						WHEN [LineNumber] = 63 
						   THEN -[Result] 
						ELSE 0 
				   END) as [Result] 	  	  		  
	  
      ,[YYYY_MM]

  FROM [Success].[dbo].[zzz_p0021_25_MultipleMonths_IDR_part_A_results]
    WHERE 
		[LineNumber] = 62
		or 
		[LineNumber] = 63
)

--SELECT * FROM CTE_62minus63

,CTE_62minus63_RESULTS
AS
(
SELECT DISTINCT
      SUM([Result]) OVER(PARTITION BY [YYYY_MM]) AS RESULT
      ,[YYYY_MM]
FROM CTE_62minus63

)


INSERT INTO [Success].[dbo].[zzz_p0021_25_MultipleMonths_IDR_part_A_results] 
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
FROM CTE_62minus63_RESULTS 
ORDER BY YYYY_MM




----		Line: [66] , Source: [(A-001 + A003) + (A-011 + A-013)] , ___ Description: [Total Services]  , _____________________ Bill_Provider_Specialty [FQHC - PSYCHIATRY. PSYCHIATRY]

SELECT @LineNumber = 66
SELECT @Source = '[(A-001 + A003) + (A-011 + A-013)]'
SELECT @Title = '[Total Services]'
;


;WITH CTE_14plus17plus46plus49
AS 
(
SELECT  
      [LineNumber]
      ,[Source]
      ,[Line_Title]
      ,[DateTime_Created]
      ,(SELECT     'TheCalculation' = 
			 CASE 
						WHEN [LineNumber] = 14 
						   THEN [Result] 
						WHEN [LineNumber] = 17 
						   THEN [Result] 
						WHEN [LineNumber] = 46 
						   THEN [Result] 
						WHEN [LineNumber] = 49 
						   THEN [Result] 
						ELSE 0 
				   END) as [Result] 	  	  		  
	  
      ,[YYYY_MM]

  FROM [Success].[dbo].[zzz_p0021_25_MultipleMonths_IDR_part_A_results]
    WHERE 
		[LineNumber] = 14
		or 
		[LineNumber] = 17
		or 
		[LineNumber] = 46
		or 
		[LineNumber] = 49
)


,CTE_14plus17plus46plus49_RESULTS
AS
(
SELECT DISTINCT
      SUM([Result]) OVER(PARTITION BY [YYYY_MM]) AS RESULT
      ,[YYYY_MM]
FROM CTE_14plus17plus46plus49

)


INSERT INTO [Success].[dbo].[zzz_p0021_25_MultipleMonths_IDR_part_A_results] 
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
FROM CTE_14plus17plus46plus49_RESULTS 
ORDER BY YYYY_MM



----Line: [67] , Source: [A-021] , ______________________________ Description: [Total Unduplicated Individuals Served (JeffCare)]  ,  Bill_Provider_Specialty [FQHC - PSYCHIATRY. PSYCHIATRY]

SELECT @LineNumber = 67
SELECT @Source = '[A-021]'
SELECT @Title = '[Total Unduplicated Individuals Served (JeffCare)]'
;

--The first CTE is required b/c DISTINCT and SELECT OVER do  not play nice together
;WITH cte_Line_67_a
AS
(
	SELECT distinct
		  t3.[Patient_No],
		  [YYYY_MM]

	  FROM [Success].[dbo].[zzz_p0021_24_MultipleMonths_for_Analysis_of_Part_A] t3
	  --Where (
			--	upper(rtrim(ltrim(t3.TYPE))) = 'BH'
			----	--AND
			----	--upper(rtrim(ltrim(t3.[LOC]))) = 'WJ'
			----	--AND 
			----	--t3.Adult = 1
			--)
),

cte_Line_67_b
AS
(
	SELECT 
		  [YYYY_MM]
		  , Count(*) OVER(PARTITION BY [YYYY_MM]) as Result

	  FROM cte_Line_67_a
)

INSERT INTO [Success].[dbo].[zzz_p0021_25_MultipleMonths_IDR_part_A_results] 
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
			,YYYY_MM
			,[Result]
FROM cte_Line_67_b
order by YYYY_MM



----	Line: [68] , Source: [A-022] , ______________________________ Description: [Adults]  , _____________________________ Bill_Provider_Specialty [FQHC - PSYCHIATRY. PSYCHIATRY]



SELECT @LineNumber = 68
SELECT @Source = '[A-022]'
SELECT @Title = '[Adults]'
;

--The first CTE is required b/c DISTINCT and SELECT OVER do  not play nice together
;WITH cte_Line_68_a
AS
(
	SELECT distinct
		  t3.[Patient_No],
		  [YYYY_MM]

	  FROM [Success].[dbo].[zzz_p0021_24_MultipleMonths_for_Analysis_of_Part_A] t3
	  Where (
				--upper(rtrim(ltrim(t3.TYPE))) = 'BH'
				----AND
				----upper(rtrim(ltrim(t3.[LOC]))) = 'WJ'
				--AND 
				t3.Adult = 1
			)
),

cte_Line_68_b
AS
(
	SELECT 
		  [YYYY_MM]
		  , Count(*) OVER(PARTITION BY [YYYY_MM]) as Result

	  FROM cte_Line_68_a
)

INSERT INTO [Success].[dbo].[zzz_p0021_25_MultipleMonths_IDR_part_A_results] 
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
			,YYYY_MM
			,[Result]
FROM cte_Line_68_b
order by YYYY_MM

----	Line: [69] , Source: [(A-021 - A022)] , _____________________ Description: [Children]  , ___________________________ Bill_Provider_Specialty [FQHC - PSYCHIATRY. PSYCHIATRY]

SELECT @LineNumber = 69
SELECT @Source = '[(A-021 - A022)]'
SELECT @Title = '[Children]'


;WITH CTE_67minus68
AS 
(
SELECT  
      [LineNumber]
      ,[Source]
      ,[Line_Title]
      ,[DateTime_Created]
      ,(SELECT     'TheCalculation' = 
			 CASE 
						WHEN [LineNumber] = 67
						   THEN [Result] 
						WHEN [LineNumber] = 68 
						   THEN -[Result] 
						ELSE 0 
				   END) as [Result] 	  	  		  
	  
      ,[YYYY_MM]

  FROM [Success].[dbo].[zzz_p0021_25_MultipleMonths_IDR_part_A_results]
    WHERE 
		[LineNumber] = 67
		or 
		[LineNumber] = 68
)

--SELECT * FROM CTE_67minus68

,CTE_67minus68_RESULTS
AS
(
SELECT DISTINCT
      SUM([Result]) OVER(PARTITION BY [YYYY_MM]) AS RESULT
      ,[YYYY_MM]
FROM CTE_67minus68

)


INSERT INTO [Success].[dbo].[zzz_p0021_25_MultipleMonths_IDR_part_A_results] 
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
FROM CTE_67minus68_RESULTS 
ORDER BY YYYY_MM
		
--RESULTS TABLE==========================================================================
SELECT * from [Success].[dbo].[zzz_p0021_25_MultipleMonths_IDR_part_A_results] 

