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
    public partial class BrdNotice : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var isAdmin = false;

            if(!IsPostBack)
            {
                SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["connectionString"].ConnectionString);
                conn.Open();

                string sql = "select u_admin from users where u_id=@id";
                SqlCommand cmd = new SqlCommand(sql, conn);
                cmd.Parameters.AddWithValue("@id", User.Identity.Name);
                SqlDataReader dr = cmd.ExecuteReader();

                if(dr.Read())
                {
                    if(dr["u_admin"].ToString() == "1")
                    {
                        isAdmin = true;
                    }
                }

                if(isAdmin)
                {
                    btnBrdAdd.Visible = true;
                }

            }

        }

        protected void btnBrdAdd_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Board/BrdWrite.aspx?category=notice");
        }
    }
}