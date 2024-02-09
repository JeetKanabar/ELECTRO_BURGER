using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Data.SqlClient;

public partial class user_temp_cart : System.Web.UI.Page
{
    string x = WebConfigurationManager.ConnectionStrings["mycon"].ConnectionString.ToString();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["email"] == null)
        {
            Response.Redirect("~/login.aspx");
        }
        SqlConnection con = new SqlConnection(x);
        con.Open();

        string q = "select * from foods where Id=@id";

        SqlCommand cmd = new SqlCommand(q, con);

        cmd.Parameters.AddWithValue("@id", Request.QueryString["id"].ToString());

        SqlDataReader dr = cmd.ExecuteReader();

        if (dr.HasRows)
        {
            dr.Read();
            Image1.ImageUrl = dr["image"].ToString();
            p_name.Text = dr["name"].ToString();
            price.Text = dr["price"].ToString();

            dr.Close();
            dr.Dispose();
        }
        con.Close();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(x);
        con.Open();

        string i = "insert into cart(p_id,email,image,pname,price,qty)values(@p_id,@email,@image,@pname,@price,@qty)";

        SqlCommand cmd1 = new SqlCommand(i, con);

        cmd1.Parameters.AddWithValue("@p_id", Request.QueryString["id"]);
        cmd1.Parameters.AddWithValue("@email", Session["email"].ToString());
        cmd1.Parameters.AddWithValue("@image", Image1.ImageUrl.ToString());
        cmd1.Parameters.AddWithValue("@pname", p_name.Text.ToString());
        cmd1.Parameters.AddWithValue("@price", price.Text.ToString());
        cmd1.Parameters.AddWithValue("@qty", TextBox1.Text.ToString());

        int ans = cmd1.ExecuteNonQuery();

        if (ans > 0)
        {
            con.Close();
            Response.Redirect("your_cart.aspx");
        }
    }
}