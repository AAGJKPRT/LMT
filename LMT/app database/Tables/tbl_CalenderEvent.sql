USE [LMT]
GO

/****** Object:  Table [dbo].[tbl_CalenderEvent]    Script Date: 08/01/2015 19:29:51 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tbl_CalenderEvent](
	[EventName] [nvarchar](100) NOT NULL,
	[EventDescp] [nvarchar](max) NOT NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NOT NULL
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[tbl_CalenderEvent] ADD  CONSTRAINT [DF_tbl_CalenderEvent_EventName]  DEFAULT ('') FOR [EventName]
GO

ALTER TABLE [dbo].[tbl_CalenderEvent] ADD  CONSTRAINT [DF_tbl_CalenderEvent_EventDescp]  DEFAULT ('') FOR [EventDescp]
GO

ALTER TABLE [dbo].[tbl_CalenderEvent] ADD  CONSTRAINT [DF_tbl_CalenderEvent_StartDate]  DEFAULT ('') FOR [StartDate]
GO

ALTER TABLE [dbo].[tbl_CalenderEvent] ADD  CONSTRAINT [DF_tbl_CalenderEvent_EndDate]  DEFAULT ('') FOR [EndDate]
GO


