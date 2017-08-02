--p_003_RES_001_UPDATE_t007.SQL

USE d1_IT

EXECUTE AS LOGIN='JPHsa01\mblanco'

UPDATE [d1_IT].[dbo].[T007_IP_Inventory_History]
SET [Note]=N'TEST-2xx'
WHERE (	
		CONVERT(NVARCHAR(MAX), [Note]) = N'TEST-2x'
	   )

Select [Note] from [d1_IT].[dbo].[T007_IP_Inventory_History]

REVERT

GO