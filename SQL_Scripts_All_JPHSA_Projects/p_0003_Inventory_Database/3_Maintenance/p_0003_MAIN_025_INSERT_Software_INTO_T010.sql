--p_0003_MAIN_025_INSERT_Software_INTO_T010.sql

INSERT INTO [d1_IT].[dbo].[T010_Software_Inventory] ( 												--<== Already existing table
      [Software_Company]
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
							  )
SELECT 
      [Software_Company]
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
		
FROM [d1_IT].[dbo].[zzz_Software_Inventory];