--prj_0003_SP_004_search_User_Computer_Building_Room_Monitor_AttachedDevice.sql
/*
	************************************************************************************
	NOTE: 
	Uses: 
	Created: 6/1/2017
	By: glenn garson
	************************************************************************************
*/

use d1_IT
go
--------------------------------DEBUG PARMS START
--DECLARE @SearchString nvarchar(100)	
--SET @SearchString = ''	
--------------------------------DEBUG PARMS END
--================================================
    
create Procedure prj_0003_SP_004_search_User_Computer_Building_Room_Monitor_AttachedDevice(
		 @SearchString as NVARCHAR(100)                        	
	)

	as
--=============================================================================================================================

				SELECT  
					   [User]
					  ,[Building]
					  ,[Room_Number]
					  ,[Device]
					  ,[Device_Type]
					  ,[Device_Status]
					  ,[Monitor_1]
					  ,[Monitor_2]
					  ,[Monitor_3]
					  ,[AttachedDevice_1]
					  ,[AttachedDevice_1_Type]
					  ,[AttachedDevice_2]
					  ,[AttachedDevice_2_Type]
					  ,[AttachedDevice_3]
					  ,[AttachedDevice_3_Type]
			FROM [d1_IT].[dbo].[p_0003_vw_502_User_Computer_Monitors_AttachedDevices_Building_Room]		  

			WHERE

					(
						(
							(LEN(@SearchString) = 0) 
							OR 
							(@SearchString IS NULL)							
						)
						OR
						(
								(RTRIM(LTRIM(UPPER([User]))) like '%' +  RTRIM(LTRIM(UPPER(@SearchString))) + '%')		
								OR (RTRIM(LTRIM(UPPER([Building]))) like '%' +  RTRIM(LTRIM(UPPER(@SearchString))) + '%')			
								OR (RTRIM(LTRIM(UPPER([Room_Number]))) like '%' +  RTRIM(LTRIM(UPPER(@SearchString))) + '%' )	
								OR (RTRIM(LTRIM(UPPER([Device]))) like '%' +  RTRIM(LTRIM(UPPER(@SearchString))) + '%')			
								OR (RTRIM(LTRIM(UPPER([Device_Type]))) like '%' +  RTRIM(LTRIM(UPPER(@SearchString))) + '%' )	
								OR (RTRIM(LTRIM(UPPER([Device_Status]))) like '%' +  RTRIM(LTRIM(UPPER(@SearchString))) + '%')			
								OR (RTRIM(LTRIM(UPPER([Monitor_1]))) like '%' +  RTRIM(LTRIM(UPPER(@SearchString))) + '%' )
								OR (RTRIM(LTRIM(UPPER([Monitor_2]))) like '%' +  RTRIM(LTRIM(UPPER(@SearchString))) + '%')			
								OR (RTRIM(LTRIM(UPPER([Monitor_3]))) like '%' +  RTRIM(LTRIM(UPPER(@SearchString))) + '%' )	
								OR (RTRIM(LTRIM(UPPER([AttachedDevice_1]))) like '%' +  RTRIM(LTRIM(UPPER(@SearchString))) + '%')			
								OR (RTRIM(LTRIM(UPPER([AttachedDevice_1_Type]))) like '%' +  RTRIM(LTRIM(UPPER(@SearchString))) + '%' )	
								OR (RTRIM(LTRIM(UPPER([AttachedDevice_2]))) like '%' +  RTRIM(LTRIM(UPPER(@SearchString))) + '%')			
								OR (RTRIM(LTRIM(UPPER([AttachedDevice_2_Type]))) like '%' +  RTRIM(LTRIM(UPPER(@SearchString))) + '%' )
								OR (RTRIM(LTRIM(UPPER([AttachedDevice_3]))) like '%' +  RTRIM(LTRIM(UPPER(@SearchString))) + '%')			
								OR (RTRIM(LTRIM(UPPER([AttachedDevice_3_Type]))) like '%' +  RTRIM(LTRIM(UPPER(@SearchString))) + '%' )																		
						)
					)			 
	
GO					