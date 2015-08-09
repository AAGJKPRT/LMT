--Added by khushbu to fill labour piechart data

CREATE PROC [dbo].[usp_FillLabourChartData](  
@PieChart nvarchar(50),
@UserId int =null
)  
AS  
BEGIN  
IF(@PieChart='PW')
BEGIN
Select total=COUNT(LabourType),Lbr_Type,LabourType from tbl_LabourRegistration WITH(NOLOCK)
Inner Join tbl_Lbr_Type WITH(NOLOCK) on tbl_LabourRegistration.LabourType=tbl_Lbr_Type.Lbr_type_id
group by LabourType,Lbr_Type
END
ELSE IF(@PieChart='AW')
BEGIN
Select total=COUNT(CCity),CCity,CityName from tbl_LabourRegistration WITH(NOLOCK) Inner Join tblCity WITH(NOLOCK)
on tbl_LabourRegistration.CCity=tblCity.CityID group by CCity,CityName
END
ELSE IF(@PieChart='SW')
BEGIN
Select total=COUNT(Experience_Type),Experience_Type from tbl_LabourRegistration WITH(NOLOCK) group by Experience_Type
END
ELSE IF(@PieChart='SECW')
BEGIN
Select total=COUNT(SectorType),SectorType,SectorName as 'Sector' from tbl_LabourRegistration WITH(NOLOCK) inner join tbl_Sector
on SectorType=SectorID 
group by SectorType,SectorName
END
ELSE IF(@PieChart='OLW')
BEGIN
Select total=COUNT(Experience_Type),Experience_Type from tbl_LabourRegistration WITH(NOLOCK) where SupplierID=@UserId group by Experience_Type
END
END  


GO


