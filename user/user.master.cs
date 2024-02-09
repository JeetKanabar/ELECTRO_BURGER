using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

public partial class user_index : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
          string x = WebConfigurationManager.ConnectionStrings["mycon"].ConnectionString.ToString();
            SqlConnection con = new SqlConnection(x);
            SqlCommand cmd = new SqlCommand("select  name, email from registration where Id=@id", con);
            cmd.Parameters.AddWithValue("@id", Session["id"].ToString());
            cmd.CommandType = CommandType.Text;
            cmd.Connection = con;
            con.Open();
            SqlDataReader sdr = cmd.ExecuteReader();

            if (sdr.HasRows)
            {
                while (sdr.Read())
                {
                    name.Text = sdr["name"].ToString();
                    email.Text = sdr["email"].ToString();
                    
                }
            }
            con.Close();  
        }
    }
    protected void logout_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Session.RemoveAll();
        Response.Redirect("index.aspx");
    }
}
