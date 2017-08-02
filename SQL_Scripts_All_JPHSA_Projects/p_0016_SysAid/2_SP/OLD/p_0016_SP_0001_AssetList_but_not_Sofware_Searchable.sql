--p_0016_SP_0001_AssetList_but_not_Sofware_Searchable.sql
/*
	************************************************************************************
	NOTE: 
	Uses: 
	Created: 2/23/2017
	By: glenn garson
	************************************************************************************
*/



USE d1_IT
GO


CREATE Procedure p_0016_SP_0001_AssetList_but_not_Sofware_Searchable(
		@SearchString as NVARCHAR(100)
	)

	as
	
-- START DEBUGGING SECTION -------------------	
	
	PRINT '1] Input @SearchString: [' + @SearchString + ']'
	
	-- Get rid of any spaces the user may have left in there:
	select @SearchString = LTRIM(RTRIM(@SearchString))
	PRINT '2] Input @SearchString: [' + @SearchString + ']'
-- END DEBUGGING SECTION -------------------		

IF (LEN(@SearchString) > 0) OR (@SearchString IS NOT NULL)			--Must also set the PARM to allow Nulls in SSRS
		BEGIN

				--=============WITH THE WHERE STATEMENT===================================
		SELECT 
      [Name]
      ,[Description]
	  --,[Location]
      ,[IP Address]
      ,[Manufacturer]
      ,[Type]
      --,[Purchase Date]
      ,[Serial]
      --,[Agent settings version]
      --,[Disabled]
      --,[Account]
      ,[Source]
      --,[Activity Log]
      --,[Approved Patches]
      --,[Asset Custom Date 1]
      --,[Asset Custom Date 2]
      --,[Asset Custom Int 1]
      --,[Asset Custom Int 2]
      --,[Asset Custom List 1]
      --,[Asset Custom List 2]
      --,[Asset Custom Notes]
      --,[Asset Custom Text 1]
      --,[Asset Custom Text 2]
      ,[Asset ID]
      ,[BIOS Type]
      --,[Building]
      --,[Bytes in]
      --,[Bytes out]
      ,[CPU Count]
      ,[CPU Model]
      ,[CPU Speed]
      ,[Catalog number]
      ,[CPU Vendor]
      --,[Change SR Patches]
      --,[Company]
      --,[Company Serial]
      --,[Cubic]
      --,[Current Carrier]
      --,[Denied Patches]
      --,[Department]
      ,[Display Adapter]
      ,[Display Memory]
      ,[Display Resolution]
      --,[External Serial]
      --,[Failed Patches]
      --,[Floor]
      ,[Free Memory Banks]
      ,[Free Space]
      ,[Home Carrier]
      ,[ICC]
      ,[IMEI]
      --,[Installed Patches]
      ,[Last Access Time]
      ,[Last Boot]
      ,[Last Maintenance]
      --,[Last Patch]
      --,[Last Scan]
      --,[Links to other Items]
      ,[MAC Address]
      --,[MDM Policy]
      ,[Memory]
      --,[Missing Patches]
      --,[Missing Patches List]
      ,[Model]
      --,[Monitor]
      --,[Monitor Serial]
      ,[OS Name]
      --,[Occupied Memory Banks]
      ,[OS Serial]
      ,[Operating System Type]
      ,[Operating System Version]
      --,[Owner]
      --,[Ownership]
      --,[Parent Asset]
      --,[Patch Management]
      --,[Patch Management Policy]
      --,[Pending Patches]
      --,[Phone Number]
      --,[Purchase Cost]
      --,[RDS]
      ,[Service Pack]
      --,[Snmp Custom Text 1]
      --,[Snmp Custom Text 10]
      --,[Snmp Custom Text 11]
      --,[Snmp Custom Text 12]
      --,[Snmp Custom Text 13]
      --,[Snmp Custom Text 14]
      --,[Snmp Custom Text 15]
      --,[Snmp Custom Text 16]
      --,[Snmp Custom Text 17]
      --,[Snmp Custom Text 18]
      --,[Snmp Custom Text 19]
      ,[Snmp Custom Text 2]
      --,[Snmp Custom Text 20]
      --,[Snmp Custom Text 3]
      --,[Snmp Custom Text 4]
      ,[Snmp Custom Text 5]
      --,[Snmp Custom Text 6]
      --,[Snmp Custom Text 7]
      --,[Snmp Custom Text 8]
      --,[Snmp Custom Text 9]
      --,[Snmp Params]
      --,[Software] --<==============================
      ,[Status]
      ,[Storage Capacity]
      ,[Storage Devices]
      --,[Supplier]
      --,[Support provider]
      --,[SysAid agent version]
      --,[Total Memory Banks]
      ,[Update Time]
      ,[Users]
      --,[Version]
      --,[ID]
      --,[Warranty Expiration]
		 
		   FROM [d1_IT].[dbo].[T003_Asset_List]
		  

			WHERE 
			  (		
					(

							(RTRIM(LTRIM(UPPER([Name]))) like '%' +  RTRIM(LTRIM(UPPER(@SearchString))) + '%') 
							OR (RTRIM(LTRIM(UPPER([Description]))) like '%' +  RTRIM(LTRIM(UPPER(@SearchString))) + '%') 
							OR (RTRIM(LTRIM(UPPER([IP Address]))) like '%' +  RTRIM(LTRIM(UPPER(@SearchString))) + '%') 
							OR (RTRIM(LTRIM(UPPER([Manufacturer]))) like '%' +  RTRIM(LTRIM(UPPER(@SearchString))) + '%') 
							OR (RTRIM(LTRIM(UPPER([Type]))) like '%' +  RTRIM(LTRIM(UPPER(@SearchString))) + '%') 
							OR (RTRIM(LTRIM(UPPER([Serial]))) like '%' +  RTRIM(LTRIM(UPPER(@SearchString))) + '%') 
							OR (RTRIM(LTRIM(UPPER([Source]))) like '%' +  RTRIM(LTRIM(UPPER(@SearchString))) + '%') 
							OR (RTRIM(LTRIM(UPPER([Asset ID]))) like '%' +  RTRIM(LTRIM(UPPER(@SearchString))) + '%') 
							OR (RTRIM(LTRIM(UPPER([BIOS Type]))) like '%' +  RTRIM(LTRIM(UPPER(@SearchString))) + '%') 
							OR (RTRIM(LTRIM(UPPER([CPU Count]))) like '%' +  RTRIM(LTRIM(UPPER(@SearchString))) + '%') 
							OR (RTRIM(LTRIM(UPPER([CPU Model]))) like '%' +  RTRIM(LTRIM(UPPER(@SearchString))) + '%') 
							OR (RTRIM(LTRIM(UPPER([CPU Speed]))) like '%' +  RTRIM(LTRIM(UPPER(@SearchString))) + '%') 
							OR (RTRIM(LTRIM(UPPER([Catalog number]))) like '%' +  RTRIM(LTRIM(UPPER(@SearchString))) + '%') 
							OR (RTRIM(LTRIM(UPPER([CPU Vendor]))) like '%' +  RTRIM(LTRIM(UPPER(@SearchString))) + '%') 
							OR (RTRIM(LTRIM(UPPER([Display Adapter]))) like '%' +  RTRIM(LTRIM(UPPER(@SearchString))) + '%') 
							OR (RTRIM(LTRIM(UPPER([Display Memory]))) like '%' +  RTRIM(LTRIM(UPPER(@SearchString))) + '%') 
							OR (RTRIM(LTRIM(UPPER([Display Resolution]))) like '%' +  RTRIM(LTRIM(UPPER(@SearchString))) + '%') 
							OR (RTRIM(LTRIM(UPPER([Free Memory Banks]))) like '%' +  RTRIM(LTRIM(UPPER(@SearchString))) + '%') 
							OR (RTRIM(LTRIM(UPPER([Free Space]))) like '%' +  RTRIM(LTRIM(UPPER(@SearchString))) + '%') 
							OR (RTRIM(LTRIM(UPPER([Home Carrier]))) like '%' +  RTRIM(LTRIM(UPPER(@SearchString))) + '%') 
							OR (RTRIM(LTRIM(UPPER([ICC]))) like '%' +  RTRIM(LTRIM(UPPER(@SearchString))) + '%') 
							OR (RTRIM(LTRIM(UPPER([IMEI]))) like '%' +  RTRIM(LTRIM(UPPER(@SearchString))) + '%') 
							OR (RTRIM(LTRIM(UPPER([Last Access Time]))) like '%' +  RTRIM(LTRIM(UPPER(@SearchString))) + '%') 
							OR (RTRIM(LTRIM(UPPER([Last Boot]))) like '%' +  RTRIM(LTRIM(UPPER(@SearchString))) + '%') 
							OR (RTRIM(LTRIM(UPPER([Last Maintenance]))) like '%' +  RTRIM(LTRIM(UPPER(@SearchString))) + '%') 
							OR (RTRIM(LTRIM(UPPER([MAC Address]))) like '%' +  RTRIM(LTRIM(UPPER(@SearchString))) + '%') 
							OR (RTRIM(LTRIM(UPPER([Memory]))) like '%' +  RTRIM(LTRIM(UPPER(@SearchString))) + '%') 
							OR (RTRIM(LTRIM(UPPER([Model]))) like '%' +  RTRIM(LTRIM(UPPER(@SearchString))) + '%') 
							OR (RTRIM(LTRIM(UPPER([OS Name]))) like '%' +  RTRIM(LTRIM(UPPER(@SearchString))) + '%') 
							OR (RTRIM(LTRIM(UPPER([OS Serial]))) like '%' +  RTRIM(LTRIM(UPPER(@SearchString))) + '%') 
							OR (RTRIM(LTRIM(UPPER([Operating System Type]))) like '%' +  RTRIM(LTRIM(UPPER(@SearchString))) + '%') 
							OR (RTRIM(LTRIM(UPPER([Operating System Version]))) like '%' +  RTRIM(LTRIM(UPPER(@SearchString))) + '%') 
							OR (RTRIM(LTRIM(UPPER([Service Pack]))) like '%' +  RTRIM(LTRIM(UPPER(@SearchString))) + '%') 
							OR (RTRIM(LTRIM(UPPER([Snmp Custom Text 2]))) like '%' +  RTRIM(LTRIM(UPPER(@SearchString))) + '%') 
							OR (RTRIM(LTRIM(UPPER([Snmp Custom Text 5]))) like '%' +  RTRIM(LTRIM(UPPER(@SearchString))) + '%') 
							OR (RTRIM(LTRIM(UPPER([Status]))) like '%' +  RTRIM(LTRIM(UPPER(@SearchString))) + '%') 
							OR (RTRIM(LTRIM(UPPER([Storage Capacity]))) like '%' +  RTRIM(LTRIM(UPPER(@SearchString))) + '%') 
							OR (RTRIM(LTRIM(UPPER([Storage Devices]))) like '%' +  RTRIM(LTRIM(UPPER(@SearchString))) + '%') 
							OR (RTRIM(LTRIM(UPPER([Update Time]))) like '%' +  RTRIM(LTRIM(UPPER(@SearchString))) + '%') 
							OR (RTRIM(LTRIM(UPPER([Users]))) like '%' +  RTRIM(LTRIM(UPPER(@SearchString))) + '%') 

					)															
			   ) 
			order by Name
		--========================================================================
		END
