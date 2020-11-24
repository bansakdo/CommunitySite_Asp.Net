using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace finalexam
{
    public partial class Register : System.Web.UI.Page
    {
        bool isUniquedId = false;
        bool isCheckId = false;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {


            SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["connectionString"].ConnectionString);
            conn.Open();

            //ID 중복 확인
            var dbId = "";
            string getIdSql = "select u_id from users where u_id='" + txtId.Text.ToLower().Trim() + "'";
            SqlCommand getIdCmd = new SqlCommand(getIdSql, conn);
            SqlDataReader drid = getIdCmd.ExecuteReader();
            if (drid.Read())
            {
                dbId = drid["u_id"].ToString();
                isUniquedId = false;
                lblCheckIdUnique.Text = "이미 해당 ID가 존재합니다. 다른 ID를 사용해 주세요.";
                lblCheckIdUnique.Visible = true;
            }
            drid.Close();

            if(dbId == "")
            {
                isUniquedId = true;
                lblCheckIdUnique.Visible = false;
            }


            // 가입 등록
            if (isUniquedId)
            {

                string insertSql = "insert into users (u_id, u_password, u_name, u_email, u_tel, u_addr, u_birth) values(@id, @password, @name, @email, @tel, @addr, @birth)";
                SqlCommand cmd = new SqlCommand(insertSql, conn);
                cmd.Parameters.AddWithValue("@id", txtId.Text.ToLower().Trim());
                cmd.Parameters.AddWithValue("@password", txtPw.Text.Trim());
                cmd.Parameters.AddWithValue("@name", txtName.Text.ToLower());
                cmd.Parameters.AddWithValue("@email", txtEmail.Text);
                cmd.Parameters.AddWithValue("@tel", txtTel.Text);
                cmd.Parameters.AddWithValue("@addr", txtAddr.Text);
                cmd.Parameters.AddWithValue("@birth", txtBirth.Text.Split(' ')[0]);

                cmd.ExecuteNonQuery();
                conn.Close();

                Response.Write("<script>alert('회원가입이 완료되었습니다! 로그인을 해 주세요.');</script>");
                Response.Redirect("~/User/Login.aspx");

            } else
            {
                conn.Close();
            }
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            txtId.Text = "";
            txtName.Text = "";
            txtAddr.Text = "";
            txtBirth.Text = "";
            txtEmail.Text = "";
            txtTel.Text = "";

        }

        protected void btnIdUnique_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["connectionString"].ConnectionString);
            conn.Open();

            var dbId = "";
            string getIdSql = "select u_id from users where u_id='" + txtId.Text + "'";
            SqlCommand getIdCmd = new SqlCommand(getIdSql, conn);
            SqlDataReader drid = getIdCmd.ExecuteReader();
            if (drid.Read())
            {
                dbId = drid["u_id"].ToString();
            }

            if(dbId == txtId.Text)
            {
                isUniquedId = false;
                lblCheckIdUnique.Text = "이미 해당 ID가 존재합니다. 다른 ID를 사용해 주세요.";
                lblCheckIdUnique.Visible = true;
            } else
            {
                isUniquedId = true;
                lblCheckIdUnique.Visible = false;
            }

            isCheckId = true;
        }
    }
}