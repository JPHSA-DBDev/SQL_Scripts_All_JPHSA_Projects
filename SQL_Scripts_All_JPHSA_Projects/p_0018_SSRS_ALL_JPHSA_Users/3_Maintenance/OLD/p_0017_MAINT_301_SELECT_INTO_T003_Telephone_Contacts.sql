--p_0017_MAINT_302_SELECT_INTO_T003_Telephone_Contacts_from_d1.sql
use d3_JPHSA_All_Users
go
/*
	************************************************************************************
	NOTE: For simpler Security, I moved the Telephone Contacts Database to d3 (copied data from original location on d1)
	Uses: 
	Created: 02/6/2017
	By: glenn garson
	************************************************************************************
*/


INSERT INTO [T003_Telephone_Contacts] ( 
								[Toshiba_DisplayName], 
								[Display_For_Users],
								[ShowUsers_0_1], 
								[Ext_OLD],
								[Ext_Toshiba],
								[Position],
								[Department],
								[Fax],
								[Email],
								[PhoneNumber],
								[Last_Name],
								[First_Name],
								[EB_WB],
								[Toshiba_Directory_Type]											

							  )
SELECT
      [Toshiba_DisplayName]
      ,[Display_For_Users]
      ,[ShowUsers_0_1]
      ,[Ext_OLD]
      ,[Ext_Toshiba]
      ,[Position]
      ,[Department]
      ,[Fax]
      ,[Email]
      ,[PhoneNumber]
      ,[Last_Name]
      ,[First_Name]
      ,[EB_WB]
      ,[Toshiba_Directory_Type]
  FROM [d1_IT].[dbo].[T003_Telephone_Contacts]

