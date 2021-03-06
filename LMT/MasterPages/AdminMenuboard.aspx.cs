﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Configuration;
using System.Collections;
using System.Data;
using CrystalDatabase;
using LMT.ClassGlobal;
using System.Data.SqlClient;
using System.IO;
using LMT.BusinessLogic;

namespace LMT.MasterPages
{
    public partial class AdminMenuboard : System.Web.UI.Page
    {
        csGlobal globaldata = new csGlobal();
        string dataKeyCode = "StateID";
        DataSet dsFillData;
        int EditIndex = -1;
        Hashtable Keys_2
        {
            get
            {
                if (ViewState["Keys"] == null)
                    ViewState["Keys"] = new Hashtable();
                return (Hashtable)ViewState["Keys"];
            }
        }
        csLeads objLeads = new csLeads();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

            }
        }

        #region NL
        protected void lnkNL_Click(object sender, EventArgs e)
        {
            dvEW.Visible = false;
            dvNL.Visible = true;
            dvInP.Visible = false;
            dvCL.Visible = false;
            BindNewLeads();
        }

        private void BindNewLeads()
        {

            string strQuery = "select Lead.Lead_ID,Lead.Customer_ID as UserID,Lead.Labour_ID,isnull(Convert(Varchar(10),Lead.Asign),'') as SuppilerID, " +
                "isnull(SD.SupplierCode,'')as SupplierCode, Convert(Varchar(10),Lead.Required_Date) as RequestDate,Lead.Ticket as RequestNumber, " +
                    " LR.FullName as LabourName,LR.Image_URL as LabourImageURL,LR.Labour_Code,LR.Wages as RatesPerDay, " +
                    " UR.UserName as UserName,LR.Ph_No as LabourPhone from tbl_Leads as Lead with(nolock)" +
                    " inner join tblUserRegistration UR with(nolock) on Lead.Customer_ID=UR.UserID " +
                    " inner join tbl_LabourRegistration LR with(nolock) on Lead.Labour_ID=LR.Reg_ID " +
                    " Left join tbl_SupplierDetail SD with(nolock) on Lead.Asign=SD.SupplierID " +
                    " where Lead.Status='NL' order by Lead.createddate desc ";
            csGlobalFunction.BindRepeater(ref rptLeadInformation, strQuery);
        }

        protected void rptLeadInformation_DataBinding(object sender, EventArgs e)
        {
            Keys_2.Clear();
        }
        protected void rptLeadInformation_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            //if (e.CommandName == "Edit")
            //{
            //    int RegID_Query = 0;
            //    RegID_Query = Convert.ToInt32(e.Item.FindControl("Reg_ID"));
            //    if (RegID_Query > 0)
            //        Response.Redirect("~/Supplier/RegisterLabour.aspx?ID=" + RegID_Query);
            //}

            switch (e.CommandName)
            {

                case "Delete":
                    //if (csGlobalFunction.CheckUserDelete())
                    DeleteData(e);
                    //else
                    //{
                    //    string strFnc = "Javascript:disableSubmit('Y','" + globalobject._deleteUserRcd + "');";
                    //    ScriptManager.RegisterStartupScript(this, this.GetType(), "ShowMsg", strFnc, true);
                    //}
                    break;
            }
        }
        protected void rptLeadInformation_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {

            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Button btnEdit = (Button)e.Item.FindControl("btnEdit");

                btnEdit.CommandName = "Edit";
                btnEdit.Attributes["onclick"] = string.Format("window.location = '{0}';", ResolveClientUrl(string.Format("~/MasterPages/NewLeads.aspx?ID={0}&Mode={1}", DataBinder.Eval(e.Item.DataItem, "Lead_ID"), "NL")));
                Keys_2.Add(e.Item.ItemIndex, DataBinder.Eval(e.Item.DataItem, "Lead_ID"));
                //Button btnEdit = (Button)e.Item.FindControl("btnEdit");
                //if (csGlobalFunction.CheckUserUpdate())
                //    btnEdit.Attributes["OnClick"] = string.Format("Javascript:EditRecord('../Supplier/RegisterLabour','Mode=" + globalobject._updateMode + "','ID={0}',780,900); return false", DataBinder.Eval(e.Item.DataItem, "Reg_ID"));
                //else
                //    btnEdit.Attributes["OnClick"] = string.Format("Javascript:EditRecord('../TransAdmission/Adm_StdAdd','Mode=" + globalobject._viewMode + "','ID={0}',780,900); return false", DataBinder.Eval(e.Item.DataItem, "StudentID"));
            }
        }
        private void DeleteData(RepeaterCommandEventArgs e)
        {
            try
            {
                objLeads.DeleteLeadInfo(e.CommandName, Convert.ToInt32(Keys_2[e.Item.ItemIndex]));
                BindNewLeads();
            }
            catch (SqlException ex)
            {
                string strFnc = "";
                strFnc = ex.Message;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "CatchMsg", "javascript:alert('" + strFnc + "');", true);
            }
        }

        #endregion

        #region IPL
        protected void lnkInp_Click(object sender, EventArgs e)
        {
            dvEW.Visible = false;
            dvNL.Visible = false;
            dvInP.Visible = true;
            dvCL.Visible = false;
            BindIPLeads();
        }

        private void BindIPLeads()
        {
            string strQuery = "select Lead_ID,Ticket,Labour_ID,tbl_Lbr_Type.Lbr_Type,tbl_SupplierDetail.FullName,tblUserRegistration.Username as Name,Convert(varchar(11),Required_Date,106) Required_Date,is_accepted,is_completed from tbl_Leads " +
                              "inner join tblUserRegistration on tbl_Leads.Customer_ID=tblUserRegistration.UserID " +
                              "inner join tbl_LabourRegistration on tbl_Leads.Labour_ID=tbl_LabourRegistration.Reg_ID " +
                              "inner join tbl_SupplierDetail on tbl_LabourRegistration.SupplierID=tbl_SupplierDetail.SupplierID " +
                              "inner join tbl_Lbr_Type on tbl_LabourRegistration.LabourType=tbl_Lbr_Type.Lbr_type_id " +
                              "Where Status='IP' "; //and Required_Date<=GETDATE()";
            csGlobalFunction.BindRepeater(ref rptIPLeads, strQuery);
        }

        protected void rptIPLeads_DataBinding(object sender, EventArgs e)
        {
            Keys_2.Clear();
        }
        protected void rptIPLeads_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            //if (e.CommandName == "Edit")
            //{
            //    int RegID_Query = 0;
            //    RegID_Query = Convert.ToInt32(e.Item.FindControl("Reg_ID"));
            //    if (RegID_Query > 0)
            //        Response.Redirect("~/Supplier/RegisterLabour.aspx?ID=" + RegID_Query);
            //}

            switch (e.CommandName)
            {

                case "Delete":
                    //if (csGlobalFunction.CheckUserDelete())
                    DeletePLData(e);
                    //else
                    //{
                    //    string strFnc = "Javascript:disableSubmit('Y','" + globalobject._deleteUserRcd + "');";
                    //    ScriptManager.RegisterStartupScript(this, this.GetType(), "ShowMsg", strFnc, true);
                    //}
                    break;
            }
        }
        protected void rptIPLeads_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {

            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Button btnEdit = (Button)e.Item.FindControl("btnEdit");

                btnEdit.CommandName = "Edit";
                btnEdit.Attributes["onclick"] = string.Format("window.location = '{0}';", ResolveClientUrl(string.Format("~/MasterPages/NewLeads.aspx?ID={0}&Mode={1}", DataBinder.Eval(e.Item.DataItem, "Lead_ID"), "IP")));
                Keys_2.Add(e.Item.ItemIndex, DataBinder.Eval(e.Item.DataItem, "Lead_ID"));
                //Button btnEdit = (Button)e.Item.FindControl("btnEdit");
                //if (csGlobalFunction.CheckUserUpdate())
                //    btnEdit.Attributes["OnClick"] = string.Format("Javascript:EditRecord('../Supplier/RegisterLabour','Mode=" + globalobject._updateMode + "','ID={0}',780,900); return false", DataBinder.Eval(e.Item.DataItem, "Reg_ID"));
                //else
                //    btnEdit.Attributes["OnClick"] = string.Format("Javascript:EditRecord('../TransAdmission/Adm_StdAdd','Mode=" + globalobject._viewMode + "','ID={0}',780,900); return false", DataBinder.Eval(e.Item.DataItem, "StudentID"));
            }
        }
        private void DeletePLData(RepeaterCommandEventArgs e)
        {
            try
            {
                objLeads.DeleteLeadInfo(e.CommandName, Convert.ToInt32(Keys_2[e.Item.ItemIndex]));
                BindNewLeads();
            }
            catch (SqlException ex)
            {
                string strFnc = "";
                strFnc = ex.Message;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "CatchMsg", "javascript:alert('" + strFnc + "');", true);
            }
        }

        #endregion

        #region CL

        protected void lnkCL_Click(object sender, EventArgs e)
        {
            dvEW.Visible = false;
            dvNL.Visible = false;
            dvInP.Visible = false;
            dvCL.Visible = true;
            BindClosedLeads();
        }

        private void BindClosedLeads()
        {
            string strQuery = "select Lead_ID,Ticket,Labour_ID,tbl_Lbr_Type.Lbr_Type,tbl_SupplierDetail.FullName+' / '+tbl_LabourRegistration.FullName as FullName,tblUserRegistration.UserName as name,Convert(varchar(11),Required_Date,106) Required_Date,is_completed from tbl_Leads " +
                              "inner join tblUserRegistration on tbl_Leads.Customer_ID=tblUserRegistration.UserID  " +
                              "inner join tbl_LabourRegistration on tbl_Leads.Labour_ID=tbl_LabourRegistration.Reg_ID " +
                              "inner join tbl_SupplierDetail on tbl_LabourRegistration.SupplierID=tbl_SupplierDetail.SupplierID " +
                              "inner join tbl_Lbr_Type on tbl_LabourRegistration.LabourType=tbl_Lbr_Type.Lbr_type_id " +
                              "Where Status='CL' ";//or Required_Date<GETDATE()";
            csGlobalFunction.BindRepeater(ref rptClosedLeads, strQuery);
        }
        #endregion
    }
}