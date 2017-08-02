--p_0021_SP_004_YTD_step_4_v1.sql
/*
	************************************************************************************
			
	Uses: this should output the Quarterly values,
		  and  calculate the calculated values for the Quarterly report

Line # ----- Source -----				  DESCRIPTION                                            Line Title
==============================================================================================================================================
Line: [22] , Source: [Y-001] , __________ Description: [PHC - Unduplicated]  , _________________ Row Title [East Jefferson Health Center]
Line: [23] , Source: [Y-002] , __________ Description: [PHC - Unduplicated]  , _________________ Row Title [Adults]
Line: [24] , Source: [( Y-001 - Q-002)] ,  Description: [PHC - Unduplicated]  , _________________ Row Title [Children]
Line: [25] , Source: [Y-003] , __________ Description: [PHC - Unduplicated]  , _________________ Row Title [West JeffersonHealth Center]
Line: [26] , Source: [Y-004] , __________ Description: [PHC - Unduplicated]  , _________________ Row Title [Adults]
Line: [27] , Source: [( Y-003 - Q-004)] ,  Description: [PHC - Unduplicated]  , _________________ Row Title [Children]
Line: [28] , Source: [Y-005] , __________ Description: [PHC - Unduplicated]  , _________________ Row Title [Total Unduplicated Individuals Served]
Line: [29] , Source: [Y-006] , __________ Description: [PHC - Unduplicated]  , _________________ Row Title [Adults]
Line: [30] , Source: [( Y-005 - Q-006)] ,  Description: [PHC - Unduplicated]  , _________________ Row Title [Children]
Line: [53] , Source: [Y-007] , __________ Description: [Unduplicated - BHC]  , _________________ Row Title [East Jefferson Health Center]
Line: [54] , Source: [Y-008] , __________ Description: [Unduplicated - BHC]  , _________________ Row Title [Adults]
Line: [55] , Source: [( Y-007 - Q-008)] ,  Description: [Unduplicated - BHC]  , _________________ Row Title [Children]
Line: [56] , Source: [Y-009] , __________ Description: [Unduplicated - BHC]  , _________________ Row Title [West Jefferson Health Center]
Line: [57] , Source: [Y-010] , __________ Description: [Unduplicated - BHC]  , _________________ Row Title [Adults]
Line: [58] , Source: [( Y-009 - Q-010)] ,  Description: [Unduplicated - BHC]  , _________________ Row Title [Children]
Line: [59] , Source: [Y-011] , __________ Description: [Unduplicated - BHC]  , _________________ Row Title [Total Unduplicated Individuals Served]
Line: [60] , Source: [Y-012] , __________ Description: [Unduplicated - BHC]  , _________________ Row Title [Adults]
Line: [61] , Source: [( Y-011 - Q-012)] ,  Description: [Unduplicated - BHC]  , _________________ Row Title [Children]
Line: [65] , Source: [Y-013] , __________ Description: [Total - Unduplicated]  , _______________ Row Title [Total Unduplicated Individuals Served]
Line: [66] , Source: [Y-014] , __________ Description: [Total - Unduplicated]  , _______________ Row Title [Adults]
Line: [67] , Source: [( Y-013 - Q-014)] ,  Description: [Total - Unduplicated]  , _______________ Row Title [Children]



	Created: 04/6/2017
	By: glenn garson
	************************************************************************************
*/
USE [Success];
GO
----------------------Common Variables
DECLARE @Date_Start_of_YTD date
DECLARE @Date_End_of_YTD date	
SELECT @Date_Start_of_YTD = '07-01-2016'
SELECT @Date_End_of_YTD = '06-30-2017'
----------------------- Local Variables
DECLARE @LineNumber int
DECLARE @Source nvarchar(100)
DECLARE @Title nvarchar(255)
----------------------------------------
IF OBJECT_ID('dbo.zzz_p0021_17_IDR_part_YTD_Results') IS NOT NULL
    DROP TABLE dbo.zzz_p0021_17_IDR_part_YTD_Results


