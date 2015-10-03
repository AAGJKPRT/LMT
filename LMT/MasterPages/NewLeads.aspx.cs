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
using System.Web.Services;
using System.Web.Script.Serialization;


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
            ScriptManager.RegisterStartupScript(this, this.GetType(), "LoadSuppliers", "BindSupplierList();", true);
            ShowLead();
        }

        private void ShowLead()
        {
            try
            {
                string strQuery = "";
                //if ("NL" == Convert.ToString(Session["CurrentMode"]))//NL means New lead
                //{
                //     strQuery = "select Lead_ID,Labour_ID,tbl_LabourRegistration.SupplierID,tbl_LabourRegistration.Image_URL,tbl_LabourRegistration.FullName Fname,tbl_SupplierDetail.FullName,tbl_Lbr_Type.Lbr_Type,Name, " +
                //                  "tblUserRegistration.phoneno AS MobileNo,tbl_Customer.EmailID,tbl_Leads.Description as Address,Required_Date,Required_Time,Is_completed,Is_accepted from tbl_Leads " +
                //                  "inner join tbl_Customer on tbl_Leads.Customer_ID=tbl_Customer.Customer_ID inner join tbl_LabourRegistration on tbl_Leads.Labour_ID=tbl_LabourRegistration.Reg_ID" +
                //                  " inner join tbl_SupplierDetail on tbl_LabourRegistration.SupplierID=tbl_SupplierDetail.SupplierID" +
                //                  " inner join tbl_Lbr_Type on tbl_LabourRegistration.LabourType=tbl_Lbr_Type.Lbr_type_id"+
                //                  " INNER join tblUserRegistration on tbl_Customer.Customer_ID=tblUserRegistration.UserID" +
                //                    " Where Status='NL' and Lead_ID=" + hfLeadID.Value + "";
                //}
                //else if ("IP" == Convert.ToString(Session["CurrentMode"]))//IP means inProgress
                //{
                //strQuery = "select Lead_ID,Labour_ID,LR.SupplierID,LR.Image_URL,LR.FullName 'LabourName',SD.FullName 'SupplierName',tbl_Lbr_Type.Lbr_Type,Name as 'CustomerName', " +
                //                  "UR.phoneno AS MobileNo,tbl_Customer.EmailID,LD.Description as Address,Required_Date,Required_Time,Is_completed,Is_accepted from tbl_Leads LD " +
                //                  "inner join tbl_Customer on LD.Customer_ID=tbl_Customer.Customer_ID inner join tbl_LabourRegistration LR on LD.Labour_ID=LR.Reg_ID  inner join tbl_SupplierDetail SD on " +
                //                  "LR.SupplierID=SD.SupplierID inner join tbl_Lbr_Type on LR.LabourType=tbl_Lbr_Type.Lbr_type_id INNER join tblUserRegistration UR on tbl_Customer.Customer_ID=UR.UserID " +
                //                  "Where Status='" + Convert.ToString(Session["CurrentMode"]) + "' and Lead_ID=" + hfLeadID.Value + "";
                ////strQuery = "select Lead_ID,Labour_ID,tbl_LabourRegistration.SupplierID,tbl_LabourRegistration.Image_URL,tbl_LabourRegistration.FullName Fname,tbl_SupplierDetail.FullName,tbl_Lbr_Type.Lbr_Type,Name, " +
                //                  "MobileNo,tbl_Customer.EmailID,Address1+','+Address2 as Address,Required_Date,Required_Time from tbl_Leads " +
                //                  "inner join tbl_Customer on tbl_Leads.Customer_ID=tbl_Customer.Customer_ID " +
                //                  "inner join tbl_LabourRegistration on tbl_Leads.Labour_ID=tbl_LabourRegistration.Reg_ID " +
                //                  "inner join tbl_SupplierDetail on tbl_LabourRegistration.SupplierID=tbl_SupplierDetail.SupplierID " +
                //                  "inner join tbl_Lbr_Type on tbl_LabourRegistration.LabourType=tbl_Lbr_Type.Lbr_type_id " +
                //                  "Where Status='IP' and Lead_ID=" + hfLeadID.Value + "";
                // }

                DataTable Labour = csLabourRegistration.GetCustomerLeadData(Convert.ToInt32(hfLeadID.Value), Convert.ToString(Session["CurrentMode"]), "A");

                if (Labour.Rows.Count > 0)
                {
                    DataRow Dr = Labour.Rows[0];
                    LabourImageControl.ImageUrl = Convert.ToString(Dr["Image_URL"]);
                    txtCustName.Text = Convert.ToString(Dr["CustomerName"]);
                    txtCustMobNo.Text = Convert.ToString(Dr["MobileNo"]);
                    txtEmail.Text = Convert.ToString(Dr["EmailID"]);
                    txtAddress.Text = Convert.ToString(Dr["Address"]);
                    txtAddress.ToolTip = Convert.ToString(Dr["Address"]);
                    txtLookFor.Text = Convert.ToString(Dr["Lbr_Type"]);
                    txtCustDate.Text = Convert.ToString(Dr["Required_Date"]);
                    txtCustTime.Text = Convert.ToString(Dr["Required_Time"]);
                    lblName.Text = Convert.ToString(Dr["LabourName"]);
                    lblSuppilerName.Text = Convert.ToString(Dr["SupplierName"]);
                    hfSupplierID.Value = Convert.ToString(Dr["SupplierID"]);
                }
            }
            catch (Exception ex)
            {
                string strFnc = "";
                strFnc = ex.Message;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "CatchMsg", "javascript:alert('" + strFnc + "');", true);
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
                ScriptManager.RegisterStartupScript(this, this.GetType(), "CloseLead_alert", "javascript:alert('We hope user is satisfied with our services, this lead has been closed thank you !');", true);
            }
            catch (Exception ex)
            {
                string strFnc = "";
                strFnc = ex.Message;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "CatchMsg", "javascript:alert('" + strFnc + "');", true);
            }
        }

        public class SupplierList
        {
            public int SupplierId { get; set; }
            public string SupplierName { get; set; }

        }
        [WebMethod]
        public static string getSupplierList()
        {

            List<SupplierList> IsupplierList = new List<SupplierList>();
            SupplierList supplier = new SupplierList();
            DataTable dtSupplier = new DataTable();
            dtSupplier = CrystalConnection.CreateDataTableWithoutTransaction("usp_GetAllSupplierList");
            foreach (DataRow dr in dtSupplier.Rows)
            {
                supplier = new SupplierList();
                supplier.SupplierId = Convert.ToInt32(dr["SupplierID"]);
                supplier.SupplierName = dr["SupplierName"].ToString();
                IsupplierList.Add(supplier);
            }
            string sJSON = "";
            var oSerializer = new System.Web.Script.Serialization.JavaScriptSerializer();
            return sJSON = oSerializer.Serialize(IsupplierList);
        }

        protected void btnAssign_Click(object sender, EventArgs e)
        {
            try
            {
                hfOpmode.Value = "UPDATE";
                objLeads.Lead_id = Convert.ToInt32(hfLeadID.Value);
                objLeads.Asign = Convert.ToInt32(hfSupplierID.Value);//ddlsupplier.SelectedValue);
                objLeads.Status = "IP";
                objLeads.Is_completed = "N";
                objLeads.Is_accepted = "N";
                objLeads.SaveData(hfOpmode.Value);
                btnAssign.Enabled = false;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "AssignLead_alert", "javascript:alert('Lead assign to supplier.');", true);
            }
            catch (Exception ex)
            {
                string strFnc = "";
                strFnc = ex.Message;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "CatchMsg", "javascript:alert('" + strFnc + "');", true);
            }
        }
    }
}