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
    public partial class rptLabourProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                    ShowReportHeader();
                    if (Request.QueryString["ID"] != null)
                    {
                        hfRegID.Value = Request.QueryString["ID"].ToString();
                        hfOpmode.Value = "UPDATE";
                        ShowLabourData();
                    }
                }
                catch (Exception)
                {
                    throw;
                }
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

        private void ShowLabourData()
        {
            try
            {
                string StrQuery = "Select Reg_ID,Labour_Code,tbl_LabourRegistration.FullName LabourName,FatherName,C_Address,CState,StateName,CCity,CityName,CPincode,P_Address,PState,PCity,PPincode,Ph_No, " +
                                  "Ph_belonging1,Ph_belonging2,Ph_belonging3,Ph_belonging4,SectorType,SectorName,Work_Specialization,Experience, " +
                                  "LabourType,Lbr_Type,Experience_Type,Varification,tbl_LabourRegistration.Image_URL,tbl_LabourRegistration.Doc1_URL,tbl_LabourRegistration.Doc2_URL, " +
                                  "tbl_LabourRegistration.Doc3_URL,tbl_LabourRegistration.Doc4_URL,tbl_SupplierDetail.FullName SupName,Wages from tbl_LabourRegistration " +
                                  "Inner join tblState on tbl_LabourRegistration.CState=tblState.StateID and tbl_LabourRegistration.PState=tblState.StateID " +
                                  "Inner Join tblCity on tbl_LabourRegistration.CCity=tblCity.CityID and tbl_LabourRegistration.PCity=tblCity.CityID " +
                                  "Inner Join tbl_Sector on tbl_LabourRegistration.SectorType=tbl_Sector.SectorID " +
                                  "Inner Join tbl_Lbr_Type on tbl_LabourRegistration.LabourType=tbl_Lbr_Type.Lbr_type_id " +
                                  "Inner Join tbl_SupplierDetail on tbl_LabourRegistration.SupplierID=tbl_SupplierDetail.SupplierID " +
                                  " Where Reg_ID=" + hfRegID.Value + "";
                DataTable Labour = csLabourRegistration.FillDataTable(StrQuery);
                if (Labour.Rows.Count > 0)
                {
                    DataRow Dr = Labour.Rows[0];
                    
                    //ViewLabour
                    lblFullName.Text = Dr["LabourName"].ToString();
                    lblFatherName.Text = Dr["FatherName"].ToString();
                    lblCurrentAdd.Text = Dr["C_Address"].ToString();
                    lblCurrentState.Text = Dr["StateName"].ToString();
                    lblCurrentCity.Text = Dr["CityName"].ToString();
                    lblPincode.Text = Dr["CPincode"].ToString();
                    lblPermanentAddress.Text = Dr["P_Address"].ToString();
                    lblPermanentState.Text = Dr["PState"].ToString(); ;
                    lblpermanentCity.Text = Dr["PCity"].ToString();
                    lblPermanentPincode.Text = Dr["PPincode"].ToString();
                    lblPhone.Text = Dr["Ph_No"].ToString();
                    lblBelongingPhone1.Text = Dr["Ph_belonging1"].ToString();
                    lblBelongingPhone2.Text = Dr["Ph_belonging2"].ToString();
                    lblBelongingPhone3.Text = Dr["Ph_belonging3"].ToString();
                    lblBelongingPhone4.Text = Dr["Ph_belonging4"].ToString();
                    lblSectorType.Text = Dr["SectorName"].ToString();
                    lblWorkSpecialization.Text = Dr["Work_Specialization"].ToString();
                    lblExperience.Text = Dr["Experience"].ToString();
                    lblLabourType.Text = Dr["Lbr_Type"].ToString();

                    //lblex = Dr["Experience_Type"].ToString();
                    if (Convert.ToString(Dr["Varification"]) == "1")
                        lblVerification.Text = "Done";
                    else
                        lblVerification.Text = "Not Done";
                    ImgLabour.ImageUrl = Dr["Image_URL"].ToString();
                    string StrDoc = Dr["Doc1_URL"].ToString();

                    imgDoc1.ImageUrl = Dr["Doc1_URL"].ToString();
                    
                    imgDoc2.ImageUrl = Dr["Doc2_URL"].ToString();
                    
                    imgDoc3.ImageUrl = Dr["Doc3_URL"].ToString();
                    
                    imgDoc4.ImageUrl = Dr["Doc4_URL"].ToString();
                    
                    if (Convert.ToString(Dr["Doc1_URL"].ToString()) != "")
                        lblDocument.Text = "Yes";
                    else
                        lblDocument.Text = "No";
                    lblLabourCode.Text = Dr["Labour_Code"].ToString();
                    lblWages.Text = Dr["Wages"].ToString();
                }
            }
            catch (Exception ex)
            {
                string strFnc = "";
                strFnc = ex.Message;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "CatchMsg", "javascript:AlertMsg('" + strFnc + "');", true);
            }
        }
        protected void btnPrint_Click(object sender, ImageClickEventArgs e)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "message", "javascript:window.print()", true);
        }
    }
}