CREATE TABLE [dbo].[zzz_p0021_17_IDR_part_YTD_Results]
(
		[IDR_Q_PK] [int] IDENTITY(1,1) NOT NULL,		
		[LineNumber] [int] NOT NULL,
		[Source] nvarchar(100) NOT NULL,
		[Line_Title] nvarchar(255) NOT NULL,
		[DateTime_Created] [datetime] NOT NULL CONSTRAINT IDR_q_TheDateTime_Default_GETDATE DEFAULT GETDATE(),
		[Result] [int] NOT NULL,
		[IDR_Q_RowVersion] [timestamp] NULL
	,CONSTRAINT [zzz_p0021_17_IDR_part_YTD_Results$IDR_Q_PK] PRIMARY KEY NONCLUSTERED 
		(
			[IDR_Q_PK] ASC
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


--Line: [22] , Source: [Y-001] , __________ Description: [PHC - Unduplicated]  , _________________ Row Title [East Jefferson Health Center]
SELECT @LineNumber = 22
SELECT @Source = '[Y-001]'
SELECT @Title = '[East Jefferson Health Center]'
;
WITH cte_Line_4
AS
(

--SELECT   Distinct [patient #]
--FROM         dbo.EHSS a 
--WHERE a.TYPE in ('PC') and a.[Check-In Day]between '20161001' and '20161031' and a.loc in ('EJ')


	SELECT distinct
		  [Patient_No]
	  FROM [Success].[dbo].[zzz_p0021_16_for_Analysis_of_Part_YTD]
	  Where (
				[Type] = 'PC'
				AND
				[loc] = 'EJ'
			)
)
INSERT INTO [Success].[dbo].[zzz_p0021_17_IDR_part_YTD_Results] 
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
			, (SELECT Count(*) FROM cte_Line_4)
		)

--Line: [23] , Source: [Y-002] , __________ Description: [PHC - Unduplicated]  , _________________ Row Title [Adults]

--SELECT   Distinct [patient #]
--FROM         dbo.EHSS a 
--WHERE a.TYPE in ('PC') and a.[Check-In Day]between '20161001' and '20161031' and a.loc in ('EJ')
--and a.[Patient Birth Date]<'19981031' --<== This is the date for people who are 18 yrs and older at the end of the 'month'


SELECT @LineNumber = 23
SELECT @Source = '[Y-002]'
SELECT @Title = '[Adults]'
;
WITH cte_Line_23
AS
(


	SELECT distinct
		  [Patient_No]
	  FROM [Success].[dbo].[zzz_p0021_16_for_Analysis_of_Part_YTD]
	  Where (
				[Type] = 'PC'
				AND
				[loc] = 'EJ'
				AND
				[Adult] = 1
			)
)
INSERT INTO [Success].[dbo].[zzz_p0021_17_IDR_part_YTD_Results] 
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
			, (SELECT Count(*) FROM cte_Line_23)
		)

--Line: [24] , Source: [( Y-001 - Q-002)] ,  Description: [PHC - Unduplicated]  , _________________ Row Title [Children]

SELECT @LineNumber = 24
SELECT @Source = '[( Y-001 - Q-002)]'
SELECT @Title = '[Children]'

INSERT INTO [Success].[dbo].[zzz_p0021_17_IDR_part_YTD_Results] 
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
						FROM [Success].[dbo].[zzz_p0021_17_IDR_part_YTD_Results] 
						WHERE LineNumber = 22
					)
					-
					(
						SELECT TOP(1) Result 
						FROM [Success].[dbo].[zzz_p0021_17_IDR_part_YTD_Results] 
						WHERE LineNumber = 23
					)
			  ) 
		)

--Line: [25] , Source: [Y-003] , __________ Description: [PHC - Unduplicated]  , _________________ Row Title [West JeffersonHealth Center]

----20](Q-003)un-duplicated Individuals - West Jefferson - Primary Health Care -  {for a given month i.e. from first to lastdate  of the month}
--SELECT   Distinct [patient #]
--FROM         dbo.EHSS a 
--WHERE a.TYPE in ('PC') and a.[Check-In Day]between '20161001' and '20161031' and a.loc in ('WJ')


SELECT @LineNumber = 25
SELECT @Source = '[Y-003]'
SELECT @Title = '[West JeffersonHealth Center]'
;
WITH cte_Line_25
AS
(


	SELECT distinct
		  [Patient_No]
	  FROM [Success].[dbo].[zzz_p0021_16_for_Analysis_of_Part_YTD]
	  Where (
				[Type] = 'PC'
				AND
				[loc] = 'WJ'
				--AND
				--[Adult] = 1
			)
)
INSERT INTO [Success].[dbo].[zzz_p0021_17_IDR_part_YTD_Results] 
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
			, (SELECT Count(*) FROM cte_Line_25)
		)

