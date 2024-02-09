using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Configuration;

public partial class login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string x = WebConfigurationManager.ConnectionStrings["mycon"].ConnectionString.ToString();
        SqlConnection con = new SqlConnection(x);
        con.Open();

        SqlCommand cmd = new SqlCommand("select id, email, pass, type from registration where email=@email and pass=@pass", con);
        cmd.Parameters.AddWithValue("@email", email.Text.ToString());
        cmd.Parameters.AddWithValue("@pass", pass.Text.ToString());

        SqlDataReader dr = cmd.ExecuteReader();
        if (dr.HasRows)
        {
            dr.Read();
            if (dr["type"].ToString() == "user")
            {
                Session["id"] = dr["Id"].ToString();
                Session["email"] = email.Text;
                Response.Redirect("user/index.aspx");
            }
            else
            {
                Session["id"] = dr["Id"].ToString();
                Session["email"] = email.Text;
                Response.Redirect("admin/index.aspx");
            }
        }
        else
        {
            ScriptManager.RegisterClientScriptBlock(Page, typeof(Page), "ClientScript", "alert('Invalid Email Or Password....')", true);
            Response.Redirect("login.aspx");
        }

        con.Close();
    }
}