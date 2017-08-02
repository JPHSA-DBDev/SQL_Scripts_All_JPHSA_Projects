--p_0021_SP_002_B_and_C_values_v4.sql
/*
	************************************************************************************
			
	Uses: this should output the values B-001 to B-004, and C-001 to C-004,
		  and then calculate the calculated values for the monthly report

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
	By: glenn garson
	************************************************************************************
*/
USE [Success];
GO
----------------------- Local Variables
   DECLARE @LineNumber int
   DECLARE @Source nvarchar(100)
   DECLARE @Title nvarchar(255)
----------------------------------------
IF OBJECT_ID('dbo.zzz_p0021_1_IDR_part_B_and_C') IS NOT NULL
    DROP TABLE dbo.zzz_p0021_1_IDR_part_B_and_C


CREATE TABLE [dbo].[zzz_p0021_1_IDR_part_B_and_C]
(
		[IDR_a_b_PK] [int] IDENTITY(1,1) NOT NULL,		
		[LineNumber] [int] NOT NULL,
		[Source] nvarchar(100) NOT NULL,
		[Line_Title] nvarchar(255) NOT NULL,
		[DateTime_Created] [datetime] NOT NULL CONSTRAINT IDR_a_b_TheDateTime_Default_GETDATE DEFAULT GETDATE(),
		[Result] [int] NOT NULL,
		[IDR_a_b_RowVersion] [timestamp] NULL
	,CONSTRAINT [zzz_p0021_1_IDR_part_B_and_C$IDR_a_b_PK] PRIMARY KEY NONCLUSTERED 
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
		  --------------New fields for Distinct, above this line
		  [Patient_Name],
		  [Check-In_Day]
	  FROM [Success].[dbo].[T003_All_Monthly_Billable_Services_IDR]
	  Where (
				[Office_Location] = 'EB JeffCare'
				--Office_Name = 'JEFFCARE EAST JEFFERSON'
				AND
				Bill_Provider_Specialty = 'FAMILY PRACTICE'
			)
)
INSERT INTO [Success].[dbo].[zzz_p0021_1_IDR_part_B_and_C] 
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

--SELECT * from [Success].[dbo].[zzz_p0021_1_IDR_part_B_and_C] 

--Line: [5]----Source: [C-001]-----Description: [Adults] =================================START

SELECT @LineNumber = 5
SELECT @Source = '[C-001]'
SELECT @Title = '[Adults]'
;
WITH cte_Line_4
AS
(
	SELECT distinct
		  [Office_Location],
		  [Bill_Provider_Name],
		  [Patient_No],
		  --------------New fields for Distinct, above this line
		  [Patient_Name]
		  ,[Check-In_Day]
	  FROM [Success].[dbo].[T003_All_Monthly_Billable_Services_IDR]
	  Where (
				[Office_Location] = 'EB JeffCare'
				--Office_Name = 'JEFFCARE EAST JEFFERSON'
				AND
				Bill_Provider_Specialty = 'FAMILY PRACTICE'
				AND
				Adult = 1
			)
)
INSERT INTO [Success].[dbo].[zzz_p0021_1_IDR_part_B_and_C] 
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

--Line: [6]----Source: [B-001-C-001]-----Description: [Children]

SELECT @LineNumber = 6
SELECT @Source = '[B-001-C-001]'
SELECT @Title = '[Children]'

INSERT INTO [Success].[dbo].[zzz_p0021_1_IDR_part_B_and_C] 
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
						FROM [Success].[dbo].[zzz_p0021_1_IDR_part_B_and_C] 
						WHERE LineNumber = 4
					)
					-
					(
						SELECT TOP(1) Result 
						FROM [Success].[dbo].[zzz_p0021_1_IDR_part_B_and_C] 
						WHERE LineNumber = 5
					)
			  ) 
		)

