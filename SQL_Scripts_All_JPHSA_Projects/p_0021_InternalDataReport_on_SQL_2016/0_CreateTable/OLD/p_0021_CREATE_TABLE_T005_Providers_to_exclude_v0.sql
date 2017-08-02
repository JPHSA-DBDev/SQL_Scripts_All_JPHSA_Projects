--p_0021_CREATE_TABLE_T005_Providers_to_exclude_IDR_v0.sql
/*
	************************************************************************************
	NOTE: 
	Uses: 
	Created: 04/13/2017 

	By: glenn garson
	************************************************************************************
*/
USE [Success]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[T005_Providers_to_exclude](
		[T005_PK] [int] IDENTITY(1,1) NOT NULL,
		[ProviderName] [nvarchar](100) NULL,
		[T005_RowVersion] [timestamp] NULL
	,CONSTRAINT [T005_Providers_to_exclude$T005_PK] PRIMARY KEY NONCLUSTERED 
		(
			[T005_PK] ASC
		)
		WITH 
				(
					PAD_INDEX  = OFF, 
					STATISTICS_NORECOMPUTE  = OFF, 
					IGNORE_DUP_KEY = OFF, 
					ALLOW_ROW_LOCKS  = ON, 
					ALLOW_PAGE_LOCKS  = ON
				) ON [PRIMARY]

)

GO


