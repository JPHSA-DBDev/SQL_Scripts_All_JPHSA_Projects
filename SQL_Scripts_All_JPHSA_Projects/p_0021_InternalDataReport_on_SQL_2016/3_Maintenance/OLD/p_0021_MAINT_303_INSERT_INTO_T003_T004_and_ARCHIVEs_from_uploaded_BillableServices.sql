--p_0021_MAINT_303_INSERT_INTO_T003_T004_and_ARCHIVEs_from_uploaded_BillableServices.sql
/*
	************************************************************************************

	NOTE: This takes the data that was uploaded from the Access Database (.mdb) to the SQL Server with the table name: [Billable_Service_YYYY_MM_DD]

			a) The data originates from Business Intelligence: https://bobi.ehsmed.com/BOE/BI 
			b) It is exported as Excel 2007
				it should not have the "Sum" row at the bottom
				it should not have the rows before the Column headers
				and the empty column 'A' should be deleted while in Excel
			c) The excel data should be imported into a .mdb Access Database, and then imported into SQL
				Import to ACCESS, from Excel, w/ no changes, and no primary key

		  The data in the SQL table [Billable_Service_YYYY_MM_DD] is appended to two tables in a transaction:

				[T003_Billable_Service]         {This one is truncated before the data is appended}
				[ARCHIVE_T003_Billable_Service]
			
	Uses: 
	Created: 03/14/2017
	By: glenn garson
	************************************************************************************
*/
USE [Success];
GO

--DECLARE 
-- ****************************************************************************************
-- Declare variables specific to just this run of the script
-- ****************************************************************************************
DECLARE @AsOfEndOfMonth as nvarchar(12)
SELECT @AsOfEndOfMonth = '''01/31/2017'''

DECLARE @table_name_Billable_Service_SOURCE AS sysname
SET @table_name_Billable_Service_SOURCE = N'Billable_Service_2017_02_23'


DECLARE @table_name_NON_Billable_Service_SOURCE AS sysname
SET @table_name_NON_Billable_Service_SOURCE = N'NON_Billable_Service_2017_02_23'

-- ****************************************************************************************
-- Declare local variables
-- ****************************************************************************************
DECLARE @Continue BIT
DECLARE @Message VARCHAR(300)
DECLARE @cmd_Billable_Service AS nvarchar(max)
DECLARE @cmd_ARCHIVE_Billable_Service AS nvarchar(max)
DECLARE @cmd_NON_Billable_Service AS nvarchar(max)
DECLARE @cmd_ARCHIVE_NON_Billable_Service AS nvarchar(max)
--
-- intialize values
--
SELECT @Continue = 1		-- 1 = good, 0 = bad
SELECT @Message = ''



-- ****************************************************************************************


