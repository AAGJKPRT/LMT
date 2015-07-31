using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;

namespace LMT
{
    public partial class frmLogout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session.Abandon();
            Session.Clear();
            Session.RemoveAll();
            System.Web.Security.FormsAuthentication.SignOut();
            Response.Redirect("login.aspx", false);

        }
        [WebMethod]
        public static int LogoutCheck()
        {
            if (HttpContext.Current.Session["user"] == null)
            {
                return 0;
            }
            return 1;
        }
    }
}