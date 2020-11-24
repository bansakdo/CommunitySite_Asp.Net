<%@ Page Title="" Language="C#" MasterPageFile="~/SiteTemplate.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="finalexam.FrmDefault" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">



    <%-- 전체 글 보기 --%>
     <table style="width:1000px; text-align:center; left:0; right:0; margin:auto;" >
        <tr>
            <td style="border-bottom:solid 1px; text-align:left; "><h1><asp:Label ID="lblTitle" runat="server" Text="전체 글" ></asp:Label></h1></td>
        </tr>
        <tr>
            <td style="width:90%">
                <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" DataKeyNames="num" DataSourceID="SqlDataSource1" Width="100%" align="center">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="num" HeaderText="No" InsertVisible="False" ReadOnly="True" SortExpression="num" />
                        <asp:TemplateField HeaderText="제목">
                            <ItemTemplate>
                                <a href="<%# "Board/BrdView.aspx?No=" + Eval("num") %>">
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
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:FinalexamConnectionString %>" SelectCommand="SELECT [num], [title], [name], [writedate], [readcnt] FROM [board] ">
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td style="width:100%; text-align:right; padding-top:20px; padding-left:10px; padding-bottom:20px;">
                <asp:Button ID="btnBrdAllList" runat="server" Text="글 더보기" OnClick="btnBrdAllList_Click" Width="150px"/>
            </td>
        </tr>
    </table>


    <%-- 공지사항 --%>
    
    <asp:Label ID="Label3" runat="server" Text="free" Visible="false"></asp:Label>
     <table style="width:1000px; text-align:center; left:0; right:0; margin:auto;" >
        <tr>
            <td style="border-bottom:solid 1px; text-align:left; "><h1><asp:Label ID="Label4" runat="server" Text="공지사항" ></asp:Label></h1></td>
        </tr>
        <tr>
            <td style="width:90%">
                <asp:GridView ID="GridView4" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" DataKeyNames="num" DataSourceID="SqlDataSource4" Width="100%" align="center">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="num" HeaderText="No" InsertVisible="False" ReadOnly="True" SortExpression="num" />
                        <asp:TemplateField HeaderText="제목">
                            <ItemTemplate>
                                <a href="<%# "Board/BrdView.aspx?No=" + Eval("num") %>">
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
                <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:FinalexamConnectionString %>" SelectCommand="SELECT [num], [title], [name], [writedate], [readcnt] FROM [board] WHERE ([category] = 'notice')">
                    <SelectParameters>
                        <asp:ControlParameter Name="category" Type="String"  ControlID="lblFreeCat" PropertyName="Text"></asp:ControlParameter>
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td style="width:100%; text-align:right; padding-top:20px; padding-left:10px; padding-bottom:20px;">
                <asp:Button ID="Button1" runat="server" Text="글 더보기" OnClick="Button1_Click" Width="150px"/>
            </td>
        </tr>
    </table>


    <%-- 자유게시판 --%>
    
    <asp:Label ID="lblFreeCat" runat="server" Text="free" Visible="false"></asp:Label>
     <table style="width:1000px; text-align:center; left:0; right:0; margin:auto;" >
        <tr>
            <td style="border-bottom:solid 1px; text-align:left; "><h1><asp:Label ID="Label1" runat="server" Text="자유게시판" ></asp:Label></h1></td>
        </tr>
        <tr>
            <td style="width:90%">
                <asp:GridView ID="GridView2" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" DataKeyNames="num" DataSourceID="SqlDataSource2" Width="100%" align="center">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="num" HeaderText="No" InsertVisible="False" ReadOnly="True" SortExpression="num" />
                        <asp:TemplateField HeaderText="제목">
                            <ItemTemplate>
                                <a href="<%# "Board/BrdView.aspx?No=" + Eval("num") %>">
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
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:FinalexamConnectionString %>" SelectCommand="SELECT [num], [title], [name], [writedate], [readcnt] FROM [board] WHERE ([category] = @category)">
                    <SelectParameters>
                        <asp:ControlParameter Name="category" Type="String"  ControlID="lblFreeCat" PropertyName="Text"></asp:ControlParameter>
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td style="width:100%; text-align:right; padding-top:20px; padding-left:10px; padding-bottom:20px;">
                <asp:Button ID="btnBrdFreelist" runat="server" Text="글 더보기" OnClick="btnBrdFreelist_Click" Width="150px"/>
            </td>
        </tr>
    </table>



    <%-- 뉴스 게시판 --%>
    
    <asp:Label ID="lblNewsCat" runat="server" Text="news" Visible="false"></asp:Label>
     <table style="width:1000px; text-align:center; left:0; right:0; margin:auto;" >
        <tr>
            <td style="border-bottom:solid 1px; text-align:left; "><h1><asp:Label ID="Label2" runat="server" Text="뉴스게시판" ></asp:Label></h1></td>
        </tr>
        <tr>
            <td style="width:90%">
                <asp:GridView ID="GridView3" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" DataKeyNames="num" DataSourceID="SqlDataSource3" Width="100%" align="center">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="num" HeaderText="No" InsertVisible="False" ReadOnly="True" SortExpression="num" />
                        <asp:TemplateField HeaderText="제목">
                            <ItemTemplate>
                                <a href="<%# "Board/BrdView.aspx?No=" + Eval("num") %>">
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
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:FinalexamConnectionString %>" SelectCommand="SELECT [num], [title], [name], [writedate], [readcnt] FROM [board]  WHERE ([category] = @category)">
                    <SelectParameters>
                        <asp:ControlParameter Name="category" Type="String"  ControlID="lblNewsCat" PropertyName="Text"></asp:ControlParameter>
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td style="width:100%; text-align:right; padding-top:20px; padding-left:10px; padding-bottom:20px;">
                <asp:Button ID="btnBrdNewslist" runat="server" Text="글 더보기" OnClick="btnBrdNewslist_Click" Width="150px"/>
            </td>
        </tr>
    </table>

</asp:Content>
