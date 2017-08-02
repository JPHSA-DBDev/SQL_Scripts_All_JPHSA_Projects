--p_0017_RES_0001_Judy_and_Toshiba.sql

use zzzJUNK
go


Select 
     two.[Name] as [Toshiba_DisplayName]
	 , one.[DisplayName] as	[Name_from_Trudy]
	 , 1 as [ShowUsers_0_1]				--<==================
	 , one.[Extension] as Ext_Trudy
	, two.[DirectoryNumber] as Ext_Two
      
      , one.[Position]
      , one.[Department]
      , one.[Fax]
      , one.[Email]
      , one.[PhoneNumber]      
      , one.[Last Name]
      , one.[First Name]
      , one.[Title_Suffix]
      , one.[Description_Instead_Of_Name]
      , two.[EB_WB]      
      , two.[DirectoryType]
	  ,one.[ID] as ID_One
	  ,  two.[ID] as ID_TWO
      
INTO STEP_1
From 
	[1_FromTrudy] one
	Full Outer Join
	[2_Toshiba_Station_Assingments] two
	on one.Extension = two.DirectoryNumber
WHERE  ((two.[Name] is not null) OR (one.[DisplayName] is not null) )
	    --and one.[DisplayName] like '%exec%'
		
Order by ID_ONE			--PhoneNumber	


