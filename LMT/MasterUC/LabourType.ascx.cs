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
    public partial class LabourType : System.Web.UI.UserControl
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
        protected void rptLabourType_OnItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Keys.Add(e.Item.ItemIndex, DataBinder.Eval(e.Item.DataItem, "Lbr_type_id"));

                BindDropDownList("Select SectorID,SectorName From tbl_Sector", e);

                ((DropDownList)e.Item.FindControl("ddlSector")).SelectedValue = DataBinder.Eval(e.Item.DataItem, "Sector").ToString();
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
            ((DropDownList)e.Item.FindControl("ddlSector")).DataSource = dsFillData.Tables[0].DefaultView;
            ((DropDownList)e.Item.FindControl("ddlSector")).DataTextField = "SectorName";
            ((DropDownList)e.Item.FindControl("ddlSector")).DataValueField = "SectorID";
            ((DropDownList)e.Item.FindControl("ddlSector")).DataBind();
        }
        private void VisibleUnvisibleControl(bool value, RepeaterItem selectedRptItem)
        {
            ((Label)selectedRptItem.FindControl("lblLabourType")).Visible = !value;
            ((TextBox)selectedRptItem.FindControl("txtLabourType")).Visible = value;

            ((Label)selectedRptItem.FindControl("lblSector")).Visible = !value;
            ((DropDownList)selectedRptItem.FindControl("ddlSector")).Visible = value;

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
        protected void rptLabourType_OnDataBinding(object sender, EventArgs e)
        {
            Keys.Clear();
        }
        private void BindRepeater(string strAddRow = "", string strFilterExpression = "")
        {
            PagedDataSource objPageDataSource = csGlobalFunction.BindRepeaterWithPaging(ref rptLabourType, CurrentPage, srcLabourType.SelectCommand, strFilterExpression, strAddRow);
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
        protected void rptLabourType_OnItemCommand(object source, RepeaterCommandEventArgs e)
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
                    InsertLabourType(e);
                    break;
                case "Update":
                    UpdateLabourType(e);
                    break;
                case "Delete":
                    //if (csGlobalFunction.CheckUserDelete())
                    //{
                    DeleteLabourType(e);
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
            string strNew = "Declare @rowCount int Select @rowCount=isNull(Count(*),0)+1 From  tbl_Lbr_Type" +
                " Select ROW_NUMBER() Over(order by Lbr_Type) Row,Lbr_type_id,Lbr_Type,tbl_Sector.SectorName,tbl_Lbr_Type.Sector,tbl_Lbr_Type.IsVerify" +
                " ,'True' UpdateMode,'False' InsertMode From tbl_Lbr_Type Inner Join tbl_Sector On tbl_Lbr_Type.Sector=tbl_Sector.SectorID" +
                " Union Select @rowCount row,0 Lbr_type_id,'' Lbr_Type,'' Sector,0 Sector,'N' IsVerify,'False' UpdateMode,'True' InsertMode order by Row";
            srcLabourType.SelectCommand = strNew;
            //DataSourceSelectArguments args = new DataSourceSelectArguments();
            //srcCity.Select(args);
            BindRepeater("AddRow");
            if (EditIndex != -1)
            {
                RepeaterItem selectedRptItem = rptLabourType.Items[EditIndex];
                VisibleUnvisibleControl(true, selectedRptItem);
            }
        }
        private void InsertLabourType(RepeaterCommandEventArgs e)
        {
            TextBox txtLabourType = (TextBox)e.Item.FindControl("txtLabourType");
            CheckBox chkIsVerify = (CheckBox)e.Item.FindControl("chkIsVerify");
            DropDownList ddlSector = (DropDownList)e.Item.FindControl("ddlSector");
            if (ValidateData(txtLabourType.Text.Trim(), e))
            {
                //Set Data Source OR Procedure Parameters
                srcLabourType.InsertParameters["opMode"].DefaultValue = e.CommandName;
                srcLabourType.InsertParameters["Lbr_type_id"].DefaultValue = Keys[e.Item.ItemIndex].ToString();
                srcLabourType.InsertParameters["Lbr_Type"].DefaultValue = txtLabourType.Text.Trim();
                srcLabourType.InsertParameters["Sector"].DefaultValue = ddlSector.SelectedValue;
                srcLabourType.InsertParameters["IsVerify"].DefaultValue = chkIsVerify.Checked ? "Y" : "N";

                //Fire the insert Procedure
                srcLabourType.Insert();
                BindRepeater();

            }
        }
        private void UpdateLabourType(RepeaterCommandEventArgs e)
        {
            TextBox txtLabourType = (TextBox)e.Item.FindControl("txtLabourType");
            CheckBox chkIsVerify = (CheckBox)e.Item.FindControl("chkIsVerify");
            DropDownList ddlSector = (DropDownList)e.Item.FindControl("ddlSector");
            if (ValidateData(txtLabourType.Text.Trim(), e))
            {
                //Set Data Source OR Procedure Parameters
                srcLabourType.UpdateParameters["opMode"].DefaultValue = e.CommandName;
                srcLabourType.UpdateParameters["Lbr_type_id"].DefaultValue = Keys[e.Item.ItemIndex].ToString();
                srcLabourType.UpdateParameters["Lbr_Type"].DefaultValue = txtLabourType.Text;
                srcLabourType.UpdateParameters["Sector"].DefaultValue = ddlSector.SelectedValue;
                srcLabourType.UpdateParameters["IsVerify"].DefaultValue = chkIsVerify.Checked ? "Y" : "N";

                //Fire the Update Procedure
                srcLabourType.Update();
                BindRepeater();
                VisibleUnvisibleControl(false, e.Item);
            }
        }
        private void DeleteLabourType(RepeaterCommandEventArgs e)
        {
            try
            {
                //Set Data Source OR Procedure Parameters
                srcLabourType.DeleteParameters["opMode"].DefaultValue = e.CommandName;
                srcLabourType.DeleteParameters["Lbr_type_id"].DefaultValue = Keys[e.Item.ItemIndex].ToString();
                srcLabourType.DeleteParameters["Lbr_Type"].DefaultValue = "";
                srcLabourType.DeleteParameters["Sector"].DefaultValue = "";
                srcLabourType.DeleteParameters["IsVerify"].DefaultValue = "";

                //Fire the Delete Procedure
                srcLabourType.Delete();
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
        public bool ValidateData(string strLabourType, RepeaterCommandEventArgs e)
        {
            string strQuery = "";
            if (strLabourType == "")
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "javascript:AlertMsg('Labour Type can not be left blank.');", true);
                return false;
            }
            else
            {
                if (e.CommandName.ToUpper() == "UPDATE")
                    strQuery = "Select Count(Lbr_type_id) From tbl_Lbr_Type Where Lbr_type_id<>" + Convert.ToInt32(Keys[e.Item.ItemIndex]) + " And Lbr_Type='" + strLabourType + "'";
                else if (e.CommandName.ToUpper() == "INSERT")
                    strQuery = "Select Count(Lbr_type_id) From tbl_Lbr_Type Where Lbr_Type='" + strLabourType + "'";

                int Lbr_Type_ID = (int)CrystalConnection.SqlScalartoObj(strQuery);

                if (Lbr_Type_ID > 0)
                {

                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "javascript:AlertMsg('Labour type already exist.');", true);
                    return false;
                }
            }

            return true;
        }
        protected void btnGo_Click(object sender, EventArgs e)
        {
            CurrentPage = 0;
            if (txtSearch.Text.Trim() != "")
                BindRepeater("", "Lbr_Type LIKE '" + txtSearch.Text + "*'");
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
                BindRepeater("", "Lbr_Type LIKE '" + txtSearch.Text + "*'");
            else
                BindRepeater();
        }
        protected void lbtnPrev_Click(object sender, EventArgs e)
        {
            CurrentPage -= 1;

            if (txtSearch.Text.Trim() != "")
                BindRepeater("", "Lbr_Type LIKE '" + txtSearch.Text + "*'");
            else
                BindRepeater();

        }

    }
}