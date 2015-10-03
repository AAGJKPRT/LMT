BEGIN TRAN

CREATE TABLE [dbo].[tblLookUp](
	[LID] [int] NOT NULL,
	[LNAME] [nvarchar](50) NULL,
	[LTYPE] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tblLookUp] PRIMARY KEY CLUSTERED 
(
	[LID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT INTO [dbo].[tblLookUp]([LID],[LNAME],[LTYPE])VALUES(1,'Skilled','LBRTYPE')
INSERT INTO [dbo].[tblLookUp]([LID],[LNAME],[LTYPE])VALUES(2,'Semi Skilled','LBRTYPE')
INSERT INTO [dbo].[tblLookUp]([LID],[LNAME],[LTYPE])VALUES(3,'Fresher','LBRTYPE')

GO
------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------
alter  PROCEDURE [dbo].[usp_GetLookup](    
@LookupCode nvarchar(50)    
)    
AS    
BEGIN    
IF(@LookupCode='STATE')  
BEGIN  
SELECT STATEID AS 'LID',STATENAME AS 'LDESC' FROM TBLSTATE WITH(NOLOCK)   
END  
ELSE IF(@LookupCode='CITY')  
BEGIN  
SELECT CityID AS 'LID',CityName  AS 'LDESC' from tblCity WITH(NOLOCK)   
END  
ELSE IF(@LookupCode='LType')  
BEGIN  
Select Lbr_type_id  AS 'LID',Lbr_Type AS 'LDESC' From tbl_Lbr_Type Order By Lbr_Type
END 
ELSE IF(@LookupCode='LBRTYPE')  
BEGIN  
Select LID  AS 'LID',LNAME AS 'LDESC' From dbo.tbllookup WHERE LTYPE=@LookupCode 
END
END  
  
go
---------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------
ALTER TABLE [dbo].tbl_LabourRegistration ADD Lbr_Skill int
go
---------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------
alter Proc [dbo].[usp_LabourRegProc]
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
	@Wages						Varchar(10),
	@Lbr_Skill					int
)
As
Begin
	if UPPER(@OpMode)='INSERT'
	Begin
		Select @Reg_ID=ISNULL(Max(Reg_ID),0)+1 From tbl_LabourRegistration
		
		Insert into tbl_LabourRegistration(Reg_ID,Labour_Code,FullName,FatherName,C_Address,CState,CCity,CPincode,P_Address,PState,PCity,PPincode,Ph_No,SectorType,
		Work_Specialization,Experience,LabourType,Ph_belonging1,Ph_belonging2,Ph_belonging3,Ph_belonging4,Experience_Type,Varification,Image_URL,Doc1_URL,Doc2_URL,Doc3_URL,Doc4_URL,SupplierID,Wages,Lbr_Skill)
			values(@Reg_ID,@Labour_Code,@FullName,@FatherName,@C_Address,@C_State,@C_City,@C_Pincode,@P_Address,@P_State,@P_City,@P_Pincode,@Ph_No,@SectorType,@Work_Specialization,
					@Experience,@LabourType,@Ph_belonging1,@Ph_belonging2,@Ph_belonging3,@Ph_belonging4,@Experience_Type,@Verification,@Image_Url,@Doc1_Url,@Doc2_Url,@Doc3_Url,@Doc4_Url,@SupplierID,@Wages,@Lbr_Skill)
	End
	Else
	If UPPER(@OpMode)='UPDATE'
	Begin
		Update tbl_LabourRegistration Set FullName=@FullName,FatherName=@FatherName,C_Address=@C_Address,Labour_Code=@Labour_Code,
		CState=@C_State,CCity=@C_City,CPincode=@C_Pincode,P_Address=@P_Address,PState=@P_State,PCity=@P_City,PPincode=@P_Pincode,Ph_No=@Ph_No,SectorType=@SectorType,
		Work_Specialization=@Work_Specialization,Experience=@Experience,LabourType=@LabourType,Ph_belonging1=@Ph_belonging1,Ph_belonging2=@Ph_belonging2,Ph_belonging3=@Ph_belonging3,
		Ph_belonging4=@Ph_belonging4,Experience_Type=@Experience_Type,Varification=@Verification,Image_URL=@Image_Url,Doc1_URL=@Doc1_Url,Doc2_URL=@Doc2_Url,Doc3_URL=@Doc3_Url,Doc4_URL=@Doc4_Url,SupplierID=@SupplierID,Wages=@Wages,Lbr_Skill=@Lbr_Skill	
		Where Reg_ID=@Reg_ID
	End
	Else
	If UPPER(@OpMode)='DELETE'
	Begin
		Delete From tbl_LabourRegistration where Reg_ID=@Reg_ID
	End	
End
go
--------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------
alter PROC usp_GetLabourId
AS
BEGIN
SELECT (isnull(max(Reg_ID),0))+1 as 'REG_ID' from tbl_LabourRegistration TLR WITH(NOLOCK)                                 
END
GO
---------------------------------------------------------------
ALTER TABLE [dbo].[tbl_Leads] ADD  [Is_accepted] [char](1) NULL
GO

ALTER TABLE [dbo].[tbl_Leads] ADD  [Is_completed] [char](1) NULL
GO
----------------------------------------------------------------
alter Proc [dbo].[usp_Leads]
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
	@Description				Varchar(MAX),
	@is_completed			char(1),
	@is_accepted			char(1)
)
As
Begin
select @OpMode
	if UPPER(@OpMode)='INSERT'
	Begin
		Select @Lead_ID=ISNULL(Max(Lead_ID),0)+1 From tbl_Leads
		
		Insert into tbl_Leads(Lead_ID,Labour_ID,Customer_ID,Required_Date,Required_Time,Status,Ticket,Description,CurrentDate,Is_accepted,Is_completed)
			values(@Lead_ID,@Labour_ID,@Customer_ID,@Required_Date,@Required_Time,@Status,@Ticket,@Description,GETDATE(),'N','N')
	End
	Else	If UPPER(@OpMode)='UPDATE'
	Begin
		Update tbl_Leads Set Status=@Status,Asign=@Asign,Is_accepted=@is_accepted Where Lead_ID=@Lead_ID
	End
	Else
	If UPPER(@OpMode)='UPDCOMP'
	Begin
		Update tbl_Leads Set Status=@Status,Is_completed=@is_completed Where Lead_ID=@Lead_ID
	End
	Else
	If UPPER(@OpMode)='DELETE'
	Begin
		Delete From tbl_Leads where Lead_ID=@Lead_ID
	End
