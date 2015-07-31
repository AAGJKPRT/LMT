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
using System.IO;


namespace LMT.MasterPages
{
    public partial class NewLeads : System.Web.UI.Page
    {
        csLeads objLeads = new csLeads();
        protected void Page_Load(object sender, EventArgs e)
        {
            hfLeadID.Value = Request.QueryString["ID"].ToString();
            Session["CurrentMode"] = Request.QueryString["Mode"].ToString();
            if ("NL" == Convert.ToString(Session["CurrentMode"]))
            {
                btnAssign.Visible = true;
                btnCloseLeads.Visible = false;
            }
            else
            {
                btnAssign.Visible = false;
                btnCloseLeads.Visible = true;
            }
            hfOpmode.Value = "UPDATE";
            ShowLead();
        }

        private void ShowLead()
        {
            try
            {
                string strQuery = "";
                if ("NL" == Convert.ToString(Session["CurrentMode"]))
                {
                    strQuery = "select Lead_ID,Labour_ID,tbl_LabourRegistration.SupplierID,tbl_LabourRegistration.Image_URL,tbl_LabourRegistration.FullName Fname,tbl_SupplierDetail.FullName,tbl_Lbr_Type.Lbr_Type,Name, " +
                                      "MobileNo,tbl_Customer.EmailID,Address1+','+Address2 as Address,Required_Date,Required_Time from tbl_Leads " +
                                      "inner join tbl_Customer on tbl_Leads.Customer_ID=tbl_Customer.Customer_ID " +
                                      "inner join tbl_LabourRegistration on tbl_Leads.Labour_ID=tbl_LabourRegistration.Reg_ID " +
                                      "inner join tbl_SupplierDetail on tbl_LabourRegistration.SupplierID=tbl_SupplierDetail.SupplierID " +
                                      "inner join tbl_Lbr_Type on tbl_LabourRegistration.LabourType=tbl_Lbr_Type.Lbr_type_id " +
                                      "Where Status='NL' and Lead_ID=" + hfLeadID.Value + "";
                }
                else if ("IP" == Convert.ToString(Session["CurrentMode"]))
                {
                    strQuery = "select Lead_ID,Labour_ID,tbl_LabourRegistration.SupplierID,tbl_LabourRegistration.Image_URL,tbl_LabourRegistration.FullName Fname,tbl_SupplierDetail.FullName,tbl_Lbr_Type.Lbr_Type,Name, " +
                                      "MobileNo,tbl_Customer.EmailID,Address1+','+Address2 as Address,Required_Date,Required_Time from tbl_Leads " +
                                      "inner join tbl_Customer on tbl_Leads.Customer_ID=tbl_Customer.Customer_ID " +
                                      "inner join tbl_LabourRegistration on tbl_Leads.Labour_ID=tbl_LabourRegistration.Reg_ID " +
                                      "inner join tbl_SupplierDetail on tbl_LabourRegistration.SupplierID=tbl_SupplierDetail.SupplierID " +
                                      "inner join tbl_Lbr_Type on tbl_LabourRegistration.LabourType=tbl_Lbr_Type.Lbr_type_id " +
                                      "Where Status='IP' and Lead_ID=" + hfLeadID.Value + "";
                }
                DataTable Labour = csLabourRegistration.FillDataTable(strQuery);
                if (Labour.Rows.Count > 0)
                {
                    DataRow Dr = Labour.Rows[0];
                    LabourImageControl.ImageUrl = Convert.ToString(Dr["Image_URL"]);
                    txtCustName.Text = Convert.ToString(Dr["Name"]);
                    txtCustMobNo.Text = Convert.ToString(Dr["MobileNo"]);
                    txtEmail.Text = Convert.ToString(Dr["EmailID"]);
                    txtAddress.Text = Convert.ToString(Dr["Address"]);
                    txtAddress.ToolTip = Convert.ToString(Dr["Address"]);
                    txtLookFor.Text = Convert.ToString(Dr["Lbr_Type"]);
                    txtCustDate.Text = Convert.ToString(Dr["Required_Date"]);
                    txtCustTime.Text = Convert.ToString(Dr["Required_Time"]);
                    lblName.Text = Convert.ToString(Dr["Fname"]);
                    lblSupName.Text = Convert.ToString(Dr["FullName"]);
                    hfSupplierID.Value = Convert.ToString(Dr["SupplierID"]);
                }
            }
            catch (Exception ex)
            {
                string strFnc = "";
                strFnc = ex.Message;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "CatchMsg", "javascript:AlertMsg('" + strFnc + "');", true);
            }
        }

        protected void btnAssign_Click(object sender, EventArgs e)
        {
            try
            {
                hfOpmode.Value = "UPDATE";
                objLeads.Lead_id = Convert.ToInt32(hfLeadID.Value);
                objLeads.Asign = Convert.ToInt32(hfSupplierID.Value);
                objLeads.Status = "NL";
                objLeads.SaveData(hfOpmode.Value);
                btnAssign.Enabled = false;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "javascript:AlertMsg('Lead assign to supplier.');", true);
            }
            catch (Exception ex)
            {
                string strFnc = "";
                strFnc = ex.Message;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "CatchMsg", "javascript:AlertMsg('" + strFnc + "');", true);
            }
        }

        protected void btnCloseLeads_Click(object sender, EventArgs e)
        {
            try
            {
                hfOpmode.Value = "UPDATE";
                objLeads.Lead_id = Convert.ToInt32(hfLeadID.Value);
                objLeads.Asign = Convert.ToInt32(hfSupplierID.Value);
                objLeads.Status = "CL";
                objLeads.SaveData(hfOpmode.Value);
                btnCloseLeads.Enabled = false;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "javascript:AlertMsg('Lead has been closed.');", true);
            }
            catch (Exception ex)
            {
                string strFnc = "";
                strFnc = ex.Message;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "CatchMsg", "javascript:AlertMsg('" + strFnc + "');", true);
            }
        }
    }
}