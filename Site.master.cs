using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Configuration;


public partial class SiteMaster : System.Web.UI.MasterPage
{
    public HtmlGenericControl ContentPlaceHolderPageDivTag
    {
        get
        {
            return ContentPlaceHolderPageDiv;
        }
        set
        {
            ContentPlaceHolderPageDiv = value;
        }

    }
    public ImageButton ImageButtonDTag
    {
        get
        {
            return ImageButtonD;
        }
    }

    public LoginName LoginNameTag
    {
        get
        {
            LoginName LoginName = (LoginName)HeadLoginView.FindControl("HeadLoginName");
            return LoginName;

        }

    }

    
    protected void Page_Load(object sender, EventArgs e)
    {
        Type t = this.GetType();
        //if (!Page.ClientScript.IsClientScriptIncludeRegistered(t, "videopop"))
        //{
        //    string mappath = ResolveClientUrl("~/Jscripts/videopop.js");
        //    Page.ClientScript.RegisterClientScriptInclude("videopop", mappath);
        //}
    }

    //void Page_PreInit(object sender, EventArgs e)
    //{
    //    string ver = ConfigurationManager.AppSettings["AppVersion"].ToString();
    //    cssSite.Href += string.Format("?v={0}", ver);
    //    cssChart.Href += string.Format("?v={0}", ver);
    //}

}
