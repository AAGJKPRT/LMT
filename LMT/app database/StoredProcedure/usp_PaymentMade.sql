USE [LMT]
GO

/****** Object:  StoredProcedure [dbo].[usp_PaymentMade]    Script Date: 08/01/2015 19:36:30 ******/
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


