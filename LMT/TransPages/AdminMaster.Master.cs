using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LMT.TransPages
{
    public partial class AdminMaster : System.Web.UI.MasterPage
    {
        public string BaseURL { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            CheckLogin();
            if (Session["UserName"] != null)
            {
                lblAdminName.Text = Convert.ToString(Session["UserName"]);
            }
            Response.Cache.SetNoStore();

        }
        protected void lbtnLogOut_Click(object sender, EventArgs e)
        {
            Response.Redirect("../login.aspx");

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
    }
}