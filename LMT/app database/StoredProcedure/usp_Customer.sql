USE [LMT]
GO

/****** Object:  StoredProcedure [dbo].[usp_Customer]    Script Date: 08/01/2015 19:35:08 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE Proc [dbo].[usp_Customer]
(
	@OpMode						Varchar(10),
	@Customer_ID				Int,
	@Name						Varchar(50),
	@EmailID					Varchar(50),
	@MobileNo					Varchar(10),
	@Address1					Varchar(70),
	@Address2					Varchar(70),
	@Password					Varchar(30),
	@Ticket						Varchar(20)
)
As
Begin
	if UPPER(@OpMode)='INSERT'
	Begin
		Insert into tbl_Customer(Customer_ID,Name,EmailID,MobileNo,Address1,Address2,Password,Ticket)
			values(@Customer_ID,@Name,@EmailID,@MobileNo,@Address1,@Address2,@Password,@Ticket)
			Select @Customer_ID
	End
	Else
	--If UPPER(@OpMode)='UPDATE'
	--Begin
	--	Update tbl_Customer Set Password=@Password Where Lead_ID=@Lead_ID
	--End
	--Else
	If UPPER(@OpMode)='DELETE'
	Begin
		Delete From tbl_Customer where Customer_ID=@Customer_ID
	End
	
	
	
End


GO


