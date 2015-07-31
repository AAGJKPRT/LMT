using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

using System.Drawing;
using System.Data.SqlClient;
using System.IO;
//using iTextSharp.text;
//using iTextSharp.text.html.simpleparser;
//using iTextSharp.text.pdf;
using System.Text;
using LMT.ClassGlobal;
using LMT.BusinessLogic;
using CrystalDatabase;

namespace LMT.Reports
{
    public partial class AllLabours : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                    ShowReportHeader();
                    BindRepeater();
                }
                catch (Exception)
                {
                    throw;
                }
            }
        }
        private void BindRepeater()
        {
            try
            {
                string str = "Select ROW_NUMBER() Over(order by tbl_LabourRegistration.FullName)as SerialNo,tbl_LabourRegistration.FullName,tbl_SupplierDetail.FullName as SupplierName,Ph_No, "+
                             "SectorName,Lbr_Type,C_Address+', '+CityName+', '+StateName as C_Address from tbl_LabourRegistration "+
                             "Inner Join tbl_SupplierDetail on tbl_LabourRegistration.SupplierID=tbl_SupplierDetail.SupplierID "+
                             "Inner Join tbl_Sector on tbl_LabourRegistration.SectorType=tbl_Sector.SectorID "+
                             "Inner Join tbl_Lbr_Type on tbl_LabourRegistration.LabourType=tbl_Lbr_Type.Lbr_type_id "+
                             "Inner Join tblCity on tbl_LabourRegistration.CCity=tblCity.CityID "+
                             "Inner Join tblState on tbl_LabourRegistration.CState=tblState.StateID";
                csGlobalFunction.BindRepeater(ref rptAllLabour, str);
            }
            catch (Exception)
            {
                throw;
            }
        }
        private void ShowReportHeader()
        {
            try
            {
                string strQuery = "Select * from tbl_reportheader";
                DataSet dsReportHeader = CrystalConnection.CreateDatasetWithoutTransaction(strQuery);

                if (dsReportHeader.Tables[0].Rows.Count > 0)
                {
                    DataRow dr = dsReportHeader.Tables[0].Rows[0];
                    Ltname.Text = dr["CompanyName"].ToString();
                    Ltaddress1.Text = dr["Address1"].ToString();
                    Ltaddress2.Text = dr["Address2"].ToString();
                    Ltphone1.Text = dr["Phone1"].ToString();
                    Ltphone2.Text = dr["Phone2"].ToString();
                    LtSchoolMobile.Text = dr["Mobile"].ToString();
                    Ltwebsite.Text = dr["Website"].ToString();
                }
            }
            catch (Exception)
            {
                throw;
            }

        }
        protected void btnPrint_Click(object sender, ImageClickEventArgs e)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "message", "javascript:window.print()", true);
        }

        protected void ExportToExl_Click(object sender, ImageClickEventArgs e)
        {
            try
            {
                Response.Clear();
                Response.Buffer = true;
                string FileName = "AllLabour_" + DateTime.Now.ToString() + ".xls";
                Response.AddHeader("Content-Disposition", "inline;filename=" + FileName);
                Response.Charset = "";
                Response.Cache.SetCacheability(HttpCacheability.NoCache);
                Response.ContentType = "application/vnd.ms-excel";
                StringWriter sw = new StringWriter();
                HtmlTextWriter hw = new HtmlTextWriter(sw);
                HeaderTable.RenderControl(hw);
                rptAllLabour.RenderControl(hw);

                Response.Output.Write(sw.ToString());
                Response.Flush();
                Response.End();
            }
            catch (FileNotFoundException)
            {
                throw;
            }
        }
       

    }
}