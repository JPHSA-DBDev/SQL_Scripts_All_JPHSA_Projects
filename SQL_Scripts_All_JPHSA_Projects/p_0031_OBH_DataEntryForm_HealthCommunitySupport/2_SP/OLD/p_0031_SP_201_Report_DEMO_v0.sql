---p_0031_SP_201_Report_DEMO_v0.sql

use OBH_DATA_REVIEW  --WAREHOUSE_DEV
go

WITH cte_ALL_DEMO
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
SELECT * from cte_ALL_DEMO