End

go
----------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------
CREATE PROC [dbo].[usp_getCustomerLead]
(
@lead_id int,
@lead_status nvarchar(10),
@called_from nvarchar(2)
)
AS
BEGIN
SELECT UR.USERNAME AS 'CustomerName',UR.phoneno AS 'MobileNo', UR.EMAILID AS'EmailID',TL.Lead_Adress AS 'Address',LT.lbr_type as 'Lbr_Type', 
Required_Date AS 'Required_Date',Required_Time AS 'Required_Time',URS.USERNAME AS 'SupplierName',LR.FULLNAME AS 'LabourName',LR.supplierid as 'SupplierID',
LR.image_url as 'Image_URL',Is_completed,Is_accepted
FROM dbo.tbl_Leads TL WITH(NOLOCK)
LEFT JOIN tbl_LabourRegistration LR WITH(NOLOCK) ON LR.Reg_ID=TL.Labour_ID 
LEFT JOIN tblUserRegistration UR WITH(NOLOCK) ON TL.Labour_ID=UR.UserID 
LEFT JOIN tblUserRegistration URS WITH(NOLOCK) ON LR.supplierid=URS.userid 
LEFT JOIN tbl_Lbr_Type LT ON LR.LabourType=LT.lbr_type_id
WHERE TL.Lead_ID=@lead_id 
END
GO
----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
ALTER table [tbl_ReportHeader] add CompanyId int identity(1,1)
GO
----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------

IF NOT EXISTS(SELECT * FROM [tbl_reportheader] WHERE COMPANYID=1)
BEGIN
INSERT INTO [dbo].[tbl_ReportHeader]([CompanyName],[Address1],[Address2],[Phone1],[Phone2],[Mobile],[Website],[Email])
VALUES('Easy Labour','123-Yamna Vihar','Delhi,110011','0120-234567','9876543210','9182736450','www.easylabour.com','info@easylabour.com')
END
GO
----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------

