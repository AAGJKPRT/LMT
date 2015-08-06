--Added by khushbu for Lookup


CREATE PROCEDURE GetLookup(    
@LookupCode nvarchar(50)    
)    
AS    
BEGIN    
IF(@LookupCode='STATE')  
BEGIN  
SELECT STATEID AS 'LID',STATENAME AS 'LDESC' FROM TBLSTATE WITH(NOLOCK)   
END  
ELSE IF(@LookupCode='CITY')  
BEGIN  
SELECT CityID AS 'LID',CityName  AS 'LDESC' from tblCity WITH(NOLOCK)   
END  
END  

