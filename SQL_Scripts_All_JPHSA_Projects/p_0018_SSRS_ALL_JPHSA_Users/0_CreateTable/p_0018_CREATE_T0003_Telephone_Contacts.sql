--p_0018_CREATE_T0003_Telephone_Contacts.sql

use d3_JPHSA_All_Users
go

IF OBJECT_ID('dbo.[T003_Telephone_Contacts]') IS NOT NULL
    DROP TABLE dbo.[T003_Telephone_Contacts]


CREATE TABLE [dbo].[T003_Telephone_Contacts](
	   [T003_PK] [int] IDENTITY(1,1) NOT NULL
	  ,[Toshiba_DisplayName] [nvarchar](255) NULL
      ,[Display_For_Users] [nvarchar](55) NULL		--from [Name_from_Trudy]
      ,[ShowUsers_0_1] [bit] NULL
      ,[Ext_OLD] [nvarchar](10) NULL
      ,[Ext_Toshiba] [nvarchar](255) NULL    -- From Ext_Toshiba
      ,[Position] [nvarchar](255) NULL
      ,[Department] [nvarchar](255) NULL
      ,[Fax] [nvarchar](100) NULL
      ,[Email] [nvarchar](255) NULL
      ,[PhoneNumber] [nvarchar](100) NULL
      ,[Last_Name] [nvarchar](255) NULL
      ,[First_Name] [nvarchar](255) NULL
      ,[EB_WB] [nvarchar](15) NULL
      , [Toshiba_Directory_Type] [nvarchar](100) NULL		--From [DirectoryType]
	  , [T003_RowVersion] [timestamp] NULL,

 CONSTRAINT [T003$T003_PK] PRIMARY KEY CLUSTERED 	
(
	[T003_PK] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]


--Modified on 2/9/2017---------------------------------------

use d3_JPHSA_All_Users
go
ALTER TABLE [d3_JPHSA_All_Users].[dbo].[T003_Telephone_Contacts] 
			ALTER COLUMN [ShowUsers_0_1] bit NOT NULL

ALTER TABLE [d3_JPHSA_All_Users].[dbo].[T003_Telephone_Contacts] ADD  DEFAULT ((1)) FOR [ShowUsers_0_1]

alter table [d3_JPHSA_All_Users].[dbo].[T003_Telephone_Contacts]
			add [IT_Notes] [nvarchar](max) NULL
