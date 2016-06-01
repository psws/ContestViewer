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
        string sSessionObj;

        public SelectCallTemplate(System.Web.UI.WebControls.ListItemType type, string popupext, TextBox textbox, string sSessionObj)
        {
            templateType = type;
            this.popupext = popupext;
            this.textbox = textbox;
            this.sSessionObj = sSessionObj;
        }


        public void InstantiateIn(System.Web.UI.Control container)
        {
            PlaceHolder ph = new PlaceHolder();

            switch (templateType)
            {
                case ListItemType.Header:
                    ImageButton image1 = new ImageButton();
                    //image1.ID = "Close1";
                    image1.OnClientClick = "cT('" + popupext + "'); return false;";
                    image1.ImageUrl = "~/images/cX.gif";

                    ph.Controls.Add(new LiteralControl("<span style=\"margin-left: 100px;\">" +
                        "Please Select a Callsign for " + sSessionObj + "<span style=\"margin-left: 100px\">" ) );
                    ph.Controls.Add(image1);
                    ph.Controls.Add(new LiteralControl("</span> </span>"));
                    break;
                case ListItemType.Item:
                    LinkButton item1 = new LinkButton();
                    item1.ID = "L";
                    //item1.ClientIDMode = ClientIDMode.Static;
                    item1.Width = Unit.Pixel(100);
                    //item1.Height = Unit.Point(8);
                    if (textbox != null)
                    {
                        item1.OnClientClick = "cQ(this,'" + popupext + "','" + textbox.ClientID + "');return false;";
                    }else{
                        item1.OnClientClick = "cQ(this);return false;";
                    }
                    item1.CssClass = "nfld";
                    item1.Font.Underline = false;
                    //item1.Attributes["onmouseover "] = "this.style.backgroundColor='yellow';";
                    //item1.Attributes["onmouseout "] = "this.style.backgroundColor='white';";
                    //item1.Attributes["onmouseup "] = "this.style.backgroundColor='orange';";
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
            ((LinkButton)ph.FindControl("L")).Text = item1Value;
        }

    }

}