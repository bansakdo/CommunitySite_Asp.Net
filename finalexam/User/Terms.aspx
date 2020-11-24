<%@ Page Title="" Language="C#" MasterPageFile="~/SiteTemplate.Master" AutoEventWireup="true" CodeBehind="Terms.aspx.cs" Inherits="finalexam.User.Terms" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    
    <table Width="1000px" align="center" style="text-align:center">
        <tr>
            <td colspan="2" style="text-align:center"></td>
        </tr>
        <tr>
            <td colspan="3"><h2>
                <asp:Label ID="lbltitle" runat="server" Text="이용 약관"></asp:Label>
                </h2>
            </td>
        </tr>
        <tr>
            <td style="margin-top:20px; margin-bottom:20px" colspan="3"><hr /></td>
        </tr>
        <tr>
            <td colspan="3">

                <asp:TextBox ID="txtcontents" runat="server" TextMode="MultiLine" Height="600px" Width="100%" ReadOnly="true" BorderWidth="0">
                    이용 약관
                    1조 1항 
                    ㅇㅇㅇ


                </asp:TextBox>
            </td>
        </tr>

    </table>


</asp:Content>
