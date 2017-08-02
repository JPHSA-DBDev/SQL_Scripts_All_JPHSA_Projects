--p_0021_SP_004_Q_step_3_v0.sql
--===========================================================================
/* 	
 
	DESCIPTION: Check Assumptions
			1] There should be just two [Office_Location] present in the table [T003_All_Monthly_Billable_Services_IDR_ARCHIVE]:
				--WB JeffCare
				--EB JeffCare
			2] No records in [T003_All_Monthly_Billable_Services_IDR_ARCHIVE] should have a null ‘LOC’ field
			There should be two values for NBTYPE in [zzz_p0021_5_Q_NonBillServices_for_IDR]
			3] The last pane of data is just to confirm that there is data. Nothing needs to be done, unless it is empty.

 	NOTE: Generates:
			dbo.zzz_p0021_6_for_Analysis_of_Part_Q

	==============> YOU MUST SET THE begin and end data for the Quarter <==================== 

	Created: 4/6/2012
	By: glenn garson

*/


USE Success
GO


--================================================================== Variables
DECLARE @BeginDate_Quarter as date
DECLARE @EndDate_Quarter as date
SELECT @BeginDate_Quarter = '07-01-2016'
SELECT @EndDate_Quarter = '03-31-2017'	


--==================================================================

IF OBJECT_ID('dbo.zzz_p0021_6_for_Analysis_of_Part_Q') IS NOT NULL
    DROP TABLE dbo.zzz_p0021_6_for_Analysis_of_Part_Q
--==============================================================
--==============================================================================================
SELECT 'There should be just two [Office_Location] present in the table [T003_All_Monthly_Billable_Services_IDR_ARCHIVE]'

SELECT  [Office_Location], count(*) as theCount
From [T003_All_Monthly_Billable_Services_IDR_ARCHIVE]
Group By [Office_Location]
--==============================================================================================
SELECT 'No records in [T003_All_Monthly_Billable_Services_IDR_ARCHIVE] should have a null ‘LOC’ field'

SELECT  [LOC], count(*) as theCount
From [T003_All_Monthly_Billable_Services_IDR_ARCHIVE]
Group By [LOC]
--==============================================================================================

 --Confirm that NonBillable_Type exist
--T004_All_Monthly_NonBillable_Services_IDR  {<== NonBillable_Type is now in here}
--zzz_p0021_5_Q_NonBillServices_for_IDR		 {<== NonBillable_Type is NOT in here}
;WITH CTE_All
AS
(
		SELECT     
					t3.[Patient_No],
					t3.[Patient_Birth_Date], 
					t3.[Check-In_Day],'Lab Orders (Count as 1 Svc)' as svc, 
					t3.loc, 
					t3.[Bill_Provider_Name], 
					t1.Type,
					t3.[Adult]
		FROM         
					dbo.T003_All_Monthly_Billable_Services_IDR_ARCHIVE t3 
					INNER JOIN
					dbo.T001_Provider_Information_IDR t1 
					ON t3.[Bill_Provider_Name] = t1.ProviderName
		WHERE     
					(t3.[CPT_Code] LIKE '8%')
					AND
					(T3.[Check-In_Day] >= @BeginDate_Quarter)
					AND
					(T3.[Check-In_Day]   <= @EndDate_Quarter)
		GROUP BY 
					t3.[Patient_No], 
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
					dbo.T003_All_Monthly_Billable_Services_IDR_ARCHIVE t3 
					INNER JOIN
					dbo.T001_Provider_Information_IDR t1 
					ON t3.[Bill_Provider_Name] = t1.ProviderName
		WHERE     
					(t3.[CPT_Code] NOT LIKE '8%')
					AND
					(T3.[Check-In_Day] >= @BeginDate_Quarter)
					AND
					(T3.[Check-In_Day]   <= @EndDate_Quarter)

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
					dbo.zzz_p0021_5_Q_NonBillServices_for_IDR z2 
					INNER JOIN
					dbo.T001_Provider_Information_IDR t1 
					ON z2.[Examining_Clinician] = t1.ProviderName
		WHERE
					(z2.[Date_Encounter] >= @BeginDate_Quarter)
					AND
					(z2.[Date_Encounter]   <= @EndDate_Quarter)
)
SELECT  *
INTO zzz_p0021_6_for_Analysis_of_Part_Q
FROM CTE_All

--==============================================================================================

SELECT top(10) * FROM zzz_p0021_6_for_Analysis_of_Part_Q