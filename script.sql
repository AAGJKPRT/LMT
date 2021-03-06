
GO
/****** Object:  Database [LMT]    Script Date: 7/29/2015 2:37:12 PM ******/
CREATE DATABASE [LMT]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'LMS', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\LMS.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'LMS_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\LMS_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [LMT] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [LMT].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [LMT] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [LMT] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [LMT] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [LMT] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [LMT] SET ARITHABORT OFF 
GO
ALTER DATABASE [LMT] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [LMT] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [LMT] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [LMT] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [LMT] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [LMT] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [LMT] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [LMT] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [LMT] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [LMT] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [LMT] SET  DISABLE_BROKER 
GO
ALTER DATABASE [LMT] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [LMT] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [LMT] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [LMT] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [LMT] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [LMT] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [LMT] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [LMT] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [LMT] SET  MULTI_USER 
GO
ALTER DATABASE [LMT] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [LMT] SET DB_CHAINING OFF 
GO
ALTER DATABASE [LMT] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [LMT] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [LMT]
GO
/****** Object:  StoredProcedure [dbo].[usp_CityProc]    Script Date: 7/29/2015 2:37:12 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE proc [dbo].[usp_CityProc]
(
	@opMode			Varchar(25),
	@CityID			Numeric(10,0),
	@CityName		Varchar(40),
	@StateID		Numeric(10,0),
	@CityCode		Varchar(2),
	@IsVerify		Char(1),
	@UserID			Numeric(10,0)

)
As
Begin
	if upper(@opMode)='INSERT'
	Begin
		Select @CityID=ISNULL(Max(CityID),0)+1 From tblCity
		
		Insert into tblCity(CityID,CityName,StateID,CityCode,IsVerify,CreateDate,UserID) 
			values(@CityID,@CityName,@StateID,@CityCode,@IsVerify,GETDATE(),@UserID)
	End		
	Else if UPPER(@opMode)='UPDATE'
	Begin
		Update tblCity Set CityName=@CityName,StateID=@StateID,CityCode=@CityCode,IsVerify=@IsVerify,ModifyDate=GETDATE(),UserID=@UserID
		Where CityID=@CityID
	End
	Else if upper(@opMode)='DELETE'
	Begin
		Delete from tblCity where CityID=@CityID
	End
	
End

GO
/****** Object:  StoredProcedure [dbo].[usp_Customer]    Script Date: 7/29/2015 2:37:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[usp_Customer]
(
	@OpMode						Varchar(10),
	@Customer_ID				Int,
	@Name						Varchar(50),
	@EmailID					Varchar(50),
	@MobileNo					Varchar(10),
	@Address1					Varchar(70),
	@Address2					Varchar(70),
	@Password					Varchar(30),
	@Ticket						Varchar(20)
)
As
Begin
	if UPPER(@OpMode)='INSERT'
	Begin
		Insert into tbl_Customer(Customer_ID,Name,EmailID,MobileNo,Address1,Address2,Password,Ticket)
			values(@Customer_ID,@Name,@EmailID,@MobileNo,@Address1,@Address2,@Password,@Ticket)
			Select @Customer_ID
	End
	Else
	--If UPPER(@OpMode)='UPDATE'
	--Begin
	--	Update tbl_Customer Set Password=@Password Where Lead_ID=@Lead_ID
	--End
	--Else
	If UPPER(@OpMode)='DELETE'
	Begin
		Delete From tbl_Customer where Customer_ID=@Customer_ID
	End
	
	
	
End

GO
/****** Object:  StoredProcedure [dbo].[usp_Expenses]    Script Date: 7/29/2015 2:37:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[usp_Expenses]
(
	@OpMode						Varchar(10),
	@Exp_ID						Int,
	@Exp_Date					Date,
	@Exp_Type					Varchar(50),
	@Exp_Amount					Varchar(50),
	@Exp_ToWhome				Varchar(50),
	@Exp_Under					Varchar(50)
)
As
Begin
	if UPPER(@OpMode)='INSERT'
	Begin
		Select @Exp_ID=ISNULL(Max(Exp_ID),0)+1 From tbl_Expenses
		
		Insert into tbl_Expenses(Exp_ID,Exp_Date,Exp_Type,Exp_Amount,Exp_ToWhome,Exp_Under)
			values(@Exp_ID,@Exp_Date,@Exp_Type,@Exp_Amount,@Exp_ToWhome,@Exp_Under)
	End
	Else
	If UPPER(@OpMode)='UPDATE'
	Begin
		Update tbl_Expenses Set Exp_Date=@Exp_Date,Exp_Type=@Exp_Type,Exp_Amount=@Exp_Amount,Exp_ToWhome=@Exp_ToWhome,Exp_Under=@Exp_Under 
			   Where Exp_ID=@Exp_ID
	End
	Else
	If UPPER(@OpMode)='DELETE'
	Begin
		Delete From tbl_Expenses where Exp_ID=@Exp_ID
	End
	
	
	
End

GO
/****** Object:  StoredProcedure [dbo].[usp_LabourRegProc]    Script Date: 7/29/2015 2:37:12 PM ******/
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
/****** Object:  StoredProcedure [dbo].[usp_LabourTypeProc]    Script Date: 7/29/2015 2:37:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[usp_LabourTypeProc]
(	
	@opMode			Varchar(25),
	@Lbr_type_id	int,
	@Lbr_Type		Varchar(40),
	@Sector			int,
	@IsVerify		Char(1)
)
As
Begin
	if upper(@opMode)='INSERT'
	Begin
		Select @Lbr_type_id=ISNULL(Max(Lbr_type_id),0)+1 From tbl_Lbr_Type
		
		Insert into tbl_Lbr_Type(Lbr_type_id,Lbr_Type,Sector,IsVerify) 
			values(@Lbr_type_id,@Lbr_Type,@Sector,@IsVerify)
	End
	Else if UPPER(@opMode)='UPDATE'
	Begin
		Update tbl_Lbr_Type Set Lbr_Type=@Lbr_Type,Sector=@Sector,IsVerify=@IsVerify
		Where Lbr_type_id=@Lbr_type_id
	End
	Else if upper(@opMode)='DELETE'
	Begin
		Delete from tbl_Lbr_Type where Lbr_type_id=@Lbr_type_id
	End
End

GO
/****** Object:  StoredProcedure [dbo].[usp_Leads]    Script Date: 7/29/2015 2:37:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[usp_Leads]
(
	@OpMode						Varchar(10),
	@Lead_ID					Int,
	@Labour_ID					Int,
	@Customer_ID				Int,
	@Required_Date				date,
	@Required_Time				Varchar(20),
	@Status						Varchar(20),
	@Asign						int,
	@Ticket						Varchar(20),
	@Description				Varchar(MAX)
)
As
Begin
	if UPPER(@OpMode)='INSERT'
	Begin
		Select @Lead_ID=ISNULL(Max(Lead_ID),0)+1 From tbl_Leads
		
		Insert into tbl_Leads(Lead_ID,Labour_ID,Customer_ID,Required_Date,Required_Time,Status,Ticket,Description,CurrentDate)
			values(@Lead_ID,@Labour_ID,@Customer_ID,@Required_Date,@Required_Time,@Status,@Ticket,@Description,GETDATE())
	End
	Else
	If UPPER(@OpMode)='UPDATE'
	Begin
		Update tbl_Leads Set Status=@Status,Asign=@Asign Where Lead_ID=@Lead_ID
	End
	Else
	If UPPER(@OpMode)='DELETE'
	Begin
		Delete From tbl_Leads where Lead_ID=@Lead_ID
	End
	
	
	
End

GO
/****** Object:  StoredProcedure [dbo].[usp_PaymentMade]    Script Date: 7/29/2015 2:37:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[usp_PaymentMade]
(
	@OpMode						Varchar(10),
	@PMT_ID						Int,
	@Particulars				Varchar(100),
	@Amount						Numeric(12,2),
	@Date						Date,
	@Purpose					Varchar(100)
)
As
Begin
	if UPPER(@OpMode)='INSERT'
	Begin
		Select @PMT_ID=ISNULL(Max(PMT_ID),0)+1 From tbl_PMT
		
		Insert into tbl_PMT(PMT_ID,Particulars,Amount,Date,Purpose)
			values(@PMT_ID,@Particulars,@Amount,@Date,@Purpose)
	End
	Else
	If UPPER(@OpMode)='UPDATE'
	Begin
		Update tbl_PMT Set Particulars=@Particulars,Amount=@Amount,Date=@Date,Purpose=@Purpose
			   Where PMT_ID=@PMT_ID
	End
	Else
	If UPPER(@OpMode)='DELETE'
	Begin
		Delete From tbl_PMT where PMT_ID=@PMT_ID
	End
	
	
	
End

GO
/****** Object:  StoredProcedure [dbo].[usp_PaymentRecieve]    Script Date: 7/29/2015 2:37:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[usp_PaymentRecieve]
(
	@OpMode						Varchar(10),
	@PR_ID						Int,
	@Particulars				Varchar(100),
	@Amount						Numeric(12,2),
	@Date						Date,
	@Purpose					Varchar(100)
)
As
Begin
	if UPPER(@OpMode)='INSERT'
	Begin
		Select @PR_ID=ISNULL(Max(PR_ID),0)+1 From tbl_PR
		
		Insert into tbl_PR(PR_ID,Particulars,Amount,Date,Purpose)
			values(@PR_ID,@Particulars,@Amount,@Date,@Purpose)
	End
	Else
	If UPPER(@OpMode)='UPDATE'
	Begin
		Update tbl_PR Set Particulars=@Particulars,Amount=@Amount,Date=@Date,Purpose=@Purpose
			   Where PR_ID=@PR_ID
	End
	Else
	If UPPER(@OpMode)='DELETE'
	Begin
		Delete From tbl_PR where PR_ID=@PR_ID
	End
	
	
	
End

GO
/****** Object:  StoredProcedure [dbo].[usp_StateProc]    Script Date: 7/29/2015 2:37:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[usp_StateProc]
(	
	@opMode			Varchar(25),
	@StateID		Numeric(10,0),
	@StateName		Varchar(40),
	@IsVerify		Char(1),
	@UserID			Numeric(10,0)
	
)
As
Begin
	if upper(@opMode)='INSERT'
	Begin
		Select @StateID=ISNULL(Max(StateID),0)+1 From tblState
		
		Insert into tblState(StateID,StateName,IsVerify,CreateDate,UserID) 
			values(@StateID,@StateName,@IsVerify,GETDATE(),@UserID)
	End
	Else if UPPER(@opMode)='UPDATE'
	Begin
		Update tblState Set StateName=@StateName,IsVerify=@IsVerify,ModifyDate=GETDATE(),UserID=@UserID
		Where StateID=@StateID
	End
	Else if upper(@opMode)='DELETE'
	Begin
		Delete from tblState where StateID=@StateID
	End
End

GO
/****** Object:  StoredProcedure [dbo].[usp_SupplierDtlProc]    Script Date: 7/29/2015 2:37:12 PM ******/
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
/****** Object:  StoredProcedure [dbo].[usp_UserLoginProc]    Script Date: 7/29/2015 2:37:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Proc [dbo].[usp_UserLoginProc]
(
	@LoginName	varchar(50)
)
As
Begin
	Select ImageURL,UserID,UserName,LoginName,Pwd,tblUserType.UserType,tblUserCategory.UserCategory
	From tblUserRegistration 
	Inner Join tblUserType On tblUserRegistration.UserTypeID=tblUserType.UserTypeID
	Inner Join tblUserCategory On tblUserRegistration.UserCategoryID=tblUserCategory.UserCategoryID
	Where LoginName=@LoginName and tblUserRegistration.IsVerify='Y'
End


GO
/****** Object:  StoredProcedure [dbo].[usp_UserRegProc]    Script Date: 7/29/2015 2:37:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Proc [dbo].[usp_UserRegProc]
(
	@OpMode			Varchar(20),
	@UserID			numeric(10),
	@UserName		Varchar(50),
	@LoginName		Varchar(50),
	@Pwd			Varchar(50),
	@UserTypeID		Numeric(10),
	@UserCategoryID	Numeric(10),
	@EmailID		Varchar(100),
	@IsVerify		Char(1)
)
As
Begin
	if UPPER(@OpMode)='INSERT'
		Begin
			Select @UserID=ISNULL(max(UserID),0)+1 From tblUserRegistration
			--if(@UserTypeID=8)
			--BEGIN
			--Insert Into tblUserRegistration(UserID,UserName,LoginName,Pwd,UserTypeID,UserCategoryID,EmailID,IsVerify,StdStaffID
			--		,CreateDate)
			--	Values(@UserID,@UserName,@LoginName,@Pwd,@UserTypeID,@UserCategoryID,@EmailID,@IsVerify,@StdStaffID
			--		,GETDATE())
			--		Select @UserID
			--END
			--Else
			--BEGIN
				Insert Into tblUserRegistration(UserID,UserName,LoginName,Pwd,UserTypeID,UserCategoryID,EmailID,IsVerify
					,CreateDate)
				Values(@UserID,@UserName,@LoginName,@Pwd,@UserTypeID,@UserCategoryID,@EmailID,@IsVerify
					,GETDATE())
					
				Select @UserID
			--END
			
		End
	Else if UPPER(@OpMode)='UPDATE'
		Begin
			if @UserID!=0
			Begin
				Update tblUserRegistration Set UserName=@UserName,LoginName=@LoginName,Pwd=@Pwd
					,UserTypeID=@UserTypeID,UserCategoryID=UserCategoryID,EmailID=@EmailID,IsVerify=@IsVerify
					,ModifyDate=GETDATE()
				Where UserID=@UserID
				
				Select @UserID
			End
			ELSE
			BEGIN 
				if NOT EXISTS(Select * From tblUserRegistration Where LoginName=@LoginName)
				BEGIN
				
					Select @UserID=ISNULL(max(UserID),0)+1 From tblUserRegistration
					
					Insert Into tblUserRegistration(UserID,UserName,LoginName,Pwd,UserTypeID,UserCategoryID,EmailID,IsVerify
						,CreateDate)
					Values(@UserID,@UserName,@LoginName,@Pwd,@UserTypeID,@UserCategoryID,@EmailID,@IsVerify
						,GETDATE())
				END
				ELSE
				BEGIN
					Update tblUserRegistration Set UserName=@UserName,LoginName=@LoginName,Pwd=@Pwd
					,UserTypeID=@UserTypeID,UserCategoryID=UserCategoryID,IsVerify=@IsVerify
					,ModifyDate=GETDATE()
					Where LoginName=@LoginName
				END
			END
				
		End
	Else if UPPER(@OpMode)='DELETE'
		Begin
			Delete From tblUserRegistration Where UserID=@UserID
		End
End


GO
/****** Object:  Table [dbo].[ECICalendarEvent_Test]    Script Date: 7/29/2015 2:37:12 PM ******/
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
/****** Object:  Table [dbo].[tbl_CalenderEvent]    Script Date: 7/29/2015 2:37:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_CalenderEvent](
	[EventName] [nvarchar](100) NOT NULL,
	[EventDescp] [nvarchar](max) NOT NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_Customer]    Script Date: 7/29/2015 2:37:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Customer](
	[Customer_ID] [int] NOT NULL,
	[Name] [varchar](70) NOT NULL,
	[EmailID] [varchar](70) NOT NULL,
	[MobileNo] [varchar](10) NOT NULL,
	[Address1] [varchar](70) NOT NULL,
	[Address2] [varchar](70) NOT NULL,
	[Password] [varchar](20) NOT NULL,
	[Ticket] [varchar](20) NOT NULL,
 CONSTRAINT [PK_tbl_Customer] PRIMARY KEY CLUSTERED 
(
	[Customer_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_Expenses]    Script Date: 7/29/2015 2:37:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Expenses](
	[Exp_ID] [int] NOT NULL,
	[Exp_Date] [date] NOT NULL,
	[Exp_Type] [varchar](50) NOT NULL,
	[Exp_Amount] [varchar](50) NOT NULL,
	[Exp_ToWhome] [varchar](50) NOT NULL,
	[Exp_Under] [varchar](100) NOT NULL,
 CONSTRAINT [PK_tbl_Expenses] PRIMARY KEY CLUSTERED 
(
	[Exp_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_LabourRegistration]    Script Date: 7/29/2015 2:37:12 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_Lbr_Type]    Script Date: 7/29/2015 2:37:12 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_Leads]    Script Date: 7/29/2015 2:37:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Leads](
	[Lead_ID] [int] NOT NULL,
	[Labour_ID] [int] NOT NULL,
	[Customer_ID] [int] NOT NULL,
	[Required_Date] [date] NOT NULL,
	[Required_Time] [varchar](20) NOT NULL,
	[Status] [varchar](20) NOT NULL,
	[Asign] [int] NULL,
	[Ticket] [varchar](20) NOT NULL,
	[CurrentDate] [date] NOT NULL,
	[Description] [varchar](max) NULL,
 CONSTRAINT [PK_tbl_Leads] PRIMARY KEY CLUSTERED 
(
	[Lead_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_PMT]    Script Date: 7/29/2015 2:37:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_PMT](
	[PMT_ID] [int] NOT NULL,
	[Particulars] [varchar](100) NOT NULL,
	[Amount] [numeric](12, 2) NOT NULL,
	[Date] [date] NOT NULL,
	[Purpose] [varchar](100) NULL,
 CONSTRAINT [PK_tbl_PMT] PRIMARY KEY CLUSTERED 
(
	[PMT_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_PR]    Script Date: 7/29/2015 2:37:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_PR](
	[PR_ID] [int] NOT NULL,
	[Particulars] [varchar](100) NOT NULL,
	[Amount] [numeric](12, 2) NOT NULL,
	[Date] [date] NOT NULL,
	[Purpose] [varchar](100) NULL,
 CONSTRAINT [PK_tbl_PR] PRIMARY KEY CLUSTERED 
(
	[PR_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_ReportHeader]    Script Date: 7/29/2015 2:37:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_ReportHeader](
	[CompanyName] [varchar](100) NULL,
	[Address1] [varchar](100) NULL,
	[Address2] [varchar](100) NULL,
	[Phone1] [varchar](50) NULL,
	[Phone2] [varchar](50) NULL,
	[Mobile] [varchar](50) NULL,
	[Website] [varchar](50) NULL,
	[Email] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_Sector]    Script Date: 7/29/2015 2:37:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Sector](
	[SectorID] [int] NOT NULL,
	[SectorName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tbl_Sector] PRIMARY KEY CLUSTERED 
(
	[SectorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_SupplierDetail]    Script Date: 7/29/2015 2:37:12 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblCity]    Script Date: 7/29/2015 2:37:12 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblState]    Script Date: 7/29/2015 2:37:12 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblUserCategory]    Script Date: 7/29/2015 2:37:12 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[tblUserCategory](
	[UserCategoryID] [numeric](10, 0) NOT NULL,
	[UserCategory] [varchar](30) NOT NULL,
	[Desp] [varchar](100) NOT NULL,
	[IsVerify] [char](1) NOT NULL,
 CONSTRAINT [PK_tblUserCategory] PRIMARY KEY CLUSTERED 
(
	[UserCategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblUserRegistration]    Script Date: 7/29/2015 2:37:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblUserRegistration](
	[UserID] [numeric](10, 0) NOT NULL,
	[UserName] [varchar](50) NOT NULL,
	[LoginName] [varchar](50) NOT NULL,
	[Pwd] [varchar](50) NOT NULL,
	[UserTypeID] [numeric](10, 0) NOT NULL,
	[UserCategoryID] [numeric](10, 0) NOT NULL,
	[EmailID] [varchar](100) NOT NULL,
	[IsVerify] [char](1) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[ModifyDate] [datetime] NULL,
	[ImageURL] [varchar](max) NULL,
 CONSTRAINT [PK_tblUserRegistration] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblUserType]    Script Date: 7/29/2015 2:37:12 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[tblUserType](
	[UserTypeID] [numeric](10, 0) NOT NULL,
	[UserType] [varchar](50) NOT NULL,
	[IsVerify] [char](1) NOT NULL,
 CONSTRAINT [PK_tblUserType] PRIMARY KEY CLUSTERED 
(
	[UserTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[tbl_LabourRegistration] ([Reg_ID], [Labour_Code], [FullName], [FatherName], [C_Address], [CState], [CCity], [CPincode], [P_Address], [PState], [PCity], [PPincode], [Ph_No], [SectorType], [Work_Specialization], [Experience], [LabourType], [Ph_belonging1], [Ph_belonging2], [Ph_belonging3], [Ph_belonging4], [Experience_Type], [Varification], [Image_URL], [Doc1_URL], [Doc2_URL], [Doc3_URL], [Doc4_URL], [SupplierID], [Wages]) VALUES (1, N'HHPlGh07000001', N'Maksood', N'Ahmad', N'123-B, Arthla, Mohan Nagar', 1, 1, CAST(201007 AS Numeric(10, 0)), N'123-B, Arthla, Mohan Nagar', 1, 1, CAST(201007 AS Numeric(10, 0)), CAST(1312312312 AS Numeric(18, 0)), CAST(1 AS Numeric(10, 0)), N'Good', N'12', 1, CAST(3453534534 AS Numeric(18, 0)), CAST(3453534534 AS Numeric(18, 0)), CAST(3453534534 AS Numeric(18, 0)), CAST(3453534534 AS Numeric(18, 0)), 1, N'1', N'..\LabourImages\LBRb8975c03-0.jpg', N'..\LabourDocs\LBRMaksood-10416644_322751247887122_2572572790357174787_n.jpg', N'..\LabourDocs\LBRMaksood-alone love lonely sad emotional missing u miss girls boys wallpapers (13).jpg', N'', N'', 5, N'250')
INSERT [dbo].[tbl_LabourRegistration] ([Reg_ID], [Labour_Code], [FullName], [FatherName], [C_Address], [CState], [CCity], [CPincode], [P_Address], [PState], [PCity], [PPincode], [Ph_No], [SectorType], [Work_Specialization], [Experience], [LabourType], [Ph_belonging1], [Ph_belonging2], [Ph_belonging3], [Ph_belonging4], [Experience_Type], [Varification], [Image_URL], [Doc1_URL], [Doc2_URL], [Doc3_URL], [Doc4_URL], [SupplierID], [Wages]) VALUES (2, N'GLGlGh07000002', N'Satbeer', N'Raghupal', N'212-Lajpath Nagar', 1, 1, CAST(201007 AS Numeric(10, 0)), N'212-Lajpath Nagar', 1, 1, CAST(201007 AS Numeric(10, 0)), CAST(5345345534 AS Numeric(18, 0)), CAST(2 AS Numeric(10, 0)), N'Good', N'8', 20, CAST(5553453453 AS Numeric(18, 0)), CAST(5553453453 AS Numeric(18, 0)), CAST(5553453453 AS Numeric(18, 0)), CAST(5553453453 AS Numeric(18, 0)), 1, N'1', N'..\LabourImages\LBRdfa67bb3-2.jpg', N'', N'', N'', N'', 5, N'300')
INSERT [dbo].[tbl_Lbr_Type] ([Lbr_type_id], [Lbr_Type], [Sector], [IsVerify]) VALUES (1, N'Plumber', 1, N'Y')
INSERT [dbo].[tbl_Lbr_Type] ([Lbr_type_id], [Lbr_Type], [Sector], [IsVerify]) VALUES (2, N'Electrician', 1, N'Y')
INSERT [dbo].[tbl_Lbr_Type] ([Lbr_type_id], [Lbr_Type], [Sector], [IsVerify]) VALUES (3, N'Carpenter', 2, N'Y')
INSERT [dbo].[tbl_Lbr_Type] ([Lbr_type_id], [Lbr_Type], [Sector], [IsVerify]) VALUES (4, N'Mechanic', 2, N'Y')
INSERT [dbo].[tbl_Lbr_Type] ([Lbr_type_id], [Lbr_Type], [Sector], [IsVerify]) VALUES (5, N'AC', 2, N'Y')
INSERT [dbo].[tbl_Lbr_Type] ([Lbr_type_id], [Lbr_Type], [Sector], [IsVerify]) VALUES (6, N'Appliances', 2, N'Y')
INSERT [dbo].[tbl_Lbr_Type] ([Lbr_type_id], [Lbr_Type], [Sector], [IsVerify]) VALUES (7, N'RO', 1, N'Y')
INSERT [dbo].[tbl_Lbr_Type] ([Lbr_type_id], [Lbr_Type], [Sector], [IsVerify]) VALUES (8, N'Pest Control', 2, N'Y')
INSERT [dbo].[tbl_Lbr_Type] ([Lbr_type_id], [Lbr_Type], [Sector], [IsVerify]) VALUES (9, N'Alliances', 2, N'Y')
INSERT [dbo].[tbl_Lbr_Type] ([Lbr_type_id], [Lbr_Type], [Sector], [IsVerify]) VALUES (10, N'Locksmith', 1, N'Y')
INSERT [dbo].[tbl_Lbr_Type] ([Lbr_type_id], [Lbr_Type], [Sector], [IsVerify]) VALUES (11, N'Painter', 2, N'Y')
INSERT [dbo].[tbl_Lbr_Type] ([Lbr_type_id], [Lbr_Type], [Sector], [IsVerify]) VALUES (12, N'Tiling', 2, N'Y')
INSERT [dbo].[tbl_Lbr_Type] ([Lbr_type_id], [Lbr_Type], [Sector], [IsVerify]) VALUES (13, N'Gardener', 2, N'Y')
INSERT [dbo].[tbl_Lbr_Type] ([Lbr_type_id], [Lbr_Type], [Sector], [IsVerify]) VALUES (14, N'Drywall Repair', 2, N'Y')
INSERT [dbo].[tbl_Lbr_Type] ([Lbr_type_id], [Lbr_Type], [Sector], [IsVerify]) VALUES (15, N'Ceiling Repair', 1, N'Y')
INSERT [dbo].[tbl_Lbr_Type] ([Lbr_type_id], [Lbr_Type], [Sector], [IsVerify]) VALUES (16, N'Cleaning', 3, N'Y')
INSERT [dbo].[tbl_Lbr_Type] ([Lbr_type_id], [Lbr_Type], [Sector], [IsVerify]) VALUES (17, N'Crown Modelling', 1, N'Y')
INSERT [dbo].[tbl_Lbr_Type] ([Lbr_type_id], [Lbr_Type], [Sector], [IsVerify]) VALUES (18, N'Concrete Work', 3, N'Y')
INSERT [dbo].[tbl_Lbr_Type] ([Lbr_type_id], [Lbr_Type], [Sector], [IsVerify]) VALUES (19, N'Flooring Installation and Repairing', 3, N'Y')
INSERT [dbo].[tbl_Lbr_Type] ([Lbr_type_id], [Lbr_Type], [Sector], [IsVerify]) VALUES (20, N'Glass Work', 2, N'Y')
INSERT [dbo].[tbl_Lbr_Type] ([Lbr_type_id], [Lbr_Type], [Sector], [IsVerify]) VALUES (21, N'Maid', 1, N'Y')
INSERT [dbo].[tbl_Lbr_Type] ([Lbr_type_id], [Lbr_Type], [Sector], [IsVerify]) VALUES (22, N'Retail', 2, N'Y')
INSERT [dbo].[tbl_Lbr_Type] ([Lbr_type_id], [Lbr_Type], [Sector], [IsVerify]) VALUES (23, N'Tailor', 1, N'Y')
INSERT [dbo].[tbl_Lbr_Type] ([Lbr_type_id], [Lbr_Type], [Sector], [IsVerify]) VALUES (24, N'Machine Operator', 3, N'Y')
INSERT [dbo].[tbl_Lbr_Type] ([Lbr_type_id], [Lbr_Type], [Sector], [IsVerify]) VALUES (25, N'Cook', 1, N'Y')
INSERT [dbo].[tbl_Lbr_Type] ([Lbr_type_id], [Lbr_Type], [Sector], [IsVerify]) VALUES (26, N'Security Guard', 3, N'Y')
INSERT [dbo].[tbl_Lbr_Type] ([Lbr_type_id], [Lbr_Type], [Sector], [IsVerify]) VALUES (27, N'Delivery Boy', 2, N'Y')
INSERT [dbo].[tbl_Lbr_Type] ([Lbr_type_id], [Lbr_Type], [Sector], [IsVerify]) VALUES (29, N'Dry Cleaner', 2, N'Y')
INSERT [dbo].[tbl_Lbr_Type] ([Lbr_type_id], [Lbr_Type], [Sector], [IsVerify]) VALUES (30, N'Water Proofing', 1, N'Y')
INSERT [dbo].[tbl_Lbr_Type] ([Lbr_type_id], [Lbr_Type], [Sector], [IsVerify]) VALUES (31, N'Sheetrock', 3, N'Y')
INSERT [dbo].[tbl_Leads] ([Lead_ID], [Labour_ID], [Customer_ID], [Required_Date], [Required_Time], [Status], [Asign], [Ticket], [CurrentDate], [Description]) VALUES (1, 1, 0, CAST(0x403A0B00 AS Date), N'Morning (9AM - 12PM)', N'IP', 5, N'99153eb2793-', CAST(0x3F3A0B00 AS Date), N'')
INSERT [dbo].[tbl_PMT] ([PMT_ID], [Particulars], [Amount], [Date], [Purpose]) VALUES (1, N'Mukul', CAST(200000.00 AS Numeric(12, 2)), CAST(0x333A0B00 AS Date), N'Inventory')
INSERT [dbo].[tbl_PR] ([PR_ID], [Particulars], [Amount], [Date], [Purpose]) VALUES (1, N'Mayank', CAST(2000000.00 AS Numeric(12, 2)), CAST(0x2D3A0B00 AS Date), N'abc')
INSERT [dbo].[tbl_PR] ([PR_ID], [Particulars], [Amount], [Date], [Purpose]) VALUES (2, N'Digvijay', CAST(21210000.00 AS Numeric(12, 2)), CAST(0x2C3A0B00 AS Date), N'bca')
INSERT [dbo].[tbl_ReportHeader] ([CompanyName], [Address1], [Address2], [Phone1], [Phone2], [Mobile], [Website], [Email]) VALUES (N'Easy Labour', N'123-Yamna Vihar', N'Delhi,110011', N'0120-234567', N'9876543210', N'9182736450', N'www.easylabour.com', N'info@easylabour.com')
INSERT [dbo].[tbl_Sector] ([SectorID], [SectorName]) VALUES (1, N'HouseHold')
INSERT [dbo].[tbl_Sector] ([SectorID], [SectorName]) VALUES (2, N'General')
INSERT [dbo].[tbl_Sector] ([SectorID], [SectorName]) VALUES (3, N'Industrial')
INSERT [dbo].[tbl_SupplierDetail] ([SupplierID], [SupplierCode], [FullName], [Address], [Sup_City], [Sup_State], [Pincode], [Sup_Mobile], [EmailID], [CompanyName], [BankName], [BankACNo], [AC_IFSC_Code], [Doc1_Url], [Doc2_Url], [Image_Url], [MemberShip]) VALUES (5, N'SUP0001', N'Mukul', N'123-B, Arthla, Mohan Nagar', 1, 1, CAST(201007 AS Numeric(10, 0)), CAST(9876543210 AS Numeric(10, 0)), N'arunchauhan.2404@gmail.com', N'Cognoid Infotech', N'ICICI', N'1323123', N'ICIC23123', N'', N'', N'..\SupplierImages\SUP277e4007-3.jpg', N'Y')
INSERT [dbo].[tblCity] ([CityID], [CityName], [StateID], [CityCode], [IsVerify], [CreateDate], [ModifyDate], [UserID]) VALUES (CAST(1 AS Numeric(10, 0)), N'Ghaziabad', CAST(1 AS Numeric(10, 0)), N'GH', N'Y', CAST(0x0000A43001134B9D AS DateTime), CAST(0x0000A430011B199A AS DateTime), CAST(0 AS Numeric(10, 0)))
INSERT [dbo].[tblCity] ([CityID], [CityName], [StateID], [CityCode], [IsVerify], [CreateDate], [ModifyDate], [UserID]) VALUES (CAST(2 AS Numeric(10, 0)), N'Noida', CAST(1 AS Numeric(10, 0)), N'ND', N'Y', CAST(0x0000A4300113528B AS DateTime), CAST(0x0000A466010C6DFC AS DateTime), CAST(0 AS Numeric(10, 0)))
INSERT [dbo].[tblCity] ([CityID], [CityName], [StateID], [CityCode], [IsVerify], [CreateDate], [ModifyDate], [UserID]) VALUES (CAST(3 AS Numeric(10, 0)), N'Dadri', CAST(1 AS Numeric(10, 0)), N'DA', N'Y', CAST(0x0000A4300113637C AS DateTime), CAST(0x0000A430011B1178 AS DateTime), CAST(0 AS Numeric(10, 0)))
INSERT [dbo].[tblCity] ([CityID], [CityName], [StateID], [CityCode], [IsVerify], [CreateDate], [ModifyDate], [UserID]) VALUES (CAST(4 AS Numeric(10, 0)), N'Karol Bagh', CAST(2 AS Numeric(10, 0)), N'KB', N'Y', CAST(0x0000A43001137573 AS DateTime), CAST(0x0000A430011B205B AS DateTime), CAST(0 AS Numeric(10, 0)))
INSERT [dbo].[tblCity] ([CityID], [CityName], [StateID], [CityCode], [IsVerify], [CreateDate], [ModifyDate], [UserID]) VALUES (CAST(5 AS Numeric(10, 0)), N'C.P', CAST(2 AS Numeric(10, 0)), N'CP', N'Y', CAST(0x0000A430011391C0 AS DateTime), CAST(0x0000A430011B02F7 AS DateTime), CAST(0 AS Numeric(10, 0)))
INSERT [dbo].[tblCity] ([CityID], [CityName], [StateID], [CityCode], [IsVerify], [CreateDate], [ModifyDate], [UserID]) VALUES (CAST(7 AS Numeric(10, 0)), N'Meerut', CAST(1 AS Numeric(10, 0)), N'MR', N'Y', CAST(0x0000A435010F047B AS DateTime), CAST(0x0000A435010F11DE AS DateTime), CAST(0 AS Numeric(10, 0)))
INSERT [dbo].[tblCity] ([CityID], [CityName], [StateID], [CityCode], [IsVerify], [CreateDate], [ModifyDate], [UserID]) VALUES (CAST(8 AS Numeric(10, 0)), N'bca', CAST(4 AS Numeric(10, 0)), N'AB', N'Y', CAST(0x0000A43600EFADA3 AS DateTime), NULL, CAST(0 AS Numeric(10, 0)))
INSERT [dbo].[tblState] ([StateID], [StateName], [CountryID], [IsVerify], [CreateDate], [ModifyDate], [UserID]) VALUES (CAST(1 AS Numeric(10, 0)), N'U.P', CAST(0 AS Numeric(10, 0)), N'Y', CAST(0x0000A4300111B846 AS DateTime), CAST(0x0000000000000000 AS DateTime), CAST(0 AS Numeric(10, 0)))
INSERT [dbo].[tblState] ([StateID], [StateName], [CountryID], [IsVerify], [CreateDate], [ModifyDate], [UserID]) VALUES (CAST(2 AS Numeric(10, 0)), N'Delhi', CAST(0 AS Numeric(10, 0)), N'Y', CAST(0x0000A4300112491A AS DateTime), CAST(0x0000000000000000 AS DateTime), CAST(0 AS Numeric(10, 0)))
INSERT [dbo].[tblState] ([StateID], [StateName], [CountryID], [IsVerify], [CreateDate], [ModifyDate], [UserID]) VALUES (CAST(3 AS Numeric(10, 0)), N'U.K', CAST(0 AS Numeric(10, 0)), N'Y', CAST(0x0000A43500D3435E AS DateTime), CAST(0x0000000000000000 AS DateTime), CAST(0 AS Numeric(10, 0)))
INSERT [dbo].[tblState] ([StateID], [StateName], [CountryID], [IsVerify], [CreateDate], [ModifyDate], [UserID]) VALUES (CAST(4 AS Numeric(10, 0)), N'abc', CAST(0 AS Numeric(10, 0)), N'Y', CAST(0x0000A43600EF8376 AS DateTime), CAST(0x0000000000000000 AS DateTime), CAST(0 AS Numeric(10, 0)))
INSERT [dbo].[tblState] ([StateID], [StateName], [CountryID], [IsVerify], [CreateDate], [ModifyDate], [UserID]) VALUES (CAST(5 AS Numeric(10, 0)), N'Bihar', CAST(0 AS Numeric(10, 0)), N'Y', CAST(0x0000A46600FDCC31 AS DateTime), CAST(0x0000000000000000 AS DateTime), CAST(0 AS Numeric(10, 0)))
INSERT [dbo].[tblState] ([StateID], [StateName], [CountryID], [IsVerify], [CreateDate], [ModifyDate], [UserID]) VALUES (CAST(6 AS Numeric(10, 0)), N'Haryana', CAST(0 AS Numeric(10, 0)), N'Y', CAST(0x0000A46600FDDFD0 AS DateTime), CAST(0x0000000000000000 AS DateTime), CAST(0 AS Numeric(10, 0)))
INSERT [dbo].[tblState] ([StateID], [StateName], [CountryID], [IsVerify], [CreateDate], [ModifyDate], [UserID]) VALUES (CAST(7 AS Numeric(10, 0)), N'Maharashtra', CAST(0 AS Numeric(10, 0)), N'Y', CAST(0x0000A4660100E25C AS DateTime), CAST(0x0000000000000000 AS DateTime), CAST(0 AS Numeric(10, 0)))
INSERT [dbo].[tblUserCategory] ([UserCategoryID], [UserCategory], [Desp], [IsVerify]) VALUES (CAST(1 AS Numeric(10, 0)), N'A', N'All Right', N'Y')
INSERT [dbo].[tblUserCategory] ([UserCategoryID], [UserCategory], [Desp], [IsVerify]) VALUES (CAST(2 AS Numeric(10, 0)), N'B', N'Limited', N'Y')
INSERT [dbo].[tblUserCategory] ([UserCategoryID], [UserCategory], [Desp], [IsVerify]) VALUES (CAST(3 AS Numeric(10, 0)), N'C', N'Limited', N'Y')
INSERT [dbo].[tblUserCategory] ([UserCategoryID], [UserCategory], [Desp], [IsVerify]) VALUES (CAST(4 AS Numeric(10, 0)), N'D', N'Fixed', N'Y')
INSERT [dbo].[tblUserRegistration] ([UserID], [UserName], [LoginName], [Pwd], [UserTypeID], [UserCategoryID], [EmailID], [IsVerify], [CreateDate], [ModifyDate], [ImageURL]) VALUES (CAST(1 AS Numeric(10, 0)), N'Rohit Chauhan', N'Cognoid', N'Y3J5c3RhbEBjb2dub2lk', CAST(1 AS Numeric(10, 0)), CAST(1 AS Numeric(10, 0)), N'', N'Y', CAST(0x0000A23400000000 AS DateTime), CAST(0x0000A30700DCA483 AS DateTime), N'0')
INSERT [dbo].[tblUserRegistration] ([UserID], [UserName], [LoginName], [Pwd], [UserTypeID], [UserCategoryID], [EmailID], [IsVerify], [CreateDate], [ModifyDate], [ImageURL]) VALUES (CAST(3 AS Numeric(10, 0)), N'Arun', N'arun', N'YXJ1bg==', CAST(2 AS Numeric(10, 0)), CAST(2 AS Numeric(10, 0)), N'mayank@gmail.com', N'Y', CAST(0x0000A4B300F49796 AS DateTime), NULL, N'')
INSERT [dbo].[tblUserRegistration] ([UserID], [UserName], [LoginName], [Pwd], [UserTypeID], [UserCategoryID], [EmailID], [IsVerify], [CreateDate], [ModifyDate], [ImageURL]) VALUES (CAST(4 AS Numeric(10, 0)), N'mayank', N'mayank', N'bWF5YW5r', CAST(4 AS Numeric(10, 0)), CAST(4 AS Numeric(10, 0)), N'mank@gmail.com', N'Y', CAST(0x0000A4B5011AE6C5 AS DateTime), NULL, N'')
INSERT [dbo].[tblUserRegistration] ([UserID], [UserName], [LoginName], [Pwd], [UserTypeID], [UserCategoryID], [EmailID], [IsVerify], [CreateDate], [ModifyDate], [ImageURL]) VALUES (CAST(5 AS Numeric(10, 0)), N'Mukul', N'mukul123', N'bXVrdWwxMjM=', CAST(3 AS Numeric(10, 0)), CAST(3 AS Numeric(10, 0)), N'arunchauhan.2404@gmail.com', N'Y', CAST(0x0000A4BD009385EC AS DateTime), NULL, N'')
INSERT [dbo].[tblUserRegistration] ([UserID], [UserName], [LoginName], [Pwd], [UserTypeID], [UserCategoryID], [EmailID], [IsVerify], [CreateDate], [ModifyDate], [ImageURL]) VALUES (CAST(6 AS Numeric(10, 0)), N'Amit', N'Amit', N'QW1pOTkxMQ==', CAST(4 AS Numeric(10, 0)), CAST(4 AS Numeric(10, 0)), N'arunchauhan.2404@gmail.com', N'Y', CAST(0x0000A4C10003D979 AS DateTime), NULL, N'')
INSERT [dbo].[tblUserRegistration] ([UserID], [UserName], [LoginName], [Pwd], [UserTypeID], [UserCategoryID], [EmailID], [IsVerify], [CreateDate], [ModifyDate], [ImageURL]) VALUES (CAST(7 AS Numeric(10, 0)), N'Arvind', N'Arvind', N'YXJ2aW5k', CAST(4 AS Numeric(10, 0)), CAST(4 AS Numeric(10, 0)), N'arvind@gmail.com', N'Y', CAST(0x0000A4C500B6FEB3 AS DateTime), NULL, N'')
INSERT [dbo].[tblUserType] ([UserTypeID], [UserType], [IsVerify]) VALUES (CAST(1 AS Numeric(10, 0)), N'Super Admin', N'Y')
INSERT [dbo].[tblUserType] ([UserTypeID], [UserType], [IsVerify]) VALUES (CAST(2 AS Numeric(10, 0)), N'Admin', N'Y')
INSERT [dbo].[tblUserType] ([UserTypeID], [UserType], [IsVerify]) VALUES (CAST(3 AS Numeric(10, 0)), N'Supplier', N'Y')
INSERT [dbo].[tblUserType] ([UserTypeID], [UserType], [IsVerify]) VALUES (CAST(4 AS Numeric(10, 0)), N'Customer', N'Y')
ALTER TABLE [dbo].[ECICalendarEvent_Test] ADD  CONSTRAINT [DF_ECICalendarEvent_Test_description]  DEFAULT ('') FOR [description]
GO
ALTER TABLE [dbo].[ECICalendarEvent_Test] ADD  CONSTRAINT [DF_ECICalendarEvent_Test_title]  DEFAULT ('') FOR [title]
GO
ALTER TABLE [dbo].[tbl_CalenderEvent] ADD  CONSTRAINT [DF_tbl_CalenderEvent_EventName]  DEFAULT ('') FOR [EventName]
GO
ALTER TABLE [dbo].[tbl_CalenderEvent] ADD  CONSTRAINT [DF_tbl_CalenderEvent_EventDescp]  DEFAULT ('') FOR [EventDescp]
GO
ALTER TABLE [dbo].[tbl_CalenderEvent] ADD  CONSTRAINT [DF_tbl_CalenderEvent_StartDate]  DEFAULT ('') FOR [StartDate]
GO
ALTER TABLE [dbo].[tbl_CalenderEvent] ADD  CONSTRAINT [DF_tbl_CalenderEvent_EndDate]  DEFAULT ('') FOR [EndDate]
GO
ALTER TABLE [dbo].[tbl_Customer] ADD  CONSTRAINT [DF_tbl_Customer_Customer_ID]  DEFAULT ((0)) FOR [Customer_ID]
GO
ALTER TABLE [dbo].[tbl_Customer] ADD  CONSTRAINT [DF_tbl_Customer_Name]  DEFAULT ('') FOR [Name]
GO
ALTER TABLE [dbo].[tbl_Customer] ADD  CONSTRAINT [DF_tbl_Customer_EmailID]  DEFAULT ('') FOR [EmailID]
GO
ALTER TABLE [dbo].[tbl_Customer] ADD  CONSTRAINT [DF_tbl_Customer_MobileNo]  DEFAULT ('') FOR [MobileNo]
GO
ALTER TABLE [dbo].[tbl_Customer] ADD  CONSTRAINT [DF_tbl_Customer_Address1]  DEFAULT ('') FOR [Address1]
GO
ALTER TABLE [dbo].[tbl_Customer] ADD  CONSTRAINT [DF_tbl_Customer_Address2]  DEFAULT ('') FOR [Address2]
GO
ALTER TABLE [dbo].[tbl_Customer] ADD  CONSTRAINT [DF_tbl_Customer_Password]  DEFAULT ('') FOR [Password]
GO
ALTER TABLE [dbo].[tbl_Customer] ADD  CONSTRAINT [DF_tbl_Customer_Ticket]  DEFAULT ('') FOR [Ticket]
GO
ALTER TABLE [dbo].[tbl_Expenses] ADD  CONSTRAINT [DF_tbl_Expenses_Exp_ID]  DEFAULT ((0)) FOR [Exp_ID]
GO
ALTER TABLE [dbo].[tbl_Expenses] ADD  CONSTRAINT [DF_tbl_Expenses_Exp_Date]  DEFAULT ('') FOR [Exp_Date]
GO
ALTER TABLE [dbo].[tbl_Expenses] ADD  CONSTRAINT [DF_tbl_Expenses_Exp_Type]  DEFAULT ('') FOR [Exp_Type]
GO
ALTER TABLE [dbo].[tbl_Expenses] ADD  CONSTRAINT [DF_tbl_Expenses_Exp_Amount]  DEFAULT ('') FOR [Exp_Amount]
GO
ALTER TABLE [dbo].[tbl_Expenses] ADD  CONSTRAINT [DF_tbl_Expenses_Exp_ToWhome]  DEFAULT ('') FOR [Exp_ToWhome]
GO
ALTER TABLE [dbo].[tbl_Expenses] ADD  CONSTRAINT [DF_tbl_Expenses_Exp_Under]  DEFAULT ('') FOR [Exp_Under]
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
ALTER TABLE [dbo].[tbl_Lbr_Type] ADD  CONSTRAINT [DF_tbl_Lbr_Type_Lbr_type_id]  DEFAULT ((0)) FOR [Lbr_type_id]
GO
ALTER TABLE [dbo].[tbl_Lbr_Type] ADD  CONSTRAINT [DF_tbl_Lbr_Type_Lbr_Type]  DEFAULT ('') FOR [Lbr_Type]
GO
ALTER TABLE [dbo].[tbl_Lbr_Type] ADD  CONSTRAINT [DF_tbl_Lbr_Type_Sector]  DEFAULT ((0)) FOR [Sector]
GO
ALTER TABLE [dbo].[tbl_Lbr_Type] ADD  CONSTRAINT [DF_tbl_Lbr_Type_IsVerify]  DEFAULT ('N') FOR [IsVerify]
GO
ALTER TABLE [dbo].[tbl_Leads] ADD  CONSTRAINT [DF_tbl_Leads_Lead_ID]  DEFAULT ((0)) FOR [Lead_ID]
GO
ALTER TABLE [dbo].[tbl_Leads] ADD  CONSTRAINT [DF_tbl_Leads_Labour_ID]  DEFAULT ((0)) FOR [Labour_ID]
GO
ALTER TABLE [dbo].[tbl_Leads] ADD  CONSTRAINT [DF_tbl_Leads_Customer_ID]  DEFAULT ((0)) FOR [Customer_ID]
GO
ALTER TABLE [dbo].[tbl_Leads] ADD  CONSTRAINT [DF_tbl_Leads_Required_Date]  DEFAULT ('') FOR [Required_Date]
GO
ALTER TABLE [dbo].[tbl_Leads] ADD  CONSTRAINT [DF_tbl_Leads_Required_Time]  DEFAULT ('') FOR [Required_Time]
GO
ALTER TABLE [dbo].[tbl_Leads] ADD  CONSTRAINT [DF_tbl_Leads_Status]  DEFAULT ('') FOR [Status]
GO
ALTER TABLE [dbo].[tbl_Leads] ADD  CONSTRAINT [DF_tbl_Leads_Ticket]  DEFAULT ('') FOR [Ticket]
GO
ALTER TABLE [dbo].[tbl_Leads] ADD  CONSTRAINT [DF_tbl_Leads_CurrentDate]  DEFAULT ('') FOR [CurrentDate]
GO
ALTER TABLE [dbo].[tbl_PMT] ADD  CONSTRAINT [DF_tbl_PMT_PMT_ID]  DEFAULT ((0)) FOR [PMT_ID]
GO
ALTER TABLE [dbo].[tbl_PMT] ADD  CONSTRAINT [DF_tbl_PMT_Particulars]  DEFAULT ('') FOR [Particulars]
GO
ALTER TABLE [dbo].[tbl_PMT] ADD  CONSTRAINT [DF_tbl_PMT_Amount]  DEFAULT ((0)) FOR [Amount]
GO
ALTER TABLE [dbo].[tbl_PMT] ADD  CONSTRAINT [DF_tbl_PMT_Date]  DEFAULT ('') FOR [Date]
GO
ALTER TABLE [dbo].[tbl_PMT] ADD  CONSTRAINT [DF_tbl_PMT_Purpose]  DEFAULT ('') FOR [Purpose]
GO
ALTER TABLE [dbo].[tbl_PR] ADD  CONSTRAINT [DF_tbl_PR_PR_ID]  DEFAULT ((0)) FOR [PR_ID]
GO
ALTER TABLE [dbo].[tbl_PR] ADD  CONSTRAINT [DF_tbl_PR_Particulars]  DEFAULT ('') FOR [Particulars]
GO
ALTER TABLE [dbo].[tbl_PR] ADD  CONSTRAINT [DF_tbl_PR_Amount]  DEFAULT ((0)) FOR [Amount]
GO
ALTER TABLE [dbo].[tbl_PR] ADD  CONSTRAINT [DF_tbl_PR_Date]  DEFAULT ('') FOR [Date]
GO
ALTER TABLE [dbo].[tbl_PR] ADD  CONSTRAINT [DF_tbl_PR_Purpose]  DEFAULT ('') FOR [Purpose]
GO
ALTER TABLE [dbo].[tbl_ReportHeader] ADD  CONSTRAINT [DF_tbl_ReportHeader_Mobile]  DEFAULT ('') FOR [Mobile]
GO
ALTER TABLE [dbo].[tbl_Sector] ADD  CONSTRAINT [DF_tbl_Sector_SectorID]  DEFAULT ((0)) FOR [SectorID]
GO
ALTER TABLE [dbo].[tbl_Sector] ADD  CONSTRAINT [DF_tbl_Sector_SectorName]  DEFAULT ('') FOR [SectorName]
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
ALTER TABLE [dbo].[tblUserCategory] ADD  CONSTRAINT [DF_tblUserCategory_UserCategoryID]  DEFAULT ((0)) FOR [UserCategoryID]
GO
ALTER TABLE [dbo].[tblUserCategory] ADD  CONSTRAINT [DF_tblUserCategory_UserCategory]  DEFAULT ('') FOR [UserCategory]
GO
ALTER TABLE [dbo].[tblUserCategory] ADD  CONSTRAINT [DF_tblUserCategory_Desp]  DEFAULT ('') FOR [Desp]
GO
ALTER TABLE [dbo].[tblUserCategory] ADD  CONSTRAINT [DF_tblUserCategory_IsVerify]  DEFAULT ('Y') FOR [IsVerify]
GO
ALTER TABLE [dbo].[tblUserRegistration] ADD  CONSTRAINT [DF_tblUserRegistration_UserID]  DEFAULT ((0)) FOR [UserID]
GO
ALTER TABLE [dbo].[tblUserRegistration] ADD  CONSTRAINT [DF_tblUserRegistration_UserName]  DEFAULT ('') FOR [UserName]
GO
ALTER TABLE [dbo].[tblUserRegistration] ADD  CONSTRAINT [DF_tblUserRegistration_LoginName]  DEFAULT ('') FOR [LoginName]
GO
ALTER TABLE [dbo].[tblUserRegistration] ADD  CONSTRAINT [DF_tblUserRegistration_Pwd]  DEFAULT ('') FOR [Pwd]
GO
ALTER TABLE [dbo].[tblUserRegistration] ADD  CONSTRAINT [DF_tblUserRegistration_UserTypeID]  DEFAULT ((0)) FOR [UserTypeID]
GO
ALTER TABLE [dbo].[tblUserRegistration] ADD  CONSTRAINT [DF_tblUserRegistration_UserCategoryID]  DEFAULT ((0)) FOR [UserCategoryID]
GO
ALTER TABLE [dbo].[tblUserRegistration] ADD  CONSTRAINT [DF_tblUserRegistration_EmailID]  DEFAULT ('') FOR [EmailID]
GO
ALTER TABLE [dbo].[tblUserRegistration] ADD  CONSTRAINT [DF_tblUserRegistration_IsVerify]  DEFAULT ('Y') FOR [IsVerify]
GO
ALTER TABLE [dbo].[tblUserRegistration] ADD  CONSTRAINT [DF_tblUserRegistration_CreateDate]  DEFAULT ('') FOR [CreateDate]
GO
ALTER TABLE [dbo].[tblUserRegistration] ADD  CONSTRAINT [DF_tblUserRegistration_ImageID]  DEFAULT ('') FOR [ImageURL]
GO
ALTER TABLE [dbo].[tblUserType] ADD  CONSTRAINT [DF_tblUserType_UserTypeID]  DEFAULT ((0)) FOR [UserTypeID]
GO
ALTER TABLE [dbo].[tblUserType] ADD  CONSTRAINT [DF_tblUserType_UserType]  DEFAULT ('') FOR [UserType]
GO
ALTER TABLE [dbo].[tblUserType] ADD  CONSTRAINT [DF_tblUserType_IsVerify]  DEFAULT ('N') FOR [IsVerify]
GO
USE [master]
GO
ALTER DATABASE [LMT] SET  READ_WRITE 
GO
