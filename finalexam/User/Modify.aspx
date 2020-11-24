<%@ Page Title="" Language="C#" MasterPageFile="~/SiteTemplate.Master" AutoEventWireup="true" CodeBehind="Modify.aspx.cs" Inherits="finalexam.User.UserModify" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    
    <table Width="1400px" align="center">
        <tr>
            <td Width="100%" colspan="3"><h2>개인정보 수정</h2></td>
        </tr>
        <tr>
            <td style="text-align:right; height:30px" " Width="15%" >I D :&nbsp;</td>
            <td Width="25%">
                <asp:TextBox ID="txtId" runat="server" Width="300px" ReadOnly="true"></asp:TextBox>&nbsp;&nbsp;
            </td>
            <td Width="60%">
                * ID는 바꿀 수 없습니다. &nbsp;
<%--                <asp:RequiredFieldValidator ID="vldIdRequired" runat="server" ErrorMessage="ID를 입력해주세요." ControlToValidate="txtId" SetFocusOnError="true" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:Label ID="lblCheckIdUnique" runat="server" Text="이미 해당 ID가 존재합니다. 다른 ID를 사용해 주세요." Visible="false"></asp:Label>--%>
            </td>
        </tr>
        <tr>
            <td style="text-align:right; height:30px" >PW :&nbsp;</td>
            <td>
                <asp:TextBox ID="txtPw" runat="server" TextMode="Password" Width="300px" class="txtbox"></asp:TextBox>
            </td>
            <td>
                 * 필수 &nbsp;
                <asp:RequiredFieldValidator ID="vldPwRequired" runat="server" ErrorMessage="비밀번호를 입력해주세요." ControlToValidate="txtPw" SetFocusOnError="true" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="vldPwRule" runat="server" ErrorMessage="비밀번호는 4자 이상 16자 이하여야 합니다." ControlToValidate="txtPw" ValidationExpression="\w{4,16}" SetFocusOnError="true" Display="Dynamic"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td style="text-align:right ;height:30px" >이름 :&nbsp;</td>
            <td>
                <asp:TextBox ID="txtName" runat="server" Width="300px" ></asp:TextBox>
            </td>
            <td>
                 * 필수 &nbsp;
                <asp:RequiredFieldValidator ID="vldNameRequired" runat="server" ErrorMessage="이름를 입력해주세요." ControlToValidate="txtName" SetFocusOnError="true" Display="Dynamic"></asp:RequiredFieldValidator>
            </td>
        </tr
        <tr>
            <td style="text-align:right; height:30px" >생일 :&nbsp;</td>
            <td>
                <asp:TextBox ID="txtBirth" runat="server" TextMode="Date" Width="300px"></asp:TextBox> 
            </td>
            <td>
                * 필수 &nbsp;
                <asp:RequiredFieldValidator ID="vldBirth" runat="server" ErrorMessage="생일을 입력해주세요." ControlToValidate="txtBirth" SetFocusOnError="true" Display="Dynamic"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="text-align:right; height:30px" >전화번호 :&nbsp;</td>
            <td>
                <asp:TextBox ID="txtTel" runat="server" Width="300px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="text-align:right; height:30px">e-Mail :&nbsp;</td>
            <td>
                <asp:TextBox ID="txtEmail" runat="server" Width="300px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="text-align:right; height:30px" >주소 :&nbsp;</td>
            <td  colspan="3">
                <asp:TextBox ID="txtAddr" runat="server" Width="60%"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td colspan="3" style="text-align:center; padding-bottom:40px; padding-top:40px; padding-right:20%">
                <asp:Button ID="btnSubmit" runat="server" Text="수정" OnClick="btnSubmit_Click" Width="150px"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="btnReset" runat="server" Text="초기화" OnClick="btnReset_Click" Width="150px" CausesValidation="false"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="btnReturn" runat="server" Text="돌아가기" OnClick="btnReturn_Click" Width="150px" CausesValidation="false"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="btnWithdrawal" runat="server" Text="회원 탈퇴" OnClick="btnWithdrawal_Click" Width="150px" CausesValidation="false"/>
            </td>
        </tr>
    </table>
    <asp:Label ID="lbltest" runat="server" ></asp:Label>


</asp:Content>
