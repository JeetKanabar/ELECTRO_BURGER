<%@ Page Title="" Language="C#" MasterPageFile="~/user/user.master" AutoEventWireup="true" CodeFile="feedback.aspx.cs" Inherits="user_feedback" %>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Feedback & Complaint</title>
    <link href="../css/feedback.css" rel="stylesheet" />    
</head>
<body>
    <div class="cont">
    <div class="form sign-in">
      <h2>FEEDBACK</h2>
      <label>
        <asp:TextBox ID="name" placeholder="Name" runat="server" Class="input"></asp:TextBox>
      </label>
      <label>
        <asp:TextBox ID="mno" placeholder="Mobile No" runat="server" Class="input"></asp:TextBox>
      </label>
        <label>
        <asp:TextBox ID="email" placeholder="Email" runat="server" Class="input"></asp:TextBox>
      </label>
        <label>
        <asp:TextBox ID="feedback" placeholder="Your Feedback" runat="server" Class="input"></asp:TextBox>
      </label>
     <asp:Button ID="Button1" runat="server" Text="Submit" class="button , submit" OnClick="Button1_Click" />
    </div>

    <div class="sub-cont">
      <div class="img">
        <div class="img-btn">
          <span class="m-up">Complain</span>
          <span class="m-in">Feedback</span>
        </div>
      </div>
      <div class="form sign-up">
        <h2>COMPLAIN</h2>
        <label>
          <asp:TextBox ID="name1" placeholder="Name" runat="server" Class="input"></asp:TextBox>
        </label>
        <label>
          <asp:TextBox ID="mno1" placeholder="Mobile No" runat="server" Class="input"></asp:TextBox>
        </label>
        <label>
          <asp:TextBox ID="email1" placeholder="Email" runat="server" Class="input"></asp:TextBox>
        </label>
          <label>
              <asp:FileUpload ID="fup_img" runat="server" Class="input" />
        </label>
        <label>
          <asp:TextBox ID="complain" placeholder="Complain" runat="server" Class="input"></asp:TextBox>
        </label>
        <asp:Button ID="Button2" runat="server" Text="Submit" class="button , submit" OnClick="Button2_Click" />
      </div>
    </div>
  </div>
        
</body>
    <script>
        document.querySelector('.img-btn').addEventListener('click', function () {
            document.querySelector('.cont').classList.toggle('s-signup')
        }
);
    </script>
</html>
</asp:Content>

