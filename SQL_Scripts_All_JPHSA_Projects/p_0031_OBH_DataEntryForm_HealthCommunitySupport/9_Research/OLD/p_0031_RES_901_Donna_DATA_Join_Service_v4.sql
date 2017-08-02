--p_0031_RES_901_Donna_DATA_Join_Service_v4.sql

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

		------===============================================================

		, s.Archive_flag as [Service_Archive_flag]
		--, s.Archived_LAST_flag
		, s.Service_PK
		, s.Demo_FK as [Service_Demo_FK]
		, s.SERV_DATE
		----===============================================================
FROM
	aaa_T001_Jen_Bruchi_20170712 d


	LEFT OUTER JOIN
	aaa_q014_Jen_Bruchi_20170712 s
	ON d.DEMO_PK = s.Demo_FK
)
--SELECT * from cte_Jen_Bruchi_20170712

, cte_Donna_Doolen_20170711
AS
(

SELECT 
		'Donna_Doolen_20170711' as TheDataSource
		, d.NAME_L
		, d.NAME_M
		, d.NAME_F
		, d.DOB

		------===============================================================
		, s.Archive_flag as [Service_Archive_flag]
		--, s.Archived_LAST_flag
		, s.Service_PK
		, s.Demo_FK as [Service_Demo_FK]
		, s.SERV_DATE
		----===============================================================
FROM
	aaa_T001_Donna_Doolen_20170711 d


	LEFT OUTER JOIN
	aaa_q014_Donna_Doolen_20170711 s
	ON d.DEMO_PK = s.Demo_FK
)

SELECT * from cte_Jen_Bruchi_20170712
WHERE Name_L not like 'zzz%'
UNION ALL 
SELECT * from cte_Donna_Doolen_20170711
WHERE Name_L not like 'zzz%'