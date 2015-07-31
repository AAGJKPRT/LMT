using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Data;
using CrystalDatabase;
//using System.Web.Script.Services;

namespace LMT
{
    /// <summary>
    /// Summary description for GetLabour
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class GetLabour : System.Web.Services.WebService
    {

        [WebMethod(EnableSession = true)]
        public List<string> GetLabourTypeNames(string prefix)
        {
            List<string> LabourType = new List<string>();
            string value = null;
            
            DataSet pDS = new DataSet();
            
            //pDS = CallWebService.FPILogic0003_1();
            try
            {
                pDS = FillDataSet("Select * From tbl_Lbr_Type");
                
                DataRow Row;
                string strCondition = "Lbr_Type like '" + prefix + "%'";
                DataRow[] drFilterRows = pDS.Tables[0].Select(strCondition);
                string[] ARR = new string[drFilterRows.Length];
                for (int i = 0; i < drFilterRows.Length; i++)
                {
                    ARR[i] = drFilterRows[i][1].ToString();
                }
                pDS.Tables[0].Reset();
                pDS.Tables[0].Columns.Add();
                for (int j = 0; j < ARR.Length; j++)
                {
                    Row = pDS.Tables[0].NewRow();
                    pDS.Tables[0].Rows.Add();

                    pDS.Tables[0].Rows[j][0] = ARR[j].ToString();
                    if (drFilterRows.Count() > 0)
                    {
                        LabourType.Add(pDS.Tables[0].Rows[j][0].ToString());
                    }

                }

                return LabourType;
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }
        public static DataSet FillDataSet(string query)
        {
            DataSet dtFillData;
            dtFillData = CrystalConnection.CreateDatasetWithoutTransaction(query);
            //dtFillData = CrystalConnection.CreateDataTableWithoutTransaction(query);
            return dtFillData;
        }
    }
}
