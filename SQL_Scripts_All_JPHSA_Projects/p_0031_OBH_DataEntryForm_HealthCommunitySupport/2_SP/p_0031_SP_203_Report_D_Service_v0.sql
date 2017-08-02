--p_0031_SP_203_Report_D_Service_v0.sql

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
--DECLARE @SearchString nvarchar(100)
--SET @SearchString = ''
--================================================
    
alter procedure p_0031_SP_203_Report_D_Service(
		 @SearchString as NVARCHAR(100)                        	
	)

	as

--=============================================================================================================================

;WITH cte_D_Service_ALL
AS
(

SELECT 
		d.TheDataSource
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
		, s.PV_SERV
		, s.SERVICE
		----===============================================================
FROM
	zzz_T001_ALL d
	LEFT OUTER JOIN
	zzz_q014_ALL s
	ON 
		(
			d.DEMO_PK = s.Demo_FK
			AND
			d.TheDataSource = s.TheDataSource
		)

)

SELECT * 
from cte_D_Service_ALL
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
ORDER BY NAME_L, NAME_F, SERV_DATE