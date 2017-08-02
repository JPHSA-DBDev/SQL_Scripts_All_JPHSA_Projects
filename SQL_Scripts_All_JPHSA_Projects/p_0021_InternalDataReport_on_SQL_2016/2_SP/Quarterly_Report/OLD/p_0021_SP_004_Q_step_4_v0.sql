--p_0021_SP_004_Q_step_4_v0.sql
/*
	************************************************************************************
			
	Uses: this should output the Quarterly values,
		  and  calculate the calculated values for the Quarterly report

Line # ----- Source -----				  DESCRIPTION                                            Line Title
==============================================================================================================================================
Line: [22] , Source: [Q-001] , __________ Description: [PHC - Unduplicated]  , _________________ Row Title [East Jefferson Health Center]
Line: [23] , Source: [Q-002] , __________ Description: [PHC - Unduplicated]  , _________________ Row Title [Adults]
Line: [24] , Source: [( Q-001 - Q-002)] ,  Description: [PHC - Unduplicated]  , _________________ Row Title [Children]
Line: [25] , Source: [Q-003] , __________ Description: [PHC - Unduplicated]  , _________________ Row Title [West JeffersonHealth Center]
Line: [26] , Source: [Q-004] , __________ Description: [PHC - Unduplicated]  , _________________ Row Title [Adults]
Line: [27] , Source: [( Q-003 - Q-004)] ,  Description: [PHC - Unduplicated]  , _________________ Row Title [Children]
Line: [28] , Source: [Q-005] , __________ Description: [PHC - Unduplicated]  , _________________ Row Title [Total Unduplicated Individuals Served]
Line: [29] , Source: [Q-006] , __________ Description: [PHC - Unduplicated]  , _________________ Row Title [Adults]
Line: [30] , Source: [( Q-005 - Q-006)] ,  Description: [PHC - Unduplicated]  , _________________ Row Title [Children]
Line: [53] , Source: [Q-007] , __________ Description: [Unduplicated - BHC]  , _________________ Row Title [East Jefferson Health Center]
Line: [54] , Source: [Q-008] , __________ Description: [Unduplicated - BHC]  , _________________ Row Title [Adults]
Line: [55] , Source: [( Q-007 - Q-008)] ,  Description: [Unduplicated - BHC]  , _________________ Row Title [Children]
Line: [56] , Source: [Q-009] , __________ Description: [Unduplicated - BHC]  , _________________ Row Title [West Jefferson Health Center]
Line: [57] , Source: [Q-010] , __________ Description: [Unduplicated - BHC]  , _________________ Row Title [Adults]
Line: [58] , Source: [( Q-009 - Q-010)] ,  Description: [Unduplicated - BHC]  , _________________ Row Title [Children]
Line: [59] , Source: [Q-011] , __________ Description: [Unduplicated - BHC]  , _________________ Row Title [Total Unduplicated Individuals Served]
Line: [60] , Source: [Q-012] , __________ Description: [Unduplicated - BHC]  , _________________ Row Title [Adults]
Line: [61] , Source: [( Q-011 - Q-012)] ,  Description: [Unduplicated - BHC]  , _________________ Row Title [Children]
Line: [65] , Source: [Q-013] , __________ Description: [Total - Unduplicated]  , _______________ Row Title [Total Unduplicated Individuals Served]
Line: [66] , Source: [Q-014] , __________ Description: [Total - Unduplicated]  , _______________ Row Title [Adults]
Line: [67] , Source: [( Q-013 - Q-014)] ,  Description: [Total - Unduplicated]  , _______________ Row Title [Children]



	Created: 04/6/2017
	By: glenn garson
	************************************************************************************
*/
USE [Success];
GO
----------------------Common Variables
DECLARE @Date_Start_of_Quarter date
DECLARE @Date_End_of_Quarter date	
SELECT @Date_Start_of_Quarter = '07-01-2016'
SELECT @Date_End_of_Quarter = '03-31-2017'
----------------------- Local Variables
DECLARE @LineNumber int
DECLARE @Source nvarchar(100)
DECLARE @Title nvarchar(255)
----------------------------------------
IF OBJECT_ID('dbo.zzz_p0021_5_IDR_part_Q_Results') IS NOT NULL
    DROP TABLE dbo.zzz_p0021_5_IDR_part_Q_Results


CREATE TABLE [dbo].[zzz_p0021_5_IDR_part_Q_Results]
(
		[IDR_Q_PK] [int] IDENTITY(1,1) NOT NULL,		
		[LineNumber] [int] NOT NULL,
		[Source] nvarchar(100) NOT NULL,
		[Line_Title] nvarchar(255) NOT NULL,
		[DateTime_Created] [datetime] NOT NULL CONSTRAINT IDR_q_TheDateTime_Default_GETDATE DEFAULT GETDATE(),
		[Result] [int] NOT NULL,
		[IDR_Q_RowVersion] [timestamp] NULL
	,CONSTRAINT [zzz_p0021_5_IDR_part_Q_Results$IDR_Q_PK] PRIMARY KEY NONCLUSTERED 
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


--Line: [22] , Source: [Q-001] , __________ Description: [PHC - Unduplicated]  , _________________ Row Title [East Jefferson Health Center]
SELECT @LineNumber = 22
SELECT @Source = '[Q-001]'
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
	  FROM [Success].[dbo].[zzz_p0021_6_for_Analysis_of_Part_Q]
	  Where (
				[Type] = 'PC'
				AND
				[loc] = 'EJ'
			)
)
INSERT INTO [Success].[dbo].[zzz_p0021_5_IDR_part_Q_Results] 
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

--Line: [23] , Source: [Q-002] , __________ Description: [PHC - Unduplicated]  , _________________ Row Title [Adults]

