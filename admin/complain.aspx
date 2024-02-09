﻿<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="complain.aspx.cs" Inherits="admin_complain" %>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <html xmlns="http://www.w3.org/1999/xhtml">
        <body>
            <div>
                <h1 style="margin-bottom:20px; margin-top:20px;" align="center">COMPLAIN</h1>
                <asp:GridView ID="GridView1" runat="server" align="center" Width="100%" AutoGenerateColumns="False" Font-Size="X-Large" OnRowCommand="GridView1_RowCommand">
                      <rowstyle Height="80px" />
                     <alternatingrowstyle  Height="80px"/>
                    <HeaderStyle ForeColor="White" Font-Bold="True" BackColor="black" />
                    <Columns>  
                        <asp:TemplateField HeaderText="Name" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:Label ID="lbl_name" runat="server" Text='<%# Bind("name") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <Columns>  
                        <asp:TemplateField HeaderText="Contact No" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:Label ID="lbl_con" runat="server" Text='<%# Bind("con") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <Columns>  
                        <asp:TemplateField HeaderText="Email" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:Label ID="lbl_email" runat="server" Text='<%# Bind("email") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <Columns>  
                        <asp:TemplateField HeaderText="Photo" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:Image runat="server" ID="photo" ImageUrl='<%# Bind("img") %>' ImageAlign="AbsMiddle" Height="200" Width="200" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <Columns>  
                        <asp:TemplateField HeaderText="Complain" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:Label ID="lbl_comp" runat="server" Text='<%# Bind("comp") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                      <Columns>  
                        <asp:TemplateField HeaderText="Date" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:Label ID="lbl_date" runat="server" Text='<%# Bind("date") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                        <Columns>  
                        <asp:TemplateField HeaderText="Delete" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" CommandName="dlt" Text="DELETE" CommandArgument='<%# Bind("Id") %>' style="font-size:20px;border-color:black;color:white;background:black;border-radius:10px;margin:1px;padding:8px;border-width:10px;text-decoration:none;"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </body>
    </html>
</asp:Content>
