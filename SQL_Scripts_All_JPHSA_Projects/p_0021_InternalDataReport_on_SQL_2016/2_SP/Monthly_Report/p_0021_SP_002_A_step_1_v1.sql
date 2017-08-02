--p_0021_SP_002_A_step_1_v1.sql
--===========================================================================
/* 	
 
	DESCIPTION: This first deletes, then populates the [zzz_p0021_2_NonBillServices_for_IDR] table
				Then checks for missing providers, and if there are any it populates them into zzz_p0021_3_Missing_Providers

				LOCATION: EJ, WJ
				Type: PC, BH

	This script also puts the list of un-recognized providers in the table [zzz_p0021_3_Providers_To_ignore]
		Any provider names in that list will be appended to the list of providers in [T005_Providers_to_exclude_IDR] in the next script.
		
	YOU MUST MANUALLY DELETE the records for providers from [zzz_p0021_3_Missing_Providers] if you do not want them added to [T001_Provider_Information_IDR],
		IF YOU DO LEAVE THEM IN THAT TABLE then you have to populate the missing info. 
		if you see their name in the column [NameToExclude] YOU MUST MANUALLY DELETE THEM FROM THE TABLE [zzz_p0021_3_Missing_Providers]

		To prevent a provider from being ignored, just remove it's record from the table [T005_Providers_to_exclude_IDR]

		
	The only thing that happens when you leave a provider in the table [zzz_p0021_3_Providers_To_ignore] is that they are appended to the table [T005_Providers_to_exclude_IDR]
		Then in future runs any provider in that table is highlighted by putting their name in the [NameToExclude] field, HOWEVER if you don't remove 
		them from the table [zzz_p0021_3_Missing_Providers] they would still be included in the analysis. NOTE: that the transaction would fail in the next
		script if those providers missing data is not manually provided, that serves as a safety net for a user mistake

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

IF OBJECT_ID('dbo.zzz_p0021_3_Providers_To_ignore') IS NOT NULL
    DROP TABLE dbo.zzz_p0021_3_Providers_To_ignore
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
	dbo.zzz_T004_current_NonBillable_Services_IDR T4 
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

-- Mark the missing providers to show which are already excluded 

SELECT 'REMEMBER TO Go In and Manually populate the missing columns in Table [zzz_p0021_3_Missing_Providers] BEFORE running the next script, OR DELETE the records if they should not be included in the analysis'

SELECT 
		m.ProviderName,
		m.LOCATION,
		m.Type,
		e.ProviderName as NameToExclude
FROM 
		zzz_p0021_3_Missing_Providers m
		Left Outer Join
		T005_Providers_to_exclude_IDR e
		ON m.ProviderName = e.ProviderName

-- Just show the providers to ignore that are not already excluded
SELECT 'YOU MUST DELETE the records for providers, if you see their name in the column [NameToExclude] in order for them to be excluded from future analysis'
Select m.ProviderName 
into zzz_p0021_3_Providers_To_ignore
From 
		zzz_p0021_3_Missing_Providers m
		LEFT OUTER JOIN
		T005_Providers_to_exclude_IDR e
		ON m.ProviderName = e.ProviderName
WHERE e.ProviderName is NULL



SELECT 'All providers in table [zzz_p0021_3_Providers_To_ignore] will be added to [T005_Providers_to_exclude] and will not be included in the analysis'

SELECT * FROM zzz_p0021_3_Providers_To_ignore