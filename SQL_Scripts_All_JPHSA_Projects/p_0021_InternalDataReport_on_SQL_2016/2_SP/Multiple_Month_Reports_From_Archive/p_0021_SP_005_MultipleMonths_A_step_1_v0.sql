--p_0021_SP_005_MultipleMonths_A_step_1_v0.sql
--===========================================================================
/* 	
 	This version (MultipleMonths) assumes that all the data has been added to the ARCHIVE tables, 
		(using the script: p_0021_SP_001_INSERT_INTO_T003_T004_and_ARCHIVEs_from_uploaded_BillableServices_v6.sql)

	This version also assumes that the following scripts were run for a given month of data:
		p_0021_SP_002_A_step_1_v1.sql  AND p_0021_SP_002_A_step_2_v1.sql  (there fore all the providers have been taken care of)


	Created: 3/17/2012
	Modified: 4/19/2017 for multiple months
	By: glenn garson

*/
--===========================================================================
use Success
go

IF OBJECT_ID('dbo.zzz_p0021_22_NonBillServices_for_IDR') IS NOT NULL
    DROP TABLE dbo.zzz_p0021_22_NonBillServices_for_IDR

--==============================================================
SELECT     
		T4.[Date_Encounter], 
		T4.[Patient_No__Chart], 
		T4.[Reason_for_Encounter], 
		T4.[Examining_Clinician],
		T4.[Patient_Birth_Date__Chart],
		T4.[NonBillable_Type],				--{<== added on 3/20/2017}
		T4.Adult		--{<== added on 3/20/2017}
		,T4.Data_for_Month_MM   
		,T4.Data_for_Year_YYYY
		
into zzz_p0021_22_NonBillServices_for_IDR	
FROM         
	dbo.zzz_T004_current_NonBillable_Services_IDR T4 
	INNER JOIN
    dbo.T002_NonBillServices_for_IDR_LOOKUP T2
	ON 
		T4.[Reason_for_Encounter] = T2.[Encounter_Reasons]

WHERE     (T2.NB = 'Y')

--==============================================================