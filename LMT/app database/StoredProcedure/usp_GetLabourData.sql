CREATE PROC usp_GetLabourData
(
@Reg_ID int 
)
AS
BEGIN
SELECT Reg_ID,Labour_Code,TLR.FullName LabourName,FatherName,C_Address,CState,
TBS.StateName AS 'CStateName',CCity,TBC.CityName AS 'CCityName',CPincode,P_Address,PState,PCity,TS.StateName AS 'PStateName',
TC.CityName as 'PCityName', PPincode,Ph_No,Ph_belonging1,Ph_belonging2,Ph_belonging3,Ph_belonging4,SectorType,
TSEC.SectorName as 'SectorName',Work_Specialization,Experience,LabourType,
                                  TLT.Lbr_Type,Lbr_type_id
                                  Experience_Type,Varification,TLR.Image_URL,TLR.Doc1_URL,TLR.Doc2_URL, 
                                  TLR.Doc3_URL,TLR.Doc4_URL,TLR.SupplierID,
                                  TSD.FullName SupName,
                                  Wages from tbl_LabourRegistration TLR WITH(NOLOCK)
                                  LEFT join tblState TBS WITH(NOLOCK) on TLR.CState=TBS.StateID
                                  LEFT JOIN tblState TS WITH(NOLOCK) ON TLR.PState=TS.StateID  
                                  LEFT Join tblCity TBC WITH(NOLOCK) on TLR.CCity=TBC.CityID 
                                  LEFT join tblCity TC WITH(NOLOCK) on TLR.PCity=TC.CityID  
                                  LEFT Join tbl_Sector TSEC WITH(NOLOCK) on TLR.SectorType=TSEC.SectorID  
                                  left Join tbl_Lbr_Type TLT WITH(NOLOCK) on TLR.LabourType=TLT.Lbr_type_id  
                                  left Join tbl_SupplierDetail TSD WITH(NOLOCK) on TLR.SupplierID=TSD.SupplierID  
                                 Where Reg_ID=@Reg_ID
                                 
 END

