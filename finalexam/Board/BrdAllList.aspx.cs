using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace finalexam.Board
{
    public partial class BrdAllList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnBrdAdd_Click(object sender, EventArgs e)
        {
            if(User.Identity.IsAuthenticated)
            {
                Response.Redirect("~/Board/BrdWrite.aspx");
            } else
            {
                Response.Redirect("~/User/Login.aspx");
            }
        }

    }
}