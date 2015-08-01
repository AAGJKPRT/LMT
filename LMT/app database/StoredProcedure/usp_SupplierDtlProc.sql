USE [LMT]
GO

/****** Object:  StoredProcedure [dbo].[usp_SupplierDtlProc]    Script Date: 08/01/2015 19:37:12 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE Proc [dbo].[usp_SupplierDtlProc]
(
	@OpMode						Varchar(10),
	@Supplier_ID				Int,
	@Supplier_Code				Varchar(50),
	@FullName					Varchar(100),
	@Address					Varchar(MAX),
	@Sup_State					Int,
	@Sup_City					Int,
	@Sup_Pincode				Numeric(10,0),
	@Sup_Mobile					Numeric(18,0),
	@EmailID					Varchar(100),
	@CompanyName				Varchar(70),
	@BankName					Varchar(50),
	@Bank_AC_No					Varchar(50),
	@AC_IFCS_Code				Varchar(10),
	@Doc1_Url					Varchar(MAX),
	@Doc2_Url					Varchar(MAX),
	@Image_Url					Varchar(MAX),
	@Membership					Char
)
As
Begin
	if UPPER(@OpMode)='INSERT'
	Begin
		--Select @Supplier_ID=ISNULL(Max(SupplierID),0)+1 From tbl_SupplierDetail
		
		Insert into tbl_SupplierDetail(SupplierID,SupplierCode,FullName,Address,Sup_City,Sup_State,Pincode,Sup_Mobile,EmailID,CompanyName,BankName,BankACNo,AC_IFSC_Code,Doc1_Url,Doc2_Url,Image_URL,MemberShip)
			values(@Supplier_ID,@Supplier_Code,@FullName,@Address,@Sup_City,@Sup_State,@Sup_Pincode,@Sup_Mobile,@EmailID,@CompanyName,@BankName,@Bank_AC_No,@AC_IFCS_Code,@Doc1_Url,@Doc2_Url,@Image_Url,@Membership)
	End
	Else
	If UPPER(@OpMode)='UPDATE'
	Begin
		Update tbl_SupplierDetail Set FullName=@FullName,Address=@Address,Sup_City=@Sup_City,
		Sup_State=@Sup_State,Pincode=@Sup_Pincode,Sup_Mobile=@Sup_Mobile,EmailID=@EmailID,CompanyName=@CompanyName,BankName=@BankName,
		BankACNo=@Bank_AC_No,AC_IFSC_Code=@AC_IFCS_Code,Doc1_Url=@Doc1_Url,Doc2_Url=@Doc2_Url,Image_Url=@Image_Url,MemberShip=@Membership
		Where SupplierID=@Supplier_ID
		Update tblUserRegistration Set UserName=@FullName where UserID=@Supplier_ID
	End
	Else
	If UPPER(@OpMode)='DELETE'
	Begin
		Delete From tbl_SupplierDetail where SupplierID=@Supplier_ID
		Delete From tblUserRegistration Where UserID=@Supplier_ID
		Delete From tbl_LabourRegistration where SupplierID=@Supplier_ID
	End
	
	
	
End


GO


