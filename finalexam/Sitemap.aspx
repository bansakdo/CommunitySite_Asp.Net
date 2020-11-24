<%@ Page Title="" Language="C#" MasterPageFile="~/SiteTemplate.Master" AutoEventWireup="true" CodeBehind="Sitemap.aspx.cs" Inherits="finalexam.sitemap" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div style="padding-top:30px; padding-left:200px;text-align:left">
        <h1>사이트맵</h1>
    </div>
    <div style="font-size:20px; padding-left:100px; padding-top:50px; padding-bottom:50px">
        
        <asp:TreeView ID="TreeView1" runat="server" ImageSet="Simple" NodeIndent="10" DataSourceID="SiteMapDataSource1">
            <HoverNodeStyle Font-Underline="True" ForeColor="#DD5555"></HoverNodeStyle>

            <NodeStyle HorizontalPadding="20px" NodeSpacing="0px" VerticalPadding="5px" Font-Names="Verdana" Font-Size="13pt" ForeColor="Black"></NodeStyle>

            <ParentNodeStyle Font-Bold="False"></ParentNodeStyle>

            <SelectedNodeStyle HorizontalPadding="0px" VerticalPadding="0px" Font-Underline="True" ForeColor="#DD5555"></SelectedNodeStyle>
        </asp:TreeView>
        <asp:SiteMapDataSource runat="server" ID="SiteMapDataSource1"></asp:SiteMapDataSource>
    </div>
</asp:Content>
