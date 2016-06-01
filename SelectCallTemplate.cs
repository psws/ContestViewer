using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Web.UI;

namespace ContestViewer
{

    public class SelectCallTemplate : System.Web.UI.ITemplate
    {
        System.Web.UI.WebControls.ListItemType templateType;
        string popupext;
        TextBox textbox;

        public SelectCallTemplate(System.Web.UI.WebControls.ListItemType type, string popupext, TextBox textbox)
        {
            templateType = type;
            this.popupext = popupext;
            this.textbox = textbox;
        }


        public void InstantiateIn(System.Web.UI.Control container)
        {
            PlaceHolder ph = new PlaceHolder();

            switch (templateType)
            {
                case ListItemType.Header:
                    ImageButton image1 = new ImageButton();
                    image1.ID = "Close1";
                    image1.OnClientClick = "clientCancelTab('" + popupext + "'); return false;";
                    image1.ImageUrl = "~/images/close-button.gif";

                    ph.Controls.Add(new LiteralControl("<span style=\"margin-left: 200px;\">" +
                        "Please Select a Call" + "<span style=\"margin-left: 170px\">" ) );
                    ph.Controls.Add(image1);
                    ph.Controls.Add(new LiteralControl("</span> </span>"));
                    break;
                case ListItemType.Item:
                    LinkButton item1 = new LinkButton();
                    item1.ID = "LinkButton1";
                    item1.Width = Unit.Pixel(100);
                    if (textbox != null)
                    {
                        item1.OnClientClick = "clClickCall(this,'" + popupext + "','" + textbox.ClientID +"');return false;";
                    }else{
                        item1.OnClientClick = "clClickCall(this);return false;";
                    }
                    item1.Font.Underline = false;
                    ph.Controls.Add(item1);
                    ph.DataBinding += new EventHandler(Item_DataBinding);
                    break;
                case ListItemType.AlternatingItem:
                    ph.DataBinding += new EventHandler(Item_DataBinding);
                    break;
                case ListItemType.Footer:
                    ph.Controls.Add(new LiteralControl("</table>"));
                    break;
            }
            container.Controls.Add(ph);
        }

        static void Item_DataBinding(object sender, System.EventArgs e)
        {
            PlaceHolder ph = (PlaceHolder)sender;
            DataListItem dl = (DataListItem)ph.NamingContainer;
            //Int32 item1Value = (Int32)DataBinder.Eval(dl.DataItem, "Call");
            String item1Value = (String)DataBinder.Eval(dl.DataItem, "Call");
            //((Label)ph.FindControl("item1")).Text = item1Value.ToString();
            ((LinkButton)ph.FindControl("LinkButton1")).Text = item1Value;
        }

    }

}