--SELECT   Distinct [patient #]
--FROM         dbo.EHSS a 
--WHERE a.TYPE in ('PC') and a.[Check-In Day]between '20161001' and '20161031' and a.loc in ('EJ')
--and a.[Patient Birth Date]<'19981031' --<== This is the date for people who are 18 yrs and older at the end of the 'month'


SELECT @LineNumber = 23
SELECT @Source = '[Q-002]'
SELECT @Title = '[Adults]'
;
WITH cte_Line_23
AS
(


	SELECT distinct
		  [Patient_No]
	  FROM [Success].[dbo].[zzz_p0021_6_for_Analysis_of_Part_Q]
	  Where (
				[Type] = 'PC'
				AND
				[loc] = 'EJ'
				AND
				[Adult] = 1
			)
)
INSERT INTO [Success].[dbo].[zzz_p0021_5_IDR_part_Q_Results] 
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

--Line: [24] , Source: [( Q-001 - Q-002)] ,  Description: [PHC - Unduplicated]  , _________________ Row Title [Children]

SELECT @LineNumber = 24
SELECT @Source = '[( Q-001 - Q-002)]'
SELECT @Title = '[Children]'

INSERT INTO [Success].[dbo].[zzz_p0021_5_IDR_part_Q_Results] 
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
						FROM [Success].[dbo].[zzz_p0021_5_IDR_part_Q_Results] 
						WHERE LineNumber = 22
					)
					-
					(
						SELECT TOP(1) Result 
						FROM [Success].[dbo].[zzz_p0021_5_IDR_part_Q_Results] 
						WHERE LineNumber = 23
					)
			  ) 
		)

--Line: [25] , Source: [Q-003] , __________ Description: [PHC - Unduplicated]  , _________________ Row Title [West JeffersonHealth Center]

----20](Q-003)un-duplicated Individuals - West Jefferson - Primary Health Care -  {for a given month i.e. from first to lastdate  of the month}
--SELECT   Distinct [patient #]
--FROM         dbo.EHSS a 
--WHERE a.TYPE in ('PC') and a.[Check-In Day]between '20161001' and '20161031' and a.loc in ('WJ')


SELECT @LineNumber = 25
SELECT @Source = '[Q-003]'
SELECT @Title = '[West JeffersonHealth Center]'
;
WITH cte_Line_25
AS
(


	SELECT distinct
		  [Patient_No]
	  FROM [Success].[dbo].[zzz_p0021_6_for_Analysis_of_Part_Q]
	  Where (
				[Type] = 'PC'
				AND
				[loc] = 'WJ'
				--AND
				--[Adult] = 1
			)
)
INSERT INTO [Success].[dbo].[zzz_p0021_5_IDR_part_Q_Results] 
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

--Line: [26] , Source: [Q-004] , __________ Description: [PHC - Unduplicated]  , _________________ Row Title [Adults]

----21](Q-004)un-duplicated Individuals - West Jefferson - Primary Health Care - Adults =>  {for a given month i.e. from first to lastdate  of the month}
--SELECT   Distinct [patient #]
--FROM         dbo.EHSS a 
--WHERE a.TYPE in ('PC') and a.[Check-In Day]between '20161001' and '20161031' and a.loc in ('WJ')
--and a.[Patient Birth Date]<'19981031' --<== This is the date for people who are 18 yrs and older at the end of the 'month'


SELECT @LineNumber = 26
SELECT @Source = '[Q-004]'
SELECT @Title = '[Adults]'
;
WITH cte_Line_26
AS
(


	SELECT distinct
		  [Patient_No]
	  FROM [Success].[dbo].[zzz_p0021_6_for_Analysis_of_Part_Q]
	  Where (
				[Type] = 'PC'
				AND
				[loc] = 'WJ'
				AND
				[Adult] = 1
			)
)
INSERT INTO [Success].[dbo].[zzz_p0021_5_IDR_part_Q_Results] 
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

--Line: [27] , Source: [( Q-003 - Q-004)] ,  Description: [PHC - Unduplicated]  , _________________ Row Title [Children]


SELECT @LineNumber = 27
SELECT @Source = '[( Q-003 - Q-004)]'
SELECT @Title = '[Children]'

INSERT INTO [Success].[dbo].[zzz_p0021_5_IDR_part_Q_Results] 
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
						FROM [Success].[dbo].[zzz_p0021_5_IDR_part_Q_Results] 
						WHERE LineNumber = 25
					)
					-
					(
						SELECT TOP(1) Result 
						FROM [Success].[dbo].[zzz_p0021_5_IDR_part_Q_Results] 
						WHERE LineNumber = 26
					)
			  ) 
		)

--Line: [28] , Source: [Q-005] , __________ Description: [PHC - Unduplicated]  , _________________ Row Title [Total Unduplicated Individuals Served]

