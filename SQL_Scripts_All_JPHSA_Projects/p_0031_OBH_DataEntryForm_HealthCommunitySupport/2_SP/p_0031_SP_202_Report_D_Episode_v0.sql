--p_0031_SP_202_Report_D_Episode_v0.sql
/*
	************************************************************************************
	NOTE: 
	Uses: 
	Created: 07/18/2017
	By: glenn garson
	************************************************************************************
*/
use OBH_DATA_REVIEW  --WAREHOUSE_DEV
go

--================================================	
DECLARE @SearchString nvarchar(100)
SET @SearchString = ''
--================================================
    
--ALTER Procedure p_0031_SP_202_Report_D_Episode(
--		 @SearchString as NVARCHAR(100)                        	
--	)

--	as

--=============================================================================================================================

;WITH cte_D_Episode_ALL
AS
(

SELECT 
		d.TheDataSource
		, d.NAME_L
		, d.NAME_M
		, d.NAME_F
		, d.DOB

		--=======================================================
		
		, e.Archive_flag as [Episode_Archive_flag]
		, e.Episode_PK
		, e.Demo_FK as [Episode_Demo_FK]
		, e.ASSIGN_PV
		, e.ASSESS_DT
		--, e.PROGRAM_TYPE
		--
		,(
				Select [bbb_LIST_Lookups].ValueLabel 
				From bbb_LIST_Lookups
				where (
						([bbb_LIST_Lookups].LK_ID=12) 
						and 
						([bbb_LIST_Lookups].Value= e.PROGRAM_TYPE)
						)
		) as PROGRAM_TYPE			
		--
		--, e.SERV_PROGRAM
		--
		,(
				Select [bbb_LIST_Lookups].ValueLabel 
				From bbb_LIST_Lookups
				where (
						([bbb_LIST_Lookups].LK_ID=13) 
						and 
						([bbb_LIST_Lookups].Value= e.SERV_PROGRAM)
						)
		) as SERV_PROGRAM			
		--
		--, e.AS_TP
		--
		,(
				Select [bbb_LIST_Lookups].ValueLabel 
				From bbb_LIST_Lookups
				where (
						([bbb_LIST_Lookups].LK_ID=14) 
						and 
						([bbb_LIST_Lookups].Value= e.AS_TP)
						)
		) as [ASSESSMENT_TYPE]			
		--
		--, e.CONT_RES
		--
		,(
				Select [bbb_LIST_Lookups].ValueLabel 
				From bbb_LIST_Lookups
				where (
						([bbb_LIST_Lookups].LK_ID=15) 
						and 
						([bbb_LIST_Lookups].Value= e.CONT_RES)
						)
		) as [REASON_FIRST_CONTACT]			
		--
		--, e.DISPOSITON
		--
		,(
				Select [bbb_LIST_Lookups].ValueLabel 
				From bbb_LIST_Lookups
				where (
						([bbb_LIST_Lookups].LK_ID=16) 
						and 
						([bbb_LIST_Lookups].Value= e.DISPOSITON)
						)
		) as [OUTCOME_OF_INITIAL_CONTACT]			
		--
		--, e.SP_SMI
		--
		,(
				Select [bbb_LIST_Lookups].ValueLabel 
				From bbb_LIST_Lookups
				where (
						([bbb_LIST_Lookups].LK_ID=17) 
						and 
						([bbb_LIST_Lookups].Value= e.SP_SMI)
						)
		) as [SPECIAL_POPULATION_SMI]			
		--
		--, e.METHADONE
		--
		,(
				Select [bbb_LIST_Lookups].ValueLabel 
				From bbb_LIST_Lookups
				where (
						([bbb_LIST_Lookups].LK_ID=18) 
						and 
						([bbb_LIST_Lookups].Value= e.METHADONE)
						)
		) as METHADONE			
		--
		--, e.ARRESTS
		--
		,(
				Select [bbb_LIST_Lookups].ValueLabel 
				From bbb_LIST_Lookups
				where (
						([bbb_LIST_Lookups].LK_ID=39) 
						and 
						([bbb_LIST_Lookups].Value= e.ARRESTS)
						)
		) as ARRESTS			
		--
		--, e.ENCOUNTERS
		--
		,(
				Select [bbb_LIST_Lookups].ValueLabel 
				From bbb_LIST_Lookups
				where (
						([bbb_LIST_Lookups].LK_ID=39) 
						and 
						([bbb_LIST_Lookups].Value= e.ENCOUNTERS)
						)
		) as [IN_PAST_30 DAYS__POLICE_OFFICER_TALKED]			
		--
		--, e.FREQ_ATTEND
		--
		,(
				Select [bbb_LIST_Lookups].ValueLabel 
				From bbb_LIST_Lookups
				where (
						([bbb_LIST_Lookups].LK_ID=19) 
						and 
						([bbb_LIST_Lookups].Value= e.FREQ_ATTEND)
						)
		) as [No_of_times_SELF_HELP_ACTIVITIES_IN_PAST_30_DAYS]			
		--
		--, e.TERMTYPE
		--
		,(
				Select [bbb_LIST_Lookups].ValueLabel 
				From bbb_LIST_Lookups
				where (
						([bbb_LIST_Lookups].LK_ID=20) 
						and 
						([bbb_LIST_Lookups].Value= e.TERMTYPE)
						)
		) as [REASON_FOR_TERMINATION]			
		--
		--, e.REF_SRCE
		--
		,(
				Select [bbb_LIST_Lookups].ValueLabel 
				From bbb_LIST_Lookups
				where (
						([bbb_LIST_Lookups].LK_ID=21) 
						and 
						([bbb_LIST_Lookups].Value= e.REF_SRCE)
						)
		) as [SOURCE_OF_REFERRAL]			
		--
		--, e.MARITAL_STATUS
		--
		,(
				Select [bbb_LIST_Lookups].ValueLabel 
				From bbb_LIST_Lookups
				where (
						([bbb_LIST_Lookups].LK_ID=22) 
						and 
						([bbb_LIST_Lookups].Value= e.MARITAL_STATUS)
						)
		) as MARITAL_STATUS			
		--
		--, e.LEGAL_STATUS
		--
		,(
				Select [bbb_LIST_Lookups].ValueLabel 
				From bbb_LIST_Lookups
				where (
						([bbb_LIST_Lookups].LK_ID=23) 
						and 
						([bbb_LIST_Lookups].Value= e.LEGAL_STATUS)
						)
		) as LEGAL_STATUS			
		--
		--, e.ED_LEVEL
		--
		,(
				Select [bbb_LIST_Lookups].ValueLabel 
				From bbb_LIST_Lookups
				where (
						([bbb_LIST_Lookups].LK_ID=4) 
						and 
						([bbb_LIST_Lookups].Value= e.ED_LEVEL)
						)
		) as ED_LEVEL			
		--
		--, e.EMPL_ST
		--
		,(
				Select [bbb_LIST_Lookups].ValueLabel 
				From bbb_LIST_Lookups
				where (
						([bbb_LIST_Lookups].LK_ID=24) 
						and 
						([bbb_LIST_Lookups].Value= e.EMPL_ST)
						)
		) as EMPL_ST			
		--
		--, e.RES_TYPE
		--
		,(
				Select [bbb_LIST_Lookups].ValueLabel 
				From bbb_LIST_Lookups
				where (
						([bbb_LIST_Lookups].LK_ID=25) 
						and 
						([bbb_LIST_Lookups].Value= e.RES_TYPE)
						)
		) as [TYPE OF RESIDENCE]			
		--
		--, e.HSE_COMP
		--
		,(
				Select [bbb_LIST_Lookups].ValueLabel 
				From bbb_LIST_Lookups
				where (
						([bbb_LIST_Lookups].LK_ID=26) 
						and 
						([bbb_LIST_Lookups].Value= e.HSE_COMP)
						)
		) as [HOUSEHOLD COMPOSITION]			
		--
		--, e.PRIMARY_TARGET_GROUP
		--
		,(
				Select [bbb_LIST_Lookups].ValueLabel 
				From bbb_LIST_Lookups
				where (
						([bbb_LIST_Lookups].LK_ID=27) 
						and 
						([bbb_LIST_Lookups].Value= e.PRIMARY_TARGET_GROUP)
						)
		) as PRIMARY_TARGET_GROUP			
		--
		--, e.CP_ALCOHOL
		--
		,(
				Select [bbb_LIST_Lookups].ValueLabel 
				From bbb_LIST_Lookups
				where (
						([bbb_LIST_Lookups].LK_ID=28) 
						and 
						([bbb_LIST_Lookups].Value= e.CP_ALCOHOL)
						)
		) as CP_ALCOHOL			
		--
		--, e.CP_DRUGS
		--
		,(
				Select [bbb_LIST_Lookups].ValueLabel 
				From bbb_LIST_Lookups
				where (
						([bbb_LIST_Lookups].LK_ID=29) 
						and 
						([bbb_LIST_Lookups].Value= e.CP_DRUGS)
						)
		) as CP_DRUGS			
		--
		--, e.ADDICTIONTYPE
		--
		,(
				Select [bbb_LIST_Lookups].ValueLabel 
				From bbb_LIST_Lookups
				where (
						([bbb_LIST_Lookups].LK_ID=30) 
						and 
						([bbb_LIST_Lookups].Value= e.ADDICTIONTYPE)
						)
		) as ADDICTIONTYPE			
		--
		--, e.PRIOR_MH
		--
		,(
				Select [bbb_LIST_Lookups].ValueLabel 
				From bbb_LIST_Lookups
				where (
						([bbb_LIST_Lookups].LK_ID=31) 
						and 
						([bbb_LIST_Lookups].Value= e.PRIOR_MH)
						)
		) as PRIOR_MH			
		--
		--, e.PRIOR_TX_EPISODES
		--
		,(
				Select [bbb_LIST_Lookups].ValueLabel 
				From bbb_LIST_Lookups
				where (
						([bbb_LIST_Lookups].LK_ID=38) 
						and 
						([bbb_LIST_Lookups].Value= e.PRIOR_TX_EPISODES)
						)
		) as PRIOR_TX_EPISODES			
		--
		--, e.DRUG_1
		--
		,(
				Select [bbb_LIST_Lookups].ValueLabel 
				From bbb_LIST_Lookups
				where (
						([bbb_LIST_Lookups].LK_ID=32) 
						and 
						([bbb_LIST_Lookups].Value= e.DRUG_1)
						)
		) as DRUG_1
		--
		, e.DRUG_1_AGE
		--, e.DRUG_1_FREQ
		--
		,(
				Select [bbb_LIST_Lookups].ValueLabel 
				From bbb_LIST_Lookups
				where (
						([bbb_LIST_Lookups].LK_ID=33) 
						and 
						([bbb_LIST_Lookups].Value= e.DRUG_1_FREQ)
						)
		) as DRUG_1_FREQ
		--
		--, e.DRUG_1_RTE
		--
		,(
				Select [bbb_LIST_Lookups].ValueLabel 
				From bbb_LIST_Lookups
				where (
						([bbb_LIST_Lookups].LK_ID=34) 
						and 
						([bbb_LIST_Lookups].Value= e.DRUG_1_RTE)
						)
		) as DRUG_1_RTE
		--
		--, e.DRUG_2
		--
		,(
				Select [bbb_LIST_Lookups].ValueLabel 
				From bbb_LIST_Lookups
				where (
						([bbb_LIST_Lookups].LK_ID=35) 
						and 
						([bbb_LIST_Lookups].Value= e.DRUG_2)
						)
		) as DRUG_2
		--
		, e.DRUG_2_AGE
		--, e.DRUG_2_FREQ
		--
		,(
				Select [bbb_LIST_Lookups].ValueLabel 
				From bbb_LIST_Lookups
				where (
						([bbb_LIST_Lookups].LK_ID=33) 
						and 
						([bbb_LIST_Lookups].Value= e.DRUG_2_FREQ)
						)
		) as DRUG_2_FREQ
		--
		--, e.DRUG_2_RTE
		--
		,(
				Select [bbb_LIST_Lookups].ValueLabel 
				From bbb_LIST_Lookups
				where (
						([bbb_LIST_Lookups].LK_ID=34) 
						and 
						([bbb_LIST_Lookups].Value= e.DRUG_2_RTE)
						)
		) as DRUG_2_RTE
		--
		--, e.DRUG_3
		--
		,(
				Select [bbb_LIST_Lookups].ValueLabel 
				From bbb_LIST_Lookups
				where (
						([bbb_LIST_Lookups].LK_ID=35) 
						and 
						([bbb_LIST_Lookups].Value= e.DRUG_3)
						)
		) as DRUG_3
		--
		, e.DRUG_3_AGE
		--, e.DRUG_3_FREQ
		--
		,(
				Select [bbb_LIST_Lookups].ValueLabel 
				From bbb_LIST_Lookups
				where (
						([bbb_LIST_Lookups].LK_ID=33) 
						and 
						([bbb_LIST_Lookups].Value= e.DRUG_3_FREQ)
						)
		) as DRUG_3_FREQ
		--
		--, e.DRUG_3_RTE
		--
		,(
				Select [bbb_LIST_Lookups].ValueLabel 
				From bbb_LIST_Lookups
				where (
						([bbb_LIST_Lookups].LK_ID=34) 
						and 
						([bbb_LIST_Lookups].Value= e.DRUG_3_RTE)
						)
		) as DRUG_3_RTE
		--
		
		--===========================================================


		--, e.DX_PRIMARY
		--
		,(
				Select [bbb_LIST_Lookups].ValueLabel 
				From bbb_LIST_Lookups
				where (
						([bbb_LIST_Lookups].LK_ID=1) 
						and 
						([bbb_LIST_Lookups].Value= e.DX_PRIMARY)
						)
		) as DX_PRIMARY
		--
		--, e.DX_SEC
		--
		,(
				Select [bbb_LIST_Lookups].ValueLabel 
				From bbb_LIST_Lookups
				where (
						([bbb_LIST_Lookups].LK_ID=1) 
						and 
						([bbb_LIST_Lookups].Value= e.DX_SEC)
						)
		) as DX_SEC
		--
		--, e.DX_3
		--
		,(
				Select [bbb_LIST_Lookups].ValueLabel 
				From bbb_LIST_Lookups
				where (
						([bbb_LIST_Lookups].LK_ID=1) 
						and 
						([bbb_LIST_Lookups].Value= e.DX_3)
						)
		) as DX_3
		--
		--, e.DISABILITY_1
		--
		,(
				Select [bbb_LIST_Lookups].ValueLabel 
				From bbb_LIST_Lookups
				where (
						([bbb_LIST_Lookups].LK_ID=36) 
						and 
						([bbb_LIST_Lookups].Value= e.DISABILITY_1)
						)
		) as DISABILITY_1
		--
		--, e.Archived_LAST_flag

		----===============================================================
FROM
	zzz_T001_ALL d
	LEFT OUTER JOIN
	zzz_q013_ALL e
	ON 
		(
			d.DEMO_PK = e.Demo_FK
			AND
			d.TheDataSource = e.TheDataSource
		)
)



SELECT * 
from cte_D_Episode_ALL
WHERE

		(
			(
				(LEN(@SearchString) = 0) 
				OR 
				(@SearchString IS NULL)							
			)
			OR
			(
					(RTRIM(LTRIM(UPPER(NAME_L))) like '%' +  RTRIM(LTRIM(UPPER(@SearchString))) + '%')		
					OR (RTRIM(LTRIM(UPPER(NAME_F))) like '%' +  RTRIM(LTRIM(UPPER(@SearchString))) + '%')			
					--OR (RTRIM(LTRIM(UPPER(SSN))) like '%' +  RTRIM(LTRIM(UPPER(@SearchString))) + '%' )	
			)
		)
ORDER BY TheDataSource, NAME_L, NAME_F, ASSESS_DT ASC