--Line: [7]----Source: [B-002]-----Description: [West JeffersonHealth Center]
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
		  --------------New fields for Distinct, above this line
		  [Patient_Name]
		  ,[Check-In_Day]
	  FROM [Success].[dbo].[T003_All_Monthly_Billable_Services_IDR]
	  Where (
				[Office_Location] = 'WB JeffCare'
				--Office_Name = 'JEFFCARE WEST JEFFERSON'
				AND
				Bill_Provider_Specialty = 'FAMILY PRACTICE'
			)
)
INSERT INTO [Success].[dbo].[zzz_p0021_1_IDR_part_B_and_C] 
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
			, (SELECT Count(*) FROM cte_Line_7)
		)

--Line: [8]----Source: [C-002]-----Description: [Adults]
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
		  --------------New fields for Distinct, above this line
		  [Patient_Name]
		  ,[Check-In_Day]
	  FROM [Success].[dbo].[T003_All_Monthly_Billable_Services_IDR]
	  Where (
				[Office_Location] = 'WB JeffCare'
				--Office_Name = 'JEFFCARE WEST JEFFERSON'
				AND
				Bill_Provider_Specialty = 'FAMILY PRACTICE'
				AND
				Adult = 1
			)
)
INSERT INTO [Success].[dbo].[zzz_p0021_1_IDR_part_B_and_C] 
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
			, (SELECT Count(*) FROM cte_Line_8)
		)

--Line: [9]----Source: [(B-002 - C-002)]-----Description: [Children]
SELECT @LineNumber =9
SELECT @Source = '[(B-002 - C-002)]'
SELECT @Title = '[Children]'

INSERT INTO [Success].[dbo].[zzz_p0021_1_IDR_part_B_and_C] 
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
						FROM [Success].[dbo].[zzz_p0021_1_IDR_part_B_and_C] 
						WHERE LineNumber = 7
					)
					-
					(
						SELECT TOP(1) Result 
						FROM [Success].[dbo].[zzz_p0021_1_IDR_part_B_and_C] 
						WHERE LineNumber = 8
					)
			  ) 
		)

--Line: [10]----Source: [( B-001 + B-002)]-----Description: [Total Visits]
SELECT @LineNumber =10
SELECT @Source = '[( B-001 + B-002)]'
SELECT @Title = '[Total Visits]'

INSERT INTO [Success].[dbo].[zzz_p0021_1_IDR_part_B_and_C] 
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
						FROM [Success].[dbo].[zzz_p0021_1_IDR_part_B_and_C] 
						WHERE LineNumber = 4
					)
					+
					(
						SELECT TOP(1) Result 
						FROM [Success].[dbo].[zzz_p0021_1_IDR_part_B_and_C] 
						WHERE LineNumber = 7
					)
			  ) 
		)

--Line: [11]----Source: [(C-001 + C-002)]-----Description: [Adults]

SELECT @LineNumber =11
SELECT @Source = '[(C-001 + C-002)]'
SELECT @Title = '[Adults]'

INSERT INTO [Success].[dbo].[zzz_p0021_1_IDR_part_B_and_C] 
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
						FROM [Success].[dbo].[zzz_p0021_1_IDR_part_B_and_C] 
						WHERE LineNumber = 5
					)
					+
					(
						SELECT TOP(1) Result 
						FROM [Success].[dbo].[zzz_p0021_1_IDR_part_B_and_C] 
						WHERE LineNumber = 8
					)
			  ) 
		)

--Line: [12]----Source: [( B-001 + B-002) - (C-001 + C-002)]-----Description: [Children]

SELECT @LineNumber =12
SELECT @Source = '[( B-001 + B-002) - (C-001 + C-002)]'
SELECT @Title = '[Children]'

INSERT INTO [Success].[dbo].[zzz_p0021_1_IDR_part_B_and_C] 
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
						FROM [Success].[dbo].[zzz_p0021_1_IDR_part_B_and_C] 
						WHERE LineNumber = 4
					)
					+
					(
						SELECT TOP(1) Result 
						FROM [Success].[dbo].[zzz_p0021_1_IDR_part_B_and_C] 
						WHERE LineNumber = 7
					)
				)
				-
				( 
					(
						SELECT TOP(1) Result 
						FROM [Success].[dbo].[zzz_p0021_1_IDR_part_B_and_C] 
						WHERE LineNumber = 5
					)
					+
					(
						SELECT TOP(1) Result 
						FROM [Success].[dbo].[zzz_p0021_1_IDR_part_B_and_C] 
						WHERE LineNumber = 8
					)
				)
			  ) 
		)

