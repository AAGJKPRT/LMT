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


namespace LMT.Supplier
{
    public partial class NewLeads : System.Web.UI.Page
    {
        csLeads objLeads = new csLeads();
        protected void Page_Load(object sender, EventArgs e)
        {
            hfLeadID.Value = Request.QueryString["ID"].ToString();
            hfLeadMode.Value = Request.QueryString["MODE"].ToString();
            if (hfLeadMode.Value == "CL")
            {
                btnAccept.Visible = false;
                ShowLead(hfLeadMode.Value);
            }
            else
            {
                btnAccept.Visible = true;
                ShowLead(hfLeadMode.Value);
            }
            
            hfOpmode.Value = "UPDATE";
            
        }

        private void ShowLead(string LeadMode)
        {
            try
            {
                string strQuery = "select Lead_ID,Labour_ID,tbl_LabourRegistration.SupplierID,tbl_LabourRegistration.Image_URL,tbl_LabourRegistration.FullName Fname,tbl_SupplierDetail.FullName,tbl_Lbr_Type.Lbr_Type,Name, " +
                                  "MobileNo,tbl_Customer.EmailID,Address1+','+Address2 as Address,Required_Date,Required_Time from tbl_Leads " +
                                  "inner join tbl_Customer on tbl_Leads.Customer_ID=tbl_Customer.Customer_ID " +
                                  "inner join tbl_LabourRegistration on tbl_Leads.Labour_ID=tbl_LabourRegistration.Reg_ID " +
                                  "inner join tbl_SupplierDetail on tbl_LabourRegistration.SupplierID=tbl_SupplierDetail.SupplierID " +
                                  "inner join tbl_Lbr_Type on tbl_LabourRegistration.LabourType=tbl_Lbr_Type.Lbr_type_id " +
                                  "Where Status='" + LeadMode + "' and Lead_ID=" + hfLeadID.Value + "";
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

        protected void btnAccept_Click(object sender, EventArgs e)
        {
            try
            {
                hfOpmode.Value = "UPDATE";
                objLeads.Lead_id = Convert.ToInt32(hfLeadID.Value);
                objLeads.Asign = Convert.ToInt32(hfSupplierID.Value);
                objLeads.Status = "IP";
                objLeads.SaveData(hfOpmode.Value);
                btnAccept.Enabled = false;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "javascript:AlertMsg('Lead Accepted.');", true);
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