--Line: [26] , Source: [Y-004] , __________ Description: [PHC - Unduplicated]  , _________________ Row Title [Adults]

----21](Q-004)un-duplicated Individuals - West Jefferson - Primary Health Care - Adults =>  {for a given month i.e. from first to lastdate  of the month}
--SELECT   Distinct [patient #]
--FROM         dbo.EHSS a 
--WHERE a.TYPE in ('PC') and a.[Check-In Day]between '20161001' and '20161031' and a.loc in ('WJ')
--and a.[Patient Birth Date]<'19981031' --<== This is the date for people who are 18 yrs and older at the end of the 'month'


SELECT @LineNumber = 26
SELECT @Source = '[Y-004]'
SELECT @Title = '[Adults]'
;
WITH cte_Line_26
AS
(


	SELECT distinct
		  [Patient_No]
	  FROM [Success].[dbo].[zzz_p0021_16_for_Analysis_of_Part_YTD]
	  Where (
				[Type] = 'PC'
				AND
				[loc] = 'WJ'
				AND
				[Adult] = 1
			)
)
INSERT INTO [Success].[dbo].[zzz_p0021_17_IDR_part_YTD_Results] 
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
			, (SELECT Count(*) FROM cte_Line_26)
		)

--Line: [27] , Source: [( Y-003 - Q-004)] ,  Description: [PHC - Unduplicated]  , _________________ Row Title [Children]


SELECT @LineNumber = 27
SELECT @Source = '[( Y-003 - Q-004)]'
SELECT @Title = '[Children]'

INSERT INTO [Success].[dbo].[zzz_p0021_17_IDR_part_YTD_Results] 
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
						FROM [Success].[dbo].[zzz_p0021_17_IDR_part_YTD_Results] 
						WHERE LineNumber = 25
					)
					-
					(
						SELECT TOP(1) Result 
						FROM [Success].[dbo].[zzz_p0021_17_IDR_part_YTD_Results] 
						WHERE LineNumber = 26
					)
			  ) 
		)

--Line: [28] , Source: [Y-005] , __________ Description: [PHC - Unduplicated]  , _________________ Row Title [Total Unduplicated Individuals Served]

----22](Q-005)TOTAL un-duplicated Individuals - Primary Health Care -  {for a given month i.e. from first to lastdate  of the month}
--SELECT   Distinct [patient #]
--FROM         dbo.EHSS a 
--WHERE a.TYPE in ('PC') and a.[Check-In Day]between '20161001' and '20161031' 


SELECT @LineNumber = 28
SELECT @Source = '[Y-005]'
SELECT @Title = '[Total Unduplicated Individuals Served]'
;
WITH cte_Line_26
AS
(


	SELECT distinct
		  [Patient_No]
	  FROM [Success].[dbo].[zzz_p0021_16_for_Analysis_of_Part_YTD]
	  Where (
				[Type] = 'PC'
				--AND
				--[loc] = 'WJ'
				--AND
				--[Adult] = 1
			)
)
INSERT INTO [Success].[dbo].[zzz_p0021_17_IDR_part_YTD_Results] 
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
			, (SELECT Count(*) FROM cte_Line_26)
		)

--Line: [29] , Source: [Y-006] , __________ Description: [PHC - Unduplicated]  , _________________ Row Title [Adults]

----23](Q-006)TOTAL un-duplicated Individuals - Primary Health Care - Adults {for a given month i.e. from first to lastdate  of the month}
--SELECT   Distinct [patient #]
--FROM         dbo.EHSS a 
--WHERE a.TYPE in ('PC') and a.[Check-In Day]between '20161001' and '20161031'
--and a.[Patient Birth Date]<'19981031' --<== This is the date for people who are 18 yrs and older at the end of the 'month'



SELECT @LineNumber = 29
SELECT @Source = '[Y-006]'
SELECT @Title = '[Adults]'
;
WITH cte_Line_29
AS
(


	SELECT distinct
		  [Patient_No]
	  FROM [Success].[dbo].[zzz_p0021_16_for_Analysis_of_Part_YTD]
	  Where (
				[Type] = 'PC'
				--AND
				--[loc] = 'WJ'
				AND
				[Adult] = 1
			)
)
INSERT INTO [Success].[dbo].[zzz_p0021_17_IDR_part_YTD_Results] 
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
			, (SELECT Count(*) FROM cte_Line_29)
		)