--Line: [35]----Source: [B-003]-----Description: [East Jefferson Health Center]


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
		  --------------New fields for Distinct, above this line
		  [Patient_Name]
		  ,[Check-In_Day]
	  FROM [Success].[dbo].[T003_All_Monthly_Billable_Services_IDR]
	  Where (
				[Office_Location] = 'EB JeffCare'
				--Office_Name = 'JEFFCARE EAST JEFFERSON'	
				AND
				Bill_Provider_Specialty in ('FQHC - PSYCHIATRY', 'PSYCHIATRY')
			)
)
INSERT INTO [Success].[dbo].[zzz_p0021_1_IDR_part_B_and_C] 
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
			, (SELECT Count(*) FROM cte_Line_35)
		)

--Line: [36]----Source: [C-003]-----Description: [Adults]


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
		  --------------New fields for Distinct, above this line
		  [Patient_Name]
		  ,[Check-In_Day]
	  FROM [Success].[dbo].[T003_All_Monthly_Billable_Services_IDR]
	  Where (
				[Office_Location] = 'EB JeffCare'
				AND
				Bill_Provider_Specialty in ('FQHC - PSYCHIATRY', 'PSYCHIATRY')
				AND
				Adult = 1
			)
)
INSERT INTO [Success].[dbo].[zzz_p0021_1_IDR_part_B_and_C] 
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
			, (SELECT Count(*) FROM cte_Line_36)
		)


--Line: [37]----Source: [(B-003 - C-003)]-----Description: [Children]

SELECT @LineNumber =37
SELECT @Source = '[(B-003 - C-003)]'
SELECT @Title = '[Children]'

INSERT INTO [Success].[dbo].[zzz_p0021_1_IDR_part_B_and_C] 
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
						FROM [Success].[dbo].[zzz_p0021_1_IDR_part_B_and_C] 
						WHERE LineNumber = 35
					)
					-
					(
						SELECT TOP(1) Result 
						FROM [Success].[dbo].[zzz_p0021_1_IDR_part_B_and_C] 
						WHERE LineNumber = 36
					)
			  ) 
		)

--Line: [38]----Source: [B-004]-----Description: [West JeffersonHealth Center]

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
		  --------------New fields for Distinct, above this line
		  [Patient_Name]
		  ,[Check-In_Day]
	  FROM [Success].[dbo].[T003_All_Monthly_Billable_Services_IDR]
	  Where (
				[Office_Location] = 'WB JeffCare'
				--Office_Name = 'JEFFCARE WEST JEFFERSON'
				AND
				Bill_Provider_Specialty in ('FQHC - PSYCHIATRY', 'PSYCHIATRY')
			)
)
INSERT INTO [Success].[dbo].[zzz_p0021_1_IDR_part_B_and_C] 
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
			, (SELECT Count(*) FROM cte_Line_38)
		)

--Line: [39]----Source: [C-004]-----Description: [Adults]

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
		  --------------New fields for Distinct, above this line
		  [Patient_Name]
		  ,[Check-In_Day]
	  FROM [Success].[dbo].[T003_All_Monthly_Billable_Services_IDR]
	  Where (
				[Office_Location] = 'WB JeffCare'
				--Office_Name = 'JEFFCARE WEST JEFFERSON'
				AND
				Bill_Provider_Specialty in ('FQHC - PSYCHIATRY', 'PSYCHIATRY')
				AND
				Adult = 1
			)
)
INSERT INTO [Success].[dbo].[zzz_p0021_1_IDR_part_B_and_C] 
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
			, (SELECT Count(*) FROM cte_Line_39)
		)

--Line: [40]----Source: [(B-004 - C-004)]-----Description: [Children]


SELECT @LineNumber =40
SELECT @Source = '[(B-004 - C-004)]'
SELECT @Title = '[Children]'

