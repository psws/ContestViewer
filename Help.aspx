<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeBehind="Help.aspx.cs" Inherits="ContestViewer.Help" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MC" runat="server">
    <div style="font-weight: 700; width: 980px; color: #000000; background-color: #99CCFF;" 
        class="style3">
        <br />
        <span style="font-size: x-large; color: #FFFFFF">Help For using the LOGQSO Contest Log
            Viewer</span><span class="style1"><br />
                <br />
            </span>FUNCTIONALITY:
        <p style="font-weight: normal; margin-left: 25px;">
            <asp:HyperLink ID="HyperLink1" runat="server">View Charts and Graphs of your CQWW contest Log</asp:HyperLink><br />
            <asp:HyperLink ID="HyperLink2" runat="server">Compare your CQWW contest Log with 1 or 2 other Competitor's Logs</asp:HyperLink><br />
            <asp:HyperLink ID="HyperLink3" runat="server">Compare your CQWW contest Log with your previous contest Logs</asp:HyperLink><br />
            <asp:HyperLink ID="HyperLink4" runat="server">Analyze 1, 2 or 3 CQWW contest Logs for generating your next contest strategy</asp:HyperLink><br />
        </p>
        LOG SELECTION:<br />
        <span style="font-weight: normal; ">
         This applicatin has 3 Controls for selecting the logs and filtering the log data
       </span>
        <p style="margin-left: 25px;">
            <asp:HyperLink ID="HyperLink5" runat="server" NavigateUrl='#CatCtl'>Contest Category Selection </asp:HyperLink><br />
            <asp:HyperLink ID="HyperLink6" runat="server" NavigateUrl="#CallCtl">Contest Call Selection</asp:HyperLink><br />
            <asp:HyperLink ID="HyperLink7" runat="server" NavigateUrl="#QSOCtl">Log QSO Filtering</asp:HyperLink><br />
        </p>
        CHART and GRAPH SELECTION:<br />
        <span style="font-weight: normal; ">
         This application produces a chart or graph for the 1 to 3 calls selected. 
         The results displayed are dependent on the Contest selected, the call selected, the Category of the Log
         and the Log QSO filter.

       </span>
        <p style="margin-left: 25px;">
            <asp:HyperLink ID="HyperLinkA" runat="server" NavigateUrl='#ChartCtl'>Chart and Graph Fields </asp:HyperLink><br />
        </p>
 <hr /><hr />
       <p style="margin-left: 15px;" id="CatCtl">
            <span style="font-size: 16pt; width: 300px;">Contest Category Selection</span>
            <p style="font-weight: normal; padding-left: 35px;">
            The contest Category selectors allow a user to limit the log choices. 
            This can make it easier to select from the 4000 plus logs available in each supported contest.
            The limits are seleted by making choices in the Contest Category Selection items.
            You can limit the contests to a single
             contest entry category or a group of contest categories.
            If you use the default Contest Category Selection, all calls in the contest will be available for selection.
            This control is used if you want to compare your log with another log in the same entry category.
            For example: you would not normally compare a SOSB 160M log with a SOSB 40M log.
             </p>
        </p>
        <table style="width: 95%; margin-left: 35px">
            <tr>
                <td style="text-align: center; font-weight: bold; color: #008000;" id="DefCatSel">
                    Default Contest Category Selection<br />
                </td>
            </tr>
            <tr>
                <td style="text-align: center; padding-left: 15px;">
                        <asp:Image ID="Image1" runat="server" ImageUrl="~/images/Cat1.gif" />
                    </td>
                    <td  style="font-weight: normal; padding-left: 5px; padding-right: 5px; ">
                        The Contest entry category for this selection is all categories. 
                        You can select Calls in the 
                        <asp:HyperLink ID="HyperLink8" runat="server" NavigateUrl="#CallCtl" Text="Call Selection Controls "></asp:HyperLink> for all contest participants.
                    </td>
                </tr>
             <tr>
                <td style="text-align: center; font-weight: bold; color: #008000;">
                    All Single-Op All Band Logs (SOAB) Selection<br />
                </td>
             </tr>
               <tr>
                    <td style="text-align: center">
                        <asp:Image ID="Image2" runat="server" ImageUrl="~/images/CatSingleDef.gif" />
                    </td>
                    <td  style="font-weight: normal; padding-left: 5px; padding-right: 5px; ">
                        This Contest entry category will limit the  
                        <asp:HyperLink ID="HyperLink9" runat="server" NavigateUrl="#CallCtl" Text="Call Selection Controls "></asp:HyperLink> to selecting only Contest logs
                        that are in the Single-Op All Band category. Low  or High Power and Assisted or Non-Assisted logs will be selectable
                    </td>
                </tr>
             <tr>
                <td style="text-align: center; font-weight: bold; color: #008000;">
                   Single-Op Single Band Logs (SOSB) Selection<br />
                </td>
             </tr>
               <tr>
                    <td style="text-align: center">
                        <asp:Image ID="Image3" runat="server" ImageUrl="~/images/CatSingleBandDef.gif" />
                    </td>
                    <td  style="font-weight: normal; padding-left: 5px; padding-right: 5px; ">
                        This Contest entry category will limit the  
                        <asp:HyperLink ID="HyperLink10" runat="server" NavigateUrl="#CallCtl" Text="Call Selection Controls "></asp:HyperLink> to selecting logs
                        that are in the Single-Op Single Band 20M category. Low  or High Power and Assisted or Non-Assisted logs will be selectable
                    </td>
                </tr>
             <tr>
                <td style="text-align: center; font-weight: bold; color: #008000;">
                   Single-Op Single Band High Power Logs (SOSB) Selection<br />
                </td>
             </tr>
               <tr>
                    <td style="text-align: center">
                        <asp:Image ID="Image4" runat="server" ImageUrl="~/images/CatSingleBandHighDef.gif" />
                    </td>
                    <td  style="font-weight: normal; padding-left: 5px; padding-right: 5px; ">
                        This Contest entry category will limit the  
                        <asp:HyperLink ID="HyperLink11" runat="server" NavigateUrl="#CallCtl" Text="Call Selection Controls "></asp:HyperLink> to selecting logs
                        that are in the Single-Op Single Band 40M High Power category. Assisted or Non-Assisted logs will be selectable
                    </td>
                </tr>
              <tr>
                <td style="text-align: center; font-weight: bold; color: #008000;">
                   All Multi-Op Logs Selection<br />
                </td>
             </tr>
               <tr>
                    <td style="text-align: center">
                        <asp:Image ID="Image5" runat="server" ImageUrl="~/images/CatMultiDef.gif" />
                    </td>
                    <td  style="font-weight: normal; padding-left: 5px; padding-right: 5px; ">
                        This Contest entry category will limit the  
                        <asp:HyperLink ID="HyperLink12" runat="server" NavigateUrl="#CallCtl" Text="Call Selection Controls "></asp:HyperLink> to selecting logs
                        that are in the Multi-Op category. Multi-Single, Multi-2 and Milti-Multi logs will be selectable
                    </td>
                </tr>
               <tr>
                <td style="text-align: center; font-weight: bold; color: #008000;">
                   Multi-Single Logs (MS) Selection<br />
                </td>
               </tr>
            <tr>
                <td style="text-align: center">
                    <asp:Image ID="Image6" runat="server" ImageUrl="~/images/CatMulti1Def.gif" />
                </td>
                <td style="font-weight: normal; padding-left: 5px; padding-right: 5px;">
                    This Contest entry category will limit the
                    <asp:HyperLink ID="HyperLink13" runat="server" NavigateUrl="#CallCtl"
                        Text="Call Selection Controls "></asp:HyperLink>
                    to selecting logs that are in the Multi-Single category.
                </td>
            </tr>
            <tr>
                <td style="text-align: center; font-weight: bold; color: #008000;">
                    Multi-2 Logs (M2) Selection<br />
                </td>
            </tr>
            <tr>
                <td style="text-align: center">
                    <asp:Image ID="Image7" runat="server" ImageUrl="~/images/CatMulti2Def.gif" />
                </td>
                <td style="font-weight: normal; padding-left: 5px; padding-right: 5px;">
                    This Contest entry category will limit the
                    <asp:HyperLink ID="HyperLink14" runat="server" NavigateUrl="#CallCtl"
                        Text="Call Selection Controls "></asp:HyperLink>
                    to selecting logs that are in the Multi-2 category.
                </td>
            </tr>
            <tr>
                <td style="text-align: center; font-weight: bold; color: #008000;">
                    Multi-Multi Logs (MM) Selection<br />
                </td>
            </tr>
            <tr>
                <td style="text-align: center">
                    <asp:Image ID="Image8" runat="server" ImageUrl="~/images/CatMulti2Def.gif" />
                </td>
                <td style="font-weight: normal; padding-left: 5px; padding-right: 5px;">
                    This Contest entry category will limit the
                    <asp:HyperLink ID="HyperLink15" runat="server" NavigateUrl="#CallCtl"
                        Text="Call Selection Controls "></asp:HyperLink>
                    to selecting logs that are in the Multi-Multi category.
                </td>
            </tr>
             <tr>
                <td style="text-align: center; font-weight: bold; color: #008000;" 
                     id="CatDisable">
                    Disable box Selection<br />
                </td>
            </tr>
            <tr>
                <td style="text-align: center">
                    <asp:Image ID="Image10" runat="server" ImageUrl="~/images/Catchk.gif" />
                </td>
                <td style="font-weight: normal; padding-left: 5px; padding-right: 5px;">
                    Checking the Disable check box allows the user to disable all category filtering.
                    This is the same as the 
                    <asp:HyperLink ID="HyperLink16" runat="server" NavigateUrl="#DefCatSel"
                     Text="Default Contest Category Selection. "></asp:HyperLink>
                    Removing the check box will return to using the selected categories.
                </td>
            </tr>
       </table>
        <hr />
        <hr />
        <span id="CallCtl" style=" margin-left: 15px;font-size: 16pt;">
            Contest Call Selection<br />       </span>
        <table style="width: 95%; margin-left: 35px">
            <tr>
                <td style="text-align: center; font-weight: bold; color: #008000;" id="contestSel">
                    Call1 Contest Selection<br />
                </td>
            </tr>
            <tr>
                <td style="text-align: left; padding-left: 15px;">
                        <asp:Image ID="Image9" runat="server" ImageUrl="~/images/ContestSel.gif" />
                    </td>
                    <td  style="font-weight: normal; padding-left: 5px; padding-right: 5px; ">
                        The Contest for 'Call1', 'Call2', and 'Call3' are selected by clicking on the 'Contest' dropdown box. 
                        The supported contests are listed. Click on one of the contests displayed. 
                        The contest you select determines the list of log callsigns presented in the 
                        <asp:HyperLink ID="HyperLink17" runat="server" NavigateUrl="#callSel" Text="Call Selection Controls. "></asp:HyperLink>
                        The presented calls are also filtered by the 
                        <asp:HyperLink ID="HyperLink19" runat="server" NavigateUrl="#CatCtl" Text="Contest Category Selection "></asp:HyperLink>
                        you have chosen. 
                    </td>
                </tr>
            <tr>
                <td style="text-align: center; font-weight: bold; color: #008000; padding-top: 30px;" 
                    id="callSel">
                    Call1 Call Selection<br />
                </td>
            </tr>
            <tr>
                <td style="text-align: center; padding-left: 15px; width: 400px;">
                        <asp:Image ID="Image11" runat="server" ImageUrl="~/images/ContestSelCall.gif" />
                    </td>
                    <td  style=" padding-left: 5px; padding-right: 5px; font-weight: normal;">
                        You must select at least one callsign in any of the 3 'Call#' group.
                        You can select up to 3 callsigns for analysis.<br /><br />
                        When you click on the call entry window you are presented with a tabbed  [(1-9)-Z]
                        sorted list of calls to select from. Each tab contains all calls that begin with the letter dispalyed in the tab.
                        The default tab is dependent on the country of your internet proivder.
                        Click on any call, displayed under the tab, to select. Clicking on any other tab will download and display its calls.
                        The calls, in the tab, depend on what contest you select in the   
                        <asp:HyperLink ID="HyperLink18" runat="server" NavigateUrl="#contestSel" Text="Contest Selection "></asp:HyperLink> selector
                        The presented calls are also filtered by the 
                        <asp:HyperLink ID="HyperLink20" runat="server" NavigateUrl="#CatCtl" Text="Contest Category "></asp:HyperLink>
                        selections.
                        You can cancel a call selection by clickimg on the red 
                        <span style="color: #FF0000; font-weight: bold">X</span> box in the upper right corner of a tab call list.
                        When you change the contest or the Category settings the Call you have selected may disappear. This is normal and
                        occurs when that Call did not operate in the selected category or selected contest.
                    </td>
                </tr>
            <tr>
                <td style="text-align: center; font-weight: bold; color: #008000;padding-top: 30px; " id="Td1">
                    Call1 Disable<br />
                </td>
            </tr>
            <tr>
                <td style="text-align: left; padding-left: 15px; ">
                    <asp:Image ID="Image12" runat="server" ImageUrl="~/images/ContestCan.gif" />
                </td>
                <td style="font-weight: normal; padding-left: 5px; padding-right: 5px;">
                    The Contest Disable checkbox can be checked for 'Call1', 'Call2', and 'Call3'. Checking
                    the box removes that call from the graph or chart. Removing the check allows the
                    selected call to be included in the graph.
                </td>
            </tr>
        </table>
         <hr />
        <hr />
       <span id="QSOCtl" style="margin-left: 15px;"> </span>
             <span style="font-size: 16pt; width: 300px;">Log QSO Filtering</span>
            <p style="font-weight: normal; padding-left: 35px;">
            The application can filter the QSOs of a selected Call log.
            QSOs of a log can be included or excluded from the Chart or Graph.
            For example: Show the 160M QSOs of a SOAB log or Show the QSOs for a specific zone....
            The QSO filter always applies to 'Call1', 'Call2', and 'Call3'. If you disable  
            two of the 
             <asp:HyperLink ID="HyperLink23" runat="server" NavigateUrl="#CatDisable" Text=" Call Disable boxes "></asp:HyperLink>
            in the 'Call#' group you can view the QSO filtering for one call.
            <br /><br />
            The Continent, Country, and Zone selections can only be used individually.
            It would make no sense to Filter Germans in Zone 5 in Africa. When Using one of these 3 selectors
            you must return them to their 'ALL' settings before you can activate the other two. The 'ALL' choice is at the top of the 
            dropdown list. You can Hyperscroll to the desired country, in the dropdown list, by entering the first letter 
            of the desired Country.
            </p>
       <table style="width: 95%; margin-left: 35px">
            <tr>
                <td style="text-align: center; font-weight: bold; color: #008000;" >
                    Default Log QSO Filtering<br />
                </td>
            </tr>
            <tr>
                <td style="text-align: left; padding-left: 15px;">
                    <asp:Image ID="Image13" runat="server" ImageUrl="~/images/QSODef.gif" />
                </td>
                <td style="font-weight: normal; padding-left: 5px; padding-right: 5px;">
                    The Default QSO filtering is No filtering. All QSOs will be used to generate
                    the chart and graph data. Clicking the 'Defaults' button will return all selections to their default setting. 
                </td>
            </tr>
             <tr>
                <td style="text-align: center; font-weight: bold; color: #008000;" >
                    Band Log QSO Filtering<br />
                </td>
            </tr>
            <tr>
                <td style="text-align: left; padding-left: 15px;">
                    <asp:Image ID="Image14" runat="server" ImageUrl="~/images/QSObnd.gif" />
                </td>
                <td style="font-weight: normal; padding-left: 5px; padding-right: 5px;">
                    The band QSO filtering selects only QSOs on the selected band for charts and graphs.
                    This filtering will be a[[lied to all 'Call#' that are not disabled. 
                    The Band filtering is always available. 
                    The selection shown will graph and chart only 80M QSOs from all Continents, all Countries and 
                    all zones.
                </td>
            </tr>
             <tr>
                <td style="text-align: center; font-weight: bold; color: #008000;" >
                    Continent Log QSO Filtering<br />
                </td>
            </tr>
            <tr>
                <td style="text-align: left; padding-left: 15px;">
                    <asp:Image ID="Image15" runat="server" ImageUrl="~/images/QSOCon.gif" />
                </td>
                <td style="font-weight: normal; padding-left: 5px; padding-right: 5px;">
                    The Continent QSO filtering selects only QSOs on the selected Continent for charts and graphs.
                    This filtering will be applied to all 'Call#' that are not disabled. 
                    The selection shown will graph and chart only European (EU) QSOs from all Bands.
 
                </td>
            </tr>
             <tr>
                <td style="text-align: center; font-weight: bold; color: #008000;" >
                    Country Log QSO Filtering<br />
                </td>
            </tr>
            <tr>
                <td style="text-align: left; padding-left: 15px;">
                    <asp:Image ID="Image16" runat="server" ImageUrl="~/images/QSOCou.gif" />
                </td>
                <td style="font-weight: normal; padding-left: 5px; padding-right: 5px;">
                    The Country QSO filtering selects only QSOs in the selected Country for charts and graphs.
                    This filtering will be applied to all 'Call#' that are not disabled. 
                    The selection shown will graph and chart only German QSOs from all Bands.
                </td>
            </tr>
           <tr>
               <td style="text-align: center; font-weight: bold; color: #008000;" >
                   Zone Log QSO Filtering<br />
               </td>
           </tr>
           <tr>
               <td style="text-align: left; padding-left: 15px;">
                   <asp:Image ID="Image17" runat="server" ImageUrl="~/images/QSOZn.gif" />
               </td>
               <td style="font-weight: normal; padding-left: 5px; padding-right: 5px;">
                   The Zone QSO filtering selects only QSOs in the selected Zone for charts and graphs.
                   This filtering will be applied to all 'Call#' that are not disabled. The selection
                   shown will graph and chart only Zone 15 QSOs from the 20M Band.
               </td>
           </tr>
           <tr>
               <td style="text-align: center; font-weight: bold; color: #008000;" id="QSODisable">
                   Disable Log QSO Filtering<br />
               </td>
           </tr>
           <tr>
               <td style="text-align: left; padding-left: 15px;">
                   <asp:Image ID="Image18" runat="server" ImageUrl="~/images/QSODis.gif" />
               </td>
               <td style="font-weight: normal; padding-left: 5px; padding-right: 5px;">
                   Checking the Disable QSO filtering Checkbox will select all QSOs for the charts and graphs.
                    The filtering choices remain but they are ignored.
                    Removing the check will return to filtering using the current selections.
               </td>
           </tr>
       </table>
         <hr />
        <hr />
       <span id="ChartCtl" style="margin-left: 15px;"> </span>
             <span style="font-size: 16pt; width: 300px;">CHART and GRAPH SELECTION</span>
            <p style="font-weight: normal; padding-left: 35px;">
            Supported Charts and Graphs include QSO rate and many more.
            You can save the chart by right clicking on the chart image and selecting: 'Save Picture as' in Internet
            Explorer, 'Save Image As' in Firefox and 'Save Image' in Opera.<br />
            <br />
            The Charts and Graphs views have 2 groups of control. The View Y-Axis Selection and the Time Zoom Selection.<br /><br />
            The View Y-Axis Selection group allows the user to select a 'Function', 'Interval', and 'View type'. With these controls,
            you can select a Rate or Sum view for QSOs, Score,Zones, Countries, Points and Mults. The 'Interval' control selects
            the sample point interval. You can select from 60 Minutes to 1 minutes intervals. The interval time is very useful when Zooming the time.
            The 'View type' control selects how the data is charted or graphed. You can select 3D views and line, column, area, spline and point.<br /><br />
            The Time Zoom Selection group controls the zoom for the chart or graph. You can select a 'Start Time' in 4 hour increments.
            The 'Hours' control selects how many hours to display after the start time. 
            </p>
       <table style="width: 400px; margin-left: 35px">
             <tr>
                <td style="text-align: center; font-weight: bold; color: #008000;" >
                    Default View Y-Axis Selection<br />
                </td>
            </tr>
            <tr>
                <td style="text-align: left; padding-left: 15px;">
                    <asp:Image ID="Image20" runat="server" ImageUrl="~/images/ViewDef.gif" />
                </td>
                <td style="font-weight: normal; padding-left: 5px; padding-right: 5px;">
                    The Default selection is QSO Rate, 60 min sample points and column charting.
                    Changing any of these controls will redraw the Chart or graph.The Chart below is the result View.
                </td>
            </tr>
       </table>
       <table style="width: 400px; margin-left: 35px">
           <tr>
                <td style="text-align: center; font-weight: bold; color: #008000;" id="Td8">
                    Default View Y-Axis Selection QSO Rate Chart<br />
                </td>
            </tr>
            <tr>
                <td style="text-align: left; padding-left: 15px;">
                    <asp:Image ID="Image19" runat="server" ImageUrl="~/images/ChartRate.gif" 
                        Width="700px" />
                </td>
                <td style="font-weight: normal; padding-left: 5px; padding-right: 5px;">
                    The chart shown is for 'QSO Rate'. The 3 calls CN2R, 8P5A and CR2X are all drawn
                    in the chart. Each call has a specific color. The color legend is shown at the top
                    right corner of the chart. The lower Left corner shows each calls category information
                    in green. All of these calls were in the SOAB High
                </td>
            </tr>
       </table>
        <hr />
        <table style="width: 400px; margin-left: 35px">
            <tr>
                <td style="text-align: center; font-weight: bold; color: #008000;">
                    Score Sum View Y-Axis Selection<br />
                </td>
            </tr>
            <tr>
                <td style="text-align: left; padding-left: 15px;">
                    <asp:Image ID="Image21" runat="server" ImageUrl="~/images/ViewScore.gif" />
                </td>
                <td style="font-weight: normal; padding-left: 5px; padding-right: 5px;">
                    The Score Sum 'Function' selection forces the 'View type to spline. All 'Function'
                    Sum selections will force the View to spline. You can change the 'View type' to
                    any other selection after you choose a sum 'Funtion'.
                </td>
            </tr>
        </table>
        <table style="width: 900px; margin-left: 35px">
            <tr>
                <td style="text-align: center; font-weight: bold; color: #008000;" id="Td2">
                    Score Sum View Y-Axis Selection Graph<br />
                </td>
            </tr>
            <tr>
                <td style="text-align: left; padding-left: 15px;">
                    <asp:Image ID="Image22" runat="server" ImageUrl="~/images/ViewGScore.gif" 
                        Width="880px" />
                </td>
            </tr>
        </table>
        <hr />
        <table style="width: 400px; margin-left: 35px">
            <tr>
                <td style="text-align: center; font-weight: bold; color: #008000;">
                    QSO Rate with 1600Z Day 1- 24 Hour View Y-Axis Selection<br />
                </td>
            </tr>
            <tr>
                <td style="text-align: left; padding-left: 15px;">
                    <asp:Image ID="Image23" runat="server" ImageUrl="~/images/ViewQRateTime16_24.gif" />
                </td>
                <td style="font-weight: normal; padding-left: 5px; padding-right: 5px;">
                    The Time Zoom Selection group is set to a 'Start Time' of 1600Z Day1. The 'Hours control is set to 24 to 
                    view 24 Hours beyond 1600z
                </td>
            </tr>
        </table>
        <table style="width: 900; margin-left: 35px">
            <tr>
                <td style="text-align: center; font-weight: bold; color: #008000;" id="Td3">
                    QSO Rate with 1600Z Day 1- 24 Hour View Y-Axis Selection Chart<br />
                </td>
            </tr>
            <tr>
                <td style="text-align: left; padding-left: 15px;">
                    <asp:Image ID="Image24" runat="server" ImageUrl="~/images/ViewGQRateTime16_24.gif" 
                        Width="880px" />
                </td>
            </tr>
        </table>
        <hr />
        <table style="width: 400px; margin-left: 35px">
            <tr>
                <td style="text-align: center; font-weight: bold; color: #008000;">
                    QSO Rate 1 Minute Intervals with 0000Z Day 1- 1 Hour View Y-Axis Selection<br />
                </td>
            </tr>
            <tr>
                <td style="text-align: left; padding-left: 15px;">
                    <asp:Image ID="Image25" runat="server" ImageUrl="~/images/ViewQRateTime1_1.gif" />
                </td>
                <td style="font-weight: normal; padding-left: 5px; padding-right: 5px;">
                    This selection allows a user to zoom in on the QSO Rate to check the QSOs by the minute
                </td>
            </tr>
        </table>
        <table style="width: 900; margin-left: 35px">
            <tr>
                <td style="text-align: center; font-weight: bold; color: #008000;" id="Td5">
                    QSO Rate 1 Minute Intervals with 0000Z Day 1- 1 Hour View Y-Axis Chart<br />
                </td>
            </tr>
            <tr>
                <td style="text-align: left; padding-left: 15px;">
                    <asp:Image ID="Image27" runat="server" ImageUrl="~/images/ViewGQRateTime1_1.gif" 
                        Width="880px" />
                </td>
            </tr>
        </table>
         <hr />
        <table style="width: 900px; margin-left: 35px">
            <tr>
                <td style="text-align: center; font-weight: bold; color: #008000;" id="Td4">
                    Point Sum with 2000Z Day 2- 16 Hour View 40M Europeans<br />
                </td>
            </tr>
            <tr>
                <td style="text-align: left; padding-left: 15px; ">
                    <asp:Image ID="Image26" runat="server" ImageUrl="~/images/ViewPointSum.gif" 
                        Width="880px" />
                </td>
            </tr>
        </table>
        <hr />
   </div>
</asp:Content>
