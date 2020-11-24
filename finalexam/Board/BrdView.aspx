<%@ Page Title="" Language="C#" MasterPageFile="~/SiteTemplate.Master" AutoEventWireup="true" CodeBehind="BrdView.aspx.cs" Inherits="finalexam.Board.BrdView" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <table Width="1000px" align="center" style="text-align:center">
        <tr>
            <td colspan="2" style="text-align:left"><h3>게시판 글 보기</h3></td>
        </tr>
        <tr>
            <td style="margin-top:20px; margin-bottom:20px" colspan="3"><hr /></td>
        </tr>
        <tr>
            <td colspan="3"><h2>
                <asp:Label ID="lbltitle" runat="server"></asp:Label>
                </h2>
            </td>
        </tr>
        <tr>
            <td colspan="3"><hr /></td>
        </tr>
        <tr>
            <td>
                작성자 : <asp:Label ID="lblname" runat="server"></asp:Label>
            </td>
            <td>
                작성일 : <asp:Label ID="lblwritedate" runat="server"></asp:Label>
            </td>
            <td>
                조회수 : <asp:Label ID="lblreadcnt" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="margin-top:20px; margin-bottom:20px" colspan="3"><hr /></td>
        </tr>
        <tr>
            <td colspan="3">

                <asp:TextBox ID="txtcontents" runat="server" TextMode="MultiLine" Height="800px" Width="100%" ReadOnly="true"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td colspan="3" style="padding-top:20px; padding-bottom:20px; margin-bottom:30px">
                <asp:Button ID="btnList" runat="server" Text="목록으로" OnClick="btnList_Click" Width="150px" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="btnModify" runat="server" Text="수정" OnClick="btnModify_Click" Width="150px" Visible="false" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="btnDelete" runat="server" Text="삭제" OnClick="btnDelete_Click" Width="150px" Visible="false" />
            </td>
        </tr>
    </table>
</asp:Content>
