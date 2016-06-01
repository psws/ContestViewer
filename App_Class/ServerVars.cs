using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.ComponentModel;


namespace SrvVars
{

    public static class ServerVars
    {
        public enum UAgent
        {
            UA_Msie =0,
            UA_FFox = 1,
            UA_Oper = 2,
            UA_Saf = 3,
            UA_Chr = 4,
  
        }


        public static void SetUserInfo(HttpRequest Request, out UAgent BrowserType)
        {
            if (Request.ServerVariables["HTTP_USER_AGENT"].Contains("MSIE") )
            {
                BrowserType = UAgent.UA_Msie;
            }
            else if (Request.ServerVariables["HTTP_USER_AGENT"].Contains("Firefox") )
            {
                BrowserType = UAgent.UA_FFox;
            }
            else if (Request.ServerVariables["HTTP_USER_AGENT"].Contains("Opera") )
            {
                BrowserType = UAgent.UA_Oper;
            }
            else if (Request.ServerVariables["HTTP_USER_AGENT"].Contains("Safari") )
            {
                BrowserType = UAgent.UA_Saf;
            }
            else if (Request.ServerVariables["HTTP_USER_AGENT"].Contains("Chrome"))
            {
                BrowserType = UAgent.UA_Chr;
            }
            else
            {
                BrowserType = UAgent.UA_Msie;
            }
        }

    }


}