using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace finalexam
{
    public partial class SiteTemplate : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var userId = Page.User.Identity.Name;
            if (Page.User.Identity.IsAuthenticated)
            {

                btnLogin.Visible = false;
                btnLogout.Visible = true;
                lblWelcome.Visible = true;
                btnUserModify.Visible = true;
                lblWelcome.Text = userId + "님 반갑습니다.";
                //toMain.;
            }

        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            FormsAuthentication.SignOut();
            Response.Redirect(Request.RawUrl);
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {

            Response.Redirect("~/User/Login.aspx");

        }

        protected void btnFreeboard_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Board/BrdList.aspx?category=free");
        }

        protected void btnHome_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Default.aspx");
        }

        protected void btnUserModify_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/User/Modify.aspx");
        }

        protected void btnNewsBoard_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Board/BrdList.aspx?category=news");

        }

        protected void btnAllboard_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Board/BrdAllList.aspx");
        }

        protected void btnNotice_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Board/BrdNotice.aspx");
        }

        protected void toMain_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Default.aspx");
        }
    }
}