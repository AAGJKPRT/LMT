USE [LMT]
GO

/****** Object:  Table [dbo].[tbl_Lbr_Type]    Script Date: 08/01/2015 19:30:55 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tbl_Lbr_Type](
	[Lbr_type_id] [int] NOT NULL,
	[Lbr_Type] [varchar](100) NOT NULL,
	[Sector] [int] NOT NULL,
	[IsVerify] [char](1) NOT NULL,
 CONSTRAINT [PK_tbl_Lbr_Type] PRIMARY KEY CLUSTERED 
(
	[Lbr_type_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[tbl_Lbr_Type] ADD  CONSTRAINT [DF_tbl_Lbr_Type_Lbr_type_id]  DEFAULT ((0)) FOR [Lbr_type_id]
GO

ALTER TABLE [dbo].[tbl_Lbr_Type] ADD  CONSTRAINT [DF_tbl_Lbr_Type_Lbr_Type]  DEFAULT ('') FOR [Lbr_Type]
GO

ALTER TABLE [dbo].[tbl_Lbr_Type] ADD  CONSTRAINT [DF_tbl_Lbr_Type_Sector]  DEFAULT ((0)) FOR [Sector]
GO

ALTER TABLE [dbo].[tbl_Lbr_Type] ADD  CONSTRAINT [DF_tbl_Lbr_Type_IsVerify]  DEFAULT ('N') FOR [IsVerify]
GO


