using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LMT.BusinessLogic;
using System.Configuration;
using System.Collections;
using System.Data;
using CrystalDatabase;
using System.Data.SqlClient;
using System.Globalization;
using System.Drawing;
using System.Text.RegularExpressions;
using System.IO;
using LMT.ClassGlobal;

namespace LMT.MasterPages
{
    public partial class EditLabProfile : System.Web.UI.Page
    {
        csSupplierDetail objSuplier = new csSupplierDetail();
        csUserRegistration objUserRegistration = new csUserRegistration();
        csDropDownFunction objDropDown = new csDropDownFunction();
        csGlobal globaldata = new csGlobal();

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    hfLabourID.Value = "0";

                    if (Request.QueryString["ID"] != null)
                    {
                        hfLabourID.Value = Request.QueryString["ID"].ToString();
                        ShowLabourData();
                        //txtFullName.Text = Convert.ToString(Request.QueryString["NAME"].ToString());
                    }
                }
            }
            catch (Exception ex)
            {
                string strFnc = "";
                strFnc = ex.Message;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "CatchMsg", "alert('" + strFnc + "');", true);
            }

        }

        private void ShowLabourData()
        {
            try
            {
                string StrQuery = "Select Reg_ID,Labour_Code,tbl_LabourRegistration.FullName LabourName,FatherName,C_Address,StateName,CityName,CPincode,Ph_No,SectorName,Work_Specialization,Experience, " +
                                  "Lbr_Type,Experience_Type,Varification,tbl_LabourRegistration.Image_URL,tbl_LabourRegistration.Doc1_URL,tbl_SupplierDetail.FullName SupName from tbl_LabourRegistration " +
                                  "Inner join tblState on tbl_LabourRegistration.CState=tblState.StateID " +
                                  "Inner Join tblCity on tbl_LabourRegistration.CCity=tblCity.CityID " +
                                  "Inner Join tbl_Sector on tbl_LabourRegistration.SectorType=tbl_Sector.SectorID " +
                                  "Inner Join tbl_Lbr_Type on tbl_LabourRegistration.LabourType=tbl_Lbr_Type.Lbr_type_id " +
                                  "Inner Join tbl_SupplierDetail on tbl_LabourRegistration.SupplierID=tbl_SupplierDetail.SupplierID " +
                                  " Where Reg_ID=" + hfLabourID.Value + "";
                DataTable Labour = csLabourRegistration.FillDataTable(StrQuery);
                if (Labour.Rows.Count > 0)
                {
                    DataRow Dr = Labour.Rows[0];
                    //Tab Personal
                    lblFullName.Text = Dr["LabourName"].ToString();
                    lblFatherName.Text = Dr["FatherName"].ToString();
                    lblCurrentAdd.Text = Dr["C_Address"].ToString();
                    lblCurrentState.Text = Dr["StateName"].ToString();
                    lblCurrentCity.Text = Dr["CityName"].ToString();
                    lblPincode.Text = Dr["CPincode"].ToString();
                    
                    lblPhone.Text = Dr["Ph_No"].ToString();
                    lblSectorType.Text = Dr["SectorName"].ToString();
                    lblWorkSpecialization.Text = Dr["Work_Specialization"].ToString();
                    lblExperience.Text = Dr["Experience"].ToString();
                    lblLabourType.Text = Dr["Lbr_Type"].ToString();
                    
                    //lblex = Dr["Experience_Type"].ToString();
                    if (Convert.ToString(Dr["Varification"]) == "2")
                        lblVerification.Text = "Done";
                    else
                        lblVerification.Text = "Not Done";
                    ImgLabour.ImageUrl = Dr["Image_URL"].ToString();
                    if (Convert.ToString(Dr["Doc1_URL"].ToString()) != "")
                        lblDocument.Text = "Yes";
                    else
                        lblDocument.Text = "No";
                    lblLabourCode.Text = Dr["Labour_Code"].ToString();
                }
            }
            catch (Exception ex)
            {
                string strFnc = "";
                strFnc = ex.Message;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "CatchMsg", "javascript:AlertMsg('" + strFnc + "');", true);
            }
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/MasterPages/Supplier.aspx");
        }

    }
}