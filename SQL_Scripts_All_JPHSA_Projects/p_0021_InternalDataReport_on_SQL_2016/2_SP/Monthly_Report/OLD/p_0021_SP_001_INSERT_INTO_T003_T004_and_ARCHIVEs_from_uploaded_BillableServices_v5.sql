--p_0021_SP_001_INSERT_INTO_T003_T004_and_ARCHIVEs_from_uploaded_BillableServices_v5.sql
/*
	************************************************************************************
	This version assumes that it is ONLY using One specific month of data.
	NOTE: This takes the data that was uploaded from the Access Database (.mdb) to the SQL Server with the table name: [Billable_Service_YYYY_MM_DD]

			a) The data originates from Business Intelligence: https://bobi.ehsmed.com/BOE/BI 
			b) It is exported as Excel 2007
				it should not have the "Sum" row at the bottom
				it should not have the rows before the Column headers
				and the empty column 'A' should be deleted while in Excel
			c) The excel data should be imported into a .mdb Access Database, and then imported into SQL
				Import to ACCESS, from Excel, w/ no changes, and no primary key

		  The data in the SQL table [Billable_Service_YYYY_MM_DD] is appended to these tables in a transaction:

				[zzz_T003_current_Billable_Services_IDR]         {This table is truncated before the data is appended}
				[T003_ARCHIVE_Billable_Services_IDR]

				[zzz_T004_current_NonBillable_Services_IDR]       {This table is truncated before the data is appended}
				[T004_ARCHIVE_NonBillable_Services_IDR]
			
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
SELECT @AsOfEndOfMonth = '''02/28/2017'''

DECLARE @table_name_Billable_Service_SOURCE AS sysname
SET @table_name_Billable_Service_SOURCE = N'zzz_8_EHSBILL_FEBRUARY_2017'


DECLARE @table_name_NON_Billable_Service_SOURCE AS sysname
SET @table_name_NON_Billable_Service_SOURCE = N'zzz_8_EHSNONBILL_FEBRUARY_2017'

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
		TRUNCATE TABLE zzz_T003_current_Billable_Services_IDR

				----
				---- Check for errors
				----
				IF @@ERROR <> 0
					BEGIN
						PRINT 'Truncate failed - zzz_T003_current_Billable_Services_IDR'
					END
					ELSE
						BEGIN
							PRINT 'Truncate succeeded - zzz_T003_current_Billable_Services_IDR'
						END						
		-- STEP 1 --------------------------END


		-- STEP 2 --------------------------

		SET @cmd_Billable_Service = N'
		INSERT INTO [Success].[dbo].[zzz_T003_current_Billable_Services_IDR]
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
			  ,[LOC]
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
				,(SELECT     ''TheCalculation'' = 
							CASE 
								WHEN [Office Location]  = ''WB JeffCare''
										THEN ''WJ'' 
								WHEN [Office Location]  = ''EB JeffCare''
										THEN ''EJ''
								ELSE ''''
							END) as LOC
		FROM [Success].[dbo].[' + @table_name_Billable_Service_SOURCE +']'


			EXEC sp_executesql @stmt = @cmd_Billable_Service

					IF @@ERROR <> 0
						BEGIN
							PRINT 'Insert into [zzz_T003_current_Billable_Services_IDR] failed from: ' + @table_name_Billable_Service_SOURCE
						END
					ELSE
						BEGIN
							PRINT 'Insert into [zzz_T003_current_Billable_Services_IDR] SUCCEEDED from: ' + @table_name_Billable_Service_SOURCE
						END
		-- STEP 2 --------------------------END

		-- STEP 3 --------------------------

		SET @cmd_ARCHIVE_Billable_Service = N'
		INSERT INTO [Success].[dbo].[T003_ARCHIVE_Billable_Services_IDR]
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
			  ,[LOC]
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
				,(SELECT     ''TheCalculation'' = 
							CASE 
								WHEN [Office Location]  = ''WB JeffCare''
										THEN ''WJ'' 
								WHEN [Office Location]  = ''EB JeffCare''
										THEN ''EJ''
								ELSE ''''
							END) as LOC
		FROM [Success].[dbo].[' + @table_name_Billable_Service_SOURCE +']'


			EXEC sp_executesql @stmt = @cmd_ARCHIVE_Billable_Service

					IF @@ERROR <> 0
						BEGIN
							PRINT 'Insert into [T003_ARCHIVE_Billable_Services_IDR] failed from: ' + @table_name_Billable_Service_SOURCE
						END
					ELSE
						BEGIN
							PRINT 'Insert into [T003_ARCHIVE_Billable_Services_IDR] SUCCEEDED from: ' + @table_name_Billable_Service_SOURCE
						END
		-- STEP 3 --------------------------END


		-- STEP 4 --------------------------
		TRUNCATE TABLE [zzz_T004_current_NonBillable_Services_IDR]

				----
				---- Check for errors
				----
				IF @@ERROR <> 0
					BEGIN
						PRINT 'Truncate failed - [zzz_T004_current_NonBillable_Services_IDR]'
					END
					ELSE
						BEGIN
							PRINT 'Truncate succeeded - [zzz_T004_current_NonBillable_Services_IDR] '
						END						
		-- STEP 4 --------------------------END

		-- STEP 5 --------------------------

		SET @cmd_NON_Billable_Service = N'
		INSERT INTO [Success].[dbo].[zzz_T004_current_NonBillable_Services_IDR]
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
			  ,[NonBillable_Type]
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
				,(SELECT     ''TheCalculation'' = 
							CASE 
								WHEN [Reason for Encounter] in (
																''PC Care Coordination (Non-Billable)'',
																''PC Medication Refill (NB) '',
																''PC Care Planning'',
																''PC Nursing Education'',
																''PC Review of labs/radiologic info'',
																''PC Telephone Contact (Non-Billable)''
																)

										THEN ''PC''
								WHEN [Reason for Encounter] in (
																''BH Care Coordination (Non-Billable)'',
																''BH Medication Refill (NB) '',
																''BH Care Planning'',
																''BH Case Management (Non-Billable)'',
																''BH Review of labs/radiologic info'',
																''BH Screening Face to Face (NB)'',
																''BH Screening Phone (NB)'',
																''BH Telephone Contact (Non-Billable)'',
																''Medication Refill (NB)''

																)
										THEN ''BH''
								ELSE ''''
							END) as [NonBillable_Type]
		FROM [Success].[dbo].[' + @table_name_NON_Billable_Service_SOURCE +']'


			EXEC sp_executesql @stmt = @cmd_NON_Billable_Service

					IF @@ERROR <> 0
						BEGIN
							PRINT 'Insert into [zzz_T004_current_NonBillable_Services_IDR] failed from: ' + @table_name_NON_Billable_Service_SOURCE
						END
					ELSE
						BEGIN
							PRINT 'Insert into [zzz_T004_current_NonBillable_Services_IDR] SUCCEEDED from: ' + @table_name_NON_Billable_Service_SOURCE
						END
		-- STEP 5 --------------------------END

		-- STEP 6 --------------------------

		SET @cmd_ARCHIVE_NON_Billable_Service = N'
		INSERT INTO [Success].[dbo].[T004_ARCHIVE_NonBillable_Services_IDR]
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
			  ,[NonBillable_Type]
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
				,(SELECT     ''TheCalculation'' = 
							CASE 
								WHEN [Reason for Encounter] in (
																''PC Care Coordination (Non-Billable)'',
																''PC Medication Refill (NB) '',
																''PC Care Planning'',
																''PC Nursing Education'',
																''PC Review of labs/radiologic info'',
																''PC Telephone Contact (Non-Billable)''
																)

										THEN ''PC''
								WHEN [Reason for Encounter] in (
																''BH Care Coordination (Non-Billable)'',
																''BH Medication Refill (NB) '',
																''BH Care Planning'',
																''BH Case Management (Non-Billable)'',
																''BH Review of labs/radiologic info'',
																''BH Screening Face to Face (NB)'',
																''BH Screening Phone (NB)'',
																''BH Telephone Contact (Non-Billable)'',
																''Medication Refill (NB)''

																)
										THEN ''BH''
								ELSE ''''
							END) as [NonBillable_Type]
		FROM [Success].[dbo].[' + @table_name_NON_Billable_Service_SOURCE +']'


			EXEC sp_executesql @stmt = @cmd_ARCHIVE_NON_Billable_Service

					IF @@ERROR <> 0
						BEGIN
							PRINT 'Insert into [T004_ARCHIVE_NonBillable_Services_IDR] failed from: ' + @table_name_NON_Billable_Service_SOURCE
						END
					ELSE
						BEGIN
							PRINT 'Insert into [T004_ARCHIVE_NonBillable_Services_IDR] SUCCEEDED from: ' + @table_name_NON_Billable_Service_SOURCE
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

SELECT count(*) as zzz_T003_current_Billable_Services_IDR
  FROM [Success].[dbo].[zzz_T003_current_Billable_Services_IDR]


SELECT count(*) AS T003_ARCHIVE_Billable_Services_IDR
  FROM [Success].[dbo].[T003_ARCHIVE_Billable_Services_IDR]


SELECT count(*) AS zzz_T004_current_NonBillable_Services_IDR
  FROM [Success].[dbo].[zzz_T004_current_NonBillable_Services_IDR]


  SELECT count(*) AS T004_ARCHIVE_NonBillable_Services_IDR
  FROM [Success].[dbo].[T004_ARCHIVE_NonBillable_Services_IDR]

  SELECT TOP (10) *
  FROM [Success].[dbo].[zzz_T003_current_Billable_Services_IDR]

    SELECT TOP (10) *
  FROM [Success].[dbo].[zzz_T004_current_NonBillable_Services_IDR]