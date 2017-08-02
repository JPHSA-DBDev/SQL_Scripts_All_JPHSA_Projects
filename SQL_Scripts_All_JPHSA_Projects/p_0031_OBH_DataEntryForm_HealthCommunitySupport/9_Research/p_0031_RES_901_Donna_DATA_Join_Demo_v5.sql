--p_0031_RES_901_Donna_DATA_Join_Demo_v5.sql

use OBH_DATA_REVIEW  --WAREHOUSE_DEV
go

WITH cte_Jen_Bruchi_20170712
AS
(

			SELECT 
					'Jen_Bruchi_20170712' as TheDataSource
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
				aaa_T001_Jen_Bruchi_20170712 d
)
, cte_Donna_Doolen_20170711
AS
(

			SELECT 
					'Donna_Doolen_20170711' as TheDataSource
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
				aaa_T001_Donna_Doolen_20170711 d
)

SELECT * from cte_Jen_Bruchi_20170712
WHERE Name_L not like 'zzz%'
UNION ALL 
SELECT * from cte_Donna_Doolen_20170711
WHERE Name_L not like 'zzz%'