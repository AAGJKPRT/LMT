USE [LMT]
GO

/****** Object:  StoredProcedure [dbo].[usp_PaymentRecieve]    Script Date: 08/01/2015 19:36:42 ******/
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