INSERT INTO [Success].[dbo].[zzz_p0021_1_IDR_part_B_and_C] 
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
						FROM [Success].[dbo].[zzz_p0021_1_IDR_part_B_and_C] 
						WHERE LineNumber = 38
					)
					-
					(
						SELECT TOP(1) Result 
						FROM [Success].[dbo].[zzz_p0021_1_IDR_part_B_and_C] 
						WHERE LineNumber = 39
					)
			  ) 
		)

--Line: [41]----Source: [(B-003 + B-004)]-----Description: [Total Visits]


SELECT @LineNumber =41
SELECT @Source = '[(B-003 + B-004)]'
SELECT @Title = '[Total Visits]'

INSERT INTO [Success].[dbo].[zzz_p0021_1_IDR_part_B_and_C] 
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
						FROM [Success].[dbo].[zzz_p0021_1_IDR_part_B_and_C] 
						WHERE LineNumber = 35
					)
					+
					(
						SELECT TOP(1) Result 
						FROM [Success].[dbo].[zzz_p0021_1_IDR_part_B_and_C] 
						WHERE LineNumber = 38
					)
			  ) 
		)

--Line: [42]----Source: [(C-003 + C-004)]-----Description: [Adults]

SELECT @LineNumber =42
SELECT @Source = '[(C-003 + C-004)]'
SELECT @Title = '[Adults]'

INSERT INTO [Success].[dbo].[zzz_p0021_1_IDR_part_B_and_C] 
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
						FROM [Success].[dbo].[zzz_p0021_1_IDR_part_B_and_C] 
						WHERE LineNumber = 36
					)
					+
					(
						SELECT TOP(1) Result 
						FROM [Success].[dbo].[zzz_p0021_1_IDR_part_B_and_C] 
						WHERE LineNumber = 39
					)
			  ) 
		)

--Line: [43]----Source: [(B-003 + B-004) - (C-003 + C-004)]-----Description: [Children]


SELECT @LineNumber =43
SELECT @Source = '[(B-003 + B-004) - (C-003 + C-004)]'
SELECT @Title = '[Children]'

INSERT INTO [Success].[dbo].[zzz_p0021_1_IDR_part_B_and_C] 
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
						FROM [Success].[dbo].[zzz_p0021_1_IDR_part_B_and_C] 
						WHERE LineNumber = 35
					)
					+
					(
						SELECT TOP(1) Result 
						FROM [Success].[dbo].[zzz_p0021_1_IDR_part_B_and_C] 
						WHERE LineNumber = 38
					)
				)
				-
				( 
					(
						SELECT TOP(1) Result 
						FROM [Success].[dbo].[zzz_p0021_1_IDR_part_B_and_C] 
						WHERE LineNumber = 36
					)
					+
					(
						SELECT TOP(1) Result 
						FROM [Success].[dbo].[zzz_p0021_1_IDR_part_B_and_C] 
						WHERE LineNumber = 39
					)
				)
			  ) 
		)

--	Line: [65]----Source: [( B-001 + B-002) + (B-003 + B-004)]-----Description: [Total Visits]


SELECT @LineNumber =65
SELECT @Source = '[( B-001 + B-002) + (B-003 + B-004)]'
SELECT @Title = ' [Total Visits]'

INSERT INTO [Success].[dbo].[zzz_p0021_1_IDR_part_B_and_C] 
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
						FROM [Success].[dbo].[zzz_p0021_1_IDR_part_B_and_C] 
						WHERE LineNumber = 4
					)
					+
					(
						SELECT TOP(1) Result 
						FROM [Success].[dbo].[zzz_p0021_1_IDR_part_B_and_C] 
						WHERE LineNumber = 7
					)
				)
				+
				( 
					(
						SELECT TOP(1) Result 
						FROM [Success].[dbo].[zzz_p0021_1_IDR_part_B_and_C] 
						WHERE LineNumber = 35
					)
					+
					(
						SELECT TOP(1) Result 
						FROM [Success].[dbo].[zzz_p0021_1_IDR_part_B_and_C] 
						WHERE LineNumber = 38
					)
				)
			  ) 
		)


---RESULTS TABLE
SELECT * from [Success].[dbo].[zzz_p0021_1_IDR_part_B_and_C] 