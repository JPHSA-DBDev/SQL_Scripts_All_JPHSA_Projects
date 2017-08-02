--p_0021_SP_004_YTD_step_1_v1.sql
--===========================================================================
/* 	
 
	DESCIPTION: This first deletes, then populates the [zzz_p0021_15_YTD_NonBillServices_for_IDR] table
				This is the YTD report, and it assumes that all the Monthly reports were already run, 
					and it assumes that the missing providers have already been taken care of.
								
				LOCATION: EJ, WJ
				Type: PC, BH
 	NOTE: 
			Create:  zzz_p0021_15_YTD_NonBillServices_for_IDRs 

	==============> YOU MUST SET THE begin and end data for the Quarter <==================== 

	Created: 4/6/2012
	Modified: 4/17/2017
	By: glenn garson

*/
--===========================================================================

USE Success
GO
--================================================================== Variables
DECLARE @BeginDate_YTD as date
DECLARE @EndDate_YTD as date
SELECT @BeginDate_YTD = '07-01-2016'
SELECT @EndDate_YTD = '06-30-2017'	


--==================================================================
IF OBJECT_ID('dbo.zzz_p0021_15_YTD_NonBillServices_for_IDR') IS NOT NULL
    DROP TABLE dbo.zzz_p0021_15_YTD_NonBillServices_for_IDR

--==============================================================
SELECT     
		T4.[Date_Encounter], 
		T4.[Patient_No__Chart], 
		T4.[Reason_for_Encounter], 
		T4.[Examining_Clinician],
		T4.[Patient_Birth_Date__Chart],
		T4.[NonBillable_Type],				--{<== added on 3/20/2017}
		T4.Adult		--{<== added on 3/20/2017}
		
into zzz_p0021_15_YTD_NonBillServices_for_IDR	
FROM         
	dbo.T004_ARCHIVE_NonBillable_Services_IDR T4 
	INNER JOIN
    dbo.T002_NonBillServices_for_IDR_LOOKUP T2
	ON 
		T4.[Reason_for_Encounter] = T2.[Encounter_Reasons]

WHERE	(T2.NB = 'Y')
		AND
		(T4.[Date_Encounter]  >= @BeginDate_YTD)
		AND
		(T4.[Date_Encounter]  <= @EndDate_YTD)
		

--==============================================================

