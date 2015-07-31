using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LMT.ClassGlobal;
using System.Collections;
using System.Data;
using CrystalDatabase;
using LMT.BusinessLogic;
using System.Text.RegularExpressions;

namespace LMT.Customer
{
    public partial class AddNewCase : System.Web.UI.Page
    {
        Hashtable Keys
        {
            get
            {
                if (ViewState["Keys"] == null)
                    ViewState["Keys"] = new Hashtable();
                return (Hashtable)ViewState["Keys"];
            }
        }
        csDropDownFunction objDropDown = new csDropDownFunction();
        Guid GID;
        string Ticket = "";
        string Exist = "";
        public string pageStatus = "";
        csLeads objLeads = new csLeads();
        protected void Page_Load(object sender, EventArgs e)
        {
            string UserName = "";
            if (!IsPostBack)
            {
                string Str = "Select UserName from tblUserRegistration Where UserID=" + Convert.ToInt32(Session["UserID"]) + " ";
                UserName = Convert.ToString(CrystalConnection.SqlScalartoObj(Str));
                GID = Guid.NewGuid();
                Session["Ticket"] = UserName.Substring(0, 3) + GID.ToString().Substring(0, 9);
            }
            
        }

        protected void ddlLabourCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlLabourCategory.SelectedValue != "-1")
            {
                objDropDown.FillDropDown(ref ddlLabourType, "Select Lbr_type_id,Lbr_Type From tbl_Lbr_Type", "Lbr_Type", "Lbr_type_id", "Order By Lbr_Type", "Where Sector=" + ddlLabourCategory.SelectedValue + " and IsVerify='Y'");
            }
            else
            {
                ddlLabourType.Items.Clear();
                ddlLabourType.Items.Add(new ListItem("--Select Labour Type--","-1"));
            }
        }

        protected void ddlLabourType_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                if (ddlLabourCategory.SelectedValue != "-1" && ddlLabourType.SelectedValue != "-1")
                {
                    BindRepeater();
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

        private void BindRepeater()
        {
            string strQuery = " Select Reg_ID,FullName,Image_URL from tbl_LabourRegistration " +
                              " where LabourType='" + ddlLabourType.SelectedValue + "'";
            DataTable dtLabourInfo = FillDataTable(strQuery);
            if (dtLabourInfo.Rows.Count > 0)
            {
                csGlobalFunction.BindRepeater(ref rptLabourInformation, strQuery);

                Session["LabourInfo"] = dtLabourInfo;
                PagedDataSource objPageDataSource = csGlobalFunction.BindRepeaterWithPagingReports(ref rptLabourInformation, CurrentPage, strQuery, 1);
                CurrentPage = objPageDataSource.CurrentPageIndex;
                ////lblName.Text = "";

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

                dvLbr.Visible = true;
                PrvNxtbtn.Visible = true;
                dvRNF.Visible = false;
            }
            else
            {
                dvLbr.Visible = false;
                PrvNxtbtn.Visible = false;
                dvRNF.Visible = true;
            }
        }

        protected void rptLabourInformation_DataBinding(object sender, EventArgs e)
        {
            Keys.Clear();
        }

        protected void rptLabourInformation_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Keys.Add(e.Item.ItemIndex, DataBinder.Eval(e.Item.DataItem, "Reg_ID"));
            }
            if (e.Item.ItemType == ListItemType.Footer)
            {

                //Keys.Add(e.Item.ItemIndex, DataBinder.Eval(e.Item.DataItem, "FullName"));
                //Keys.Add(e.Item.ItemIndex, DataBinder.Eval(e.Item.DataItem, "Ph_No"));
                Label lblName = ((Label)e.Item.FindControl("lblName"));
                //Label lblContact = ((Label)e.Item.FindControl("lblContact"));

                if (Session["LabourInfo"] != null)
                {
                    DataTable dtTemp = (DataTable)Session["LabourInfo"];

                    DataRow[] dr = dtTemp.Select("Reg_ID=" + hdfReg_DI.Value + "");
                    if (dr.Length != 0)
                    {
                        lblName.Text = Convert.ToString(dr[0]["FullName"]);
                    }
                    else
                    {
                        lblName.Text = Convert.ToString(dtTemp.Rows[0]["FullName"]);
                        hdfReg_DI.Value = Convert.ToString(dtTemp.Rows[0][0]);
                    }
                }
            }
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

        protected void lbtnNext_Click(object sender, EventArgs e)
        {
            DataTable dtTemp = (DataTable)Session["LabourInfo"];
            //go to next page
            CurrentPage += 1;
            hdfReg_DI.Value = Convert.ToString(dtTemp.Rows[CurrentPage][0]);
            pageStatus = "Y";
            BindRepeater();
        }

        protected void lbtnPrev_Click(object sender, EventArgs e)
        {
            DataTable dtTemp = (DataTable)Session["LabourInfo"];
            //back to previous page
            CurrentPage -= 1;
            hdfReg_DI.Value = Convert.ToString(dtTemp.Rows[CurrentPage][0]);
            pageStatus = "Y";
            BindRepeater();
        }


        private void SetProperties(int CustomerID)
        {
            try
            {
                //DataTable dtTemp = (DataTable)Session["LabourInfo"];
                //if (hfOpmode.Value == "UPDATE")
                //{
                //    objLeads.Reg_id = Convert.ToInt32(hfRegID.Value);
                //}
                //else
                //{
                objLeads.Lead_id = 0;
                //}
                objLeads.Labourid = Convert.ToInt32(hdfReg_DI.Value);
                objLeads.Customerid = Convert.ToInt32(Session["UserID"]);
                string Date = txtPickDate.Text;
                objLeads.Required_date = Convert.ToDateTime(txtPickDate.Text, System.Globalization.CultureInfo.GetCultureInfo("hi-IN").DateTimeFormat);
                objLeads.Required_time = ddlRequiredTime.SelectedItem.Text;
                objLeads.Status = "NL";
                objLeads.Ticket = Convert.ToString(Session["Ticket"]);
                objLeads.Description = txtDesc.Text;
                //objLeads.Supplierid = Convert.ToInt32(Session["UserID"]);
            }
            catch (Exception ex)
            {
                string strFnc = "";
                strFnc = ex.Message;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "CatchMsg", "alert('" + strFnc + "');", true);
            }
        }

        public bool Validation()
        {
            if (txtPickDate.Text == "")
            {
                txtPickDate.Focus();
                return false;
            }
            return true;
        }

        protected void btnBookNow_Click1(object sender, EventArgs e)
        {
            try
            {
                if (Validation())
                {
                    SetProperties(Convert.ToInt32(Session["UserID"]));
                    objLeads.SaveData("INSERT");

                    string Str = "Select EmailID from tblUserRegistration Where UserID=" + Convert.ToInt32(Session["UserID"]) + " ";
                    string Email = Convert.ToString(CrystalConnection.SqlScalartoObj(Str));
                    string recipientemailto = Email;
                    string strMessage = "Dear Customer,<br> Thank You for your association with us. We are in receipt of your concern with Easy-Labour." +
                        "<br>Our team tried to get in touch with as per Service Request no.–" + Convert.ToString(Session["Ticket"]) + ". " +
                        "<br>We will be happy to help you to resolve your issue at a time of your convenience. " +


                        "<br>In case of any further clarification, feel free to call  or write to us at the contacts given in this email.";
                    string strSubject = "Registration Confirmation mail";
                    if (Email != "") csGlobalFunction.SendEmail(recipientemailto, strSubject, strMessage);
                }
                //ClearControls();
                lblMessage.Text = "Your Request have been submitted successfully. Our Executive will contact you shortly. Thank you ";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "LaunchServerSide", "$(function() { SaveSuccess(); });", true);
                //ScriptManager.RegisterStartupScript(this, this.GetType(), "alertMessage", "alert('Record save successfully.);", true);

                //if (strRestrict == "NotAllowed")
                //{
                //    Response.Redirect("~/MasterPages/SupplierMenuboard.aspx");
                //}
            }
            catch (Exception ex)
            {
                string strFnc = "";
                strFnc = ex.Message;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "CatchMsg", "alert('" + strFnc + "');", true);
            }
        }

        

    }
}