ELSE
		BEGIN

		--===========WITHOUT THE WHERE============================================
		SELECT 
      [Name]
      ,[Description]
	  --,[Location]
      ,[IP Address]
      ,[Manufacturer]
      ,[Type]
      --,[Purchase Date]
      ,[Serial]
      --,[Agent settings version]
      --,[Disabled]
      --,[Account]
      ,[Source]
      --,[Activity Log]
      --,[Approved Patches]
      --,[Asset Custom Date 1]
      --,[Asset Custom Date 2]
      --,[Asset Custom Int 1]
      --,[Asset Custom Int 2]
      --,[Asset Custom List 1]
      --,[Asset Custom List 2]
      --,[Asset Custom Notes]
      --,[Asset Custom Text 1]
      --,[Asset Custom Text 2]
      ,[Asset ID]
      ,[BIOS Type]
      --,[Building]
      --,[Bytes in]
      --,[Bytes out]
      ,[CPU Count]
      ,[CPU Model]
      ,[CPU Speed]
      ,[Catalog number]
      ,[CPU Vendor]
      --,[Change SR Patches]
      --,[Company]
      --,[Company Serial]
      --,[Cubic]
      --,[Current Carrier]
      --,[Denied Patches]
      --,[Department]
      ,[Display Adapter]
      ,[Display Memory]
      ,[Display Resolution]
      --,[External Serial]
      --,[Failed Patches]
      --,[Floor]
      ,[Free Memory Banks]
      ,[Free Space]
      ,[Home Carrier]
      ,[ICC]
      ,[IMEI]
      --,[Installed Patches]
      ,[Last Access Time]
      ,[Last Boot]
      ,[Last Maintenance]
      --,[Last Patch]
      --,[Last Scan]
      --,[Links to other Items]
      ,[MAC Address]
      --,[MDM Policy]
      ,[Memory]
      --,[Missing Patches]
      --,[Missing Patches List]
      ,[Model]
      --,[Monitor]
      --,[Monitor Serial]
      ,[OS Name]
      --,[Occupied Memory Banks]
      ,[OS Serial]
      ,[Operating System Type]
      ,[Operating System Version]
      --,[Owner]
      --,[Ownership]
      --,[Parent Asset]
      --,[Patch Management]
      --,[Patch Management Policy]
      --,[Pending Patches]
      --,[Phone Number]
      --,[Purchase Cost]
      --,[RDS]
      ,[Service Pack]
      --,[Snmp Custom Text 1]
      --,[Snmp Custom Text 10]
      --,[Snmp Custom Text 11]
      --,[Snmp Custom Text 12]
      --,[Snmp Custom Text 13]
      --,[Snmp Custom Text 14]
      --,[Snmp Custom Text 15]
      --,[Snmp Custom Text 16]
      --,[Snmp Custom Text 17]
      --,[Snmp Custom Text 18]
      --,[Snmp Custom Text 19]
      ,[Snmp Custom Text 2]
      --,[Snmp Custom Text 20]
      --,[Snmp Custom Text 3]
      --,[Snmp Custom Text 4]
      ,[Snmp Custom Text 5]
      --,[Snmp Custom Text 6]
      --,[Snmp Custom Text 7]
      --,[Snmp Custom Text 8]
      --,[Snmp Custom Text 9]
      --,[Snmp Params]
      --,[Software] --<==============================
      ,[Status]
      ,[Storage Capacity]
      ,[Storage Devices]
      --,[Supplier]
      --,[Support provider]
      --,[SysAid agent version]
      --,[Total Memory Banks]
      ,[Update Time]
      ,[Users]
      --,[Version]
      --,[ID]
      --,[Warranty Expiration]
		 
		   FROM [d1_IT].[dbo].[T003_Asset_List]
		  


			order by Name
		--========================================================================
		END		
GO