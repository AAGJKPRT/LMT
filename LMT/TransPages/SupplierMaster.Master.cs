using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

namespace LMT.TransPages
{
    public partial class SupplierMaster : System.Web.UI.MasterPage
    {
        public string BaseURL { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                CheckLogin();
                if (Session["UserName"] != null)
                {
                    lblSupplierName.Text = Convert.ToString(Session["UserName"]);
                }
            }
            catch (Exception ex)
            {
                string strFnc = "";
                strFnc = ex.Message;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "CatchMsg", "javascript:AlertMsg('" + strFnc + "');", true);
            }
            //string str = Convert.ToString(Session["UserName"]);
        }

        protected void lbtnLogOut_Click(object sender, EventArgs e)
        {
            //Response.Cache.SetExpires(DateTime.UtcNow.AddMinutes(-1));
            //Response.Cache.SetCacheability(HttpCacheability.NoCache);
            //Response.Cache.SetNoStore();
            try
            {
                Response.Redirect("../login.aspx");
                //if (Session["UserName"] != null)
                //{
                //    Session["UserName"] = "";
                //    Session.RemoveAll();
                //    Session.Abandon();
                //    Response.Redirect("../login.aspx");
                //}
            }
            catch (Exception ex)
            {
                string strFnc = "";
                strFnc = ex.Message;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "CatchMsg", "javascript:AlertMsg('" + strFnc + "');", true);
            }
            
        }

        private void CheckLogin()
        {
            string domain = Request.Url.Authority.ToString();
            BaseURL = "http://" + domain + "/";
            //Load menu or Do Any database related work
            if (Session["user"] != null)
            {
                //lnkLogin.Text = "Logout";
                lbtnLogOut.PostBackUrl = BaseURL + "frmLogout.aspx";
            }
            else
            {
                Response.Redirect(BaseURL + "login.aspx", false);
            }
        } 

        //protected void Timer1_Tick(object sender, EventArgs e)
        //{
        //    string redirectUrl = FormsAuthentication.LoginUrl;
        //    FormsAuthentication.SignOut();
        //    Response.Redirect(redirectUrl);  
        //}
    }
}