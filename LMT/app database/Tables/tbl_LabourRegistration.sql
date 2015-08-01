USE [LMT]
GO

/****** Object:  Table [dbo].[tbl_LabourRegistration]    Script Date: 08/01/2015 19:30:43 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tbl_LabourRegistration](
	[Reg_ID] [int] NOT NULL,
	[Labour_Code] [varchar](50) NOT NULL,
	[FullName] [varchar](100) NOT NULL,
	[FatherName] [varchar](100) NOT NULL,
	[C_Address] [nvarchar](max) NOT NULL,
	[CState] [int] NOT NULL,
	[CCity] [int] NOT NULL,
	[CPincode] [numeric](10, 0) NOT NULL,
	[P_Address] [nvarchar](max) NOT NULL,
	[PState] [int] NOT NULL,
	[PCity] [int] NOT NULL,
	[PPincode] [numeric](10, 0) NOT NULL,
	[Ph_No] [numeric](18, 0) NOT NULL,
	[SectorType] [numeric](10, 0) NOT NULL,
	[Work_Specialization] [varchar](120) NOT NULL,
	[Experience] [varchar](100) NOT NULL,
	[LabourType] [int] NOT NULL,
	[Ph_belonging1] [numeric](18, 0) NOT NULL,
	[Ph_belonging2] [numeric](18, 0) NOT NULL,
	[Ph_belonging3] [numeric](18, 0) NOT NULL,
	[Ph_belonging4] [numeric](18, 0) NOT NULL,
	[Experience_Type] [int] NOT NULL,
	[Varification] [char](1) NOT NULL,
	[Image_URL] [varchar](max) NOT NULL,
	[Doc1_URL] [varchar](max) NOT NULL,
	[Doc2_URL] [varchar](max) NOT NULL,
	[Doc3_URL] [varchar](max) NOT NULL,
	[Doc4_URL] [varchar](max) NOT NULL,
	[SupplierID] [int] NOT NULL,
	[Wages] [varchar](10) NOT NULL,
 CONSTRAINT [PK_tbl_LabourRegistration] PRIMARY KEY CLUSTERED 
(
	[Reg_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[tbl_LabourRegistration] ADD  CONSTRAINT [DF_tbl_LabourRegistration_Reg_ID]  DEFAULT ((0)) FOR [Reg_ID]
GO

ALTER TABLE [dbo].[tbl_LabourRegistration] ADD  CONSTRAINT [DF_tbl_LabourRegistration_Labour_Code]  DEFAULT ('') FOR [Labour_Code]
GO

ALTER TABLE [dbo].[tbl_LabourRegistration] ADD  CONSTRAINT [DF_tbl_LabourRegistration_FullName]  DEFAULT ('') FOR [FullName]
GO

ALTER TABLE [dbo].[tbl_LabourRegistration] ADD  CONSTRAINT [DF_tbl_LabourRegistration_FatherName]  DEFAULT ('') FOR [FatherName]
GO

ALTER TABLE [dbo].[tbl_LabourRegistration] ADD  CONSTRAINT [DF_tbl_LabourRegistration_C_Address]  DEFAULT ('') FOR [C_Address]
GO

ALTER TABLE [dbo].[tbl_LabourRegistration] ADD  CONSTRAINT [DF_tbl_LabourRegistration_State]  DEFAULT ((0)) FOR [CState]
GO

ALTER TABLE [dbo].[tbl_LabourRegistration] ADD  CONSTRAINT [DF_tbl_LabourRegistration_City]  DEFAULT ((0)) FOR [CCity]
GO

ALTER TABLE [dbo].[tbl_LabourRegistration] ADD  CONSTRAINT [DF_tbl_LabourRegistration_CPincode]  DEFAULT ((0)) FOR [CPincode]
GO

ALTER TABLE [dbo].[tbl_LabourRegistration] ADD  CONSTRAINT [DF_tbl_LabourRegistration_P_Address]  DEFAULT ('') FOR [P_Address]
GO

ALTER TABLE [dbo].[tbl_LabourRegistration] ADD  CONSTRAINT [DF_tbl_LabourRegistration_PState]  DEFAULT ((0)) FOR [PState]
GO

ALTER TABLE [dbo].[tbl_LabourRegistration] ADD  CONSTRAINT [DF_tbl_LabourRegistration_PCity]  DEFAULT ((0)) FOR [PCity]
GO

ALTER TABLE [dbo].[tbl_LabourRegistration] ADD  CONSTRAINT [DF_tbl_LabourRegistration_PPincode]  DEFAULT ((0)) FOR [PPincode]
GO

ALTER TABLE [dbo].[tbl_LabourRegistration] ADD  CONSTRAINT [DF_tbl_LabourRegistration_Ph_No]  DEFAULT ((0)) FOR [Ph_No]
GO

ALTER TABLE [dbo].[tbl_LabourRegistration] ADD  CONSTRAINT [DF_tbl_LabourRegistration_PinCode]  DEFAULT ((0)) FOR [SectorType]
GO

ALTER TABLE [dbo].[tbl_LabourRegistration] ADD  CONSTRAINT [DF_tbl_LabourRegistration_Work_Specialization]  DEFAULT ('') FOR [Work_Specialization]
GO

ALTER TABLE [dbo].[tbl_LabourRegistration] ADD  CONSTRAINT [DF_tbl_LabourRegistration_Experience]  DEFAULT ('') FOR [Experience]
GO

ALTER TABLE [dbo].[tbl_LabourRegistration] ADD  CONSTRAINT [DF_tbl_LabourRegistration_LabourType]  DEFAULT ((0)) FOR [LabourType]
GO

ALTER TABLE [dbo].[tbl_LabourRegistration] ADD  CONSTRAINT [DF_tbl_LabourRegistration_Ph_belonging1]  DEFAULT ((0)) FOR [Ph_belonging1]
GO

ALTER TABLE [dbo].[tbl_LabourRegistration] ADD  CONSTRAINT [DF_tbl_LabourRegistration_Ph_belonging2]  DEFAULT ((0)) FOR [Ph_belonging2]
GO

ALTER TABLE [dbo].[tbl_LabourRegistration] ADD  CONSTRAINT [DF_tbl_LabourRegistration_Ph_belonging3]  DEFAULT ((0)) FOR [Ph_belonging3]
GO

ALTER TABLE [dbo].[tbl_LabourRegistration] ADD  CONSTRAINT [DF_tbl_LabourRegistration_Ph_belonging4]  DEFAULT ((0)) FOR [Ph_belonging4]
GO

ALTER TABLE [dbo].[tbl_LabourRegistration] ADD  CONSTRAINT [DF_tbl_LabourRegistration_Experience_Type]  DEFAULT ((0)) FOR [Experience_Type]
GO

ALTER TABLE [dbo].[tbl_LabourRegistration] ADD  CONSTRAINT [DF_tbl_LabourRegistration_Varification]  DEFAULT ('N') FOR [Varification]
GO

ALTER TABLE [dbo].[tbl_LabourRegistration] ADD  CONSTRAINT [DF_tbl_LabourRegistration_Image_URL]  DEFAULT ('') FOR [Image_URL]
GO

ALTER TABLE [dbo].[tbl_LabourRegistration] ADD  CONSTRAINT [DF_tbl_LabourRegistration_Doc_URL]  DEFAULT ('') FOR [Doc1_URL]
GO

ALTER TABLE [dbo].[tbl_LabourRegistration] ADD  CONSTRAINT [DF_tbl_LabourRegistration_Doc2_URL]  DEFAULT ('') FOR [Doc2_URL]
GO

ALTER TABLE [dbo].[tbl_LabourRegistration] ADD  CONSTRAINT [DF_tbl_LabourRegistration_Doc3_URL]  DEFAULT ('') FOR [Doc3_URL]
GO

ALTER TABLE [dbo].[tbl_LabourRegistration] ADD  CONSTRAINT [DF_tbl_LabourRegistration_Doc4_URL]  DEFAULT ('') FOR [Doc4_URL]
GO

ALTER TABLE [dbo].[tbl_LabourRegistration] ADD  CONSTRAINT [DF_tbl_LabourRegistration_SupplierID]  DEFAULT ((0)) FOR [SupplierID]
GO

ALTER TABLE [dbo].[tbl_LabourRegistration] ADD  CONSTRAINT [DF_tbl_LabourRegistration_Wages]  DEFAULT ((0)) FOR [Wages]
GO


