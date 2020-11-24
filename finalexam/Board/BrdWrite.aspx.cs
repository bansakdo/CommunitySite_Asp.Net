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
    public partial class BrdWrite : System.Web.UI.Page
    {
        string username = "";
        string useremail = "";
        string category = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            var isAdmin = false;


            if (Page.User.Identity.IsAuthenticated)
            {
                var userId = User.Identity.Name;

                SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["connectionString"].ConnectionString);
                conn.Open();

                string sql = "select u_name, u_email, u_admin from users where u_id='" + userId + "'";
                SqlCommand cmd = new SqlCommand(sql, conn);
                SqlDataReader dr = cmd.ExecuteReader();

                if(dr.Read())
                {
                    username = dr["u_name"].ToString();
                    useremail = dr["u_email"].ToString();
                    if(dr["u_admin"].ToString() == "1")
                    {
                        isAdmin = true;
                    }
                }
                dr.Close();
                conn.Close();

                if(isAdmin)                             // 관리자는 공지사항 게시판 추가
                {
                    ddlCat.Items[2].Enabled = true;
                }


                // 게시판 선택
                category = Request["category"];
                switch (category)
                {
                    case "free":
                        ddlCat.Items[0].Selected = true;
                        break;
                    case "news":
                        ddlCat.Items[1].Selected = true;
                        break;
                    case "notice":
                        if (isAdmin)
                        {
                            ddlCat.Items[2].Selected = true;
                        }
                        break;
                }


                // 미리 회원정보 입력
                txtname.Text = username;
                txtemail.Text = useremail;

                txtname.ReadOnly = true;            // 회원은 이름 못바꿈
                if (useremail != "")
                {
                    txtemail.ReadOnly = true;
                }

            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {

            SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["connectionString"].ConnectionString);
            conn.Open();

            string insertSql = "insert into board(name, pass, email, title, contents, writedate, readcnt, category) values(@name, @pass, @email, @title, @contents, @writedate, @readcnt, @category)";

            SqlCommand cmd = new SqlCommand(insertSql, conn);

            cmd.Parameters.AddWithValue("@name", txtname.Text);
            cmd.Parameters.AddWithValue("@pass", txtpass.Text);
            cmd.Parameters.AddWithValue("@email", txtemail.Text);
            cmd.Parameters.AddWithValue("@title", txttitle.Text);
            cmd.Parameters.AddWithValue("@contents", txtcontents.Text);
            cmd.Parameters.AddWithValue("@writedate", DateTime.Now.ToShortDateString());
            cmd.Parameters.AddWithValue("@readcnt", "0");
            cmd.Parameters.AddWithValue("@category", ddlCat.SelectedItem.Value);

            cmd.ExecuteNonQuery();
            conn.Close();
            Response.Redirect("~/Board/BrdList.aspx?category=" + category);
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {

            txtname.Text = username;
            txtpass.Text = "";
            txtemail.Text = useremail;
            txttitle.Text = "";
            txtcontents.Text = "";



        }

        protected void btnList_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Board/BrdList.aspx?category="+category);
        }

    }
}