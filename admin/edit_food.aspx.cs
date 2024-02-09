using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Data.SqlClient;

public partial class admin_edit_food : System.Web.UI.Page
{
    string x = WebConfigurationManager.ConnectionStrings["mycon"].ConnectionString.ToString();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["email"] == null)
        {
            Response.Redirect("~/login.aspx");
        }
        if (!IsPostBack)
        {
            int id = Convert.ToInt32(Request.QueryString["id"]);

            SqlConnection con = new SqlConnection(x);
            con.Open();

            string s = "select * from foods where Id=@id";

            SqlCommand cmd = new SqlCommand(s, con);

            cmd.Parameters.AddWithValue("@id", id);

            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.HasRows)
            {
                dr.Read();
                no.Text = dr["Id"].ToString();
                name.Text = dr["name"].ToString();
                price.Text = dr["price"].ToString();
                no.ReadOnly = true;
            }

            dr.Dispose();
            con.Close();

        }
    }
    protected void Submit_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(x);
        con.Open();

        string u = "update foods set name=@name, price=@price where Id=@id";

        SqlCommand cmd = new SqlCommand(u, con);

        cmd.Parameters.AddWithValue("@name", name.Text.ToString());
        cmd.Parameters.AddWithValue("@price", price.Text.ToString());

        cmd.Parameters.AddWithValue("@id", no.Text);
        
        int ans=cmd.ExecuteNonQuery();

        if (ans > 0)
        {
            con.Close();
           Response.Redirect("view_food.aspx");
        }
        else
        {
            Response.Write("no");
        }

        
    }
}