--Line: [30] , Source: [( Y-005 - Q-006)] ,  Description: [PHC - Unduplicated]  , _________________ Row Title [Children]



SELECT @LineNumber = 30
SELECT @Source = '[( Y-005 - Q-006)]'
SELECT @Title = '[Children]'

INSERT INTO [Success].[dbo].[zzz_p0021_17_IDR_part_YTD_Results] 
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
						FROM [Success].[dbo].[zzz_p0021_17_IDR_part_YTD_Results] 
						WHERE LineNumber = 28
					)
					-
					(
						SELECT TOP(1) Result 
						FROM [Success].[dbo].[zzz_p0021_17_IDR_part_YTD_Results] 
						WHERE LineNumber = 29
					)
			  ) 
		)

--Line: [53] , Source: [Y-007] , __________ Description: [Unduplicated - BHC]  , _________________ Row Title [East Jefferson Health Center]

-----BH
----28](Q-007) un-duplicated Individuals East Jefferson - Behavioral Health Care - {for a given month i.e. from first to lastdate  of the month}
--SELECT  Distinct [patient #]
--FROM         dbo.EHSS a 
--WHERE a.TYPE in ('BH') and a.[Check-In Day]between '20161001' and '20161031' and a.loc in ('EJ')

SELECT @LineNumber = 53
SELECT @Source = '[Y-007]'
SELECT @Title = '[East Jefferson Health Center]'
;
WITH cte_Line_53
AS
(


	SELECT distinct
		  [Patient_No]
	  FROM [Success].[dbo].[zzz_p0021_16_for_Analysis_of_Part_YTD]
	  Where (
				[Type] = 'BH'
				AND
				[loc] = 'EJ'
				--AND
				--[Adult] = 1
			)
)
INSERT INTO [Success].[dbo].[zzz_p0021_17_IDR_part_YTD_Results] 
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
			, (SELECT Count(*) FROM cte_Line_53)
		)

--Line: [54] , Source: [Y-008] , __________ Description: [Unduplicated - BHC]  , _________________ Row Title [Adults]


----29](Q-008)un-duplicated Individuals - East Jefferson - Behavioral Health Care -  Adults =>  {for a given month i.e. from first to lastdate  of the month}
--SELECT  Distinct [patient #]
--FROM         dbo.EHSS a 
--WHERE a.TYPE in ('BH') and a.[Check-In Day]between '20161001' and '20161031' and a.loc in ('EJ')
--and a.[Patient Birth Date]<'19981031' --<== This is the date for people who are 18 yrs and older at the end of the 'month'


SELECT @LineNumber = 54
SELECT @Source = '[Y-008]'
SELECT @Title = '[Adults]'
;
WITH cte_Line_54
AS
(


	SELECT distinct
		  [Patient_No]
	  FROM [Success].[dbo].[zzz_p0021_16_for_Analysis_of_Part_YTD]
	  Where (
				[Type] = 'BH'
				AND
				[loc] = 'EJ'
				AND
				[Adult] = 1
			)
)
INSERT INTO [Success].[dbo].[zzz_p0021_17_IDR_part_YTD_Results] 
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
			, (SELECT Count(*) FROM cte_Line_54)
		)

--Line: [55] , Source: [( Y-007 - Q-008)] ,  Description: [Unduplicated - BHC]  , _________________ Row Title [Children]


SELECT @LineNumber = 55
SELECT @Source = '[( Y-007 - Q-008)]'
SELECT @Title = '[Children]'

INSERT INTO [Success].[dbo].[zzz_p0021_17_IDR_part_YTD_Results] 
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
						FROM [Success].[dbo].[zzz_p0021_17_IDR_part_YTD_Results] 
						WHERE LineNumber = 53
					)
					-
					(
						SELECT TOP(1) Result 
						FROM [Success].[dbo].[zzz_p0021_17_IDR_part_YTD_Results] 
						WHERE LineNumber = 54
					)
			  ) 
		)

--Line: [56] , Source: [Y-009] , __________ Description: [Unduplicated - BHC]  , _________________ Row Title [West Jefferson Health Center]

