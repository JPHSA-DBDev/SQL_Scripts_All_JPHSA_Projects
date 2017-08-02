--INSERT_INTO_T1_Servers_FROM_Servers.sql
/*
	************************************************************************************
	NOTE: 
	Uses: 
	Created: 1/31/17
	By: glenn garson
	************************************************************************************
*/


use d1_IT
go

INSERT INTO T001_Servers ( 												--<== Already existing table
      [Name]
      ,[IP_1]
      ,[IP_2]
      ,[Notes]
      ,[Description]
      ,[Roles_and_Functions]
      ,[Service_tag]
      ,[Install_Date]
      ,[JPHSA_Tag]
      ,[OS]
      ,[BIOS SerialNumber]
      ,[Old_Purchase_Notes]
							  )
SELECT 
      [Name]
      ,[IP_1]
      ,[IP_2]
      ,[Notes]
      ,[Description]
      ,[Roles_and_Functions]
      ,[Service_tag]
      ,[Install_Date]
      ,[JPHSA_Tag]
      ,[OS]
      ,[BIOS SerialNumber]
      ,[Old_Purchase_Notes]
		
FROM Servers