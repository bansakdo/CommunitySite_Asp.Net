<%@ Page Title="" Language="C#" MasterPageFile="~/SiteTemplate.Master" AutoEventWireup="true" CodeBehind="BrdWrite.aspx.cs" Inherits="finalexam.Board.BrdWrite" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table style="width:85%; text-align:center" >
        <tr>
            <td colspan="2"><h2>게시판 글쓰기</h2></td>
        </tr>
        <tr>
            <td align="right" style="padding-right:10px">게시판 : </td>
            <td align="left" style="padding-left:10px">
                <asp:DropDownList ID="ddlCat" runat="server" Width="20%">
                    <asp:ListItem Text="자유게시판" Value="free"></asp:ListItem>
                    <asp:ListItem Text="뉴스게시판" Value="news"></asp:ListItem>
                    <asp:ListItem Text="공지사항" Value="notice" Enabled="false"></asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td align="right" style="padding-right:10px">작성자 : </td>
            <td align="left" style="padding-left:10px">
                <asp:TextBox ID="txtname" runat="server" Width="35%"></asp:TextBox> *필수&nbsp;
                <asp:RequiredFieldValidator ID="vldNameRequired" runat="server" ErrorMessage="작성자를 입력해주세요." ControlToValidate="txtname" SetFocusOnError="true" Display="Dynamic"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td align="right" style="padding-right:10px">비밀번호 : </td>
            <td align="left" style="padding-left:10px">
                <asp:TextBox ID="txtpass" runat="server" Width="35%"></asp:TextBox> *필수(게시물 수정,삭제시 필요)&nbsp;
                <asp:RequiredFieldValidator ID="vldPassRequired" runat="server" ErrorMessage="비밀번호를 입력해주세요." ControlToValidate="txtpass" SetFocusOnError="true" Display="Dynamic"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td align="right" style="padding-right:10px">E-Mail : </td>
            <td align="left" style="padding-left:10px">
                <asp:TextBox ID="txtemail" runat="server" Width="50%"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="right" style="padding-right:10px">글 제목 : </td>
            <td align="left" style="padding-left:10px">
                <asp:TextBox ID="txttitle" runat="server" Width="100%"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="right" style="padding-right:10px">글 내용 : </td>
            <td align="left" style="padding-left:10px">
                <asp:TextBox ID="txtcontents" runat="server" TextMode="MultiLine" Width="100%" Height="500px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td></td>
            <td style="padding-top:20px; padding-bottom:20px" >
                <asp:Button ID="btnSubmit" runat="server" Text="작성" OnClick="btnSubmit_Click" Width="150px"/>&nbsp;&nbsp;&nbsp;
                <asp:Button ID="btnReset" runat="server" Text="초기화" OnClick="btnReset_Click" Width="150px" CausesValidation="false"/>&nbsp;&nbsp;&nbsp;
                <asp:Button ID="btnList" runat="server" Text="돌어가기" OnClick="btnList_Click" Width="150px" CausesValidation="false"/>
            </td>
        </tr>

    </table>
</asp:Content>
