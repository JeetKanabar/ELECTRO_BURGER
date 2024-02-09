using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.IO;

public partial class admin_food : System.Web.UI.Page
{   
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["email"] == null)
        {
            Response.Redirect("~/login.aspx");
        }
    }
    protected void Submit_Click(object sender, EventArgs e)
    {
        try
        {
            string x = WebConfigurationManager.ConnectionStrings["mycon"].ConnectionString.ToString();
            SqlConnection con = new SqlConnection(x);
            con.Open();
            if (food_img.HasFile)
            {
                string fname = food_img.PostedFile.FileName.ToString();
                string ftype = Path.GetExtension(fname).ToString();
                if (ftype == ".jpg" || ftype == ".png" || ftype == ".jpeg")
                {
                    food_img.SaveAs(Server.MapPath("../items/") + fname);
                    string insert = "insert into foods(name,price,category,image)values(@name,@price,@category,@image)";
                    SqlCommand cmd = new SqlCommand(insert, con);
                    cmd.Parameters.AddWithValue("@name", name.Text.ToString());
                    cmd.Parameters.AddWithValue("@price", price.Text.ToString());
                    cmd.Parameters.AddWithValue("@category", category.Text.ToString());
                    cmd.Parameters.AddWithValue("@image", "../items/"+fname);
                    cmd.ExecuteNonQuery();
                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock(Page, typeof(Page), "ClientScript", "alert('Invalid Image File.')", true);
                }
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(Page, typeof(Page), "ClientScript", "alert('Please Select File.')", true);
            }

            con.Close();
            name.Text = "";
            price.Text = "";
            category.Text = "";
        }
        catch (Exception ex)
        {
            Response.Write(ex);
        }

    }
    protected void Reset_Click(object sender, EventArgs e)
    {
        name.Text = "";
        price.Text = "";
        category.Text = "";
    }
}