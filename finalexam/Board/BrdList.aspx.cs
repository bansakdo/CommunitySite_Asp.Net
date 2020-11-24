using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace finalexam.Board
{
    public partial class BrdList : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            var category = Request["category"];
            lblCat.Text = category;
            //lblCat.Text = "free";

            switch(category)
            {
                case "free":
                    lblTitle.Text = "자유게시판";
                    break;
                case "news":
                    lblTitle.Text = "뉴스게시판";
                    break;
            }


            if (IsPostBack)
            {


            }
            
        }

        protected void btnBrdAdd_Click(object sender, EventArgs e)
        {
            if (User.Identity.IsAuthenticated)
            {
                Response.Redirect("~/Board/BrdWrite.aspx?category=" + Request["category"]);
            }
            else
            {
                Response.Redirect("~/User/Login.aspx");
            }
        }

    }
}