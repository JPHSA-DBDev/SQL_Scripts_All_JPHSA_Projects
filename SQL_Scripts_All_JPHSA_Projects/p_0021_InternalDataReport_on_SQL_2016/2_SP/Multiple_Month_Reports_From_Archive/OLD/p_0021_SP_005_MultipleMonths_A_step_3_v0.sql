--p_0021_SP_005_MultipleMonths_A_step_3_v0.sql
--===========================================================================
/* 	
 	SET THE DATE RANGE FIRST


	DESCIPTION: Check Assumptions should have been done in the monthly scripts.
			1] There should be just two [Office_Location] present in the table [T003_ARCHIVE_Billable_Services_IDR]:
				--WB JeffCare
				--EB JeffCare
			2] No records in [T003_ARCHIVE_Billable_Services_IDR] should have a null ‘LOC’ field
			There should be two values for NBTYPE in [T004_ARCHIVE_NonBillable_Services_IDR], 
				but this should have been checked when the monthly script was run.
			3] The last pane of data is just to confirm that there is data. Nothing needs to be done, unless it is empty.

 	NOTE: Generates:
			dbo.zzz_p0021_24_MultipleMonths_for_Analysis_of_Part_A

	Created: 3/20/2012
	Modified: 4/19/2017 for multiple months
	By: glenn garson

*/
--===========================================================================

USE Success
GO
--=====================================set these before running script
DECLARE @BeginDate_DateRange as date
DECLARE @EndDate_DateRange as date
SELECT @BeginDate_DateRange = '07-01-2016'
SELECT @EndDate_DateRange = '07-31-2016'	
--==========================================================================



IF OBJECT_ID('dbo.zzz_p0021_24_MultipleMonths_for_Analysis_of_Part_A') IS NOT NULL
    DROP TABLE dbo.zzz_p0021_24_MultipleMonths_for_Analysis_of_Part_A
--==============================================================

--The check for assumptions was removed from this script b/c it is assumed that the 
-- monthly scripts, which check those assumptions, were already run.

--==============================================================================================

;WITH CTE_All
AS
(
		SELECT     t3.[Patient_No],
					--t3.[Patient_No],
					t3.[Patient_Birth_Date],
					--t3.[Patient_Birth_Date],
					t3.[Check-In_Day],
					'Lab Orders (Count as 1 Svc)' as svc, 
					t3.loc, 
					t3.[Bill_Provider_Name], 
					t1.Type,
					t3.[Adult]
		FROM         
					--dbo.T003_ARCHIVE_Billable_Services_IDR t3 
					zzz_T003_current_Billable_Services_IDR t3
					INNER JOIN
					dbo.T001_Provider_Information_IDR t1 
					ON t3.[Bill_Provider_Name] = t1.ProviderName
		WHERE     
					(t3.[CPT_Code] LIKE '8%')
					and
					([Check-In_Day]  >= @BeginDate_DateRange)
					AND
					([Check-In_Day]  <= @EndDate_DateRange)
		GROUP BY 
					t3.[Patient_No],
					--t3.[Patient_No], 
					t3.[Patient_Birth_Date],
					t3.[Check-In_Day], 
					t3.loc, 
					t3.[Bill_Provider_Name], 
					t1.Type,
					t3.[Adult]

UNION ALL
		SELECT     
					t3.[Patient_No],
					t3.[Patient_Birth_Date], 
					t3.[Check-In_Day], 
					[CPT_Description]as svc,
					t3.loc, 
					t3.[Bill_Provider_Name], 
					t1.Type,
					t3.[Adult]
		FROM         
					--dbo.T003_ARCHIVE_Billable_Services_IDR t3 
					zzz_T003_current_Billable_Services_IDR t3
					INNER JOIN
					dbo.T001_Provider_Information_IDR t1 
					ON t3.[Bill_Provider_Name] = t1.ProviderName
		WHERE     
					(t3.[CPT_Code] NOT LIKE '8%')
					and
					([Check-In_Day]  >= @BeginDate_DateRange)
					AND
					([Check-In_Day]  <= @EndDate_DateRange)

UNION ALL
		SELECT     
					z2.[Patient_No__Chart], 
					z2.[Patient_Birth_Date__Chart],
					z2.[Date_Encounter],
					[Reason_for_Encounter] as svc, 
					t1.LOCATION, 
					z2.[Examining_Clinician], 
					z2.NonBillable_Type,
					z2.[Adult]
		FROM         
					zzz_p0021_22_NonBillServices_for_IDR z2
					--dbo.zzz_T004_current_NonBillable_Services_IDR z2 
					INNER JOIN
					dbo.T001_Provider_Information_IDR t1 
					ON z2.[Examining_Clinician] = t1.ProviderName
)
SELECT  *
INTO zzz_p0021_24_MultipleMonths_for_Analysis_of_Part_A
FROM CTE_All

--==============================================================================================

SELECT top(10) * FROM zzz_p0021_24_MultipleMonths_for_Analysis_of_Part_A

SELECT count(*) as NumberOfRecordsForAnalysis FROM zzz_p0021_24_MultipleMonths_for_Analysis_of_Part_A