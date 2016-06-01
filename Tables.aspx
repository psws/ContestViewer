<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeBehind="Tables.aspx.cs" Inherits="ContestViewer.Tables" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="Styles/Tables.css" rel="stylesheet" type="text/css" id="cssRes" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MC" runat="server">
    <br />
    <asp:Table ID="Table1" runat="server" BackColor="#99CCFF">
        <asp:TableHeaderRow CssClass="TblHdrCallRow">
            <asp:TableHeaderCell ColumnSpan="3" Text="CN2R CQWWCW2010 SOAB)" ID="Call1Row" runat="server">
            </asp:TableHeaderCell>
        </asp:TableHeaderRow>
        <asp:TableHeaderRow CssClass="TblHdrCallRow">
            <asp:TableHeaderCell ColumnSpan="3" Text="CR2X CQWWCW2010 SOAB" ID="Call2Row" runat="server">
            </asp:TableHeaderCell>
        </asp:TableHeaderRow>
        <asp:TableHeaderRow CssClass="TblHdrCallRow">
            <asp:TableHeaderCell ColumnSpan="3" Text="HC8A CQWWCW2010 SOAB" ID="Call3Row" runat="server">
            </asp:TableHeaderCell>
        </asp:TableHeaderRow>
        <asp:TableHeaderRow CssClass="TblHdrTitleRow">
            <asp:TableHeaderCell Text="QSOs vs Time  " ColumnSpan="5" CssClass="TblHdrTitleRowCell">
            </asp:TableHeaderCell>
        </asp:TableHeaderRow>
        <asp:TableHeaderRow CssClass="TblHdrRow">
            <asp:TableHeaderCell Text="Time" Width="50">
            </asp:TableHeaderCell>
            <asp:TableHeaderCell Text="Call" Width="80">
            </asp:TableHeaderCell>
            <asp:TableHeaderCell Text="Total" Width="25" CssClass="TblHdrRowQCell">
            </asp:TableHeaderCell>
            <asp:TableHeaderCell Text="160" Width="25" CssClass="TblHdrRowQCell">
            </asp:TableHeaderCell>
            <asp:TableHeaderCell Text="80" Width="25" CssClass="TblHdrRowQCell">
            </asp:TableHeaderCell>
        </asp:TableHeaderRow>
        <asp:TableRow>
            <asp:TableCell Text="00:00-1">
            </asp:TableCell>
            <asp:TableCell Text="CN2R">
            </asp:TableCell>
            <asp:TableCell Text="100" CssClass="TblRowQCell">
            </asp:TableCell>
            <asp:TableCell Text="100" CssClass="TblRowQCell">
            </asp:TableCell>
            <asp:TableCell Text="100" CssClass="TblRowQCell">
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>


    <table id="RepeaterTable">
        <asp:Repeater ID="RepeaterFB" runat="server" OnItemDataBound="RepeaterFB_ItemDataBound">
            <HeaderTemplate>
                <%--          <COL id="col1"><COL id="col2"><COL id="col3"><COL id="col4"><COL id="col5">
                --%>
                <tr>
                    <th style="width: 100px; text-align: center; border-left-style: solid;">
                        Call
                    </th>
                    <th style="width: 100px; text-align: center;">
                        OP
                    </th>
                    <th style="width: 350px; text-align: left;">
                        Country
                    </th>
                    <th style="width: 130px; text-align: left;">
                        Date
                    </th>
                    <th style="text-align: left; border-right-style: solid;">
                        Time
                    </th>
                </tr>
            </HeaderTemplate>
            <ItemTemplate>
                <tr style="background-image: url('../images/FBVHdr.gif'); background-repeat: repeat;
                    color: #990000;">
                    <td style="font-weight: bolder;">
                        <asp:Label ID="LabelCall" runat="server" Text="--"></asp:Label>
                    </td>
                    <td>
                        <%# Eval("Op")%>
                    </td>
                    <td style="text-align: left">
                        <%# Eval("Country")%>
                    </td>
                    <td style="text-align: left">
                        <asp:Label ID="LabelDate" runat="server" Text="--"></asp:Label>
                    </td>
                    <td style="text-align: left">
                        <asp:Label ID="LabelTime" runat="server" Text="--"></asp:Label>
                    </td>
                </tr>
                <%--        <tr style="background-color: #FFF5EC; color: #000000; font-weight: 300;">
            <td style="border: 1px solid #99CCFF;" colspan="5">
                 <asp:Label ID="LabelMessage" runat="server" Text="--"></asp:Label>
            </td>
         </tr>
                --%>
            </ItemTemplate>
            <SeparatorTemplate>
                <%--         <tr style="height: 15px">
         </tr>   
                --%>
            </SeparatorTemplate>
            <FooterTemplate>
                <%--            <tr style="background-color: transparent">
            </tr>
                --%>
            </FooterTemplate>
        </asp:Repeater>
         <asp:Repeater ID="Repeater1" runat="server" OnItemDataBound="RepeaterFB_ItemDataBound">
            <ItemTemplate>
                <tr style="background-repeat: repeat;
                    color: #990000; background-color: #99CCFF;">
                    <td style="font-weight: bolder;">
                        <asp:Label ID="LabelCall" runat="server" Text="--"></asp:Label>
                    </td>
                    <td>
                        <%# Eval("Op")%>
                    </td>
                    <td style="text-align: left">
                        <%# Eval("Country")%>
                    </td>
                    <td style="text-align: left">
                        <asp:Label ID="LabelDate" runat="server" Text="--"></asp:Label>
                    </td>
                    <td style="text-align: left">
                        <asp:Label ID="LabelTime" runat="server" Text="--"></asp:Label>
                    </td>
                </tr>
                <%--        <tr style="background-color: #FFF5EC; color: #000000; font-weight: 300;">
            <td style="border: 1px solid #99CCFF;" colspan="5">
                 <asp:Label ID="LabelMessage" runat="server" Text="--"></asp:Label>
            </td>
         </tr>
                --%>
            </ItemTemplate>
            <SeparatorTemplate>
                <%--         <tr style="height: 15px">
         </tr>   
                --%>
            </SeparatorTemplate>
            <FooterTemplate>
                <%--            <tr style="background-color: transparent">
            </tr>
                --%>
            </FooterTemplate>
        </asp:Repeater>
   </table>
</asp:Content>
