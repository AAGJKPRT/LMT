USE [LMT]
GO
/****** Object:  StoredProcedure [dbo].[usp_GetOldLeads]    Script Date: 08/02/2015 16:14:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Proc [dbo].[usp_GetOldLeads]
(
@userID int
)
AS
Begin
 Select Leads.Lead_ID,Leads.Ticket,isnull(Leads.Asign,-1)SupplierID,Leads.Required_Date,Leads.Required_Time,isnull(SD.FullName,'')SupplierName,LR.FullName as LabourName from tbl_Leads as Leads
 inner join tblUserRegistration as UR on Leads.Customer_ID=UR.UserID
 inner join tbl_LabourRegistration as LR on Leads.Labour_ID=LR.Reg_ID
 Left outer join tbl_SupplierDetail SD on isnull(Leads.Asign,' ')=SD.SupplierID
 where UR.UserID=@userID
 End