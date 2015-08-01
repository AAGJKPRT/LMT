USE [LMT]
GO

/****** Object:  Table [dbo].[ECICalendarEvent_Test]    Script Date: 08/01/2015 19:28:54 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[ECICalendarEvent_Test](
	[event_id] [int] IDENTITY(1,1) NOT NULL,
	[description] [varchar](200) NOT NULL,
	[title] [varchar](100) NOT NULL,
	[event_start] [datetime] NOT NULL,
	[event_end] [datetime] NOT NULL,
	[all_day] [bit] NOT NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[ECICalendarEvent_Test] ADD  CONSTRAINT [DF_ECICalendarEvent_Test_description]  DEFAULT ('') FOR [description]
GO

ALTER TABLE [dbo].[ECICalendarEvent_Test] ADD  CONSTRAINT [DF_ECICalendarEvent_Test_title]  DEFAULT ('') FOR [title]
GO


