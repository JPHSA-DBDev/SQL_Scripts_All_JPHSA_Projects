--p_0003_SP_005_Search_Software_v0.sql
/*
	************************************************************************************
	NOTE: 
	Uses: 
	Created: 08/2/2017
	By: glenn garson
	************************************************************************************
*/

use d1_IT
go
------------------------------------DEBUG PARMS START
--DECLARE @SearchString nvarchar(100)
--SET @SearchString = ''
------------------------------------DEBUG PARMS END


alter Procedure p_0003_SP_005_Search_Software_v0(
		 @SearchString as NVARCHAR(100)                       	
	)

	as

SELECT 
	  [T010_Software_Inventory_PK]
      ,[Software_Company]
      ,[Name_of_Software]
      ,[Version]
      ,[JPHSA_Owner]
      ,[Registered_To]
      ,[Number_of_Licenses_Purchased]
      ,[Key_1]
      ,[Key_2]
      ,[Key_3]
      ,[IT_Notes]
      ,[Key_4]
      ,[Key_5]
      ,[CreateRecord_dateTime]
      ,[CreateRecord_name]
      ,[UpdateRecord_dateTime]
      ,[UpdateRecord_name]
FROM [T010_Software_Inventory]
WHERE

		(
			(
				(LEN(@SearchString) = 0) 
				OR 
				(@SearchString IS NULL)							
			)
			OR
			(
					(RTRIM(LTRIM(UPPER(Name_of_Software))) like '%' +  RTRIM(LTRIM(UPPER(@SearchString))) + '%')		
					OR (RTRIM(LTRIM(UPPER([IT_Notes]))) like '%' +  RTRIM(LTRIM(UPPER(@SearchString))) + '%')
		
			)
		)