<%@ Page Title="" Language="C#" MasterPageFile="~/SiteTemplate.Master" AutoEventWireup="true" CodeBehind="BrdList.aspx.cs" Inherits="finalexam.Board.BrdList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
   
    <asp:Label ID="lblCat" runat="server" Text="free" Visible="false"></asp:Label>
    <table style="width:1000px; text-align:center; left:0; right:0; margin:auto;" >
        <tr>
            <td style="border-bottom:solid 1px"><h1><asp:Label ID="lblTitle" runat="server" ></asp:Label></h1></td>
        </tr>
        <tr>
            <td style="width:90%">
                <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" DataKeyNames="num" DataSourceID="SqlDataSource1" AllowPaging="True" Width="100%" align="center">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="num" HeaderText="No" InsertVisible="False" ReadOnly="True" SortExpression="num" />
                        <%--<asp:BoundField DataField="title" HeaderText="제목" SortExpression="title" />--%>
                        <asp:TemplateField HeaderText="제목">
                            <ItemTemplate>
                                <a href="<%# "BrdView.aspx?No=" + Eval("num") %>">
                                    <%# Eval("title") %>
                                </a>
                            </ItemTemplate>
                            <HeaderStyle Width="250px" />
                        </asp:TemplateField>

                        <asp:BoundField DataField="name" HeaderText="작성자" SortExpression="name" />
                        <asp:BoundField DataField="writedate" HeaderText="작성일" SortExpression="writedate" />
                        <asp:BoundField DataField="readcnt" HeaderText="조회수" SortExpression="readcnt" />
                    </Columns>
                    <EditRowStyle BackColor="#2461BF" />
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EFF3FB" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F5F7FB" />
                    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                    <SortedDescendingCellStyle BackColor="#E9EBEF" />
                    <SortedDescendingHeaderStyle BackColor="#4870BE" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:FinalexamConnectionString %>" SelectCommand="SELECT [num], [title], [name], [writedate], [readcnt] FROM [board] WHERE ([category] = @category)">
                    <SelectParameters>
                        <asp:ControlParameter Name="category" Type="String"  ControlID="lblCat" PropertyName="Text"></asp:ControlParameter>
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td style="width:100%; text-align:left; padding-top:30px; padding-left:10px; ">
                <asp:Button ID="btnBrdAdd" runat="server" Text="글쓰기" OnClick="btnBrdAdd_Click" Width="150px"/>
            </td>
        </tr>
    </table>
</asp:Content>