----22](Q-005)TOTAL un-duplicated Individuals - Primary Health Care -  {for a given month i.e. from first to lastdate  of the month}
--SELECT   Distinct [patient #]
--FROM         dbo.EHSS a 
--WHERE a.TYPE in ('PC') and a.[Check-In Day]between '20161001' and '20161031' 


SELECT @LineNumber = 28
SELECT @Source = '[Q-005]'
SELECT @Title = '[Total Unduplicated Individuals Served]'
;
WITH cte_Line_26
AS
(


	SELECT distinct
		  [Patient_No]
	  FROM [Success].[dbo].[zzz_p0021_6_for_Analysis_of_Part_Q]
	  Where (
				[Type] = 'PC'
				--AND
				--[loc] = 'WJ'
				--AND
				--[Adult] = 1
			)
)
INSERT INTO [Success].[dbo].[zzz_p0021_5_IDR_part_Q_Results] 
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

--Line: [29] , Source: [Q-006] , __________ Description: [PHC - Unduplicated]  , _________________ Row Title [Adults]

----23](Q-006)TOTAL un-duplicated Individuals - Primary Health Care - Adults {for a given month i.e. from first to lastdate  of the month}
--SELECT   Distinct [patient #]
--FROM         dbo.EHSS a 
--WHERE a.TYPE in ('PC') and a.[Check-In Day]between '20161001' and '20161031'
--and a.[Patient Birth Date]<'19981031' --<== This is the date for people who are 18 yrs and older at the end of the 'month'



SELECT @LineNumber = 29
SELECT @Source = '[Q-006]'
SELECT @Title = '[Adults]'
;
WITH cte_Line_29
AS
(


	SELECT distinct
		  [Patient_No]
	  FROM [Success].[dbo].[zzz_p0021_6_for_Analysis_of_Part_Q]
	  Where (
				[Type] = 'PC'
				--AND
				--[loc] = 'WJ'
				AND
				[Adult] = 1
			)
)
INSERT INTO [Success].[dbo].[zzz_p0021_5_IDR_part_Q_Results] 
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

--Line: [30] , Source: [( Q-005 - Q-006)] ,  Description: [PHC - Unduplicated]  , _________________ Row Title [Children]



SELECT @LineNumber = 30
SELECT @Source = '[( Q-005 - Q-006)]'
SELECT @Title = '[Children]'

INSERT INTO [Success].[dbo].[zzz_p0021_5_IDR_part_Q_Results] 
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
						FROM [Success].[dbo].[zzz_p0021_5_IDR_part_Q_Results] 
						WHERE LineNumber = 28
					)
					-
					(
						SELECT TOP(1) Result 
						FROM [Success].[dbo].[zzz_p0021_5_IDR_part_Q_Results] 
						WHERE LineNumber = 29
					)
			  ) 
		)

--Line: [53] , Source: [Q-007] , __________ Description: [Unduplicated - BHC]  , _________________ Row Title [East Jefferson Health Center]

-----BH
----28](Q-007) un-duplicated Individuals East Jefferson - Behavioral Health Care - {for a given month i.e. from first to lastdate  of the month}
--SELECT  Distinct [patient #]
--FROM         dbo.EHSS a 
--WHERE a.TYPE in ('BH') and a.[Check-In Day]between '20161001' and '20161031' and a.loc in ('EJ')

SELECT @LineNumber = 53
SELECT @Source = '[Q-007]'
SELECT @Title = '[East Jefferson Health Center]'
;
WITH cte_Line_53
AS
(


	SELECT distinct
		  [Patient_No]
	  FROM [Success].[dbo].[zzz_p0021_6_for_Analysis_of_Part_Q]
	  Where (
				[Type] = 'BH'
				AND
				[loc] = 'EJ'
				--AND
				--[Adult] = 1
			)
)
INSERT INTO [Success].[dbo].[zzz_p0021_5_IDR_part_Q_Results] 
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

--Line: [54] , Source: [Q-008] , __________ Description: [Unduplicated - BHC]  , _________________ Row Title [Adults]


----29](Q-008)un-duplicated Individuals - East Jefferson - Behavioral Health Care -  Adults =>  {for a given month i.e. from first to lastdate  of the month}
--SELECT  Distinct [patient #]
--FROM         dbo.EHSS a 
--WHERE a.TYPE in ('BH') and a.[Check-In Day]between '20161001' and '20161031' and a.loc in ('EJ')
--and a.[Patient Birth Date]<'19981031' --<== This is the date for people who are 18 yrs and older at the end of the 'month'


SELECT @LineNumber = 54
SELECT @Source = '[Q-008]'
SELECT @Title = '[Adults]'
;
WITH cte_Line_54
AS
(


	SELECT distinct
		  [Patient_No]
	  FROM [Success].[dbo].[zzz_p0021_6_for_Analysis_of_Part_Q]
	  Where (
				[Type] = 'BH'
				AND
				[loc] = 'EJ'
				AND
				[Adult] = 1
			)
)
INSERT INTO [Success].[dbo].[zzz_p0021_5_IDR_part_Q_Results] 
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

--Line: [55] , Source: [( Q-007 - Q-008)] ,  Description: [Unduplicated - BHC]  , _________________ Row Title [Children]


SELECT @LineNumber = 55
SELECT @Source = '[( Q-007 - Q-008)]'
SELECT @Title = '[Children]'

INSERT INTO [Success].[dbo].[zzz_p0021_5_IDR_part_Q_Results] 
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
						FROM [Success].[dbo].[zzz_p0021_5_IDR_part_Q_Results] 
						WHERE LineNumber = 53
					)
					-
					(
						SELECT TOP(1) Result 
						FROM [Success].[dbo].[zzz_p0021_5_IDR_part_Q_Results] 
						WHERE LineNumber = 54
					)
			  ) 
		)

--Line: [56] , Source: [Q-009] , __________ Description: [Unduplicated - BHC]  , _________________ Row Title [West Jefferson Health Center]

