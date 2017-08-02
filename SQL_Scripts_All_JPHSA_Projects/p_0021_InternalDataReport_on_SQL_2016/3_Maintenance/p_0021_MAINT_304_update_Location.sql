--p_0021_MAINT_304_update_Location.sql

--TEST

SELECT [Location]
      ,count(*) as TheCount
  FROM [Success].[dbo].[T001_Provider_Information_IDR]
  group by Location

-- Then update if necessary

UPDATE [Success].[dbo].[T001_Provider_Information_IDR]
SET Location='EJ'
WHERE (	
		Location = 'EB'
	   )



UPDATE [Success].[dbo].[T001_Provider_Information_IDR]
SET Location='WJ'
WHERE (	
		Location = 'WB'
	   )