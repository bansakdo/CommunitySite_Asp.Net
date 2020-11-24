<%@ Page Title="" Language="C#" MasterPageFile="~/SiteTemplate.Master" AutoEventWireup="true" CodeBehind="Info.aspx.cs" Inherits="finalexam.Info1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    
    <table Width="1000px" align="center" style="text-align:center">
        <tr>
            <td colspan="2" style="text-align:center"></td>
        </tr>
        <tr>
            <td colspan="3"><h2>
                <asp:Label ID="lbltitle" runat="server" Text="홈페이지 정보"></asp:Label>
                </h2>
            </td>
        </tr>
        <tr>
            <td style="margin-top:20px; margin-bottom:20px" colspan="3"><hr /></td>
        </tr>
        <tr>
            <td colspan="3" style="padding-top:20px; text-align:center">
                <asp:TextBox ID="textbox" runat="server" TextMode="MultiLine" BorderStyle="None" Width="800px" Height="600px" Font-Size="20px" ReadOnly="true" BorderWidth="0">
이 홈페이지는 뉴스 커뮤니티 사이트 입니다.
글을 쓰시려면 회원 가입을 해야 합니다.
문의 및 건의사항은 고객센터 페이지에 있는 이메일로 보내주시기 바랍니다.
                </asp:TextBox>
            </td>
        </tr>

    </table>




</asp:Content>
