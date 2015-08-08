
GO
/****** Object:  StoredProcedure [dbo].[usp_GetAllSupplierList]    Script Date: 08/09/2015 01:14:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_GetAllSupplierList]
as
Begin
		 
	select SupplierID,SupplierCode,FullName as SupplierName from dbo.tbl_SupplierDetail
		
End
