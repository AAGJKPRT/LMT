USE [LMT]
GO

/****** Object:  StoredProcedure [dbo].[usp_UserLoginProc]    Script Date: 08/01/2015 19:37:24 ******/
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


