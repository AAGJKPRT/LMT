USE [LMT]
GO

/****** Object:  Table [dbo].[tbl_Expenses]    Script Date: 08/01/2015 19:30:28 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tbl_Expenses](
	[Exp_ID] [int] NOT NULL,
	[Exp_Date] [date] NOT NULL,
	[Exp_Type] [varchar](50) NOT NULL,
	[Exp_Amount] [varchar](50) NOT NULL,
	[Exp_ToWhome] [varchar](50) NOT NULL,
	[Exp_Under] [varchar](100) NOT NULL,
 CONSTRAINT [PK_tbl_Expenses] PRIMARY KEY CLUSTERED 
(
	[Exp_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[tbl_Expenses] ADD  CONSTRAINT [DF_tbl_Expenses_Exp_ID]  DEFAULT ((0)) FOR [Exp_ID]
GO

ALTER TABLE [dbo].[tbl_Expenses] ADD  CONSTRAINT [DF_tbl_Expenses_Exp_Date]  DEFAULT ('') FOR [Exp_Date]
GO

ALTER TABLE [dbo].[tbl_Expenses] ADD  CONSTRAINT [DF_tbl_Expenses_Exp_Type]  DEFAULT ('') FOR [Exp_Type]
GO

ALTER TABLE [dbo].[tbl_Expenses] ADD  CONSTRAINT [DF_tbl_Expenses_Exp_Amount]  DEFAULT ('') FOR [Exp_Amount]
GO

ALTER TABLE [dbo].[tbl_Expenses] ADD  CONSTRAINT [DF_tbl_Expenses_Exp_ToWhome]  DEFAULT ('') FOR [Exp_ToWhome]
GO

ALTER TABLE [dbo].[tbl_Expenses] ADD  CONSTRAINT [DF_tbl_Expenses_Exp_Under]  DEFAULT ('') FOR [Exp_Under]
GO


