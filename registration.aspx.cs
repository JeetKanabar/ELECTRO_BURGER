using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Net.Mail;
using System.Web.Configuration;

public partial class registration : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            string x = WebConfigurationManager.ConnectionStrings["mycon"].ConnectionString.ToString();
            SqlConnection con = new SqlConnection(x);
            con.Open();
            string insert = "insert into registration(name,mno,email,pass,type)values(@name,@mno,@email,@pass,'user')";
            SqlCommand cmd = new SqlCommand(insert, con);
            cmd.Parameters.AddWithValue("@name", name.Text);
            cmd.Parameters.AddWithValue("@mno", mno.Text);
            cmd.Parameters.AddWithValue("@email", email.Text);
            cmd.Parameters.AddWithValue("@pass", pass.Text);
            cmd.ExecuteNonQuery();
            con.Close();
            MailMessage Msg = new MailMessage();
            Msg.From = new MailAddress(email.Text);
            Msg.To.Add(email.Text);
            Msg.Subject = "Your Registration Details";
            Msg.Body = "Hi, <br/>Please Check Your Registration Details<br/><br/>Your Name: " + name.Text + "<br/><br/>Your Email: " + email.Text + "<br/><br/>Your Mobile No: " + mno.Text + "<br/><br/>::You Need Any Help You Contect Me On Call Or Message::<br/>Contect No:: 78***8***1 / 87***21**5";
            Msg.IsBodyHtml = true;
            SmtpClient smtp = new SmtpClient();
            smtp.Host = "smtp.gmail.com";
            smtp.Port = 587;
            smtp.Credentials = new System.Net.NetworkCredential("electroburger16@gmail.com", "ymui rbex pptb lnqs");
            smtp.EnableSsl = true;
            smtp.Send(Msg);
            ScriptManager.RegisterClientScriptBlock(Page, typeof(Page), "ClientScript", "alert('Registration Successfully....')", true);
            Response.Redirect("login.aspx");
        }
        catch (Exception ex)
        {
            Response.Write(ex);
        }
    }
}