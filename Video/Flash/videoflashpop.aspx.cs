using System;
using System.Collections.Generic;
using System.IO;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ContestViewer
{
    public partial class videoflashpop : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
#if true
            Path.GetDirectoryName(Request.ServerVariables["URL"]);
            string folder = Path.GetDirectoryName(Request.ServerVariables["URL"]).Replace('\\', '/');
            string BaseURL = @"http://" + Request.ServerVariables["SERVER_NAME"] + folder  +'/';
            this.Page.Title = Request.QueryString["PageTitle"];
            string literal = @"<span style='font-size: 24px; font-weight: bold; font-family: Verdana; color: #ff0000; margin-top: -10px;'>
            " + Request.QueryString["bCall"] + @"<span style='font-size: 16px'>
            " + Request.QueryString["Contest"] + @"</span></span>
            <object   type='application/x-shockwave-flash' width='1045' height='778' id='myFVid' name='myFVid' 
             data='" + BaseURL + Request.QueryString["filename"] + @"'
            codebase='http://www.macromedia.com/go/getflashplayer'
            style='vertical-align: middle; background-color: #c0ffff;' >
           <param name='movie' value='" + BaseURL + Request.QueryString["filename"] + @"' />
            <param name='allowscriptaccess' value='always' />
            <param name='wmode' value='transparent' />
            <param name='allowFullScreen' value='true' />
            <param name='play' value='true' />
        </object> ";
#else
            Path.GetDirectoryName(Request.ServerVariables["URL"]);
            string folder = Path.GetDirectoryName(Request.ServerVariables["URL"]).Replace('\\', '/');
            string BaseURL = @"http://" + Request.ServerVariables["SERVER_NAME"] + folder + '/';
            this.Page.Title = Request.QueryString["PageTitle"];
            string literal = @"<p style='font-size: 24px; font-family: Verdana; color: #ff0000; margin-top: -10px;'>
            " + Request.QueryString["bCall"] + @"<span style='font-size: 14px'>
            " + Request.QueryString["Contest"] + @"</span></p>
            <object   type='application/x-shockwave-flash' width='1028' height='850' id='myFVid' name='myFVid' 
             data='login.swf" + @"'
            codebase='http://www.macromedia.com/go/getflashplayer'
            style='vertical-align: middle; background-color: #c0ffff;' >
           <param name='movie' value='login.swf" + @"' />
            <param name='allowscriptaccess' value='always' />
            <param name='wmode' value='transparent' />
            <param name='allowFullScreen' value='true' />
            <param name='play' value='true' />
        </object> ";
#endif


            LiteralControl myHtmlSnippet = new LiteralControl(literal);
            form1.Controls.Add(myHtmlSnippet);

        }
    }
}