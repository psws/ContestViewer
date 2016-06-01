using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Web.UI;
using AjaxControlToolkit;
using System.Drawing;
using SrvVars;

namespace ContestViewer
{
    public delegate void aFuncDelegate(object sender, EventArgs args);

     public class TabControUtils
    {
        

         public static void AddTabContainer(AjaxControlToolkit.TabContainer TabC, string SuffixID, Panel Panel, aFuncDelegate srvfunc, TextBox textbx,
            int PuceOffsetX, int PuceOffsetY, string sSessionObj, SrvVars.ServerVars.UAgent BrowserType)
        {
             //Always need to regenerte even on postback
            TabC.Height = Unit.Pixel(390);
            TabC.Width = Unit.Pixel(665);
            TabC.ScrollBars = ScrollBars.Auto;
            TabC.OnClientActiveTabChanged = "cTC";
            TabC.ID = "TabC" + SuffixID;
            //TabContainerCall1.ClientIDMode = System.Web.UI.ClientIDMode.Inherit;
            
            AjaxControlToolkit.PopupControlExtender PuCtlExtnd = new AjaxControlToolkit.PopupControlExtender();
            PuCtlExtnd.ClientIDMode = System.Web.UI.ClientIDMode.Static;
            PuCtlExtnd.ID = "pE" + SuffixID;
            PuCtlExtnd.PopupControlID = Panel.ID;
            PuCtlExtnd.TargetControlID = "TBCall" + SuffixID;
            PuCtlExtnd.OffsetX = PuceOffsetX;
            PuCtlExtnd.OffsetY = PuceOffsetY;
            PuCtlExtnd.BehaviorID = "pB" + SuffixID;

            AddTab(TabC, "0", "1-9", SuffixID, PuCtlExtnd.BehaviorID, srvfunc, textbx, sSessionObj, BrowserType);
            for (int i = 0x41; i <= 0x5A; i++)
            {
                if (i == 0x51)
                {
                    continue;  
                }
                string str = string.Format("{0}",Convert.ToChar(i));
                AddTab(TabC, str, str, SuffixID, PuCtlExtnd.BehaviorID, srvfunc, textbx, sSessionObj, BrowserType);
            }

            Panel.Controls.Add(TabC);
            Panel.Controls.Add(PuCtlExtnd);
        }


        public static void AddTab(AjaxControlToolkit.TabContainer TabC, string TabHdrID, string TabHdrName, string Suffixid, string popupFunc, aFuncDelegate srvfunc, TextBox textbox, string sSessionObj, SrvVars.ServerVars.UAgent BrowserType)
        {
            //TabContainerCall1.ClientIDMode = System.Web.UI.ClientIDMode.Inherit;
            string trigName = "tg" + TabHdrID;

            AjaxControlToolkit.TabPanel tabP = new AjaxControlToolkit.TabPanel();
            tabP.ID = "Tab" + TabHdrID;
            tabP.HeaderText = TabHdrName;
            tabP.ScrollBars = ScrollBars.Auto;
            tabP.ForeColor = Color.Blue;



            HtmlInputButton btnH = new HtmlInputButton();
            btnH.ID = trigName;
            btnH.Style.Add("display", "none");
            //btnH.Attributes.Add("OnServerClick", "Tab_ClickCall1()");
            btnH.ServerClick += new System.EventHandler(srvfunc);

            UpdatePanel upP = new UpdatePanel();
            upP.UpdateMode = UpdatePanelUpdateMode.Conditional;
            upP.ID = "upd" + TabHdrID;
            upP.ChildrenAsTriggers = true;
            //upP.Unload += new EventHandler(UpdatePanel_Unload);

            //UpdatePanelTriggerCollection tColl = new UpdatePanelTriggerCollection(upP);
            AsyncPostBackTrigger trig = new AsyncPostBackTrigger();
            trig.ControlID = trigName;
            //trig.EventName = "ServerClick";
            upP.Triggers.Add(trig);

            DataList DataList = new DataList();
            DataList.ID = "DL" + TabHdrID;
            DataList.RepeatDirection = System.Web.UI.WebControls.RepeatDirection.Vertical;
            DataList.RepeatLayout = RepeatLayout.Flow;
            DataList.RepeatColumns = 6;

            DataList.HeaderStyle.ForeColor = Color.Teal;
            int size;
            switch (BrowserType)
            {
                case ServerVars.UAgent.UA_Oper:
                    size = 14;
                    break;
                case ServerVars.UAgent.UA_FFox:
                    size = 12;
                    break;
                case ServerVars.UAgent.UA_Msie:
                    size = 12;
                    break;
                default:
                    size = 12;
                    break;
            }
            DataList.HeaderStyle.Font.Size = new FontUnit(size, UnitType.Point);
            DataList.HeaderStyle.Font.Bold = true;
            DataList.HeaderTemplate = new SelectCallTemplate(ListItemType.Header, popupFunc, null, sSessionObj);

            //DataList.ItemStyle.HorizontalAlign = HorizontalAlign.Left;
            Double sizeI;
            switch (BrowserType)
            {
                case SrvVars.ServerVars.UAgent.UA_Oper:
                    sizeI = 1.0;
                    break;
                case SrvVars.ServerVars.UAgent.UA_FFox:
                    sizeI = .88;
                    //DataList.ItemStyle.Height = new Unit(1, UnitType.Point);
                   break;
                case SrvVars.ServerVars.UAgent.UA_Msie:
                    sizeI = .8;
                    break;
                default:
                    sizeI = .8;
                   break;
            }
            FontUnit fontu = new FontUnit(sizeI, UnitType.Em);
            DataList.ItemStyle.Font.Size = fontu;
            DataList.ItemStyle.Font.Bold = true;
            DataList.ItemTemplate = new SelectCallTemplate(ListItemType.Item, popupFunc, textbox, sSessionObj);
            

            DataList.SeparatorStyle.Width = Unit.Pixel(6);

            //DataList.SelectedItemStyle.HorizontalAlign = HorizontalAlign.Left;
            //DataList.SelectedItemStyle.VerticalAlign = VerticalAlign.Top;

            upP.ContentTemplateContainer.Controls.Add(DataList);
            tabP.Controls.Add(btnH);
            tabP.Controls.Add(upP);
            TabC.Controls.Add(tabP);
        }

    }

}