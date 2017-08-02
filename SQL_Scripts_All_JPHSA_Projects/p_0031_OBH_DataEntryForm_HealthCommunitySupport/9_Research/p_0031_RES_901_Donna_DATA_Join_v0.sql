--p_0031_RES_901_Donna_DATA_Join_v0.sql

use OBH_DATA_REVIEW  --WAREHOUSE_DEV
go

SELECT 

		 d.*
		, e.*
		, s.*
	   
FROM
	aaa_T001_Donna_Doolen_20170711 d
	LEFT OUTER JOIN
	aaa_q013_Donna_Doolen_20170711 e
	ON d.DEMO_PK = e.Demo_FK

	LEFT OUTER JOIN
	aaa_q014_Donna_Doolen_20170711 s
	ON d.DEMO_PK = s.Demo_FK