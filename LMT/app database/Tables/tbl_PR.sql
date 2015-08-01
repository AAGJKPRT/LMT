USE [LMT]
GO

/****** Object:  Table [dbo].[tbl_PR]    Script Date: 08/01/2015 19:31:30 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tbl_PR](
	[PR_ID] [int] NOT NULL,
	[Particulars] [varchar](100) NOT NULL,
	[Amount] [numeric](12, 2) NOT NULL,
	[Date] [date] NOT NULL,
	[Purpose] [varchar](100) NULL,
 CONSTRAINT [PK_tbl_PR] PRIMARY KEY CLUSTERED 
(
	[PR_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[tbl_PR] ADD  CONSTRAINT [DF_tbl_PR_PR_ID]  DEFAULT ((0)) FOR [PR_ID]
GO

ALTER TABLE [dbo].[tbl_PR] ADD  CONSTRAINT [DF_tbl_PR_Particulars]  DEFAULT ('') FOR [Particulars]
GO

ALTER TABLE [dbo].[tbl_PR] ADD  CONSTRAINT [DF_tbl_PR_Amount]  DEFAULT ((0)) FOR [Amount]
GO

ALTER TABLE [dbo].[tbl_PR] ADD  CONSTRAINT [DF_tbl_PR_Date]  DEFAULT ('') FOR [Date]
GO

ALTER TABLE [dbo].[tbl_PR] ADD  CONSTRAINT [DF_tbl_PR_Purpose]  DEFAULT ('') FOR [Purpose]
GO


