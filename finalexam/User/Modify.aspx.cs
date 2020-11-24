using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace finalexam.User
{
    public partial class UserModify : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if(!IsPostBack) {
                var userId = User.Identity.Name;

                SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["connectionString"].ConnectionString);
                conn.Open();

                string getDataSql = "select * from users where u_id='" + userId + "'";
                SqlCommand cmd = new SqlCommand(getDataSql, conn);
                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.Read())
                {
                    txtId.Text = dr["u_id"].ToString();
                    txtName.Text = dr["u_name"].ToString();
                    txtEmail.Text = dr["u_email"].ToString();
                    txtTel.Text = dr["u_tel"].ToString();
                    txtAddr.Text = dr["u_addr"].ToString();
                    txtBirth.Text = dr["u_birth"].ToString().Split(' ')[0];
                }
                dr.Close();
                cmd.Dispose();
                conn.Close();
            }


        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["connectionString"].ConnectionString);
            conn.Open();

            SqlDataAdapter adapter = new SqlDataAdapter();

            string modifySql = "update users set u_password=@password, u_name=@name, u_email=@email, u_tel=@tel, u_addr=@addr, u_birth=@birth where u_id=@id";
            SqlCommand cmd = new SqlCommand(modifySql, conn);
            cmd.Parameters.AddWithValue("@password", txtPw.Text.Trim());
            cmd.Parameters.AddWithValue("@name", txtName.Text.ToLower());
            cmd.Parameters.AddWithValue("@email", txtEmail.Text);
            cmd.Parameters.AddWithValue("@tel", txtTel.Text);
            cmd.Parameters.AddWithValue("@addr", txtAddr.Text);
            cmd.Parameters.AddWithValue("@birth", txtBirth.Text);
            cmd.Parameters.AddWithValue("@id", txtId.Text);



            cmd.ExecuteNonQuery();
            //cmd.Dispose();
            conn.Close();

            Response.Write("<script>alert('수정 완료!');</script>");
            Response.Redirect("~/Default.aspx");

        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            var userId = User.Identity.Name;

            SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["connectionString"].ConnectionString);
            conn.Open();

            string getDataSql = "select * from users where u_id='" + userId + "'";
            SqlCommand cmd = new SqlCommand(getDataSql, conn);
            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.Read())
            {
                txtId.Text = dr["u_id"].ToString();
                txtName.Text = dr["u_name"].ToString();
                txtEmail.Text = dr["u_email"].ToString();
                txtTel.Text = dr["u_tel"].ToString();
                txtAddr.Text = dr["u_addr"].ToString();
                txtBirth.Text = dr["u_birth"].ToString();
            }
            dr.Close();
            conn.Close();
        }

        protected void btnReturn_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Default.aspx");

        }

        protected void btnWithdrawal_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/User/Withdrawal.aspx");
        }
    }
}