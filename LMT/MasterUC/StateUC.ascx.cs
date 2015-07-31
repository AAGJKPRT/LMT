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

namespace LMT.MasterUC
{
    public partial class StateUC : System.Web.UI.UserControl
    {
        csGlobal globaldata = new csGlobal();
        string dataKeyCode = "StateID";
        DataSet dsFillData;
        int EditIndex = -1;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                BindRepeater();
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

        protected void rptState_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Keys.Add(e.Item.ItemIndex, DataBinder.Eval(e.Item.DataItem, "StateID"));

                

                if (((LinkButton)e.Item.FindControl("lbtnInsert")).ID.ToString().Trim().ToUpper() == "lbtnInsert".ToUpper() && ((LinkButton)e.Item.FindControl("lbtnInsert")).Visible == true)
                    EditIndex = e.Item.ItemIndex;
                else
                    EditIndex = -1;
            }
        }


        private void BindRepeater(string strAddRow = "", string strFilterExpression = "")
        {
            PagedDataSource objPageDataSource = csGlobalFunction.BindRepeaterWithPaging(ref rptState, CurrentPage, srcState.SelectCommand, strFilterExpression, strAddRow);
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

        protected void rptState_DataBinding(object sender, EventArgs e)
        {
            Keys.Clear();
        }

        protected void rpttate_ItemCommand(object source, RepeaterCommandEventArgs e)
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
                    InsertState(e);
                    break;
                case "Update":
                    UpdateState(e);
                    break;
                case "Delete":
                    //if (csGlobalFunction.CheckUserDelete())
                    //{
                        DeleteState(e);
                        VisibleUnvisibleControl(false, e.Item);
                    //}
                    //else
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
                    //else
                    //{
                    //    string strFnc = "Javascript:disableSubmit('Y','" + globaldata._insertUserRcd + "');";
                    //    ScriptManager.RegisterStartupScript(this, this.GetType(), "ShowMsg", strFnc, true);
                    //}
                    break;
            }
        }

        private void VisibleUnvisibleControl(bool value, RepeaterItem selectedRptItem)
        {
            ((Label)selectedRptItem.FindControl("lblStateName")).Visible = !value;
            ((TextBox)selectedRptItem.FindControl("txtStateName")).Visible = value;
            ((Label)selectedRptItem.FindControl("lblIsVerify")).Visible = !value;
            ((CheckBox)selectedRptItem.FindControl("chkIsVerify")).Visible = value;
            ((Button)selectedRptItem.FindControl("btnEdit")).Visible = !value;
            ((Button)selectedRptItem.FindControl("btnDelete")).Visible = !value;
            if (((LinkButton)selectedRptItem.FindControl("lbtnInsert")).Visible == true)
            {
                ((LinkButton)selectedRptItem.FindControl("lbtnUpdate")).Visible = !value;
                ((LinkButton)selectedRptItem.FindControl("lbtnCancel")).Visible = value;
            }
            else
            {
                ((LinkButton)selectedRptItem.FindControl("lbtnUpdate")).Visible = value;
                ((LinkButton)selectedRptItem.FindControl("lbtnCancel")).Visible = value;
            }
        }

        private void AddNewRow()
        {
            string strNew = "Declare @rowCount int Select @rowCount=isNull(Count(*),0)+1 From  tblState" +
                            " Select ROW_NUMBER() Over(order by StateName) Row,StateID,StateName,tblState.IsVerify" +
                            " ,'True' UpdateMode,'False' InsertMode From tblState" +
                            " Union Select @rowCount row,0 StateID,'' StateName,'N' IsVerify,'False' UpdateMode,'True' InsertMode order by Row";
            srcState.SelectCommand = strNew;
            BindRepeater("AddRow");
            if (EditIndex != -1)
            {
                RepeaterItem selectedRptItem = rptState.Items[EditIndex];
                VisibleUnvisibleControl(true, selectedRptItem);
            }
        }
        private void InsertState(RepeaterCommandEventArgs e)
        {
            TextBox txtStateName = (TextBox)e.Item.FindControl("txtStateName");
            CheckBox chkIsVerify = (CheckBox)e.Item.FindControl("chkIsVerify");

            if (ValidateData(txtStateName.Text.Trim(), e))
            {
                //Set Data Source OR Procedure Parameters
                srcState.InsertParameters["opMode"].DefaultValue = e.CommandName;
                srcState.InsertParameters["StateID"].DefaultValue = Keys[e.Item.ItemIndex].ToString();
                srcState.InsertParameters["StateName"].DefaultValue = txtStateName.Text;
                srcState.InsertParameters["IsVerify"].DefaultValue = chkIsVerify.Checked ? "Y" : "N";
                srcState.InsertParameters["UserID"].DefaultValue = "0";

                //Fire the insert Procedure
                srcState.Insert();
                BindRepeater();
            }
        }

        private void UpdateState(RepeaterCommandEventArgs e)
        {
            TextBox txtStateName = (TextBox)e.Item.FindControl("txtStateName");
            CheckBox chkIsVerify = (CheckBox)e.Item.FindControl("chkIsVerify");
            if (ValidateData(txtStateName.Text.Trim(), e))
            {
                //Set Data Source OR Procedure Parameters
                srcState.UpdateParameters["opMode"].DefaultValue = e.CommandName;
                srcState.UpdateParameters["StateID"].DefaultValue = Keys[e.Item.ItemIndex].ToString();
                srcState.UpdateParameters["StateName"].DefaultValue = txtStateName.Text;
                srcState.UpdateParameters["IsVerify"].DefaultValue = chkIsVerify.Checked ? "Y" : "N";
                srcState.UpdateParameters["UserID"].DefaultValue = "0";

                //Fire the Update Procedure
                srcState.Update();
                BindRepeater();
                VisibleUnvisibleControl(false, e.Item);
            }
        }

        private void DeleteState(RepeaterCommandEventArgs e)
        {
            try
            {
                //Set Data Source OR Procedure Parameters
                srcState.DeleteParameters["opMode"].DefaultValue = e.CommandName;
                srcState.DeleteParameters["StateID"].DefaultValue = Keys[e.Item.ItemIndex].ToString();
                srcState.DeleteParameters["StateName"].DefaultValue = "";
                srcState.DeleteParameters["IsVerify"].DefaultValue = "";
                srcState.DeleteParameters["UserID"].DefaultValue = "0";

                //Fire the Delete Procedure
                srcState.Delete();
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

        public bool ValidateData(string strState, RepeaterCommandEventArgs e)
        {
            string strQuery = "";
            if (strState == "")
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "javascript:AlertMsg('State Name can not be left blank.');", true);
                return false;
            }
            else
            {
                if (e.CommandName.ToUpper() == "UPDATE")
                    strQuery = "Select Count(StateID) From tblState Where StateID<>" + Convert.ToInt32(Keys[e.Item.ItemIndex]) + " And StateName='" + strState + "'";
                else if (e.CommandName.ToUpper() == "INSERT")
                    strQuery = "Select Count(StateID) From tblState Where StateName='" + strState + "'";

                int categoryID = (int)CrystalConnection.SqlScalartoObj(strQuery);

                if (categoryID > 0)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "javascript:AlertMsg('State Name already exist.');", true);
                    return false;
                }
            }

            return true;
        }

        protected void lbtnNext_Click1(object sender, EventArgs e)
        {
            // Set viewstate variable to the next page
            CurrentPage += 1;

            // Reload control
            if (txtSearch.Text.Trim() != "")
                BindRepeater("", "StateName LIKE '" + txtSearch.Text + "*'");
            else
                BindRepeater();
        }

        protected void btnGo_Click(object sender, EventArgs e)
        {
            CurrentPage = 0;
            if (txtSearch.Text.Trim() != "")
                BindRepeater("", "StateName LIKE '" + txtSearch.Text + "*'");
        }

        protected void btnRefresh_Click(object sender, EventArgs e)
        {
            CurrentPage = 0;
            txtSearch.Text = "";
            BindRepeater();
        }

        protected void lbtnPrev_Click1(object sender, EventArgs e)
        {
            // Set viewstate variable to the previous page
            CurrentPage -= 1;

            // Reload control
            if (txtSearch.Text.Trim() != "")
                BindRepeater("", "StateName LIKE '" + txtSearch.Text + "*'");
            else
                BindRepeater();
        }

           }
}