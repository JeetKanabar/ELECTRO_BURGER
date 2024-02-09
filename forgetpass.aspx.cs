using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System;
using System.Data;
using System.Data.SqlClient;
using System.Net.Mail;
using System.Web.Configuration;


public partial class forgetpass : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            DataSet ds = new DataSet();
            string x = WebConfigurationManager.ConnectionStrings["mycon"].ConnectionString.ToString();
            using ( SqlConnection con = new SqlConnection(x))
            {
            con.Open();
            SqlCommand cmd = new SqlCommand("SELECT * FROM registration Where Email= '" + txtemail.Text.Trim() + "'", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(ds);
            con.Close();
            }
            if(ds.Tables[0].Rows.Count>0)
            {
            MailMessage Msg = new MailMessage();
            Msg.From = new MailAddress(txtemail.Text);
            Msg.To.Add(txtemail.Text);
            Msg.Subject = "Your Password Details";
            Msg.Body = "Hi, <br/>Please Check Your Login Details<br/><br/>Your Username: " + ds.Tables[0].Rows[0]["name"] + "<br/><br/>Your Email: " + ds.Tables[0].Rows[0]["email"] + "<br/><br/>Your Password: " + ds.Tables[0].Rows[0]["pass"] + "<br/><br/>::You Need Any Help You Contect Me On Call Or Message::<br/>Contect No:: 78***8***1 / 87***21**5";
            Msg.IsBodyHtml = true;
            SmtpClient smtp = new SmtpClient();
            smtp.Host = "smtp.gmail.com";
            smtp.Port = 587;
            smtp.Credentials = new System.Net.NetworkCredential("electroburger16@gmail.com", "ymui rbex pptb lnqs");
            smtp.EnableSsl = true;
            smtp.Send(Msg);

            Response.Write("<script>alert ('Password Successfully Send To Your Email...') </script>");

            //ScriptManager.RegisterClientScriptBlock(Page, typeof(Page), "ClientScript", "alert('Password Successfully Send To Your Email...')", true);
            }
            else
            {
                Response.Write("<script>alert ('Email Sending Failed.....') </script>");
                //ScriptManager.RegisterClientScriptBlock(Page, typeof(Page), "ClientScript", "alert('Email Sending Failed.....')", true);
            }
        }
        catch (Exception ex)
        {
            Console.WriteLine("{0} Exception caught.", ex);
        }
        txtemail.Text = "";
        Response.Redirect("login.aspx");
    }
}

    
