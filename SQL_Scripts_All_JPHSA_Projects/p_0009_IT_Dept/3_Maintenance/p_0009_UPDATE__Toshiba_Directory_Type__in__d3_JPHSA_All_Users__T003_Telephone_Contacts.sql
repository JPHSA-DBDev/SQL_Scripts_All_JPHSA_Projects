--p_0009_UPDATE__Toshiba_Directory_Type__in__d3_JPHSA_All_Users__T003_Telephone_Contacts.sql
SELECT count(*)
      ,[Toshiba_Directory_Type]
  FROM [d3_JPHSA_All_Users].[dbo].[T003_Telephone_Contacts]
  Group by Toshiba_Directory_Type

--UPDATE [d3_JPHSA_All_Users].[dbo].[T003_Telephone_Contacts]
--SET [Toshiba_Directory_Type]='IP_Phone'
--WHERE (	
--		[Toshiba_Directory_Type] = 'IPT_L'
--	   )

--UPDATE [d3_JPHSA_All_Users].[dbo].[T003_Telephone_Contacts]
--SET [Toshiba_Directory_Type]='SIP_LINE'
--WHERE (	
--		[Toshiba_Directory_Type] = 'SIP'
--	   )
