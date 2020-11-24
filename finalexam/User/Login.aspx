<%@ Page Title="" Language="C#" MasterPageFile="~/SiteTemplate.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="finalexam.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <table width="600px" align="center" style="padding-right:100px; margin-left:10%">
        <tr>
            <td Width="20%" style="padding-right:10px">
                <asp:Label ID="lblId" runat="server" Text="I D : " Width="100%" style="text-align:right;"></asp:Label>
            </td>
            <td  Width="50%">
                <asp:TextBox ID="txtId" runat="server" Width="70%"></asp:TextBox>
            </td>
            <td Width="30%" rowspan="2" align="center" style="padding-left:10px; padding-right:10px;">
                <asp:Button ID="btnLogin" Text="로그인" runat="server" OnClick="btnLogin_Click" Height="70px" Width="100px"/>
            </td>
        </tr>
        <tr>
            <td style="padding-right:10px">
                <asp:Label ID="lblPw" runat="server" Text="PW : " Width="100%" style="text-align:right"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtPw" runat="server" TextMode="Password" Width="70%"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td colspan="3" align="center" style="padding-top:20px; padding-bottom:20px;">
                <asp:Button ID="btnRegister" Text="회원가입" runat="server" OnClick="btnRegister_Click"/>&nbsp;&nbsp;
                <asp:Button ID="btnFindPw" Text="비밀번호 찾기" runat="server" OnClick="btnFindPw_Click"/>
            </td>
        </tr>
    </table>

</asp:Content>
