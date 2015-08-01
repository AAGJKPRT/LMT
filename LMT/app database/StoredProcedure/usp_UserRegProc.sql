USE [LMT]
GO

/****** Object:  StoredProcedure [dbo].[usp_UserRegProc]    Script Date: 08/01/2015 19:37:42 ******/
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


