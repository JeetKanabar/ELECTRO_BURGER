<%@ Page Title="" Language="C#" MasterPageFile="~/user/user.master" AutoEventWireup="true" CodeFile="french fries.aspx.cs" Inherits="user_french_frice" %>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <html xmlns="http://www.w3.org/1999/xhtml">
        <body>
            <div>
                <h1 style="margin-bottom:20px; margin-top:20px;" align="center">FRENCH FRIES</h1>
                <asp:DataList ID="DataList1" runat="server" BackColor="White" BorderColor="#000000" BorderStyle="None" BorderWidth="1px" CellPadding="10" GridLines="Both" RepeatDirection="Horizontal" RepeatColumns="3" style="margin-left:100px" OnItemCommand="DataList1_ItemCommand">
                    <FooterStyle BackColor="White" ForeColor="#000066" />
                    <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                    <ItemStyle ForeColor="#000066" />
                    <ItemTemplate>
                        <table>
                            <tr>
                                <td>
                                    <asp:Image runat="server" ID="photo" ImageUrl='<%# Bind("image") %>' ImageAlign="AbsMiddle" Height="280" Width="410" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="lbl_name" runat="server" Text='<%# Bind("name") %>' style="font-size:20px; color:black;"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                  <td style="padding-top:10px;">
                                     <asp:Label ID="lbl_price" runat="server" Text='<%# Bind("price") %>' style="font-size:20px; color:black;"></asp:Label>
                                     <asp:LinkButton ID="LinkButton1" runat="server" CommandName="add" Text="ADD+" CommandArgument='<%# Bind("Id") %>' style="font-size:20px;border-color:black;color:white;background:black;border-radius:10px;margin:1px;padding:8px;border-width:10px;text-decoration:none;margin-left:265px;" ></asp:LinkButton>
                                </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                    <SelectedItemStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                </asp:DataList>
            </div>
        </body>
    </html>
</asp:Content>

