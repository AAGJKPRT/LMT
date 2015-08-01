USE [LMT]
GO

/****** Object:  Table [dbo].[tblUserRegistration]    Script Date: 08/01/2015 19:32:53 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tblUserRegistration](
	[UserID] [numeric](10, 0) NOT NULL,
	[UserName] [varchar](50) NOT NULL,
	[LoginName] [varchar](50) NOT NULL,
	[Pwd] [varchar](50) NOT NULL,
	[UserTypeID] [numeric](10, 0) NOT NULL,
	[UserCategoryID] [numeric](10, 0) NOT NULL,
	[EmailID] [varchar](100) NOT NULL,
	[IsVerify] [char](1) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[ModifyDate] [datetime] NULL,
	[ImageURL] [varchar](max) NULL,
 CONSTRAINT [PK_tblUserRegistration] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[tblUserRegistration] ADD  CONSTRAINT [DF_tblUserRegistration_UserID]  DEFAULT ((0)) FOR [UserID]
GO

ALTER TABLE [dbo].[tblUserRegistration] ADD  CONSTRAINT [DF_tblUserRegistration_UserName]  DEFAULT ('') FOR [UserName]
GO

ALTER TABLE [dbo].[tblUserRegistration] ADD  CONSTRAINT [DF_tblUserRegistration_LoginName]  DEFAULT ('') FOR [LoginName]
GO

ALTER TABLE [dbo].[tblUserRegistration] ADD  CONSTRAINT [DF_tblUserRegistration_Pwd]  DEFAULT ('') FOR [Pwd]
GO

ALTER TABLE [dbo].[tblUserRegistration] ADD  CONSTRAINT [DF_tblUserRegistration_UserTypeID]  DEFAULT ((0)) FOR [UserTypeID]
GO

ALTER TABLE [dbo].[tblUserRegistration] ADD  CONSTRAINT [DF_tblUserRegistration_UserCategoryID]  DEFAULT ((0)) FOR [UserCategoryID]
GO

ALTER TABLE [dbo].[tblUserRegistration] ADD  CONSTRAINT [DF_tblUserRegistration_EmailID]  DEFAULT ('') FOR [EmailID]
GO

ALTER TABLE [dbo].[tblUserRegistration] ADD  CONSTRAINT [DF_tblUserRegistration_IsVerify]  DEFAULT ('Y') FOR [IsVerify]
GO

ALTER TABLE [dbo].[tblUserRegistration] ADD  CONSTRAINT [DF_tblUserRegistration_CreateDate]  DEFAULT ('') FOR [CreateDate]
GO

ALTER TABLE [dbo].[tblUserRegistration] ADD  CONSTRAINT [DF_tblUserRegistration_ImageID]  DEFAULT ('') FOR [ImageURL]
GO


