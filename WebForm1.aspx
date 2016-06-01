<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="ContestViewer.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
<style type="text/css">

/* CSS Document */

html, body, div, span, applet, object, iframe,
h1, h2, h3, h4, h5, h6, p, blockquote, pre,
a, abbr, acronym, address, big, cite, code,
del, dfn, em, font, img, ins, kbd, q, s, samp,
small, strike, strong, sub, sup, tt, var,
b, u, i, center,
dl, dt, dd, ol, ul, li,
fieldset, form, label, legend,
table, caption, tbody, tfoot, thead, tr, th, td {
	margin: 0;
	padding: 0;
	border: 0;
	outline: 0;
	font-size: 95%;
	vertical-align: baseline;
	background: transparent;
}
body {
line-height: 25px;
}
ol, ul {
	list-style-type: inherit;}
blockquote, q {
	quotes: none;
}
blockquote:before, blockquote:after,
q:before, q:after {
	content: '';
	content: none;
}

/* remember to define focus styles! */
:focus {
	outline: 0;
}

/* remember to highlight inserts somehow! */
ins {
	text-decoration: none;
}
del {
	text-decoration: line-through;
}

/* tables still need 'cellspacing="0"' in the markup */
/* table styles */

table {
    border-collapse: collapse;
    border-spacing: 0;
    margin-left:auto;
    margin-right:auto;}
#FeatureMatrix {padding: 4px 0;}
#FeatureMatrix {font-size: 13px;}
#FeatureMatrix th#MatrixItems {}
#FeatureMatrix th.matrixColumn, #FeatureMatrix td.matrixItem,
#FeatureMatrix td.matrixOdd, #FeatureMatrix td.matrixEven {
    background-color: #e4e4e4;
    text-align: center;
    border-width: 1px 1px 0 1px;
    border-style: solid;
    border-color: #C6C6C6;}
#FeatureMatrix td.matrixItem { font-weight: bold; }
#FeatureMatrix td.matrixEven { background-color: #eee; }
#FeatureMatrix td.matrixOdd { background-color: #F9F9F9; }
#FeatureMatrix th h6 {
    font-size: 17px;
    font-weight: bold;
    margin-top: 11px;
    padding-bottom: 3px;}
#FeatureMatrix .matrixItem {
    width: 95px;
    padding: 2px 0 2px;}
#FeatureMatrix td {width: 75px;}
#FeatureMatrix td.last {border-bottom: 1px solid #C6C6C6;}


