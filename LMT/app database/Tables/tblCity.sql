USE [LMT]
GO

/****** Object:  Table [dbo].[tblCity]    Script Date: 08/01/2015 19:32:19 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tblCity](
	[CityID] [numeric](10, 0) NOT NULL,
	[CityName] [varchar](40) NOT NULL,
	[StateID] [numeric](10, 0) NOT NULL,
	[CityCode] [varchar](2) NOT NULL,
	[IsVerify] [char](1) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[ModifyDate] [datetime] NULL,
	[UserID] [numeric](10, 0) NOT NULL,
 CONSTRAINT [PK_tblCity] PRIMARY KEY CLUSTERED 
(
	[CityID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[tblCity] ADD  CONSTRAINT [DF_tblCity_CityID]  DEFAULT ((0)) FOR [CityID]
GO

ALTER TABLE [dbo].[tblCity] ADD  CONSTRAINT [DF_tblCity_CityName]  DEFAULT ('') FOR [CityName]
GO

ALTER TABLE [dbo].[tblCity] ADD  CONSTRAINT [DF_tblCity_StateID]  DEFAULT ((0)) FOR [StateID]
GO

ALTER TABLE [dbo].[tblCity] ADD  CONSTRAINT [DF_tblCity_CityCode]  DEFAULT ('') FOR [CityCode]
GO

ALTER TABLE [dbo].[tblCity] ADD  CONSTRAINT [DF_tblCity_IsVerify]  DEFAULT ('N') FOR [IsVerify]
GO

ALTER TABLE [dbo].[tblCity] ADD  CONSTRAINT [DF_tblCity_CreateDate]  DEFAULT ('') FOR [CreateDate]
GO

ALTER TABLE [dbo].[tblCity] ADD  CONSTRAINT [DF_tblCity_UserID]  DEFAULT ((0)) FOR [UserID]
GO