----30](Q-009) un-duplicated Individuals West Jefferson - Behavioral Health Care - {for a given month i.e. from first to lastdate  of the month}
--SELECT   Distinct [patient #]
--FROM         dbo.EHSS a 
--WHERE a.TYPE in ('BH') and a.[Check-In Day]between '20161001' and '20161031' and a.loc in ('WJ')


SELECT @LineNumber = 56
SELECT @Source = '[Y-009]'
SELECT @Title = '[West Jefferson Health Center]'
;
WITH cte_Line_54
AS
(


	SELECT distinct
		  [Patient_No]
	  FROM [Success].[dbo].[zzz_p0021_16_for_Analysis_of_Part_YTD]
	  Where (
				[Type] = 'BH'
				AND
				[loc] = 'WJ'
				--AND
				--[Adult] = 1
			)
)
INSERT INTO [Success].[dbo].[zzz_p0021_17_IDR_part_YTD_Results] 
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
			, (SELECT Count(*) FROM cte_Line_54)
		)

--Line: [57] , Source: [Y-010] , __________ Description: [Unduplicated - BHC]  , _________________ Row Title [Adults]


----31](Q-010)un-duplicated Individuals - East Jefferson - Behavioral Health Care -  Adults =>  {for a given month i.e. from first to lastdate  of the month}
--SELECT  Distinct [patient #]
--FROM         dbo.EHSS a 
--WHERE a.TYPE in ('BH') and a.[Check-In Day]between '20161001' and '20161031' and a.loc in ('WJ')
--and a.[Patient Birth Date]<'19981031' --<== This is the date for people who are 18 yrs and older at the end of the 'month'


SELECT @LineNumber = 57
SELECT @Source = '[Y-010]'
SELECT @Title = '[Adults]'
;
WITH cte_Line_57
AS
(


	SELECT distinct
		  [Patient_No]
	  FROM [Success].[dbo].[zzz_p0021_16_for_Analysis_of_Part_YTD]
	  Where (
				[Type] = 'BH'
				AND
				[loc] = 'WJ'
				AND
				[Adult] = 1
			)
)
INSERT INTO [Success].[dbo].[zzz_p0021_17_IDR_part_YTD_Results] 
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
			, (SELECT Count(*) FROM cte_Line_57)
		)

--Line: [58] , Source: [( Y-009 - Q-010)] ,  Description: [Unduplicated - BHC]  , _________________ Row Title [Children]

SELECT @LineNumber = 58
SELECT @Source = '[( Y-009 - Q-010)]'
SELECT @Title = '[Children]'

INSERT INTO [Success].[dbo].[zzz_p0021_17_IDR_part_YTD_Results] 
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
						FROM [Success].[dbo].[zzz_p0021_17_IDR_part_YTD_Results] 
						WHERE LineNumber = 56
					)
					-
					(
						SELECT TOP(1) Result 
						FROM [Success].[dbo].[zzz_p0021_17_IDR_part_YTD_Results] 
						WHERE LineNumber = 57
					)
			  ) 
		)

--Line: [59] , Source: [Y-011] , __________ Description: [Unduplicated - BHC]  , _________________ Row Title [Total Unduplicated Individuals Served]

----32](Q-011) un-duplicated Individuals - Total - Behavioral Health Care - {for a given month i.e. from first to lastdate  of the month}
--SELECT   Distinct [patient #]
--FROM         dbo.EHSS a 
--WHERE a.TYPE in ('BH') and a.[Check-In Day]between '20161001' and '20161031'

SELECT @LineNumber = 59
SELECT @Source = '[Y-011]'
SELECT @Title = '[Total Unduplicated Individuals Served]'
;
WITH cte_Line_59
AS
(


	SELECT distinct
		  [Patient_No]
	  FROM [Success].[dbo].[zzz_p0021_16_for_Analysis_of_Part_YTD]
	  Where (
				[Type] = 'BH'
				--AND
				--[loc] = 'WJ'
				--AND
				--[Adult] = 1
			)
)
INSERT INTO [Success].[dbo].[zzz_p0021_17_IDR_part_YTD_Results] 
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

--Line: [60] , Source: [Y-012] , __________ Description: [Unduplicated - BHC]  , _________________ Row Title [Adults]


----33](Q-012)un-duplicated Individuals - Total - Behavioral Health Care -  Adults =>  {for a given month i.e. from first to lastdate  of the month}
--SELECT   Distinct [patient #]
--FROM         dbo.EHSS a 
--WHERE a.TYPE in ('BH') and a.[Check-In Day]between '20161001' and '20161031'
--and a.[Patient Birth Date]<'19981031' --<== This is the date for people who are 18 yrs and older at the end of the 'month'

SELECT @LineNumber = 60
SELECT @Source = '[Y-012]'
SELECT @Title = '[Adults]'
;
WITH cte_Line_60
AS
(


	SELECT distinct
		  [Patient_No]
	  FROM [Success].[dbo].[zzz_p0021_16_for_Analysis_of_Part_YTD]
	  Where (
				[Type] = 'BH'
				--AND
				--[loc] = 'WJ'
				AND
				[Adult] = 1
			)
)
INSERT INTO [Success].[dbo].[zzz_p0021_17_IDR_part_YTD_Results] 
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


--Line: [61] , Source: [( Y-011 - Q-012)] ,  Description: [Unduplicated - BHC]  , _________________ Row Title [Children]


SELECT @LineNumber = 61
SELECT @Source = '[( Y-011 - Q-012)]'
SELECT @Title = '[Children]'

INSERT INTO [Success].[dbo].[zzz_p0021_17_IDR_part_YTD_Results] 
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
						FROM [Success].[dbo].[zzz_p0021_17_IDR_part_YTD_Results] 
						WHERE LineNumber = 59
					)
					-
					(
						SELECT TOP(1) Result 
						FROM [Success].[dbo].[zzz_p0021_17_IDR_part_YTD_Results] 
						WHERE LineNumber = 60
					)
			  ) 
		)


