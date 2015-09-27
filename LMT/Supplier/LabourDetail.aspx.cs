using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using LMT.ClassGlobal;
using System.Configuration;
using System.Collections;
using LMT.BusinessLogic;
using System.Data.SqlClient;
using System.IO;
using System.Web.UI.HtmlControls;


namespace LMT.Supplier
{
    public partial class LabourDetail : System.Web.UI.Page
    {
        csGlobal globalobject = new csGlobal();
        csDropDownFunction objdropdown = new csDropDownFunction();
        csLabourRegistration objLabour = new csLabourRegistration();
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
            if (!IsPostBack)//(!IsPostBack)
            {
                //objdropdown.FillDropDown(ref ddlclass, "Select ClassID,ClassName From tblClass", "ClassName", "ClassID", "Order By ClassName", "Where IsVerify='Y'");
                //objdropdown.FillDropDown(ref ddlSection, "Select  SectionID,Section from tblSection", "Section", "SectionID", "Order By Section", "Where IsVerify='Y'");
                //BindRepeater();

                //if (Session["rptclassid"] != null && Session["rptsectionid"] != null)
                //{
                    //ddlclass.SelectedValue = Session["rptclassid"].ToString();
                    //ddlSection.SelectedValue = Session["rptsectionid"].ToString();
                    //ddlSection.Enabled = true;
                    BindRepeater();
                //}
            }

            //if (csGlobalFunction.CheckUserInsert())
            //    lbtnAdd.Attributes["OnClick"] = string.Format("Javascript:AddRecord('../Supplier/RegisterLabour',780,900,'Mode=" + globalobject._insertMode + "','ID=0'); return false");
            //else
            //{
            //    lbtnAdd.Attributes["OnClick"] = string.Format("Javascript:disableSubmit('Y','" + globalobject._insertUserRcd + "'); return false");
            //}
        }
        private void BindRepeater()
        {
            string strQuery = " Select Reg_ID,Labour_Code,FullName,Ph_No,C_Address,CityName,StateName From tbl_LabourRegistration" +
                              " Inner Join tblCity on tbl_LabourRegistration.CCity=tblCity.CityID"+
                              " Inner Join tblState on tbl_LabourRegistration.CState=tblState.StateID"+
                              " Where SupplierID=" + Convert.ToString(Session["UserID"]) + " ";
            csGlobalFunction.BindRepeater(ref rptLabourInformation, strQuery);
        }
        protected void rptLabourInformation_DataBinding(object sender, EventArgs e)
        {
            Keys.Clear();
        }
        protected void rptLabourInformation_ItemCommand(object source, RepeaterCommandEventArgs e)
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
                //case "Print"
            }
        }
        protected void rptLabourInformation_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
           
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Button btnEdit = (Button)e.Item.FindControl("btnEdit");

                btnEdit.CommandName = "Edit";
                btnEdit.Attributes["onclick"] = string.Format("window.location = '{0}';", ResolveClientUrl(string.Format("~/Supplier/RegisterLabour.aspx?ID={0}", DataBinder.Eval(e.Item.DataItem,"Reg_ID"))));
                Keys.Add(e.Item.ItemIndex, DataBinder.Eval(e.Item.DataItem, "Reg_ID"));
                //Button btnEdit = (Button)e.Item.FindControl("btnEdit");
                //if (csGlobalFunction.CheckUserUpdate())
                //    btnEdit.Attributes["OnClick"] = string.Format("Javascript:EditRecord('../Supplier/RegisterLabour','Mode=" + globalobject._updateMode + "','ID={0}',780,900); return false", DataBinder.Eval(e.Item.DataItem, "Reg_ID"));
                //else
                //    btnEdit.Attributes["OnClick"] = string.Format("Javascript:EditRecord('../TransAdmission/Adm_StdAdd','Mode=" + globalobject._viewMode + "','ID={0}',780,900); return false", DataBinder.Eval(e.Item.DataItem, "StudentID"));
                HtmlInputButton btnprint = (HtmlInputButton)e.Item.FindControl("btnprint");
                btnprint.Attributes["OnClick"] = string.Format("javascript:window.open('../Reports/rptLabourProfile.aspx?id=" + Convert.ToDecimal(DataBinder.Eval(e.Item.DataItem, "Reg_ID").ToString()) + "', 'PrintReport','width=1050,height=1310,scrollbars=1,menubar=no,top=100,left=200')", DataBinder.Eval(e.Item.DataItem, "Reg_ID"));
            }
        }
        private void DeleteData(RepeaterCommandEventArgs e)
        {
            try
            {
                objLabour.DeleteLabInfo(e.CommandName, Convert.ToInt32(Keys[e.Item.ItemIndex]));
                //Label lblStd = (Label)e.Item.FindControl("lblStdImgUrl");
                //Label lblStdF = (Label)e.Item.FindControl("lblFatherImgUrl");
                //Label lblStdM = (Label)e.Item.FindControl("lblMotherImgUrl");
                //if (lblStd.Text != "") File.Delete(Server.MapPath(lblStd.Text));
                //if (lblStdF.Text != "") File.Delete(Server.MapPath(lblStdF.Text));
                //if (lblStdM.Text != "") File.Delete(Server.MapPath(lblStdM.Text));
                BindRepeater();
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
            Response.Redirect("~/Supplier/RegisterLabour.aspx");
        }

        protected void btnprint_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("../Reports/AllLabours.aspx");
        }

        //protected void ddlclass_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    if (ddlclass.SelectedValue != "-1")
        //    {
        //        ddlSection.Enabled = true;
        //        objdropdown.FillDropDown(ref ddlSection, "select tblSection.SectionID,tblSection.Section from mst_SectionDetail inner join tblClass on mst_SectionDetail.ClassID=tblClass.ClassID " +
        //           "inner join tblSection on mst_SectionDetail.SectionID=tblSection.SectionID ", "Section", "SectionID", "Order By Section", "Where tblClass.ClassID=" + ddlclass.SelectedValue + " ");
        //    }
        //    else
        //    {
        //        ddlSection.Enabled = false;
        //        objdropdown.FillDropDown(ref ddlSection, "Select  SectionID,Section from tblSection", "Section", "SectionID", "Order By Section", "Where IsVerify='Y'");
        //    }
        //}

        //protected void ddlSection_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    BindRepeater();
        //    Session["rptclassid"] = ddlclass.SelectedValue;
        //    Session["rptsectionid"] = ddlSection.SelectedValue;

        //}

       
    }
}