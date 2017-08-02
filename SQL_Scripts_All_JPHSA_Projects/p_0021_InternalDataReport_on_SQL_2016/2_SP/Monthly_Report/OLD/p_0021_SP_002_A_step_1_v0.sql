--p_0021_SP_002_A_step_1_v0.sql
--===========================================================================
/* 	
 
	DESCIPTION: This first deletes, then populates the [zzz_p0021_2_NonBillServices_for_IDR] table
				Then checks for missing providers, and if there are any it populates them into zzz_p0021_3_Missing_Providers
				The user should check that last table, and if there are any records the user should populate the missing data, or delete the records with the missing data
				LOCATION: EJ, WJ
				Type: PC, BH
 	NOTE: 
			Create:  zzz_p0021_2_NonBillServices_for_IDR
			And generate the list of missing Providers then store in 
			zzz_p0021_3_Missing_Providers 
	Created: 3/17/2012
	By: glenn garson

*/
--===========================================================================

USE Success
GO



IF OBJECT_ID('dbo.zzz_p0021_2_NonBillServices_for_IDR') IS NOT NULL
    DROP TABLE dbo.zzz_p0021_2_NonBillServices_for_IDR

IF OBJECT_ID('dbo.zzz_p0021_3_Missing_Providers') IS NOT NULL
    DROP TABLE dbo.zzz_p0021_3_Missing_Providers
--==============================================================
SELECT     
		T4.[Date_Encounter], 
		T4.[Patient_No__Chart], 
		T4.[Reason_for_Encounter], 
		T4.[Examining_Clinician],
		T4.[Patient_Birth_Date__Chart],
		T4.[NonBillable_Type],				--{<== added on 3/20/2017}
		T4.Adult		--{<== added on 3/20/2017}
		
into zzz_p0021_2_NonBillServices_for_IDR	
FROM         
	dbo.T004_All_Monthly_NonBillable_Services_IDR T4 
	INNER JOIN
    dbo.T002_NonBillServices_for_IDR_LOOKUP T2
	ON 
		T4.[Reason_for_Encounter] = T2.[Encounter_Reasons]

WHERE     (T2.NB = 'Y')

--==============================================================

SELECT     
		a.[Examining_Clinician] AS ProviderName
		--, t1.ProviderName
		, '  ' as LOCATION
		, '  ' as Type
into zzz_p0021_3_Missing_Providers
FROM 
		dbo.zzz_p0021_2_NonBillServices_for_IDR a 
		LEFT OUTER JOIN
		dbo.T001_Provider_Information_IDR t1
 		ON a.[Examining_Clinician] = t1.ProviderName

WHERE t1.ProviderName is null
GROUP BY   a.[Examining_Clinician], t1.ProviderName

SELECT 'IF there are any records then REMEMBER TO Go In and Manually populate the missing information in Table [zzz_p0021_3_Missing_Providers] BEFORE running the next script'

SELECT * FROM zzz_p0021_3_Missing_Providers