----30](Q-009) un-duplicated Individuals West Jefferson - Behavioral Health Care - {for a given month i.e. from first to lastdate  of the month}
--SELECT   Distinct [patient #]
--FROM         dbo.EHSS a 
--WHERE a.TYPE in ('BH') and a.[Check-In Day]between '20161001' and '20161031' and a.loc in ('WJ')


SELECT @LineNumber = 56
SELECT @Source = '[Q-009]'
SELECT @Title = '[West Jefferson Health Center]'
;
WITH cte_Line_54
AS
(


	SELECT distinct
		  [Patient_No]
	  FROM [Success].[dbo].[zzz_p0021_6_for_Analysis_of_Part_Q]
	  Where (
				[Type] = 'BH'
				AND
				[loc] = 'WJ'
				--AND
				--[Adult] = 1
			)
)
INSERT INTO [Success].[dbo].[zzz_p0021_5_IDR_part_Q_Results] 
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

--Line: [57] , Source: [Q-010] , __________ Description: [Unduplicated - BHC]  , _________________ Row Title [Adults]


----31](Q-010)un-duplicated Individuals - East Jefferson - Behavioral Health Care -  Adults =>  {for a given month i.e. from first to lastdate  of the month}
--SELECT  Distinct [patient #]
--FROM         dbo.EHSS a 
--WHERE a.TYPE in ('BH') and a.[Check-In Day]between '20161001' and '20161031' and a.loc in ('WJ')
--and a.[Patient Birth Date]<'19981031' --<== This is the date for people who are 18 yrs and older at the end of the 'month'


SELECT @LineNumber = 57
SELECT @Source = '[Q-010]'
SELECT @Title = '[Adults]'
;
WITH cte_Line_57
AS
(


	SELECT distinct
		  [Patient_No]
	  FROM [Success].[dbo].[zzz_p0021_6_for_Analysis_of_Part_Q]
	  Where (
				[Type] = 'BH'
				AND
				[loc] = 'WJ'
				AND
				[Adult] = 1
			)
)
INSERT INTO [Success].[dbo].[zzz_p0021_5_IDR_part_Q_Results] 
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

--Line: [58] , Source: [( Q-009 - Q-010)] ,  Description: [Unduplicated - BHC]  , _________________ Row Title [Children]

SELECT @LineNumber = 58
SELECT @Source = '[( Q-009 - Q-010)]'
SELECT @Title = '[Children]'

INSERT INTO [Success].[dbo].[zzz_p0021_5_IDR_part_Q_Results] 
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
						FROM [Success].[dbo].[zzz_p0021_5_IDR_part_Q_Results] 
						WHERE LineNumber = 56
					)
					-
					(
						SELECT TOP(1) Result 
						FROM [Success].[dbo].[zzz_p0021_5_IDR_part_Q_Results] 
						WHERE LineNumber = 57
					)
			  ) 
		)

--Line: [59] , Source: [Q-011] , __________ Description: [Unduplicated - BHC]  , _________________ Row Title [Total Unduplicated Individuals Served]

----32](Q-011) un-duplicated Individuals - Total - Behavioral Health Care - {for a given month i.e. from first to lastdate  of the month}
--SELECT   Distinct [patient #]
--FROM         dbo.EHSS a 
--WHERE a.TYPE in ('BH') and a.[Check-In Day]between '20161001' and '20161031'

SELECT @LineNumber = 59
SELECT @Source = '[Q-011]'
SELECT @Title = '[Total Unduplicated Individuals Served]'
;
WITH cte_Line_59
AS
(


	SELECT distinct
		  [Patient_No]
	  FROM [Success].[dbo].[zzz_p0021_6_for_Analysis_of_Part_Q]
	  Where (
				[Type] = 'BH'
				--AND
				--[loc] = 'WJ'
				--AND
				--[Adult] = 1
			)
)
INSERT INTO [Success].[dbo].[zzz_p0021_5_IDR_part_Q_Results] 
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

--Line: [60] , Source: [Q-012] , __________ Description: [Unduplicated - BHC]  , _________________ Row Title [Adults]


----33](Q-012)un-duplicated Individuals - Total - Behavioral Health Care -  Adults =>  {for a given month i.e. from first to lastdate  of the month}
--SELECT   Distinct [patient #]
--FROM         dbo.EHSS a 
--WHERE a.TYPE in ('BH') and a.[Check-In Day]between '20161001' and '20161031'
--and a.[Patient Birth Date]<'19981031' --<== This is the date for people who are 18 yrs and older at the end of the 'month'

SELECT @LineNumber = 60
SELECT @Source = '[Q-012]'
SELECT @Title = '[Adults]'
;
WITH cte_Line_60
AS
(


	SELECT distinct
		  [Patient_No]
	  FROM [Success].[dbo].[zzz_p0021_6_for_Analysis_of_Part_Q]
	  Where (
				[Type] = 'BH'
				--AND
				--[loc] = 'WJ'
				AND
				[Adult] = 1
			)
)
INSERT INTO [Success].[dbo].[zzz_p0021_5_IDR_part_Q_Results] 
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


--Line: [61] , Source: [( Q-011 - Q-012)] ,  Description: [Unduplicated - BHC]  , _________________ Row Title [Children]


SELECT @LineNumber = 61
SELECT @Source = '[( Q-011 - Q-012)]'
SELECT @Title = '[Children]'

INSERT INTO [Success].[dbo].[zzz_p0021_5_IDR_part_Q_Results] 
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
						FROM [Success].[dbo].[zzz_p0021_5_IDR_part_Q_Results] 
						WHERE LineNumber = 59
					)
					-
					(
						SELECT TOP(1) Result 
						FROM [Success].[dbo].[zzz_p0021_5_IDR_part_Q_Results] 
						WHERE LineNumber = 60
					)
			  ) 
		)


--Line: [65] , Source: [Q-013] , __________ Description: [Total - Unduplicated]  , _______________ Row Title [Total Unduplicated Individuals Served]

----34](A-021)un-duplicated Individuals - Total -  JeffCare(JPHSA PC and BH)

