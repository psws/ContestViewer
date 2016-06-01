<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" Inherits="_Default" Codebehind="Default2.aspx.cs" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MC">
    <script language="javascript" type="text/javascript">
        function handleClick( form )
        {
            form.action = "ContestCharts.aspx";
        form.submit();
        }
    </script>
    <h2 >
        Welcome to ASP.NET!
    </h2>Environment.UserName--<%= Environment.UserName %>
    <br />
    User.Identity.Name--<%= User.Identity.Name %>
    <br />
    Page.User-- <%= Page.User%>
    <br />

    <asp:Label ID="Label1" runat="server" ></asp:Label>
    <asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl="~/ContestCharts.aspx" Text="Go" />
    <%--<asp:Button ID="Button1" runat="server" Text="Go" OnClientClick="handleClick(Form1)" />--%>

</asp:Content>
