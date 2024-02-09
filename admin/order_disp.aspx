<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="order_disp.aspx.cs" Inherits="admin_order_disp" %>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <html xmlns="http://www.w3.org/1999/xhtml">
        <body>
            <div>
                <h1 style="margin-bottom:20px; margin-top:20px;" align="center">VIEW ORDER</h1>
                <asp:GridView ID="GridView1" runat="server" align="center" Width="100%" AutoGenerateColumns="False" Font-Size="X-Large" OnRowCommand="GridView1_RowCommand" >
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
                        <asp:TemplateField HeaderText="Mobile No" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:Label ID="lbl_mno" runat="server" Text='<%# Bind("mno") %>'></asp:Label>
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
                        <asp:TemplateField HeaderText="Image" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:Image runat="server" ID="photo" ImageUrl='<%# Bind("image") %>' ImageAlign="AbsMiddle" Height="200" Width="200" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                       <Columns>  
                        <asp:TemplateField HeaderText="Product Name" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:Label ID="lbl_pname" runat="server" Text='<%# Bind("pname") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                       <Columns>  
                        <asp:TemplateField HeaderText="Quantity" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:Label ID="lbl_qty" runat="server" Text='<%# Bind("qty") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                       <Columns>  
                        <asp:TemplateField HeaderText="Price" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:Label ID="lbl_price" runat="server" Text='<%# Bind("price") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                       <Columns>  
                        <asp:TemplateField HeaderText="Address" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:Label ID="lbl_address" runat="server" Text='<%# Bind("address") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                       <Columns>  
                        <asp:TemplateField HeaderText="City" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:Label ID="lbl_city" runat="server" Text='<%# Bind("city") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                       <Columns>  
                        <asp:TemplateField HeaderText="Pin Code" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:Label ID="lbl_pincode" runat="server" Text='<%# Bind("pincode") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                       <Columns>  
                        <asp:TemplateField HeaderText="Status" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:Label ID="lbl_sattus" runat="server" Text='<%# Bind("status") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                        <Columns>  
                        <asp:TemplateField HeaderText="CONFIRM" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" CommandName="confirm" Text="Confirm" CommandArgument='<%# Bind("Id") %>' style="font-size:20px;border-color:black;color:white;background:black;border-radius:10px;margin:1px;padding:8px;border-width:10px;text-decoration:none;"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </body>
    </html>
</asp:Content>

