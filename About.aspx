<%@ Page Title="LogQso About" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" Inherits="About" Codebehind="About.aspx.cs" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MC">
    <table style="width: 100%;">
        <tr>
            <td style="width: 300px; text-align: left">
                <asp:Label ID="VersionLabel" runat="server" Text="CONTEST VIEWER" 
                    Font-Bold="True" Font-Size="X-Large" ForeColor="#3399FF"></asp:Label>
            </td>
            <td rowspan="3" style="text-align: right">
                <asp:Image ID="Image2" runat="server" ImageUrl="~/images/pswsblue.jpg" Height="143px"
                    Width="473px" />
            </td>
        </tr>
        <tr>
            <td>
            <asp:Label ID="LabelVer" runat="server" Text="VERSION:  " Font-Bold="True" 
                    Font-Size="Medium" ForeColor="Black"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
            <asp:Label ID="LabelDate" runat="server"   Font-Bold="True" Font-Size="Medium" ForeColor="Black"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
            <asp:Label ID="Label1" runat="server" Text="Author: CN2R- W7EJ Jim Sullivan"  Font-Bold="True" Font-Size="Medium" ForeColor="Black"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <script type="text/javascript" src="http://jc.revolvermaps.com/r.js"></script>
                <script type="text/javascript">                    rm_f1st('0', '220', 'true', 'false', '000000', '21l99o4vzwc', 'true', 'ff0000');</script>
                <noscript>
                    <applet codebase="http://rc.revolvermaps.com/j" code="core.RE" width="220" height="220"
                        archive="g.jar">
                        <param name="cabbase" value="g.cab" />
                        <param name="r" value="true" />
                        <param name="n" value="false" />
                        <param name="i" value="21l99o4vzwc" />
                        <param name="m" value="0" />
                        <param name="s" value="220" />
                        <param name="c" value="ff0000" />
                        <param name="v" value="true" />
                        <param name="b" value="000000" />
                        <param name="rfc" value="true" />
                    </applet></noscript>
            </td>
        </tr>
    </table>
</asp:Content>
