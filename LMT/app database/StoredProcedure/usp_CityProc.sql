USE [LMT]
GO

/****** Object:  StoredProcedure [dbo].[usp_CityProc]    Script Date: 08/01/2015 19:34:48 ******/
SET ANSI_NULLS OFF
GO

SET QUOTED_IDENTIFIER ON
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


