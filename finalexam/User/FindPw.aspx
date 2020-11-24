<%@ Page Title="" Language="C#" MasterPageFile="~/SiteTemplate.Master" AutoEventWireup="true" CodeBehind="FindPw.aspx.cs" Inherits="finalexam.User.FindPw" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .resultbox {
            /*width: 50%;*/ 
            text-align:center; 
            padding-top:40px; 
            padding-bottom:40px; 
            border: solid 1px;
            margin-left:10%;
        }
    </style>

    <table Width="1400px" align="center">
        <tr>
            <td Width="100%" colspan="3"><h2>비밀번호 찾기</h2></td>
        </tr>
        <tr>
            <td style="text-align:right; height:30px" " Width="15%" >I D :&nbsp;</td>
            <td Width="25%">
                <asp:TextBox ID="txtId" runat="server" Width="300px" class="txtbox"></asp:TextBox>&nbsp;&nbsp;
            </td>
            <td Width="60%">
                * 필수 &nbsp;
                <asp:RequiredFieldValidator ID="vldIdRequired" runat="server" ErrorMessage="ID를 입력해주세요." ControlToValidate="txtId" SetFocusOnError="true" Display="Dynamic"></asp:RequiredFieldValidator>
                <%--<asp:Label ID="lblCheckIdUnique" runat="server" Text="이미 해당 ID가 존재합니다. 다른 ID를 사용해 주세요." Visible="false"></asp:Label>--%>
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
            <td></td>
            <td colspan="2" style="text-align:left; padding-bottom:40px; padding-top:40px">
                <asp:Button ID="btnSubmit" runat="server" Text="비밀번호 찾기" OnClick="btnSubmit_Click" Width="150px"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="btnReset" runat="server" Text="초기화" OnClick="btnReset_Click" Width="150px" CausesValidation="false"/>
            </td>
        </tr>
        <tr>
            <td colspan="3">
                    <asp:Label ID="lblResult" runat="server" Text="" Visible="false" CssClass="resultbox" Width="35%"></asp:Label>
                <%--</div>--%>
            </td>
        </tr>
        <tr>
            <td></td>
            <td style="text-align:center; padding-top:20px; padding-bottom:50px">
                <asp:Button ID="btnLogin" runat="server" Text="로그인" OnClick="btnLogin_Click" Visible="false" Width="50%" />
            </td>
        </tr>
    </table>
    
</asp:Content>