--SELECT   Distinct [patient #]
--FROM         dbo.EHSS a 
--WHERE a.[Check-In Day]between '20161001' and '20161031'


SELECT @LineNumber = 65
SELECT @Source = '[Q-013]'
SELECT @Title = '[Total Unduplicated Individuals Served]'
;
WITH cte_Line_60
AS
(


	SELECT distinct
		  [Patient_No]
	  FROM [Success].[dbo].[zzz_p0021_6_for_Analysis_of_Part_Q]
	  --Where (
			--	[Type] = 'BH'
			--	--AND
			--	--[loc] = 'WJ'
			--	AND
			--	[Adult] = 1
			--)
)
INSERT INTO [Success].[dbo].[zzz_p0021_5_IDR_part_Q_Results] 
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

--Line: [66] , Source: [Q-014] , __________ Description: [Total - Unduplicated]  , _______________ Row Title [Adults]

----35](A-022)un-duplicated Individuals - Total - Adults -  JeffCare(JPHSA PC and BH)
--SELECT   Distinct [patient #]
--FROM         dbo.EHSS a 
--WHERE a.[Check-In Day]between '20161001' and '20161031'
--and a.[Patient Birth Date]<'19981031' --<== This is the date for people who are 18 yrs and older at the end of the 'month'



SELECT @LineNumber = 66
SELECT @Source = '[Q-014]'
SELECT @Title = '[Adults]'
;
WITH cte_Line_66
AS
(


	SELECT distinct
		  [Patient_No]
	  FROM [Success].[dbo].[zzz_p0021_6_for_Analysis_of_Part_Q]
	  Where (
				--[Type] = 'BH'
				--AND
				--[loc] = 'WJ'
				--AND
				[Adult] = 1
			)
)
INSERT INTO [Success].[dbo].[zzz_p0021_5_IDR_part_Q_Results] 
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

--Line: [67] , Source: [( Q-013 - Q-014)] ,  Description: [Total - Unduplicated]  , _______________ Row Title [Children]


SELECT @LineNumber = 67
SELECT @Source = ' [( Q-013 - Q-014)]'
SELECT @Title = '[Children]'

INSERT INTO [Success].[dbo].[zzz_p0021_5_IDR_part_Q_Results] 
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
						FROM [Success].[dbo].[zzz_p0021_5_IDR_part_Q_Results] 
						WHERE LineNumber = 65
					)
					-
					(
						SELECT TOP(1) Result 
						FROM [Success].[dbo].[zzz_p0021_5_IDR_part_Q_Results] 
						WHERE LineNumber = 66
					)
			  ) 
		)

















----Line: [4]----Source: [B-001]-----Description: [East Jefferson Health Center] =================================START

--SELECT @LineNumber = 4
--SELECT @Source = '[B-001]'
--SELECT @Title = '[East Jefferson Health Center]'
--;
--WITH cte_Line_4
--AS
--(
--	SELECT distinct
--		  [Office_Location],
--		  [Bill_Provider_Name],
--		  [Patient_No],
--		  --------------New fields for Distinct, above this line
--		  [Patient_Name],
--		  [Check-In_Day]
--	  FROM [Success].[dbo].[T003_All_Monthly_Billable_Services_IDR]
--	  Where (
--				[Office_Location] = 'EB JeffCare'
--				--Office_Name = 'JEFFCARE EAST JEFFERSON'
--				AND
--				Bill_Provider_Specialty = 'FAMILY PRACTICE'
--			)
--)
--INSERT INTO [Success].[dbo].[zzz_p0021_5_IDR_part_Q_Results] 
--		(
--		[LineNumber],
--		[Source],
--		[Line_Title],
--		[Result]
--		)
--VALUES
--		(
--			@LineNumber 
--			,@Source
--			,@Title 
--			, (SELECT Count(*) FROM cte_Line_4)
--		)

----SELECT * from [Success].[dbo].[zzz_p0021_5_IDR_part_Q_Results] 

----Line: [5]----Source: [C-001]-----Description: [Adults] =================================START

--SELECT @LineNumber = 5
--SELECT @Source = '[C-001]'
--SELECT @Title = '[Adults]'
--;
--WITH cte_Line_4
--AS
--(
--	SELECT distinct
--		  [Office_Location],
--		  [Bill_Provider_Name],
--		  [Patient_No],
--		  --------------New fields for Distinct, above this line
--		  [Patient_Name]
--		  ,[Check-In_Day]
--	  FROM [Success].[dbo].[T003_All_Monthly_Billable_Services_IDR]
--	  Where (
--				[Office_Location] = 'EB JeffCare'
--				--Office_Name = 'JEFFCARE EAST JEFFERSON'
--				AND
--				Bill_Provider_Specialty = 'FAMILY PRACTICE'
--				AND
--				Adult = 1
--			)
--)
--INSERT INTO [Success].[dbo].[zzz_p0021_5_IDR_part_Q_Results] 
--		(
--		[LineNumber],
--		[Source],
--		[Line_Title],
--		[Result]
--		)
--VALUES
--		(
--			@LineNumber 
--			,@Source
--			,@Title 
--			, (SELECT Count(*) FROM cte_Line_4)
--		)

----Line: [6]----Source: [B-001-C-001]-----Description: [Children]

--SELECT @LineNumber = 6
--SELECT @Source = '[B-001-C-001]'
--SELECT @Title = '[Children]'

--INSERT INTO [Success].[dbo].[zzz_p0021_5_IDR_part_Q_Results] 
--		(
--		[LineNumber],
--		[Source],
--		[Line_Title],
--		[Result]
--		)
--VALUES
--		(
--			@LineNumber 
--			,@Source
--			,@Title 
--			, ( 
--					(
--						SELECT TOP(1) Result 
--						FROM [Success].[dbo].[zzz_p0021_5_IDR_part_Q_Results] 
--						WHERE LineNumber = 4
--					)
--					-
--					(
--						SELECT TOP(1) Result 
--						FROM [Success].[dbo].[zzz_p0021_5_IDR_part_Q_Results] 
--						WHERE LineNumber = 5
--					)
--			  ) 
--		)

----Line: [7]----Source: [B-002]-----Description: [West JeffersonHealth Center]
--SELECT @LineNumber = 7
--SELECT @Source = '[B-002]'
--SELECT @Title = '[West JeffersonHealth Center]'
--;
--WITH cte_Line_7
--AS
--(
--	SELECT distinct
--		  [Office_Location],
--		  [Bill_Provider_Name],
--		  [Patient_No],
--		  --------------New fields for Distinct, above this line
--		  [Patient_Name]
--		  ,[Check-In_Day]
--	  FROM [Success].[dbo].[T003_All_Monthly_Billable_Services_IDR]
--	  Where (
--				[Office_Location] = 'WB JeffCare'
--				--Office_Name = 'JEFFCARE WEST JEFFERSON'
--				AND
--				Bill_Provider_Specialty = 'FAMILY PRACTICE'
--			)
--)
--INSERT INTO [Success].[dbo].[zzz_p0021_5_IDR_part_Q_Results] 
--		(
--		[LineNumber],
--		[Source],
--		[Line_Title],
--		[Result]
--		)
--VALUES
--		(
--			@LineNumber 
--			,@Source
--			,@Title 
--			, (SELECT Count(*) FROM cte_Line_7)
--		)

