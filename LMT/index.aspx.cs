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
using LMT.User;

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
        csUserRegistration csuserRegistration = new csUserRegistration();
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
            if (txtMobile.Text.Trim() != "")
            {
                Session["Ticket"] = txtMobile.Text.Substring(0, 3) + GID.ToString().Substring(0, 9);
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

        #region(HG)//House hold section
        protected void Button3_Click(object sender, EventArgs e)//search image event.
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
                ScriptManager.RegisterStartupScript(this, this.GetType(), "CatchMsg", "javascript:Alert('" + strFnc + "');", true);
            }
        }

        public static DataTable FillDataTable(string query)
        {
            DataTable dtFillData;
            dtFillData = CrystalConnection.CreateDataTableWithoutTransaction(query);
            return dtFillData;
        }
        //list of labours on pin code and labour type
        private void BindRepeater()
        {
            string strQuery = " Select Reg_ID,FullName,Image_URL from tbl_LabourRegistration " +
            " where CPincode=" + txtPincode.Text.Trim() + " and LabourType='" + ddlLbrType.SelectedValue + "'";
            DataTable dtLabourInfo = FillDataTable(strQuery);
            csGlobalFunction.BindRepeater(ref rptLabourInformation, strQuery);
            HS_rep.Visible = true;
            HS_RecordNF.Visible = false;
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

        protected void rptLabourInformation_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "select")
            {
                if (ddlLbrType.SelectedValue != "-1")
                {
                    HiddenField rpt_hdfReg_DI = ((HiddenField)e.Item.FindControl("hfReg_ID"));
                    fancy.Visible = false;
                    btn_bk.Visible = true;
                    bank.Visible = true;
                    lblFor.Text = ddlLbrType.SelectedItem.Text;
                    hdfReg_DI.Value = rpt_hdfReg_DI.Value;//e.CommandArgument.ToString();// to get the labour id
                    DataTable dtTemp = (DataTable)Session["LabourInfo"];
                }
                else
                {
                    ddlLbrType.Focus();
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
                txtUserName.Visible = true;
                txtPassword.Visible = true;
                txtMobile.Visible = false;//new added
                txtEmail.Visible = false;
                txtHouseNo.Visible = false;
                txtLocation.Visible = false;
                chkAgree.Visible = false;
                lnkForgotPassword.Visible = true;
                btnBookNow.Enabled = true;

            }
            else
            {
                txtUserName.Visible = true;
                txtPassword.Visible = false;
                txtEmail.Visible = true;
                txtHouseNo.Visible = true;
                txtLocation.Visible = true;
                chkAgree.Visible = true;
                txtMobile.Visible = true;//new added
                lnkForgotPassword.Visible = false;
                btnBookNow.Enabled = false;
            }
        }

        protected void btnBookNow_Click(object sender, EventArgs e)
        {
            try
            {
                btnBookNow.Enabled = false;
                if (chkPreUser.Checked != true)//New Lead with silent User Registration. check in again
                {
                    if (ValidateUserName())
                    {
                        SetProperties_UserRegistration();
                        int userId = csuserRegistration.ExecuteProcedure("INSERT");//this will excute the proc "usp_UserRegProc" with insert mode and userid will be the output after registration process.
                        try
                        {
                            SetProperties_NewLead(userId);
                            objLeads.SaveData("INSERT");//this will excute the proc "usp_Leads" with insert mode
                            fnSendEmail(txtEmail.Text.Trim());
                            lblMessage.Text = "Your Request have been submitted successfully. Our Executive will contact you shortly. Thank you ";
                            LoginNewUser();

                        }
                        catch
                        {
                            //Roll Back Registration process
                        }
                    }
                }
                else
                {
                    if (Validation_Returning_User())
                    {
                        SetProperties_NewLead(Convert.ToInt32(Session["userID"]));
                        objLeads.SaveData("INSERT");

                        string strMessage = "Dear Customer,<br> Thank You for your association with us. We are in receipt of your concern with Easy-Labour." +
                       "<br>Our team tried to get in touch with as per Service Request no.–" + objLeads.Ticket + ". " +
                       "<br>We will be happy to help you to resolve your issue at a time of your convenience. " +
                       "<br>In case of any further clarification, feel free to call  or write to us at the contacts given in this email.";
                        LMT.Customer.AddNewCase.EmailSendDelegate emailSendDelegate = new LMT.Customer.AddNewCase.EmailSendDelegate(csGlobalFunction.SendEmail);
                        emailSendDelegate.BeginInvoke(Session["userEmail"].ToString(), "Lead Confirmation mail", strMessage, null, null);

                        //lblMessage.Text = "Your Request have been submitted successfully. Our Executive will contact you shortly. Thank you ";
                        //ScriptManager.RegisterStartupScript(this, this.GetType(), "LaunchServerSide", "$(function() { SaveSuccess(); });", true);

                        if (Session["UserType"].ToString() == "Admin")
                        {
                            Response.Redirect("~/MasterPages/AdminMenuboard.aspx");
                        }
                        else if (Session["UserType"].ToString() == "Supplier")
                        {
                            Response.Redirect("~/MasterPages/SupplierMenuboard.aspx");
                        }
                        else if (Session["UserType"].ToString() == "Customer")
                        {
                            Response.Redirect("~/Customer/AddNewCase.aspx");
                        }
                        else
                        {
                            Response.Redirect("~/login.aspx");

                        }
                    }
                }
            }
            catch (Exception ex)
            {
                string strFnc = "";
                strFnc = ex.Message;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "CatchMsg", "alert('" + strFnc + "');", true);
            }
            finally
            {
                btnBookNow.Enabled = true;
            }

        }

        private void SetProperties_UserRegistration()
        {
            try
            {
                Random RND = new Random();
                csuserRegistration.USERNAME = txtUserName.Text;
                csuserRegistration.LOGINNAME = "";//this is not in use 
                csuserRegistration.PWD = csuserRegistration.EncodePasswordToBase64("Welcome" + RND.Next(1, 99999).ToString().PadLeft(5, '0'));
                csuserRegistration.USERTYPEID = 4;//4[Customer] is fixed for the Guest user type and normal user, we are registering an user as a guest user from this function.
                csuserRegistration.USERCATEGORYID = 1;//this is the fixed Id not in used, 1 means all access but not is used as of now.
                csuserRegistration.Emailid = txtEmail.Text.Trim();
                csuserRegistration.ISVERIFY = "Y";//by default we are saving it Y as of now later on we need to change it accordingly.
                csuserRegistration.Phoneno = txtMobile.Text.Trim();
                csuserRegistration.permanentAdress = txtHouseNo.Text.Trim() + ", " + txtLocation.Text.Trim();

            }
            catch (Exception ex)
            {
                string strFnc = "";
                strFnc = ex.Message;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "CatchMsg", "javascript:AlertMsg('" + strFnc + "');", true);
            }
        }

        private void SetProperties_NewLead(int userId)
        {
            try
            {
                Random RND = new Random();
                objLeads.Labourid = Convert.ToInt32(hdfReg_DI.Value);//this is the labour Id named as hf Reg DI not sure why it is named like this.
                objLeads.Customerid = userId;
                objLeads.Required_date = Convert.ToDateTime(txtPickDate.Text, System.Globalization.CultureInfo.GetCultureInfo("hi-IN").DateTimeFormat);
                objLeads.Required_time = ddlRequiredTime.SelectedItem.Text;
                objLeads.Status = "NL";
                objLeads.Ticket = "REQ" + RND.Next(1, 99999).ToString().PadLeft(5, '0');
                objLeads.Lead_Address = txtHouseNo.Text.Trim() + ", " + txtLocation.Text.Trim();
                //objLeads.Asign= this will be get from the SP via using labour Id
                //Description
                //

            }
            catch (Exception ex)
            {
                string strFnc = "";
                strFnc = ex.Message;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "CatchMsg", "alert('" + strFnc + "');", true);
            }
        }

        public void fnSendEmail(string Email = "")
        {
            //For User 
            string strMessage = "Dear Subscriber,<br> Your registration is comfirmed.<br> Your Login ID :" + txtUserName.Text.Trim() + ". <br> Password :" + csLogin.DecodeFrom64(csuserRegistration.PWD) + "";
            string strSubject = "Registration Confirmation mail";
            LMT.User.UserRegistration.MailDelegate mailDelegate = new LMT.User.UserRegistration.MailDelegate(csGlobalFunction.SendHTMLEmail);
            mailDelegate.BeginInvoke(Email == "" ? Session["userEmail"].ToString() : Email, strSubject, txtUserName.Text.Trim(), csLogin.DecodeFrom64(csuserRegistration.PWD), null, null);

            //For Lead
            string strLeadMessage = "Dear Customer,<br> Thank You for your association with us. We are in receipt of your concern with Easy-Labour." +
                     "<br>Our team tried to get in touch with as per Service Request no.–" + objLeads.Ticket + ". " +
                     "<br>We will be happy to help you to resolve your issue at a time of your convenience. " +
                     "<br>In case of any further clarification, feel free to call  or write to us at the contacts given in this email.";
            LMT.Customer.AddNewCase.EmailSendDelegate emailSendDelegate = new LMT.Customer.AddNewCase.EmailSendDelegate(csGlobalFunction.SendEmail);
            emailSendDelegate.BeginInvoke(Email == "" ? Session["userEmail"].ToString() : Email, "Lead Confirmation mail", strLeadMessage, null, null);
        }

        public bool Validation_Returning_User()
        {
            if ((txtUserName.Text.Trim() == ""))
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertMessage", "alert('Please enter valid Username');", true);
                txtMobile.Focus();
                return false;
            }
            csLogin objLogin = new csLogin();
            csGlobal globaldata = new csGlobal();
            DataTable dt = new DataTable();
            dt = objLogin.ExecuteProcedure(txtUserName.Text);
            if (dt.Rows.Count > 0)//if we get some data in data table then only we will check password
            {
                if (txtPassword.Text.Trim() == csLogin.DecodeFrom64(dt.Rows[0]["Pwd"].ToString().Trim()))
                {
                    Session["user"] = "user:Desme-BD";
                    Session["UserName"] = dt.Rows[0]["UserName"].ToString();
                    Session["UserType"] = dt.Rows[0]["UserType"].ToString();
                    Session["UserCategory"] = dt.Rows[0]["UserCategory"].ToString();
                    Session["UserID"] = dt.Rows[0]["UserID"].ToString();
                    Session["userEmail"] = dt.Rows[0]["EmailID"].ToString();
                    globaldata._userID = Convert.ToDecimal(dt.Rows[0]["UserID"]);
                    globaldata.UserTypedata = dt.Rows[0]["UserType"].ToString();
                    globaldata.UserCategorydata = dt.Rows[0]["UserCategory"].ToString();
                    return true;
                }
                else//In this case we can drop an email to user that some one is trying to access your account without your permission please confirm if you are aware of this login  
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertMessage1", "alert('Please check your password and try again!');", true);
                    return false;
                }
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertMessage2", "alert('" + txtUserName.Text + " does not exist in our system!');", true);
                return false;
            }
            //string strQurey = "select Customer_ID from tbl_Customer where MobileNo='" + txtMobile.Text + "' and Password='" + txtPassword.Text + "'";
            //CustomerID = Convert.ToInt32(CrystalConnection.SqlScalartoObj(strQurey));
            //Session["CustomerID"] = CustomerID;
            //if (chkPreUser.Checked != true)
            //{

            //    if (CustomerID > 0)
            //    {
            //        return false;
            //    }
            //}
        }

        public bool ValidateUserName()
        {
            string strQurey = "select UserID from tblUserRegistration where UserName='" + txtUserName.Text.Trim() + "'";
            int ID = Convert.ToInt32(CrystalConnection.SqlScalartoObj(strQurey));
            Session["CustomerID"] = ID;
            if (ID > 0)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertMessage", "alert('User profile already exist with this username.');", true);
                return false;
            }
            return true;
        }

        private void ClearControls()
        {
            txtPickDate.Text = "";
            txtMobile.Text = "";
            txtUserName.Text = "";
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

        private void LoginNewUser()
        {
            csLogin objLogin = new csLogin();
            csGlobal globaldata = new csGlobal();
            DataTable dt = new DataTable();
            dt = objLogin.ExecuteProcedure(txtUserName.Text);
            if (dt.Rows.Count > 0)//if we get some data in data table then only we will check password
            {
                //if (txtPassword.Text == csLogin.DecodeFrom64(dt.Rows[0]["Pwd"].ToString()))
                //{
                Session["user"] = "user:Desme-BD";
                Session["UserName"] = dt.Rows[0]["UserName"].ToString();
                Session["UserType"] = dt.Rows[0]["UserType"].ToString();
                Session["UserCategory"] = dt.Rows[0]["UserCategory"].ToString();
                Session["UserID"] = dt.Rows[0]["UserID"].ToString();
                Session["userEmail"] = dt.Rows[0]["EmailID"].ToString();
                globaldata._userID = Convert.ToDecimal(dt.Rows[0]["UserID"]);
                globaldata.UserTypedata = dt.Rows[0]["UserType"].ToString();
                globaldata.UserCategorydata = dt.Rows[0]["UserCategory"].ToString();

                //if (Session["UserType"].ToString() == "Super Admin")
                //{
                //    Response.Redirect("~/MasterPages/MenuBoard.aspx");
                //}
                //else 
                if (Session["UserType"].ToString() == "Admin")
                {
                    Response.Redirect("~/MasterPages/AdminMenuboard.aspx");
                }
                else if (Session["UserType"].ToString() == "Supplier")
                {
                    Response.Redirect("~/MasterPages/SupplierMenuboard.aspx");
                }
                else if (Session["UserType"].ToString() == "Customer")
                {
                    Response.Redirect("~/Customer/AddNewCase.aspx");
                }
                else
                {
                    Response.Redirect("~/login.aspx");

                }
                //}
                //else//In this case we can drop an email to user that some one is trying to access your account without your permission please confirm if you are aware of this login  
                //{
                //    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertMessage1", "alert('Please check your password and try again!');", true);
                //}
            }
        }

        //private bool ValidateData()
        //{
        //    if (txtPwd.Text.Trim() != txtConfPwd.Text.Trim())
        //    {
        //        txtConfPwd.Focus();
        //        return false;
        //    }
        //    if (txtEmail.Text != "")
        //    {

        //        Regex reg = new Regex(@"^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$");
        //        Match isMatch = reg.Match(txtEmail.Text);
        //        if (!isMatch.Success)
        //        {
        //            ScriptManager.RegisterStartupScript(this, this.GetType(), "alertMessage", "alert('Please enter valid Email.');", true);
        //            txtEmail.Focus();
        //            btnSubmit.Enabled = true;
        //            return (false);
        //        }
        //    }
        //    if (ddlUserType.SelectedValue == "-1")
        //    {
        //        ScriptManager.RegisterStartupScript(this, this.GetType(), "alertMessage", "alert('Please select user type.');", true);
        //        btnSubmit.Enabled = true;
        //        return false;
        //    }

        //    if (ddlUserCategory.SelectedValue == "-1")
        //    {
        //        ScriptManager.RegisterStartupScript(this, this.GetType(), "alertMessage", "alert('Please select user category.');", true);
        //        btnSubmit.Enabled = true;
        //        return false;
        //    }
        //    //string strQuery = "Select COUNT(UserID) from tblUserRegistration where EmailID='" + txtEmail.Text.Trim() + "'";
        //    int CountID = 0;
        //    CountID = objUserRegistration.SP_ValidateCredential(txtEmail.Text, 1);
        //    if (CountID > 0)
        //    {
        //        ScriptManager.RegisterStartupScript(this, this.GetType(), "alertMessage", "alert('User already exist with this email id. Try another email id to register.');", true);
        //        btnSubmit.Enabled = true;
        //        return false;
        //    }
        //    else if (CountID == 100)
        //    {
        //        ScriptManager.RegisterStartupScript(this, this.GetType(), "alertMessage", "alert('Please refresh and try again later.');", true);
        //        btnSubmit.Enabled = true;
        //        return false;
        //    }
        //    return true;
        //}

        //public void SilentRegistration()
        //{
        //    try
        //    {

        //        if (ValidateData())
        //        {
        //            SetProperties_UserRegistration();
        //            int userID = csuserRegistration.ExecuteProcedure("INSERT", 0);

        //            //SetPropertiesCustomer_IL(userID);
        //            //objLeads.SaveCustomerData("INSERT");

        //            string strMessage = "Dear Subscriber,<br> Your registration is comfirmed.<br> Your Login ID :" + txtLoginName.Text.Trim() + ". <br> Password :" + txtPwd.Text.Trim() + "";
        //            string strSubject = "Registration Confirmation mail";

        //            LMT.User.UserRegistration.MailDelegate mailDelegate = new LMT.User.UserRegistration.MailDelegate(csGlobalFunction.SendHTMLEmail);
        //            mailDelegate.BeginInvoke(txtEmail.Text.Trim(), strSubject, txtLoginName.Text.Trim(), txtPwd.Text.Trim(), null, null);

        //            //ScriptManager.RegisterStartupScript(this, this.GetType(), "alertMessage", "alert('You are sign-up successfully and your user id and password will be send to your mail id with in 2-5 minutes.');", true);
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        string strFnc = "";
        //        strFnc = ex.Message;
        //        ScriptManager.RegisterStartupScript(this, this.GetType(), "CatchMsg", "javascript:AlertMsg('" + strFnc + "');", true);
        //    }
        //}

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