alter PROC [dbo].[usp_GetLabourData]
(
@Reg_ID int 
)
AS
BEGIN
SELECT Reg_ID,Labour_Code,TLR.FullName LabourName,FatherName,C_Address,CState,
TBS.StateName AS 'CStateName',CCity,TBC.CityName AS 'CCityName',CPincode,P_Address,PState,PCity,TS.StateName AS 'PStateName',
TC.CityName as 'PCityName', PPincode,Ph_No,Ph_belonging1,Ph_belonging2,Ph_belonging3,Ph_belonging4,SectorType,
TSEC.SectorName as 'SectorName',Work_Specialization,Experience,LabourType,TLT.Lbr_Type,Lbr_type_id Experience_Type,
Varification,TLR.Image_URL,TLR.Doc1_URL,TLR.Doc2_URL, TLR.Doc3_URL,TLR.Doc4_URL,TLR.SupplierID,TSD.FullName SupName,TLR.Lbr_Skill as 'Skill_Type',
Wages from tbl_LabourRegistration TLR WITH(NOLOCK)
 LEFT join tblState TBS WITH(NOLOCK) on TLR.CState=TBS.StateID
 LEFT JOIN tblState TS WITH(NOLOCK) ON TLR.PState=TS.StateID  
 LEFT Join tblCity TBC WITH(NOLOCK) on TLR.CCity=TBC.CityID 
 LEFT join tblCity TC WITH(NOLOCK) on TLR.PCity=TC.CityID  
 LEFT Join tbl_Sector TSEC 
WITH(NOLOCK) on TLR.SectorType=TSEC.SectorID  
left Join tbl_Lbr_Type TLT WITH(NOLOCK) on TLR.LabourType=TLT.Lbr_type_id  
left Join tbl_SupplierDetail TSD WITH(NOLOCK) on TLR.SupplierID=TSD.SupplierID  
Where Reg_ID=@Reg_ID
END

GO
----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------

alter Proc [dbo].[usp_UserRegProc]
(
	@OpMode			Varchar(20),
	@UserID			numeric(10),
	@UserName		Varchar(50),
	@LoginName		Varchar(50),--This param is not in use only username is being used.
	@Pwd			Varchar(50),
	@UserTypeID		Numeric(10),
	@UserCategoryID	Numeric(10),--This param is not in use only username is being used. default 1 is being passed from UI
	@EmailID		Varchar(100),
	@IsVerify		Char(1),
	@phoneno		Varchar(15),
	@permanentAdress Varchar(250),
	@SupCode varchar(20)
)
As
Begin
	if UPPER(@OpMode)='INSERT'
		Begin 
		Select @UserID=ISNULL(max(UserID),0)+1 From tblUserRegistration
			Insert Into tblUserRegistration(UserID,UserName,Pwd,UserTypeID,UserCategoryID,EmailID,IsVerify,CreateDate,phoneno,permanentAdress)
				Values(@UserID,@UserName,@Pwd,@UserTypeID,@UserCategoryID,@EmailID,@IsVerify
					,GETDATE(),@phoneno,@permanentAdress)
				Select @UserID
			
		End
	Else if UPPER(@OpMode)='UPDATE'
		Begin

			if @UserID!=0
			Begin
				Update tblUserRegistration Set UserName=@UserName,Pwd=@Pwd
					,UserTypeID=@UserTypeID,UserCategoryID=UserCategoryID,EmailID=@EmailID,IsVerify=@IsVerify
					,ModifyDate=GETDATE(),phoneno=@phoneno,permanentAdress=@permanentAdress
				Where UserID=@UserID
				
				Select @UserID
			End
		END
		Else if UPPER(@OpMode)='DELETE'
		Begin
			Delete From tblUserRegistration Where UserID=@UserID			
		End
End

GO
----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------

CREATE Proc [dbo].[usp_UserSignProc]
(
	@OpMode			Varchar(20),
	@UserID			numeric(10),
	@UserName		Varchar(50),
	@LoginName		Varchar(50),--This param is not in use only username is being used.
	@Pwd			Varchar(50),
	@UserTypeID		Numeric(10),
	@UserCategoryID	Numeric(10),--This param is not in use only username is being used. default 1 is being passed from UI
	@EmailID		Varchar(100),
	@IsVerify		Char(1),
	@phoneno		Varchar(15),
	@permanentAdress Varchar(250),
	@SupCode varchar(20)
)
As
Begin
	if UPPER(@OpMode)='INSERT'
		Begin 
		Select @UserID=ISNULL(max(UserID),0)+1 From tblUserRegistration
		
				Insert Into tblUserRegistration(UserID,UserName,Pwd,UserTypeID,UserCategoryID,EmailID,IsVerify,CreateDate,phoneno,permanentAdress)
				Values(@UserID,@UserName,@Pwd,@UserTypeID,@UserCategoryID,@EmailID,@IsVerify
					,GETDATE(),@phoneno,@permanentAdress)										
				Select @UserID
				
				if(@UserTypeID=3)
				BEGIN
				insert into dbo.tbl_SupplierDetail (SupplierID,FullName,Address,EmailID,Sup_Mobile,SupplierCode) VALUES(@UserID,@UserName,@permanentAdress,
				@EmailID,@phoneno,'SUP'+@SupCode)
				END
		End
End
----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------


ROLLBACK TRAN