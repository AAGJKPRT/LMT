using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//using LMS.ClassGlobal;
using LMT.ClassGlobal;
using System.Collections;
using System.Data;
using CrystalDatabase;
using LMT.BusinessLogic;
using System.Text.RegularExpressions;

namespace LMT
{
    public partial class index : System.Web.UI.Page
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
        csLeads objLeads = new csLeads();
        csDropDownFunction objDropDown = new csDropDownFunction();
        Guid GID;
        string Ticket = "";
        string Exist = "";
        public string pageStatus = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            //Page.Header.DataBind();

            if (chkPreUser.Checked == true)
            {
                fancy.Visible = false;

            }

            //GetLabour Web = new GetLabour();
            //Web.GetLabourTypeNames(txtSearch.Text);
            if (!IsPostBack)
            {
                objDropDown.FillDropDown(ref ddlLbrType, "Select Lbr_type_id,Lbr_Type From tbl_Lbr_Type", "Lbr_Type", "Lbr_type_id", "Order By Lbr_Type", "Where Sector=1 and IsVerify='Y'");
                objDropDown.FillDropDown(ref ddlLbrTypeLGB, "Select Lbr_type_id,Lbr_Type From tbl_Lbr_Type", "Lbr_Type", "Lbr_type_id", "Order By Lbr_Type", "Where Sector=2 and IsVerify='Y'");
                objDropDown.FillDropDown(ref ddlLbrTypeIL, "Select Lbr_type_id,Lbr_Type From tbl_Lbr_Type", "Lbr_Type", "Lbr_type_id", "Order By Lbr_Type", "Where Sector=3 and IsVerify='Y'");
            }
            GID = Guid.NewGuid();
            if (txtMobileNo.Text.Trim() != "")
            {
                Session["Ticket"] = txtMobileNo.Text.Substring(0, 3) + GID.ToString().Substring(0, 9);
            }
            if (txtMobileLGB.Text.Trim() != "")
            {
                Session["Ticket"] = txtMobileLGB.Text.Substring(0, 3) + GID.ToString().Substring(0, 9);
            }
            if (txtMobileIL.Text.Trim() != "")
            {
                Session["Ticket"] = txtMobileIL.Text.Substring(0, 3) + GID.ToString().Substring(0, 9);
            }
        }

        #region(HG)
        protected void Button3_Click(object sender, EventArgs e)
        {
            try
            {
                if (ddlLbrType.SelectedValue != "-1" && txtPincode.Text.Trim() != "")
                {
                    divDefault.Visible = false;
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

            " where CPincode=" + txtPincode.Text.Trim() + " and LabourType='" + ddlLbrType.SelectedValue + "'";
            DataTable dtLabourInfo = FillDataTable(strQuery);
            csGlobalFunction.BindRepeater(ref rptLabourInformation, strQuery);
            HS_rep.Visible = true;
            HS_RecordNF.Visible = false;
            //if (dtLabourInfo.Rows.Count > 0)
            //{
            //    csGlobalFunction.BindRepeater(ref rptLabourInformation, strQuery);

            //    Session["LabourInfo"] = dtLabourInfo;
            //    PagedDataSource objPageDataSource = csGlobalFunction.BindRepeaterWithPagingReports(ref rptLabourInformation, CurrentPage, strQuery, 1);
            //    CurrentPage = objPageDataSource.CurrentPageIndex;
            //    ////lblName.Text = "";

            //    if (objPageDataSource.Count > 0)
            //    {
            //        //dispaly controls if there are pages
            //        lbtnPrev.Visible = true;
            //        lbtnNext.Visible = true;
            //        lblCurrentPage.Visible = true;
            //        lblCurrentPage.Text = "Page " +
            //          Convert.ToString(CurrentPage + 1) + " of " +
            //          Convert.ToString(objPageDataSource.PageCount);
            //    }
            //    else
            //    {
            //        //disable controls if there are no pages
            //        lbtnPrev.Visible = false;
            //        lbtnNext.Visible = false;
            //        lblCurrentPage.Visible = false;
            //    }
            //    lbtnPrev.Enabled = !objPageDataSource.IsFirstPage;
            //    lbtnNext.Enabled = !objPageDataSource.IsLastPage;

            //    HS_rep.Visible = true;
            //    PrvNxtbtn.Visible = true;
            //    HS_RecordNF.Visible = false;
            //}
            //else
            //{
            //    HS_rep.Visible = false;
            //    PrvNxtbtn.Visible = false;
            //    HS_RecordNF.Visible = true;
            //}
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

        //protected void lbtnNext_Click(object sender, EventArgs e)
        //{
        //    DataTable dtTemp = (DataTable)Session["LabourInfo"];
        //    //go to next page
        //    CurrentPage += 1;
        //    hdfReg_DI.Value = Convert.ToString(dtTemp.Rows[CurrentPage][0]);
        //    pageStatus = "Y";
        //    BindRepeater();
        //}

        //protected void lbtnPrev_Click(object sender, EventArgs e)
        //{
        //    DataTable dtTemp = (DataTable)Session["LabourInfo"];
        //    //back to previous page
        //    CurrentPage -= 1;
        //    hdfReg_DI.Value = Convert.ToString(dtTemp.Rows[CurrentPage][0]);
        //    pageStatus = "Y";
        //    BindRepeater();
        //}

        protected void txtSearch_TextChanged(object sender, EventArgs e)
        {

        }

        protected void lnkShowDetails_Click(object sender, EventArgs e)
        {
            if (ddlLbrType.SelectedValue != "-1")
            {
                fancy.Visible = false;
                btn_bk.Visible = true;
                bank.Visible = true;
                lblFor.Text = ddlLbrType.SelectedItem.Text;
                DataTable dtTemp = (DataTable)Session["LabourInfo"];
            }
            else
            {
                ddlLbrType.Focus();
            }
        }

        protected void lnkBack_Click(object sender, EventArgs e)
        {
            fancy.Visible = true;
            btn_bk.Visible = false;
            bank.Visible = false;
        }

        protected void chkPreUser_CheckedChanged(object sender, EventArgs e)
        {
            if (chkPreUser.Checked == true)
            {
                txtFullName.Visible = false;
                txtPassword.Visible = true;
                txtEmail.Visible = false;
                txtHouseNo.Visible = false;
                txtLocation.Visible = false;
                chkAgree.Visible = false;
                lnkForgotPassword.Visible = true;
                btnBookNow.Enabled = true;

            }
            else
            {
                txtFullName.Visible = true;
                txtPassword.Visible = false;
                txtEmail.Visible = true;
                txtHouseNo.Visible = true;
                txtLocation.Visible = true;
                chkAgree.Visible = true;
                lnkForgotPassword.Visible = false;
                btnBookNow.Enabled = false;
            }
        }

        protected void btnBookNow_Click(object sender, EventArgs e)
        {
            try
            {
                int CustomerID = 0;
                if (chkPreUser.Checked != true)
                {
                    if (ValidateCustomer())
                    {
                        SetPropertiesCustomer();
                        if (txtEmail.Text.Trim() != "")
                        {
                            {
                                string recipientemailto = txtEmail.Text.Trim();
                                string strMessage = "Dear " + txtFullName.Text.Trim() + ",<br> Thank You for your association with us. We are in receipt of your concern with Easy-Labour." +
                                    "<br>Our team tried to get in touch with as per Service Request no.–" + Convert.ToString(Session["Ticket"]) + ". " +
                                    "<br>We will be happy to help you to resolve your issue at a time of your convenience. " +
                                    " <br> Your Login ID :" + txtMobileNo.Text.Trim() + ". <br> Password :" + txtFullName.Text.Trim().Substring(0, 3) + txtMobileNo.Text.Trim().Substring(0, 4) + "" +
                                    "<br>" +
                                    "<br>In case of any further clarification, feel free to call  or write to us at the contacts given in this email.";
                                string strSubject = "Registration Confirmation mail";
                                if (txtEmail.Text.Trim() != "") csGlobalFunction.SendEmail(recipientemailto, strSubject, strMessage);
                            }
                        }
                        CustomerID = objLeads.SaveCustomerData("INSERT");
                    }
                }

                if (Validation())
                {
                    SetProperties(CustomerID);
                    objLeads.SaveData("INSERT");
                    if (chkPreUser.Checked == true)
                    {
                        string strQurey = "select EmailID from tbl_Customer where MobileNo='" + txtMobileNo.Text + "' and Password='" + txtPassword.Text + "'";
                        string Email = Convert.ToString(CrystalConnection.SqlScalartoObj(strQurey));
                        string recipientemailto = Email;
                        string strMessage = "Dear " + txtFullName.Text.Trim() + ",<br> Thank You for your association with us. We are in receipt of your concern with Easy-Labour." +
                            "<br>Our team tried to get in touch with as per Service Request no.–" + Convert.ToString(Session["Ticket"]) + ". " +
                            "<br>We will be happy to help you to resolve your issue at a time of your convenience. " +


                            "<br>In case of any further clarification, feel free to call  or write to us at the contacts given in this email.";
                        string strSubject = "Registration Confirmation mail";
                        if (Email != "") csGlobalFunction.SendEmail(recipientemailto, strSubject, strMessage);
                    }
                    ClearControls();
                    lblMessage.Text = "Your Request have been submitted successfully. Our Executive will contact you shortly. Thank you ";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "LaunchServerSide", "$(function() { SaveSuccess(); });", true);
                    //ScriptManager.RegisterStartupScript(this, this.GetType(), "alertMessage", "alert('Record save successfully.);", true);
                }
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
                if (chkPreUser.Checked != true)
                    objLeads.Customerid = CustomerID;
                else
                    objLeads.Customerid = Convert.ToInt32(Session["CustomerID"]);
                string Date = txtPickDate.Text;
                objLeads.Required_date = Convert.ToDateTime(txtPickDate.Text, System.Globalization.CultureInfo.GetCultureInfo("hi-IN").DateTimeFormat);
                objLeads.Required_time = ddlRequiredTime.SelectedItem.Text;
                objLeads.Status = "NL";
                objLeads.Ticket = Convert.ToString(Session["Ticket"]);
                //objLeads.Supplierid = Convert.ToInt32(Session["UserID"]);
            }
            catch (Exception ex)
            {
                string strFnc = "";
                strFnc = ex.Message;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "CatchMsg", "alert('" + strFnc + "');", true);
            }
        }

        private void SetPropertiesCustomer()
        {

            try
            {
                objLeads.Customerid = 0;
                objLeads.Mobileno = txtMobileNo.Text.Trim();
                objLeads.Name = txtFullName.Text.Trim();
                objLeads.Emailid = txtEmail.Text.Trim();
                objLeads.Address1 = txtHouseNo.Text.Trim();
                objLeads.Address2 = txtLocation.Text.Trim();
                objLeads.Password = txtFullName.Text.Trim().Substring(0, 3) + txtMobileNo.Text.Trim().Substring(0, 4);
                objLeads.Ticket = Convert.ToString(Session["Ticket"]);
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
            int CustomerID = 0;
            if ((txtMobileNo.Text.Length != 10) && (txtMobileNo.Text != ""))
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertMessage", "alert('Please enter valid mobile no.');", true);
                txtMobileNo.Focus();
                return false;
            }

            if (Exist == "Y")
            {
                return false;
            }

            string strQurey = "select Customer_ID from tbl_Customer where MobileNo='" + txtMobileNo.Text + "' and Password='" + txtPassword.Text + "'";
            CustomerID = Convert.ToInt32(CrystalConnection.SqlScalartoObj(strQurey));
            Session["CustomerID"] = CustomerID;
            if (chkPreUser.Checked != true)
            {

                if (CustomerID > 0)
                {
                    return false;
                }
            }
            return true;
        }

        public bool ValidateCustomer()
        {
            string strQurey = "select Customer_ID from tbl_Customer where MobileNo=" + txtMobileNo.Text.Trim() + "";
            int ID = Convert.ToInt32(CrystalConnection.SqlScalartoObj(strQurey));
            Session["CustomerID"] = ID;
            if (ID > 0)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertMessage", "alert('Customer profile already exist with this mobile no.');", true);
                Exist = "Y";
                return false;
            }
            return true;
        }

        private void ClearControls()
        {
            txtPickDate.Text = "";
            txtMobileNo.Text = "";
            txtFullName.Text = "";
            txtEmail.Text = "";
            txtHouseNo.Text = "";
            txtLocation.Text = "";
            chkAgree.Checked = false;
            btnBookNow.Enabled = false;
            Exist = "";
        }

        protected void chkAgree_CheckedChanged(object sender, EventArgs e)
        {
            if (chkAgree.Checked == true)
            {
                btnBookNow.Enabled = true;
            }
            else
            {
                btnBookNow.Enabled = false;
            }
        }
        #endregion

        #region(LGB)
        protected void btnSearchLGB_Click(object sender, EventArgs e)
        {
            try
            {
                if (ddlLbrTypeLGB.SelectedValue != "-1" && txtPincodeLGB.Text.Trim() != "")
                {
                    divDefaultLGB.Visible = false;
                    Bind_LGB_Repeater();
                }
            }
            catch (Exception ex)
            {
                string strFnc = "";
                strFnc = ex.Message;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "CatchMsg", "javascript:AlertMsg('" + strFnc + "');", true);
            }
        }

        protected void lnkShowDetailsLGB_Click(object sender, EventArgs e)
        {
            if (ddlLbrTypeLGB.SelectedValue != "-1")
            {
                LGB.Visible = false;
                LGBFrm.Visible = true;
                LGBbtnbk.Visible = true;
                lblForLGB.Text = ddlLbrTypeLGB.SelectedItem.Text;
                DataTable dtTemp = (DataTable)Session["LabourInfo"];
            }
            else
            {
                ddlLbrTypeLGB.Focus();
            }
        }

        protected void lnkBackLGB_Click(object sender, EventArgs e)
        {
            LGB.Visible = true;
            LGBFrm.Visible = false;
            LGBbtnbk.Visible = false;
        }

        private void Bind_LGB_Repeater()
        {
            string strQuery = " Select Reg_ID,FullName,Image_URL from tbl_LabourRegistration " +

            " where CPincode=" + txtPincodeLGB.Text.Trim() + " and LabourType='" + ddlLbrTypeLGB.SelectedValue + "'";
            DataTable dtLabourInfo = FillDataTable(strQuery);
            if (dtLabourInfo.Rows.Count > 0)
            {
                csGlobalFunction.BindRepeater(ref rptLGB, strQuery);

                Session["LabourInfo"] = dtLabourInfo;
                PagedDataSource objPageDataSource = csGlobalFunction.BindRepeaterWithPagingReports(ref rptLGB, CurrentPageLGB, strQuery, 1);
                CurrentPageLGB = objPageDataSource.CurrentPageIndex;
                ////lblName.Text = "";

                if (objPageDataSource.Count > 0)
                {
                    //dispaly controls if there are pages
                    lbtnPrevLGB.Visible = true;
                    lbtnNextLGB.Visible = true;
                    lblCurrentPageLGB.Visible = true;
                    lblCurrentPageLGB.Text = "Page " +
                      Convert.ToString(CurrentPageLGB + 1) + " of " +
                      Convert.ToString(objPageDataSource.PageCount);
                }
                else
                {
                    //disable controls if there are no pages
                    lbtnPrevLGB.Visible = false;
                    lbtnNextLGB.Visible = false;
                    lblCurrentPageLGB.Visible = false;
                }
                lbtnPrevLGB.Enabled = !objPageDataSource.IsFirstPage;
                lbtnNextLGB.Enabled = !objPageDataSource.IsLastPage;

                LGBRep.Visible = true;
                LGBPrevNext.Visible = true;
                LGBRecordNF.Visible = false;
            }
            else
            {
                LGBRep.Visible = false;
                LGBPrevNext.Visible = false;
                LGBRecordNF.Visible = true;
            }
        }

        protected void rptLGB_DataBinding(object sender, EventArgs e)
        {
            Keys.Clear();
        }

        protected void rptLGB_ItemDataBound(object sender, RepeaterItemEventArgs e)
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

                    DataRow[] dr = dtTemp.Select("Reg_ID=" + hdfRegIDLGB.Value + "");
                    if (dr.Length != 0)
                    {
                        lblName.Text = Convert.ToString(dr[0]["FullName"]);
                    }
                    else
                    {
                        lblName.Text = Convert.ToString(dtTemp.Rows[0]["FullName"]);
                        hdfRegIDLGB.Value = Convert.ToString(dtTemp.Rows[0][0]);
                    }
                }
            }
        }

        public int CurrentPageLGB
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

        protected void lbtnNext_LGB_Click(object sender, EventArgs e)
        {
            DataTable dtTemp = (DataTable)Session["LabourInfo"];
            //go to next page
            CurrentPageLGB += 1;
            hdfRegIDLGB.Value = Convert.ToString(dtTemp.Rows[CurrentPageLGB][0]);
            pageStatus = "Y";
            Bind_LGB_Repeater();
        }

        protected void lbtnPrev_LGB_Click(object sender, EventArgs e)
        {
            DataTable dtTemp = (DataTable)Session["LabourInfo"];
            //back to previous page
            CurrentPageLGB -= 1;
            hdfRegIDLGB.Value = Convert.ToString(dtTemp.Rows[CurrentPageLGB][0]);
            pageStatus = "Y";
            Bind_LGB_Repeater();
        }

        protected void lnkBack_LGB_Click(object sender, EventArgs e)
        {
            LGB.Visible = true;
            LGBbtnbk.Visible = false;
            LGBFrm.Visible = false;
        }

        protected void chkPreUserLGB_CheckedChanged(object sender, EventArgs e)
        {
            if (chkPreUserLGB.Checked == true)
            {
                txtFullNameLGB.Visible = false;
                txtPasswordLGB.Visible = true;
                txtEmailLGB.Visible = false;
                txtHouseNoLGB.Visible = false;
                txtLocationLGB.Visible = false;
                chkAgreeLGB.Visible = false;
                lnkFPLGB.Visible = true;
                btnBookLGB.Enabled = true;

            }
            else
            {
                txtFullNameLGB.Visible = true;
                txtPasswordLGB.Visible = false;
                txtEmailLGB.Visible = true;
                txtHouseNoLGB.Visible = true;
                txtLocationLGB.Visible = true;
                chkAgreeLGB.Visible = true;
                lnkFPLGB.Visible = false;
                btnBookLGB.Enabled = false;
            }
        }

        protected void btnBookLGB_Click(object sender, EventArgs e)
        {
            try
            {
                int CustomerID = 0;
                if (chkPreUserLGB.Checked != true)
                {
                    if (ValidateCustomer_LGB())
                    {
                        SetPropertiesCustomer_LGB();
                        if (txtEmailLGB.Text.Trim() != "")
                        {
                            {
                                string recipientemailto = txtEmailLGB.Text.Trim();
                                string strMessage = "Dear " + txtFullNameLGB.Text.Trim() + ",<br> Thank You for your association with us. We are in receipt of your concern with Easy-Labour." +
                                    "<br>Our team tried to get in touch with as per Service Request no.–" + Convert.ToString(Session["Ticket"]) + ". " +
                                    "<br>We will be happy to help you to resolve your issue at a time of your convenience. " +
                                    " <br> Your Login ID :" + txtMobileLGB.Text.Trim() + ". <br> Password :" + txtFullNameLGB.Text.Trim().Substring(0, 3) + txtMobileLGB.Text.Trim().Substring(0, 4) + "" +
                                    "<br>" +
                                    "<br>In case of any further clarification, feel free to call  or write to us at the contacts given in this email.";
                                string strSubject = "Registration Confirmation mail";
                                if (txtEmail.Text.Trim() != "") csGlobalFunction.SendEmail(recipientemailto, strSubject, strMessage);
                            }
                        }
                        CustomerID = objLeads.SaveCustomerData("INSERT");
                    }
                }

                if (Validation_LGB())
                {
                    SetProperties_LGB(CustomerID);
                    objLeads.SaveData("INSERT");
                    if (chkPreUser.Checked == true)
                    {
                        string strQurey = "select EmailID from tbl_Customer where MobileNo='" + txtMobileLGB.Text + "' and Password='" + txtPasswordLGB.Text + "'";
                        string Email = Convert.ToString(CrystalConnection.SqlScalartoObj(strQurey));
                        string recipientemailto = Email;
                        string strMessage = "Dear " + txtFullNameLGB.Text.Trim() + ",<br> Thank You for your association with us. We are in receipt of your concern with Easy-Labour." +
                            "<br>Our team tried to get in touch with as per Service Request no.–" + Convert.ToString(Session["Ticket"]) + ". " +
                            "<br>We will be happy to help you to resolve your issue at a time of your convenience. " +


                            "<br>In case of any further clarification, feel free to call  or write to us at the contacts given in this email.";
                        string strSubject = "Registration Confirmation mail";
                        if (Email != "") csGlobalFunction.SendEmail(recipientemailto, strSubject, strMessage);
                    }
                    ClearControls_LGB();
                    lblMessage.Text = "Your Request have been submitted successfully. Our Executive will contact you shortly. Thank you ";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "LaunchServerSide", "$(function() { SaveSuccess(); });", true);
                    //ScriptManager.RegisterStartupScript(this, this.GetType(), "alertMessage", "alert('Record save successfully.);", true);
                }
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

        private void SetProperties_LGB(int CustomerID)
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
                objLeads.Labourid = Convert.ToInt32(hdfRegIDLGB.Value);
                if (chkPreUserLGB.Checked != true)
                    objLeads.Customerid = CustomerID;
                else
                    objLeads.Customerid = Convert.ToInt32(Session["CustomerID_LGB"]);
                objLeads.Required_date = Convert.ToDateTime(txtPicDateLGB.Text, System.Globalization.CultureInfo.GetCultureInfo("hi-IN").DateTimeFormat);
                objLeads.Required_time = ddlRequiredTimeLGB.SelectedItem.Text;
                objLeads.Status = "NL";
                objLeads.Ticket = Convert.ToString(Session["Ticket"]);
                //objLeads.Supplierid = Convert.ToInt32(Session["UserID"]);
            }
            catch (Exception ex)
            {
                string strFnc = "";
                strFnc = ex.Message;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "CatchMsg", "alert('" + strFnc + "');", true);
            }
        }

        private void SetPropertiesCustomer_LGB()
        {
            try
            {
                objLeads.Customerid = 0;
                objLeads.Mobileno = txtMobileLGB.Text.Trim();
                objLeads.Name = txtFullNameLGB.Text.Trim();
                objLeads.Emailid = txtEmailLGB.Text.Trim();
                objLeads.Address1 = txtHouseNoLGB.Text.Trim();
                objLeads.Address2 = txtLocationLGB.Text.Trim();
                objLeads.Password = txtFullNameLGB.Text.Trim().Substring(0, 3) + txtMobileLGB.Text.Trim().Substring(0, 4);
                objLeads.Ticket = Convert.ToString(Session["Ticket"]);
            }
            catch (Exception ex)
            {
                string strFnc = "";
                strFnc = ex.Message;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "CatchMsg", "alert('" + strFnc + "');", true);
            }
        }

        public bool Validation_LGB()
        {
            int CustomerID = 0;
            if ((txtMobileLGB.Text.Length != 10) && (txtMobileLGB.Text != ""))
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertMessage", "alert('Please enter valid mobile no.');", true);
                txtMobileLGB.Focus();
                return false;
            }

            if (Exist == "Y")
            {
                return false;
            }

            string strQurey = "select Customer_ID from tbl_Customer where MobileNo='" + txtMobileLGB.Text + "' and Password='" + txtPasswordLGB.Text + "'";
            CustomerID = Convert.ToInt32(CrystalConnection.SqlScalartoObj(strQurey));
            Session["CustomerID_LGB"] = CustomerID;
            if (chkPreUserLGB.Checked != true)
            {

                if (CustomerID > 0)
                {
                    return false;
                }
            }
            return true;
        }

        public bool ValidateCustomer_LGB()
        {
            string strQurey = "select Customer_ID from tbl_Customer where MobileNo=" + txtMobileLGB.Text.Trim() + "";
            int ID = Convert.ToInt32(CrystalConnection.SqlScalartoObj(strQurey));

            if (ID > 0)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertMessage", "alert('Customer profile already exist with this mobile no.');", true);
                Exist = "Y";
                return false;
            }
            return true;
        }

        private void ClearControls_LGB()
        {
            txtPicDateLGB.Text = "";
            txtMobileLGB.Text = "";
            txtFullNameLGB.Text = "";
            txtEmailLGB.Text = "";
            txtHouseNoLGB.Text = "";
            txtLocationLGB.Text = "";
            chkAgreeLGB.Checked = false;
            btnBookLGB.Enabled = false;
            Exist = "";
        }

        protected void chkAgreeLGB_CheckedChanged(object sender, EventArgs e)
        {
            if (chkAgreeLGB.Checked == true)
            {
                btnBookLGB.Enabled = true;
            }
            else
            {
                btnBookLGB.Enabled = false;
            }
        }


        #endregion

        #region(IL)

        protected void btnSearchIL_Click(object sender, EventArgs e)
        {
            try
            {
                if (ddlLbrTypeIL.SelectedValue != "-1" && txtPinCodeIL.Text.Trim() != "")
                {
                    divDefaultIL.Visible = false;
                    Bind_IL_Repeater();
                }
            }
            catch (Exception ex)
            {
                string strFnc = "";
                strFnc = ex.Message;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "CatchMsg", "javascript:AlertMsg('" + strFnc + "');", true);
            }
        }

        protected void lnkShowDetailsIL_Click(object sender, EventArgs e)
        {
            if (ddlLbrTypeIL.SelectedValue != "-1")
            {
                IL.Visible = false;
                ILbtnbk.Visible = true;
                ILFrm.Visible = true;

                lblForIL.Text = ddlLbrTypeIL.SelectedItem.Text;
                DataTable dtTemp = (DataTable)Session["LabourInfo"];
            }
            else
            {
                ddlLbrTypeIL.Focus();
            }

        }

        protected void lnkBackIL_Click(object sender, EventArgs e)
        {
            IL.Visible = true;
            ILbtnbk.Visible = false;
            ILFrm.Visible = false;
        }

        private void Bind_IL_Repeater()
        {
            string strQuery = " Select Reg_ID,FullName,Image_URL from tbl_LabourRegistration " +

            " where CPincode=" + txtPinCodeIL.Text.Trim() + " and LabourType='" + ddlLbrTypeIL.SelectedValue + "'";
            DataTable dtLabourInfo = FillDataTable(strQuery);
            if (dtLabourInfo.Rows.Count > 0)
            {
                csGlobalFunction.BindRepeater(ref rptIL, strQuery);

                Session["LabourInfo"] = dtLabourInfo;
                PagedDataSource objPageDataSource = csGlobalFunction.BindRepeaterWithPagingReports(ref rptIL, CurrentPageIL, strQuery, 1);
                CurrentPageIL = objPageDataSource.CurrentPageIndex;
                ////lblName.Text = "";

                if (objPageDataSource.Count > 0)
                {
                    //dispaly controls if there are pages
                    lbtnPrevIL.Visible = true;
                    IbtnNextIL.Visible = true;
                    lblCurrentPageIL.Visible = true;
                    lblCurrentPageIL.Text = "Page " +
                      Convert.ToString(CurrentPageIL + 1) + " of " +
                      Convert.ToString(objPageDataSource.PageCount);
                }
                else
                {
                    //disable controls if there are no pages
                    lbtnPrevIL.Visible = false;
                    IbtnNextIL.Visible = false;
                    lblCurrentPageIL.Visible = false;
                }
                lbtnPrevIL.Enabled = !objPageDataSource.IsFirstPage;
                IbtnNextIL.Enabled = !objPageDataSource.IsLastPage;

                ILRep.Visible = true;
                ILPrevNext.Visible = true;
                ILRecordNF.Visible = false;
            }
            else
            {
                ILRep.Visible = false;
                ILPrevNext.Visible = false;
                ILRecordNF.Visible = true;
            }
        }

        protected void rptIL_DataBinding(object sender, EventArgs e)
        {
            Keys.Clear();
        }

        protected void rptIL_ItemDataBound(object sender, RepeaterItemEventArgs e)
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

                    DataRow[] dr = dtTemp.Select("Reg_ID=" + hdfRegIDLGB.Value + "");
                    if (dr.Length != 0)
                    {
                        lblName.Text = Convert.ToString(dr[0]["FullName"]);
                    }
                    else
                    {
                        lblName.Text = Convert.ToString(dtTemp.Rows[0]["FullName"]);
                        hfRegIDIL.Value = Convert.ToString(dtTemp.Rows[0][0]);
                    }
                }
            }
        }

        public int CurrentPageIL
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

        protected void lbtnPrevIL_Click(object sender, EventArgs e)
        {
            DataTable dtTemp = (DataTable)Session["LabourInfo"];
            //back to previous page
            CurrentPageIL -= 1;
            hfRegIDIL.Value = Convert.ToString(dtTemp.Rows[CurrentPageIL][0]);
            pageStatus = "Y";
            Bind_IL_Repeater();
        }

        protected void IbtnNextIL_Click(object sender, EventArgs e)
        {
            DataTable dtTemp = (DataTable)Session["LabourInfo"];
            //go to next page
            CurrentPageIL += 1;
            hfRegIDIL.Value = Convert.ToString(dtTemp.Rows[CurrentPageIL][0]);
            pageStatus = "Y";
            Bind_IL_Repeater();
        }

        protected void chkPreUserIL_CheckedChanged(object sender, EventArgs e)
        {
            if (chkPreUserIL.Checked == true)
            {
                txtFullNameIL.Visible = false;
                txtPasswordIL.Visible = true;
                txtEmailIL.Visible = false;
                txtHouseIL.Visible = false;
                txtLocationIL.Visible = false;
                chkAgreeIL.Visible = false;
                lbtnFPasswordIL.Visible = true;
                btnBookNowIL.Enabled = true;

            }
            else
            {
                txtFullNameIL.Visible = true;
                txtPasswordIL.Visible = false;
                txtEmailIL.Visible = true;
                txtHouseIL.Visible = true;
                txtLocationIL.Visible = true;
                chkAgreeIL.Visible = true;
                lbtnFPasswordIL.Visible = false;
                btnBookNowIL.Enabled = false;
            }

        }

        protected void btnBookNowIL_Click(object sender, EventArgs e)
        {
            try
            {
                int CustomerID = 0;
                if (chkPreUserIL.Checked != true)
                {
                    if (ValidateCustomer_IL())
                    {
                        SetPropertiesCustomer_IL();
                        if (txtEmailIL.Text.Trim() != "")
                        {
                            {
                                string recipientemailto = txtEmailIL.Text.Trim();
                                string strMessage = "Dear " + txtFullNameIL.Text.Trim() + ",<br> Thank You for your association with us. We are in receipt of your concern with Easy-Labour." +
                                    "<br>Our team tried to get in touch with as per Service Request no.–" + Convert.ToString(Session["Ticket"]) + ". " +
                                    "<br>We will be happy to help you to resolve your issue at a time of your convenience. " +
                                    " <br> Your Login ID :" + txtMobileIL.Text.Trim() + ". <br> Password :" + txtFullNameIL.Text.Trim().Substring(0, 3) + txtMobileIL.Text.Trim().Substring(0, 4) + "" +
                                    "<br>" +
                                    "<br>In case of any further clarification, feel free to call  or write to us at the contacts given in this email.";
                                string strSubject = "Registration Confirmation mail";
                                if (txtEmailIL.Text.Trim() != "") csGlobalFunction.SendEmail(recipientemailto, strSubject, strMessage);
                            }
                        }
                        CustomerID = objLeads.SaveCustomerData("INSERT");
                    }
                }

                if (Validation_IL())
                {
                    SetProperties_IL(CustomerID);
                    objLeads.SaveData("INSERT");
                    if (chkPreUser.Checked == true)
                    {
                        string strQurey = "select EmailID from tbl_Customer where MobileNo='" + txtMobileIL.Text + "' and Password='" + txtPasswordIL.Text + "'";
                        string Email = Convert.ToString(CrystalConnection.SqlScalartoObj(strQurey));
                        string recipientemailto = Email;
                        string strMessage = "Dear " + txtFullNameIL.Text.Trim() + ",<br> Thank You for your association with us. We are in receipt of your concern with Easy-Labour." +
                            "<br>Our team tried to get in touch with as per Service Request no.–" + Convert.ToString(Session["Ticket"]) + ". " +
                            "<br>We will be happy to help you to resolve your issue at a time of your convenience. " +


                            "<br>In case of any further clarification, feel free to call  or write to us at the contacts given in this email.";
                        string strSubject = "Registration Confirmation mail";
                        if (Email != "") csGlobalFunction.SendEmail(recipientemailto, strSubject, strMessage);
                    }
                    ClearControls_IL();
                    lblMessage.Text = "Your Request have been submitted successfully. Our Executive will contact you shortly. Thank you ";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "LaunchServerSide", "$(function() { SaveSuccess(); });", true);
                    //ScriptManager.RegisterStartupScript(this, this.GetType(), "alertMessage", "alert('Record save successfully.);", true);
                }
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

        private void SetProperties_IL(int CustomerID)
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
                objLeads.Labourid = Convert.ToInt32(hfRegIDIL.Value);
                if (chkPreUserIL.Checked != true)
                    objLeads.Customerid = CustomerID;
                else
                    objLeads.Customerid = Convert.ToInt32(Session["CustomerID_IL"]);
                objLeads.Required_date = Convert.ToDateTime(txtPicDateIL.Text, System.Globalization.CultureInfo.GetCultureInfo("hi-IN").DateTimeFormat);
                objLeads.Required_time = ddlRequiredTimeIL.SelectedItem.Text;
                objLeads.Status = "NL";
                objLeads.Ticket = Convert.ToString(Session["Ticket"]);
                //objLeads.Supplierid = Convert.ToInt32(Session["UserID"]);
            }
            catch (Exception ex)
            {
                string strFnc = "";
                strFnc = ex.Message;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "CatchMsg", "alert('" + strFnc + "');", true);
            }
        }

        private void SetPropertiesCustomer_IL()
        {
            try
            {
                objLeads.Customerid = 0;
                objLeads.Mobileno = txtMobileIL.Text.Trim();
                objLeads.Name = txtFullNameIL.Text.Trim();
                objLeads.Emailid = txtEmailIL.Text.Trim();
                objLeads.Address1 = txtHouseIL.Text.Trim();
                objLeads.Address2 = txtLocationIL.Text.Trim();
                objLeads.Password = txtFullNameIL.Text.Trim().Substring(0, 3) + txtMobileIL.Text.Trim().Substring(0, 4);
                objLeads.Ticket = Convert.ToString(Session["Ticket"]);
            }
            catch (Exception ex)
            {
                string strFnc = "";
                strFnc = ex.Message;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "CatchMsg", "alert('" + strFnc + "');", true);
            }
        }

        public bool Validation_IL()
        {
            int CustomerID = 0;
            if ((txtMobileIL.Text.Length != 10) && (txtMobileIL.Text != ""))
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertMessage", "alert('Please enter valid mobile no.');", true);
                txtMobileIL.Focus();
                return false;
            }

            if (Exist == "Y")
            {
                return false;
            }

            string strQurey = "select Customer_ID from tbl_Customer where MobileNo='" + txtMobileIL.Text + "' and Password='" + txtPasswordIL.Text + "'";
            CustomerID = Convert.ToInt32(CrystalConnection.SqlScalartoObj(strQurey));
            Session["CustomerID_IL"] = CustomerID;
            if (chkPreUserIL.Checked != true)
            {

                if (CustomerID > 0)
                {
                    return false;
                }
            }
            return true;
        }

        public bool ValidateCustomer_IL()
        {
            string strQurey = "select Customer_ID from tbl_Customer where MobileNo=" + txtMobileIL.Text.Trim() + "";
            int ID = Convert.ToInt32(CrystalConnection.SqlScalartoObj(strQurey));

            if (ID > 0)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertMessage", "alert('Customer profile already exist with this mobile no.');", true);
                Exist = "Y";
                return false;
            }
            return true;
        }

        private void ClearControls_IL()
        {
            txtPicDateIL.Text = "";
            txtMobileIL.Text = "";
            txtFullNameIL.Text = "";
            txtEmailIL.Text = "";
            txtHouseIL.Text = "";
            txtLocationIL.Text = "";
            chkAgreeIL.Checked = false;
            btnBookNowIL.Enabled = false;
            Exist = "";
        }

        protected void chkAgreeIL_CheckedChanged(object sender, EventArgs e)
        {
            if (chkAgreeIL.Checked == true)
            {
                btnBookNowIL.Enabled = true;
            }
            else
            {
                btnBookNowIL.Enabled = false;
            }
        }

        #endregion

        protected void lnkForgotPassword_Click(object sender, EventArgs e)
        {
            try
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "LaunchServerSide", "$(function() { LoginPass(); });", true);
            }
            catch (Exception ex)
            {
                string strFnc = "";
                strFnc = ex.Message;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "CatchMsg", "javascript:AlertMsg('" + strFnc + "');", true);
            }
        }

        protected void lnkFPLGB_Click(object sender, EventArgs e)
        {
            try
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "LaunchServerSide", "$(function() { LoginPass(); });", true);
            }
            catch (Exception ex)
            {
                string strFnc = "";
                strFnc = ex.Message;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "CatchMsg", "javascript:AlertMsg('" + strFnc + "');", true);
            }
        }













    }
}