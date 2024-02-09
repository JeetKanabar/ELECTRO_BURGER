<%@ Page Title="" Language="C#" MasterPageFile="~/visitor.master" AutoEventWireup="true" CodeFile="registration.aspx.cs" Inherits="registration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Registration</title>
    <link href="css/registration.css" rel="stylesheet" />
</head>
<body id="bodyreg">
   <div id="reg">
    <div class="wrapper">
   <h1>REGISTRATION</h1>
            <div class="input-box">
                <asp:TextBox ID="name" placeholder="Your Name" class="input" runat="server" TextMode="SingleLine"></asp:TextBox>
            </div>
            <div class="input-box">
                <asp:TextBox ID="mno" placeholder="Your Mobile No" class="input" runat="server" TextMode="Phone"></asp:TextBox>
            </div>
        <div class="input-box">
                <asp:TextBox ID="email" placeholder="Your Email" class="input" runat="server" TextMode="Email"></asp:TextBox>
            </div>
        <div class="input-box">
                <asp:TextBox ID="pass" placeholder="Password" class="input" runat="server"></asp:TextBox>
            </div>
            <asp:Button ID="Button1" runat="server" class="btn" Text="SUBMIT" OnClick="Button1_Click" />
            <div class="register-link">
                <p><a id="A2" href="login.aspx" runat="server">Login Already customer??</a></p>
            </div>
        </div>
    </div>
</body>
</html>

</asp:Content>

