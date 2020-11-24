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
    public partial class BrdModify : System.Web.UI.Page
    {
        string username = "";
        string useremail = "";
        string brdNum = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            brdNum = Request["No"];
            var category = "";

            if (Page.User.Identity.IsAuthenticated)
            {
                txtname.ReadOnly = true;
                txtemail.ReadOnly = true;

            }

            if(!IsPostBack)
            {

                SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["connectionString"].ConnectionString);
                conn.Open();

                string sql = "select * from board where num='" + brdNum + "'";
                SqlCommand cmd = new SqlCommand(sql, conn);
                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.Read())
                {
                    txtname.Text = dr["name"].ToString();
                    txtemail.Text = dr["email"].ToString();
                    txttitle.Text = dr["title"].ToString();
                    txtcontents.Text = dr["contents"].ToString();
                    category = dr["category"].ToString();
                }
                dr.Close();
                conn.Close();

                switch (category)
                {
                    case "free":
                        ddlCat.Items[0].Selected = true;
                        break;
                    case "news":
                        ddlCat.Items[1].Selected = true;
                        break;
                }

            }


        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {

            SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["connectionString"].ConnectionString);
            conn.Open();

            string updateSql = "update board set name=@name, pass=@pass, email=@email, title=@title, contents=@contents, writedate=@writedate, category=@category where num=@num";

            SqlCommand cmd = new SqlCommand(updateSql, conn);

            cmd.Parameters.AddWithValue("@name", txtname.Text);
            cmd.Parameters.AddWithValue("@pass", txtpass.Text);
            cmd.Parameters.AddWithValue("@email", txtemail.Text);
            cmd.Parameters.AddWithValue("@title", txttitle.Text);
            cmd.Parameters.AddWithValue("@contents", txtcontents.Text);
            cmd.Parameters.AddWithValue("@writedate", DateTime.Now.ToShortDateString());
            cmd.Parameters.AddWithValue("@category", ddlCat.SelectedItem.Value);
            cmd.Parameters.AddWithValue("@num", brdNum);

            Console.WriteLine("cmd : " + cmd.ToString());

            cmd.ExecuteNonQuery();
            conn.Close();


            Response.Write("<script>alert('수정 완료!');</script>");
            Response.Redirect("~/Board/BrdView.aspx?No=" + brdNum);
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            var category = "";

            SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["connectionString"].ConnectionString);
            conn.Open();

            string sql = "select * from board where num='" + brdNum + "'";
            SqlCommand cmd = new SqlCommand(sql, conn);
            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.Read())
            {
                txtname.Text = dr["name"].ToString();
                txtemail.Text = dr["email"].ToString();
                txttitle.Text = dr["title"].ToString();
                txtcontents.Text = dr["contents"].ToString();
                category = dr["category"].ToString();
            }
            dr.Close();
            conn.Close();

            switch (category)
            {
                case "free":
                    ddlCat.Items[0].Selected = true;
                    break;
                case "news":
                    ddlCat.Items[1].Selected = true;
                    break;
            }



        }

        protected void btnView_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Board/BrdView.aspx?No=" + brdNum);
        }

    }
}