----Line: [8]----Source: [C-002]-----Description: [Adults]
--SELECT @LineNumber =8
--SELECT @Source = '[C-002]'
--SELECT @Title = '[Adults]'

--;
--WITH cte_Line_8
--AS
--(
--	SELECT distinct
--		  [Office_Location],
--		  [Bill_Provider_Name],
--		  [Patient_No],
--		  --------------New fields for Distinct, above this line
--		  [Patient_Name]
--		  ,[Check-In_Day]
--	  FROM [Success].[dbo].[T003_All_Monthly_Billable_Services_IDR]
--	  Where (
--				[Office_Location] = 'WB JeffCare'
--				--Office_Name = 'JEFFCARE WEST JEFFERSON'
--				AND
--				Bill_Provider_Specialty = 'FAMILY PRACTICE'
--				AND
--				Adult = 1
--			)
--)
--INSERT INTO [Success].[dbo].[zzz_p0021_5_IDR_part_Q_Results] 
--		(
--		[LineNumber],
--		[Source],
--		[Line_Title],
--		[Result]
--		)
--VALUES
--		(
--			@LineNumber 
--			,@Source
--			,@Title 
--			, (SELECT Count(*) FROM cte_Line_8)
--		)

----Line: [9]----Source: [(B-002 - C-002)]-----Description: [Children]
--SELECT @LineNumber =9
--SELECT @Source = '[(B-002 - C-002)]'
--SELECT @Title = '[Children]'

--INSERT INTO [Success].[dbo].[zzz_p0021_5_IDR_part_Q_Results] 
--		(
--		[LineNumber],
--		[Source],
--		[Line_Title],
--		[Result]
--		)
--VALUES
--		(
--			@LineNumber 
--			,@Source
--			,@Title 
--			, ( 
--					(
--						SELECT TOP(1) Result 
--						FROM [Success].[dbo].[zzz_p0021_5_IDR_part_Q_Results] 
--						WHERE LineNumber = 7
--					)
--					-
--					(
--						SELECT TOP(1) Result 
--						FROM [Success].[dbo].[zzz_p0021_5_IDR_part_Q_Results] 
--						WHERE LineNumber = 8
--					)
--			  ) 
--		)

----Line: [10]----Source: [( B-001 + B-002)]-----Description: [Total Visits]
--SELECT @LineNumber =10
--SELECT @Source = '[( B-001 + B-002)]'
--SELECT @Title = '[Total Visits]'

--INSERT INTO [Success].[dbo].[zzz_p0021_5_IDR_part_Q_Results] 
--		(
--		[LineNumber],
--		[Source],
--		[Line_Title],
--		[Result]
--		)
--VALUES
--		(
--			@LineNumber 
--			,@Source
--			,@Title 
--			, ( 
--					(
--						SELECT TOP(1) Result 
--						FROM [Success].[dbo].[zzz_p0021_5_IDR_part_Q_Results] 
--						WHERE LineNumber = 4
--					)
--					+
--					(
--						SELECT TOP(1) Result 
--						FROM [Success].[dbo].[zzz_p0021_5_IDR_part_Q_Results] 
--						WHERE LineNumber = 7
--					)
--			  ) 
--		)

----Line: [11]----Source: [(C-001 + C-002)]-----Description: [Adults]

--SELECT @LineNumber =11
--SELECT @Source = '[(C-001 + C-002)]'
--SELECT @Title = '[Adults]'

--INSERT INTO [Success].[dbo].[zzz_p0021_5_IDR_part_Q_Results] 
--		(
--		[LineNumber],
--		[Source],
--		[Line_Title],
--		[Result]
--		)
--VALUES
--		(
--			@LineNumber 
--			,@Source
--			,@Title 
--			, ( 
--					(
--						SELECT TOP(1) Result 
--						FROM [Success].[dbo].[zzz_p0021_5_IDR_part_Q_Results] 
--						WHERE LineNumber = 5
--					)
--					+
--					(
--						SELECT TOP(1) Result 
--						FROM [Success].[dbo].[zzz_p0021_5_IDR_part_Q_Results] 
--						WHERE LineNumber = 8
--					)
--			  ) 
--		)

----Line: [12]----Source: [( B-001 + B-002) - (C-001 + C-002)]-----Description: [Children]

--SELECT @LineNumber =12
--SELECT @Source = '[( B-001 + B-002) - (C-001 + C-002)]'
--SELECT @Title = '[Children]'

--INSERT INTO [Success].[dbo].[zzz_p0021_5_IDR_part_Q_Results] 
--		(
--		[LineNumber],
--		[Source],
--		[Line_Title],
--		[Result]
--		)
--VALUES
--		(
--			@LineNumber 
--			,@Source
--			,@Title 
--			, (
--				( 
--					(
--						SELECT TOP(1) Result 
--						FROM [Success].[dbo].[zzz_p0021_5_IDR_part_Q_Results] 
--						WHERE LineNumber = 4
--					)
--					+
--					(
--						SELECT TOP(1) Result 
--						FROM [Success].[dbo].[zzz_p0021_5_IDR_part_Q_Results] 
--						WHERE LineNumber = 7
--					)
--				)
--				-
--				( 
--					(
--						SELECT TOP(1) Result 
--						FROM [Success].[dbo].[zzz_p0021_5_IDR_part_Q_Results] 
--						WHERE LineNumber = 5
--					)
--					+
--					(
--						SELECT TOP(1) Result 
--						FROM [Success].[dbo].[zzz_p0021_5_IDR_part_Q_Results] 
--						WHERE LineNumber = 8
--					)
--				)
--			  ) 
--		)

----Line: [35]----Source: [B-003]-----Description: [East Jefferson Health Center]


