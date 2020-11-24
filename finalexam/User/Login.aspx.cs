using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace finalexam
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if(!IsPostBack)
            {
                if(User.Identity.IsAuthenticated)
                {
                    Response.Redirect("~/User/Modify.aspx");
                }
            }

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string inputId = txtId.Text.ToLower().Trim();
            string inputPw = txtPw.Text.Trim();
            if (inputId == "")
            {
                Response.Write("<script>alert('ID를 입력해 주세요.');</script>");
            } 
            else if (inputPw == "")
            {
                Response.Write("<script>alert('PW를 입력해 주세요.');</script>");
            } else
            {
                var idExisted = false;
                var verified = false;

                SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["connectionString"].ConnectionString);
                conn.Open();

                string verifySql = "select u_password from users where u_id='" + inputId + "'";
                SqlCommand cmd = new SqlCommand(verifySql, conn);
                SqlDataReader dr = cmd.ExecuteReader();

                if(dr.Read())
                {
                    idExisted = true;
                    if (dr["u_password"].ToString() == inputPw)
                    {
                        verified = true;
                    } 
                }
                dr.Close();
                conn.Close();

                if(!idExisted || !verified)
                {
                    Response.Write("<script>alert('ID 또는 PW를 확인해 주세요.');</script>");
                } else if(idExisted && verified)
                {
                    FormsAuthentication.RedirectFromLoginPage(inputId, false);
                }

            }

        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/User/Register.aspx");
        }

        protected void btnFindPw_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/User/FindPw.aspx");

        }
    }
}