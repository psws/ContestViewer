using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Account_Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        RegisterHyperLink.NavigateUrl = "Register.aspx?ReturnUrl=" + HttpUtility.UrlEncode(Request.QueryString["ReturnUrl"]);
        HyperLink CreateUserLink = (HyperLink)LoginUser.FindControl("CreateUserLink"); 
        CreateUserLink.NavigateUrl = "Register.aspx?ReturnUrl=" + HttpUtility.UrlEncode(Request.QueryString["ReturnUrl"]);

        //HyperLink PasswordChange = (HyperLink)LoginUser.FindControl("PasswordChange");
        //PasswordChange.NavigateUrl = "ChangePassword.aspx";



        TextBox UserName = (TextBox)LoginUser.FindControl("UserName");
        SetFocus(UserName);
    }
}
