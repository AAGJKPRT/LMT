using System;
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
    public partial class MenuBoard : System.Web.UI.Page
    {
        csGlobal globaldata = new csGlobal();
        csExpenses objExp = new csExpenses();
        csPaymentRecieve objPR = new csPaymentRecieve();
        csPaymentMade objPMT = new csPaymentMade();
        string dataKeyCode = "StateID";
        DataSet dsFillData;
        int EditIndex = -1;
        Hashtable Keys
        {
            get
            {
                if (ViewState["Keys"] == null)
                    ViewState["Keys"] = new Hashtable();
                return (Hashtable)ViewState["Keys"];
            }
        }

        Hashtable Keys_2
        {
            get
            {
                if (ViewState["Keys"] == null)
                    ViewState["Keys"] = new Hashtable();
                return (Hashtable)ViewState["Keys"];
            }
        }
        Hashtable Keys_3
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
            try
            {
                if (!IsPostBack)
                {

                }
                string Str = "Update tbl_Leads set status='CL' where Status='NL' and Required_Date<GETDATE()";
                CrystalConnection.DoCommandWithoutTransaction(Str);
            }
            catch (Exception ex)
            {
                string strFnc = "";
                strFnc = ex.Message;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "CatchMsg", "javascript:AlertMsg('" + strFnc + "');", true);
            }
            
        }

        #region NL
        protected void lnkNL_Click(object sender, EventArgs e)
        {
            dvEW.Visible = false;
            dvNL.Visible = true;
            dvInP.Visible = false;
            dvCL.Visible = false;
            divTL.Visible = false;
            dvExp.Visible = false;
            dvPayR.Visible = false;
            dvPayM.Visible = false;
            BindNewLeads();
        }

        private void BindNewLeads()
        {

            string strQuery = "select Lead_ID,Labour_ID,tbl_Lbr_Type.Lbr_Type,Name,convert(varchar,(CONVERT(date,Required_Date,103)),103) as Required_Date from tbl_Leads " +
                              "inner join tbl_Customer on tbl_Leads.Customer_ID=tbl_Customer.Customer_ID " +
                              "inner join tbl_LabourRegistration on tbl_Leads.Labour_ID=tbl_LabourRegistration.Reg_ID " +
                              "inner join tbl_Lbr_Type on tbl_LabourRegistration.LabourType=tbl_Lbr_Type.Lbr_type_id " +
                              "Where Status='NL' and Required_Date>GETDATE()";
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
                btnEdit.Attributes["onclick"] = string.Format("window.location = '{0}';", ResolveClientUrl(string.Format("~/MasterPages/NewLeads.aspx?ID={0}&Mode={1}",DataBinder.Eval(e.Item.DataItem, "Lead_ID"), "NL")));
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
                ScriptManager.RegisterStartupScript(this, this.GetType(), "CatchMsg", "javascript:AlertMsg('" + strFnc + "');", true);
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
            divTL.Visible = false;
            dvExp.Visible = false;
            dvPayR.Visible = false;
            dvPayM.Visible = false;
            BindIPLeads();
        }

        private void BindIPLeads()
        {
            string strQuery = "select Lead_ID,Labour_ID,tbl_Lbr_Type.Lbr_Type,tbl_SupplierDetail.FullName,Name,convert(varchar,(CONVERT(date,Required_Date,103)),103) as Required_Date from tbl_Leads " +
                              "inner join tbl_Customer on tbl_Leads.Customer_ID=tbl_Customer.Customer_ID " +
                              "inner join tbl_LabourRegistration on tbl_Leads.Labour_ID=tbl_LabourRegistration.Reg_ID " +
                              "inner join tbl_SupplierDetail on tbl_LabourRegistration.SupplierID=tbl_SupplierDetail.SupplierID " +
                              "inner join tbl_Lbr_Type on tbl_LabourRegistration.LabourType=tbl_Lbr_Type.Lbr_type_id " +
                              "Where Status='IP' and Required_Date>GETDATE()";
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
                ScriptManager.RegisterStartupScript(this, this.GetType(), "CatchMsg", "javascript:AlertMsg('" + strFnc + "');", true);
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
            divTL.Visible = false;
            dvExp.Visible = false;
            dvPayR.Visible = false;
            dvPayM.Visible = false;
            BindClosedLeads();
        }

        private void BindClosedLeads()
        {
            string strQuery = "select Lead_ID,Labour_ID,tbl_Lbr_Type.Lbr_Type,tbl_SupplierDetail.FullName,Name,convert(varchar,(CONVERT(date,Required_Date,103)),103) as Required_Date from tbl_Leads " +
                              "inner join tbl_Customer on tbl_Leads.Customer_ID=tbl_Customer.Customer_ID " +
                              "inner join tbl_LabourRegistration on tbl_Leads.Labour_ID=tbl_LabourRegistration.Reg_ID " +
                              "inner join tbl_SupplierDetail on tbl_LabourRegistration.SupplierID=tbl_SupplierDetail.SupplierID " +
                              "inner join tbl_Lbr_Type on tbl_LabourRegistration.LabourType=tbl_Lbr_Type.Lbr_type_id " +
                              "Where Status='CL' or Required_Date<GETDATE()";
            csGlobalFunction.BindRepeater(ref rptClosedLeads, strQuery);
        }
        #endregion

        #region Expense

        protected void lnkExpenses_Click(object sender, EventArgs e)
        {
            dvEW.Visible = false;
            dvNL.Visible = false;
            dvInP.Visible = false;
            dvCL.Visible = false;
            divTL.Visible = false;
            dvExp.Visible = true;
            dvPayR.Visible = false;
            dvPayM.Visible = false;
            hfOpModeExp.Value = "INSERT";
            hfExpID.Value = "0";
            BindExpenses();
        }

        private void BindExpenses()
        {
            string Str = "Select Exp_ID,convert(varchar,(CONVERT(date,Exp_Date,103)),103) as Exp_Date,Exp_Type,Exp_Amount,Exp_ToWhome,Exp_Under from tbl_Expenses";
            csGlobalFunction.BindRepeater(ref rptExpense, Str);
        }

        protected void btnAddExpense_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "LaunchServerSide", "$(function() { AddExpForm(); });", true);
        }

        protected void btn_Save_Click(object sender, EventArgs e)
        {
            if (ValidateExpData())
            {
                Set_Exp_Properties(Convert.ToInt32(hfExpID.Value));
                objExp.SaveData(hfOpModeExp.Value);
                BindExpenses();
                ClearExpControls();
            }
        }

        private void Set_Exp_Properties(int ExpID)
        {
            objExp.Exp_id = ExpID;
            objExp.Exp_date = Convert.ToDateTime(txtExpDate.Text, System.Globalization.CultureInfo.GetCultureInfo("hi-IN").DateTimeFormat); //txtExpDate.Text;
            objExp.Exp_type = txtExpenseType.Text;
            objExp.Exp_amount = txtExpAmount.Text;
            objExp.Exp_towhome = txtWhome.Text;
            objExp.Exp_under = txtCUH.Text;
            
        }

        protected void rptExpense_DataBinding(object sender, EventArgs e)
        {
            Keys_2.Clear();
        }
        protected void rptExpense_ItemCommand(object source, RepeaterCommandEventArgs e)
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
                    DeleteExpData(e);
                    break;
                case "Edit":
                    Edit_Exp(e);
                    break;

            }
        }
        protected void rptExpense_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {

            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Button btnEdit = (Button)e.Item.FindControl("btnEdit");

                btnEdit.CommandName = "Edit";
                //btnEdit.Attributes["onclick"] = string.Format("window.location = '{0}';", ResolveClientUrl(string.Format("~/MasterPages/NewLeads.aspx?ID={0}", DataBinder.Eval(e.Item.DataItem, "Exp_ID"))));
                Keys_2.Add(e.Item.ItemIndex, DataBinder.Eval(e.Item.DataItem, "Exp_ID"));
                //Button btnEdit = (Button)e.Item.FindControl("btnEdit");
                //if (csGlobalFunction.CheckUserUpdate())
                //    btnEdit.Attributes["OnClick"] = string.Format("Javascript:EditRecord('../Supplier/RegisterLabour','Mode=" + globalobject._updateMode + "','ID={0}',780,900); return false", DataBinder.Eval(e.Item.DataItem, "Reg_ID"));
                //else
                //    btnEdit.Attributes["OnClick"] = string.Format("Javascript:EditRecord('../TransAdmission/Adm_StdAdd','Mode=" + globalobject._viewMode + "','ID={0}',780,900); return false", DataBinder.Eval(e.Item.DataItem, "StudentID"));
            }
        }

        private void DeleteExpData(RepeaterCommandEventArgs e)
        {
            try
            {
                objExp.DeleteExp(e.CommandName, Convert.ToInt32(Keys_2[e.Item.ItemIndex]));
                BindExpenses();
            }
            catch (SqlException ex)
            {
                string strFnc = "";
                strFnc = ex.Message;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "CatchMsg", "javascript:AlertMsg('" + strFnc + "');", true);
            }
        }

        private void Edit_Exp(RepeaterCommandEventArgs e)
        {
            try
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "LaunchServerSide", "$(function() { AddExpForm(); });", true);
                string Str = "Select Exp_ID,convert(varchar,(CONVERT(date,Exp_Date,103)),103) as Exp_Date,Exp_Type,Exp_Amount,Exp_ToWhome,Exp_Under from tbl_Expenses where Exp_ID=" + Convert.ToInt32(Keys_2[e.Item.ItemIndex]) + "";
                DataTable Expenses = csExpenses.FillDataTable(Str);//csLabourRegistration.FillDataTable(strQuery);
                if (Expenses.Rows.Count > 0)
                {
                    DataRow Dr = Expenses.Rows[0];
                    hfExpID.Value = Convert.ToString(Dr["Exp_ID"]);
                    txtExpDate.Text = Convert.ToString(Dr["Exp_Date"]);
                    txtExpenseType.Text = Convert.ToString(Dr["Exp_Type"]);
                    txtExpAmount.Text = Convert.ToString(Dr["Exp_Amount"]);
                    txtWhome.Text = Convert.ToString(Dr["Exp_ToWhome"]);
                    txtCUH.Text = Convert.ToString(Dr["Exp_Under"]);
                    hfOpModeExp.Value = "UPDATE";
                }
            }
            catch (Exception ex)
            {
                string strFnc = "";
                strFnc = ex.Message;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "CatchMsg", "javascript:AlertMsg('" + strFnc + "');", true);
            }
        }
        private bool ValidateExpData()
        {
            if (txtExpDate.Text == "")
            {
                txtExpDate.Focus();
                return false;
            }
            if (txtExpenseType.Text.Trim() == "")
            {
                txtExpenseType.Focus();
                return false;
            }
            if (txtExpAmount.Text.Trim() == "")
            {
                txtExpAmount.Focus();
                return false;
            }
            if (txtWhome.Text.Trim() == "")
            {
                txtWhome.Focus();
                return false;
            }
            if (txtCUH.Text.Trim() == "")
            {
                txtCUH.Focus();
                return false;
            }
            return true;
        }

        private void ClearExpControls()
        {
            txtExpDate.Text = "";
            txtExpenseType.Text = "";
            txtExpAmount.Text = "";
            txtWhome.Text = "";
            txtCUH.Text = "";
            hfOpModeExp.Value = "INSERT";
            hfExpID.Value = "0";
        }

        #endregion

        # region Payment Recieve

        protected void lnkPaymentRecieve_Click(object sender, EventArgs e)
        {
            dvEW.Visible = false;
            dvNL.Visible = false;
            dvInP.Visible = false;
            dvCL.Visible = false;
            divTL.Visible = false;
            dvExp.Visible = false;
            dvPayR.Visible = true;
            dvPayM.Visible = false;
            hfOpModePR.Value = "INSERT";
            hfPRID.Value = "0";
            BindPRRepeater();
        }

        protected void btnSavePayRecieve_Click(object sender, EventArgs e)
        {
            if (ValidatePR())
            {
                Set_PR_Properties(Convert.ToInt32(hfPRID.Value));
                objPR.SaveData(hfOpModePR.Value); //objExp.SaveData();
                BindPRRepeater();
                ClearPRControls();
            }
        }

        private void BindPRRepeater()
        {
            string Str = "Select PR_ID,Particulars,Amount,convert(varchar,(CONVERT(date,Date,103)),103) as Date,Purpose from tbl_PR";
            csGlobalFunction.BindRepeater(ref rpt_PR, Str);
        }

        protected void rpt_PR_DataBinding(object sender, EventArgs e)
        {
            Keys_2.Clear();
        }
        protected void rpt_PR_ItemCommand(object source, RepeaterCommandEventArgs e)
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
                    DeletePRData(e);
                    break;
                case "Edit":
                    Edit_PR(e);
                    break;

            }
        }
        protected void rpt_PR_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {

            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Button btnEditPR = (Button)e.Item.FindControl("btnEditPR");

                btnEditPR.CommandName = "Edit";
                //btnEdit.Attributes["onclick"] = string.Format("window.location = '{0}';", ResolveClientUrl(string.Format("~/MasterPages/NewLeads.aspx?ID={0}", DataBinder.Eval(e.Item.DataItem, "Exp_ID"))));
                Keys_2.Add(e.Item.ItemIndex, DataBinder.Eval(e.Item.DataItem, "PR_ID"));
                //Button btnEdit = (Button)e.Item.FindControl("btnEdit");
                //if (csGlobalFunction.CheckUserUpdate())
                //    btnEdit.Attributes["OnClick"] = string.Format("Javascript:EditRecord('../Supplier/RegisterLabour','Mode=" + globalobject._updateMode + "','ID={0}',780,900); return false", DataBinder.Eval(e.Item.DataItem, "Reg_ID"));
                //else
                //    btnEdit.Attributes["OnClick"] = string.Format("Javascript:EditRecord('../TransAdmission/Adm_StdAdd','Mode=" + globalobject._viewMode + "','ID={0}',780,900); return false", DataBinder.Eval(e.Item.DataItem, "StudentID"));
            }
        }

        private void DeletePRData(RepeaterCommandEventArgs e)
        {
            try
            {
                objPR.DeletePR(e.CommandName, Convert.ToInt32(Keys_2[e.Item.ItemIndex]));
                BindPRRepeater();
            }
            catch (SqlException ex)
            {
                string strFnc = "";
                strFnc = ex.Message;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "CatchMsg", "javascript:AlertMsg('" + strFnc + "');", true);
            }
        }

        private void Edit_PR(RepeaterCommandEventArgs e)
        {
            try
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "LaunchServerSide", "$(function() { AddPayRecieveForm(); });", true);
                //Select PR_ID,Particulars,Amount,convert(varchar,(CONVERT(date,Date,103)),103) as Date,Purpose from tbl_PR
                string Str = "Select PR_ID,Particulars,Amount,convert(varchar,(CONVERT(date,Date,103)),103) as Date,Purpose from tbl_PR where PR_ID=" + Convert.ToInt32(Keys_2[e.Item.ItemIndex]) + "";
                DataTable Expenses = csExpenses.FillDataTable(Str);//csLabourRegistration.FillDataTable(strQuery);
                if (Expenses.Rows.Count > 0)
                {
                    DataRow Dr = Expenses.Rows[0];
                    hfPRID.Value = Convert.ToString(Dr["PR_ID"]);
                    txtPayRDate.Text = Convert.ToString(Dr["Date"]);
                    txtPayRPart.Text = Convert.ToString(Dr["Particulars"]);
                    txtPayRAmt.Text = Convert.ToString(Dr["Amount"]);
                    txtPayRPur.Text = Convert.ToString(Dr["Purpose"]);
                    hfOpModePR.Value = "UPDATE";
                }
            }
            catch (Exception ex)
            {
                string strFnc = "";
                strFnc = ex.Message;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "CatchMsg", "javascript:AlertMsg('" + strFnc + "');", true);
            }
        }


        private void Set_PR_Properties(int PR_ID)
        {
            objPR.Pr_id = PR_ID;
            objPR.Particulars = txtPayRPart.Text.Trim(); //Convert.ToDateTime(txtExpDate.Text, System.Globalization.CultureInfo.GetCultureInfo("hi-IN").DateTimeFormat); //txtExpDate.Text;
            objPR.Amount = Convert.ToDecimal(txtPayRAmt.Text.Trim());
            objPR.Date = Convert.ToDateTime(txtPayRDate.Text, System.Globalization.CultureInfo.GetCultureInfo("hi-IN").DateTimeFormat);
            objPR.Purpose = txtPayRPur.Text;
        }

        private bool ValidatePR()
        {
            if (txtPayRPart.Text.Trim() == "")
            {
                txtPayRPart.Focus();
                return false;
            }
            if (txtPayRAmt.Text.Trim() == "")
            {
                txtPayRAmt.Focus();
                return false;
            }
            if (txtPayRDate.Text == "")
            {
                txtPayRDate.Focus();
                return false;
            }
            return true;
        }

        protected void btnAddPayRecieve_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "LaunchServerSide", "$(function() { AddPayRecieveForm(); });", true);
        }

        private void ClearPRControls()
        {
            txtPayRDate.Text = "";
            txtPayRPart.Text = "";
            txtPayRAmt.Text = "";
            txtPayRPur.Text = "";
            hfOpModePR.Value = "INSERT";
            hfPRID.Value = "0";
        }

        # endregion

        # region Payment Made

        protected void lnkPaymentMade_Click(object sender, EventArgs e)
        {
            dvEW.Visible = false;
            dvNL.Visible = false;
            dvInP.Visible = false;
            dvCL.Visible = false;
            divTL.Visible = false;
            dvExp.Visible = false;
            dvPayR.Visible = false;
            dvPayM.Visible = true;
            hfOpModePMT.Value = "INSERT";
            hfPMTID.Value = "0";
            BindPMTRepeater();
        }

        protected void btnSavePayMade_Click(object sender, EventArgs e)
        {
            if (ValidatePMT())
            {
                Set_PMT_Properties(Convert.ToInt32(hfPMTID.Value));
                objPMT.SaveData(hfOpModePMT.Value); //objExp.SaveData();
                BindPMTRepeater();
                ClearPMTControls();
            }
        }

        private void BindPMTRepeater()
        {
            string Str = "Select PMT_ID,Particulars,Amount,convert(varchar,(CONVERT(date,Date,103)),103) as Date,Purpose from tbl_PMT";
            csGlobalFunction.BindRepeater(ref rptPMT, Str);
        }

        protected void rptPMT_DataBinding(object sender, EventArgs e)
        {
            Keys_3.Clear();
        }
        protected void rptPMT_ItemCommand(object source, RepeaterCommandEventArgs e)
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
                    DeletePMTData(e);
                    break;
                case "Edit":
                    Edit_PMT(e);
                    break;

            }
        }
        protected void rptPMT_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {

            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Button btnEditPMT = (Button)e.Item.FindControl("btnEditPMT");

                btnEditPMT.CommandName = "Edit";
                //btnEdit.Attributes["onclick"] = string.Format("window.location = '{0}';", ResolveClientUrl(string.Format("~/MasterPages/NewLeads.aspx?ID={0}", DataBinder.Eval(e.Item.DataItem, "Exp_ID"))));
                Keys_3.Add(e.Item.ItemIndex, DataBinder.Eval(e.Item.DataItem, "PMT_ID"));
                //Button btnEdit = (Button)e.Item.FindControl("btnEdit");
                //if (csGlobalFunction.CheckUserUpdate())
                //    btnEdit.Attributes["OnClick"] = string.Format("Javascript:EditRecord('../Supplier/RegisterLabour','Mode=" + globalobject._updateMode + "','ID={0}',780,900); return false", DataBinder.Eval(e.Item.DataItem, "Reg_ID"));
                //else
                //    btnEdit.Attributes["OnClick"] = string.Format("Javascript:EditRecord('../TransAdmission/Adm_StdAdd','Mode=" + globalobject._viewMode + "','ID={0}',780,900); return false", DataBinder.Eval(e.Item.DataItem, "StudentID"));
            }
        }

        private void DeletePMTData(RepeaterCommandEventArgs e)
        {
            try
            {
                objPMT.DeletePMT(e.CommandName, Convert.ToInt32(Keys_3[e.Item.ItemIndex]));
                BindPMTRepeater();
            }
            catch (SqlException ex)
            {
                string strFnc = "";
                strFnc = ex.Message;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "CatchMsg", "javascript:AlertMsg('" + strFnc + "');", true);
            }
        }

        private void Edit_PMT(RepeaterCommandEventArgs e)
        {
            try
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "LaunchServerSide", "$(function() { AddPayMadeForm(); });", true);
                //Select PR_ID,Particulars,Amount,convert(varchar,(CONVERT(date,Date,103)),103) as Date,Purpose from tbl_PR
                string Str = "Select PMT_ID,Particulars,Amount,convert(varchar,(CONVERT(date,Date,103)),103) as Date,Purpose from tbl_PMT where PMT_ID=" + Convert.ToInt32(Keys_3[e.Item.ItemIndex]) + "";
                DataTable Expenses = csExpenses.FillDataTable(Str);//csLabourRegistration.FillDataTable(strQuery);
                if (Expenses.Rows.Count > 0)
                {
                    DataRow Dr = Expenses.Rows[0];
                    hfPMTID.Value = Convert.ToString(Dr["PMT_ID"]);
                    txtPayMDate.Text = Convert.ToString(Dr["Date"]);
                    txtPayMpart.Text = Convert.ToString(Dr["Particulars"]);
                    txtPayMAmt.Text = Convert.ToString(Dr["Amount"]);
                    txtPayMPur.Text = Convert.ToString(Dr["Purpose"]);
                    hfOpModePMT.Value = "UPDATE";
                }
            }
            catch (Exception ex)
            {
                string strFnc = "";
                strFnc = ex.Message;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "CatchMsg", "javascript:AlertMsg('" + strFnc + "');", true);
            }
        }


        private void Set_PMT_Properties(int PMT_ID)
        {
            objPMT.Pmt_id = PMT_ID;
            objPMT.Particulars = txtPayMpart.Text.Trim(); //Convert.ToDateTime(txtExpDate.Text, System.Globalization.CultureInfo.GetCultureInfo("hi-IN").DateTimeFormat); //txtExpDate.Text;
            objPMT.Amount = Convert.ToDecimal(txtPayMAmt.Text.Trim());
            objPMT.Date = Convert.ToDateTime(txtPayMDate.Text, System.Globalization.CultureInfo.GetCultureInfo("hi-IN").DateTimeFormat);
            objPMT.Purpose = txtPayMPur.Text;
        }

        private bool ValidatePMT()
        {
            if (txtPayMpart.Text.Trim() == "")
            {
                txtPayMpart.Focus();
                return false;
            }
            if (txtPayMAmt.Text.Trim() == "")
            {
                txtPayMAmt.Focus();
                return false;
            }
            if (txtPayMDate.Text == "")
            {
                txtPayMDate.Focus();
                return false;
            }
            return true;
        }

        private void ClearPMTControls()
        {
            txtPayMDate.Text = "";
            txtPayMpart.Text = "";
            txtPayMAmt.Text = "";
            txtPayMPur.Text = "";
            hfOpModePMT.Value = "INSERT";
            hfPMTID.Value = "0";
        }


        protected void btnAddPayMade_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "LaunchServerSide", "$(function() { AddPayMadeForm(); });", true);
        }

        # endregion

        #region TL

        protected void lnkTransferLeads_Click(object sender, EventArgs e)
        {
            dvEW.Visible = false;
            dvNL.Visible = false;
            dvInP.Visible = false;
            dvCL.Visible = false;
            divTL.Visible = true;
            dvExp.Visible = false;
            dvPayR.Visible = false;
            dvPayM.Visible = false;
            //BindTransferLeadsPerDay();
            rbtnPerDay.Checked = true;
        }

        private void BindTransferLeadsPerDay()
        {

            string strQuery = "select Asign,FullName,COUNT(Lead_ID) as NoOfLeads from tbl_Leads " +
                              " Inner Join tbl_SupplierDetail on tbl_Leads.Asign=tbl_SupplierDetail.SupplierID " +
                              " Where CAST(CurrentDate as Date)=CAST(GETDATE() as date)" +
                              " Group by FullName,Asign";
            csGlobalFunction.BindRepeater(ref rptTransferLeads, strQuery);
        }

        protected void rptTransferLeads_DataBinding(object sender, EventArgs e)
        {
            Keys.Clear();
        }
        protected void rptTransferLeads_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            //if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            //{
            //    LinkButton lnkSupplierName = (LinkButton)e.Item.FindControl("lnkSupplierName");
            //    Keys_2.Add(e.Item.ItemIndex, DataBinder.Eval(e.Item.DataItem, "Customer_ID"));
            //}
            //if (e.CommandName == "Edit")
            //{
            //    int RegID_Query = 0;
            //    RegID_Query = Convert.ToInt32(e.Item.FindControl("Reg_ID"));
            //    if (RegID_Query > 0)
            //        Response.Redirect("~/Supplier/RegisterLabour.aspx?ID=" + RegID_Query);
            //}

            switch (e.CommandName)
            {

                case "View":
                    //if (csGlobalFunction.CheckUserDelete())
                    View_Leads(e);
                    //else
                    //{
                    //    string strFnc = "Javascript:disableSubmit('Y','" + globalobject._deleteUserRcd + "');";
                    //    ScriptManager.RegisterStartupScript(this, this.GetType(), "ShowMsg", strFnc, true);
                    //}
                    break;
            }
        }

        private void View_Leads(RepeaterCommandEventArgs e)
        {
            try
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "LaunchServerSide", "$(function() { LoginPass(); });", true);
                ShowSupplierLeads(Convert.ToInt32(Keys[e.Item.ItemIndex]));
            }
            catch (Exception ex)
            {
                string strFnc = "";
                strFnc = ex.Message;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "CatchMsg", "javascript:AlertMsg('" + strFnc + "');", true);
            }
        }

        protected void rptTransferLeads_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {

            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                LinkButton lnkSupplierName = (LinkButton)e.Item.FindControl("lnkSupplierName");

                lnkSupplierName.CommandName = "View";
                Keys.Add(e.Item.ItemIndex, DataBinder.Eval(e.Item.DataItem, "Asign"));
                //lnkSupplierName.Attributes["onclick"] = string.Format(ScriptManager.RegisterStartupScript(this, this.GetType(), "LaunchServerSide", "$(function() { LoginPass(); });", true));

                //lnkSupplierName.Attributes["onclick"] = string.Format("window.location = '{0}';", ResolveClientUrl(string.Format("~/MasterPages/NewLeads.aspx?ID={0}&Mode={1}", DataBinder.Eval(e.Item.DataItem, "Lead_ID"), "NL")));

                //Button btnEdit = (Button)e.Item.FindControl("btnEdit");
                //if (csGlobalFunction.CheckUserUpdate())
                //    btnEdit.Attributes["OnClick"] = string.Format("Javascript:EditRecord('../Supplier/RegisterLabour','Mode=" + globalobject._updateMode + "','ID={0}',780,900); return false", DataBinder.Eval(e.Item.DataItem, "Reg_ID"));
                //else
                //    btnEdit.Attributes["OnClick"] = string.Format("Javascript:EditRecord('../TransAdmission/Adm_StdAdd','Mode=" + globalobject._viewMode + "','ID={0}',780,900); return false", DataBinder.Eval(e.Item.DataItem, "StudentID"));
            }
        }


        protected void rbtnPerDay_CheckedChanged(object sender, EventArgs e)
        {
            BindTransferLeadsPerDay();
        }

        protected void rbtnWeekly_CheckedChanged(object sender, EventArgs e)
        {
            BindTransferLeadsWeekly();
        }

        private void BindTransferLeadsWeekly()
        {
            string strQuery = "select Asign,FullName,COUNT(Lead_ID) as NoOfLeads from tbl_Leads " +
                              " Inner Join tbl_SupplierDetail on tbl_Leads.Asign=tbl_SupplierDetail.SupplierID " +
                              " Where Datepart(wk,CurrentDate)=Datepart(wk,GETDATE())" +
                              " Group by FullName,Asign";
            csGlobalFunction.BindRepeater(ref rptTransferLeads, strQuery);
        }

        protected void rbtnMonthly_CheckedChanged(object sender, EventArgs e)
        {
            string strQuery = "select Asign,FullName,COUNT(Lead_ID) as NoOfLeads from tbl_Leads " +
                              " Inner Join tbl_SupplierDetail on tbl_Leads.Asign=tbl_SupplierDetail.SupplierID " +
                              " Where Datepart(MM,CurrentDate)=Datepart(MM,GETDATE())" +
                              " Group by FullName,Asign";
            csGlobalFunction.BindRepeater(ref rptTransferLeads, strQuery);
        }

        private void ShowSupplierLeads(int SupplierID)
        {
            string Str = "";
            if (rbtnPerDay.Checked == true)
            {
                Str = "Select Lead_ID,tbl_LabourRegistration.FullName as Labour,tbl_Customer.Name as Customer,convert(varchar,(CONVERT(date,Required_Date,103)),103) as Required_Date,Status from tbl_Leads " +
                             " Inner Join tbl_LabourRegistration on tbl_Leads.Labour_ID=tbl_LabourRegistration.Reg_ID " +
                             " Inner Join tbl_Customer on tbl_Leads.Customer_ID=tbl_Customer.Customer_ID " +
                             " Inner JOin tbl_SupplierDetail on tbl_Leads.Asign=tbl_SupplierDetail.SupplierID " +
                             " Where Asign=" + SupplierID + " and CAST(CurrentDate as Date)=CAST(GETDATE() as date)";
            }
            else if (rbtnWeekly.Checked == true)
            {
                Str = "Select Lead_ID,tbl_LabourRegistration.FullName as Labour,tbl_Customer.Name as Customer,convert(varchar,(CONVERT(date,Required_Date,103)),103) as Required_Date,Status from tbl_Leads " +
                             " Inner Join tbl_LabourRegistration on tbl_Leads.Labour_ID=tbl_LabourRegistration.Reg_ID " +
                             " Inner Join tbl_Customer on tbl_Leads.Customer_ID=tbl_Customer.Customer_ID " +
                             " Inner JOin tbl_SupplierDetail on tbl_Leads.Asign=tbl_SupplierDetail.SupplierID " +
                             " Where Asign=" + SupplierID + " and Datepart(wk,CurrentDate)=Datepart(wk,GETDATE())";
            }
            else
            {
                Str = "Select Lead_ID,tbl_LabourRegistration.FullName as Labour,tbl_Customer.Name as Customer,convert(varchar,(CONVERT(date,Required_Date,103)),103) as Required_Date,Status from tbl_Leads " +
                             " Inner Join tbl_LabourRegistration on tbl_Leads.Labour_ID=tbl_LabourRegistration.Reg_ID " +
                             " Inner Join tbl_Customer on tbl_Leads.Customer_ID=tbl_Customer.Customer_ID " +
                             " Inner JOin tbl_SupplierDetail on tbl_Leads.Asign=tbl_SupplierDetail.SupplierID " +
                             " Where Asign=" + SupplierID + " and Datepart(MM,CurrentDate)=Datepart(MM,GETDATE())";
            }
            csGlobalFunction.BindRepeater(ref rptSupplier_LeadsDtl, Str);
        }
        #endregion

    }
}