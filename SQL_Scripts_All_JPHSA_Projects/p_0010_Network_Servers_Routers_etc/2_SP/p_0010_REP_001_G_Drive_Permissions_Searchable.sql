--p_0010_REP_001_G_Drive_Permissions_Searchable.sql
/*
	************************************************************************************
	NOTE: 
	Uses: 
	Created: 07/26/2017
	By: glenn garson
	************************************************************************************
*/

use d1_IT
go
--------------------------------DEBUG PARMS START	
DECLARE @SearchString nvarchar(100)	
DECLARE @use_DataSource as BIT
DECLARE @use_User as BIT
DECLARE @use_Folder as BIT

SET @SearchString = 'AftercareRecordsReadOnly'	
SET @use_DataSource = 0	
SET @use_User = 1	
SET @use_Folder = 0		

--------------------------------DEBUG PARMS END    
--alter Procedure p_0010_REP_001_G_Drive_Permissions_Searchable(
--		 @SearchString as NVARCHAR(255)	
--		,@use_DataSource as bit  
--		,@use_User as bit  
--		,@use_Folder as bit  	                   	
--	)

--	as

--=============================================================================================================================

	SELECT TOP(3000) 
		[DataSource]
		,[User]
		,[Access]
		,[Folder]
  FROM [d1_IT].[dbo].[T009_G_Drive_Permissions_ARCHIVE]

		  

			WHERE
					(
							(
								(upper(rtrim(ltrim([DataSource]))) like '%' +  UPPER(RTRIM(LTRIM(@SearchString))) + '%')
								AND
								(@use_DataSource = 1)
							)		
							OR 
							(
								(
									(upper(rtrim(ltrim([User]))) like '%' +  (upper(rtrim(ltrim(@SearchString)))) + '%')				
								)
								AND
								(@use_User= 1)
							)				  
							OR 
							(
								(upper(rtrim(ltrim([Folder]))) like '%' +  (upper(rtrim(ltrim(@SearchString)))) + '%') 
								AND
								(@use_Folder = 1)								
							)
						)
		 

  Order by [User], [Folder], [DataSource],[Access]											
GO		