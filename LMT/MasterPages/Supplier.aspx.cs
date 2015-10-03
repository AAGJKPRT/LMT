using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LMT.ClassGlobal;
using LMT.BusinessLogic;
using System.Collections;
using System.Data.SqlClient;

namespace LMT.MasterPages
{
    public partial class Supplier : System.Web.UI.Page
    {
        csGlobal globalobject = new csGlobal();
       // public delegate void MailDelegate(string delegateName);

        csDropDownFunction objdropdown = new csDropDownFunction();
        csSupplierDetail objLabour = new csSupplierDetail();
        Hashtable Keys
        {
            get
            {
                if (ViewState["Keys"] == null)
                    ViewState["Keys"] = new Hashtable();
                return (Hashtable)ViewState["Keys"];
            }
        }
        Hashtable Keys1
        {
            get
            {
                if (ViewState["Keys"] == null)
                    ViewState["Keys"] = new Hashtable();
                return (Hashtable)ViewState["Keys"];
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            BindSupplierRepeater();
        }

        private void BindSupplierRepeater()
        {
            string strQuery = "Select SupplierID,SupplierCode,FullName,Address,case when(Sup_City=0) then 'Not Selected' else CityName END as 'CityName'," +
                              " case when(Sup_State=0) then 'Not Selected' else StateName END as 'StateName',Sup_Mobile from tbl_SupplierDetail" +
                              " LEFT Join tblCity on tbl_SupplierDetail.Sup_City=tblCity.CityID" +
                              " LEFT Join tblState on tbl_SupplierDetail.Sup_State=tblState.StateID ";
            csGlobalFunction.BindRepeater(ref rptSupplierInformation, strQuery);
        }

        protected void rptSupplierInformation_DataBinding(object sender, EventArgs e)
        {
            Keys.Clear();
        }
        protected void rptSupplierInformation_ItemCommand(object source, RepeaterCommandEventArgs e)
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

                case "View":
                    BindLabourRepeater(e);
                    break;

            }
        }
        protected void rptSupplierInformation_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {

            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Button btnEdit = (Button)e.Item.FindControl("btnEdit");

                btnEdit.CommandName = "Edit";
                btnEdit.Attributes["onclick"] = string.Format("window.location = '{0}';", ResolveClientUrl(string.Format("~/MasterPages/EditSupProfile.aspx?ID={0}&NAME={1}", DataBinder.Eval(e.Item.DataItem, "SupplierID"), DataBinder.Eval(e.Item.DataItem, "FullName"))));
                Keys.Add(e.Item.ItemIndex, DataBinder.Eval(e.Item.DataItem, "SupplierID"));
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
                objLabour.DeleteLabInfo(e.CommandName, Convert.ToInt32(Keys[e.Item.ItemIndex]));
                
                BindSupplierRepeater();
            }
            catch (SqlException ex)
            {
                if (ex.Errors.Count > 0)
                {
                    switch (ex.Errors[0].Number)
                    {
                        case 547:
                            string strFnc = "Javascript:disableSubmit('Y','" + globalobject._deleteForeignUserRcd + "');";
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "ShowMsg", strFnc, true);
                            break;
                    }
                }
            }
        }

        protected void lbtnAdd_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/MasterPages/EditSupProfile.aspx");
        }

        private void BindLabourRepeater(RepeaterCommandEventArgs e)
        {
            string strQuery = " Select Reg_ID,Labour_Code,FullName,Ph_No,CityName,StateName From tbl_LabourRegistration" +
                              " Inner Join tblCity on tbl_LabourRegistration.CCity=tblCity.CityID" +
                              " Inner Join tblState on tbl_LabourRegistration.CState=tblState.StateID" +
                              " Where SupplierID=" + Convert.ToInt32(Keys[e.Item.ItemIndex]) + " ";
            csGlobalFunction.BindRepeater(ref rptLabourInformation, strQuery);
        }

        protected void rptLabourInformation_DataBinding(object sender, EventArgs e)
        {
            Keys1.Clear();
        }
        //protected void rptLabourInformation_ItemCommand(object source, RepeaterCommandEventArgs e)
        //{
        //    //if (e.CommandName == "Edit")
        //    //{
        //    //    int RegID_Query = 0;
        //    //    RegID_Query = Convert.ToInt32(e.Item.FindControl("Reg_ID"));
        //    //    if (RegID_Query > 0)
        //    //        Response.Redirect("~/Supplier/RegisterLabour.aspx?ID=" + RegID_Query);
        //    //}

        //    switch (e.CommandName)
        //    {

        //        case "Delete":
        //            //if (csGlobalFunction.CheckUserDelete())
        //            DeleteData(e);
        //            //else
        //            //{
        //            //    string strFnc = "Javascript:disableSubmit('Y','" + globalobject._deleteUserRcd + "');";
        //            //    ScriptManager.RegisterStartupScript(this, this.GetType(), "ShowMsg", strFnc, true);
        //            //}
        //            break;
        //    }
        //}
        protected void rptLabourInformation_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {

            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Button btnEdit = (Button)e.Item.FindControl("btnEdit");

                btnEdit.CommandName = "Edit";
                btnEdit.Attributes["onclick"] = string.Format("window.location = '{0}';", ResolveClientUrl(string.Format("~/MasterPages/EditLabProfile.aspx?ID={0}", DataBinder.Eval(e.Item.DataItem, "Reg_ID"))));
                Keys1.Add(e.Item.ItemIndex, DataBinder.Eval(e.Item.DataItem, "Reg_ID"));
                //Button btnEdit = (Button)e.Item.FindControl("btnEdit");
                //if (csGlobalFunction.CheckUserUpdate())
                //    btnEdit.Attributes["OnClick"] = string.Format("Javascript:EditRecord('../Supplier/RegisterLabour','Mode=" + globalobject._updateMode + "','ID={0}',780,900); return false", DataBinder.Eval(e.Item.DataItem, "Reg_ID"));
                //else
                //    btnEdit.Attributes["OnClick"] = string.Format("Javascript:EditRecord('../TransAdmission/Adm_StdAdd','Mode=" + globalobject._viewMode + "','ID={0}',780,900); return false", DataBinder.Eval(e.Item.DataItem, "StudentID"));
            }
        }

    }
}