USE [LMT]
GO

/****** Object:  Table [dbo].[tbl_Leads]    Script Date: 08/01/2015 19:31:06 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tbl_Leads](
	[Lead_ID] [int] NOT NULL,
	[Labour_ID] [int] NOT NULL,
	[Customer_ID] [int] NOT NULL,
	[Required_Date] [date] NOT NULL,
	[Required_Time] [varchar](20) NOT NULL,
	[Status] [varchar](20) NOT NULL,
	[Asign] [int] NULL,
	[Ticket] [varchar](20) NOT NULL,
	[CurrentDate] [date] NOT NULL,
	[Description] [varchar](max) NULL,
 CONSTRAINT [PK_tbl_Leads] PRIMARY KEY CLUSTERED 
(
	[Lead_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[tbl_Leads] ADD  CONSTRAINT [DF_tbl_Leads_Lead_ID]  DEFAULT ((0)) FOR [Lead_ID]
GO

ALTER TABLE [dbo].[tbl_Leads] ADD  CONSTRAINT [DF_tbl_Leads_Labour_ID]  DEFAULT ((0)) FOR [Labour_ID]
GO

ALTER TABLE [dbo].[tbl_Leads] ADD  CONSTRAINT [DF_tbl_Leads_Customer_ID]  DEFAULT ((0)) FOR [Customer_ID]
GO

ALTER TABLE [dbo].[tbl_Leads] ADD  CONSTRAINT [DF_tbl_Leads_Required_Date]  DEFAULT ('') FOR [Required_Date]
GO

ALTER TABLE [dbo].[tbl_Leads] ADD  CONSTRAINT [DF_tbl_Leads_Required_Time]  DEFAULT ('') FOR [Required_Time]
GO

ALTER TABLE [dbo].[tbl_Leads] ADD  CONSTRAINT [DF_tbl_Leads_Status]  DEFAULT ('') FOR [Status]
GO

ALTER TABLE [dbo].[tbl_Leads] ADD  CONSTRAINT [DF_tbl_Leads_Ticket]  DEFAULT ('') FOR [Ticket]
GO

ALTER TABLE [dbo].[tbl_Leads] ADD  CONSTRAINT [DF_tbl_Leads_CurrentDate]  DEFAULT ('') FOR [CurrentDate]
GO


