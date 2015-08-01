USE [LMT]
GO

/****** Object:  Table [dbo].[tbl_Customer]    Script Date: 08/01/2015 19:30:08 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tbl_Customer](
	[Customer_ID] [int] NOT NULL,
	[Name] [varchar](70) NOT NULL,
	[EmailID] [varchar](70) NOT NULL,
	[MobileNo] [varchar](10) NOT NULL,
	[Address1] [varchar](70) NOT NULL,
	[Address2] [varchar](70) NOT NULL,
	[Password] [varchar](20) NOT NULL,
	[Ticket] [varchar](20) NOT NULL,
 CONSTRAINT [PK_tbl_Customer] PRIMARY KEY CLUSTERED 
(
	[Customer_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[tbl_Customer] ADD  CONSTRAINT [DF_tbl_Customer_Customer_ID]  DEFAULT ((0)) FOR [Customer_ID]
GO

ALTER TABLE [dbo].[tbl_Customer] ADD  CONSTRAINT [DF_tbl_Customer_Name]  DEFAULT ('') FOR [Name]
GO

ALTER TABLE [dbo].[tbl_Customer] ADD  CONSTRAINT [DF_tbl_Customer_EmailID]  DEFAULT ('') FOR [EmailID]
GO

ALTER TABLE [dbo].[tbl_Customer] ADD  CONSTRAINT [DF_tbl_Customer_MobileNo]  DEFAULT ('') FOR [MobileNo]
GO

ALTER TABLE [dbo].[tbl_Customer] ADD  CONSTRAINT [DF_tbl_Customer_Address1]  DEFAULT ('') FOR [Address1]
GO

ALTER TABLE [dbo].[tbl_Customer] ADD  CONSTRAINT [DF_tbl_Customer_Address2]  DEFAULT ('') FOR [Address2]
GO

ALTER TABLE [dbo].[tbl_Customer] ADD  CONSTRAINT [DF_tbl_Customer_Password]  DEFAULT ('') FOR [Password]
GO

ALTER TABLE [dbo].[tbl_Customer] ADD  CONSTRAINT [DF_tbl_Customer_Ticket]  DEFAULT ('') FOR [Ticket]
GO


