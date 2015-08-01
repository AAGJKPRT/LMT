USE [LMT]
GO

/****** Object:  Table [dbo].[tblUserType]    Script Date: 08/01/2015 19:33:05 ******/
SET ANSI_NULLS OFF
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING OFF
GO

CREATE TABLE [dbo].[tblUserType](
	[UserTypeID] [numeric](10, 0) NOT NULL,
	[UserType] [varchar](50) NOT NULL,
	[IsVerify] [char](1) NOT NULL,
 CONSTRAINT [PK_tblUserType] PRIMARY KEY CLUSTERED 
(
	[UserTypeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[tblUserType] ADD  CONSTRAINT [DF_tblUserType_UserTypeID]  DEFAULT ((0)) FOR [UserTypeID]
GO

ALTER TABLE [dbo].[tblUserType] ADD  CONSTRAINT [DF_tblUserType_UserType]  DEFAULT ('') FOR [UserType]
GO

ALTER TABLE [dbo].[tblUserType] ADD  CONSTRAINT [DF_tblUserType_IsVerify]  DEFAULT ('N') FOR [IsVerify]
GO


