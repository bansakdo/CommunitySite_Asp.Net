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
    public partial class BrdPass : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if(!IsPostBack)
            {

            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            var brdNum = Request["No"];
            var action = Request["Action"];
            var verified = false;


            SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["connectionString"].ConnectionString);
            conn.Open();

            string sql = "select pass from board where num=@num";
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.Parameters.AddWithValue("@num", brdNum);

            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.Read()) {
                if(dr["pass"].ToString() == txtPw.Text.ToLower())
                {
                    verified = true;
                }
            }
            dr.Close();

            if(verified)
            {
                if(action == "modify")
                {
                    Response.Redirect("~/Board/BrdModify.aspx?No=" + brdNum + "&action=" + action);
                } else if(action == "delete")
                {
                    string deleteSql = "delete from board where num=@num";
                    SqlCommand delCmd = new SqlCommand(deleteSql, conn);
                    delCmd.Parameters.AddWithValue("@num", brdNum);
                    delCmd.ExecuteNonQuery();
                    conn.Close();

                    Response.Write("<script>alert('삭제 완료!');</script>");
                    Response.Redirect("~/Board/BrdAllList.aspx");
                }
            } else
            {
                conn.Close();
            }

        }
    }
}