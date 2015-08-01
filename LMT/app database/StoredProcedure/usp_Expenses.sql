USE [LMT]
GO

/****** Object:  StoredProcedure [dbo].[usp_Expenses]    Script Date: 08/01/2015 19:35:19 ******/
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


