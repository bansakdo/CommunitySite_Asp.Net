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
    public partial class BrdView : System.Web.UI.Page
    {
        string category = "free";
        protected void Page_Load(object sender, EventArgs e)
        {
            var isAdmin = false;
            if(!IsPostBack)
            {
                SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["connectionString"].ConnectionString);
                conn.Open();

                // 조회수 불러오기
                string selectReadcnt = "select readcnt from board where num=" + Request["No"];
                SqlCommand getReadcnt = new SqlCommand(selectReadcnt, conn);
                getReadcnt.ExecuteNonQuery();
                SqlDataReader drRead = getReadcnt.ExecuteReader();
                int readcnt = 0;
                if (drRead.Read())
                {
                    readcnt = int.Parse(drRead["readcnt"].ToString());
                }
                readcnt++;
                drRead.Close();

                // 조회수 저장
                string updateReadcnt = "update board set readcnt = @readcnt where num=" + Request["No"];
                SqlCommand putReadcnt = new SqlCommand(updateReadcnt, conn);
                putReadcnt.Parameters.AddWithValue("@readcnt", readcnt);

                putReadcnt.ExecuteNonQuery();


                // 자료 출력
                string selectSql = "select * from board where num=" + Request["No"];
                SqlCommand cmd = new SqlCommand(selectSql, conn);
                cmd.ExecuteNonQuery();

                SqlDataReader dr = cmd.ExecuteReader();
                if(dr.Read())
                {
                    lblname.Text = dr["name"].ToString();
                    lblwritedate.Text = dr["writedate"].ToString();
                    lblreadcnt.Text = dr["readcnt"].ToString();
                    lbltitle.Text = dr["title"].ToString();
                    txtcontents.Text = dr["contents"].ToString();
                    category = dr["category"].ToString();
                }
                dr.Close();





                if (User.Identity.IsAuthenticated )
                {

                    string verifySql = "select u_name, u_admin from users where u_id=@id";
                    SqlCommand vCmd = new SqlCommand(verifySql, conn);
                    vCmd.Parameters.AddWithValue("@id", User.Identity.Name);
                    SqlDataReader vdr = vCmd.ExecuteReader();
                    var result = false;

                    if(vdr.Read())
                    {
                        if (lblname.Text == vdr["u_name"].ToString())
                        {
                            result = true;
                        }
                        if(vdr["u_admin"].ToString() == "1")
                        {
                            isAdmin = true;
                        }
                    }
                    vdr.Close();

                    if(result)
                    {
                        btnModify.Visible = true;
                        btnDelete.Visible = true;
                    }
                    if(isAdmin)
                    {
                        btnDelete.Visible = true;
                    }

                }

                conn.Close();
            }

        }

        protected void btnList_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Board/BrdList.aspx?category=" + category);
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Board/BrdPass.aspx?Action=delete&No=" + Request["No"]);
        }

        protected void btnModify_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Board/BrdPass.aspx?Action=modify&No=" + Request["No"]);
        }
    }
}