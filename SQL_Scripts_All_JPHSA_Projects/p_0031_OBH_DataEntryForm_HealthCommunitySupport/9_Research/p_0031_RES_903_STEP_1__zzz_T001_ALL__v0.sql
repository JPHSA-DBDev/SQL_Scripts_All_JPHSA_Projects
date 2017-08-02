--p_0031_RES_903_STEP_1__zzz_T001_ALL__v0.sql

IF OBJECT_ID('dbo.zzz_T001_ALL') IS NOT NULL
    DROP TABLE dbo.zzz_T001_ALL

go

CREATE TABLE [dbo].[zzz_T001_ALL](
	[TheDataSource] [Nvarchar](255) NOT NULL,
	[DEMO_PK] [INT] NULL,
	[NAME_F] [nvarchar](255) NULL,
	[NAME_L] [nvarchar](255) NULL,
	[NAME_M] [nvarchar](255) NULL,
	[DOB] [datetime] NULL,
	[SSN] [nvarchar](255) NULL,
	[CITY] [nvarchar](255) NULL,
	[ZIP] [nvarchar](255) NULL,
	[GENDER] [nvarchar](255) NULL,
	[RACE] [nvarchar](255) NULL,
	[ETHNICITY] [nvarchar](255) NULL,
	[SEXUAL_ORIENTATION] [nvarchar](255) NULL,
	[HH_INCOME_1] [nvarchar](255) NULL,
	[INC_WAGE] [int] NULL,
	[IRS_DEP_NUM] [int] NULL,
	[LANGUAGE1] [nvarchar](255) NULL,
	[VA_ST] [nvarchar](255) NULL
) ON [PRIMARY]

INSERT INTO zzz_T001_ALL
SELECT 
	  'Jen_Bruchi_20170724' as TheDataSource
	  ,[DEMO_PK]
      ,[NAME_F]
      ,[NAME_L]
      ,[NAME_M]
      ,[DOB]
      ,[SSN]
      ,[CITY]
      ,[ZIP]
      ,[GENDER]
      ,[RACE]
      ,[ETHNICITY]
      ,[SEXUAL_ORIENTATION]
      ,[HH_INCOME_1]
      ,[INC_WAGE]
      ,[IRS_DEP_NUM]
      ,[LANGUAGE1]
      ,[VA_ST]
  --INTO zzz_T001_ALL
 FROM [OBH_DATA_REVIEW].[dbo].[aaa_T001_Jen_Bruchi_20170724]
  WHERE [NAME_F] not like 'zzz%'

  INSERT INTO zzz_T001_ALL
  SELECT 
	  'Donna_Doolen_20170727' as TheDataSource
	  ,[DEMO_PK]
      ,[NAME_F]
      ,[NAME_L]
      ,[NAME_M]
      ,[DOB]
      ,[SSN]
      ,[CITY]
      ,[ZIP]
      ,[GENDER]
      ,[RACE]
      ,[ETHNICITY]
      ,[SEXUAL_ORIENTATION]
      ,[HH_INCOME_1]
      ,[INC_WAGE]
      ,[IRS_DEP_NUM]
      ,[LANGUAGE1]
      ,[VA_ST]
  FROM [OBH_DATA_REVIEW].[dbo].[aaa_T001_Donna_Doolen_20170727]
  WHERE [NAME_F] not like 'zzz%'