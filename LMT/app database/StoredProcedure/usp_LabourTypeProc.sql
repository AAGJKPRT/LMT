USE [LMT]
GO

/****** Object:  StoredProcedure [dbo].[usp_LabourTypeProc]    Script Date: 08/01/2015 19:35:44 ******/
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


