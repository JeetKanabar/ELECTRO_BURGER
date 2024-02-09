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

public partial class user_your_cart : System.Web.UI.Page
{
    string x = WebConfigurationManager.ConnectionStrings["mycon"].ConnectionString.ToString();
   
    public void gridbind()
    {
        SqlConnection con = new SqlConnection(x);
        con.Open();

        string q = "select * from cart where email=@email";

        SqlCommand cmd = new SqlCommand(q, con);
        cmd.Parameters.AddWithValue("@email", Session["email"].ToString());
        SqlDataReader dr = cmd.ExecuteReader();

        if (dr.HasRows)
        {
            DataList1.DataSource = dr;
            DataList1.DataBind();
        }

        dr.Dispose();
        con.Close();
    }
    public void user()
    {
        if (!this.IsPostBack)
        {
            string x = WebConfigurationManager.ConnectionStrings["mycon"].ConnectionString.ToString();
            SqlConnection con = new SqlConnection(x);
            SqlCommand cmd = new SqlCommand("select name, mno, email from registration where Id=@id", con);
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
                    mno.Text = sdr["mno"].ToString();
                    email.Text = sdr["email"].ToString();
                    name.ReadOnly = true;
                    mno.ReadOnly = true;
                    email.ReadOnly = true;
                }
            }
        } 
    }
    protected void Page_Load(object sender, EventArgs e)
    {      
        gridbind();
        user();
    }
   
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("menu.aspx");
    }

    protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
    {
        if (e.CommandName == "remove")
        {
            SqlConnection con = new SqlConnection(x);
            con.Open();

            string q = "delete from cart where Id=@Id";

            SqlCommand cmd = new SqlCommand(q, con);

            cmd.Parameters.AddWithValue("@Id", e.CommandArgument);

            int ans = cmd.ExecuteNonQuery();

            gridbind();
            con.Close();
            Response.Redirect("your_cart.aspx");
        }
        if (e.CommandName == "order")
        {
            Image photo = (Image)e.Item.FindControl("photo");
            string img = photo.ImageUrl.ToString();

            Label lbl_name = (Label)e.Item.FindControl("lbl_name");
            string lbl_pname = lbl_name.Text.ToString();

            Label lbl_price = (Label)e.Item.FindControl("lbl_price");
            string lbl_price1 = lbl_price.Text.ToString();

            Label qty = (Label)e.Item.FindControl("qty");
            string qt = qty.Text.ToString();

            SqlConnection con = new SqlConnection(x);
            con.Open();
            string insert = "insert into orders (name,mno,email,date,image,pname,qty,price,address,city,pincode,status)values(@name,@mno,@email,@date,@image,@pname,@qty,@price,@address,@city,@pincode,@status)";
            SqlCommand cmd = new SqlCommand(insert, con);
            cmd.Parameters.AddWithValue("@name", name.Text);
            cmd.Parameters.AddWithValue("@mno", mno.Text);
            cmd.Parameters.AddWithValue("@email", email.Text);
            cmd.Parameters.AddWithValue("@date", DateTime.Now.Date.ToString());
            cmd.Parameters.AddWithValue("@image", img.ToString());
            cmd.Parameters.AddWithValue("@pname", lbl_pname.ToString());
            cmd.Parameters.AddWithValue("@qty", qt.ToString());
            cmd.Parameters.AddWithValue("@price", lbl_price1.ToString());
            cmd.Parameters.AddWithValue("@address", address.Text.ToString());
            cmd.Parameters.AddWithValue("@city", city.Text);
            cmd.Parameters.AddWithValue("@pincode", pincode.Text);
            cmd.Parameters.AddWithValue("@status", "Pending");
            cmd.ExecuteNonQuery();

            string q = "delete from cart where Id=@Id";

            SqlCommand cmd1 = new SqlCommand(q, con);

            cmd1.Parameters.AddWithValue("@Id", e.CommandArgument);

            int ans = cmd1.ExecuteNonQuery();

            gridbind();
            con.Close();
            Response.Redirect("your_cart.aspx");
        }
    }
}