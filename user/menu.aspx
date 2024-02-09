<%@ Page Title="" Language="C#" MasterPageFile="~/user/user.master" AutoEventWireup="true" CodeFile="menu.aspx.cs" Inherits="menu" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
    <style>
        main{
           
        display: grid;
        grid-template-columns: auto auto auto auto;
        gap: 10px;
		padding-top: 5%;
		column-gap: 10px;
		row-gap: 20%;
		justify-content: space-evenly;
        margin-bottom:100px;
	
        }
        h6 {
            margin-bottom:40px;
            margin-top:30px;
            font-size:30px; 
            text-decoration-color:black;
        }
        a {
            text-decoration:none;
            color:black;
        }
        .container{
	        height:270px;
	        width:270px;
	        display: flex;
	        justify-content: center;
	        align-items: center;
	        border-top: 10px inset #000;
	        border-bottom: 10px inset #000;
	        border-left: 10px inset #000;
	        border-right: 10px inset #000;
	        transition: all ease 0.2s;
	        cursor: pointer;

        }
        .img{
	        height:250px;
	        width:250px;
            margin-top:100px;
        }
        .img1{
	        height:250px;
	        width:450px;
            margin-top:100px;
        }
        .img2{
	        height:250px;
	        width:350px;
            margin-top:100px;
            margin-right:60px;
        }
         .container:hover {
	        scale: 1.05;
        }
        .marquee__part {
          flex-shrink: 0;
          padding: 0 4px;
          font-smooth: always;
        }

        .marquee {
          background: #3B7FFF;
          color: #EEE;
          text-transform: uppercase;
          font-weight: 600;
          font-size: 1.667vw;
          padding: 32px 0;
          position: relative;
          overflow: hidden;
        }

        .marquee__inner {
          -webkit-font-smoothing: antialiased;
          width: fit-content;
          display: flex;
          flex: auto;
        }

    </style>
</head>
<body>
    <h1 style="margin-bottom:10px; font-size:50px; padding-top:10px;" align="center">MENU</h1>
<main>
    
	<div class="container">
		<a href="burger.aspx">
			<img src="../images/burger menu.png" alt="Girl in a jacket" class="img" />
            <h6 align="center">BURGER</h6>
		</a>
	</div>
    <div class="container">
		<a href="french fries.aspx">
			<img src="../images/french fries.png"" alt="Girl in a jacket" class="img" />
            <h6 align="center">FRENCH FRIES</h6>
		</a>
	</div>
    <div class="container">
		<a href="cold drink.aspx">
			<img src="../images/cold%20drink.png" alt="Girl in a jacket" class="img1" />
            <h6 align="center">COLD DRINK</h6>
		</a>
	</div>
    <div class="container">
		<a href="combos.aspx">
			<img src="../images/combo.png" alt="Girl in a jacket" class="img2" />
            <h6 align="center">COMBOS</h6>
		</a>
	</div>

</main></body>
</html>
</asp:Content>

