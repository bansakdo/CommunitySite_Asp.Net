<%@ Page Title="" Language="C#" MasterPageFile="~/SiteTemplate.Master" AutoEventWireup="true" CodeBehind="Withdrawal.aspx.cs" Inherits="finalexam.User.Withdrawal" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    
    <table Width="600px" style="text-align:center; margin-left:200px; border:solid 1px; ">
        <tr>
            <td colspan="2" style="height:80px"><h2>회원 탈퇴</h2></td>
        </tr>
        <tr>
            <td Width="35%" Height="50px" style="padding-right:20px; text-align:right; ">비밀번호 : </td>
            <td Width="65%" style="text-align:left; "><asp:TextBox ID="txtPw" runat="server" Width="80%"></asp:TextBox></td>
        </tr>
        <tr>
            <td colspan="2" style="padding-bottom:30px">
                <asp:Button ID="btnSubmit" runat="server" Text="확 인" OnClick="btnSubmit_Click" Width="150px" />
            </td>
        </tr>
    </table>

</asp:Content>
