using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ContestViewer
{
    public partial class FeedbackTnx : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                Response.Write("<script language='JavaScript' type='text/javascript'>"
                + "function back() {history.go(-3);}back()</script>");

            }
            else
            {
                //NextTest.Text = Contest.NxtTestTitle;
            }
        }
    }
}