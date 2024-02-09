<%@ Page Title="" Language="C#" MasterPageFile="~/visitor.master" AutoEventWireup="true" CodeFile="forgetpass.aspx.cs" Inherits="forgetpass" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
   <style>
       body{
           display: inline-flexbox;
            background-image: url("images/forget password.jpg");
            background-repeat: no-repeat;
            background-size: cover;
            background-position: center;   
            overflow-x:hidden;        
        }
        .forget-card{
            position: relative;
            z-index: 3;
            width: 100%;
            margin: 0 20px;
            padding-right:900px;
            padding-top:200px;
            padding-bottom:140px;
            border-radius: 1.25rem;
            background: linear-gradient(135deg, rgba(255, 255, 255, 0.1), rgba(255, 255, 255, 0));
            text-align: center;
        }

        h2{
            color:white;
            font-size: 36px;
            font-weight: 600;
            margin: 0 0 20px 0;
        }

        .input, .button{
            width: 60%;
            height: 50px;
        }

        .input {
            border: 2px solid #ebebeb;
            font-family: inherit;
            font-size: 15px;
            padding: 0 16px;
            border-radius: 1.25rem;
            transition: all 0.375s;
        }

        .input:hover{
            border: 2px solid gray;
        }

        .button{
            cursor: pointer;
            width: 60%;
            padding: 0 16px;
            border-radius: 1.25rem;
            background: white;
            color: black;
            border: 0;
            font-family: inherit;
            font-size: 1rem;
            font-weight: 600;
            text-align: center;
            letter-spacing: 2px;
            transition: all 0.375s;
        }

        .button:hover{
            border: 2px solid gray;
            border-radius: 1.25rem;
        }

        .a{
            color: #fff;
            font-size: 1rem;
            text-align: left;
            text-decoration: none;
            margin-bottom: 6px;
            transition: all 0.375s;
        }

        .a:hover{
            color: gray;
        }

   </style>
    <title>Forgot Password</title>
</head>
<body>
	<div>
		<div class="forget-card">
			<h2>Forgot Password</h2>
            <asp:TextBox ID="txtemail" runat="server" class="input" placeholder="Registered Email"></asp:TextBox><br /><br />
            <a href="login.aspx" class="a">Back to login..!</a><br /><br />
            <asp:Button ID="Button1" runat="server" Text="Button" class="button" OnClick="Button1_Click" />
            <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
		</div>
	</div>
</body>
</html>	
</asp:Content>