--SELECT @LineNumber = 35
--SELECT @Source = '[B-003]'
--SELECT @Title = '[East Jefferson Health Center]'
--;
--WITH cte_Line_35
--AS
--(
--	SELECT distinct
--		  [Office_Location],
--		  [Bill_Provider_Name],
--		  [Patient_No],
--		  --------------New fields for Distinct, above this line
--		  [Patient_Name]
--		  ,[Check-In_Day]
--	  FROM [Success].[dbo].[T003_All_Monthly_Billable_Services_IDR]
--	  Where (
--				[Office_Location] = 'EB JeffCare'
--				--Office_Name = 'JEFFCARE EAST JEFFERSON'	
--				AND
--				Bill_Provider_Specialty in ('FQHC - PSYCHIATRY', 'PSYCHIATRY')
--			)
--)
--INSERT INTO [Success].[dbo].[zzz_p0021_5_IDR_part_Q_Results] 
--		(
--		[LineNumber],
--		[Source],
--		[Line_Title],
--		[Result]
--		)
--VALUES
--		(
--			@LineNumber 
--			,@Source
--			,@Title 
--			, (SELECT Count(*) FROM cte_Line_35)
--		)

----Line: [36]----Source: [C-003]-----Description: [Adults]


--SELECT @LineNumber = 36
--SELECT @Source = '[C-003]'
--SELECT @Title = '[Adults]'
--;
--WITH cte_Line_36
--AS
--(
--	SELECT distinct
--		  [Office_Location],
--		  [Bill_Provider_Name],
--		  [Patient_No],
--		  --------------New fields for Distinct, above this line
--		  [Patient_Name]
--		  ,[Check-In_Day]
--	  FROM [Success].[dbo].[T003_All_Monthly_Billable_Services_IDR]
--	  Where (
--				[Office_Location] = 'EB JeffCare'
--				AND
--				Bill_Provider_Specialty in ('FQHC - PSYCHIATRY', 'PSYCHIATRY')
--				AND
--				Adult = 1
--			)
--)
--INSERT INTO [Success].[dbo].[zzz_p0021_5_IDR_part_Q_Results] 
--		(
--		[LineNumber],
--		[Source],
--		[Line_Title],
--		[Result]
--		)
--VALUES
--		(
--			@LineNumber 
--			,@Source
--			,@Title 
--			, (SELECT Count(*) FROM cte_Line_36)
--		)


----Line: [37]----Source: [(B-003 - C-003)]-----Description: [Children]

--SELECT @LineNumber =37
--SELECT @Source = '[(B-003 - C-003)]'
--SELECT @Title = '[Children]'

--INSERT INTO [Success].[dbo].[zzz_p0021_5_IDR_part_Q_Results] 
--		(
--		[LineNumber],
--		[Source],
--		[Line_Title],
--		[Result]
--		)
--VALUES
--		(
--			@LineNumber 
--			,@Source
--			,@Title 
--			, ( 
--					(
--						SELECT TOP(1) Result 
--						FROM [Success].[dbo].[zzz_p0021_5_IDR_part_Q_Results] 
--						WHERE LineNumber = 35
--					)
--					-
--					(
--						SELECT TOP(1) Result 
--						FROM [Success].[dbo].[zzz_p0021_5_IDR_part_Q_Results] 
--						WHERE LineNumber = 36
--					)
--			  ) 
--		)

----Line: [38]----Source: [B-004]-----Description: [West JeffersonHealth Center]

--SELECT @LineNumber = 38
--SELECT @Source = '[B-004]'
--SELECT @Title = '[West JeffersonHealth Center]'
--;
--WITH cte_Line_38
--AS
--(
--	SELECT distinct
--		  [Office_Location],
--		  [Bill_Provider_Name],
--		  [Patient_No],
--		  --------------New fields for Distinct, above this line
--		  [Patient_Name]
--		  ,[Check-In_Day]
--	  FROM [Success].[dbo].[T003_All_Monthly_Billable_Services_IDR]
--	  Where (
--				[Office_Location] = 'WB JeffCare'
--				--Office_Name = 'JEFFCARE WEST JEFFERSON'
--				AND
--				Bill_Provider_Specialty in ('FQHC - PSYCHIATRY', 'PSYCHIATRY')
--			)
--)
--INSERT INTO [Success].[dbo].[zzz_p0021_5_IDR_part_Q_Results] 
--		(
--		[LineNumber],
--		[Source],
--		[Line_Title],
--		[Result]
--		)
--VALUES
--		(
--			@LineNumber 
--			,@Source
--			,@Title 
--			, (SELECT Count(*) FROM cte_Line_38)
--		)

----Line: [39]----Source: [C-004]-----Description: [Adults]

--SELECT @LineNumber =39
--SELECT @Source = '[C-004]'
--SELECT @Title = '[Adults]'

--;
--WITH cte_Line_39
--AS
--(
--	SELECT distinct
--		  [Office_Location],
--		  [Bill_Provider_Name],
--		  [Patient_No],
--		  --------------New fields for Distinct, above this line
--		  [Patient_Name]
--		  ,[Check-In_Day]
--	  FROM [Success].[dbo].[T003_All_Monthly_Billable_Services_IDR]
--	  Where (
--				[Office_Location] = 'WB JeffCare'
--				--Office_Name = 'JEFFCARE WEST JEFFERSON'
--				AND
--				Bill_Provider_Specialty in ('FQHC - PSYCHIATRY', 'PSYCHIATRY')
--				AND
--				Adult = 1
--			)
--)
--INSERT INTO [Success].[dbo].[zzz_p0021_5_IDR_part_Q_Results] 
--		(
--		[LineNumber],
--		[Source],
--		[Line_Title],
--		[Result]
--		)
--VALUES
--		(
--			@LineNumber 
--			,@Source
--			,@Title 
--			, (SELECT Count(*) FROM cte_Line_39)
--		)

----Line: [40]----Source: [(B-004 - C-004)]-----Description: [Children]


