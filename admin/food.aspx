<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="food.aspx.cs" Inherits="admin_food" %>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Add Product</title>
<style>
b{
 
}
body {background: url("image/background.svg");}

.input{
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 3px solid black;
  box-sizing: border-box;
  border-radius: 0.50rem;
}
.container {
  padding-left: 500px;
  padding-right: 500px;
}
</style>
</head>
<body>
<br />

<h1 align="center">ADD PRODUCT</h1>

  <div class="container">  
	<b>Item Name :</b>
    <asp:TextBox ID="name" runat="server" class="input" placeholder="ENTER NAME"></asp:TextBox>
    
    <b>Price :</b>
    <asp:TextBox ID="price" runat="server" class="input" placeholder="ENTER PRICE"></asp:TextBox>

	<b>Category :</b>
    <asp:DropDownList ID="category" runat="server" class="input" placeholder="ENTER CATEGORY">
        <asp:ListItem>burger</asp:ListItem>
        <asp:ListItem>french fries</asp:ListItem>
        <asp:ListItem>cold drink</asp:ListItem>
        <asp:ListItem>combos</asp:ListItem>
      </asp:DropDownList>
	<b>Photo :</b>
	<asp:FileUpload ID="food_img" runat="server" class="input" ></asp:FileUpload>
    
    <asp:Button ID="Submit" runat="server" Text="Submit" style="font-size:20px;border-color:black;color:white;background:black;border-radius:10px;margin:1px;padding:8px;border-width:10px" OnClick="Submit_Click"></asp:Button>
	<asp:Button ID="Reset" runat="server" Text="Reset" style="font-size:20px;border-color:black;color:white;background:black;border-radius:10px;margin:1px;padding:8px;border-width:10px" OnClick="Reset_Click"></asp:Button>
  </div>
</body>
</html>
</asp:Content>

