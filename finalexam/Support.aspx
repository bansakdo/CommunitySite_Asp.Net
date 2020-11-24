<%@ Page Title="" Language="C#" MasterPageFile="~/SiteTemplate.Master" AutoEventWireup="true" CodeBehind="Support.aspx.cs" Inherits="finalexam.Info" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    
    <table Width="1000px" align="center" style="text-align:center">
        <tr>
            <td colspan="2" style="text-align:center"></td>
        </tr>
        <tr>
            <td colspan="3"><h2>
                <asp:Label ID="lbltitle" runat="server" Text="고객 센터"></asp:Label>
                </h2>
            </td>
        </tr>
        <tr>
            <td style="margin-top:20px; margin-bottom:20px" colspan="3"><hr /></td>
        </tr>
        <tr>
            <td colspan="3" style="padding-top:20px">
                <h3>관리자 E-MAIL</h3>
                <h4>bansakdo@gmail.com</h4>

                <br /><br />
                <p>사이트에 대한 문의 사항은 위 이메일 주소로 보내주세요.<asp:Panel ID="Panel1" runat="server"></asp:Panel>
                </p>
            </td>
        </tr>

    </table>
</asp:Content>
