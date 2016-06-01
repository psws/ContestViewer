<%@ Page Title="LogQso Home" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    Inherits="ContestViewer.ContestCharts" CodeBehind="Default.aspx.cs" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <style type="text/css">
        .style1
        {
            width: 77px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MC" runat="Server">
    <asp:ScriptManagerProxy ID="ScriptManagerProxy1" runat="server">
        <Scripts>
            <asp:ScriptReference Path="Scripts/Tabctl2_1.js" />
        </Scripts>
    </asp:ScriptManagerProxy>
    <div style="margin-left: -6pt; margin-top: 3px;">
        <input id="btnContestrigger1" runat="server" type="button" style="display: none"
            onserverclick="Contest_changed" clientidmode="Static" />
        <input id="btnContestrigger2" runat="server" type="button" style="display: none"
            onserverclick="Contest_changed" clientidmode="Static" />
        <input id="btnContestrigger3" runat="server" type="button" style="display: none"
            onserverclick="Contest_changed" clientidmode="Static" />
        <input id="btnCat" runat="server" type="button" style="display: none" onserverclick="Cat_changed"
            clientidmode="Static" />
        <input id="btnLog" runat="server" type="button" style="display: none" onserverclick="Log_changed"
            clientidmode="Static" />
        <input id="btnCall" runat="server" type="button" style="display: none" onserverclick="Call_changed"
            clientidmode="Static" />
        <input id="btnCallcb" runat="server" type="button" style="display: none" onserverclick="Callcb_changed"
            clientidmode="Static" />
        <input id="btnChart" runat="server" type="button" style="display: none" onserverclick="Chart_changed"
            clientidmode="Static" />
        <input id="btnInit" runat="server" type="button" style="display: none" onserverclick="Page_Loaded"
            clientidmode="Static" />
        <input id="btnSelectedTab" runat="server" type="text" style="display: none" clientidmode="Static" />
        <input id="btnSelectedTabContainer" runat="server" type="text" style="display: none"
            clientidmode="Static" />
        <asp:Panel ID="QSORatePanel" runat="server" Width="994px" CssClass="QSORatePanel">
            <div style="margin-top: -4px; text-align: left; margin-left: 5px;">
                <table style="width: 100%;">
                    <tr>
                        <td align="left" style="vertical-align: bottom;" class="style1">
                            <span>
                                <asp:Button ID="RefreshCat" runat="server" Text="Refresh" ClientIDMode="Static" OnClientClick="RefreshGraph('QSORateChart');"
                                    Width="78px" OnClick="RefreshCat_Click" Height="45px" SkinID="butSkin" Visible="False" />
                                <asp:Button ID="DefaultAll" runat="server" Text="Default All" ClientIDMode="Static"
                                    OnClientClick="DefaultAll;" Width="78px" OnClick="DefaultAll_Click" Height="45px"
                                    SkinID="butSkin" />
                            </span>
                        </td>
                        <td align="center" style="width: 895px;">
                            <div style="height: 182px; margin-top: -5px;">
                                <table style="width: 100%;">
                                    <tr>
                                        <td style="width: 440px;" align="center" valign="top">
                                            <table>
                                                <tr>
                                                    <td>
                                                        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                                                            <ContentTemplate>
                                                                <asp:Panel ID="PCat" runat="server" Width="438px" Height="76" CssClass="Grpbox" ToolTip="Select the Category to filter the Entry Class Callsigns that are available when selecting the Call field of Call1, Call2, Call3 on the right ">
                                                                    <table>
                                                                        <tr align="left">
                                                                            <td colspan="4">
                                                                                <asp:Label ID="LCF" runat="server" Text="Contest Category Selection" CssClass="GrpboxTitle"></asp:Label>
                                                                                <span style="padding-left: 15px">
                                                                                    <asp:Button ID="CatDef" runat="server" Text="DEFAULTS" Font-Size="6pt" ToolTip="Reset Category to all"
                                                                                        OnClick="CatDef_Click" SkinID="butSkin" />
                                                                                </span>
                                                                            </td>
                                                                            <td align="left" colspan="1">
                                                                                <asp:CheckBox ID="CategoryCB" runat="server" Text="Disable" ClientIDMode="Static" />
                                                                            </td>
                                                                        </tr>
                                                                        <tr align="left">
                                                                            <td>
                                                                                <asp:Label ID="LCpr" runat="server" CssClass="GrpboxLabels" Text="Operator"></asp:Label>
                                                                            </td>
                                                                            <td>
                                                                                <asp:Label ID="LBnd" runat="server" CssClass="GrpboxLabels" Text="Band"></asp:Label>
                                                                            </td>
                                                                            <td>
                                                                                <asp:Label ID="LPwr" runat="server" CssClass="GrpboxLabels" Text="Power"></asp:Label>
                                                                            </td>
                                                                            <td>
                                                                                <asp:Label ID="LAst" runat="server" CssClass="GrpboxLabels" Text="Assisted"></asp:Label>
                                                                            </td>
                                                                            <td>
                                                                                <asp:Label ID="LTx" runat="server" CssClass="GrpboxLabels" Text="# of Tx"></asp:Label>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>
                                                                                <asp:DropDownList ID="DDLOpr" runat="server" Width="94px" ClientIDMode="Static">
                                                                                </asp:DropDownList>
                                                                            </td>
                                                                            <td>
                                                                                <asp:DropDownList ID="DDLBnd" runat="server" Width="65px" ClientIDMode="Static">
                                                                                </asp:DropDownList>
                                                                            </td>
                                                                            <td>
                                                                                <asp:DropDownList ID="DDLPwr" runat="server" Width="60px" ClientIDMode="Static">
                                                                                </asp:DropDownList>
                                                                            </td>
                                                                            <td>
                                                                                <asp:DropDownList ID="DDLAssist" runat="server" Width="119px" ClientIDMode="Static">
                                                                                </asp:DropDownList>
                                                                            </td>
                                                                            <td>
                                                                                <asp:DropDownList ID="DDLTx" runat="server" Width="60px" ClientIDMode="Static">
                                                                                </asp:DropDownList>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </asp:Panel>
                                                                <asp:RoundedCornersExtender ID="RCE1" runat="server" TargetControlID="PCat" BorderColor="Black"
                                                                    Enabled="True" Radius="5">
                                                                </asp:RoundedCornersExtender>
                                                            </ContentTemplate>
                                                        </asp:UpdatePanel>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:UpdatePanel ID="UpdatePanelQSO" runat="server" UpdateMode="Conditional">
                                                            <ContentTemplate>
                                                                <asp:Panel ID="PanelQSO" runat="server" Width="438px" Height="76" CssClass="Grpbox"
                                                                    ToolTip="Select the QSO Filters for QSO inclusion or exclusion from the chart or graph below">
                                                                    <table>
                                                                        <tr>
                                                                            <td align="left" colspan="3">
                                                                                <asp:Label ID="Label1" runat="server" Text="Log QSO Filter Selection" CssClass="GrpboxTitle"></asp:Label>
                                                                                <span style="padding-left: 25px">
                                                                                    <asp:Button ID="QSODef" runat="server" Text="DEFAULTS" Font-Size="6pt" ToolTip="Reset filter to all QSOs"
                                                                                        OnClick="QSODef_Click" SkinID="butSkin" />
                                                                                </span>
                                                                            </td>
                                                                            <td align="right">
                                                                                <asp:CheckBox ID="QsoCB" runat="server" Text="Disable" ClientIDMode="Static" />
                                                                            </td>
                                                                        </tr>
                                                                        <tr align="left">
                                                                            <td>
                                                                                <asp:Label ID="LL1" runat="server" CssClass="GrpboxLabels" Text="Band"></asp:Label>
                                                                            </td>
                                                                            <td>
                                                                                <asp:Label ID="LL2" runat="server" CssClass="GrpboxLabels" Text="Continent"></asp:Label>
                                                                            </td>
                                                                            <td>
                                                                                <asp:Label ID="LL3" runat="server" CssClass="GrpboxLabels" Text="Country"></asp:Label>
                                                                            </td>
                                                                            <td>
                                                                                <asp:Label ID="LL4" runat="server" CssClass="GrpboxLabels" Text="Zone"></asp:Label>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>
                                                                                <asp:DropDownList ID="DDLLBnd" runat="server" Width="75px" ClientIDMode="Static">
                                                                                </asp:DropDownList>
                                                                            </td>
                                                                            <td>
                                                                                <asp:DropDownList ID="DDLLCon" runat="server" Width="85px" ClientIDMode="Static">
                                                                                </asp:DropDownList>
                                                                            </td>
                                                                            <td>
                                                                                <asp:DropDownList ID="DDLLCou" runat="server" Width="160px" ClientIDMode="Static">
                                                                                </asp:DropDownList>
                                                                            </td>
                                                                            <td>
                                                                                <asp:DropDownList ID="DDLLZone" runat="server" Width="75px" ClientIDMode="Static">
                                                                                </asp:DropDownList>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </asp:Panel>
                                                                <asp:RoundedCornersExtender ID="RCE5" runat="server" TargetControlID="PanelQSO" BorderColor="Black"
                                                                    Enabled="True" Radius="5">
                                                                </asp:RoundedCornersExtender>
                                                            </ContentTemplate>
                                                        </asp:UpdatePanel>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td style="width: 152px;" align="left">
                                            <asp:Panel ID="PC1" runat="server" Height="132px" CssClass="Grpbox" Width="146px">
                                                <asp:UpdatePanel ID="Call1UpdatePanel" runat="server" UpdateMode="Conditional">
                                                    <ContentTemplate>
                                                        <table>
                                                            <tr>
                                                                <td style="text-align: center">
                                                                    <asp:Label ID="LC1F" runat="server" Text="Call 1" CssClass="GrpboxTitle" ForeColor="Blue"></asp:Label>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="text-align: left">
                                                                    <asp:Label ID="LTC1" runat="server" CssClass="GrpboxLabels" Text="Contest"></asp:Label>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="text-align: left">
                                                                    <asp:DropDownList ID="DDLTC1" runat="server" Width="134px" ClientIDMode="Static">
                                                                    </asp:DropDownList>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="text-align: left">
                                                                    <asp:Label ID="LC1" runat="server" CssClass="GrpboxLabels" Text="Call"></asp:Label>
                                                                    <span style="margin-left: 25px;">
                                                                        <asp:CheckBox ID="CBCall1" runat="server" Text="Disable" ToolTip="Disable this Call from Chart" />
                                                                    </span>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="text-align: left">
                                                                    <asp:TextBox ID="TBCall1" runat="server" Width="95px"></asp:TextBox>
                                                                    <asp:Panel ID="TPC1" runat="server" EnableViewState="False" HorizontalAlign="Left"
                                                                        ClientIDMode="Static">
                                                                    </asp:Panel>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </ContentTemplate>
                                                    <Triggers>
                                                        <asp:AsyncPostBackTrigger ControlID="btnContestrigger1" />
                                                        <asp:AsyncPostBackTrigger ControlID="btnCat" EventName="ServerClick" />
                                                        <asp:AsyncPostBackTrigger ControlID="btnInit" EventName="ServerClick" />
                                                        <asp:AsyncPostBackTrigger ControlID="DefaultAll" EventName="Click" />
                                                    </Triggers>
                                                </asp:UpdatePanel>
                                                <asp:RoundedCornersExtender ID="RCE2" runat="server" TargetControlID="PC1" BorderColor="Black"
                                                    Enabled="True" Radius="10">
                                                </asp:RoundedCornersExtender>
                                            </asp:Panel>
                                        </td>
                                        <td style="width: 152px;" align="center">
                                            <asp:Panel ID="PC2" runat="server" Height="132px" CssClass="Grpbox" Width="148px">
                                                <asp:UpdatePanel ID="Call2UpdatePanel" runat="server" UpdateMode="Conditional">
                                                    <ContentTemplate>
                                                        <table>
                                                            <tr>
                                                                <td style="text-align: center">
                                                                    <asp:Label ID="LC2F" runat="server" Text="Call 2" CssClass="GrpboxTitle" ForeColor="orangered"></asp:Label>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="text-align: left">
                                                                    <asp:Label ID="LTC2" runat="server" CssClass="GrpboxLabels" Text="Contest"></asp:Label>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="text-align: left">
                                                                    <asp:DropDownList ID="DDLTC2" runat="server" Width="136px">
                                                                    </asp:DropDownList>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="text-align: left">
                                                                    <asp:Label ID="LC2" runat="server" CssClass="GrpboxLabels" Text="Call"></asp:Label>
                                                                    <span style="margin-left: 25px;">
                                                                        <asp:CheckBox ID="CBCall2" runat="server" Text="Disable" ToolTip="Disable this Call from Chart" />
                                                                    </span>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="text-align: left">
                                                                    <asp:TextBox ID="TBCall2" runat="server" Width="95px"></asp:TextBox>
                                                                <asp:Panel ID="TPC2" runat="server" EnableViewState="False" HorizontalAlign="Left">
                                                                </asp:Panel>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </ContentTemplate>
                                                    <Triggers>
                                                        <asp:AsyncPostBackTrigger ControlID="btnContestrigger2" />
                                                        <asp:AsyncPostBackTrigger ControlID="btnCat" EventName="ServerClick" />
                                                        <asp:AsyncPostBackTrigger ControlID="btnInit" EventName="ServerClick" />
                                                        <asp:AsyncPostBackTrigger ControlID="DefaultAll" EventName="Click" />
                                                    </Triggers>
                                                </asp:UpdatePanel>
                                                <asp:RoundedCornersExtender ID="RCE3" runat="server" TargetControlID="PC2" BorderColor="Black"
                                                    Enabled="True" Radius="10">
                                                </asp:RoundedCornersExtender>
                                            </asp:Panel>
                                        </td>
                                        <td style="width: 152px;" align="center">
                                            <asp:Panel ID="PC3" runat="server" Height="132px" CssClass="Grpbox" Width="148px">
                                                <asp:UpdatePanel ID="Call3UpdatePanel" runat="server" UpdateMode="Conditional">
                                                    <ContentTemplate>
                                                        <table>
                                                            <tr>
                                                                <td style="text-align: center">
                                                                    <asp:Label ID="LC3F" runat="server" Text="Call 3" CssClass="GrpboxTitle" ForeColor="green"></asp:Label>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="text-align: left">
                                                                    <asp:Label ID="LTC3" runat="server" CssClass="GrpboxLabels" Text="Contest"></asp:Label>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="text-align: left">
                                                                    <asp:DropDownList ID="DDLTC3" runat="server" Width="136px">
                                                                    </asp:DropDownList>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="text-align: left">
                                                                    <asp:Label ID="LC3" runat="server" CssClass="GrpboxLabels" Text="Call"></asp:Label>
                                                                    <span style="margin-left: 25px;">
                                                                        <asp:CheckBox ID="CBCall3" runat="server" Text="Disable" ToolTip="Disable this Call from Chart" />
                                                                    </span>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="text-align: left">
                                                                    <asp:TextBox ID="TBCall3" runat="server" Width="95px"></asp:TextBox>
                                                                 <asp:Panel ID="TPC3" runat="server" EnableViewState="False" HorizontalAlign="Left">
                                                                </asp:Panel>
                                                               </td>
                                                            </tr>
                                                        </table>
                                                    </ContentTemplate>
                                                    <Triggers>
                                                        <asp:AsyncPostBackTrigger ControlID="btnContestrigger3" />
                                                        <asp:AsyncPostBackTrigger ControlID="btnCat" EventName="ServerClick" />
                                                        <asp:AsyncPostBackTrigger ControlID="btnInit" EventName="ServerClick" />
                                                        <asp:AsyncPostBackTrigger ControlID="DefaultAll" EventName="Click" />
                                                    </Triggers>
                                                </asp:UpdatePanel>
                                                <asp:RoundedCornersExtender ID="RCE4" runat="server" TargetControlID="PC3" BorderColor="Black"
                                                    Enabled="True" Radius="10">
                                                </asp:RoundedCornersExtender>
                                            </asp:Panel>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </td>
                    </tr>
                </table>
                <div id="updateProgressDiv" class="updateProgress" style="display: none;">
                    <div style="margin-top: 13px; text-align: center;">
                        <asp:Image ID="Image1" runat="server" ImageUrl="~/images/indicator_snake.gif" />
                        <span class="updateProgressMessage">QRX Loading ...</span>
                    </div>
                </div>
                <asp:UpdatePanel ID="UpdatePanelQSORate" runat="server" UpdateMode="Conditional"
                    ClientIDMode="Static">
                    <ContentTemplate>
                        <asp:Chart ID="QSORateChart" runat="server" Height="400px" ImageStorageMode="UseHttpHandler"
                            OnCustomizeLegend="QSORateChart_CustomizeLegend" BackColor="#C9ECFE" Width="984px"
                            Style="margin-bottom: 0px" ClientIDMode="Static">
                            <Titles>
                                <asp:Title TextStyle="Emboss" ForeColor="#009999" Font="Microsoft Sans Serif, 20pt"
                                    Name="ChartName">
                                </asp:Title>
                                <asp:Title Docking="Bottom" Font="Courier New, 10pt" TextStyle="Emboss" ForeColor="#009999"
                                    Alignment="BottomLeft" Name="Tkey3" DockingOffset="2">
                                </asp:Title>
                                <asp:Title Docking="Bottom" Font="Courier New, 10pt" TextStyle="Emboss" ForeColor="#009999"
                                    Alignment="BottomLeft" Name="Tkey2" DockingOffset="4">
                                </asp:Title>
                                <asp:Title Docking="Bottom" Font="Courier New, 10pt" TextStyle="Emboss" ForeColor="#009999"
                                    Alignment="BottomLeft" Name="Tkey1" DockingOffset="6">
                                </asp:Title>
                                <asp:Title Docking="Bottom" Font="Trebuchet MS, 8.25pt" Text="© PSWS.com" Alignment="BottomRight"
                                    Url="http://psws.com" ForeColor="Blue" DockingOffset="18">
                                </asp:Title>
                                <asp:Title Docking="Bottom" Font="Trebuchet MS, 8.25pt" Alignment="BottomRight" ForeColor="Black"
                                    DockingOffset="18" Name="Vers">
                                </asp:Title>
                            </Titles>
                            <Legends>
                                <asp:Legend TitleSeparator="DoubleLine" BorderColor="Black" Name="Legend1" LegendStyle="Row"
                                    IsEquallySpacedItems="True" IsTextAutoFit="False" TitleAlignment="Center" BorderWidth="1"
                                    BackGradientStyle="HorizontalCenter" BackColor="#EEEEEE" BackSecondaryColor="White"
                                    Alignment="Center" Docking="Bottom" ItemColumnSeparator="GradientLine" ItemColumnSpacing="30">
                                </asp:Legend>
                            </Legends>
                            <ChartAreas>
                                <asp:ChartArea Name="ChartArea1" BackColor="#99CCFF" Area3DStyle-Enable3D="False"
                                    BackGradientStyle="TopBottom">
                                    <AxisX LineWidth="2" MaximumAutoSize="100" Title="Day-Time" IsMarginVisible="True"
                                        IntervalOffsetType="Auto" IsStartedFromZero="False">
                                    </AxisX>
                                    <AxisY LineWidth="0">
                                    </AxisY>
                                </asp:ChartArea>
                            </ChartAreas>
                        </asp:Chart>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="RefreshCat" />
                        <asp:AsyncPostBackTrigger ControlID="DefaultAll" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="btnCat" EventName="ServerClick" />
                        <asp:AsyncPostBackTrigger ControlID="btnContestrigger1" EventName="ServerClick" />
                        <asp:AsyncPostBackTrigger ControlID="btnContestrigger2" EventName="ServerClick" />
                        <asp:AsyncPostBackTrigger ControlID="btnContestrigger3" EventName="ServerClick" />
                        <asp:AsyncPostBackTrigger ControlID="btnLog" EventName="ServerClick" />
                        <asp:AsyncPostBackTrigger ControlID="BtnCall" EventName="ServerClick" />
                        <asp:AsyncPostBackTrigger ControlID="btnCallcb" EventName="ServerClick" />
                        <asp:AsyncPostBackTrigger ControlID="QSODef" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="CatDef" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="btnChart" EventName="ServerClick" />
                        <asp:AsyncPostBackTrigger ControlID="btnInit" EventName="ServerClick" />
                        <asp:AsyncPostBackTrigger ControlID="ContestViewFilterDef" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="TimeDef" EventName="Click" />
                    </Triggers>
                </asp:UpdatePanel>
                <asp:UpdatePanel ID="UpdatePanelGrph" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <div style="margin-top: -5px;">
                            <table>
                                <tr>
                                    <td>
                                        <table>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="Label2" runat="server" CssClass="GrpboxLabels" Text="Visits"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="width: 80px; text-align: center; padding-right: 20px;">
                                                    <img src="Counter/counter.aspx?src=pdy.gif&digits=6&id=DefC" alt='counter' />
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td align="center" valign="top">
                                        <asp:Panel ID="PC5" runat="server" Height="72" CssClass="Grpbox2" Width="350">
                                            <asp:UpdatePanel ID="UpdatePaneY" runat="server" UpdateMode="Conditional">
                                                <ContentTemplate>
                                                    <table style="margin-top: -6px;">
                                                        <tr>
                                                            <td align="left" colspan="3" style="padding-left: 5px;">
                                                                <asp:Label ID="Label3" runat="server" Text="View Y-Axis Selection" Font-Size="Small"
                                                                    ForeColor="Red" Font-Bold="True"></asp:Label>
                                                                <span style="padding-left: 10px">
                                                                    <asp:Button ID="ContestViewFilterDef" runat="server" Text="DEFAULTS" Font-Size="6pt"
                                                                        ToolTip="Reset filter to default view" OnClick="ContestViewFilterDef_Click" SkinID="butSkin" />
                                                                </span>
                                                            </td>
                                                        </tr>
                                                        <tr align="left">
                                                            <td>
                                                                <asp:Label ID="CH2" runat="server" CssClass="GrpboxLabels2" Text="Function"></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="CH3" runat="server" CssClass="GrpboxLabels2" Text="Interval"></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="CH4" runat="server" CssClass="GrpboxLabels2" Text="View Type"></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <asp:DropDownList ID="ChartFuncDDL" runat="server" AutoPostBack="False" Width="115px">
                                                                </asp:DropDownList>
                                                            </td>
                                                            <td>
                                                                <asp:DropDownList ID="IntervalDDL" runat="server" AutoPostBack="False" Width="70px">
                                                                </asp:DropDownList>
                                                            </td>
                                                            <td>
                                                                <asp:UpdatePanel ID="UpdatePaneYVw" runat="server" UpdateMode="Conditional">
                                                                    <ContentTemplate>
                                                                        <asp:DropDownList ID="ViewDDL" runat="server" AutoPostBack="False" Width="120px">
                                                                        </asp:DropDownList>
                                                                    </ContentTemplate>
                                                                </asp:UpdatePanel>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </ContentTemplate>
                                            </asp:UpdatePanel>
                                        </asp:Panel>
                                        <asp:RoundedCornersExtender ID="RCE6" runat="server" TargetControlID="PC5" BorderColor="Black"
                                            Enabled="True" Radius="5">
                                        </asp:RoundedCornersExtender>
                                    </td>
                                    <td style="width: 20px">
                                    </td>
                                    <td align="center" valign="top" style="width: 290px">
                                        <asp:Panel ID="PC6" runat="server" Height="72" CssClass="Grpbox2">
                                            <asp:UpdatePanel ID="UpdatePaneX" runat="server" UpdateMode="Conditional">
                                                <ContentTemplate>
                                                    <table style="margin-top: -6px;">
                                                        <tr>
                                                            <td align="left" colspan="3" style="padding-left: 5px;">
                                                                <asp:Label ID="Label4" runat="server" Text="Time Zoom Selection" Font-Size="Small"
                                                                    ForeColor="Red" Font-Bold="True"></asp:Label>
                                                                <span style="padding-left: 10px">
                                                                    <asp:Button ID="TimeDef" runat="server" Text="DEFAULTS" Font-Size="6pt" ToolTip="Reset filter to all QSOs"
                                                                        OnClick="TimeDef_Click" SkinID="butSkin" />
                                                                </span>
                                                            </td>
                                                        </tr>
                                                        <tr align="left">
                                                            <td>
                                                                <asp:Label ID="Label5" runat="server" CssClass="GrpboxLabels2" Text="Start Time"></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="Label6" runat="server" CssClass="GrpboxLabels2" Text="Hours"></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr align="left">
                                                            <td>
                                                                <asp:UpdatePanel ID="UpdatePanelTst" runat="server" UpdateMode="Conditional">
                                                                    <ContentTemplate>
                                                                        <asp:DropDownList ID="DDLVStart" runat="server" AutoPostBack="False" Width="130px">
                                                                        </asp:DropDownList>
                                                                    </ContentTemplate>
                                                                </asp:UpdatePanel>
                                                            </td>
                                                            <td>
                                                                <asp:DropDownList ID="DDLVHours" runat="server" AutoPostBack="False" Width="90px">
                                                                </asp:DropDownList>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </ContentTemplate>
                                            </asp:UpdatePanel>
                                        </asp:Panel>
                                        <asp:RoundedCornersExtender ID="RCE7" runat="server" TargetControlID="PC6" BorderColor="Black"
                                            Enabled="True" Radius="5">
                                        </asp:RoundedCornersExtender>
                                    </td>
                                    <td style="width: 110px; text-align: right">
                                        <asp:ImageButton ID="ImageButtonD" runat="server" ImageUrl="~/images/btn_donate_LG.gif"
                                            PostBackUrl="~/paypal.aspx" />
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </asp:Panel>
    </div>
    <asp:SqlDataSource ID="GeoSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:GeoConnectionString %>"
        ProviderName="<%$ ConnectionStrings:GeoConnectionString.ProviderName %>" SelectCommand="SELECT [CoumtryCode], [Prefix] FROM [Cty] WHERE ([CoumtryCode] = ?)">
        <SelectParameters>
            <asp:Parameter DefaultValue="" Name="CoumtryCode" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="WeblogSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:WebLog_db_MDB %>"
        ProviderName="<%$ ConnectionStrings:WebLog_db_MDB.ProviderName %>" SelectCommand="SELECT [DBName] FROM [ContestInfo] WHERE ([ContestID] = ?)">
        <SelectParameters>
            <asp:Parameter Name="ContestID" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="ContestCallsSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ContestCallsSqlDataSource %>"
        ProviderName="<%$ ConnectionStrings:ContestCallsSqlDataSource.ProviderName %>"
        SelectCommand="SELECT [Call], [CatOprID], [CatTxID], [CatAssisted], [CatBandID], [CatPowerID] FROM [CqwwEntry] ORDER BY [Call]"
        EnableCaching="True"></asp:SqlDataSource>
    <asp:SqlDataSource ID="LogEntryInfoSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:LogEntryInfoConnectionString %>"
        ProviderName="<%$ ConnectionStrings:LogEntryInfoConnectionString.ProviderName %>"
        SelectCommand="SELECT [Call], [CatOprID], [CatTxID], [CatAssisted], [CatBandID], [CatPowerID], [CatOverlayID], [ClaimedScore], [CalcZones], [CalcCountries], [CalcScore], [DBName], [CallID] FROM [CqwwEntry] WHERE ([Call] = ?)"
        EnableCaching="True">
        <SelectParameters>
            <asp:Parameter Name="Call" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
