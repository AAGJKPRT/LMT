
CREATE PROC [dbo].[usp_FetchSupProfile](  
@SupID int  
)  
AS  
BEGIN  
Select SupplierID,SupplierCode,FullName,Address,Sup_City,CityName,Sup_State,  
StateName,Pincode,Sup_Mobile,EmailID,CompanyName,BankName,BankACNo,AC_IFSC_Code,Doc1_Url,  
Doc2_Url,Image_Url,MemberShip from tbl_SupplierDetail  WITH(NOLOCK)
Inner join tblState WITH(NOLOCK) on tbl_SupplierDetail.Sup_State=tblState.StateID  
Inner Join tblCity WITH(NOLOCK) on tbl_SupplierDetail.Sup_City=tblCity.CityID  
Where SupplierID=@SupID  
END  
GO


