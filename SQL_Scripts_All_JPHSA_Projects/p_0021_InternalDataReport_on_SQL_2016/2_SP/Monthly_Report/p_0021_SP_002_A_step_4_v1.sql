--p_0021_SP_002_A_step_4_v1.sql

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



USE [Success];
GO
----------------------- Local Variables
   DECLARE @LineNumber int
   DECLARE @Source nvarchar(100)
   DECLARE @Title nvarchar(255)
----------------------------------------
IF OBJECT_ID('dbo.zzz_p0021_1_IDR_part_A_results') IS NOT NULL
    DROP TABLE dbo.zzz_p0021_1_IDR_part_A_results


CREATE TABLE [dbo].[zzz_p0021_1_IDR_part_A_results]
(
		[IDR_a_PK] [int] IDENTITY(1,1) NOT NULL,		
		[LineNumber] [int] NOT NULL,
		[Source] nvarchar(100) NOT NULL,
		[Line_Title] nvarchar(255) NOT NULL,
		[DateTime_Created] [datetime] NOT NULL CONSTRAINT zzz_p0021_1_IDR_part_A_results_Default_GETDATE DEFAULT GETDATE(),
		[Result] [int] NOT NULL,
		[IDR_a_RowVersion] [timestamp] NULL
	,CONSTRAINT [zzz_p0021_1_IDR_part_A_results$IDR_a_PK] PRIMARY KEY NONCLUSTERED 
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
WITH cte_Line_14
AS
(
	SELECT distinct
		  t3.[LOC],
		  t3.[Bill_Provider_Name],
		  t3.[Patient_No],
		  t3.svc,
		  t3.[Check-In_Day]

	  FROM [Success].[dbo].[zzz_p0021_4_for_Analysis_of_Part_A] t3
	  Where (
				upper(rtrim(ltrim(t3.TYPE))) = 'PC'
				AND
				upper(rtrim(ltrim(t3.[LOC]))) = 'EJ'
			)
)

--SELECT * 
--From cte_Line_14

INSERT INTO [Success].[dbo].[zzz_p0021_1_IDR_part_A_results] 
		(
		[LineNumber],
		[Source],
		[Line_Title],
		[Result]
		)
VALUES
		(
			@LineNumber 
			,@Source
			,@Title 
			, (SELECT Count(*) FROM cte_Line_14)
		)

--	Line: [15] , Source: [A-002] , ______________________________ Description: [Adults]  , _____________________________ Bill_Provider_Specialty [FAMILY PRACTICE]


SELECT @LineNumber = 15
SELECT @Source = '[A-002]'
SELECT @Title = '[Adults]'
;
WITH cte_Line_15
AS
(
	SELECT distinct
		  t3.[LOC],
		  t3.[Bill_Provider_Name],
		  t3.[Patient_No],
		  t3.svc,
		  t3.[Check-In_Day]


	  FROM [Success].[dbo].[zzz_p0021_4_for_Analysis_of_Part_A] t3
	  Where (
				upper(rtrim(ltrim(t3.TYPE))) = 'PC'
				AND
				upper(rtrim(ltrim(t3.[LOC]))) = 'EJ'
				AND t3.Adult = 1
			)
)


INSERT INTO [Success].[dbo].[zzz_p0021_1_IDR_part_A_results] 
		(
		[LineNumber],
		[Source],
		[Line_Title],
		[Result]
		)
VALUES
		(
			@LineNumber 
			,@Source
			,@Title 
			, (SELECT Count(*) FROM cte_Line_15)
		)

--Line: [16] , Source: [(A-001 - A-002)] , ____________________ Description: [Children]  , ___________________________ Bill_Provider_Specialty [FAMILY PRACTICE]

SELECT @LineNumber = 16						--<==== Corrected on 4/24/2017  (was '15')
SELECT @Source = '[(A-001 - A-002)]'
SELECT @Title = '[Children]'
;
INSERT INTO [Success].[dbo].[zzz_p0021_1_IDR_part_A_results] 
		(
		[LineNumber],
		[Source],
		[Line_Title],
		[Result]
		)
VALUES
		(
			@LineNumber 
			,@Source
			,@Title 
			, ( 
					(
						SELECT TOP(1) Result 
						FROM [Success].[dbo].[zzz_p0021_1_IDR_part_A_results] 
						WHERE LineNumber = 14
					)
					-
					(
						SELECT TOP(1) Result 
						FROM [Success].[dbo].[zzz_p0021_1_IDR_part_A_results] 
						WHERE LineNumber = 15
					)
			  ) 
		)

--Line: [17] , Source: [A-003] , ______________________________ Description: [West Jefferson Health Center]  , _______ Bill_Provider_Specialty [FAMILY PRACTICE]

SELECT @LineNumber = 17
SELECT @Source = '[A-003]'
SELECT @Title = '[West Jefferson Health Center]'
;
WITH cte_Line_17
AS
(
	SELECT distinct
		  t3.[LOC],
		  t3.[Bill_Provider_Name],
		  t3.[Patient_No],
		  t3.svc,
		  t3.[Check-In_Day]
		  --t3.Patient_Birth_Date


	  FROM [Success].[dbo].[zzz_p0021_4_for_Analysis_of_Part_A] t3
	  Where (
				upper(rtrim(ltrim(t3.TYPE))) = 'PC'
				AND
				upper(rtrim(ltrim(t3.[LOC]))) = 'WJ'
				--AND t3.Adult = 1
			)
)

--SELECT * from cte_line_17
--Where [Patient_No] = 1199

--select [Patient_No], count(*) as theCount
--from cte_Line_17
--GROUP BY [Patient_No]
--Order by [Patient_No]


INSERT INTO [Success].[dbo].[zzz_p0021_1_IDR_part_A_results] 
		(
		[LineNumber],
		[Source],
		[Line_Title],
		[Result]
		)
VALUES
		(
			@LineNumber 
			,@Source
			,@Title 
			, (SELECT Count(*) FROM cte_Line_17)
		)

--	Line: [18] , Source: [A-004] , ______________________________ Description: [Adults]  , _____________________________ Bill_Provider_Specialty [FAMILY PRACTICE]

SELECT @LineNumber = 18
SELECT @Source = '[A-004]'
SELECT @Title = '[Adults]'
;
WITH cte_Line_18
AS
(
	SELECT distinct
		  t3.[LOC],
		  t3.[Bill_Provider_Name],
		  t3.[Patient_No],
		  t3.svc,
		  t3.[Check-In_Day]
		  --t3.Patient_Birth_Date


	  FROM [Success].[dbo].[zzz_p0021_4_for_Analysis_of_Part_A] t3
	  Where (
				upper(rtrim(ltrim(t3.TYPE))) = 'PC'
				AND
				upper(rtrim(ltrim(t3.[LOC]))) = 'WJ'
				AND 
				t3.Adult = 1
			)
)

--SELECT * from cte_line_17
--Where [Patient_No] = 1199

--select [Patient_No], count(*) as theCount
--from cte_Line_17
--GROUP BY [Patient_No]
--Order by [Patient_No]


INSERT INTO [Success].[dbo].[zzz_p0021_1_IDR_part_A_results] 
		(
		[LineNumber],
		[Source],
		[Line_Title],
		[Result]
		)
VALUES
		(
			@LineNumber 
			,@Source
			,@Title 
			, (SELECT Count(*) FROM cte_Line_18)
		)


--Line: [19] , Source: [(A-003 - A-004)] , ____________________ Description: [Children]  , ___________________________ Bill_Provider_Specialty [FAMILY PRACTICE]

SELECT @LineNumber = 19
SELECT @Source = '[(A-003 - A-004)]'
SELECT @Title = '[Children]'
;
INSERT INTO [Success].[dbo].[zzz_p0021_1_IDR_part_A_results] 
		(
		[LineNumber],
		[Source],
		[Line_Title],
		[Result]
		)
VALUES
		(
			@LineNumber 
			,@Source
			,@Title 
			, ( 
					(
						SELECT TOP(1) Result 
						FROM [Success].[dbo].[zzz_p0021_1_IDR_part_A_results] 
						WHERE LineNumber = 17
					)
					-
					(
						SELECT TOP(1) Result 
						FROM [Success].[dbo].[zzz_p0021_1_IDR_part_A_results] 
						WHERE LineNumber = 18
					)
			  ) 
		)

--	Line: [20] , Source: [(A-001 + A003)] , _____________________ Description: [Total Services]  , _____________________ Bill_Provider_Specialty [FAMILY PRACTICE]

SELECT @LineNumber = 20
SELECT @Source = '[(A-001 + A003)]'
SELECT @Title = '[Total Services]'
;
INSERT INTO [Success].[dbo].[zzz_p0021_1_IDR_part_A_results] 
		(
		[LineNumber],
		[Source],
		[Line_Title],
		[Result]
		)
VALUES
		(
			@LineNumber 
			,@Source
			,@Title 
			, ( 
					(
						SELECT TOP(1) Result 
						FROM [Success].[dbo].[zzz_p0021_1_IDR_part_A_results] 
						WHERE LineNumber = 14
					)
					+
					(
						SELECT TOP(1) Result 
						FROM [Success].[dbo].[zzz_p0021_1_IDR_part_A_results] 
						WHERE LineNumber = 17
					)
			  ) 
		)

--Line: [21] , Source: [(A-002 - A-004)] , ____________________ Description: [Adults]  , _____________________________ Bill_Provider_Specialty [FAMILY PRACTICE]


SELECT @LineNumber = 21
SELECT @Source = '[(A-002 - A-004)]'
SELECT @Title = '[Adults]'
;
INSERT INTO [Success].[dbo].[zzz_p0021_1_IDR_part_A_results] 
		(
		[LineNumber],
		[Source],
		[Line_Title],
		[Result]
		)
VALUES
		(
			@LineNumber 
			,@Source
			,@Title 
			, ( 
					(
						SELECT TOP(1) Result 
						FROM [Success].[dbo].[zzz_p0021_1_IDR_part_A_results] 
						WHERE LineNumber = 15
					)
					+
					(
						SELECT TOP(1) Result 
						FROM [Success].[dbo].[zzz_p0021_1_IDR_part_A_results] 
						WHERE LineNumber = 18
					)
			  ) 
		)

--Line: [22] , Source: [(A-001 - A-002) + (A-003 - A-004)] , __ Description: [Children]  , ___________________________ Bill_Provider_Specialty [FAMILY PRACTICE]


SELECT @LineNumber = 22
SELECT @Source = '[(A-001 - A-002) + (A-003 - A-004)]'
SELECT @Title = '[Children]'
;
INSERT INTO [Success].[dbo].[zzz_p0021_1_IDR_part_A_results] 
		(
		[LineNumber],
		[Source],
		[Line_Title],
		[Result]
		)
VALUES
		(
			@LineNumber 
			,@Source
			,@Title 
			, (
				( 
					(
						SELECT TOP(1) Result 
						FROM [Success].[dbo].[zzz_p0021_1_IDR_part_A_results] 
						WHERE LineNumber = 14
					)
					-
					(
						SELECT TOP(1) Result 
						FROM [Success].[dbo].[zzz_p0021_1_IDR_part_A_results] 
						WHERE LineNumber = 15
					)
				)
				+
				( 
					(
						SELECT TOP(1) Result 
						FROM [Success].[dbo].[zzz_p0021_1_IDR_part_A_results] 
						WHERE LineNumber = 17
					)
					-
					(
						SELECT TOP(1) Result 
						FROM [Success].[dbo].[zzz_p0021_1_IDR_part_A_results] 
						WHERE LineNumber = 18
					)
				)
			  )  
		)

--Line: [24] , Source: [A-005] , ______________________________ Description: [East Jefferson Health Center]  , _______ Bill_Provider_Specialty [FAMILY PRACTICE]


SELECT @LineNumber = 24
SELECT @Source = '[A-005]'
SELECT @Title = '[East Jefferson Health Center]'
;
WITH cte_Line_24
AS
(
	SELECT distinct
		  --t3.[LOC],
		  --t3.[Bill_Provider_Name],
		  t3.[Patient_No]		--un-duplicated Individuals
		  --t3.svc,
		  --t3.[Check-In_Day]



	  FROM [Success].[dbo].[zzz_p0021_4_for_Analysis_of_Part_A] t3
	  Where (
				upper(rtrim(ltrim(t3.TYPE))) = 'PC'
				AND
				upper(rtrim(ltrim(t3.[LOC]))) = 'EJ'
				--AND 
				--t3.Adult = 1
			)
)

--SELECT * from cte_line_17
--Where [Patient_No] = 1199

--select [Patient_No], count(*) as theCount
--from cte_Line_17
--GROUP BY [Patient_No]
--Order by [Patient_No]


INSERT INTO [Success].[dbo].[zzz_p0021_1_IDR_part_A_results] 
		(
		[LineNumber],
		[Source],
		[Line_Title],
		[Result]
		)
VALUES
		(
			@LineNumber 
			,@Source
			,@Title 
			, (SELECT Count(*) FROM cte_Line_24)
		)

--	Line: [25] , Source: [A-006] , ______________________________ Description: [Adults]  , _____________________________ Bill_Provider_Specialty [FAMILY PRACTICE]


SELECT @LineNumber = 25
SELECT @Source = '[A-006]'
SELECT @Title = '[Adults]'
;
WITH cte_Line_24
AS
(
	SELECT distinct
		  --t3.[LOC],
		  --t3.[Bill_Provider_Name],
		  t3.[Patient_No]		--un-duplicated Individuals
		  --t3.svc,
		  --t3.[Check-In_Day]



	  FROM [Success].[dbo].[zzz_p0021_4_for_Analysis_of_Part_A] t3
	  Where (
				upper(rtrim(ltrim(t3.TYPE))) = 'PC'
				AND
				upper(rtrim(ltrim(t3.[LOC]))) = 'EJ'
				AND 
				t3.Adult = 1
			)
)

--SELECT * from cte_line_17
--Where [Patient_No] = 1199

--select [Patient_No], count(*) as theCount
--from cte_Line_17
--GROUP BY [Patient_No]
--Order by [Patient_No]


INSERT INTO [Success].[dbo].[zzz_p0021_1_IDR_part_A_results] 
		(
		[LineNumber],
		[Source],
		[Line_Title],
		[Result]
		)
VALUES
		(
			@LineNumber 
			,@Source
			,@Title 
			, (SELECT Count(*) FROM cte_Line_24)
		)

--Line: [26] , Source: [(A-005 - A-006)] , ____________________ Description: [Children]  , ___________________________ Bill_Provider_Specialty [FAMILY PRACTICE]



SELECT @LineNumber = 26
SELECT @Source = '[(A-005 - A-006)]'
SELECT @Title = '[Children]'
;
INSERT INTO [Success].[dbo].[zzz_p0021_1_IDR_part_A_results] 
		(
		[LineNumber],
		[Source],
		[Line_Title],
		[Result]
		)
VALUES
		(
			@LineNumber 
			,@Source
			,@Title 
			, ( 
					(
						SELECT TOP(1) Result 
						FROM [Success].[dbo].[zzz_p0021_1_IDR_part_A_results] 
						WHERE LineNumber = 24
					)
					-
					(
						SELECT TOP(1) Result 
						FROM [Success].[dbo].[zzz_p0021_1_IDR_part_A_results] 
						WHERE LineNumber = 25
					)
			  ) 
		)
--Line: [27] , Source: [A-007] , ______________________________ Description: [West Jefferson Health Center]  , _______ Bill_Provider_Specialty [FAMILY PRACTICE]



SELECT @LineNumber = 27
SELECT @Source = '[A-007]'
SELECT @Title = '[West Jefferson Health Center]'
;
WITH cte_Line_27
AS
(
	SELECT distinct
		  --t3.[LOC],
		  --t3.[Bill_Provider_Name],
		  t3.[Patient_No]		--un-duplicated Individuals
		  --t3.svc,
		  --t3.[Check-In_Day]



	  FROM [Success].[dbo].[zzz_p0021_4_for_Analysis_of_Part_A] t3
	  Where (
				upper(rtrim(ltrim(t3.TYPE))) = 'PC'
				AND
				upper(rtrim(ltrim(t3.[LOC]))) = 'WJ'
				--AND 
				--t3.Adult = 1
			)
)

--SELECT * from cte_line_17
--Where [Patient_No] = 1199

--select [Patient_No], count(*) as theCount
--from cte_Line_17
--GROUP BY [Patient_No]
--Order by [Patient_No]


INSERT INTO [Success].[dbo].[zzz_p0021_1_IDR_part_A_results] 
		(
		[LineNumber],
		[Source],
		[Line_Title],
		[Result]
		)
VALUES
		(
			@LineNumber 
			,@Source
			,@Title 
			, (SELECT Count(*) FROM cte_Line_27)
		)


--Line: [28] , Source: [A-008] , ______________________________ Description: [Adults]  , _____________________________ Bill_Provider_Specialty [FAMILY PRACTICE]




SELECT @LineNumber = 28
SELECT @Source = '[A-008]'
SELECT @Title = '[Adults]'
;
WITH cte_Line_28
AS
(
	SELECT distinct
		  --t3.[LOC],
		  --t3.[Bill_Provider_Name],
		  t3.[Patient_No]		--un-duplicated Individuals
		  --t3.svc,
		  --t3.[Check-In_Day]



	  FROM [Success].[dbo].[zzz_p0021_4_for_Analysis_of_Part_A] t3
	  Where (
				upper(rtrim(ltrim(t3.TYPE))) = 'PC'
				AND
				upper(rtrim(ltrim(t3.[LOC]))) = 'WJ'
				AND 
				t3.Adult = 1
			)
)

--SELECT * from cte_line_17
--Where [Patient_No] = 1199

--select [Patient_No], count(*) as theCount
--from cte_Line_17
--GROUP BY [Patient_No]
--Order by [Patient_No]


INSERT INTO [Success].[dbo].[zzz_p0021_1_IDR_part_A_results] 
		(
		[LineNumber],
		[Source],
		[Line_Title],
		[Result]
		)
VALUES
		(
			@LineNumber 
			,@Source
			,@Title 
			, (SELECT Count(*) FROM cte_Line_28)
		)

--Line: [29] , Source: [(A-007 - A-008)] , ____________________ Description: [Children]  , ___________________________ Bill_Provider_Specialty [FAMILY PRACTICE]

SELECT @LineNumber = 29
SELECT @Source = '[(A-007 - A-008)]'
SELECT @Title = '[Children]'
;
INSERT INTO [Success].[dbo].[zzz_p0021_1_IDR_part_A_results] 
		(
		[LineNumber],
		[Source],
		[Line_Title],
		[Result]
		)
VALUES
		(
			@LineNumber 
			,@Source
			,@Title 
			, ( 
					(
						SELECT TOP(1) Result 
						FROM [Success].[dbo].[zzz_p0021_1_IDR_part_A_results] 
						WHERE LineNumber = 27
					)
					-
					(
						SELECT TOP(1) Result 
						FROM [Success].[dbo].[zzz_p0021_1_IDR_part_A_results] 
						WHERE LineNumber = 28
					)
			  ) 
		)

	--Line: [30] , Source: [A-009] , ______________________________ Description: [Total Unduplicated Individuals Served]  ,  Bill_Provider_Specialty [FAMILY PRACTICE]




SELECT @LineNumber = 30
SELECT @Source = '[A-009]'
SELECT @Title = '[Total Unduplicated Individuals Served]'
;
WITH cte_Line_30
AS
(
	SELECT distinct
		  --t3.[LOC],
		  --t3.[Bill_Provider_Name],
		  t3.[Patient_No]		--un-duplicated Individuals
		  --t3.svc,
		  --t3.[Check-In_Day]



	  FROM [Success].[dbo].[zzz_p0021_4_for_Analysis_of_Part_A] t3
	  Where (
				upper(rtrim(ltrim(t3.TYPE))) = 'PC'
				--AND
				--upper(rtrim(ltrim(t3.[LOC]))) = 'WJ'
				--AND 
				--t3.Adult = 1
			)
)

--SELECT * from cte_line_17
--Where [Patient_No] = 1199

--select [Patient_No], count(*) as theCount
--from cte_Line_17
--GROUP BY [Patient_No]
--Order by [Patient_No]


INSERT INTO [Success].[dbo].[zzz_p0021_1_IDR_part_A_results] 
		(
		[LineNumber],
		[Source],
		[Line_Title],
		[Result]
		)
VALUES
		(
			@LineNumber 
			,@Source
			,@Title 
			, (SELECT Count(*) FROM cte_Line_30)
		)

--	Line: [31] , Source: [A-010] , ______________________________ Description: [Adults]  , _____________________________ Bill_Provider_Specialty [FAMILY PRACTICE]

SELECT @LineNumber = 31
SELECT @Source = '[A-010]'
SELECT @Title = '[Adults]'
;
WITH cte_Line_31
AS
(
	SELECT distinct
		  --t3.[LOC],
		  --t3.[Bill_Provider_Name],
		  t3.[Patient_No]		--un-duplicated Individuals
		  --t3.svc,
		  --t3.[Check-In_Day]



	  FROM [Success].[dbo].[zzz_p0021_4_for_Analysis_of_Part_A] t3
	  Where (
				upper(rtrim(ltrim(t3.TYPE))) = 'PC'
				--AND
				--upper(rtrim(ltrim(t3.[LOC]))) = 'WJ'
				AND 
				t3.Adult = 1
			)
)

--SELECT * from cte_line_17
--Where [Patient_No] = 1199

--select [Patient_No], count(*) as theCount
--from cte_Line_17
--GROUP BY [Patient_No]
--Order by [Patient_No]


INSERT INTO [Success].[dbo].[zzz_p0021_1_IDR_part_A_results] 
		(
		[LineNumber],
		[Source],
		[Line_Title],
		[Result]
		)
VALUES
		(
			@LineNumber 
			,@Source
			,@Title 
			, (SELECT Count(*) FROM cte_Line_31)
		)

--	Line: [32] , Source: [(A-009 - A010)] , _____________________ Description: [Children]  , ___________________________ Bill_Provider_Specialty [FAMILY PRACTICE]


SELECT @LineNumber = 32
SELECT @Source = '[(A-009 - A010)]'
SELECT @Title = '[Children]'
;
INSERT INTO [Success].[dbo].[zzz_p0021_1_IDR_part_A_results] 
		(
		[LineNumber],
		[Source],
		[Line_Title],
		[Result]
		)
VALUES
		(
			@LineNumber 
			,@Source
			,@Title 
			, ( 
					(
						SELECT TOP(1) Result 
						FROM [Success].[dbo].[zzz_p0021_1_IDR_part_A_results] 
						WHERE LineNumber = 30
					)
					-
					(
						SELECT TOP(1) Result 
						FROM [Success].[dbo].[zzz_p0021_1_IDR_part_A_results] 
						WHERE LineNumber = 31
					)
			  ) 
		)

--	Line: [46] , Source: [A-011] , ______________________________ Description: [East Jefferson Health Center]  , _______ Bill_Provider_Specialty [FQHC - PSYCHIATRY. PSYCHIATRY]


SELECT @LineNumber = 46
SELECT @Source = '[A-011]'
SELECT @Title = '[East Jefferson Health Center]'
;

WITH cte_Line_46
AS
(
	SELECT distinct
		  t3.[LOC],
		  t3.[Bill_Provider_Name],
		  t3.[Patient_No],
		  t3.svc,
		  t3.[Check-In_Day]

	  FROM [Success].[dbo].[zzz_p0021_4_for_Analysis_of_Part_A] t3
	  Where (
				upper(rtrim(ltrim(t3.TYPE))) = 'BH'
				AND
				upper(rtrim(ltrim(t3.[LOC]))) = 'EJ'
				--AND 
				--t3.Adult = 1
			)
)
--SELECT * 
--From cte_Line_14

INSERT INTO [Success].[dbo].[zzz_p0021_1_IDR_part_A_results] 
		(
		[LineNumber],
		[Source],
		[Line_Title],
		[Result]
		)
VALUES
		(
			@LineNumber 
			,@Source
			,@Title 
			, (SELECT Count(*) FROM cte_Line_46)
		)

--	Line: [47] , Source: [A-012] , ______________________________ Description: [Adults]  , _____________________________ Bill_Provider_Specialty [FQHC - PSYCHIATRY. PSYCHIATRY]

SELECT @LineNumber = 47
SELECT @Source = '[A-012]'
SELECT @Title = '[Adults]'
;

WITH cte_Line_47
AS
(
	SELECT distinct
		  t3.[LOC],
		  t3.[Bill_Provider_Name],
		  t3.[Patient_No],
		  t3.svc,
		  t3.[Check-In_Day]

	  FROM [Success].[dbo].[zzz_p0021_4_for_Analysis_of_Part_A] t3
	  Where (
				upper(rtrim(ltrim(t3.TYPE))) = 'BH'
				AND
				upper(rtrim(ltrim(t3.[LOC]))) = 'EJ'
				AND 
				t3.Adult = 1
			)
)
--SELECT * 
--From cte_Line_14

INSERT INTO [Success].[dbo].[zzz_p0021_1_IDR_part_A_results] 
		(
		[LineNumber],
		[Source],
		[Line_Title],
		[Result]
		)
VALUES
		(
			@LineNumber 
			,@Source
			,@Title 
			, (SELECT Count(*) FROM cte_Line_47)
		)
--	Line: [48] , Source: [(A-011 - A-012)] , ____________________ Description: [Children]  , ___________________________ Bill_Provider_Specialty [FQHC - PSYCHIATRY. PSYCHIATRY]


SELECT @LineNumber = 48
SELECT @Source = '[(A-011 - A-012)]'
SELECT @Title = '[Children]'
;
INSERT INTO [Success].[dbo].[zzz_p0021_1_IDR_part_A_results] 
		(
		[LineNumber],
		[Source],
		[Line_Title],
		[Result]
		)
VALUES
		(
			@LineNumber 
			,@Source
			,@Title 
			, ( 
					(
						SELECT TOP(1) Result 
						FROM [Success].[dbo].[zzz_p0021_1_IDR_part_A_results] 
						WHERE LineNumber = 46
					)
					-
					(
						SELECT TOP(1) Result 
						FROM [Success].[dbo].[zzz_p0021_1_IDR_part_A_results] 
						WHERE LineNumber = 47
					)
			  ) 
		)

--	Line: [49] , Source: [A-013] , ______________________________ Description: [West JeffersonHealth Center]  , ________ Bill_Provider_Specialty [FQHC - PSYCHIATRY. PSYCHIATRY]


SELECT @LineNumber = 49
SELECT @Source = '[A-013]'
SELECT @Title = '[West JeffersonHealth Center]'
;

WITH cte_Line_49
AS
(
	SELECT distinct
		  t3.[LOC],
		  t3.[Bill_Provider_Name],
		  t3.[Patient_No],
		  t3.svc,
		  t3.[Check-In_Day]

	  FROM [Success].[dbo].[zzz_p0021_4_for_Analysis_of_Part_A] t3
	  Where (
				upper(rtrim(ltrim(t3.TYPE))) = 'BH'
				AND
				upper(rtrim(ltrim(t3.[LOC]))) = 'WJ'
				--AND 
				--t3.Adult = 1
			)
)
--SELECT * 
--From cte_Line_14

INSERT INTO [Success].[dbo].[zzz_p0021_1_IDR_part_A_results] 
		(
		[LineNumber],
		[Source],
		[Line_Title],
		[Result]
		)
VALUES
		(
			@LineNumber 
			,@Source
			,@Title 
			, (SELECT Count(*) FROM cte_Line_49)
		)

--Line: [50] , Source: [A-014] , ______________________________ Description: [Adults]  , _____________________________ Bill_Provider_Specialty [FQHC - PSYCHIATRY. PSYCHIATRY]


SELECT @LineNumber = 50
SELECT @Source = '[A-014]'
SELECT @Title = '[Adults]'
;

WITH cte_Line_50
AS
(
	SELECT distinct
		  t3.[LOC],
		  t3.[Bill_Provider_Name],
		  t3.[Patient_No],
		  t3.svc,
		  t3.[Check-In_Day]

	  FROM [Success].[dbo].[zzz_p0021_4_for_Analysis_of_Part_A] t3
	  Where (
				upper(rtrim(ltrim(t3.TYPE))) = 'BH'
				AND
				upper(rtrim(ltrim(t3.[LOC]))) = 'WJ'
				AND 
				t3.Adult = 1
			)
)
--SELECT * 
--From cte_Line_14

INSERT INTO [Success].[dbo].[zzz_p0021_1_IDR_part_A_results] 
		(
		[LineNumber],
		[Source],
		[Line_Title],
		[Result]
		)
VALUES
		(
			@LineNumber 
			,@Source
			,@Title 
			, (SELECT Count(*) FROM cte_Line_50)
		)

--	Line: [51] , Source: [(A-013 - A-014)] , ____________________ Description: [Children]  , ___________________________ Bill_Provider_Specialty [FQHC - PSYCHIATRY. PSYCHIATRY]


SELECT @LineNumber = 51
SELECT @Source = '[(A-013 - A-014)]'
SELECT @Title = '[Children]'
;
INSERT INTO [Success].[dbo].[zzz_p0021_1_IDR_part_A_results] 
		(
		[LineNumber],
		[Source],
		[Line_Title],
		[Result]
		)
VALUES
		(
			@LineNumber 
			,@Source
			,@Title 
			, ( 
					(
						SELECT TOP(1) Result 
						FROM [Success].[dbo].[zzz_p0021_1_IDR_part_A_results] 
						WHERE LineNumber = 49
					)
					-
					(
						SELECT TOP(1) Result 
						FROM [Success].[dbo].[zzz_p0021_1_IDR_part_A_results] 
						WHERE LineNumber = 50
					)
			  ) 
		)

--Line: [52] , Source: [(A-011 + A-013)] , ____________________ Description: [Total Services]  , _____________________ Bill_Provider_Specialty [FQHC - PSYCHIATRY. PSYCHIATRY]


SELECT @LineNumber = 52
SELECT @Source = '[(A-011 + A-013)]'
SELECT @Title = '[Total Services]'
;
INSERT INTO [Success].[dbo].[zzz_p0021_1_IDR_part_A_results] 
		(
		[LineNumber],
		[Source],
		[Line_Title],
		[Result]
		)
VALUES
		(
			@LineNumber 
			,@Source
			,@Title 
			, ( 
					(
						SELECT TOP(1) Result 
						FROM [Success].[dbo].[zzz_p0021_1_IDR_part_A_results] 
						WHERE LineNumber = 46
					)
					+
					(
						SELECT TOP(1) Result 
						FROM [Success].[dbo].[zzz_p0021_1_IDR_part_A_results] 
						WHERE LineNumber = 49
					)
			  ) 
		)
--	Line: [53] , Source: [(A-012 + A-014)] , ____________________ Description: [Adults]  , _____________________________ Bill_Provider_Specialty [FQHC - PSYCHIATRY. PSYCHIATRY]


SELECT @LineNumber = 53
SELECT @Source = '[(A-012 + A-014)]'
SELECT @Title = '[Adults]'
;
INSERT INTO [Success].[dbo].[zzz_p0021_1_IDR_part_A_results] 
		(
		[LineNumber],
		[Source],
		[Line_Title],
		[Result]
		)
VALUES
		(
			@LineNumber 
			,@Source
			,@Title 
			, ( 
					(
						SELECT TOP(1) Result 
						FROM [Success].[dbo].[zzz_p0021_1_IDR_part_A_results] 
						WHERE LineNumber = 47
					)
					+
					(
						SELECT TOP(1) Result 
						FROM [Success].[dbo].[zzz_p0021_1_IDR_part_A_results] 
						WHERE LineNumber = 50
					)
			  ) 
		)

--Line: [54] , Source: [(A-011 + A-013) - (A-012 + A-014)] , __ Description: [Children]  , ___________________________ Bill_Provider_Specialty [FQHC - PSYCHIATRY. PSYCHIATRY]


SELECT @LineNumber = 54
SELECT @Source = '[(A-011 + A-013) - (A-012 + A-014)]'
SELECT @Title = '[Children]'
;
INSERT INTO [Success].[dbo].[zzz_p0021_1_IDR_part_A_results] 
		(
		[LineNumber],
		[Source],
		[Line_Title],
		[Result]
		)
VALUES
		(
			@LineNumber 
			,@Source
			,@Title 
			, (
				( 
					(
						SELECT TOP(1) Result 
						FROM [Success].[dbo].[zzz_p0021_1_IDR_part_A_results] 
						WHERE LineNumber = 46
					)
					+
					(
						SELECT TOP(1) Result 
						FROM [Success].[dbo].[zzz_p0021_1_IDR_part_A_results] 
						WHERE LineNumber = 49
					)
				)
				-
				( 
					(
						SELECT TOP(1) Result 
						FROM [Success].[dbo].[zzz_p0021_1_IDR_part_A_results] 
						WHERE LineNumber = 47
					)
					+
					(
						SELECT TOP(1) Result 
						FROM [Success].[dbo].[zzz_p0021_1_IDR_part_A_results] 
						WHERE LineNumber = 50
					)
				)
			  )  
		)

--	Line: [56] , Source: [A-015] , ______________________________ Description: [East Jefferson Health Center]  , _______ Bill_Provider_Specialty [FQHC - PSYCHIATRY. PSYCHIATRY]

SELECT @LineNumber = 56
SELECT @Source = '[A-015]'
SELECT @Title = '[East Jefferson Health Center]'
;

WITH cte_Line_56
AS
(
	SELECT distinct
		  --t3.[LOC],
		  --t3.[Bill_Provider_Name],
		  t3.[Patient_No]
		  --t3.svc,
		  --t3.[Check-In_Day]

	  FROM [Success].[dbo].[zzz_p0021_4_for_Analysis_of_Part_A] t3
	  Where (
				upper(rtrim(ltrim(t3.TYPE))) = 'BH'
				AND
				upper(rtrim(ltrim(t3.[LOC]))) = 'EJ'
				--AND 
				--t3.Adult = 1
			)
)
--SELECT * 
--From cte_Line_14

INSERT INTO [Success].[dbo].[zzz_p0021_1_IDR_part_A_results] 
		(
		[LineNumber],
		[Source],
		[Line_Title],
		[Result]
		)
VALUES
		(
			@LineNumber 
			,@Source
			,@Title 
			, (SELECT Count(*) FROM cte_Line_56)
		)

--	Line: [57] , Source: [A-016] , ______________________________ Description: [Adults]  , _____________________________ Bill_Provider_Specialty [FQHC - PSYCHIATRY. PSYCHIATRY]

SELECT @LineNumber = 57
SELECT @Source = '[A-016]'
SELECT @Title = '[Adults]'
;

WITH cte_Line_56
AS
(
	SELECT distinct
		  --t3.[LOC],
		  --t3.[Bill_Provider_Name],
		  t3.[Patient_No]
		  --t3.svc,
		  --t3.[Check-In_Day]

	  FROM [Success].[dbo].[zzz_p0021_4_for_Analysis_of_Part_A] t3
	  Where (
				upper(rtrim(ltrim(t3.TYPE))) = 'BH'
				AND
				upper(rtrim(ltrim(t3.[LOC]))) = 'EJ'
				AND 
				t3.Adult = 1
			)
)
--SELECT * 
--From cte_Line_14

INSERT INTO [Success].[dbo].[zzz_p0021_1_IDR_part_A_results] 
		(
		[LineNumber],
		[Source],
		[Line_Title],
		[Result]
		)
VALUES
		(
			@LineNumber 
			,@Source
			,@Title 
			, (SELECT Count(*) FROM cte_Line_56)
		)

--	Line: [58] , Source: [(A-015 - A-016)] , ____________________ Description: [Children]  , ___________________________ Bill_Provider_Specialty [FQHC - PSYCHIATRY. PSYCHIATRY]

SELECT @LineNumber = 58
SELECT @Source = '[(A-015 - A-016)]'
SELECT @Title = '[Children]'
;
INSERT INTO [Success].[dbo].[zzz_p0021_1_IDR_part_A_results] 
		(
		[LineNumber],
		[Source],
		[Line_Title],
		[Result]
		)
VALUES
		(
			@LineNumber 
			,@Source
			,@Title 
			, ( 
					(
						SELECT TOP(1) Result 
						FROM [Success].[dbo].[zzz_p0021_1_IDR_part_A_results] 
						WHERE LineNumber = 56
					)
					-
					(
						SELECT TOP(1) Result 
						FROM [Success].[dbo].[zzz_p0021_1_IDR_part_A_results] 
						WHERE LineNumber = 57
					)
			  ) 
		)
--	Line: [59] , Source: [A-017] , ______________________________ Description: [West Jefferson Health Center]  , _______ Bill_Provider_Specialty [FQHC - PSYCHIATRY. PSYCHIATRY]

SELECT @LineNumber = 59
SELECT @Source = '[A-017]'
SELECT @Title = '[West Jefferson Health Center]'
;

WITH cte_Line_59
AS
(
	SELECT distinct
		  --t3.[LOC],
		  --t3.[Bill_Provider_Name],
		  t3.[Patient_No]
		  --t3.svc,
		  --t3.[Check-In_Day]

	  FROM [Success].[dbo].[zzz_p0021_4_for_Analysis_of_Part_A] t3
	  Where (
				upper(rtrim(ltrim(t3.TYPE))) = 'BH'
				AND
				upper(rtrim(ltrim(t3.[LOC]))) = 'WJ'
				--AND 
				--t3.Adult = 1
			)
)
--SELECT * 
--From cte_Line_14

INSERT INTO [Success].[dbo].[zzz_p0021_1_IDR_part_A_results] 
		(
		[LineNumber],
		[Source],
		[Line_Title],
		[Result]
		)
VALUES
		(
			@LineNumber 
			,@Source
			,@Title 
			, (SELECT Count(*) FROM cte_Line_59)
		)
--	Line: [60] , Source: [A-018] , ______________________________ Description: [Adults]  , _____________________________ Bill_Provider_Specialty [FQHC - PSYCHIATRY. PSYCHIATRY]


SELECT @LineNumber = 60
SELECT @Source = '[A-018]'
SELECT @Title = '[Adults]'
;

WITH cte_Line_60
AS
(
	SELECT distinct
		  --t3.[LOC],
		  --t3.[Bill_Provider_Name],
		  t3.[Patient_No]
		  --t3.svc,
		  --t3.[Check-In_Day]

	  FROM [Success].[dbo].[zzz_p0021_4_for_Analysis_of_Part_A] t3
	  Where (
				upper(rtrim(ltrim(t3.TYPE))) = 'BH'
				AND
				upper(rtrim(ltrim(t3.[LOC]))) = 'WJ'
				AND 
				t3.Adult = 1
			)
)
--SELECT * 
--From cte_Line_14

INSERT INTO [Success].[dbo].[zzz_p0021_1_IDR_part_A_results] 
		(
		[LineNumber],
		[Source],
		[Line_Title],
		[Result]
		)
VALUES
		(
			@LineNumber 
			,@Source
			,@Title 
			, (SELECT Count(*) FROM cte_Line_60)
		)

--Line: [61] , Source: [(A-017 - A018)] , _____________________ Description: [Children]  , ___________________________ Bill_Provider_Specialty [FQHC - PSYCHIATRY. PSYCHIATRY]


SELECT @LineNumber = 61
SELECT @Source = '[(A-017 - A018)]'
SELECT @Title = '[Children]'
;
INSERT INTO [Success].[dbo].[zzz_p0021_1_IDR_part_A_results] 
		(
		[LineNumber],
		[Source],
		[Line_Title],
		[Result]
		)
VALUES
		(
			@LineNumber 
			,@Source
			,@Title 
			, ( 
					(
						SELECT TOP(1) Result 
						FROM [Success].[dbo].[zzz_p0021_1_IDR_part_A_results] 
						WHERE LineNumber = 59
					)
					-
					(
						SELECT TOP(1) Result 
						FROM [Success].[dbo].[zzz_p0021_1_IDR_part_A_results] 
						WHERE LineNumber = 60
					)
			  ) 
		)

--	Line: [62] , Source: [A-019] , ______________________________ Description: [Total Unduplicated Individuals Served]  ,  Bill_Provider_Specialty [FQHC - PSYCHIATRY. PSYCHIATRY]

SELECT @LineNumber = 62
SELECT @Source = '[A-019]'
SELECT @Title = '[Total Unduplicated Individuals Served]'
;

WITH cte_Line_60
AS
(
	SELECT distinct
		  --t3.[LOC],
		  --t3.[Bill_Provider_Name],
		  t3.[Patient_No]
		  --t3.svc,
		  --t3.[Check-In_Day]

	  FROM [Success].[dbo].[zzz_p0021_4_for_Analysis_of_Part_A] t3
	  Where (
				upper(rtrim(ltrim(t3.TYPE))) = 'BH'
				--AND
				--upper(rtrim(ltrim(t3.[LOC]))) = 'WJ'
				--AND 
				--t3.Adult = 1
			)
)
--SELECT * 
--From cte_Line_14

INSERT INTO [Success].[dbo].[zzz_p0021_1_IDR_part_A_results] 
		(
		[LineNumber],
		[Source],
		[Line_Title],
		[Result]
		)
VALUES
		(
			@LineNumber 
			,@Source
			,@Title 
			, (SELECT Count(*) FROM cte_Line_60)
		)

--	Line: [63] , Source: [A-020] , ______________________________ Description: [Adults]  , _____________________________ Bill_Provider_Specialty [FQHC - PSYCHIATRY. PSYCHIATRY]


SELECT @LineNumber = 63
SELECT @Source = '[A-020]'
SELECT @Title = '[Adults]'
;

WITH cte_Line_63
AS
(
	SELECT distinct
		  --t3.[LOC],
		  --t3.[Bill_Provider_Name],
		  t3.[Patient_No]
		  --t3.svc,
		  --t3.[Check-In_Day]

	  FROM [Success].[dbo].[zzz_p0021_4_for_Analysis_of_Part_A] t3
	  Where (
				upper(rtrim(ltrim(t3.TYPE))) = 'BH'
				--AND
				--upper(rtrim(ltrim(t3.[LOC]))) = 'WJ'
				AND 
				t3.Adult = 1
			)
)
--SELECT * 
--From cte_Line_14

INSERT INTO [Success].[dbo].[zzz_p0021_1_IDR_part_A_results] 
		(
		[LineNumber],
		[Source],
		[Line_Title],
		[Result]
		)
VALUES
		(
			@LineNumber 
			,@Source
			,@Title 
			, (SELECT Count(*) FROM cte_Line_63)
		)
--	Line: [64] , Source: [(A-019 - A-020)] , ____________________ Description: [Children]  , ___________________________ Bill_Provider_Specialty [FQHC - PSYCHIATRY. PSYCHIATRY]


SELECT @LineNumber = 64
SELECT @Source = '[(A-019 - A-020)]'
SELECT @Title = '[Children]'
;
INSERT INTO [Success].[dbo].[zzz_p0021_1_IDR_part_A_results] 
		(
		[LineNumber],
		[Source],
		[Line_Title],
		[Result]
		)
VALUES
		(
			@LineNumber 
			,@Source
			,@Title 
			, ( 
					(
						SELECT TOP(1) Result 
						FROM [Success].[dbo].[zzz_p0021_1_IDR_part_A_results] 
						WHERE LineNumber = 62
					)
					-
					(
						SELECT TOP(1) Result 
						FROM [Success].[dbo].[zzz_p0021_1_IDR_part_A_results] 
						WHERE LineNumber = 63
					)
			  ) 
		)

--		Line: [66] , Source: [(A-001 + A003) + (A-011 + A-013)] , ___ Description: [Total Services]  , _____________________ Bill_Provider_Specialty [FQHC - PSYCHIATRY. PSYCHIATRY]

SELECT @LineNumber = 66
SELECT @Source = '[(A-001 + A003) + (A-011 + A-013)]'
SELECT @Title = '[Total Services]'
;
INSERT INTO [Success].[dbo].[zzz_p0021_1_IDR_part_A_results] 
		(
		[LineNumber],
		[Source],
		[Line_Title],
		[Result]
		)
VALUES
		(
			@LineNumber 
			,@Source
			,@Title 
			, (
				( 
					(
						SELECT TOP(1) Result 
						FROM [Success].[dbo].[zzz_p0021_1_IDR_part_A_results] 
						WHERE LineNumber = 14
					)
					+
					(
						SELECT TOP(1) Result 
						FROM [Success].[dbo].[zzz_p0021_1_IDR_part_A_results] 
						WHERE LineNumber = 17
					)
				)
				+
				( 
					(
						SELECT TOP(1) Result 
						FROM [Success].[dbo].[zzz_p0021_1_IDR_part_A_results] 
						WHERE LineNumber = 46
					)
					+
					(
						SELECT TOP(1) Result 
						FROM [Success].[dbo].[zzz_p0021_1_IDR_part_A_results] 
						WHERE LineNumber = 49
					)
				)
			  )  
		)

--Line: [67] , Source: [A-021] , ______________________________ Description: [Total Unduplicated Individuals Served (JeffCare)]  ,  Bill_Provider_Specialty [FQHC - PSYCHIATRY. PSYCHIATRY]

SELECT @LineNumber = 67
SELECT @Source = '[A-021]'
SELECT @Title = '[Total Unduplicated Individuals Served (JeffCare)]'
;

WITH cte_Line_67
AS
(
	SELECT distinct
		  --t3.[LOC],
		  --t3.[Bill_Provider_Name],
		  t3.[Patient_No]
		  --t3.svc,
		  --t3.[Check-In_Day]

	  FROM [Success].[dbo].[zzz_p0021_4_for_Analysis_of_Part_A] t3
	  --Where (
			--	upper(rtrim(ltrim(t3.TYPE))) = 'BH'
			--	--AND
			--	--upper(rtrim(ltrim(t3.[LOC]))) = 'WJ'
			--	AND 
			--	t3.Adult = 1
			--)
)
--SELECT * 
--From cte_Line_14

INSERT INTO [Success].[dbo].[zzz_p0021_1_IDR_part_A_results] 
		(
		[LineNumber],
		[Source],
		[Line_Title],
		[Result]
		)
VALUES
		(
			@LineNumber 
			,@Source
			,@Title 
			, (SELECT Count(*) FROM cte_Line_67)
		)

--	Line: [68] , Source: [A-022] , ______________________________ Description: [Adults]  , _____________________________ Bill_Provider_Specialty [FQHC - PSYCHIATRY. PSYCHIATRY]



SELECT @LineNumber = 68
SELECT @Source = '[A-022]'
SELECT @Title = '[Adults]'
;

WITH cte_Line_68
AS
(
	SELECT distinct
		  --t3.[LOC],
		  --t3.[Bill_Provider_Name],
		  t3.[Patient_No]
		  --t3.svc,
		  --t3.[Check-In_Day]

	  FROM [Success].[dbo].[zzz_p0021_4_for_Analysis_of_Part_A] t3
	  Where (
				--upper(rtrim(ltrim(t3.TYPE))) = 'BH'
				----AND
				----upper(rtrim(ltrim(t3.[LOC]))) = 'WJ'
				--AND 
				t3.Adult = 1
			)
)
--SELECT * 
--From cte_Line_14

INSERT INTO [Success].[dbo].[zzz_p0021_1_IDR_part_A_results] 
		(
		[LineNumber],
		[Source],
		[Line_Title],
		[Result]
		)
VALUES
		(
			@LineNumber 
			,@Source
			,@Title 
			, (SELECT Count(*) FROM cte_Line_68)
		)

--	Line: [69] , Source: [(A-021 - A022)] , _____________________ Description: [Children]  , ___________________________ Bill_Provider_Specialty [FQHC - PSYCHIATRY. PSYCHIATRY]


SELECT @LineNumber = 69
SELECT @Source = '[(A-021 - A022)]'
SELECT @Title = '[Children]'
;
INSERT INTO [Success].[dbo].[zzz_p0021_1_IDR_part_A_results] 
		(
		[LineNumber],
		[Source],
		[Line_Title],
		[Result]
		)
VALUES
		(
			@LineNumber 
			,@Source
			,@Title 
			, ( 
					(
						SELECT TOP(1) Result 
						FROM [Success].[dbo].[zzz_p0021_1_IDR_part_A_results] 
						WHERE LineNumber = 67
					)
					-
					(
						SELECT TOP(1) Result 
						FROM [Success].[dbo].[zzz_p0021_1_IDR_part_A_results] 
						WHERE LineNumber = 68
					)
			  ) 
		)




		
--RESULTS TABLE==========================================================================
SELECT * from [Success].[dbo].[zzz_p0021_1_IDR_part_A_results] 

