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

public partial class user_feedback : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
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
                    name1.Text = sdr["name"].ToString();
                    mno1.Text = sdr["mno"].ToString();
                    email1.Text = sdr["email"].ToString();
                    name.ReadOnly = true;
                    mno.ReadOnly = true;
                    email.ReadOnly = true;
                    name1.ReadOnly = true;
                    mno1.ReadOnly = true;
                    email1.ReadOnly = true;
                }
            }
            con.Close();
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            string x = WebConfigurationManager.ConnectionStrings["mycon"].ConnectionString.ToString();
            SqlConnection con = new SqlConnection(x);
            con.Open();
            string insert = "insert into feedback(name,email,con,feedback,date)values(@name,@email,@con,@feedback,@GETDATE)";
            SqlCommand cmd = new SqlCommand(insert, con);
            cmd.Parameters.AddWithValue("@name", name.Text.ToString());
            cmd.Parameters.AddWithValue("@email", email.Text.ToString());
            cmd.Parameters.AddWithValue("@con", mno.Text.ToString());
            cmd.Parameters.AddWithValue("@feedback", feedback.Text.ToString());
            cmd.Parameters.AddWithValue("@GETDATE", DateTime.Now);
            cmd.ExecuteNonQuery();
            con.Close();
            Response.Write("<script> alert('Your Feedback Send Successfully.......')</script>");
            feedback.Text = "";
        }
        catch (Exception ex)
        {
            Response.Write(ex);
        }

    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        try
        {
            string x = WebConfigurationManager.ConnectionStrings["mycon"].ConnectionString.ToString();
            SqlConnection con = new SqlConnection(x);
            con.Open();
            if (fup_img.HasFile)
            {
                string fname = fup_img.PostedFile.FileName.ToString();
                string ftype = Path.GetExtension(fname).ToString();
                if (ftype == ".jpg" || ftype == ".png")
                {
                    fup_img.SaveAs(Server.MapPath("img/") + fname);

                    string insert = "insert into complain(name,email,con,img,comp,date)values(@name,@email,@con,@img,@comp,@GETDATE)";
                    SqlCommand cmd = new SqlCommand(insert, con);
                    cmd.Parameters.AddWithValue("@name", name.Text.ToString());
                    cmd.Parameters.AddWithValue("@email", email.Text.ToString());
                    cmd.Parameters.AddWithValue("@con", mno.Text.ToString());
                    cmd.Parameters.AddWithValue("@img", "../user/img/"+fname);
                    cmd.Parameters.AddWithValue("@comp", complain.Text.ToString());
                    cmd.Parameters.AddWithValue("@GETDATE", DateTime.Now);
                    cmd.ExecuteNonQuery();
                }
                else
                {
                    Response.Write("<script> alert('Invalid Image File....')</script>");
                }
            }
            else
            {
                Response.Write("<script> alert('Please Select File....')</script>");
            }
            
            con.Close();
            complain.Text = "";
        }
        catch (Exception ex)
        {
            Response.Write(ex);
        }
    }
}