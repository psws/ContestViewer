using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using CountryLookupLib;
using System.Configuration;
using System.Net.Mail;
using System.Net;

namespace ContestViewer
{
    public partial class feedback : System.Web.UI.Page
    {
        protected static String InitMessage = "enter your feedback message here";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                HtmlGenericControl ctl = ((SiteMaster)Master).ContentPlaceHolderPageDivTag;
                //ctl.InnerText = "Hello";
                ctl.Style.Add("text-align", "center");

            }
            else
            {
                //Response.Redirect("FeedbackTnx.aspx");  //this stops the On Command from being called
                //Response.Write("<script language='JavaScript' type='text/javascript'>"
                //+ "function back() {history.go(-2);}back();history.go(-2);</script>");
                //history.go(-1);

            }
        }

        protected void FormView1_PreRender(object sender, EventArgs e)
        {
            Type t = this.GetType();
            FormView fv = FindControl("FormView1") as FormView;
            TextBox TBMessage = (TextBox)FormView1.FindControl("TextBoxMessage");
            TextBox TBCall = (TextBox)FormView1.FindControl("TextBoxCall");
            SetFocus(TBCall);
            // Build the JavaScript String
            System.Text.StringBuilder sb = new System.Text.StringBuilder();
            sb.Append("<script type='text/javascript'>");
            sb.Append("var TBMessage;");
            sb.Append("function fnActivate(){");
            sb.Append("TBMessage = document.getElementById('" + TBMessage.ClientID + "');");
            sb.Append("if (TBMessage.value = '" + InitMessage + "'){");
            sb.Append("TBMessage.value = '';}");
            sb.Append("TBMessage.style.fontStyle = 'normal';");
            sb.Append("TBMessage.className = '';");

            //sb.Append("TBMessage.setAttribute('style' ,'fontStyle:normal');");
            //sb.Append("');");
            //sb.Append("')
            sb.Append("}");
            sb.Append("</script>");
            // Register the script code with the page.

            if (!ClientScript.IsClientScriptBlockRegistered(t, "TBMessagefunc"))
                ClientScript.RegisterClientScriptBlock(t, "TBMessagefunc", sb.ToString());

            if (!IsPostBack)
            {
                TBMessage.Attributes.Add("onfocus", "javascript:fnActivate();");
                //TBMessage.Attributes["onfocus"] = "javascript:fnActivate();"; 
                TBMessage.Text = InitMessage;
                TBMessage.Style.Add("font-style", "italic");
                TBMessage.CssClass = "feedbackformLabels";
            }
            else
            {
                TBMessage.Style.Remove("font-style");
                TBMessage.CssClass = "";
            }
        }
        protected void FormView1_SendFeedback(object sender, System.Web.UI.WebControls.CommandEventArgs e)
        {
            if (e.CommandName == "SendFeedback")
            {
                //String CustomerNumber = e.CommandArgument.ToString();
                DateTime Dt = DateTime.Now.ToUniversalTime();
                FeedbackDataSource.InsertParameters["Date"].DefaultValue = Dt.ToShortDateString();
                DateTime Dt2;
                Dt2 = DateTime.Parse("12/30/1899" + Dt.ToString(" HH:mm:ss"));
                //Dt2 = DateTime.Parse("02/12/2009" + Dt.ToString(" HH:mm:ss"));
                //string str = Dt.ToString("HH:mm:ss UTC");
                //FeedbackDataSource.InsertParameters["Time"].DefaultValue = Dt.ToShortTimeString();
                FeedbackDataSource.InsertParameters["Time"].DefaultValue = Dt2.ToString();
                //String str = GetHostByAddress(Request.ServerVariables["REMOTE_ADDR"]);
                //FeedbackDataSource.InsertParameters["Call"].DefaultValue = "Guest";

                FeedbackDataSource.InsertParameters["RemoteHost"].DefaultValue =
                                Request.ServerVariables["REMOTE_HOST"];
                FeedbackDataSource.InsertParameters["RemoteAddr"].DefaultValue =
                              Request.ServerVariables["REMOTE_ADDR"];
                //TextBox TBCall = (TextBox)FormView1.FindControl("TextBoxCall");
                //FeedbackDataSource.InsertParameters["Call"].DefaultValue = TBCall.Text;
                //TextBox TBOp = (TextBox)FormView1.FindControl("TextBoxOp");
                //FeedbackDataSource.InsertParameters["Op"].DefaultValue = TBOp.Text;
                //TextBox TBEmail = (TextBox)FormView1.FindControl("TextBoxEmail");
                //FeedbackDataSource.InsertParameters["Email"].DefaultValue = TBEmail.Text;
                //TextBox TBMessage = (TextBox)FormView1.FindControl("TextBoxMessage");
                //FeedbackDataSource.InsertParameters["Feedback"].DefaultValue = TBMessage.Text;
                TextBox TBMessage = (TextBox)FormView1.FindControl("TextBoxMessage");
                TextBox TBCall = (TextBox)FormView1.FindControl("TextBoxCall");
                TextBox TBEMail = (TextBox)FormView1.FindControl("TextBoxEmail");

                TBMessage.Text = TBMessage.Text.Replace(Environment.NewLine, "<br />"); ;
                FeedbackDataSource.InsertParameters["Feedback"].DefaultValue = TBMessage.Text;

                //FileStream fileInput;
                String StrConn =
                        ConfigurationManager.AppSettings["DATGeoLiteCountry"];
                //fileInput = new FileStream(MapPath(StrConn), FileMode.Open, FileAccess.Read, FileShare.Read);
                String CtyName;

                using (CountryLookup cl = new CountryLookup(MapPath(StrConn)))
                {
                    try
                    {
                        CtyName = cl.lookupCountryName(Request.ServerVariables["REMOTE_ADDR"]);
                        FeedbackDataSource.InsertParameters["Country"].DefaultValue = CtyName;

                    }
                    catch
                    {
                        CtyName = "--";
                    }
                }

                //fileInput.Close();

                //Do not call the SQL datasrc insert if your controls are in
                //a asp object like FormView
                //In this case you need to call the FormView insert to bind the inserted data 
                //in the control
                //FeedbackDataSource.Insert();
                FormView1.InsertItem(true);


                MailAddress from = new MailAddress(ConfigurationManager.AppSettings["fromEmailAddress"]);
                MailAddress to = new MailAddress(ConfigurationManager.AppSettings["toEmailAddress"]);
                MailMessage MailMsg = new MailMessage(from, to);
                MailMsg.Subject = "Feedback:" + TBCall.Text.Trim() + " from " + TBEMail.Text.Trim();
                MailMsg.Body = TBMessage.Text.Trim();
                MailMsg.IsBodyHtml = true;
                SmtpClient mailClient = new SmtpClient();
                NetworkCredential basicAuthenticationInfo = new NetworkCredential(
                    ConfigurationManager.AppSettings["AuthEmailAddress"],
                    ConfigurationManager.AppSettings["AuthEmailPwd"]);
                mailClient.Host = "mail.logqso.com";
                mailClient.UseDefaultCredentials = false;
                mailClient.Credentials = basicAuthenticationInfo;
                mailClient.Send(MailMsg);

                Response.Redirect("FeedbackTnx.aspx");
            }
        }
    }
}