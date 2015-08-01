USE [LMT]
GO

/****** Object:  Table [dbo].[tbl_SupplierDetail]    Script Date: 08/01/2015 19:32:06 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tbl_SupplierDetail](
	[SupplierID] [int] NOT NULL,
	[SupplierCode] [varchar](50) NOT NULL,
	[FullName] [varchar](70) NOT NULL,
	[Address] [varchar](max) NOT NULL,
	[Sup_City] [int] NOT NULL,
	[Sup_State] [int] NOT NULL,
	[Pincode] [numeric](10, 0) NOT NULL,
	[Sup_Mobile] [numeric](10, 0) NOT NULL,
	[EmailID] [varchar](100) NOT NULL,
	[CompanyName] [varchar](70) NOT NULL,
	[BankName] [varchar](50) NOT NULL,
	[BankACNo] [varchar](50) NOT NULL,
	[AC_IFSC_Code] [varchar](10) NOT NULL,
	[Doc1_Url] [varchar](max) NOT NULL,
	[Doc2_Url] [varchar](max) NULL,
	[Image_Url] [varchar](max) NOT NULL,
	[MemberShip] [char](1) NOT NULL,
 CONSTRAINT [PK_tbl_SupplierDetail_1] PRIMARY KEY CLUSTERED 
(
	[SupplierID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[tbl_SupplierDetail] ADD  CONSTRAINT [DF_tbl_SupplierDetail_SupplierID]  DEFAULT ((0)) FOR [SupplierID]
GO

ALTER TABLE [dbo].[tbl_SupplierDetail] ADD  CONSTRAINT [DF_tbl_SupplierDetail_SupplierCode]  DEFAULT ('') FOR [SupplierCode]
GO

ALTER TABLE [dbo].[tbl_SupplierDetail] ADD  CONSTRAINT [DF_tbl_SupplierDetail_FullName]  DEFAULT ('') FOR [FullName]
GO

ALTER TABLE [dbo].[tbl_SupplierDetail] ADD  CONSTRAINT [DF_tbl_SupplierDetail_Address]  DEFAULT ('') FOR [Address]
GO

ALTER TABLE [dbo].[tbl_SupplierDetail] ADD  CONSTRAINT [DF_tbl_SupplierDetail_Sup_City]  DEFAULT ((0)) FOR [Sup_City]
GO

ALTER TABLE [dbo].[tbl_SupplierDetail] ADD  CONSTRAINT [DF_tbl_SupplierDetail_Sup_State]  DEFAULT ((0)) FOR [Sup_State]
GO

ALTER TABLE [dbo].[tbl_SupplierDetail] ADD  CONSTRAINT [DF_tbl_SupplierDetail_Pincode]  DEFAULT ((0)) FOR [Pincode]
GO

ALTER TABLE [dbo].[tbl_SupplierDetail] ADD  CONSTRAINT [DF_tbl_SupplierDetail_Sup_Mobile]  DEFAULT ((0)) FOR [Sup_Mobile]
GO

ALTER TABLE [dbo].[tbl_SupplierDetail] ADD  CONSTRAINT [DF_tbl_SupplierDetail_EmailID_1]  DEFAULT ('') FOR [EmailID]
GO

ALTER TABLE [dbo].[tbl_SupplierDetail] ADD  CONSTRAINT [DF_tbl_SupplierDetail_CompanyName_1]  DEFAULT ('') FOR [CompanyName]
GO

ALTER TABLE [dbo].[tbl_SupplierDetail] ADD  CONSTRAINT [DF_tbl_SupplierDetail_BankName]  DEFAULT ('') FOR [BankName]
GO

ALTER TABLE [dbo].[tbl_SupplierDetail] ADD  CONSTRAINT [DF_tbl_SupplierDetail_BankACNo]  DEFAULT ('') FOR [BankACNo]
GO

ALTER TABLE [dbo].[tbl_SupplierDetail] ADD  CONSTRAINT [DF_tbl_SupplierDetail_AC_IFSC_Code]  DEFAULT ('') FOR [AC_IFSC_Code]
GO

ALTER TABLE [dbo].[tbl_SupplierDetail] ADD  CONSTRAINT [DF_tbl_SupplierDetail_Doc1_Url_1]  DEFAULT ('') FOR [Doc1_Url]
GO

ALTER TABLE [dbo].[tbl_SupplierDetail] ADD  CONSTRAINT [DF_tbl_SupplierDetail_Doc2_Url_1]  DEFAULT ('') FOR [Doc2_Url]
GO

ALTER TABLE [dbo].[tbl_SupplierDetail] ADD  CONSTRAINT [DF_tbl_SupplierDetail_Image_Url_1]  DEFAULT ('') FOR [Image_Url]
GO

ALTER TABLE [dbo].[tbl_SupplierDetail] ADD  CONSTRAINT [DF_tbl_SupplierDetail_MemberShip_1]  DEFAULT ('N') FOR [MemberShip]
GO


