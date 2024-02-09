<%@ Page Title="" Language="C#" MasterPageFile="~/user/user.master" AutoEventWireup="true" CodeFile="your_cart.aspx.cs" Inherits="user_your_cart" %>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Your Cart</title>
<style>
b{
  color: black;
  font-size:20px;
}

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
  padding-right: 500px;
}
    .total {
        margin-top:30px;
        margin-left:600px;
        font-size:40px;
    }
</style>
</head>
<body>
<br />

<h1 align="center">YOUR CART</h1>

  <div class="container">  
      <table style="width:148%">
          <tr>
	<td><b>Name :</b></td><td><b>Mobile No :</b></td><td><b>Email :</b></td></tr>
    <tr><td><asp:TextBox ID="name" runat="server" class="input"></asp:TextBox></td>
    <td><asp:TextBox ID="mno" runat="server" class="input"></asp:TextBox></td>
    <td><asp:TextBox ID="email" runat="server" class="input"></asp:TextBox></td></tr>
          </table>

      <table style="width:148%">
          <tr>
	<td><b>Address:</b></td><td><b>City :</b></td><td><b>Pincode :</b></td></tr>
    <tr><td><asp:TextBox ID="address" runat="server" class="input" placeholder="ENTER FULL ADDRESS"></asp:TextBox></td>
    <td><asp:TextBox ID="city" runat="server" class="input" placeholder="ENTER CITY NAME"></asp:TextBox></td>
    <td><asp:TextBox ID="pincode" runat="server" class="input" placeholder="ENTER PINCODE"></asp:TextBox></td></tr>
          </table>
      </div>
    <div>

        <table border="1" style="width:100%">
                            <tr style="text-align:center;">
                                <td style="width:319px;">
                                    <asp:Label ID="Label1" runat="server" Text="Photo" style="font-size:20px;color:black;"></asp:Label>
                                </td>
                                <td style="width:600px;">
                                    <asp:Label ID="Label2" runat="server" Text="Product Name" style="font-size:20px;color:black;"></asp:Label>
                                </td>
                                <td style="width:135px;">
                                    <asp:Label ID="Label3" runat="server" Text="Price" style="font-size:20px;color:black;"></asp:Label>
                                </td>
                                <td style="width:145px;">
                                    <asp:Label ID="Label4" runat="server" Text="Quantity" style="font-size:20px;color:black;"></asp:Label>
                                </td>
                                <td style="width:200px;">
                                    <asp:Label ID="Label5" runat="server" Text="Order" style="font-size:20px;color:black;"></asp:Label>
                                </td>
                                <td style="width:155px">
                                    <asp:Label ID="Label6" runat="server" Text="Remove" style="font-size:20px;color:black;"></asp:Label>
                                </td>
                            </tr>
                <asp:DataList ID="DataList1" runat="server" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" width="100%" CellPadding="10" GridLines="Both" OnItemCommand="DataList1_ItemCommand" >
                    <FooterStyle BackColor="White" ForeColor="#000066" />
                    <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                    <ItemStyle ForeColor="#000066" />
                    <ItemTemplate>
                        
                            <tr style="text-align:center;">
                                <td style="width:250px">
                                    <asp:Image runat="server" ID="photo" ImageUrl='<%# Bind("image") %>' ImageAlign="AbsMiddle" Height="200" Width="300" />
                                </td>
                                <td style="width:600px">
                                    <asp:Label ID="lbl_name" runat="server" Text='<%# Bind("pname") %>' style="font-size:20px; color:black;"></asp:Label>
                                </td>
                                  <td style="width:135px;">
                                     <asp:Label ID="lbl_price" runat="server" Text='<%# Bind("price") %>' style="font-size:20px; color:black;"></asp:Label>
                                </td>
                                <td style="width:150px;">
                                     <asp:Label ID="qty" runat="server" Text='<%# Bind("qty") %>' style="font-size:20px; color:black;"></asp:Label>
                                </td>
                                <td style="padding-top:20px; width:200px">
                                    <asp:LinkButton ID="LinkButton2" runat="server" CommandName="order" Text="Order" CommandArgument='<%# Bind("Id") %>' style="font-size:25px;border-color:black;color:white;background:black;border-radius:10px;margin:1px;padding:8px;border-width:10px;text-decoration:none;" ></asp:LinkButton>
                                </td>
                                <td>
                                    <asp:LinkButton ID="LinkButton3" runat="server" CommandName="remove" Text="Remove" CommandArgument='<%# Bind("Id") %>' style="font-size:25px;border-color:black;color:white;background:black;border-radius:10px;margin:1px;padding:8px;border-width:10px;text-decoration:none;" ></asp:LinkButton>
                                </td>
                            </tr>
                                    
                        
                        
                    </ItemTemplate>
                    <SelectedItemStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                </asp:DataList></table>
        <asp:Button ID="Button2" runat="server" Text="Add More Item"  OnClick="Button2_Click" style="font-size:25px;border-color:black;color:white;background:black;border-radius:10px;margin:1px;padding:8px;border-width:10px;text-decoration:none;margin-left:650px;margin-top:20px;"/>
            </div>

   </body>    
</html>
</asp:Content>

