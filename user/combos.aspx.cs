using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Data.SqlClient;

public partial class user_coffee : System.Web.UI.Page
{
    string x = WebConfigurationManager.ConnectionStrings["mycon"].ConnectionString.ToString();

    public void gridbind()
    {
        SqlConnection con = new SqlConnection(x);
        con.Open();

        string q = "select * from foods where category='combos'";

        SqlCommand cmd = new SqlCommand(q, con);

        SqlDataReader dr = cmd.ExecuteReader();

        if (dr.HasRows)
        {
            DataList1.DataSource = dr;
            DataList1.DataBind();
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

    protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
    {
        Response.Redirect("temp_cart.aspx?id=" + e.CommandArgument.ToString());
    }
}