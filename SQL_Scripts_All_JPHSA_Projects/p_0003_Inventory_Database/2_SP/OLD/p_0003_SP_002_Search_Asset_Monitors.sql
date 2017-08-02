--p_0003_SP_002_Search_Asset_Monitors.sql
/*
	************************************************************************************
	NOTE: not using this for a report
	Uses: 
	Created: 05/30/2017
	By: glenn garson
	************************************************************************************
*/

use d1_IT
go
----------------------------------DEBUG PARMS START
DECLARE @SearchString nvarchar(100)
SET @SearchString = ''
----------------------------------DEBUG PARMS END


--create Procedure p_0003_SP_002_Search_Asset_Monitors(
--		 @SearchString as NVARCHAR(100)                       	
--	)

--	as
SELECT        
			IP.JPHSA_Tag, 

			M1.JPHSA_Tag AS [Monitor-1],
			M2.JPHSA_Tag AS [Monitor-2],
			M3.JPHSA_Tag AS [Monitor-3],
			b.T005_Building_enum_02_Description as [Building],
			IP.Room_Number			

FROM            
			T004_IP_Inventory IP
			Left outer JOIN
			T006_Monitor_Inventory M1
			ON IP.[Monitor-1_FK] = M1.T006_Monitor_Inventory_PK

			Left outer JOIN
			T006_Monitor_Inventory M2
			ON IP.[Monitor-2_FK] = M2.T006_Monitor_Inventory_PK

			Left outer JOIN
			T006_Monitor_Inventory M3
			ON IP.[Monitor-3_FK] = M3.T006_Monitor_Inventory_PK

			Left outer JOIN
			T005_Building_enum_02 b
			ON IP.Building_T005_e2 = b.T005_Building_enum_02_Value


			WHERE

					(
						(
							(LEN(@SearchString) = 0) 
							OR 
							(@SearchString IS NULL)							
						)
						OR
						(
								(RTRIM(LTRIM(UPPER(IP.JPHSA_Tag))) like '%' +  RTRIM(LTRIM(UPPER(@SearchString))) + '%')		
								OR (RTRIM(LTRIM(UPPER(M1.JPHSA_Tag))) like '%' +  RTRIM(LTRIM(UPPER(@SearchString))) + '%')
								OR (RTRIM(LTRIM(UPPER(M2.JPHSA_Tag))) like '%' +  RTRIM(LTRIM(UPPER(@SearchString))) + '%')
								OR (RTRIM(LTRIM(UPPER(M3.JPHSA_Tag))) like '%' +  RTRIM(LTRIM(UPPER(@SearchString))) + '%')				
						)
					)
Order by  b.T005_Building_enum_02_Description, IP.Room_Number, ip.JPHSA_Tag