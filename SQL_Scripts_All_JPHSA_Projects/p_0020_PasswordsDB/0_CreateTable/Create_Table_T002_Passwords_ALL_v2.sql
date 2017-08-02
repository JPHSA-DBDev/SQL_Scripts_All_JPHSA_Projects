--P:\p_0020_PasswordsDB\SQL\0_CreateTable\Create_Table_T002_Passwords_ALL_v2.sql

USE [d1_IT]
GO

/****** Object:  Table [dbo].[T002_Passwords_ALL]    Script Date: 2/21/2017 1:42:22 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[T002_Passwords_ALL](
	[Audience_Me_IT] [nvarchar](255) NULL,
	[Audience_e01] [int] NULL,
	[UserType_OS_SQL_Application] [nvarchar](255) NULL,
	[UserType_e02] [int] NULL,
	[UserName] [nvarchar](255) NULL,
	[password] [nvarchar](255) NULL,
	[Application] [nvarchar](255) NULL,
	[OS_user_type] [nvarchar](255) NULL,
	[OS_User_Type_e03] [int] NULL,
	[Computer_for_UserName] [nvarchar](255) NULL,
	[Notes] [nvarchar](255) NULL,
	[T002_PK] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [T002_Passwords_ALL_$_T002_PK] PRIMARY KEY CLUSTERED 
(
	[T002_PK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[T002_Passwords_ALL]  WITH CHECK ADD  CONSTRAINT [T002_Passwords_ALL_$_Audience_e01_$enum$_T002_enum_01_Value] FOREIGN KEY([Audience_e01])
REFERENCES [dbo].[T002_enum_01] ([T002_enum_01_Value])
GO

ALTER TABLE [dbo].[T002_Passwords_ALL] CHECK CONSTRAINT [T002_Passwords_ALL_$_Audience_e01_$enum$_T002_enum_01_Value]
GO

ALTER TABLE [dbo].[T002_Passwords_ALL]  WITH CHECK ADD  CONSTRAINT [T002_Passwords_ALL_$_OS_User_Type_e03_$enum$_T002_enum_03_Value] FOREIGN KEY([OS_User_Type_e03])
REFERENCES [dbo].[T002_enum_03] ([T002_enum_03_Value])
GO

ALTER TABLE [dbo].[T002_Passwords_ALL] CHECK CONSTRAINT [T002_Passwords_ALL_$_OS_User_Type_e03_$enum$_T002_enum_03_Value]
GO

ALTER TABLE [dbo].[T002_Passwords_ALL]  WITH CHECK ADD  CONSTRAINT [T002_Passwords_ALL_$_UserType_e02_$enum$_T002_enum_02_Value] FOREIGN KEY([UserType_e02])
REFERENCES [dbo].[T002_enum_02] ([T002_enum_02_Value])
GO

ALTER TABLE [dbo].[T002_Passwords_ALL] CHECK CONSTRAINT [T002_Passwords_ALL_$_UserType_e02_$enum$_T002_enum_02_Value]
GO