-- START TRANSACTION ----------------------------------------------------------	
BEGIN TRANSACTION;
		BEGIN TRY

		-- STEP 1 --------------------------
		TRUNCATE TABLE T003_Billable_Service

				----
				---- Check for errors
				----
				IF @@ERROR <> 0
					BEGIN
						PRINT 'Truncate failed - T003_Billable_Service'
					END
					ELSE
						BEGIN
							PRINT 'Truncate succeeded - T003_Billable_Service'
						END						
		-- STEP 1 --------------------------END


		-- STEP 2 --------------------------

		SET @cmd_Billable_Service = N'
		INSERT INTO [Success].[dbo].[T003_Billable_Service]
			(
			  [CHECKMONTH]
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
			  ,[Age_as_of_End_Of_Month]
			  ,[Adult]
			)
		SELECT 
			  [CHECKMONTH]
			  ,[Office Location]
			  ,[Office Name]
			  ,[Bill Provider Name]
			  ,[Bill Provider Specialty]
			  ,[Provider Type]
			  ,[Patient Name]
			  ,[Patient #]
			  ,[Patient Birth Date]
			  ,[Check-In Day]
			  ,[Check-Out Day]
			  ,[CPT Code]
			  ,[Service]
			  ,[CPT Description]
			  ,[Unit Qty]
			  , (0 + Convert(Char(8),Convert(datetime,' + @AsOfEndOfMonth + ',101),112) - Convert(Char(8),[Patient Birth Date],112)) / 10000 as Age_as_of_End_Of_Month
			  , (SELECT     ''TheCalculation'' = CASE 
													WHEN
														( ((0 + Convert(Char(8),Convert(datetime,' + @AsOfEndOfMonth + ',101),112) - Convert(Char(8),[Patient Birth Date],112)) / 10000) >= 18 )
													   THEN 1 
													ELSE 0 
												END) as Adult
		FROM [Success].[dbo].[' + @table_name_Billable_Service_SOURCE +']'


			EXEC sp_executesql @stmt = @cmd_Billable_Service

					IF @@ERROR <> 0
						BEGIN
							PRINT 'Insert into [T003_Billable_Service] failed from: ' + @table_name_Billable_Service_SOURCE
						END
					ELSE
						BEGIN
							PRINT 'Insert into [T003_Billable_Service] SUCCEEDED from: ' + @table_name_Billable_Service_SOURCE
						END
		-- STEP 2 --------------------------END

		-- STEP 3 --------------------------

		SET @cmd_ARCHIVE_Billable_Service = N'
		INSERT INTO [Success].[dbo].[ARCHIVE_T003_Billable_Service]
			(
			  [CHECKMONTH]
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
			  ,[Age_as_of_End_Of_Month]
			  ,[Adult]
			)
		SELECT 
			  [CHECKMONTH]
			  ,[Office Location]
			  ,[Office Name]
			  ,[Bill Provider Name]
			  ,[Bill Provider Specialty]
			  ,[Provider Type]
			  ,[Patient Name]
			  ,[Patient #]
			  ,[Patient Birth Date]
			  ,[Check-In Day]
			  ,[Check-Out Day]
			  ,[CPT Code]
			  ,[Service]
			  ,[CPT Description]
			  ,[Unit Qty]
			  , (0 + Convert(Char(8),Convert(datetime,' + @AsOfEndOfMonth + ',101),112) - Convert(Char(8),[Patient Birth Date],112)) / 10000 as Age_as_of_End_Of_Month
			  , (SELECT     ''TheCalculation'' = CASE 
													WHEN
														( ((0 + Convert(Char(8),Convert(datetime,' + @AsOfEndOfMonth + ',101),112) - Convert(Char(8),[Patient Birth Date],112)) / 10000) >= 18 )
													   THEN 1 
													ELSE 0 
												END) as Adult
		FROM [Success].[dbo].[' + @table_name_Billable_Service_SOURCE +']'


			EXEC sp_executesql @stmt = @cmd_ARCHIVE_Billable_Service

					IF @@ERROR <> 0
						BEGIN
							PRINT 'Insert into [ARCHIVE_T003_Billable_Service] failed from: ' + @table_name_Billable_Service_SOURCE
						END
					ELSE
						BEGIN
							PRINT 'Insert into [ARCHIVE_T003_Billable_Service] SUCCEEDED from: ' + @table_name_Billable_Service_SOURCE
						END
		-- STEP 3 --------------------------END


		-- STEP 4 --------------------------
		TRUNCATE TABLE [T004_NON_Billable_Service]

				----
				---- Check for errors
				----
				IF @@ERROR <> 0
					BEGIN
						PRINT 'Truncate failed - [T004_NON_Billable_Service]'
					END
					ELSE
						BEGIN
							PRINT 'Truncate succeeded - [T004_NON_Billable_Service] '
						END						
		-- STEP 4 --------------------------END

		-- STEP 5 --------------------------

		SET @cmd_NON_Billable_Service = N'
		INSERT INTO [Success].[dbo].[T004_NON_Billable_Service]
			(
			   [Location]
			  ,[Date_Encounter]
			  ,[Patient_No__Chart]
			  ,[Patient_Birth_Date__Chart]
			  ,[Examining_Clinician]
			  ,[Chp_Encounter_Id]
			  ,[Billable_Encounter_ID]
			  ,[Reason_for_Encounter]
			  ,[Encounter_Type]
			  ,[Encounter_Count]
			  ,[Age_as_of_End_Of_Month]
			  ,[Adult]
			)
		SELECT 
			   [Location]
			  ,[Date Encounter]
			  ,[Patient # (Chart)]
			  ,[Patient Birth Date (Chart)]
			  ,[Examining Clinician]
			  ,[Chp Encounter Id]
			  ,[Billable Encounter ID]
			  ,[Reason for Encounter]
			  ,[Encounter Type]
			  ,[Encounter Count]
			  , (0 + Convert(Char(8),Convert(datetime,' + @AsOfEndOfMonth + ',101),112) - Convert(Char(8),[Patient Birth Date (Chart)],112)) / 10000 as Age_as_of_End_Of_Month
			  , (SELECT     ''TheCalculation'' = CASE 
													WHEN
														( ((0 + Convert(Char(8),Convert(datetime,' + @AsOfEndOfMonth + ',101),112) - Convert(Char(8),[Patient Birth Date (Chart)],112)) / 10000) >= 18 )
													   THEN 1 
													ELSE 0 
												END) as Adult
		FROM [Success].[dbo].[' + @table_name_NON_Billable_Service_SOURCE +']'


			EXEC sp_executesql @stmt = @cmd_NON_Billable_Service

					IF @@ERROR <> 0
						BEGIN
							PRINT 'Insert into [T004_NON_Billable_Service] failed from: ' + @table_name_NON_Billable_Service_SOURCE
						END
					ELSE
						BEGIN
							PRINT 'Insert into [T004_NON_Billable_Service] SUCCEEDED from: ' + @table_name_NON_Billable_Service_SOURCE
						END
		-- STEP 5 --------------------------END

		-- STEP 6 --------------------------

		SET @cmd_ARCHIVE_NON_Billable_Service = N'
		INSERT INTO [Success].[dbo].[ARCHIVE_T004_NON_Billable_Service]
			(
			   [Location]
			  ,[Date_Encounter]
			  ,[Patient_No__Chart]
			  ,[Patient_Birth_Date__Chart]
			  ,[Examining_Clinician]
			  ,[Chp_Encounter_Id]
			  ,[Billable_Encounter_ID]
			  ,[Reason_for_Encounter]
			  ,[Encounter_Type]
			  ,[Encounter_Count]
			  ,[Age_as_of_End_Of_Month]
			  ,[Adult]
			)
		SELECT 
			   [Location]
			  ,[Date Encounter]
			  ,[Patient # (Chart)]
			  ,[Patient Birth Date (Chart)]
			  ,[Examining Clinician]
			  ,[Chp Encounter Id]
			  ,[Billable Encounter ID]
			  ,[Reason for Encounter]
			  ,[Encounter Type]
			  ,[Encounter Count]
			  , (0 + Convert(Char(8),Convert(datetime,' + @AsOfEndOfMonth + ',101),112) - Convert(Char(8),[Patient Birth Date (Chart)],112)) / 10000 as Age_as_of_End_Of_Month
			  , (SELECT     ''TheCalculation'' = CASE 
													WHEN
														( ((0 + Convert(Char(8),Convert(datetime,' + @AsOfEndOfMonth + ',101),112) - Convert(Char(8),[Patient Birth Date (Chart)],112)) / 10000) >= 18 )
													   THEN 1 
													ELSE 0 
												END) as Adult
		FROM [Success].[dbo].[' + @table_name_NON_Billable_Service_SOURCE +']'


			EXEC sp_executesql @stmt = @cmd_ARCHIVE_NON_Billable_Service

					IF @@ERROR <> 0
						BEGIN
							PRINT 'Insert into [ARCHIVE_T004_NON_Billable_Service] failed from: ' + @table_name_NON_Billable_Service_SOURCE
						END
					ELSE
						BEGIN
							PRINT 'Insert into [ARCHIVE_T004_NON_Billable_Service] SUCCEEDED from: ' + @table_name_NON_Billable_Service_SOURCE
						END
		-- STEP 5 --------------------------END


		END TRY


		BEGIN CATCH --*******************************************************************START



		SELECT 
			ERROR_NUMBER() AS ErrorNumber
			,ERROR_SEVERITY() AS ErrorSeverity
			,ERROR_STATE() AS ErrorState
			,ERROR_PROCEDURE() AS ErrorProcedure
			,ERROR_LINE() AS ErrorLine
			,ERROR_MESSAGE() AS ErrorMessage;

			IF @@TRANCOUNT > 0
				ROLLBACK TRANSACTION;
		END CATCH--*******************************************************************END


IF @@TRANCOUNT > 0
    COMMIT TRANSACTION


-- Show results

SELECT count(*) as T003_Billable_Service
  FROM [Success].[dbo].[T003_Billable_Service]


SELECT count(*) AS ARCHIVE_T003_Billable_Service
  FROM [Success].[dbo].[ARCHIVE_T003_Billable_Service]


SELECT count(*) AS T004_NON_Billable_Service
  FROM [Success].[dbo].[T004_NON_Billable_Service]


  SELECT count(*) AS ARCHIVE_T004_NON_Billable_Service
  FROM [Success].[dbo].[ARCHIVE_T004_NON_Billable_Service]

  SELECT TOP (10) *
  FROM [Success].[dbo].[T003_Billable_Service]

    SELECT TOP (10) *
  FROM [Success].[dbo].[T004_NON_Billable_Service]