/*--------- common -----*/
body	{ background:#f6f6f6; font-family: "Helvetica", Arial, Helvetica, sans-serif }
.left	{float:left}
.right	{ float:right}
.clear	{ clear:both; font-size:1px; line-height:1px}
/* .wrapper	{ width:960px; margin:0 auto; background:url(../images/bg.jpg) no-repeat center bottom} */
.wrapper	{ width:960px; margin:0 auto; no-repeat center bottom}
/*
.main_wrap	{ background:url(../images/bg2.jpg) repeat-y center top; width:960px; margin:0 auto;}
*/

.hr { 
	clear: both;
	padding-top: 5px;
	margin: 0 0 1em;
	height: 5px;
	background: transparent url("../images/hr-bg.gif") repeat-x 0 0; }



/*--------- common -----*/
.top_nav	{ height:25px; background-color: #666; border-top: 1px solid #202020; border-bottom: 1px solid #202020;}
.top_nav .top_nav_wrap	{ width:100%; margin:0 auto}
.top_nav ul	{ margin:0; padding:0 25px 0 0; float:right; list-style:none}
.top_nav ul li	{ padding:0 0 0 10px; color:#e2e2e2; float:left; font-size:12px; line-height:25px}
.top_nav ul li a	{color:#e2e2e2; font-size:12px; line-height:25px; text-decoration:none}
.top_nav ul li a:hover	{ text-decoration:underline} 




/*--------- Top Nav -----*/

/*--------- footer -----*/
.footer_nav	{ height:25px; width: 740px; background-color: #2e2e2e; margin-left: auto; margin-right: auto; padding: 5px;}
.footer_nav .footer_nav_wrap	{ width:100%; margin:0 auto}
.footer_nav ul	{ margin:0; padding:0 25px 0 0; float: inherit; list-style:none}
.footer_nav ul li	{ padding:0 0 0 10px; color:#e2e2e2; float:left; font-size:12px; line-height:25px}
.footer_nav ul li a	{color:#e2e2e2; font-size:12px; line-height:25px; text-decoration:none}
.footer_nav ul li a:hover	{ text-decoration:underline} 
/*--------- Top Nav -----*/

/*--------- Header -----*/

.header	{   padding:15px 0 0 0; width:744px; margin:0 auto; }
.header .logo	{ padding:0 0 15px 18px}
.header .menu	{ background:url(../images/menu_bar.gif) no-repeat; height:42px; width:770px; padding-left:10px; margin-bottom: 0;}
.menu ul	{ margin:0; padding:0; list-style:none}
.menu ul li	{ display:inline-block; float:left; height:42px; background:url(../images/menu_divider.gif) no-repeat right top; padding-right:2px}
.menu ul li a	{ display:block; padding:0 18px; float:left; background:url(../images/menu_over.gif) repeat-x 0 50px; font-size:14px; color:#ffffff; line-height:42px; text-decoration:none; text-shadow: #000 1px 1px ;}
.menu ul li a:hover	{ background-position:0 0}
.menu ul li.active a	{ background-position:0 0}
/*--------- Header -----*/

/*--------- Main Body -----*/
.banner				{ width:796px; margin:0 auto; background-color: #FFFFFF; width:788px; height:343px}	
.banner .banner_con	{ width:180px; float:right; padding:38px 40px 0 0}
.banner .banner_con h1	{ font-size:30px; color:#d8ddd9; line-height:32px; border-bottom:solid 1px #999999; font-weight:normal; float:left; padding-bottom:7px}
.banner .banner_con p	{ font-size:10px; color:#d8ddd9; line-height:13px; width:175px; margin:0 auto; padding:10px 0}
.banner .banner_con a	{ background:url(../images/pdf.png) no-repeat; width:160px; height:61px; display:block; color:#a6a5a5; font-size:16px; line-height:60px; padding:0 0 0 20px; text-decoration:none}
/*--------- Main Body -----*/

/*--------- container -----*/
.container		{ width:740px; margin:0 auto; background:url(../images/container_bg3.png) repeat-y left top; padding: 0 0 0 0; -moz-border-radius: 10px; border-radius: 10px; padding-bottom: 15px;}
.container .Left_con	{ width:497px}
.container .Right_con	{ width:200px; padding:0 10px 0 5px}
.gap60	{ height:62px}
/*--------- container -----*/

/*--------- container wrap ---*/
.container_wrap	 { width:680px; margin: auto; padding-top: 60px; position: inherit;   }
.container_wrap ol {margin-bottom:20px; padding:0; font-size:15px; }
.container_wrap ol li {margin-left:20px; padding:0;}
.container .container_wrap h3	{ color:#434343; font-size:30px; font-weight:normal; padding:10px 0 15px 0}
.container .container_wrap h4	{ color:#434343; font-size:20px; font-weight:normal; padding:10px 0 10px 0}
.container .container_wrap p	{ font-size:14px; color:#2c2b2b; padding:0 0 20px 0; width:700px; line-height:25px}
h4	{ color:#434343; font-size:20px; font-weight:normal; padding:10px 0 10px 0}
p {color: #434343; font-size: 13px; font-weight:normal;}
/*--------- container wrap ---*/

/*--------- submenu ---*/

.submenu	 { width:727px; padding: 5px; background:url(../images/container_bg4.png); position:absolute; float: right; margin-top: -2px; border-top: 3px solid #666;  }
.submenu ul	{ margin-right: 30px; padding:0; list-style:none; float: left}
.submenu ul li	{ display:inline-block; padding-right:2px; float: left !important; }
.submenu ul li a	{ display:block; padding:0 10px; font: 12px Tahoma, Helvetica, Arial, Sans-Serif; text-decoration:underline; color: #222; }

/*--------- submenu ---*/

/*--------- records wraps ---*/

.records_menu_wrap{
	float:left;
	width:200px;
}

.records_content_wrap{
	width:500px;
	float:right;
	padding-right: 15px;
	padding-top: 10px;
	
	
}

/* side navigation menu */

.sideNavWrapper	{ background: transparent url("../images/side-navigation-repeat.gif") repeat-y 0 0; margin: 0 0 0.5em; list-style: none; position: top right; }
.sideNavBox-1	{ background: transparent url("../images/side-navigation-top.gif") no-repeat 0 0; padding: 15px 0 0; position: top right; list-style: none; background-color: white; }
.sideNavBox-2	{ background: transparent url("../images/side-navigation-bottom.gif") no-repeat 0 100%; padding: 0 0 15px; min-height: 100px; position: top right;}

ul.sideNav {
	padding: 0;
	padding-bottom:15px;
	margin-left: 0;}
ul.sideNav li {
	font-size: 1.4em;
	background: none;
	padding: 0;
	margin: 0;
}
.sideNav li a {
	display: block;
	padding: 0.5em 5px 0.5em 20px;
	margin: 0;	
	border-bottom: 1px dotted #DBDBDC;
	text-shadow: #fff 1px 1px ;
	color:#000}
.sideNav li.currentPage	{ background: transparent url("../images/side-navigation-active.gif") no-repeat 0 0; position: top right; }
.sideNav li.currentPage	a,
.sideNav li.currentPage a:link, .sideNav li.currentPage a:visited,
.sideNav li.currentPage a:hover, .sideNav li.currentPage a:active	{ color: #2C2C2C; border-bottom: 1px solid #fff; }
.sideNavBox-1 h2 {font-size: 13px; font-weight: 100; color:#fff; padding-left: 19px; padding-top:5px; padding-bottom: 5px; background-color: #666;}

/*--------- footer -----*/
.cqlogo { margin-right:85px;  float: right;}
/*--------- footer -----*/
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MC" runat="server">
                		<div class="container"> 
                		
                			<div class="submenu">
	<ul> 
       <li><a href="/rules.php">English</a></li>
       <li><a href="/2010_rule_changes.php">2010 Rule Changes</a></li>
       <!-- Localized rules -->
       <li><a href="/rules.php?lang=Arabic">Arabic</a></li>
       <li><a href="/rules.php?lang=Bulgarian">Bulgarian</a></li>
       <li><a href="/rules.php?lang=Chinese">Chinese</a></li>
       <li><a href="/rules.php?lang=Dutch">Dutch</a></li> 
       <li><a href="/rules.php?lang=Finnish">Finnish</a></li> 
       <li><a href="/rules.php?lang=French">French</a></li> 
       <li><a href="/rules.php?lang=German">German</a></li>
       <li><a href="/rules.php?lang=Greek">Greek</a></li>
       <li><a href="/rules.php?lang=Italian">Italian</a></li>
       <li><a href="/rules.php?lang=Portuguese">Portuguese</a></li>
       <li><a href="/rules.php?lang=Russian">Russian</a></li>
       <li><a href="/rules.php?lang=Serbian">Serbian</a></li>
       <li><a href="/rules.php?lang=Slovenian">Slovenian</a></li>
       <li><a href="/rules.php?lang=Spanish">Spanish</a></li>
       <li><a href="/rules.php?lang=Swedish">Swedish</a></li>
       <li><a href="/rules.php?lang=Ukrainian">Ukrainian</a></li>
    </ul> 
</div>

    <asp:Panel ID="ResultsPanel" runat="server" Width="994px" CssClass="QSORatePanel" >

    <table  >
        <tr>
            <td>
                1;
            </td>
            <td>
                2;
            </td>
            <td>
                3;
            </td>
        </tr>
        <tr>
            <td>
                4;
            </td>
            <td>
                5;
            </td>
            <td>
                6;
            </td>
        </tr>
    </table>
    <br />
    <table style="width: 100%;">
        <tr>
            <td>
                A
            </td>
            <td>
                B;
            </td>
            <td>
                C
            </td>
        </tr>
        <tr>
            <td>
                D
            </td>
            <td>
                E
            </td>
            <td>
                F
            </td>
        </tr>
    </table>
        </asp:Panel>

</asp:Content>
