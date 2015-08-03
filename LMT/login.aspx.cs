using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using LMT.BusinessLogic;
using LMT.ClassGlobal;
using CrystalDatabase;


namespace LMT
{
    public partial class login : System.Web.UI.Page
    {
        csLogin objLogin = new csLogin();
        csGlobal globaldata = new csGlobal();
        protected void Page_Load(object sender, EventArgs e)
        {
            txtUsername.Focus();
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            try
            {
                if (txtUsername.Text.Trim() != "" && txtPassword.Text != "")
                {
                    DataTable dt = objLogin.ExecuteProcedure(txtUsername.Text);
                    if (dt.Rows.Count > 0)
                    {
                        if (txtPassword.Text == csLogin.DecodeFrom64(dt.Rows[0]["Pwd"].ToString()))
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


                            if (Session["UserType"].ToString() == "Super Admin")
                            {
                                Response.Redirect("~/MasterPages/MenuBoard.aspx");
                            }
                            else if (Session["UserType"].ToString() == "Admin")
                            {
                                Response.Redirect("~/MasterPages/AdminMenuboard.aspx");
                            }
                            else if (Session["UserType"].ToString() == "Supplier")
                            {
                                Response.Redirect("~/MasterPages/SupplierMenuboard.aspx");
                            }
                            else if (Session["UserType"].ToString() == "Customer")
                            {
                                Response.Redirect("~/MasterPages/CustMenuboard.aspx");
                            }
                            else
                            {
                                Response.Redirect("~/login.aspx");

                            }
                        }
                        else
                        {
                            Session["UserName"] = "";
                            globaldata.UserTypedata = "";
                            globaldata.UserCategorydata = "";
                            globaldata.UserImageIDdata = 0;
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Invalid password please try again.');", true);
                            //lblPWD.Visible = true;
                        }
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('You are not a valid user please contact to your admin.');", true);
                        //string script = "alert('Username does not match Please try again.')";
                        //ScriptManager.RegisterStartupScript(Page, Page.GetType(), "its working", script, true);
                    }
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('User Name and Password can not be left blank.');", true);
                    //lblUN.Visible = true;
                }
            }
            catch (Exception ex)
            {
                string strFnc = "";
                strFnc = ex.Message;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "CatchMsg", "javascript:AlertMsg('" + strFnc + "');", true);
            }
        }

        protected void btnSignUp_Click(object sender, EventArgs e)
        {
            try
            {
                Response.Redirect("~/User/UserRegistration.aspx");
            }
            catch (Exception ex)
            {
                string strFnc = "";
                strFnc = ex.Message;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "CatchMsg", "javascript:AlertMsg('" + strFnc + "');", true);
            }
        }

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

        protected void btnOk_Click(object sender, EventArgs e)
        {
            try
            {
                if (ValidateEmail())
                {
                    string Str_P = "select Pwd from tblUserRegistration Where EmailID='" + txtFgEmail.Text + "'";
                    //csLogin.DecodeFrom64(dt.Rows[0]["Pwd"].ToString())
                    string P_Word = csLogin.DecodeFrom64(Convert.ToString(CrystalConnection.SqlScalartoObj(Str_P)));
                    string recipientemailto = Convert.ToString(Session["FGEmail"]);
                    string strMessage = "Dear Subscriber,<br> Your Password is :" + P_Word + ".";
                    string strSubject = "Easy Labour Password Recovery";
                    if (txtFgEmail.Text.Trim() != "") csGlobalFunction.SendEmail(recipientemailto, strSubject, strMessage);
                }
            }
            catch (Exception ex)
            {
                string strFnc = "";
                strFnc = ex.Message;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "CatchMsg", "javascript:AlertMsg('" + strFnc + "');", true);
            }
        }

        private bool ValidateEmail()
        {
            try
            {
                string Str = "select EmailID from tblUserRegistration Where EmailID='" + txtFgEmail.Text + "'";
                string Email = Convert.ToString(CrystalConnection.SqlScalartoObj(Str));
                if (txtFgEmail.Text != Email)
                {
                    return false;
                }
                Session["FGEmail"] = Email;

            }
            catch (Exception ex)
            {
                string strFnc = "";
                strFnc = ex.Message;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "CatchMsg", "javascript:AlertMsg('" + strFnc + "');", true);
            }
            return true;
        }
    }
}