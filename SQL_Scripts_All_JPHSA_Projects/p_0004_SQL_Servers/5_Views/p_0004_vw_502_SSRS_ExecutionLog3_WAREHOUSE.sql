-- p_0004_vw_502_SSRS_ExecutionLog3_WAREHOUSE.sql
/*
FROM: http://www.mssqltips.com/sqlservertip/2722/sql-server-report-server-2008-r2-execution-log-reports/

*/
use IT		  --for WAREHOUSE instance
go


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[p_0004_vw_502_SSRS_ExecutionLog3_WAREHOUSE]
AS

SELECT 
EL.InstanceName, 
COALESCE(C.Path, 'Unknown') AS ItemPath, 
EL.UserName,
EL.ExecutionId, 
CASE(EL.RequestType)
  WHEN 0 THEN 'Interactive'
  WHEN 1 THEN 'Subscription'
  WHEN 2 THEN 'Refresh Cache'
  ELSE 'Unknown'
END AS RequestType, 
-- SubscriptionId, 
EL.Format, 
Parameters, 
CASE(EL.ReportAction) 
  WHEN 1 THEN 'Render'
  WHEN 2 THEN 'BookmarkNavigation'
  WHEN 3 THEN 'DocumentMapNavigation'
  WHEN 4 THEN 'DrillThrough'
  WHEN 5 THEN 'FindString'
  WHEN 6 THEN 'GetDocumentMap'
  WHEN 7 THEN 'Toggle'
  WHEN 8 THEN 'Sort'
  WHEN 9 THEN 'Execute'
  ELSE 'Unknown'
END AS ItemAction,
EL.TimeStart, 
YEAR(EL.TimeStart) AS Start_Year,
MONTH(EL.TimeStart) AS Start_Month,
DATENAME(MONTH,EL.TimeStart) AS Start_Month_Name,
DATENAME(DW,EL.TimeStart) AS Start_Day_Of_Week,
DATEPART(WEEKDAY,EL.TimeStart) AS Start_Day_Number_of_Week,
EL.TimeEnd, 
EL.TimeDataRetrieval, 
EL.TimeProcessing, 
EL.TimeRendering,
CASE(EL.Source)
  WHEN 1 THEN 'Live'
  WHEN 2 THEN 'Cache'
  WHEN 3 THEN 'Snapshot' 
  WHEN 4 THEN 'History' 
  WHEN 5 THEN 'AdHoc'
  WHEN 6 THEN 'Session'
  WHEN 7 THEN 'Rdce'
  ELSE 'Unknown'
END AS Source,
EL.Status,
EL.ByteCount,
EL.[RowCount],
EL.AdditionalInfo,
C.Name,
C.CreatedByID,
C.ModifiedByID,
C.Description,
C.CreationDate,
C.ModifiedDate,
CASE 
  WHEN C.TYPE=1 THEN 'Folder'
  WHEN C.TYPE=2 THEN 'Report'  
  WHEN C.TYPE=3 THEN 'XML' 
  WHEN C.TYPE=4 THEN 'Linked Report'
  WHEN C.TYPE=5 THEN 'Data Source'
  WHEN C.TYPE=6 THEN 'Model'
  WHEN C.TYPE=8 THEN 'Shared Dataset'
  WHEN C.TYPE=9 THEN 'Report Part'
END AS Type_Description  
FROM 
   [ReportServer$WAREHOUSE].[dbo].[ExecutionLogStorage] AS EL
  LEFT OUTER JOIN 
  [ReportServer$WAREHOUSE].[dbo].[Catalog] AS C 
  ON (EL.ReportID = C.ItemID)

--ORDER BY TimeStart DESC
GO