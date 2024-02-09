using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Data.SqlClient;

public partial class admin_order_disp : System.Web.UI.Page
{
    string x = WebConfigurationManager.ConnectionStrings["mycon"].ConnectionString.ToString();

    public void gridbind()
    {
        SqlConnection con = new SqlConnection(x);
        con.Open();

        string q = "select * from orders";

        SqlCommand cmd = new SqlCommand(q, con);

        SqlDataReader dr = cmd.ExecuteReader();

        if (dr.HasRows)
        {
            GridView1.DataSource = dr;
            GridView1.DataBind();
        }
        dr.Dispose();
        con.Close();
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["email"] == null)
        {
            Response.Redirect("~/login.aspx");
        }
        gridbind();
    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "confirm")
        {
            SqlConnection con = new SqlConnection(x);
            con.Open();

            string q = "update orders set status=@status where Id=@id";

            SqlCommand cmd = new SqlCommand(q, con);

            cmd.Parameters.AddWithValue("@Id", e.CommandArgument);
            cmd.Parameters.AddWithValue("@status", "Confirm");
            int ans = cmd.ExecuteNonQuery();

            gridbind();
            con.Close();
        }
    }
}