using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;
using LMT.BusinessLogic;
using System.Collections;
using System.IO;
using LMT.ClassGlobal;
using System.Text.RegularExpressions;
using CrystalDatabase;

namespace LMT.User
{
    public partial class UserRegistration : System.Web.UI.Page
    {
        csGlobal globaldata = new csGlobal();
        DataSet dsFillData;
        csUserRegistration objUserRegistration = new csUserRegistration();
        csDropDownFunction objDropDown = new csDropDownFunction();
        csImageUpload objImg = new csImageUpload();
        csLeads objLeads = new csLeads();
        Hashtable Keys
        {
            get
            {
                if (ViewState["Keys"] == null)
                    ViewState["Keys"] = new Hashtable();
                return (Hashtable)ViewState["Keys"];
            }
        }
        public delegate void MailDelegate(string recipientemailto, string strSubject, string username, string password);
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    if (Request.QueryString["Mode"] != null && Request.QueryString["ID"] != null)
                    {
                        lblopMode.Text = Request.QueryString["Mode"].ToString();
                        lblUserID.Text = Request.QueryString["ID"].ToString();
                    }
                    if (lblopMode.Text.ToUpper() == globaldata._viewMode)
                        btnSubmit.Visible = false;
                    objDropDown.FillDropDown(ref ddlUserType, "Select UserTypeID,UserType From tblUserType", "UserType", "UserTypeID", "Order by UserType", "WHERE IsVerify='Y' and UserType not like 'Super Admin'");
                    objDropDown.FillDropDown(ref ddlUserCategory, "Select UserCategoryID,UserCategory From tblUserCategory", "UserCategory", "UserCategoryID", "Order By UserCategory", "Where IsVerify='Y' and UserCategory not like 'A'");
                }
            }
            catch (Exception ex)
            {
                string strFnc = "";
                strFnc = ex.Message;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "CatchMsg", "javascript:AlertMsg('" + strFnc + "');", true);
            }
        }
        //private void UserImageUpload()
        //{
        //    try
        //    {
        //        if (UserPicUploader.HasFile)
        //        {
        //            if (UserPicUploader.PostedFile.ContentLength < 30720)
        //            {
        //                string Userfilename = txtLoginName.Text.Trim();
        //                string extension = Path.GetExtension(UserPicUploader.PostedFile.FileName);
        //                if (extension == ".jpg" || extension == ".png" || extension == ".gif")
        //                {
        //                    UserPicUploader.SaveAs(Server.MapPath("~/User/OtherUserImage/" + Userfilename + ".jpg"));
        //                    string UserImgPath = @"..\User\OtherUserImage\" + Userfilename + ".jpg";
        //                    //Session["StdFatherImgPath"] = UserImgPath;
        //                    UserImageShow(UserImgPath);
        //                }
        //                else ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "javascript:AlertMsg('This file Extension is not allowed.');", true);
        //            }
        //            else ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "javascript:AlertMsg('File Size Should be Less then 30KB.');", true);

        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        string strFnc = "";
        //        strFnc = ex.Message;
        //        ScriptManager.RegisterStartupScript(this, this.GetType(), "CatchMsg", "javascript:AlertMsg('" + strFnc + "');", true);
        //    }
        //}
        private void UserImageShow(string UserImgPath)
        {
            //UserPicControl.ImageUrl = UserImgPath;
        }
        protected void btnSave_Click(object sender, ImageClickEventArgs e)
        {
            try
            {
                
                if (ValidateData())
                {
                    SetProperties();
                    int userID = objUserRegistration.ExecuteProcedure("INSERT", 0);
                    if (ddlUserType.SelectedValue == "4")// && ddlUserCategory.SelectedValue == "4")
                    {
                        SetPropertiesCustomer_IL(userID);
                        objLeads.SaveCustomerData("INSERT");
                    }
                    if (txtEmail.Text.Trim() != "")
                    {
                        {
                            string strMessage = "Dear Subscriber,<br> Your registration is comfirmed.<br> Your User Name :" + txtUserName.Text.Trim() + ". <br> Password :" + txtPwd.Text.Trim() + "";
                            string strSubject = "Registration Confirmation mail";
                            if (txtEmail.Text.Trim() != "")
                            {
                                MailDelegate mailDelegate = new MailDelegate(csGlobalFunction.SendHTMLEmail);
                                mailDelegate.BeginInvoke(txtEmail.Text.Trim(), strSubject, txtUserName.Text.Trim(), txtPwd.Text.Trim(), null, null);
                                //csGlobalFunction.SendEmail(recipientemailto, strSubject, strMessage);
                            }
                        }
                    }
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertMessage", "alert('You are sign-up successfully and your user id and password will be send to your mail id with in 2-5 minutes.');", true);
                    ClearControl();
                    //ScriptManager.RegisterStartupScript(this, this.GetType(), "alertMessage", strFnc, true);
                }
              
            }
            catch (Exception ex)
            {
                string strFnc = "";
                strFnc = ex.Message;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "CatchMsg", "javascript:AlertMsg('" + strFnc + "');", true);
            }

        }
        private void SetProperties()
        {
            try
            {
                objUserRegistration.USERNAME = txtUserName.Text;
                objUserRegistration.LOGINNAME = txtUserName.Text;
                objUserRegistration.PWD = objUserRegistration.EncodePasswordToBase64(txtPwd.Text);
                objUserRegistration.USERTYPEID = Convert.ToDecimal(ddlUserType.SelectedValue);
                objUserRegistration.USERCATEGORYID = 1;// Convert.ToDecimal(ddlUserCategory.SelectedValue);
                objUserRegistration.Emailid = txtEmail.Text.Trim();
                objUserRegistration.ISVERIFY = chkIsVerify.Checked ? "Y" : "N";
                objUserRegistration.Phoneno = txtphoneno.Text.Trim();
                //if (ddlUserType.SelectedValue != "8" && ddlUserType.SelectedValue != "3") objUserRegistration.ImageURL = "";//UserPicControl.ImageUrl.ToString();
            }
            catch (Exception ex)
            {
                string strFnc = "";
                strFnc = ex.Message;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "CatchMsg", "javascript:AlertMsg('" + strFnc + "');", true);
            }
        }
        private void SetPropertiesCustomer_IL(int CustomerID)
        {
            try
            {
                objLeads.Customerid = CustomerID;
                objLeads.Mobileno = "";
                objLeads.Name = txtUserName.Text.Trim();
                objLeads.Emailid = txtEmail.Text.Trim();
                objLeads.Address1 = "";
                objLeads.Address2 = "";
                objLeads.Password = txtPwd.Text;
                objLeads.Ticket = Convert.ToString(Session["Ticket"]);
            }
            catch (Exception ex)
            {
                string strFnc = "";
                strFnc = ex.Message;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "CatchMsg", "alert('" + strFnc + "');", true);
            }
        }

        //private void ShowData(decimal UserID)
        //{
        //    try
        //    {
        //        //ddlUserType.Enabled = false;
        //        string strQuery = "";
        //        dsFillData = new DataSet();
        //        string Strusertype = "select UserType from tblUserRegistration inner join tblUserType on tblUserRegistration.UserTypeID=tblUserType.UserTypeID " +
        //                           " where tblUserRegistration.UserID=" + UserID + "";
        //        string UserType = (String)CrystalDatabase.CrystalConnection.SqlScalartoObj(Strusertype);
        //        if (UserType.ToUpper() == "STUDENT")
        //        {

        //            strQuery = " Select isnull(Adm_StdInfo.ImageURL,'')ImageURL,UserID,UserName,LoginName,pwd,tblUserRegistration.UserTypeID,tblUserType.UserType,tblUserCategory.UserCategory,tblUserRegistration.UserCategoryID,EmailID" +
        //                     " ,tblUserRegistration.IsVerify From tblUserRegistration" +
        //                     " Inner Join tblUserType On tblUserRegistration.UserTypeID=tblUserType.UserTypeID " +
        //                     " Inner Join tblUserCategory On tblUserRegistration.UserCategoryID=tblUserCategory.UserCategoryID " +
        //                     " left outer join Adm_StdInfo on tblUserRegistration.StdStaffID=Adm_StdInfo.StudentID  and tblUserRegistration.UserTypeID=8  " +
        //                     " Where UserID=" + UserID + "";
        //            //UserPicUploader.Visible = false;
        //        }
        //        else if (UserType.ToUpper() == "TEACHER")
        //        {
        //            strQuery = " Select isnull(Staff.ImageURL,'')ImageURL,tblUserRegistration.UserID,UserName,LoginName,pwd,tblUserRegistration.UserTypeID, " +
        //                        " tblUserType.UserType,tblUserCategory.UserCategory,tblUserRegistration.UserCategoryID , " +
        //                        " tblUserType.IsVerify From tblUserRegistration  " +
        //                        " Inner Join tblUserType On tblUserRegistration.UserTypeID=tblUserType.UserTypeID   " +
        //                        " Inner Join tblUserCategory On tblUserRegistration.UserCategoryID=tblUserCategory.UserCategoryID " +
        //                        " left outer Join tblStaffDetails Staff on tblUserRegistration.StdStaffID=Staff.StaffID  " +
        //                        " and tblUserRegistration.UserTypeID=3  " +
        //                        " Where tblUserRegistration.UserID=" + UserID + "";
        //            //UserPicUploader.Visible = false;
        //        }
        //        else
        //        {
        //            strQuery = " Select isnull(tblUserRegistration.ImageURL,'')ImageURL,tblUserRegistration.UserID,UserName,LoginName,pwd,tblUserRegistration.UserTypeID, " +
        //                       " tblUserType.UserType,tblUserCategory.UserCategory,tblUserRegistration.UserCategoryID , " +
        //                       " tblUserType.IsVerify From tblUserRegistration  " +
        //                       " Inner Join tblUserType On tblUserRegistration.UserTypeID=tblUserType.UserTypeID  " +
        //                       " Inner Join tblUserCategory On tblUserRegistration.UserCategoryID=tblUserCategory.UserCategoryID " +
        //                       " Where tblUserRegistration.UserID=" + UserID + "";
        //        }

        //        dsFillData = csUserRegistration.FillDataSet(strQuery);
        //        if (dsFillData.Tables[0].Rows.Count != 0)
        //        {
        //            DataRow rw = dsFillData.Tables[0].Rows[0];

        //            //Session["userImgID"] = Convert.ToString(dsFillData.Tables[0].Rows[0]["Imageurl"]);
        //            txtUserName.Text = Convert.ToString(rw["UserName"]);
        //            txtLoginName.Text = Convert.ToString(rw["LoginName"]);
        //            //txtPwd.Text = Convert.ToString(rw["Pwd"]);
        //            txtPwd.Attributes.Add("Value", csLogin.DecodeFrom64(rw["Pwd"].ToString()));
        //            ddlUserType.SelectedValue = Convert.ToString(rw["UserTypeID"]);
        //            //if (ddlUserType.SelectedValue == "8") UserPicUploader.Visible = false;
        //            ddlUserCategory.SelectedValue = Convert.ToString(rw["UserCategoryID"]);
        //            chkIsVerify.Checked = Convert.ToString(rw["IsVerify"]) == "Y" ? true : false;
        //            //UserPicControl.ImageUrl = Convert.ToString(dsFillData.Tables[0].Rows[0]["Imageurl"]);
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        string strFnc = "";
        //        strFnc = ex.Message;
        //        ScriptManager.RegisterStartupScript(this, this.GetType(), "CatchMsg", "javascript:AlertMsg('" + strFnc + "');", true);
        //    }
        //}
        private void ClearControl()
        {
            try
            {
                lblopMode.Text = "";
                lblUserID.Text = "0";
                lblErrorMsg.Text = "";
                txtUserName.Text = "";
               // txtLoginName.Text = "";
                txtPwd.Text = "";
                txtConfPwd.Text = "";
                txtEmail.Text = "";
                txtphoneno.Text = "";
                ddlUserType.SelectedValue = "-1";
               // ddlUserCategory.SelectedValue = "-1";
                chkIsVerify.Checked = false;
            }
            catch (Exception ex)
            {
                string strFnc = "";
                strFnc = ex.Message;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "CatchMsg", "javascript:AlertMsg('" + strFnc + "');", true);
            }
        }
        private bool ValidateData()
        {
            if (txtPwd.Text.Trim() != txtConfPwd.Text.Trim())
            {
               
                txtConfPwd.Focus();
                return false;
            }
            if (txtEmail.Text != "")
            {

                Regex reg = new Regex(@"^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$");
                Match isMatch = reg.Match(txtEmail.Text);
                if (!isMatch.Success)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertMessage", "alert('Please enter valid Email.');", true);
                    txtEmail.Focus();
                    
                    return (false);
                }
            }
            if (ddlUserType.SelectedValue == "-1")
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertMessage", "alert('Please select user type.');", true);
                
                return false;
            }

            //if (ddlUserCategory.SelectedValue == "-1")
            //{
            //    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertMessage", "alert('Please select user category.');", true);
            //    btnSubmit.Enabled = true;
            //    return false;
            //}
            //string strQuery = "Select COUNT(UserID) from tblUserRegistration where EmailID='" + txtEmail.Text.Trim() + "'";
            int CountID = 0;
            CountID = objUserRegistration.SP_ValidateCredential(txtEmail.Text, 1);
            if (CountID > 0)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertMessage", "alert('User already exist with this email id. Try another email id to register.');", true);
               
                return false;
            }
            else if (CountID == 100)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertMessage", "alert('Please refresh and try again later.');", true);
                
                return false;
            }
            return true;
        }
        protected void txtLoginName_TextChanged(object sender, EventArgs e)
        {
            //string strQuery = "Select COUNT(UserID) from tblUserRegistration where LoginName='" + txtLoginName.Text.Trim() + "'";
            int CountID = 0;
           // CountID = (int)CrystalConnection.SqlScalartoObj(strQuery);
            CountID = objUserRegistration.SP_ValidateCredential(txtUserName.Text, 2);
            if (CountID > 0 && CountID!=100)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertMessage", "alert('User already exist with this User Name. Try another Login-Name to register.');", true);
                txtUserName.Text = "";
                txtUserName.Focus();

            }
            else if (CountID == 100)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertMessage", "alert('Please refresh and try again later.');", true);
                txtUserName.Text = "";
                txtUserName.Focus();
            }
            else
                txtPwd.Focus();
        }
    }
}