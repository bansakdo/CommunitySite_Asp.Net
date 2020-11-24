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
    public partial class FindPw : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            var inputId = txtId.Text.ToLower().Trim();
            var inputName = txtName.Text.ToLower();
            var inputBirth = txtBirth.Text;
            var readedPw = "";
            var isExist = false;


            SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["connectionString"].ConnectionString);
            conn.Open();

            string selectSql = "select u_password from users where u_id=@id and u_name=@name and u_birth=@birth";
            SqlCommand cmd = new SqlCommand(selectSql, conn);
            cmd.Parameters.AddWithValue("@id", inputId);
            cmd.Parameters.AddWithValue("@name", inputName);
            cmd.Parameters.AddWithValue("@birth", inputBirth);
            SqlDataReader dr = cmd.ExecuteReader();

            if(dr.Read())
            {
                isExist = true;
                readedPw = dr["u_password"].ToString();
            }
            dr.Close();
            conn.Close();


            if(isExist)
            {
                lblResult.Text = inputId + "님의 Password는 '" + readedPw + "' 입니다.";
                
                lblResult.Visible = true;
                btnLogin.Visible = true;
            }
            

        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            txtId.Text = "";
            txtName.Text = "";
            txtBirth.Text = "";
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/User/Login.aspx");
        }
    }
}