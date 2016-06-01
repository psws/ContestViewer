<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="videopop.aspx.cs" Inherits="ContestViewer.videipop" MaintainScrollPositionOnPostback="False" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">


<html >
<head runat="server">
    <title></title>
<%--    <script type="text/javascript">
        window.setTimeout(tickle, 10);
        function tickle() {
            resizeBy(100, 0); //needed to kick start Safari
        }
    </script>
--%>
</head>
<body style='background-color:#c0ffff'>
    <form id="form1" runat="server" enableviewstate="False" >
    <div>
<%--        <p style='font-size: 36px; font-family: Verdana; color: #ff0000; margin-top: -20px;'>
            CMN landing.wmv <span style='font-size: 14px'>Contest</span>
        </p>
--%>
<%--        <script type="text/javascript">
            document.write('<object  id="Object1"  ');
            document.write('name="ObjQSO" width="320" height="285px" data="http://psws.com/psws/Website/Video/CMN landing.wmv" ');
            document.write('type="video/x-ms-wmv" style="vertical-align: middle; background-color: #000000;">');
            document.write("<param name='SRC' value='http://psws.com/psws/Website/Video/CMN landing.wmv' />");
            document.write("<param name='enablejavascript' value='true' />);");
            document.write("<param name='autostart' value='true' />");
            document.write("<param name='CONTROLLER' value='true' />");
            document.write("<param name='BGCOLOR' value='#c0ffff' />");
            document.write("<param name='STRETCHTOFIT' value='true' />");
            document.write("<param name='STARTTIME' value='00:00:00:00' />");
        document.write("</object>");

        </script>
--%>      
<%--       <object   id="Object1" 
            name="ObjQSO" width="320" height="285px" data="http://psws.com/psws/Website/Video/CMN landing.wmv"
            type="video/x-ms-wmv" style="vertical-align: middle; background-color: #000000;" >
             <param name='filename' value='<%# Request.QueryString["filename"] %>' />
           <param name='SRC' value='http://psws.com/psws/Website/Video/CMN landing.wmv' />
            <param name='enablejavascript' value='true' />
            <param name='autostart' value='true' />
            <param name='CONTROLLER' value='true' />
            <param name='BGCOLOR' value='#c0ffff' />
            <param name='STRETCHTOFIT' value='true' />
            <param name='STARTTIME' value='00:00:00:00' />
        </object>
--%>
    </div>
    </form>
</body>
</html>