--Line: [65] , Source: [Y-013] , __________ Description: [Total - Unduplicated]  , _______________ Row Title [Total Unduplicated Individuals Served]

----34](A-021)un-duplicated Individuals - Total -  JeffCare(JPHSA PC and BH)

--SELECT   Distinct [patient #]
--FROM         dbo.EHSS a 
--WHERE a.[Check-In Day]between '20161001' and '20161031'


SELECT @LineNumber = 65
SELECT @Source = '[Y-013]'
SELECT @Title = '[Total Unduplicated Individuals Served]'
;
WITH cte_Line_60
AS
(


	SELECT distinct
		  [Patient_No]
	  FROM [Success].[dbo].[zzz_p0021_16_for_Analysis_of_Part_YTD]
	  --Where (
			--	[Type] = 'BH'
			--	--AND
			--	--[loc] = 'WJ'
			--	AND
			--	[Adult] = 1
			--)
)
INSERT INTO [Success].[dbo].[zzz_p0021_17_IDR_part_YTD_Results] 
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

--Line: [66] , Source: [Y-014] , __________ Description: [Total - Unduplicated]  , _______________ Row Title [Adults]

----35](A-022)un-duplicated Individuals - Total - Adults -  JeffCare(JPHSA PC and BH)
--SELECT   Distinct [patient #]
--FROM         dbo.EHSS a 
--WHERE a.[Check-In Day]between '20161001' and '20161031'
--and a.[Patient Birth Date]<'19981031' --<== This is the date for people who are 18 yrs and older at the end of the 'month'



SELECT @LineNumber = 66
SELECT @Source = '[Y-014]'
SELECT @Title = '[Adults]'
;
WITH cte_Line_66
AS
(


	SELECT distinct
		  [Patient_No]
	  FROM [Success].[dbo].[zzz_p0021_16_for_Analysis_of_Part_YTD]
	  Where (
				--[Type] = 'BH'
				--AND
				--[loc] = 'WJ'
				--AND
				[Adult] = 1
			)
)
INSERT INTO [Success].[dbo].[zzz_p0021_17_IDR_part_YTD_Results] 
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
			, (SELECT Count(*) FROM cte_Line_66)
		)

--Line: [67] , Source: [( Y-013 - Q-014)] ,  Description: [Total - Unduplicated]  , _______________ Row Title [Children]


SELECT @LineNumber = 67
SELECT @Source = ' [( Y-013 - Q-014)]'
SELECT @Title = '[Children]'

INSERT INTO [Success].[dbo].[zzz_p0021_17_IDR_part_YTD_Results] 
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
						FROM [Success].[dbo].[zzz_p0021_17_IDR_part_YTD_Results] 
						WHERE LineNumber = 65
					)
					-
					(
						SELECT TOP(1) Result 
						FROM [Success].[dbo].[zzz_p0021_17_IDR_part_YTD_Results] 
						WHERE LineNumber = 66
					)
			  ) 
		)





---RESULTS TABLE
SELECT * from [Success].[dbo].[zzz_p0021_17_IDR_part_YTD_Results] 