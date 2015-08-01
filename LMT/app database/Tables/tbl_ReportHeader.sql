USE [LMT]
GO

/****** Object:  Table [dbo].[tbl_ReportHeader]    Script Date: 08/01/2015 19:31:41 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tbl_ReportHeader](
	[CompanyName] [varchar](100) NULL,
	[Address1] [varchar](100) NULL,
	[Address2] [varchar](100) NULL,
	[Phone1] [varchar](50) NULL,
	[Phone2] [varchar](50) NULL,
	[Mobile] [varchar](50) NULL,
	[Website] [varchar](50) NULL,
	[Email] [varchar](50) NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[tbl_ReportHeader] ADD  CONSTRAINT [DF_tbl_ReportHeader_Mobile]  DEFAULT ('') FOR [Mobile]
GO


