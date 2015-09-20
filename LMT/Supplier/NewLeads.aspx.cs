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
            if (!IsPostBack)
            {
                if (Request.QueryString["TYPE"].ToString() == "3" && hfLeadMode.Value == "CL")
                {
                    btnAccept.Visible = false;
                    btnComplete.Visible = false;
                    chkIsCompleted.Visible = true;
                    ShowLead(hfLeadMode.Value);
                }
                else if (Request.QueryString["TYPE"].ToString() == "2" && hfLeadMode.Value == "IP")
                {
                    btnAccept.Visible = false;
                    btnComplete.Visible = true;
                    chkIsCompleted.Visible = true;
                    ShowLead(hfLeadMode.Value);
                }
                else
                {
                    btnAccept.Visible = true;
                    btnComplete.Visible = false;
                    chkIsCompleted.Visible = false;
                    ShowLead(hfLeadMode.Value);
                }

            }
        }

        private void ShowLead(string LeadMode)
        {
            try
            {
                string strQuery = "select Lead_ID,Labour_ID,tbl_LabourRegistration.SupplierID,tbl_LabourRegistration.Image_URL,tbl_LabourRegistration.FullName Fname,tbl_SupplierDetail.FullName,tbl_Lbr_Type.Lbr_Type,Name, " +
                                  "tblUserRegistration.phoneno AS MobileNo,tbl_Customer.EmailID,tbl_Leads.Description as Address,Required_Date,Required_Time,Is_completed,Is_accepted from tbl_Leads " +
                                  "inner join tbl_Customer on tbl_Leads.Customer_ID=tbl_Customer.Customer_ID inner join tbl_LabourRegistration on tbl_Leads.Labour_ID=tbl_LabourRegistration.Reg_ID" +
                                  " inner join tbl_SupplierDetail on tbl_LabourRegistration.SupplierID=tbl_SupplierDetail.SupplierID " +
                                  "inner join tbl_Lbr_Type on tbl_LabourRegistration.LabourType=tbl_Lbr_Type.Lbr_type_id " +
                                  "INNER join tblUserRegistration on tbl_Customer.Customer_ID=tblUserRegistration.UserID " +
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
                    if (Convert.ToString(Dr["Is_completed"]) == "Y")
                    {
                        chkIsCompleted.Checked = true;
                        btnComplete.Enabled = false;
                    }
                    else
                    {
                        chkIsCompleted.Checked = false;
                        btnComplete.Enabled = true;
                    }
                    if (Convert.ToString(Dr["Is_accepted"]) == "Y")
                    {
                        btnAccept.Enabled = false;
                    }
                    else
                    {
                        btnAccept.Enabled = true;
                    }
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
                objLeads.Is_completed = "N";
                objLeads.Is_accepted = "Y";
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

        protected void btnComplete_Click(object sender, EventArgs e)
        {
            try
            {

                hfOpmode.Value = "UPDCOMP";
                objLeads.Lead_id = Convert.ToInt32(hfLeadID.Value);
                objLeads.Asign = Convert.ToInt32(hfSupplierID.Value);
                //CheckBox chk = (CheckBox)FindControl("chkIsCompleted");
                if (chkIsCompleted.Checked == true)
                {
                    objLeads.Is_completed = "Y";
                    objLeads.Is_accepted = "Y";
                    objLeads.Status = "CL";
                    btnComplete.Enabled = false;
                }
                else
                {
                    objLeads.Is_completed = "N";
                    objLeads.Is_accepted = "Y";
                }
                objLeads.SaveData(hfOpmode.Value);

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