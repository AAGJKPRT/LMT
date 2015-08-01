USE [LMT]
GO

/****** Object:  StoredProcedure [dbo].[usp_LabourRegProc]    Script Date: 08/01/2015 19:35:32 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE Proc [dbo].[usp_LabourRegProc]
(
	@OpMode						Varchar(10),
	@Reg_ID						Int,
	@Labour_Code				Varchar(50),
	@FullName					Varchar(100),
	@FatherName					Varchar(100),
	@C_Address					Nvarchar(MAX),
	@C_State					Int,
	@C_City						Int,
	@C_Pincode					Numeric(10,0),
	@P_Address					Nvarchar(MAX),
	@P_State					Int,
	@P_City						Int,
	@P_Pincode					Numeric(10,0),
	@Ph_No						Numeric(18,0),
	@SectorType					Numeric(10,0),
	@Work_Specialization		Varchar(120),
	@Experience					Varchar(100),
	@LabourType					int,
	@Ph_belonging1				Numeric(18,0),
	@Ph_belonging2				Numeric(18,0),
	@Ph_belonging3				Numeric(18,0),
	@Ph_belonging4				Numeric(18,0),
	@Experience_Type			int,
	@Verification				Char,
	@Image_Url					Varchar(MAX),
	@Doc1_Url					Varchar(MAX),
	@Doc2_Url					Varchar(MAX),
	@Doc3_Url					Varchar(MAX),
	@Doc4_Url					Varchar(MAX),
	@SupplierID					Int,
	@Wages						Varchar(10)
)
As
Begin
	if UPPER(@OpMode)='INSERT'
	Begin
		Select @Reg_ID=ISNULL(Max(Reg_ID),0)+1 From tbl_LabourRegistration
		
		Insert into tbl_LabourRegistration(Reg_ID,Labour_Code,FullName,FatherName,C_Address,CState,CCity,CPincode,P_Address,PState,PCity,PPincode,Ph_No,SectorType,
		Work_Specialization,Experience,LabourType,Ph_belonging1,Ph_belonging2,Ph_belonging3,Ph_belonging4,Experience_Type,Varification,Image_URL,Doc1_URL,Doc2_URL,Doc3_URL,Doc4_URL,SupplierID,Wages)
			values(@Reg_ID,@Labour_Code,@FullName,@FatherName,@C_Address,@C_State,@C_City,@C_Pincode,@P_Address,@P_State,@P_City,@P_Pincode,@Ph_No,@SectorType,@Work_Specialization,
					@Experience,@LabourType,@Ph_belonging1,@Ph_belonging2,@Ph_belonging3,@Ph_belonging4,@Experience_Type,@Verification,@Image_Url,@Doc1_Url,@Doc2_Url,@Doc3_Url,@Doc4_Url,@SupplierID,@Wages)
	End
	Else
	If UPPER(@OpMode)='UPDATE'
	Begin
		Update tbl_LabourRegistration Set FullName=@FullName,FatherName=@FatherName,C_Address=@C_Address,
		CState=@C_State,CCity=@C_City,CPincode=@C_Pincode,P_Address=@P_Address,PState=@P_State,PCity=@P_City,PPincode=@P_Pincode,Ph_No=@Ph_No,SectorType=@SectorType,
		Work_Specialization=@Work_Specialization,Experience=@Experience,LabourType=@LabourType,Ph_belonging1=@Ph_belonging1,Ph_belonging2=@Ph_belonging2,Ph_belonging3=@Ph_belonging3,
		Ph_belonging4=@Ph_belonging4,Experience_Type=@Experience_Type,Varification=@Verification,Image_URL=@Image_Url,Doc1_URL=@Doc1_Url,Doc2_URL=@Doc2_Url,Doc3_URL=@Doc3_Url,Doc4_URL=@Doc4_Url,SupplierID=@SupplierID,Wages=@Wages	
		Where Reg_ID=@Reg_ID
	End
	Else
	If UPPER(@OpMode)='DELETE'
	Begin
		Delete From tbl_LabourRegistration where Reg_ID=@Reg_ID
	End
	
	
	
End


GO


