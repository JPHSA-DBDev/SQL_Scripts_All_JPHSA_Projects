--p_0021_RESEARCH_04_HowManyRecordsAreInTheArchives_by_Month.sql
SELECT count(*) as theCount
      ,[Data_for_Month_MM]
      ,[Data_for_Year_YYYY]
     
  FROM [Success].[dbo].[T003_ARCHIVE_Billable_Services_IDR]
  Group by [Data_for_Month_MM],[Data_for_Year_YYYY]
  Order by [Data_for_Month_MM],[Data_for_Year_YYYY]


  SELECT count(*) as theCount
      ,[Data_for_Month_MM]
      ,[Data_for_Year_YYYY]
  FROM [Success].[dbo].[T004_ARCHIVE_NonBillable_Services_IDR]
    Group by [Data_for_Month_MM],[Data_for_Year_YYYY]
  Order by [Data_for_Month_MM],[Data_for_Year_YYYY]