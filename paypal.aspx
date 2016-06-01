<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="paypal.aspx.cs" Inherits="ContestViewer.paypal" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="~/Styles/Site.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="Form1" runat="server" action="https://www.paypal.com/cgi-bin/webscr" method="post">
    <div class="page" >
       <div class="header" >
            <div class="title" >
                <h1>
                    <span>LOGQSO<span class="subTitle">&nbsp; &nbsp;   Contest Log Viewer - Analyzer</span>
                    </span> 
                </h1>
            </div>
            <div class="loginDisplay">
                <asp:LoginView ID="HeadLoginView" runat="server" EnableViewState="false">
                    <AnonymousTemplate>
                        [ <a href="~/Account/Login.aspx" ID="HeadLoginStatus" runat="server" visible="False">Log In</a> ]
                    </AnonymousTemplate>
                    <LoggedInTemplate>
                        Welcome <span class="bold"><asp:LoginName ID="HeadLoginName" runat="server" /></span>!
                        [ <asp:LoginStatus ID="HeadLoginStatus" runat="server" LogoutAction="Redirect" LogoutText="Log Out" LogoutPageUrl="~/"/> ]
                    </LoggedInTemplate>
                </asp:LoginView>
            </div>
            <div class="clear hideSkiplink">
                <asp:Menu ID="NavigationMenu" runat="server" CssClass="menu" EnableViewState="false" IncludeStyleBlock="false" Orientation="Horizontal">
                    <Items>
                        <asp:MenuItem NavigateUrl="~/Default.aspx" Text="Home"/>
                        <asp:MenuItem NavigateUrl="~/Help.aspx" Text="Help"/>
                        <asp:MenuItem NavigateUrl="~/feedback.aspx" Text="Feedback"/>
                        <asp:MenuItem NavigateUrl="~/About.aspx" Text="About" />
                    </Items>
                </asp:Menu>
            </div>
       </div>
        <div id="ContentPlaceHolderPageDiv" class="main" runat="server">
            <table >
                <tr>
                    <td style="text-align: left; width: 550px; vertical-align: top; font-weight: bold; color: #000000;">
                       If you would like to help Support the LogQso.com website
                       Click on the Paypal 'Donate' button on the right.
                       I have many enhancements to this website planned if there is interest.
                       <br /><br />
                       The website consists of over 30,000 Databases that use 5GB of storage.
                       These databases can support the implementation of many more Charts and Graphs.
                        <br />
                        <span style="color: #FF0000; font-weight: bold; font-size: large">Future Functionality includes:</span>
                        <asp:BulletedList ID="BulletedList1" runat="server" BulletStyle="Square" 
                            ForeColor="Black">
                        <asp:ListItem Text="Accumulated Score for each unit of time on X-axis"></asp:ListItem>
                         <asp:ListItem Text="Accumulated Countries for each unit of time on X-axis"></asp:ListItem>
                        <asp:ListItem Text="Accumulated Zones for each unit of time on X-axis"></asp:ListItem>
                        <asp:ListItem Text="Band presence for each unit of time on X-axis"></asp:ListItem>
                        <asp:ListItem Text="Spots you missed for each unit of time on X-axis"></asp:ListItem>
                        <asp:ListItem Text="Band presence for each unit of time on X-axis"></asp:ListItem>
                        <asp:ListItem Text="UBN for each unit of time on X-axis"></asp:ListItem>
                        <asp:ListItem Text="Log View for each unit of time on X-axis"></asp:ListItem>
                        <asp:ListItem Text="Google Earth View of a log"></asp:ListItem>
                        <asp:ListItem Text="Best strategy generator for 2 or 3 selected calls"></asp:ListItem>
                       </asp:BulletedList>
                    </td>
                    <td style="vertical-align: top">
                        <input type="hidden" name="cmd" value="_s-xclick" />
                        <input type="hidden" name="encrypted" value="-----BEGIN PKCS7-----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-----END PKCS7-----
                        " />
                        <input type="image" src="https://www.paypal.com/en_US/i/btn/btn_donateCC_LG.gif"
                            name="submit" alt="PayPal - The safer, easier way to pay online!" />
                        <img alt="" src="https://www.paypal.com/en_US/i/scr/pixel.gif" width="1" height="1" />
                    </td>
                </tr>
            </table>
        </div>
        <div class="clear">
        </div>
    </div>
    <div class="footer">
        Website by:
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="http://psws.com">PSWS</asp:HyperLink>
    </div>



    </form>
</body>
</html>
