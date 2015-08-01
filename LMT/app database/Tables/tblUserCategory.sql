USE [LMT]
GO

/****** Object:  Table [dbo].[tblUserCategory]    Script Date: 08/01/2015 19:32:44 ******/
SET ANSI_NULLS OFF
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING OFF
GO

CREATE TABLE [dbo].[tblUserCategory](
	[UserCategoryID] [numeric](10, 0) NOT NULL,
	[UserCategory] [varchar](30) NOT NULL,
	[Desp] [varchar](100) NOT NULL,
	[IsVerify] [char](1) NOT NULL,
 CONSTRAINT [PK_tblUserCategory] PRIMARY KEY CLUSTERED 
(
	[UserCategoryID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[tblUserCategory] ADD  CONSTRAINT [DF_tblUserCategory_UserCategoryID]  DEFAULT ((0)) FOR [UserCategoryID]
GO

ALTER TABLE [dbo].[tblUserCategory] ADD  CONSTRAINT [DF_tblUserCategory_UserCategory]  DEFAULT ('') FOR [UserCategory]
GO

ALTER TABLE [dbo].[tblUserCategory] ADD  CONSTRAINT [DF_tblUserCategory_Desp]  DEFAULT ('') FOR [Desp]
GO

ALTER TABLE [dbo].[tblUserCategory] ADD  CONSTRAINT [DF_tblUserCategory_IsVerify]  DEFAULT ('Y') FOR [IsVerify]
GO


