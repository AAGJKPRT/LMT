using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Collections;
using CrystalDatabase;
using LMT.ClassGlobal;

namespace LMT.MasterUC
{
    public partial class CityUC : System.Web.UI.UserControl
    {
        csGlobal globaldata = new csGlobal();
        int EditIndex = -1;
        DataSet dsFillData;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindRepeater();

            }
        }
        Hashtable Keys
        {
            get
            {
                if (ViewState["Keys"] == null)
                    ViewState["Keys"] = new Hashtable();
                return (Hashtable)ViewState["Keys"];
            }
        }
        protected void rptCity_OnItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Keys.Add(e.Item.ItemIndex, DataBinder.Eval(e.Item.DataItem, "CityID"));

                BindDropDownList("Select StateID,StateName From tblState", e);

                ((DropDownList)e.Item.FindControl("ddlState")).SelectedValue = DataBinder.Eval(e.Item.DataItem, "StateID").ToString();
                if (((LinkButton)e.Item.FindControl("lbtnInsert")).ID.ToString().Trim().ToUpper() == "lbtnInsert".ToUpper() && ((LinkButton)e.Item.FindControl("lbtnInsert")).Visible == true)
                    EditIndex = e.Item.ItemIndex;
                else
                    EditIndex = -1;
            }
        }
        private void BindDropDownList(string strQuery, RepeaterItemEventArgs e)
        {
            dsFillData = new DataSet();
            dsFillData = CrystalConnection.CreateDatasetWithoutTransaction(strQuery);
            ((DropDownList)e.Item.FindControl("ddlState")).DataSource = dsFillData.Tables[0].DefaultView;
            ((DropDownList)e.Item.FindControl("ddlState")).DataTextField = "StateName";
            ((DropDownList)e.Item.FindControl("ddlState")).DataValueField = "StateID";
            ((DropDownList)e.Item.FindControl("ddlState")).DataBind();
        }
        private void VisibleUnvisibleControl(bool value, RepeaterItem selectedRptItem)
        {
            ((Label)selectedRptItem.FindControl("lblCityName")).Visible = !value;
            ((TextBox)selectedRptItem.FindControl("txtCityName")).Visible = value;

            ((Label)selectedRptItem.FindControl("lblState")).Visible = !value;
            ((DropDownList)selectedRptItem.FindControl("ddlState")).Visible = value;

            ((Label)selectedRptItem.FindControl("lblCityCode")).Visible = !value;
            ((TextBox)selectedRptItem.FindControl("txtCityCode")).Visible = value;

            ((Label)selectedRptItem.FindControl("lblIsVerify")).Visible = !value;
            ((CheckBox)selectedRptItem.FindControl("chkIsVerify")).Visible = value;
            ((Button)selectedRptItem.FindControl("btnEdit")).Visible = !value;
            ((Button)selectedRptItem.FindControl("btnDelete")).Visible = !value;
            if (((LinkButton)selectedRptItem.FindControl("lbtnInsert")).Visible == true)
            {
                ((LinkButton)selectedRptItem.FindControl("lbtnUpdate")).Visible = !value;
                //((Button)selectedRptItem.FindControl("btnDelete")).Visible = !value;
                ((LinkButton)selectedRptItem.FindControl("lbtnCancel")).Visible = value;
            }
            else
            {
                ((LinkButton)selectedRptItem.FindControl("lbtnUpdate")).Visible = value;
                //((Button)selectedRptItem.FindControl("btnDelete")).Visible = value;
                ((LinkButton)selectedRptItem.FindControl("lbtnCancel")).Visible = value;
            }
        }
        protected void rptCity_OnDataBinding(object sender, EventArgs e)
        {
            Keys.Clear();
        }
        private void BindRepeater(string strAddRow = "", string strFilterExpression = "")
        {
            PagedDataSource objPageDataSource = csGlobalFunction.BindRepeaterWithPaging(ref rptCity, CurrentPage, srcCity.SelectCommand, strFilterExpression, strAddRow);
            CurrentPage = objPageDataSource.CurrentPageIndex;

            if (objPageDataSource.Count > 0)
            {
                //dispaly controls if there are pages
                lbtnPrev.Visible = true;
                lbtnNext.Visible = true;
                lblCurrentPage.Visible = true;
                lblCurrentPage.Text = "Page " +
                  Convert.ToString(CurrentPage + 1) + " of " +
                  Convert.ToString(objPageDataSource.PageCount);
            }
            else
            {
                //disable controls if there are no pages
                lbtnPrev.Visible = false;
                lbtnNext.Visible = false;
                lblCurrentPage.Visible = false;
            }
            lbtnPrev.Enabled = !objPageDataSource.IsFirstPage;
            lbtnNext.Enabled = !objPageDataSource.IsLastPage;
        }
        public int CurrentPage
        {
            get
            {
                // look for current page in ViewState
                object o = this.ViewState["_CurrentPage"];
                if (o == null)
                    return 0; // default page index of 0
                else
                    return (int)o;
            }

            set
            {
                this.ViewState["_CurrentPage"] = value;
            }
        }
        protected void rptCity_OnItemCommand(object source, RepeaterCommandEventArgs e)
        {
            switch (e.CommandName)
            {
                case "Edit":
                    //if (csGlobalFunction.CheckUserUpdate())
                    VisibleUnvisibleControl(true, e.Item);
                    //else
                    //{
                    //    string strFnc = "Javascript:disableSubmit('Y','" + globaldata._updateUserRcd + "');";
                    //    ScriptManager.RegisterStartupScript(this, this.GetType(), "ShowMsg", strFnc, true);
                    //}
                    break;
                case "Insert":
                    InsertCity(e);
                    break;
                case "Update":
                    UpdateCity(e);
                    break;
                case "Delete":
                     //if (csGlobalFunction.CheckUserDelete())
                     //{
                        DeleteCity(e);
                        VisibleUnvisibleControl(false, e.Item);
                    // }
                    //   else
                    //{
                    //    string strFnc = "Javascript:disableSubmit('Y','" + globaldata._deleteUserRcd + "');";
                    //    ScriptManager.RegisterStartupScript(this, this.GetType(), "ShowMsg", strFnc, true);
                    //}
                    break;
                case "Cancel":
                    BindRepeater();
                    //VisibleUnvisibleControl(false, e.Item);
                    break;
                case "Add":
                    //if (csGlobalFunction.CheckUserInsert())
                    AddNewRow();
                    //   else
                    //{
                    //    string strFnc = "Javascript:disableSubmit('Y','" + globaldata._insertUserRcd + "');";
                    //    ScriptManager.RegisterStartupScript(this, this.GetType(), "ShowMsg", strFnc, true);
                    //}
                    break;
            }
        }
        private bool ValidateData()
        {

            return true;
        }
        private void AddNewRow()
        {
            string strNew = "Declare @rowCount int Select @rowCount=isNull(Count(*),0)+1 From  tblCity" +
                " Select ROW_NUMBER() Over(order by CityName) Row,CityID,CityName,tblState.StateName State,tblCity.StateID,CityCode,tblCity.IsVerify" +
                " ,'True' UpdateMode,'False' InsertMode From tblCity Inner Join tblState On tblState.StateID=tblCity.StateID" +
                " Union Select @rowCount row,0 CityID,'' CityName,'' State,0 StateID,'' CityCode,'N' IsVerify,'False' UpdateMode,'True' InsertMode order by Row";
            srcCity.SelectCommand = strNew;
            //DataSourceSelectArguments args = new DataSourceSelectArguments();
            //srcCity.Select(args);
            BindRepeater("AddRow");
            if (EditIndex != -1)
            {
                RepeaterItem selectedRptItem = rptCity.Items[EditIndex];
                VisibleUnvisibleControl(true, selectedRptItem);
            }
        }
        private void InsertCity(RepeaterCommandEventArgs e)
        {
            TextBox txtCityName = (TextBox)e.Item.FindControl("txtCityName");
            CheckBox chkIsVerify = (CheckBox)e.Item.FindControl("chkIsVerify");
            DropDownList ddlState = (DropDownList)e.Item.FindControl("ddlState");
            TextBox txtCityCode = (TextBox)e.Item.FindControl("txtCityCode");
            if (ValidateData(txtCityName.Text.Trim(), e))
            {
                //Set Data Source OR Procedure Parameters
                srcCity.InsertParameters["opMode"].DefaultValue = e.CommandName;
                srcCity.InsertParameters["CityID"].DefaultValue = Keys[e.Item.ItemIndex].ToString();
                srcCity.InsertParameters["CityName"].DefaultValue = txtCityName.Text.Trim();
                srcCity.InsertParameters["StateID"].DefaultValue = ddlState.SelectedValue;
                srcCity.InsertParameters["CityCode"].DefaultValue = txtCityCode.Text.Trim();
                srcCity.InsertParameters["IsVerify"].DefaultValue = chkIsVerify.Checked ? "Y" : "N";
                srcCity.InsertParameters["UserID"].DefaultValue = "0";

                //Fire the insert Procedure
                srcCity.Insert();
                BindRepeater();

            }
        }
        private void UpdateCity(RepeaterCommandEventArgs e)
        {
            TextBox txtCityName = (TextBox)e.Item.FindControl("txtCityName");
            CheckBox chkIsVerify = (CheckBox)e.Item.FindControl("chkIsVerify");
            DropDownList ddlState = (DropDownList)e.Item.FindControl("ddlState");
            TextBox txtCityCode = (TextBox)e.Item.FindControl("txtCityCode");
            if (ValidateData(txtCityName.Text.Trim(), e))
            {
                //Set Data Source OR Procedure Parameters
                srcCity.UpdateParameters["opMode"].DefaultValue = e.CommandName;
                srcCity.UpdateParameters["CityID"].DefaultValue = Keys[e.Item.ItemIndex].ToString();
                srcCity.UpdateParameters["CityName"].DefaultValue = txtCityName.Text;
                srcCity.UpdateParameters["StateID"].DefaultValue = ddlState.SelectedValue;
                srcCity.UpdateParameters["CityCode"].DefaultValue = txtCityCode.Text.Trim();
                srcCity.UpdateParameters["IsVerify"].DefaultValue = chkIsVerify.Checked ? "Y" : "N";
                srcCity.UpdateParameters["UserID"].DefaultValue = "0";

                //Fire the Update Procedure
                srcCity.Update();
                BindRepeater();
                VisibleUnvisibleControl(false, e.Item);
            }
        }
        private void DeleteCity(RepeaterCommandEventArgs e)
        {
            try
            {
                //Set Data Source OR Procedure Parameters
                srcCity.DeleteParameters["opMode"].DefaultValue = e.CommandName;
                srcCity.DeleteParameters["CityID"].DefaultValue = Keys[e.Item.ItemIndex].ToString();
                srcCity.DeleteParameters["CityName"].DefaultValue = "";
                srcCity.DeleteParameters["StateID"].DefaultValue = "";
                srcCity.UpdateParameters["CityCode"].DefaultValue = "";
                srcCity.DeleteParameters["IsVerify"].DefaultValue = "";
                srcCity.DeleteParameters["UserID"].DefaultValue = "0";

                //Fire the Delete Procedure
                srcCity.Delete();
                BindRepeater();
            }
            catch (SqlException ex)
            {
                if (ex.Errors.Count > 0)
                {
                    switch (ex.Errors[0].Number)
                    {
                        case 547:
                            string strFnc = "Javascript:disableSubmit('Y','" + globaldata._deleteForeignUserRcd + "');";
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "ShowMsg", strFnc, true);
                            break;
                    }
                }
            }
        }
        public bool ValidateData(string strCity, RepeaterCommandEventArgs e)
        {
            string strQuery = "";
            if (strCity == "")
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "javascript:AlertMsg('City Name can not be left blank.');", true);
                return false;
            }
            else
            {
                if (e.CommandName.ToUpper() == "UPDATE")
                    strQuery = "Select Count(CityID) From tblCity Where CityID<>" + Convert.ToInt32(Keys[e.Item.ItemIndex]) + " And CityName='" + strCity + "'";
                else if (e.CommandName.ToUpper() == "INSERT")
                    strQuery = "Select Count(CityID) From tblCity Where CityName='" + strCity + "'";

                int cityID = (int)CrystalConnection.SqlScalartoObj(strQuery);

                if (cityID > 0)
                {

                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "javascript:AlertMsg('City Name already exist.');", true);
                    return false;
                }
            }

            return true;
        }
        protected void btnGo_Click(object sender, EventArgs e)
        {
            CurrentPage = 0;
            if (txtSearch.Text.Trim() != "")
                BindRepeater("", "CityName LIKE '" + txtSearch.Text + "*'");
        }
        protected void btnRefresh_Click(object sender, EventArgs e)
        {
            CurrentPage = 0;
            BindRepeater();
            txtSearch.Text = "";
        }
        protected void lbtnNext_Click(object sender, EventArgs e)
        {
            //go to next page
            CurrentPage += 1;

            if (txtSearch.Text.Trim() != "")
                BindRepeater("", "CityName LIKE '" + txtSearch.Text + "*'");
            else
                BindRepeater();
        }
        protected void lbtnPrev_Click(object sender, EventArgs e)
        {
            CurrentPage -= 1;

            if (txtSearch.Text.Trim() != "")
                BindRepeater("", "CityName LIKE '" + txtSearch.Text + "*'");
            else
                BindRepeater();

        }
    }
}
