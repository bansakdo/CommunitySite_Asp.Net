using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace finalexam.User
{
    public partial class Withdrawal : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {


            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            var verified = false;

            SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["connectionString"].ConnectionString);
            conn.Open();

            string sql = "select u_password from users where u_id=@id";
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.Parameters.AddWithValue("@id", User.Identity.Name);

            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.Read())
            {
                if (dr["u_password"].ToString() == txtPw.Text.ToLower())
                {
                    verified = true;

                }
            }
            dr.Close();

            if (verified)
            {
                string deleteSql = "delete from users where u_id=@id";
                SqlCommand delCmd = new SqlCommand(deleteSql, conn);
                delCmd.Parameters.AddWithValue("@id", User.Identity.Name);
                delCmd.ExecuteNonQuery();
                conn.Close();

                Response.Write("<script>alert('삭제 완료!');</script>");

                FormsAuthentication.SignOut();
                Response.Redirect("~/Default.aspx");
                
            }
            else
            {
                conn.Close();
            }
        }
    }
}