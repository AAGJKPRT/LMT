USE [LMT]
GO

/****** Object:  StoredProcedure [dbo].[usp_Leads]    Script Date: 08/01/2015 19:36:14 ******/
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


