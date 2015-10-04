using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using CrystalDatabase;
using LMT.ClassGlobal;
using System.Collections;

namespace LMT.MasterPages
{
    public partial class SupplierMenuboard : System.Web.UI.Page
    {
        csDropDownFunction objDropDown = new csDropDownFunction();
        Hashtable Keys
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
            try
            {
                if (Convert.ToString(Session["UserName"]) != null && Convert.ToString(Session["UserType"]) != null)
                {
                    string strQuery = "Select total=COUNT(Experience_Type),Experience_Type from tbl_LabourRegistration where SupplierID=" + Convert.ToString(Session["UserID"]) + " group by Experience_Type";
                    DataTable dt = new DataTable();

                    dt = FillDataTable(strQuery);
                    dt.Columns.Add("Status", typeof(string));
                    for (int i = 0; i < dt.Rows.Count; i++)
                    {
                        if ("1" == Convert.ToString(dt.Rows[i][1]))
                        {
                            dt.Rows[i][2] = "Skilled";
                        }
                        else if ("2" == Convert.ToString(dt.Rows[i][1]))
                        {
                            dt.Rows[i][2] = "Semi-Skilled";
                        }
                        else
                            dt.Rows[i][2] = "Fresher";
                    }
                    foreach (DataRow dr in dt.Rows)
                    {
                        LabourChart.PieChartValues.Add(new AjaxControlToolkit.PieChartValue
                        {
                            Category = dr["Status"].ToString(),
                            Data = Convert.ToDecimal(dr["total"].ToString()),
                        });
                    }

                    strQuery = "Select COUNT(Reg_ID) FRom tbl_LabourRegistration where SupplierID=" + Convert.ToString(Session["UserID"]) + "";
                    lblTotalLabour.Text = Convert.ToString(CrystalConnection.SqlScalartoObj(strQuery));
                    if (!IsPostBack)
                    {
                        objDropDown.FillDropDown(ref ddlLbrType, "Select Lbr_type_id,Lbr_Type From tbl_Lbr_Type", "Lbr_Type", "Lbr_type_id", "Order By Lbr_Type");
                    }

                    string Str = "Update tbl_Leads set status='CL' where Status='NL' and Required_Date<GETDATE()";
                    CrystalConnection.DoCommandWithoutTransaction(Str);
                }
                else
                {
                    Response.Redirect("../index.aspx");
                }
            }
            catch (Exception ex)
            {
                string strFnc = "";
                strFnc = ex.Message;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "CatchMsg", "javascript:AlertMsg('" + strFnc + "');", true);
            }
        }

        public static DataTable FillDataTable(string query)
        {
            DataTable dtFillData;
            dtFillData = CrystalConnection.CreateDataTableWithoutTransaction(query);
            return dtFillData;
        }

        protected void ddlLbrType_SelectedIndexChanged(object sender, EventArgs e)
        {
            string strQuery = "Select Reg_ID,FullName from tbl_LabourRegistration where LabourType=" + ddlLbrType.SelectedValue + " and SupplierID=" + Convert.ToString(Session["UserID"]) + "";

            csGlobalFunction.BindRepeater(ref rptLabourInformation, strQuery);
        }

        protected void lnkNL_Click(object sender, EventArgs e)
        {

            dvLWS.Visible = false;
            dvNL.Visible = true;
            dvInP.Visible = false;
            dvCL.Visible = false;
            BindNewLeads();
        }

        protected void lnkInp_Click(object sender, EventArgs e)
        {
            dvLWS.Visible = false;
            dvNL.Visible = false;
            dvInP.Visible = true;
            dvCL.Visible = false;
            BindIPLeads();
        }

        protected void lnkCL_Click(object sender, EventArgs e)
        {
            dvLWS.Visible = false;
            dvNL.Visible = false;
            dvInP.Visible = false;
            dvCL.Visible = true;
            BindClosedLeads();
        }


        private void BindNewLeads()
        {
            string strQuery = "select Lead_ID,Labour_ID,LT.Lbr_Type,ur.UserName as Name,Required_Date from tbl_Leads TL with(nolock) " +
                              "inner join dbo.tblUserRegistration UR with(nolock) on TL.customer_id=UR.UserID " +
                              "inner join tbl_LabourRegistration LR with(nolock) on TL.Labour_ID=LR.Reg_ID " +
                              "inner join tbl_Lbr_Type LT with(nolock) on LR.LabourType=LT.Lbr_type_id " +
                              "Where Status='IP' and Asign=" + Convert.ToString(Session["UserID"]) + " and Required_Date>GETDATE() and Is_accepted='N'";
            csGlobalFunction.BindRepeater(ref rptLeadInformation, strQuery);
        }


        protected void rptLeadInformation_DataBinding(object sender, EventArgs e)
        {
            Keys.Clear();
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

                //case "Delete":
                //    //if (csGlobalFunction.CheckUserDelete())
                //    DeleteData(e);
                //    //else
                //    //{
                //    //    string strFnc = "Javascript:disableSubmit('Y','" + globalobject._deleteUserRcd + "');";
                //    //    ScriptManager.RegisterStartupScript(this, this.GetType(), "ShowMsg", strFnc, true);
                //    //}
                //    break;
            }
        }
        protected void rptLeadInformation_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {

            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Button btnEdit = (Button)e.Item.FindControl("btnEdit");

                btnEdit.CommandName = "Edit";
                btnEdit.Attributes["onclick"] = string.Format("window.location = '{0}';", ResolveClientUrl(string.Format("~/Supplier/NewLeads.aspx?ID={0}&MODE={1}&TYPE={2}", DataBinder.Eval(e.Item.DataItem, "Lead_ID"), "IP", "1")));
                Keys.Add(e.Item.ItemIndex, DataBinder.Eval(e.Item.DataItem, "Lead_ID"));
                //Button btnEdit = (Button)e.Item.FindControl("btnEdit");
                //if (csGlobalFunction.CheckUserUpdate())
                //    btnEdit.Attributes["OnClick"] = string.Format("Javascript:EditRecord('../Supplier/RegisterLabour','Mode=" + globalobject._updateMode + "','ID={0}',780,900); return false", DataBinder.Eval(e.Item.DataItem, "Reg_ID"));
                //else
                //    btnEdit.Attributes["OnClick"] = string.Format("Javascript:EditRecord('../TransAdmission/Adm_StdAdd','Mode=" + globalobject._viewMode + "','ID={0}',780,900); return false", DataBinder.Eval(e.Item.DataItem, "StudentID"));
            }
        }


        private void BindIPLeads()
        {
            string strQuery = "select Lead_ID,Labour_ID,LT.Lbr_Type,ur.UserName as 'Name',URS.UserName+' / '+LR.FullName as 'FullName' ,Required_Date from tbl_Leads TL with(nolock) " +
                              "inner join dbo.tblUserRegistration UR with(nolock) on TL.customer_id=UR.UserID " +
                              "inner join tbl_LabourRegistration LR with(nolock) on TL.Labour_ID=LR.Reg_ID " +
                              "inner join tbl_Lbr_Type LT with(nolock) on LR.LabourType=LT.Lbr_type_id " +
                              "inner join dbo.tblUserRegistration URS on LR.supplierid=URS.UserID "+
                              "Where Status='IP' and Required_Date>GETDATE() and Is_accepted='Y' and TL.Asign=" + Convert.ToString(Session["UserID"]);
            csGlobalFunction.BindRepeater(ref rptIPLeads, strQuery);
        }

        private void BindClosedLeads()
        {
            string strQuery = "select Lead_ID,Labour_ID,LT.Lbr_Type,ur.UserName as 'Name',URS.UserName+' / '+LR.FullName as 'FullName' ,Required_Date from tbl_Leads TL with(nolock) " +
                              "inner join dbo.tblUserRegistration UR with(nolock) on TL.customer_id=UR.UserID " +
                              "inner join tbl_LabourRegistration LR with(nolock) on TL.Labour_ID=LR.Reg_ID " +
                              "inner join tbl_Lbr_Type LT with(nolock) on LR.LabourType=LT.Lbr_type_id " +
                              "inner join dbo.tblUserRegistration URS on LR.supplierid=URS.UserID " +
                              "Where Status='CL' and Required_Date>=GETDATE() and Is_completed='Y' and Is_accepted='Y'and Asign=" + Convert.ToString(Session["UserID"]);
            csGlobalFunction.BindRepeater(ref rptClosedLeads, strQuery);
        }

        protected void rptIPLeadInformation_DataBinding(object sender, EventArgs e)
        {
            Keys.Clear();
        }

        protected void rptIPLeadInformation_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {

            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Button btnEdit = (Button)e.Item.FindControl("btnEdit");

                btnEdit.CommandName = "Edit";
                btnEdit.Attributes["onclick"] = string.Format("window.location = '{0}';", ResolveClientUrl(string.Format("~/Supplier/NewLeads.aspx?ID={0}&MODE={1}&TYPE={2}", DataBinder.Eval(e.Item.DataItem, "Lead_ID"), "IP", "2")));
                Keys.Add(e.Item.ItemIndex, DataBinder.Eval(e.Item.DataItem, "Lead_ID"));
                //Button btnEdit = (Button)e.Item.FindControl("btnEdit");
                //if (csGlobalFunction.CheckUserUpdate())
                //    btnEdit.Attributes["OnClick"] = string.Format("Javascript:EditRecord('../Supplier/RegisterLabour','Mode=" + globalobject._updateMode + "','ID={0}',780,900); return false", DataBinder.Eval(e.Item.DataItem, "Reg_ID"));
                //else
                //    btnEdit.Attributes["OnClick"] = string.Format("Javascript:EditRecord('../TransAdmission/Adm_StdAdd','Mode=" + globalobject._viewMode + "','ID={0}',780,900); return false", DataBinder.Eval(e.Item.DataItem, "StudentID"));
            }
        }
        protected void rptClosedLeads_DataBinding(object sender, EventArgs e)
        {
            Keys.Clear();
        }
        protected void rptClosedLeads_ItemCommand(object source, RepeaterCommandEventArgs e)
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

                //case "Delete":
                //    //if (csGlobalFunction.CheckUserDelete())
                //    DeleteData(e);
                //    //else
                //    //{
                //    //    string strFnc = "Javascript:disableSubmit('Y','" + globalobject._deleteUserRcd + "');";
                //    //    ScriptManager.RegisterStartupScript(this, this.GetType(), "ShowMsg", strFnc, true);
                //    //}
                //    break;
            }
        }
        protected void rptClosedLeads_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {

            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Button btnEdit = (Button)e.Item.FindControl("btnEdit");

                btnEdit.CommandName = "Edit";
                btnEdit.Attributes["onclick"] = string.Format("window.location = '{0}';", ResolveClientUrl(string.Format("~/Supplier/NewLeads.aspx?ID={0}&MODE={1}&TYPE={2}", DataBinder.Eval(e.Item.DataItem, "Lead_ID"), "CL", "3")));
                Keys.Add(e.Item.ItemIndex, DataBinder.Eval(e.Item.DataItem, "Lead_ID"));
                //Button btnEdit = (Button)e.Item.FindControl("btnEdit");
                //if (csGlobalFunction.CheckUserUpdate())
                //    btnEdit.Attributes["OnClick"] = string.Format("Javascript:EditRecord('../Supplier/RegisterLabour','Mode=" + globalobject._updateMode + "','ID={0}',780,900); return false", DataBinder.Eval(e.Item.DataItem, "Reg_ID"));
                //else
                //    btnEdit.Attributes["OnClick"] = string.Format("Javascript:EditRecord('../TransAdmission/Adm_StdAdd','Mode=" + globalobject._viewMode + "','ID={0}',780,900); return false", DataBinder.Eval(e.Item.DataItem, "StudentID"));
            }
        }

        protected void rptIPLeads_ItemCommand(object source, RepeaterCommandEventArgs e)
        {

        }
    }
}