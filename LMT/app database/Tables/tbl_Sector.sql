USE [LMT]
GO

/****** Object:  Table [dbo].[tbl_Sector]    Script Date: 08/01/2015 19:31:53 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tbl_Sector](
	[SectorID] [int] NOT NULL,
	[SectorName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tbl_Sector] PRIMARY KEY CLUSTERED 
(
	[SectorID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[tbl_Sector] ADD  CONSTRAINT [DF_tbl_Sector_SectorID]  DEFAULT ((0)) FOR [SectorID]
GO

ALTER TABLE [dbo].[tbl_Sector] ADD  CONSTRAINT [DF_tbl_Sector_SectorName]  DEFAULT ('') FOR [SectorName]
GO


