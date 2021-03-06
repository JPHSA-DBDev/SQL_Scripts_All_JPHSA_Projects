--p_0021_MAINT_305_CountPerMonth.sql

--OLD
--SELECT [CHECKMONTH], count(*) as TheCount
--  FROM [Success].[dbo].[T003_All_Monthly_Billable_Services_IDR_ARCHIVE]
--  Group By [CHECKMONTH]

  SELECT count(*) as TheCount
			,[Data_for_Month_MM]
			,[Data_for_Year_YYYY]
  FROM [Success].[dbo].[T003_ARCHIVE_Billable_Services_IDR]
  Group By [Data_for_Month_MM]
			,[Data_for_Year_YYYY]
  Order by [Data_for_Month_MM]
			,[Data_for_Year_YYYY]


  SELECT count(*) as TheCount
			,[Data_for_Month_MM]
			,[Data_for_Year_YYYY]
  FROM [Success].[dbo].[T004_ARCHIVE_NonBillable_Services_IDR]
  Group By [Data_for_Month_MM]
			,[Data_for_Year_YYYY]
  Order by [Data_for_Month_MM]
			,[Data_for_Year_YYYY]