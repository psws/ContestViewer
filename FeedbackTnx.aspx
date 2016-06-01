<%@ Page Title="LogQso Feedback Tnx" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeBehind="FeedbackTnx.aspx.cs" Inherits="ContestViewer.FeedbackTnx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
 <script language="JavaScript" type="text/javascript">
    function back() {
        history.go(-3);
    } 
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MC" runat="server">
    <div style="text-align: center">
    <table style="width: 760px; margin-top: 200px;" >
        <tr>
            <td style="text-align: center">
                <span style="font-size: x-large; font-weight: bolder; font-style: 
                italic; font-family: 'Trebuchet MS'; color: #008080; ">
                Thanks for the Comments, Suggestions or Questions.<br />See you in the Next Contest</span>
                <br />
            </td>
            <td></td>
         </tr>
         <tr>
            <td style="background-color: #008080;  text-align: center; ">
                <asp:Label ID="NextTest" runat="server" Text="Website created by W7EJ-CN2R" CssClass="NxtContest"></asp:Label>
            </td>
         </tr>
         <tr>
            <td style="text-align: right; ">
                <asp:Button ID="SendMessage" runat="server" Text="CONTINUE" 
                    CssClass="feedbackform" SkinID="butSkin" />
            </td>
        </tr>
    </table>
    </div>
</asp:Content>
