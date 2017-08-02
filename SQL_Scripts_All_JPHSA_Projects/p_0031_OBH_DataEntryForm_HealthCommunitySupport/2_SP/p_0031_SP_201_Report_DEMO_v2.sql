---p_0031_SP_201_Report_DEMO_v2.sql
/*
	************************************************************************************
	NOTE: 
	Uses: 
	Created: 07/18/2017
	By: glenn garson
	************************************************************************************
*/
use OBH_DATA_REVIEW  --WAREHOUSE
go

--================================================	
--DECLARE @SearchString nvarchar(100)
--SET @SearchString = ''
--================================================
    
alter Procedure p_0031_SP_201_Report_DEMO(
		 @SearchString as NVARCHAR(100)                        	
	)

	as

--=============================================================================================================================


;WITH cte_ALL_DEMO
AS
(

			SELECT 
					d.TheDataSource
					, d.NAME_L
					, d.NAME_M
					, d.NAME_F
					, d.DOB
					, d.SSN
					, d.CITY
					, d.ZIP
					--, d.GENDER
					--
					,(
							Select [bbb_LIST_Lookups].ValueLabel 
							From bbb_LIST_Lookups
							where (
									([bbb_LIST_Lookups].LK_ID=6) 
									and 
									([bbb_LIST_Lookups].Value= d.GENDER)
									)
					) as GENDER			
					--
					--, d.RACE
					--
					,(
							Select [bbb_LIST_Lookups].ValueLabel 
							From bbb_LIST_Lookups
							where (
									([bbb_LIST_Lookups].LK_ID=7) 
									and 
									([bbb_LIST_Lookups].Value= d.RACE)
									)
					) as RACE			
					--
					--, d.ETHNICITY
					--
					,(
							Select [bbb_LIST_Lookups].ValueLabel 
							From bbb_LIST_Lookups
							where (
									([bbb_LIST_Lookups].LK_ID=8) 
									and 
									([bbb_LIST_Lookups].Value= d.ETHNICITY)
									)
					) as ETHNICITY			
					--
					--, d.SEXUAL_ORIENTATION
					--
					,(
							Select [bbb_LIST_Lookups].ValueLabel 
							From bbb_LIST_Lookups
							where (
									([bbb_LIST_Lookups].LK_ID=9) 
									and 
									([bbb_LIST_Lookups].Value= d.SEXUAL_ORIENTATION)
									)
					) as SEXUAL_ORIENTATION			
					--
					--, d.HH_INCOME_1
					--
					,(
							Select [bbb_LIST_Lookups].ValueLabel 
							From bbb_LIST_Lookups
							where (
									([bbb_LIST_Lookups].LK_ID=5) 
									and 
									([bbb_LIST_Lookups].Value= d.HH_INCOME_1)
									)
					) as HH_INCOME_1			
					--
					, d.INC_WAGE
					, d.IRS_DEP_NUM
					--, d.LANGUAGE1
					--
					,(
							Select [bbb_LIST_Lookups].ValueLabel 
							From bbb_LIST_Lookups
							where (
									([bbb_LIST_Lookups].LK_ID=10) 
									and 
									([bbb_LIST_Lookups].Value= d.LANGUAGE1)
									)
					) as LANGUAGE1			
					--
					--, d.VA_ST
					--
					,(
							Select [bbb_LIST_Lookups].ValueLabel 
							From bbb_LIST_Lookups
							where (
									([bbb_LIST_Lookups].LK_ID=11) 
									and 
									([bbb_LIST_Lookups].Value= d.VA_ST)
									)
					) as [VETERAN_STATUS]			
					--
		

			FROM
				[zzz_T001_ALL] d
)
SELECT * 
from cte_ALL_DEMO
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
					OR (RTRIM(LTRIM(UPPER(SSN))) like '%' +  RTRIM(LTRIM(UPPER(@SearchString))) + '%' )	
					OR (RTRIM(LTRIM(UPPER(TheDataSource))) like '%' +  RTRIM(LTRIM(UPPER(@SearchString))) + '%' )
			)
		)
ORDER BY TheDataSource, NAME_L, NAME_F