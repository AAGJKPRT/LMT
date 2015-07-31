using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CrystalCampus.MasterPages
{
    public partial class MasterPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                UnvisibleAllControls();
                if (Request.QueryString["Name"] != null)
                {
                    if (Request.QueryString["Name"].ToString().ToUpper() == "STATE")
                        stateUC.Visible = true;
                    else if (Request.QueryString["Name"].ToString().ToUpper() == "CITY")
                        cityUC.Visible = true;
                }
            }
        }
        private void UnvisibleAllControls()
        {
            stateUC.Visible = false;
            cityUC.Visible = false;
        }
    }
}