using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace finalexam
{
    public partial class FrmDefault : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void btnBrdAllList_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Board/BrdAllList.aspx");
        }

        protected void btnBrdFreelist_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Board/BrdList.aspx?category=free");

        }

        protected void btnBrdNewslist_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Board/BrdList.aspx?category=news");

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Board/BrdList.aspx?category=notice");
        }
    }
}