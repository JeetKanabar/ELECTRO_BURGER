<%@ Page Title="" Language="C#" MasterPageFile="~/visitor.master" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Login</title>
    <link href="css/login.css" rel="stylesheet" />
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
</head> 
<body id="bodylog">
<div id="log">
    <div class="wrapper">
            <h1>Login </h1>
            <div class="input-box">
                <asp:TextBox ID="email" placeholder="Registered Email" class="input" runat="server" TextMode="Email"></asp:TextBox>
            </div>
            <div class="input-box">
                <asp:TextBox ID="pass" placeholder="Password" class="input" runat="server" TextMode="Password"></asp:TextBox>
            </div>
            <div class="register-link">
                <p><a id="A1" href="forgetpass.aspx" runat="server">Forget your password?</a></p>
            </div>
            <asp:Button ID="Button1" runat="server" class="btn" Text="LOGIN" OnClick="Button1_Click" />

            <div class="register-link">
                <p><a id="A2" href="registration.aspx" runat="server">Create an account...</a></p>
            </div>
        </div>
    </div>
</body>
</html>
</asp:Content>

