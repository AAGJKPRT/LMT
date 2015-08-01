USE [LMT]
GO

/****** Object:  StoredProcedure [dbo].[usp_StateProc]    Script Date: 08/01/2015 19:36:52 ******/
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


