--prj_0009_REP_001_Search_TelephoneContacts_return_All_Fields.sql
/*
	************************************************************************************
	NOTE: 
	Uses: 
	Created: 2/6/2017
	By: glenn garson
	************************************************************************************
*/

use d1_IT
go


------================================================	
--DECLARE @SearchString nvarchar(100)
--DECLARE @use_Toshiba_DisplayName as BIT
--DECLARE @use_Display_For_Users as BIT
--DECLARE @use_ShowUsers_0_1 as BIT
--DECLARE @use_Ext_OLD as BIT
--DECLARE @use_Ext_Toshiba as BIT
--DECLARE @use_Position as BIT
--DECLARE @use_Department as BIT
--DECLARE @use_Fax as BIT
--DECLARE @use_Email as BIT
--DECLARE @use_PhoneNumber as BIT
--DECLARE @use_Last_Name as BIT
--DECLARE @use_First_Name as BIT
--DECLARE @use_EB_WB as BIT
--DECLARE @use_Toshiba_Directory_Type as BIT


--SET @SearchString = ''		
--SET @use_Toshiba_DisplayName = 1	
--SET @use_Display_For_Users = 1
--SET @use_ShowUsers_0_1 = 0	
--SET @use_Ext_OLD = 0
--SET @use_Ext_Toshiba = 0
--SET @use_Position = 0
--SET @use_Department = 0
--SET @use_Fax = 0
--SET @use_Email = 0
--SET @use_PhoneNumber = 0
--SET @use_Last_Name = 0
--SET @use_First_Name = 0
--SET @use_EB_WB = 0
--SET @use_Toshiba_Directory_Type = 0

------================================================
    
alter Procedure prj_0009_REP_001_Search_TelephoneContacts_return_All_Fields(
		@SearchString as NVARCHAR(100) = '',
		@use_Toshiba_DisplayName as bit = 1,	
		@use_Display_For_Users as bit =  0,
		@use_ShowUsers_0_1 as bit =  0,	
		@use_Ext_OLD as bit =  0,
		@use_Ext_Toshiba as bit =  0,
		@use_Position as bit =  0,
		@use_Department as bit =  0,
		@use_Fax as bit =  0,
		@use_Email as bit =  0,
		@use_PhoneNumber as bit =  0,
		@use_Last_Name as bit =  0,
		@use_First_Name as bit =  0,
		@use_EB_WB as bit =  0,
		@use_Toshiba_Directory_Type as bit =  0
		                       	
	)

	as
select @SearchString = LTRIM(RTRIM(@SearchString))
--=============================================================================================================================
SELECT  [T003_PK]
	  ,[Toshiba_DisplayName]
      ,[Display_For_Users] as Name
      ,[ShowUsers_0_1]
      ,[Ext_OLD]
      ,[Ext_Toshiba] as Ext
      ,[Position]
      ,[Department]
      ,[Fax]
      ,[Email]
      ,[PhoneNumber]
      ,[Last_Name]
      ,[First_Name]
      ,[EB_WB]
      ,[Toshiba_Directory_Type]
  FROM [d3_JPHSA_All_Users].[dbo].[T003_Telephone_Contacts]
		  

			WHERE
					(
							(
								(upper(rtrim(ltrim([Toshiba_DisplayName]))) like '%' +  UPPER(RTRIM(LTRIM(@SearchString))) + '%')
								AND
								(@use_Toshiba_DisplayName = 1)
							)
							OR
							(
								(upper(rtrim(ltrim([Display_For_Users]))) like '%' +  UPPER(RTRIM(LTRIM(@SearchString))) + '%')
								AND
								(@use_Display_For_Users = 1)
							)
							OR
							(
								(upper(rtrim(ltrim([ShowUsers_0_1]))) like '%' +  UPPER(RTRIM(LTRIM(@SearchString))) + '%')
								AND
								(@use_ShowUsers_0_1 = 1)
							)
							OR
							(
								(upper(rtrim(ltrim([Ext_OLD]))) like '%' +  UPPER(RTRIM(LTRIM(@SearchString))) + '%')
								AND
								(@use_Ext_OLD = 1)
							)
							OR
							(
								(upper(rtrim(ltrim([Ext_Toshiba]))) like '%' +  UPPER(RTRIM(LTRIM(@SearchString))) + '%')
								AND
								(@use_Ext_Toshiba = 1)
							)
							OR
							(
								(upper(rtrim(ltrim([Position]))) like '%' +  UPPER(RTRIM(LTRIM(@SearchString))) + '%')
								AND
								(@use_Position = 1)
							)
							OR
							(
								(upper(rtrim(ltrim([Department]))) like '%' +  UPPER(RTRIM(LTRIM(@SearchString))) + '%')
								AND
								(@use_Department = 1)
							)
							OR
							(
								(upper(rtrim(ltrim([Fax]))) like '%' +  UPPER(RTRIM(LTRIM(@SearchString))) + '%')
								AND
								(@use_Fax = 1)
							)
							OR
							(
								(upper(rtrim(ltrim([Email]))) like '%' +  UPPER(RTRIM(LTRIM(@SearchString))) + '%')
								AND
								(@use_Email = 1)
							)
							OR
							(
								(upper(rtrim(ltrim([PhoneNumber]))) like '%' +  UPPER(RTRIM(LTRIM(@SearchString))) + '%')
								AND
								(@use_PhoneNumber = 1)
							)
							OR
							(
								(upper(rtrim(ltrim([Last_Name]))) like '%' +  UPPER(RTRIM(LTRIM(@SearchString))) + '%')
								AND
								(@use_Last_Name = 1)
							)
							OR
							(
								(upper(rtrim(ltrim([First_Name]))) like '%' +  UPPER(RTRIM(LTRIM(@SearchString))) + '%')
								AND
								(@use_First_Name = 1)
							)
							OR
							(
								(upper(rtrim(ltrim([EB_WB]))) like '%' +  UPPER(RTRIM(LTRIM(@SearchString))) + '%')
								AND
								(@use_EB_WB = 1)
							)
							OR
							(
								(upper(rtrim(ltrim([Toshiba_Directory_Type]))) like '%' +  UPPER(RTRIM(LTRIM(@SearchString))) + '%')
								AND
								(@use_Toshiba_Directory_Type = 1)
							)
					)		 

			ORDER BY [Toshiba_DisplayName]


					
GO					