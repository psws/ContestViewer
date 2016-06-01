using System;
using System.Collections.Generic;
using System.IO;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

namespace ContestViewer
{
    public partial class videipop : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Safari needs a kick in the ass by resizing windows to start
            if (Request.ServerVariables["HTTP_USER_AGENT"].Contains("Safari") )
            {

                string jsliteral = @" <script type='text/javascript'>
                window.setTimeout(tickle, 1000);
                function tickle() {
                    resizeBy(1, 0); //needed to kick start Safari
                }
                </script>";
                LiteralControl myjsHtmlSnippet = new LiteralControl(jsliteral);
                Page.Header.Controls.Add(myjsHtmlSnippet);

            }

            //HtmlGenericControl obj= new HtmlGenericControl();
            //obj.TagName = "object";

            //   string s = Request.QueryString["filename"];
             
               //HtmlGenericControl myHtmlObject = new HtmlGenericControl("object");
               //myHtmlObject.Attributes["data"] = "data:application/x-silverlight-2";
               //myHtmlObject.Attributes["type"] = "application/x-silverlight-2";
               //myHtmlObject.Attributes["width"] = "100%";
               //myHtmlObject.Attributes["height"] = "100%";
               //this.Page.Controls.Add(myHtmlObject);

               //HtmlGenericControl mySourceParam = new HtmlGenericControl("param");
               //mySourceParam.Attributes["name"] = "source";
               //mySourceParam.Attributes["value"] = "ClientBin/MySilverlightApplication.xap";
               //myHtmlObject.Controls.Add(mySourceParam);

            //This code below needs to inject the HTML into the page because
            //you cannot use inline C# code in aspx file. You cannot do it because
            //you need to mark <objec> with tunat server. When you do this you
            //need to add ClassId which gives many problems.
            //This solution adds most HTML woth querystring parms supplied from
            //videopop.js. You need this js file in order to size the window on 
            //client for small popup.
            //This worls in IE, FF,chome, Opea, safari  1/8/2011
            //http://forums.silverlight.net/forums/p/133036/297005.aspx

            //The SRC and data parms below need to be full URL because
            //Chrome and Safari require it!
            //You need to creat virtual directory for website if testing on localhost
            //switch debugger to local IIS http://localhost/psws
            string folder = Path.GetDirectoryName(Request.ServerVariables["URL"]).Replace('\\','/');
            string BaseURL = @"http://" + Request.ServerVariables["SERVER_NAME"] +  folder + '/';
            this.Page.Title = Request.QueryString["PageTitle"];
            string literal = @"<span style='font-size: 24px; font-weight: bold; font-family: Verdana; color: #ff0000; margin-top: -3px;'>
            " + Request.QueryString["bCall"] + @"<span style='font-size: 16px; color: #ff0000;'>
            " + Request.QueryString["Contest"] + @"</span></span>
            <object   id='Object1'  align='left'
            name='ObjQSO' width='1004px' height='768px' data='" + BaseURL + Request.QueryString["filename"] + @"'
            type='video/x-ms-wmv' style='vertical-align: middle; background-color: #000000;' >
           <param name='SRC' value='" + BaseURL + Request.QueryString["filename"] + @"' />
            <param name='enablejavascript' value='true' />
            <param name='autostart' value='true' />
            <param name='CONTROLLER' value='true' />
            <param name='BGCOLOR' value='#c0ffff' />
            <param name='STRETCHTOFIT' value='true' />
            <param name='STARTTIME' value='00:00:00:00' />
        </object> ";

            LiteralControl myHtmlSnippet = new LiteralControl(literal);
            form1.Controls.Add(myHtmlSnippet);



        }
    }
}