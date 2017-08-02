--p_0031_RES_903_STEP_3__zzz_q014_ALL__v0.sql
--NOTE Missing the two fields, will have to add them into the CREATE table step, and then subsequent steps

use OBH_DATA_REVIEW
go


IF OBJECT_ID('dbo.zzz_q014_ALL') IS NOT NULL
    DROP TABLE dbo.zzz_q014_ALL
go


CREATE TABLE [dbo].[zzz_q014_ALL](
	[TheDataSource] [Nvarchar](255) NOT NULL,
	[Archive_flag] [bit] NOT NULL,
	[Archived_LAST_flag] [bit] NOT NULL,
	[Service_PK] [float] NULL,
	[Demo_FK] [float] NULL,
	[SERV_DATE] [datetime] NULL,
    [PV_SERV] [Nvarchar](255) NULL,
	[SERVICE] [Nvarchar](255) NULL
) ON [PRIMARY]

GO


INSERT INTO [zzz_q014_ALL]
SELECT 
	  'Donna_Doolen_20170727' as TheDataSource
	  ,[Archive_flag]
      ,[Archived_LAST_flag]
      ,[Service_PK]
      ,[Demo_FK]
      ,[SERV_DATE]
	  ,[PV_SERV]
	  ,[SERVICE]
  FROM [OBH_DATA_REVIEW].[dbo].[aaa_q014_Donna_Doolen_20170727]

INSERT INTO [zzz_q014_ALL]
SELECT 
	  'Jen_Bruchi_20170724' as TheDataSource
	  , [Archive_flag]
      ,[Archived_LAST_flag]
      ,[Service_PK]
      ,[Demo_FK]
      ,[SERV_DATE]
	  ,[PV_SERV]
	  ,[SERVICE]
  FROM [OBH_DATA_REVIEW].[dbo].[aaa_q014_Jen_Bruchi_20170724]