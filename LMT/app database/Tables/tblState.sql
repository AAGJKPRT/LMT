USE [LMT]
GO

/****** Object:  Table [dbo].[tblState]    Script Date: 08/01/2015 19:32:33 ******/
SET ANSI_NULLS OFF
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING OFF
GO

CREATE TABLE [dbo].[tblState](
	[StateID] [numeric](10, 0) NOT NULL,
	[StateName] [varchar](40) NOT NULL,
	[CountryID] [numeric](10, 0) NOT NULL,
	[IsVerify] [char](1) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[ModifyDate] [datetime] NULL,
	[UserID] [numeric](10, 0) NOT NULL,
 CONSTRAINT [PK_tblState] PRIMARY KEY CLUSTERED 
(
	[StateID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[tblState] ADD  CONSTRAINT [DF_tblState_StateID]  DEFAULT ((0)) FOR [StateID]
GO

ALTER TABLE [dbo].[tblState] ADD  CONSTRAINT [DF_tblState_StateName]  DEFAULT ('') FOR [StateName]
GO

ALTER TABLE [dbo].[tblState] ADD  CONSTRAINT [DF_tblState_CountryID]  DEFAULT ((0)) FOR [CountryID]
GO

ALTER TABLE [dbo].[tblState] ADD  CONSTRAINT [DF_tblState_IsVerify]  DEFAULT ('N') FOR [IsVerify]
GO

ALTER TABLE [dbo].[tblState] ADD  CONSTRAINT [DF_tblState_CreateDate]  DEFAULT ('') FOR [CreateDate]
GO

ALTER TABLE [dbo].[tblState] ADD  CONSTRAINT [DF_tblState_ModifyDate]  DEFAULT ('') FOR [ModifyDate]
GO

ALTER TABLE [dbo].[tblState] ADD  CONSTRAINT [DF_tblState_UserID]  DEFAULT ((0)) FOR [UserID]
GO