--SELECT @LineNumber =40
--SELECT @Source = '[(B-004 - C-004)]'
--SELECT @Title = '[Children]'

--INSERT INTO [Success].[dbo].[zzz_p0021_5_IDR_part_Q_Results] 
--		(
--		[LineNumber],
--		[Source],
--		[Line_Title],
--		[Result]
--		)
--VALUES
--		(
--			@LineNumber 
--			,@Source
--			,@Title 
--			, ( 
--					(
--						SELECT TOP(1) Result 
--						FROM [Success].[dbo].[zzz_p0021_5_IDR_part_Q_Results] 
--						WHERE LineNumber = 38
--					)
--					-
--					(
--						SELECT TOP(1) Result 
--						FROM [Success].[dbo].[zzz_p0021_5_IDR_part_Q_Results] 
--						WHERE LineNumber = 39
--					)
--			  ) 
--		)

----Line: [41]----Source: [(B-003 + B-004)]-----Description: [Total Visits]


--SELECT @LineNumber =41
--SELECT @Source = '[(B-003 + B-004)]'
--SELECT @Title = '[Total Visits]'

--INSERT INTO [Success].[dbo].[zzz_p0021_5_IDR_part_Q_Results] 
--		(
--		[LineNumber],
--		[Source],
--		[Line_Title],
--		[Result]
--		)
--VALUES
--		(
--			@LineNumber 
--			,@Source
--			,@Title 
--			, ( 
--					(
--						SELECT TOP(1) Result 
--						FROM [Success].[dbo].[zzz_p0021_5_IDR_part_Q_Results] 
--						WHERE LineNumber = 35
--					)
--					+
--					(
--						SELECT TOP(1) Result 
--						FROM [Success].[dbo].[zzz_p0021_5_IDR_part_Q_Results] 
--						WHERE LineNumber = 38
--					)
--			  ) 
--		)

----Line: [42]----Source: [(C-003 + C-004)]-----Description: [Adults]

--SELECT @LineNumber =42
--SELECT @Source = '[(C-003 + C-004)]'
--SELECT @Title = '[Adults]'

--INSERT INTO [Success].[dbo].[zzz_p0021_5_IDR_part_Q_Results] 
--		(
--		[LineNumber],
--		[Source],
--		[Line_Title],
--		[Result]
--		)
--VALUES
--		(
--			@LineNumber 
--			,@Source
--			,@Title 
--			, ( 
--					(
--						SELECT TOP(1) Result 
--						FROM [Success].[dbo].[zzz_p0021_5_IDR_part_Q_Results] 
--						WHERE LineNumber = 36
--					)
--					+
--					(
--						SELECT TOP(1) Result 
--						FROM [Success].[dbo].[zzz_p0021_5_IDR_part_Q_Results] 
--						WHERE LineNumber = 39
--					)
--			  ) 
--		)

----Line: [43]----Source: [(B-003 + B-004) - (C-003 + C-004)]-----Description: [Children]


--SELECT @LineNumber =43
--SELECT @Source = '[(B-003 + B-004) - (C-003 + C-004)]'
--SELECT @Title = '[Children]'

--INSERT INTO [Success].[dbo].[zzz_p0021_5_IDR_part_Q_Results] 
--		(
--		[LineNumber],
--		[Source],
--		[Line_Title],
--		[Result]
--		)
--VALUES
--		(
--			@LineNumber 
--			,@Source
--			,@Title 
--			, (
--				( 
--					(
--						SELECT TOP(1) Result 
--						FROM [Success].[dbo].[zzz_p0021_5_IDR_part_Q_Results] 
--						WHERE LineNumber = 35
--					)
--					+
--					(
--						SELECT TOP(1) Result 
--						FROM [Success].[dbo].[zzz_p0021_5_IDR_part_Q_Results] 
--						WHERE LineNumber = 38
--					)
--				)
--				-
--				( 
--					(
--						SELECT TOP(1) Result 
--						FROM [Success].[dbo].[zzz_p0021_5_IDR_part_Q_Results] 
--						WHERE LineNumber = 36
--					)
--					+
--					(
--						SELECT TOP(1) Result 
--						FROM [Success].[dbo].[zzz_p0021_5_IDR_part_Q_Results] 
--						WHERE LineNumber = 39
--					)
--				)
--			  ) 
--		)

----	Line: [65]----Source: [( B-001 + B-002) + (B-003 + B-004)]-----Description: [Total Visits]


--SELECT @LineNumber =65
--SELECT @Source = '[( B-001 + B-002) + (B-003 + B-004)]'
--SELECT @Title = ' [Total Visits]'

--INSERT INTO [Success].[dbo].[zzz_p0021_5_IDR_part_Q_Results] 
--		(
--		[LineNumber],
--		[Source],
--		[Line_Title],
--		[Result]
--		)
--VALUES
--		(
--			@LineNumber 
--			,@Source
--			,@Title 
--			, (
--				( 
--					(
--						SELECT TOP(1) Result 
--						FROM [Success].[dbo].[zzz_p0021_5_IDR_part_Q_Results] 
--						WHERE LineNumber = 4
--					)
--					+
--					(
--						SELECT TOP(1) Result 
--						FROM [Success].[dbo].[zzz_p0021_5_IDR_part_Q_Results] 
--						WHERE LineNumber = 7
--					)
--				)
--				+
--				( 
--					(
--						SELECT TOP(1) Result 
--						FROM [Success].[dbo].[zzz_p0021_5_IDR_part_Q_Results] 
--						WHERE LineNumber = 35
--					)
--					+
--					(
--						SELECT TOP(1) Result 
--						FROM [Success].[dbo].[zzz_p0021_5_IDR_part_Q_Results] 
--						WHERE LineNumber = 38
--					)
--				)
--			  ) 
--		)


---RESULTS TABLE
SELECT * from [Success].[dbo].[zzz_p0021_5_IDR_part_Q_Results] 