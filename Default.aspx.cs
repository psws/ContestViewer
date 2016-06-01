using System;
using System.Collections.Generic;
using System.Linq;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Data.OleDb;
using System.Drawing;
using System.Web;
//using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Configuration;
using System.Web.UI.DataVisualization.Charting;
using System.Collections.Specialized;
using System.Collections.ObjectModel;
using CountryLookupLib;
using System.IO;

using SrvVars;

namespace ContestViewer
{


    public partial class ContestCharts : System.Web.UI.Page
    {
        /// <summary>
        /// This is our disconnected datatable
        /// we need to store it in a persistance medium 
        /// so we can have access to it between requests
        /// It will be stored in viewstate for this demonstration
        /// </summary>

        private ContestLogInfo CtestLoginfo1;
        private ContestLogInfo CtestLoginfo2;
        private ContestLogInfo CtestLoginfo3;

        private bool MixedYears;

        public AjaxControlToolkit.TabContainer TabC1;
        public AjaxControlToolkit.TabContainer TabC2;
        public AjaxControlToolkit.TabContainer TabC3;

        public DataView dv;
        public  SrvVars.ServerVars.UAgent BrowserType;

        protected void Page_Load(object sender, EventArgs e)
        {
            //DDLTC1.Attributes["onfocus"] = "this.style.backgroundColor='yellow';";
            this.MaintainScrollPositionOnPostBack = true;
            
            //DateTime date = DateTime.Parse(ConfigurationManager.AppSettings["AppVersionDate"].ToString());
            //ScriptReference scrref = new ScriptReference("Scripts/Tabctl.js" +
            //        string.Format("?v={0}", date.ToBinary())   );
            //string ver = ConfigurationManager.AppSettings["AppVersion"].ToString();
            //ScriptReference scrref = new ScriptReference("Scripts/Tabctl.js" +
            //        string.Format("?v={0}", ver));
            //ScriptManagerProxy1.Scripts.Add(scrref);

            //switch (BrowserType)
            //{
            //    case ServerVars.UAgent.UA_Msie:
            //        RefreshCat.Text = " Refresh\nGraph";
            //        Refresh.Text = " Refresh\nGraph";
            //        break;
            //    case ServerVars.UAgent.UA_FFox:
            //        RefreshCat.Text = "Refresh\nGraph";
            //        Refresh.Text = "Refresh\nGraph";
            //        break;
            //    default:
            //        break;
            //}
            ImageButton ctl = ((SiteMaster)Master).ImageButtonDTag;
            ctl.Visible = false;

            if (!IsPostBack)
            {

                //Response.Cache.SetExpires(DateTime.Now.AddSeconds(60));
                //Response.Cache.SetCacheability(HttpCacheability.Public);
                //Response.Cache.SetValidUntilExpires(true); 
                string user = System.Web.HttpContext.Current.User.Identity.Name;
                //if user exists load up Sessio object

                bool bLoadSession = true;
                if (Session["ResCallChange"] != null)
                { // used if results page caused mixed mode
                    if (Session["ResCallChange"].ToString() == "1")
                    {
                        //if (! (
                        //    Session["Call1"] != null && Session["Call2"] != null && Session["Call3"] != null
                        //    && ((ContestLogInfo)Session["Call1"]).CatOprID  == 
                        //    ((ContestLogInfo)Session["Call2"]).CatOprID && 
                        //    ((ContestLogInfo)Session["Call1"]).CatOprID == 
                        //    ((ContestLogInfo)Session["Call3"]).CatOprID )  )
                        //{
                        DDLOpr.SelectedIndex = 0;
                        //}
                        //Session["ResCallChange"] = "0";
                        bLoadSession = false;
                    }
                }
#if true
                if (bLoadSession == true && !string.IsNullOrEmpty(user))
	            {
                    //Session SessionUser = context.Sessions.Where(d => d.UserIdentity == user).FirstOrDefault<Session>();
                    //load previous saved Session state
                    DeSerializefromXmlLoadSession(SessionFields.All);
	            }
#endif
                if (!string.IsNullOrEmpty(User.Identity.Name))
                {
                    System.Web.Security.MembershipUser CurrentUser = System.Web.Security.Membership.GetUser(User.Identity.Name);
                }   
                string sConn = ConfigurationManager.AppSettings["DBContestsSelect"].ToString();

                
                string ConnectionString = ConfigurationManager.ConnectionStrings[sConn].ConnectionString;
                LoadDDLContest(ConnectionString, DDLTC1, DDLTC2, DDLTC3);
                CategoryCB.Attributes["onclick"] = "CatCBChanged(this);";
                LoadDdl(ConnectionString, DDLOpr, "CatOpr", "CatOprID", "CategoryOpr", 1, "CatChanged");
                LoadDdl(ConnectionString, DDLPwr, "CatPower", "CatPowerID", "CatPower", 2, "CatChanged");
                LoadDdl(ConnectionString, DDLBnd, "CatBand", "CatBandID", "CategoryBand", 3, "CatChanged");
                LoadDdl(ConnectionString, DDLAssist, "CatAssist", "CatAssistID", "CategoryAssist", 4, "CatChanged");
                LoadDdl(ConnectionString, DDLTx, "CatTx", "CatTxID", "CategoryTx", 5, "CatChanged");
                //the javascript function CatDef() us cakked first followed by server CatDef_Click()
                //The UpdatePanelQSORate catches the CatDef click so no postback occurs
                //The javascript sets btnSelectedTabContainer == 0 and starts the spinner
                //No need to return false
                CatDef.Attributes["onclick"] = "CatDef(this);";
                //Defaults
                DDLOpr.SelectedIndex = 0; //ALL
                DDLPwr.SelectedIndex = 0; //ALL
                DDLPwr.Enabled = false;//needs to be single-op
                DDLBnd.SelectedIndex = 0; //ALL
                DDLBnd.Enabled = false; //needs to be single-op
                DDLAssist.SelectedIndex = 0; //ALL
                DDLAssist.Enabled = false; //needs to be single-op
                DDLTx.SelectedIndex = 0; //ALL
                DDLTx.Enabled = false; //needs to be multi-op
             
                TBCall1.Text = "CN2R";
                TBCall2.Text = "CN2AA";
                TBCall3.Text = "CN3A";

                DDLTC1.SelectedValue = DDLTC2.SelectedValue = DDLTC3.SelectedValue = "CQWWSSB2015";
                CBCall1.Attributes["onclick"] = "CallCBChanged(this,'1');";
                TBCall1.Attributes["onclick"] = "CallSelected(this,'1');return false;";
                TBCall1.Attributes["onKeyUp"] = "CallUppercase(this);return false;";
                TBCall1.Attributes["onKeyDown"] = "CallTextChanged(this,event, 'pB1');return(event.keyCode!=13);";
                TBCall1.Attributes["onPaste"] = "CallTextChanged(this,event, 'pB1');return true;";
                //in js obj.blur();//move cursor, gets the cursor off of call textbox
                //which causes tab dialog to appear agn after hidePopup()

                //this line reqd for webkit browsers, firefox ...
                TBCall1.Attributes["onMouseUp"] = "CallMouseup();return false;";
                
                CBCall2.Attributes["onclick"] = "CallCBChanged(this,'2');";
                TBCall2.Attributes["onclick"] = "CallSelected(this,'2');return false;";
                TBCall2.Attributes["onKeyUp"] = "CallUppercase(this);return false;";
                TBCall2.Attributes["onKeyDown"] = "CallTextChanged(this,event, 'pB2');return(event.keyCode!=13);";
                TBCall2.Attributes["onPaste"] = "CallTextChanged(this,event, 'pB2');return true;";
                //this line reqd for webkit browsers, firefox ...
                TBCall2.Attributes["onMouseUp"] = "CallMouseup();return false;";
                
                
                CBCall3.Attributes["onclick"] = "CallCBChanged(this,'3');";
                TBCall3.Attributes["onclick"] = "CallSelected(this,'3');return false;";
                TBCall3.Attributes["onKeyUp"] = "CallUppercase(this);return false;";
                TBCall3.Attributes["onKeyDown"] = "CallTextChanged(this,event, 'pB3');return(event.keyCode!=13);";
                TBCall3.Attributes["onPaste"] = "CallTextChanged(this,event, 'pB3');return true;";
                //in js obj.blur();//move cursor, gets the cursor off of call textbox
                //which causes tab dialog to appear agn after hidePopup()

                //this line reqd for webkit browsers, firefox ...
                TBCall3.Attributes["onMouseUp"] = "CallMouseup();return false;";


                //Needs to be done postback only .
                if (Session["Call1"] != null)
                {
                    //if (File.
                    TBCall1.Text = ((ContestLogInfo)Session["Call1"]).Call;
                    DDLTC1.SelectedValue = ((ContestLogInfo)Session["Call1"]).ContestInfo.ContestID;
                    DDLOpr.SelectedIndex = ((ContestLogInfo)Session["Call1"]).CatOprID;
                    DDLPwr.SelectedIndex = ((ContestLogInfo)Session["Call1"]).CatPwrID;
                    DDLBnd.SelectedIndex = ((ContestLogInfo)Session["Call1"]).CatBndID;
                    DDLAssist.SelectedIndex = ((ContestLogInfo)Session["Call1"]).CatAstID;
                    DDLTx.SelectedIndex = ((ContestLogInfo)Session["Call1"]).CatTxID;
                    CategoryCB.Checked = ((ContestLogInfo)Session["Call1"]).CategoryCBID;
                    CBCall1.Checked = ((ContestLogInfo)Session["Call1"]).CBCall;
                }
                if (Session["Call2"] != null)
                {
                    TBCall2.Text = ((ContestLogInfo)Session["Call2"]).Call;
                    DDLTC2.SelectedValue = ((ContestLogInfo)Session["Call2"]).ContestInfo.ContestID;
                    DDLOpr.SelectedIndex = ((ContestLogInfo)Session["Call2"]).CatOprID;
                    DDLPwr.SelectedIndex = ((ContestLogInfo)Session["Call2"]).CatPwrID;
                    DDLBnd.SelectedIndex = ((ContestLogInfo)Session["Call2"]).CatBndID;
                    DDLAssist.SelectedIndex = ((ContestLogInfo)Session["Call2"]).CatAstID;
                    DDLTx.SelectedIndex = ((ContestLogInfo)Session["Call2"]).CatTxID;
                    CategoryCB.Checked = ((ContestLogInfo)Session["Call2"]).CategoryCBID;
                    CBCall2.Checked = ((ContestLogInfo)Session["Call2"]).CBCall;
                }
                if (Session["Call3"] != null)
                {
                    TBCall3.Text = ((ContestLogInfo)Session["Call3"]).Call;
                    DDLTC3.SelectedValue = ((ContestLogInfo)Session["Call3"]).ContestInfo.ContestID;
                    DDLOpr.SelectedIndex = ((ContestLogInfo)Session["Call3"]).CatOprID;
                    DDLPwr.SelectedIndex = ((ContestLogInfo)Session["Call3"]).CatPwrID;
                    DDLBnd.SelectedIndex = ((ContestLogInfo)Session["Call3"]).CatBndID;
                    DDLAssist.SelectedIndex = ((ContestLogInfo)Session["Call3"]).CatAstID;
                    DDLTx.SelectedIndex = ((ContestLogInfo)Session["Call3"]).CatTxID;
                    CategoryCB.Checked = ((ContestLogInfo)Session["Call3"]).CategoryCBID;
                    CBCall3.Checked = ((ContestLogInfo)Session["Call3"]).CBCall;
                }
                DDLOpr.Enabled = true;
                if (CategoryCB.Checked == true)
                {
                    DDLOpr.Enabled = false;
                    DDLPwr.Enabled = false;
                    DDLBnd.Enabled = false;
                    DDLAssist.Enabled = false;
                    DDLTx.Enabled = false;
                }
                else
                {
                    if (DDLOpr.SelectedItem.Text == "SINGLE-OP")
                    {
                        DDLPwr.Enabled = true;
                        DDLBnd.Enabled = true;
                        DDLAssist.Enabled = true;
                        DDLTx.Enabled = false;
                    }
                    else if (DDLOpr.SelectedItem.Text == "MULTI-OP")
                    {
                        DDLPwr.Enabled = false;
                        DDLBnd.Enabled = false;
                        DDLAssist.Enabled = false;
                        DDLTx.Enabled = true;
                    }
                    else if (DDLOpr.SelectedItem.Text == "CHECKLOG")
                    {
                        DDLPwr.Enabled = false;
                        DDLBnd.Enabled = false;
                        DDLAssist.Enabled = false;
                        DDLTx.Enabled = false;
                    }
                    else
                    {
                        DDLPwr.Enabled = false;
                        DDLBnd.Enabled = false;
                        DDLAssist.Enabled = false;
                        DDLTx.Enabled = false;
                    }
                }

                if (Session["ResCallChange"] != null)
                { // used if results page caused mixed mode
                    if (Session["ResCallChange"].ToString() == "1")
                    {
                        //if (! (
                        //    Session["Call1"] != null && Session["Call2"] != null && Session["Call3"] != null
                        //    && ((ContestLogInfo)Session["Call1"]).CatOprID  == 
                        //    ((ContestLogInfo)Session["Call2"]).CatOprID && 
                        //    ((ContestLogInfo)Session["Call1"]).CatOprID == 
                        //    ((ContestLogInfo)Session["Call3"]).CatOprID )  )
                        //{
                            DDLOpr.SelectedIndex = 0;
                        //}
                        Session["ResCallChange"] = "0";
                    }
                }


                //Firefox is crap
                if (BrowserType == ServerVars.UAgent.UA_FFox)
                {
                    DDLTC1.Font.Size = FontUnit.Point(7);
                    DDLTC2.Font.Size = FontUnit.Point(7);
                    DDLTC3.Font.Size = FontUnit.Point(7);
                    TBCall1.Font.Size = FontUnit.Point(7);
                    TBCall2.Font.Size = FontUnit.Point(7);
                    TBCall3.Font.Size = FontUnit.Point(7);
                    ChartFuncDDL.Font.Size = FontUnit.Point(9);
                    IntervalDDL.Font.Size = FontUnit.Point(9);
                    ViewDDL.Font.Size = FontUnit.Point(8);
                    DDLVStart.Font.Size = FontUnit.Point(8);
                    DDLVHours.Font.Size = FontUnit.Point(8);
                    FontUnit fu = new FontUnit(6.8, UnitType.Point);
                    DDLOpr.Font.Size = fu;
                    DDLAssist.Font.Size = fu;
                    DDLBnd.Font.Size = fu;
                    DDLPwr.Font.Size = fu;
                    DDLTx.Font.Size = FontUnit.Point(7);
                }

               //Need to set CtestLogInfo to determin whch database to fill tabs from
                UpdateCallSessionObj(out CtestLoginfo1, DDLTC1, TBCall1.Text, "Call1", CBCall1);
                UpdateCallSessionObj(out CtestLoginfo2, DDLTC2, TBCall2.Text, "Call2", CBCall2);
                UpdateCallSessionObj(out CtestLoginfo3, DDLTC3, TBCall3.Text, "Call3", CBCall3);
                SetMixedYears();

                //QSO Filter
                QsoCB.Attributes["onclick"] = "QsoCBChanged(this);";
                LoadDdl(ConnectionString, DDLLBnd, "CatBand", "CatBandID", "CategoryBand", 1, "LogChanged");
                //DDLLBnd.Items.Remove(DDLLBnd.Items.FindByText("ANY"));
                LoadDdl(ConnectionString, DDLLCon, "Continent", "ID", "Continents", 2, "LogChanged");
                LoadDdl(ConnectionString, DDLLZone, "CQZone", "ID", "CQZones", 4, "LogChanged");
                // load countries
                LoadQSOCouDdl(DDLLCou, "Name", "Prefix", "QCountries", 3, "LogChanged");
                if (Session["QSOLogFilter"] != null)
                {
                    DDLLBnd.SelectedValue = ((QSOLogFilter)Session["QSOLogFilter"]).QBndID.ToString(); 
                    DDLLCon.Items[0].Text = "ALL"; //db has "AL'; 
                    DDLLCon.SelectedValue = ((QSOLogFilter)Session["QSOLogFilter"]).QConID.ToString();
                    DDLLCou.SelectedValue = ((QSOLogFilter)Session["QSOLogFilter"]).QCouID;
                    DDLLZone.SelectedValue = ((QSOLogFilter)Session["QSOLogFilter"]).QZoneID.ToString();  
                    QsoCB.Checked = ((QSOLogFilter)Session["QSOLogFilter"]).QsoCB;
                    //javascript handels disabling in real time
                    //we need to do it here for reload Sessiom
                    if (QsoCB.Checked == true)
                    {
                        DDLLBnd.Enabled = false;
                        DDLLCon.Enabled = false;
                        DDLLCou.Enabled = false;
                        DDLLZone.Enabled = false;
                    }
                    else
                    {
    //                    if (DDLLBnd.SelectedItem.Text == "ALL") {
    //                        DDLLCon.Enabled = true;
    //                        DDLLCou.Enabled = true;
    //                        DDLLZone.Enabled = true;
    //                    }
                        if (DDLLCon.SelectedItem.Text != "ALL") {
                            DDLLCon.Enabled = true;
                            DDLLCou.Enabled = false;
                            DDLLZone.Enabled = false;
                        } else {
                            DDLLCon.Enabled = true;
                            DDLLCou.Enabled = true;
                            DDLLZone.Enabled = true;
                        }

                        DDLLCon.Enabled = false;
                        DDLLCou.Enabled = false;
                        DDLLZone.Enabled = false; 
                        if (DDLLCou != null && DDLLCou.Items.Count != 0)
                        {
                            if (DDLLCou.SelectedItem.Text != "ALL Countries") {
                                DDLLCon.Enabled = false;
                                DDLLCou.Enabled = true;
                                DDLLZone.Enabled = false;
                            }
                            else
                            {
                                DDLLCon.Enabled = true;
                                DDLLCou.Enabled = true;
                                DDLLZone.Enabled = true;
                            }                           
                        }
                        if (DDLLZone.SelectedItem.Text != "ALL")
                        {
                            DDLLCon.Enabled = false;
                            DDLLCou.Enabled = false;
                            DDLLZone.Enabled = true;
                        } else {
                            DDLLCon.Enabled = true;
                            DDLLCou.Enabled = true;
                            DDLLZone.Enabled = true;
                        }
                    }
                }
                else
                {
                    DDLLBnd.SelectedIndex = 0;
                    DDLLCon.Items[0].Text = "ALL"; //db has "AL'
                    DDLLCon.SelectedIndex = 0;
                    DDLLCou.SelectedIndex = 0;
                    DDLLZone.SelectedIndex = 0;
                }

                QSODef.Attributes["onclick"] = "LogDef(this);";
                //use same js
                DefaultAll.Attributes["onclick"] = "LogDef(this);";

                //Chart Selection
                LoadDdl(ConnectionString, ChartFuncDDL, "CFunction", "CFunctionID", "ChartFunction", 1, "ChartChanged");
                LoadDdl(ConnectionString, IntervalDDL, "CYInterval", "CYIntervalID", "ChartYInterval", 2, "ChartChanged");
                LoadDdl(ConnectionString, ViewDDL, "CYView", "CYViewID", "ChartYView", 3, "ChartChanged");
                ContestViewFilterDef.Attributes["onclick"] = "ContestViewFilterDef(this);";
                //Time Selection
                LoadDdl(ConnectionString, DDLVStart, "StartTime", "StartTimeID", "TimeStart", 4, "ChartChanged");
                LoadDdl(ConnectionString, DDLVHours, "TimeDuration", "TimeDurationID", "TimeDuration", 5, "ChartChanged");
                TimeDef.Attributes["onclick"] = "TimeDef(this);";
                ////The CTY table ise used to get Country code and comput default Tab.
                //char prefix1stLetter = GetDefaultTabIndexChar(GeoSqlDataSource);
                //LoadTabControlDatalists(prefix1stLetter);
                if (Session["ContestViewFilter"] != null)
                {
                    ChartFuncDDL.SelectedValue = ((ContestViewFilter)Session["ContestViewFilter"]).ChartFuncDDLID.ToString();
                    ViewDDL.SelectedValue = ((ContestViewFilter)Session["ContestViewFilter"]).ViewDDLID.ToString();
                    IntervalDDL.SelectedValue = ((ContestViewFilter)Session["ContestViewFilter"]).IntervalDDLID.ToString();
                    DDLVStart.SelectedValue = ((ContestViewFilter)Session["ContestViewFilter"]).DDLVStartID.ToString();
                    DDLVHours.SelectedValue = ((ContestViewFilter)Session["ContestViewFilter"]).DDLVHoursID.ToString();
                }
                else
                {
                    ChartFuncDDL.SelectedIndex = 0;
                    ViewDDL.SelectedIndex = 0;
                    IntervalDDL.SelectedIndex = 0;
                    DDLVStart.SelectedIndex = 0;
                    DDLVHours.SelectedIndex = 0;
                }
                LoadQSORateChart();

            }
            else
            {
                //string p =ScriptManager.GetCurrent(Page).AsyncPostBackSourceElementID;
                //string str = this.Request["__EVENTARGUMENT"];
                //string str2 = this.Request["__EVENTTARGET"];
                //in case Category is changed
                UpdateCallSessionObj(out CtestLoginfo1, DDLTC1, TBCall1.Text, "Call1", CBCall1);
                UpdateCallSessionObj(out CtestLoginfo2, DDLTC2, TBCall2.Text, "Call2", CBCall2);
                UpdateCallSessionObj(out CtestLoginfo3, DDLTC3, TBCall3.Text, "Call3", CBCall3);
                SetMixedYears();
            }


            //riunded corners to not work in opera. they get scroll boxes
            if (BrowserType == ServerVars.UAgent.UA_Oper)
            {
                RCE2.Enabled = false;
                RCE3.Enabled = false;
                RCE4.Enabled = false;
            }

        }

        protected void Page_Init(object sender, EventArgs e)
        {
            //Always need to regenerte even on postback

            SrvVars.ServerVars.SetUserInfo(Page.Request, out BrowserType);
            // cookies
            //HttpCookie aCookie = new HttpCookie("Call1");
            //aCookie.Values["Call1"] = "W7ZR";
            //aCookie.Values["Contest"] = "CQWWSSN2009";
            //aCookie.Expires = DateTime.Now.AddDays(1);
            //Response.Cookies.Add(aCookie);



            Int32 offsety = 20;

            if (IsPostBack)
            {
                TabC1 = new AjaxControlToolkit.TabContainer();
                TabControUtils.AddTabContainer(TabC1, "1", TPC1, Tab_ClickCall1, TBCall1, -250, offsety, "Call1", BrowserType);
                TabC2 = new AjaxControlToolkit.TabContainer();
                TabControUtils.AddTabContainer(TabC2, "2", TPC2, Tab_ClickCall1, TBCall2, -380, offsety, "Call2", BrowserType);
                TabC3 = new AjaxControlToolkit.TabContainer();
                TabControUtils.AddTabContainer(TabC3, "3", TPC3, Tab_ClickCall1, TBCall3, -520, offsety, "Call3", BrowserType);
            }
        }

        //protected void Page_LoadComplete(object sender, EventArgs e)
        //{

        //}
        protected void UpdateCallSessionObj(out ContestLogInfo CtestLoginfo, DropDownList DdlTc, string TbCall, string sSessionObj, CheckBox Cb)
        { // sets global CtestLoginfo?
            ContestInfo Ctestinfo;
            CategoryLogInfo CategoryLogInfo;
            CtestLoginfo = (ContestLogInfo)Session[sSessionObj];

            if (CtestLoginfo == null)
            {
                Ctestinfo = GetContestInfoOLE(ConfigurationManager.AppSettings["DBContestsSelect"].ToString(), DdlTc.SelectedValue);
                CategoryLogInfo = GetCategoryLogInfo(string.Format(ConfigurationManager.ConnectionStrings["LogEntryInfoConnectionString"].ConnectionString,
                    Ctestinfo.DBName), TbCall, Ctestinfo.ContestID);
                CtestLoginfo = new ContestLogInfo(Ctestinfo, TbCall, CategoryLogInfo, (Byte)DDLOpr.SelectedIndex,
                    (Byte)DDLPwr.SelectedIndex, (Byte)DDLAssist.SelectedIndex, (Byte)DDLBnd.SelectedIndex, (Byte)DDLTx.SelectedIndex, CategoryCB.Checked, Cb.Checked);
                Session.Add(sSessionObj, CtestLoginfo);
            }
            else
            { //check if Catefory DDLs match current session state
                if (CtestLoginfo.Call != TbCall || CtestLoginfo.ContestInfo.ContestID != DdlTc.SelectedValue || 
                    CategoryCB.Checked != true && (
                    CtestLoginfo.CatOprID != (Byte)DDLOpr.SelectedIndex ||
                    CtestLoginfo.CatPwrID != (Byte)DDLPwr.SelectedIndex || 
                    CtestLoginfo.CatBndID != (Byte)DDLBnd.SelectedIndex ||
                    CtestLoginfo.CatAstID != (Byte)DDLAssist.SelectedIndex || 
                    CtestLoginfo.CatTxID != (Byte)DDLTx.SelectedIndex)    )
                {
                    string savCID = CtestLoginfo.ContestInfo.ContestID;
                    if (CtestLoginfo.ContestInfo.ContestID != DdlTc.SelectedValue)
                    {
                        Ctestinfo = GetContestInfoOLE(ConfigurationManager.AppSettings["DBContestsSelect"].ToString(), DdlTc.SelectedValue);
                    }
                    else
                    {
                        Ctestinfo = new ContestInfo(CtestLoginfo.ContestInfo);  // use old info
                    }

                    if (CtestLoginfo.Call != TbCall || Ctestinfo.ContestID != savCID)
                    {
                        CategoryLogInfo = GetCategoryLogInfo(string.Format(ConfigurationManager.ConnectionStrings["LogEntryInfoConnectionString"].ConnectionString,
                            Ctestinfo.DBName), TbCall, Ctestinfo.ContestID);
                    }
                    else
                    {
                        CategoryLogInfo = new CategoryLogInfo(CtestLoginfo.CatLogInfo);  // use old info
                    }

                    CtestLoginfo = new ContestLogInfo(Ctestinfo, TbCall, CategoryLogInfo,  (Byte)DDLOpr.SelectedIndex,
                        (Byte)DDLPwr.SelectedIndex, (Byte)DDLAssist.SelectedIndex, (Byte)DDLBnd.SelectedIndex, (Byte)DDLTx.SelectedIndex, CategoryCB.Checked, Cb.Checked);
                    Session.Remove(sSessionObj); //always remove when disabled
                    Session.Add(sSessionObj, CtestLoginfo);
                    switch (sSessionObj)
                    {
                        case "Call1":
                          SerializeToXmlandSave(SessionFields.ContestLogInfo1);
                          break;
                        case "Call2":
                         SerializeToXmlandSave(SessionFields.ContestLogInfo2);
                          break;
                        case "Call3":
                          SerializeToXmlandSave(SessionFields.ContestLogInfo3);
                          break;
                        default:
                            break;
                    }
                }
            }


        }


        protected void LoadQSORateChart()
        {
            if (IsPostBack)
            {
                string p = ScriptManager.GetCurrent(Page).AsyncPostBackSourceElementID;
                bool bOK = true;
                ChartAreaInfoParams ChartAreaParams = new ChartAreaInfoParams();
                // get from combobox
                ChartAreaParams.ChartPointInterval = Convert.ToInt32(IntervalDDL.SelectedItem.Text);
                //ChartInfo
                int AlphaBlend;
                if (ViewDDL.SelectedItem.Text.Contains("3D"))
                {
                    //strip 3d
                    string str = ViewDDL.SelectedItem.Text.Replace("3D", "");
                    ChartAreaParams.charttype = (SeriesChartType)Enum.Parse(typeof(SeriesChartType), str.Trim());
                    QSORateChart.ChartAreas["ChartArea1"].Area3DStyle.Enable3D = true;
                    QSORateChart.ChartAreas["ChartArea1"].Area3DStyle.PointDepth = 75;
                    QSORateChart.ChartAreas["ChartArea1"].Area3DStyle.PointGapDepth = 75;
                    //QSORateChart.ChartAreas["ChartArea1"].Area3DStyle.Inclination = 20;
                    //QSORateChart.ChartAreas["ChartArea1"].Area3DStyle.Rotation = 20;
                    //QSORateChart.ChartAreas["ChartArea1"].ShadowColor = Color.Transparent;
                    //QSORateChart.ChartAreas["ChartArea1"].Area3DStyle.LightStyle= LightStyle.Realistic;
                    AlphaBlend = 220;
                }
                else
                {
                    ChartAreaParams.charttype = (SeriesChartType)Enum.Parse(typeof(SeriesChartType), ViewDDL.SelectedItem.Text);
                    AlphaBlend = 0xff;
                }
                ChartAreaParams.ChartXaxisInterval = 1;
                ChartAreaParams.ChartXaxisIntervalType = DateTimeIntervalType.Hours;
                //tickmarks and grids.
                ChartAreaParams.MajorVerticalInterval = 24;
                ChartAreaParams.MinorVerticalInterval = 1;
                ChartAreaParams.AxisXMaxFudgeSeconds = 1;
                //look up contestinfo
                // get from combo box
                ChartAreaParams.MixedYears = MixedYears;


                //ChartTickmarkInfo XMajorTickMarkObj = new ChartTickmarkInfo(ChartXaxisIntervalType, 24, 5, Color.Red, 2);
                ChartAreaInfo ChartAreaInfo1 = new ChartAreaInfo(ChartAreaParams);

                TickMarkInfoParams TMinfo = new TickMarkInfoParams();
                GridInfoParams CgInfo = new GridInfoParams();
                //Major Vertical 
                TMinfo.IntervalType = ChartAreaInfo1.ChartXaxisIntervalType;
                TMinfo.Interval = ChartAreaInfo1.MajorHorizontalInterval;
                TMinfo.Size = 5;
                TMinfo.LineColor = Color.Red;
                TMinfo.LineWidth = 1;
                TMinfo.Style = TickMarkStyle.OutsideArea;
                ChartAreaInfo1.CreateChartTickmark(QSORateChart.ChartAreas["ChartArea1"].AxisX.MajorTickMark, ChartAreaInfo.VerticalType.Major, TMinfo);

                CgInfo.IntervalType = ChartAreaInfo1.ChartXaxisIntervalType;// need  to set for lines to appear
                CgInfo.Interval = ChartAreaInfo1.MajorHorizontalInterval;
                CgInfo.LineColor = Color.Red;
                CgInfo.LineDashStyle = ChartDashStyle.Dot;
                CgInfo.LineWidth = 1;
                ChartAreaInfo1.CreateChartGrid(QSORateChart.ChartAreas["ChartArea1"].AxisX.MajorGrid, ChartAreaInfo.VerticalType.Major, CgInfo);

                //Minor Vertical 
                TMinfo.IntervalType = ChartAreaInfo1.ChartXaxisIntervalType;
                TMinfo.Interval = ChartAreaInfo1.MinorHorizontalInterval;
                TMinfo.Size = 2;
                TMinfo.LineColor = Color.Black;
                TMinfo.LineWidth = 1;
                TMinfo.Style = TickMarkStyle.OutsideArea;
                ChartAreaInfo1.CreateChartTickmark(QSORateChart.ChartAreas["ChartArea1"].AxisX.MinorTickMark, ChartAreaInfo.VerticalType.Minor, TMinfo);

                CgInfo.IntervalType = ChartAreaInfo1.ChartXaxisIntervalType;// need  to set for lines to appear
                CgInfo.Interval = ChartAreaInfo1.MinorHorizontalInterval;
                CgInfo.LineColor = Color.FromArgb(37, 0, 0, 0);
                CgInfo.LineDashStyle = ChartDashStyle.Solid;
                CgInfo.LineWidth = 1;
                ChartAreaInfo1.CreateChartGrid(QSORateChart.ChartAreas["ChartArea1"].AxisX.MinorGrid, ChartAreaInfo.VerticalType.Minor, CgInfo);

                string QSOQuery = string.Empty;
                ContestViewParms ContestViewParms = new ContestViewParms(); //dummy
                //Series
                Collection<SeriesObj> SerCollection = new Collection<SeriesObj>();


                if (!string.IsNullOrEmpty(CtestLoginfo1.Call) && !CBCall1.Checked)
                {
                    GetQuery(QSORateChart.ID, CtestLoginfo1, ChartAreaInfo1, ChartFuncDDL.SelectedItem.Text, out ContestViewParms);
                    SeriesObj Series1Obj = new SeriesObj(CtestLoginfo1, Color.FromArgb(AlphaBlend, Color.Blue), Session, "Series1");
                    bOK = Series1Obj.Create("LogConnectionString", ChartAreaInfo1, QSORateChart.ID, ContestViewParms);
                    if (bOK)
                    {
                        QSORateChart.Series.Add(Series1Obj);
                        SerCollection.Add(Series1Obj);
                    }
                }

                if (!string.IsNullOrEmpty(CtestLoginfo2.Call) && !CBCall2.Checked)
                {
                    GetQuery(QSORateChart.ID, CtestLoginfo2, ChartAreaInfo1, ChartFuncDDL.SelectedItem.Text, out ContestViewParms);
                    SeriesObj Series2Obj = new SeriesObj(CtestLoginfo2, Color.FromArgb(AlphaBlend, Color.OrangeRed), Session, "Series2");
                    bOK = Series2Obj.Create("LogConnectionString", ChartAreaInfo1, QSORateChart.ID, ContestViewParms);
                    if (bOK)
                    {
                        QSORateChart.Series.Add(Series2Obj);
                        //string st = QSORateChart.Series[Series2Obj.Name].ChartArea;
                        //QSORateChart.Series[Series2Obj.Name].ChartArea = Chart1.ChartAreas["ChartArea1"].Name;
                        SerCollection.Add(Series2Obj);
                    }
                }

                if (!string.IsNullOrEmpty(CtestLoginfo3.Call) && !CBCall3.Checked)
                {
                    GetQuery(QSORateChart.ID, CtestLoginfo3, ChartAreaInfo1, ChartFuncDDL.SelectedItem.Text, out ContestViewParms);
                    SeriesObj Series3Obj = new SeriesObj(CtestLoginfo3, Color.FromArgb(AlphaBlend, Color.SeaGreen), Session, "Series3");
                    bOK = Series3Obj.Create("LogConnectionString", ChartAreaInfo1, QSORateChart.ID, ContestViewParms);
                    if (bOK)
                    {
                        QSORateChart.Series.Add(Series3Obj);
                        SerCollection.Add(Series3Obj);
                    }
                }


                //set 2nd titles
                string key = "";
                foreach (SeriesObj obj in SerCollection)
                {
                    switch (obj.SeriesNum)
                    {
                        case "Series1":
                            key = "Tkey1";
                            break;
                        case "Series2":
                            key = "Tkey2";
                            break;
                        case "Series3":
                            key = "Tkey3";
                            break;
                        default:
                            break;
                    }
                    if (obj.CtestLogInfo.Call != string.Empty)
                    {
                        string OPr = string.Empty;
                        switch (obj.CtestLogInfo.CatLogInfo.LogCatOprID)
                        {
                            case 1:
                                if (obj.CtestLogInfo.CatLogInfo.LogCatBndID == 1)
                                    OPr = "SOAB";
                                else
                                    OPr = "SOSB";
                                break;
                            case 2:
                                if (obj.CtestLogInfo.CatLogInfo.LogCatTxID == 1)
                                    OPr = "MS";
                                else if (obj.CtestLogInfo.CatLogInfo.LogCatTxID == 2)
                                    OPr = "M2";
                                else
                                    OPr = "MM";
                                break;
                            case 3:
                                OPr = "CHECKLOG";
                                break;
                            default:
                                break;
                        }
                        if (obj.CtestLogInfo.CatLogInfo.LogCatOprID == 1)
                        {
                            switch (obj.CtestLogInfo.CatLogInfo.LogCatBndID)
                            {
                                case 2:
                                    OPr += " 160M";
                                    break;
                                case 3:
                                    OPr += "  80M";
                                    break;
                                case 4:
                                    OPr += "  40M";
                                    break;
                                case 5:
                                    OPr += "  20M";
                                    break;
                                case 6:
                                    OPr += "  15M";
                                    break;
                                case 7:
                                    OPr += "  10M";
                                    break;
                                default:
                                    break;
                            }
                            switch (obj.CtestLogInfo.CatLogInfo.LogCatPwrID)
                            {
                                case 1:
                                    OPr += " HIGH";
                                    break;
                                case 2:
                                    OPr += "  LOW";
                                    break;
                                case 3:
                                    OPr += "  QRP";
                                    break;
                                default:
                                    break;
                            }
                            if (obj.CtestLogInfo.CatLogInfo.LogCatAstID == 1)
                            {
                                OPr += " Assisted";
                            }
                            else
                            {
                                OPr += " Non-Assisted";
                            }
                        }
                        QSORateChart.Titles[key].Text += string.Format("{0} {1} {2}",
                            obj.CtestLogInfo.Call.PadRight(10), obj.CtestLogInfo.ContestInfo.ContestName,
                            OPr);
                        //QSORateChart.Titles[key].ForeColor = Color.FromArgb(0xff, 0, 99, 99);

                    }

                }

                //TITLES
                if (ChartAreaInfo1.MixedYears)
                {
                    QSORateChart.Titles["ChartName"].Text = ContestViewParms.sTitle;
                }
                else
                {
                    QSORateChart.Titles["ChartName"].Text = string.Format("{0}  {1}", CtestLoginfo1.ContestInfo.ContestID, ContestViewParms.sTitle);
                }
                string ver = ConfigurationManager.AppSettings["AppVersion"].ToString();
                QSORateChart.Titles["Vers"].Text = string.Format("Version:  {0}", ver);

                //AXISX
                Font fontAxis = new Font("Times New Roman", 14, FontStyle.Bold);
                AxisInfoParams Ai = new AxisInfoParams();
                Ai.TitleFont = fontAxis;
                Ai.Title = "Time";
                Ai.LineWidth = 1;
                Ai.LabelStyleFormat = "{0:HH:mm}";
                Ai.LabelStyleAngle = -90;
                //Date can be different but times are the same 48 hours
                if (ChartAreaInfo1.MixedYears)
                {
                    int days = CtestLoginfo1.ContestInfo.endTime.AddMinutes(1).Subtract(CtestLoginfo1.ContestInfo.startTime).Days;
                    Ai.Minimum = DateTime.Parse("1/1/1990 " + CtestLoginfo1.ContestInfo.startTime.TimeOfDay).ToOADate();
                    Ai.Maximum = DateTime.Parse("1/" + string.Format("{0}", 1 + days) + "/1990 " +
                        CtestLoginfo1.ContestInfo.endTime.AddSeconds(ChartAreaInfo1.AxisXMaxFudgeSeconds).TimeOfDay).ToOADate();
                }
                else
                {
                    if (!CBCall1.Checked)
                    {
                        Ai.Minimum = CtestLoginfo1.ContestInfo.startTime.ToOADate();
                        Ai.Maximum = CtestLoginfo1.ContestInfo.endTime.AddSeconds(ChartAreaInfo1.AxisXMaxFudgeSeconds).ToOADate();
                    }
                    else if (!CBCall2.Checked)
                    {
                        Ai.Minimum = CtestLoginfo2.ContestInfo.startTime.ToOADate();
                        Ai.Maximum = CtestLoginfo2.ContestInfo.endTime.AddSeconds(ChartAreaInfo1.AxisXMaxFudgeSeconds).ToOADate();
                    }
                    else if (!CBCall3.Checked)
                    {
                        Ai.Minimum = CtestLoginfo3.ContestInfo.startTime.ToOADate();
                        Ai.Maximum = CtestLoginfo3.ContestInfo.endTime.AddSeconds(ChartAreaInfo1.AxisXMaxFudgeSeconds).ToOADate();
                    }
                }
                Ai.IntervalType = ChartAreaInfo1.ChartXaxisIntervalType;
                Ai.Interval = ChartAreaInfo1.MinorHorizontalInterval;
                ChartAreaInfo1.InitChartAxis(QSORateChart.ChartAreas["ChartArea1"].AxisX, Ai);

                // set second row of labels
                QSORateChart.ChartAreas["ChartArea1"].AxisX.CustomLabels.Add(24, ChartAreaInfo1.ChartXaxisIntervalType, "Day {0:dd}", 2, LabelMarkStyle.LineSideMark);
                //QSORateChart.ChartAreas["ChartArea1"].AxisX.LabelAutoFitStyle = LabelAutoFitStyles.DecreaseFont | LabelAutoFitStyles.StaggeredLabels | LabelAutoFitStyles.LabelsAngleStep90;
                //QSORateChart.Series[Series1Obj.Name].AxisLabel = "#VALX{dd}\n#VALX{MMM}\n#VALX{yyy}";
                //QSORateChart.ChartAreas["ChartArea1"].AxisX.LabelStyle.IsEndLabelVisible = true;
                //QSORateChart.ChartAreas["ChartArea1"].InnerPlotPosition = new ElementPosition(0, 0, 90, 100);
                //QSORateChart.ChartAreas["ChartArea1"].AxisX.IntervalOffset = 15;
                //QSORateChart.ChartAreas["ChartArea1"].AxisX.IntervalOffsetType = DateTimeIntervalType.Minutes;
                //TabContainerCall.Controls.Add(
                ////SCALEVIEW
                int startHour = Convert.ToInt32(DDLVStart.SelectedItem.Text.Substring(0, 2));
                int Size = Convert.ToInt32(DDLVHours.SelectedItem.Text);

                if (Size != 48)
                {
                    int Day = 1;
                    if (DDLVStart.SelectedItem.Text.Contains("Day2"))
                    {
                        Day = 2;
                    }
                    QSORateChart.ChartAreas["ChartArea1"].AxisX.IsStartedFromZero = true;
                    DateTime pos;

                    if (ChartAreaInfo1.MixedYears)
                    {
                        pos = new DateTime(1990, 1, Day, startHour, 00, 00);
                    }
                    else
                    {
                        if (Day == 2)
                        {
                            pos = this.CtestLoginfo1.ContestInfo.startTime.AddDays(1).AddHours(startHour);
                        }
                        else
                        {
                            pos = this.CtestLoginfo1.ContestInfo.startTime.AddHours(startHour);
                        }
                    }
                    QSORateChart.ChartAreas["ChartArea1"].AxisX.ScaleView.Position = pos.ToOADate();
                    QSORateChart.ChartAreas["ChartArea1"].AxisX.ScaleView.Size = Size;// count of ScaleView.SizeType
                    QSORateChart.ChartAreas["ChartArea1"].AxisX.ScaleView.SizeType = ChartAreaParams.ChartXaxisIntervalType;
                }


                //AXISY
                //QSORateChart.ImageLocation
                QSORateChart.ChartAreas["ChartArea1"].AxisY.TitleFont = fontAxis;
                QSORateChart.ChartAreas["ChartArea1"].AxisY.Title = ContestViewParms.sYAxis;
                QSORateChart.ChartAreas["ChartArea1"].AxisY.LabelStyle.Format = "{0:n0}";
                if (ChartFuncDDL.SelectedItem.Text.Contains("Sum"))
                {
                    QSORateChart.ChartAreas["ChartArea1"].AxisY.Enabled = AxisEnabled.False;
                }
                QSORateChart.ChartAreas["ChartArea1"].AxisY2.Enabled = AxisEnabled.True;
                QSORateChart.ChartAreas["ChartArea1"].AxisY2.LineWidth = 0;
                QSORateChart.ChartAreas["ChartArea1"].AxisY2.LabelStyle.Format = "{0:n0}";
                QSORateChart.ChartAreas["ChartArea1"].Position = new ElementPosition(0, 10, 100, 80);
                QSORateChart.Titles["ChartName"].Position = new ElementPosition(2, 0, 50, 10);
                QSORateChart.Legends["Legend1"].Position = new ElementPosition(50, 1, 50, 9);

                // LEGENDS
                QSORateChart.Legends["Legend1"].ForeColor = Color.DarkOliveGreen;
                Font fontLegend = new Font("Times New Roman", 11, FontStyle.Bold, GraphicsUnit.Point);
                QSORateChart.Legends["Legend1"].Font = fontLegend;
                QSORateChart.Legends["Legend1"].Position.Height = 7;

                    // draw!
            //QSORateChart.Invalidate();
 
#if true
    string path = Server.MapPath("~/ChartImages/chart.png");
    QSORateChart.SaveImage(path, ChartImageFormat.Png);
#endif


            }
        }


        /// <summary>
        /// Find maximum Y value
        /// </summary>
        /// <param name="point">index of a data point which have maximum Y value</param>
        private void FindMaximum(out int point, Series serobj)
        {
            double maxY = double.MinValue;

            point = 0;
            int pointIndex = -1;
            foreach (DataPoint dataPoint in QSORateChart.Series[serobj.Name].Points)
            {
                pointIndex++;

                if (dataPoint.XValue < QSORateChart.ChartAreas["ChartArea1"].AxisX.Minimum)
                    continue;

                if (dataPoint.XValue > QSORateChart.ChartAreas["ChartArea1"].AxisX.Maximum)
                    continue;

                if (maxY < dataPoint.YValues[0])
                {
                    maxY = dataPoint.YValues[0];
                    point = pointIndex;
                }
            }
        }


        static public ContestInfo GetContestInfoOLE(string sConn, string ID)
        {
            string ConnectionString = ConfigurationManager.ConnectionStrings[sConn].ConnectionString;

            string InfoQuery = @"SELECT * FROM ContestInfo WHERE ContestID = '" + ID + "' ";
            OleDbConnection oConn = new OleDbConnection();
            DataTable oRS = new DataTable();
            oRS.Columns.Add("ContestType", typeof(String));
            oRS.Columns.Add("ContestName", typeof(String));
            oRS.Columns.Add("DBName", typeof(String));
            oRS.Columns.Add("QSOTblName", typeof(String));
            oRS.Columns.Add("ClassTblName", typeof(String));

            oRS.Columns.Add("StartDateTime", typeof(DateTime));
            oRS.Columns.Add("EndDateTime", typeof(DateTime));

            try
            {
                oConn.ConnectionString = ConnectionString;
                oConn.Open();
                OleDbDataAdapter oDA = new OleDbDataAdapter(InfoQuery, oConn);
                oDA.Fill(oRS);
                //oConn.Close();
            }
            catch (Exception e)
            {
            }
            finally { if (oConn.State == ConnectionState.Open) { oConn.Close(); } }

            ContestInfo Ctinfo = new ContestInfo();
            foreach (DataRow dr in oRS.Rows)
            {
                Ctinfo.ContestID = ID;
                Ctinfo.ContestType = dr["ContestType"].ToString();
                Ctinfo.ContestName = dr["ContestName"].ToString();
                Ctinfo.DBName = dr["DBName"].ToString();
                Ctinfo.ContestTblName = dr["ContestTblName"].ToString();
                Ctinfo.EntryTblName = dr["EntryTblName"].ToString();
                Ctinfo.startTime = (DateTime)dr["StartDateTime"];
                Ctinfo.endTime = (DateTime)dr["EndDateTime"];

                int day1 = Ctinfo.startTime.Day;
                Ctinfo.basedstartTime = DateTime.Parse("1/1/1990 " + Ctinfo.startTime.TimeOfDay);
                Ctinfo.basedendTime = DateTime.Parse("1/" + string.Format("{0}", 1 + Ctinfo.endTime.Day - day1) + "/1990 " + Ctinfo.endTime.TimeOfDay);
            }
            return Ctinfo;
        }

        static public CategoryLogInfo GetCategoryLogInfo(string sConnectionString, string TbCall, string Test)
        {
            CategoryLogInfo Cloginfo = null;
            if (TbCall != string.Empty)
            {
                OleDbConnection oConn = new OleDbConnection();
                DataTable oRC = new DataTable();
                oRC.Columns.Add("EntryClass", typeof(String));

                DataTable oRS = new DataTable();
                oRS.Columns.Add("CallID", typeof(Int32));
                oRS.Columns.Add("CtyID", typeof(Int16));
                oRS.Columns.Add("CatOprID", typeof(Byte));
                oRS.Columns.Add("CatTxID", typeof(Byte));
                oRS.Columns.Add("CatAssisted", typeof(Byte));
                oRS.Columns.Add("CatBandID", typeof(Byte));
                oRS.Columns.Add("CatPowerID", typeof(Byte));
                oRS.Columns.Add("CalcZones", typeof(Int16));
                oRS.Columns.Add("CalcCountries", typeof(Int16));
                oRS.Columns.Add("CalcScore", typeof(Int32));
                oRS.Columns.Add("DBName", typeof(String));
                oRS.Columns.Add("CID", typeof(Int16));

                using (oConn)
                {
                    try
                    {
                        oConn.ConnectionString = sConnectionString;
                        oConn.Open();
                        string sQuery = string.Format("SELECT  [CallID], [CtyID], [CatOprID], [CatTxID], [CatAssisted], [CatBandID], [CatPowerID],  [DBName], [CalcZones], [CalcCountries], [CalcScore], [CID] FROM [CqwwEntry] WHERE [Call] = '{0}'", TbCall);
                        OleDbDataAdapter oDA = new OleDbDataAdapter(sQuery, oConn);
                        oDA.Fill(oRS);
                        //oConn.Close();
                    }
                    catch (Exception e)
                    {
                        string err = e.Message;
                    }
                    finally { if (oConn.State == ConnectionState.Open) { oConn.Close(); } }
                }

                Cloginfo = new CategoryLogInfo();
                int CID = 1;
                foreach (DataRow dr in oRS.Rows)
                {
                    Cloginfo.LogCallID = (Int32)dr["CallID"];
                    Cloginfo.LogCtyID = (Int16)dr["CtyID"];
                    Cloginfo.LogCatOprID = (Byte)dr["CatOprID"];
                    Cloginfo.LogCatTxID = (Byte)dr["CatTxID"];
                    Cloginfo.LogCatAstID = (Byte)dr["CatAssisted"];
                    Cloginfo.LogCatBndID = (Byte)dr["CatBandID"];
                    Cloginfo.LogCatPwrID = (Byte)dr["CatPowerID"];
                    Cloginfo.LogDBName = dr["DBName"].ToString();
                    Cloginfo.LogCalcZones = (Int16)dr["CalcZones"];
                    Cloginfo.LogCalcCountries = (Int16)dr["CalcCountries"];
                    Cloginfo.LogCalcScore = (Int32)dr["CalcScore"];
                    CID = (Int16)dr["CID"];

                }

                string ContestID = string.Empty;
                DataTable oWC = new DataTable();
                oRC.Columns.Add("ContestID", typeof(String));
                using (oConn)
                {
                    try
                    {
                        oConn.ConnectionString = ConfigurationManager.ConnectionStrings["WebLog_db_MDB"].ConnectionString;
                        oConn.Open();
                        string sQuery = string.Format("SELECT  [ContestID] FROM [ContestInfo] WHERE [CID] = {0} ", CID);
                        OleDbDataAdapter oDAc = new OleDbDataAdapter(sQuery, oConn);
                        oDAc.Fill(oWC);
                        //oConn.Close();
                    }
                    catch (Exception e)
                    {
                        string err = e.Message;
                    }
                    finally { if (oConn.State == ConnectionState.Open) { oConn.Close(); } }
                }
                foreach (DataRow dr in oWC.Rows)
                {
                    ContestID = dr["ContestID"] as string;
                }

              using (oConn)
                {
                    try
                    {
                        oConn.ConnectionString = ConfigurationManager.ConnectionStrings["CqResultsConnectionString"].ConnectionString;
                        oConn.Open();
                        string sQuery = string.Format("SELECT  [EntryClass] FROM [cqww] " +
                            "INNER JOIN [Contests] ON cqww.CID = Contests.CID WHERE [Call] = '{0}' and Contests.ContestID = '{1}'", TbCall, ContestID);
                        OleDbDataAdapter oDAc = new OleDbDataAdapter(sQuery, oConn);
                        oDAc.Fill(oRC);
                        //oConn.Close();
                    }
                    catch (Exception e)
                    {
                        string err = e.Message;
                    }
                    finally { if (oConn.State == ConnectionState.Open) { oConn.Close(); } }
                }
                foreach (DataRow dr in oRC.Rows)
                {
                    Cloginfo.LogEntryClass = dr["EntryClass"] as string;
                }


            }
            return Cloginfo;
        }

        
        
        protected void QSORateChart_CustomizeLegend(object sender, CustomizeLegendEventArgs e)
        {
            // Loop through all default legend items
            if (e.LegendName == "Legend1")
            {
                foreach (LegendItem item in e.LegendItems)
                {
                    item.ImageStyle = LegendImageStyle.Rectangle;
                    //item.Cells[1].Text = "My Name";
                }

            }

        }

        //protected void Chart2_Load(object sender, EventArgs e)
        //{
        //    ChartAreaInfoParams ChartAreaParams = new ChartAreaInfoParams();
        //    // get from combobox
        //    ChartAreaParams.ChartPointInterval = 60;
        //    //ChartInfo
        //    ChartAreaParams.charttype = SeriesChartType.Column;
        //    ChartAreaParams.ChartXaxisInterval = 1;
        //    ChartAreaParams.ChartXaxisIntervalType = DateTimeIntervalType.Hours;
        //    //tickmarks and grids.
        //    ChartAreaParams.MajorVerticalInterval = 24;
        //    ChartAreaParams.MinorVerticalInterval = 1;
        //    ChartAreaParams.AxisXMaxFudgeMinutes = 1;
        //    //look up contestinfo
        //    // get from combo box
        //    ChartAreaParams.MixedYears = MixedYears;

        //    ChartAreaInfo ChartAreaInfo1 = new ChartAreaInfo(ChartAreaParams);

        //    SeriesObj Series1Obj = new SeriesObj(CtestLoginfo1, Color.Blue, Session, "Series1");
        //    Series1Obj.Create("cn2r_db_MDB", ChartAreaInfo1.ChartPointtInterval, ChartAreaInfo1.charttype, Chart2.ID, ChartAreaParams.MixedYears);
        //    Chart2.Series.Add(Series1Obj);
        //    //Chart2.ChartAreas["ChartArea1"].AxisX.IsMarginVisible = true;
        //    //string st = Chart2.Series[Series1Obj.Name].ChartArea;
        //    Chart2.Series[Series1Obj.Name].ChartArea = Chart2.ChartAreas["ChartArea1"].Name;

        //    int days = CtestLoginfo1.ContestInfo.endTime.AddMinutes(1).Subtract(CtestLoginfo1.ContestInfo.startTime).Days;
        //    Chart2.ChartAreas["ChartArea1"].AxisX.Minimum = DateTime.Parse("1/1/1990 " + CtestLoginfo1.ContestInfo.startTime.TimeOfDay).ToOADate();
        //    Chart2.ChartAreas["ChartArea1"].AxisX.Maximum = DateTime.Parse("1/" + string.Format("{0}", 1 + days) + "/1990 " +
        //            CtestLoginfo1.ContestInfo.endTime.AddMinutes(ChartAreaInfo1.AxisXMaxFudgeMinutes).TimeOfDay).ToOADate();

        //}


        public void LoadDDLContest(string ConnectionString, DropDownList DDL1, DropDownList DDL2, DropDownList DDL3)
        {
            string InfoQuery = @"SELECT ContestID, ContestName FROM ContestInfo WHERE Enabled = 1 ORDER BY StartDateTime DESC";
            OleDbConnection oConn = new OleDbConnection();
            DataSet ds = new DataSet();
            ds.Tables.Add("Contests");

            ds.Tables["Contests"].Columns.Add("ContestID", Type.GetType("System.String"));
            ds.Tables["Contests"].Columns.Add("ContestName", Type.GetType("System.String"));
            try
            {
                oConn.ConnectionString = ConnectionString;
                oConn.Open();
                OleDbDataAdapter oDA = new OleDbDataAdapter(InfoQuery, oConn);
                oDA.Fill(ds, "Contests");
                //oConn.Close();
            }
            catch (Exception)
            {
            }
            finally { if (oConn.State == ConnectionState.Open) { oConn.Close(); } }
            DDL1.DataSource = ds;
            DDL1.DataMember = "Contests";
            DDL1.DataTextField = "ContestID";
            DDL1.DataValueField = "ContestID";
            DDL1.Attributes["onChange"] = "ContestChanged(this,'1');";
            DDL1.DataBind();
            DDL2.DataSource = ds;
            DDL2.DataMember = "Contests";
            DDL2.DataTextField = "ContestID";
            DDL2.DataValueField = "ContestID";
            DDL2.Attributes["onChange"] = "ContestChanged(this,'2');";
            DDL2.DataBind();
            DDL3.DataSource = ds;
            DDL3.DataMember = "Contests";
            DDL3.DataTextField = "ContestID";
            DDL3.DataValueField = "ContestID";
            DDL3.Attributes["onChange"] = "ContestChanged(this,'3');";
            DDL3.DataBind();

        }

        public void LoadDdl(string ConnectionString, DropDownList ddl, string Textddl, string valueddl, string tableddl,
            int Index, string function)
        {
            string InfoQuery = @"SELECT " + Textddl + ", " + valueddl + " FROM " + tableddl + " ORDER BY " + valueddl;
            OleDbConnection oConn = new OleDbConnection();
            DataSet ds = new DataSet();
            ds.Tables.Add(tableddl);

            ds.Tables[tableddl].Columns.Add(valueddl, Type.GetType("System.Int32"));
            ds.Tables[tableddl].Columns.Add(Textddl, Type.GetType("System.String"));
            try
            {
                oConn.ConnectionString = ConnectionString;
                oConn.Open();
                OleDbDataAdapter oDA = new OleDbDataAdapter(InfoQuery, oConn);
                oDA.Fill(ds, tableddl);
                //oConn.Close();
            }
            catch (Exception)
            {
            }
            finally { if (oConn.State == ConnectionState.Open) { oConn.Close(); } }
            ddl.DataSource = ds;
            ddl.DataMember = tableddl;
            ddl.DataTextField = Textddl;
            ddl.DataValueField = valueddl;
            ddl.DataBind();
            if (function != string.Empty)
            {
                ddl.Attributes["onChange"] = function + "(this," + Index + ");";
            }
        }

        public bool LoadQSOCouDdl(DropDownList ddl, string Textddl, string valueddl, string tableddl, int Index, string function)
        {
            bool CtyDBChanged = false;
            int CountryDB = 0;
            string ConnectionString;  //determinedn to use for countrylist
            if ((CBCall2.Checked && CBCall3.Checked) || (TBCall2.Text == "" && TBCall3.Text == ""))
            {
                ConnectionString = string.Format(ConfigurationManager.ConnectionStrings["LogConnectionString"].ConnectionString, CtestLoginfo1.ContestInfo.ContestID, CtestLoginfo1.CatLogInfo.LogDBName);
                CountryDB = 1;
            }
            else if ((CBCall1.Checked && CBCall3.Checked) || (TBCall1.Text == "" && TBCall3.Text == ""))
            {
                ConnectionString = string.Format(ConfigurationManager.ConnectionStrings["LogConnectionString"].ConnectionString, CtestLoginfo2.ContestInfo.ContestID, CtestLoginfo2.CatLogInfo.LogDBName);
                CountryDB = 2;
            }
            else if ((CBCall1.Checked && CBCall2.Checked) || (TBCall1.Text == "" && TBCall2.Text == ""))
            {
                ConnectionString = string.Format(ConfigurationManager.ConnectionStrings["LogConnectionString"].ConnectionString, CtestLoginfo3.ContestInfo.ContestID, CtestLoginfo3.CatLogInfo.LogDBName);
                CountryDB = 3;
            }
            else if (MixedYears == true)
            {
                ConnectionString = ConfigurationManager.ConnectionStrings["WebLog_db_MDB"].ConnectionString;
                CountryDB = 4;
            }
            else
            {
                ConnectionString = string.Format(ConfigurationManager.ConnectionStrings["LogEntryInfoConnectionString"].ConnectionString, CtestLoginfo1.ContestInfo.DBName);
                CountryDB = 5;
            }

            if (Session["CountryDB"] == null)
            {
                Session.Add("CountryDB", CountryDB);
            }
            else
            {
                if (Convert.ToInt32(Session["CountryDB"]) != CountryDB) 
                {
                    CtyDBChanged = true;
                    Session["CountryDB"] = CountryDB;
                }
            }

 //'ALL Countries' AS Country FROM [QSOs] UNION SELECT DISTINCT [Country] AS Country FROM [QSOs]
            string InfoQuery = @"SELECT '0' AS " + Textddl + ", '0' AS Prefix FROM " + tableddl + " UNION SELECT DISTINCT [" + Textddl + "] , " + valueddl + " FROM " + tableddl + " ORDER BY " + Textddl;
            //string InfoQuery = @"SELECT   DISTINCT " + Textddl + ", " + valueddl + " FROM " + tableddl + " ORDER BY " + Textddl;
            OleDbConnection oConn = new OleDbConnection();
            DataSet ds = new DataSet();
            ds.Tables.Add(tableddl);

            ds.Tables[tableddl].Columns.Add(valueddl, Type.GetType("System.String"));
            ds.Tables[tableddl].Columns.Add(Textddl, Type.GetType("System.String"));
            try
            {
                oConn.ConnectionString = ConnectionString;
                oConn.Open();
                OleDbDataAdapter oDA = new OleDbDataAdapter(InfoQuery, oConn);
                oDA.Fill(ds, tableddl);
                //oConn.Close();
            }
            catch (Exception)
            {
            }
            finally { if (oConn.State == ConnectionState.Open) { oConn.Close(); } }
            ddl.DataSource = ds;
            ddl.DataMember = tableddl;
            ddl.DataTextField = Textddl;
            ddl.DataValueField = valueddl;
            ddl.DataBind();
            if (ddl.Items.Count != 0)
            {
                ddl.Items[0].Text = "ALL Countries";
            }
            ddl.Attributes["onChange"] = function + "(this," + Index + ");";
            return CtyDBChanged;
        }


        protected void LoadTabControlDatalists(char prefix1stLetter)
        {
            char PanHdr;
            //uses default contest DB table for its CTY table
            //The CTY table ise used to get Country code and comput default Tab.
            int index;
            if (char.IsLetter(prefix1stLetter))
            {
                char.ToUpper(prefix1stLetter);
                PanHdr = prefix1stLetter;
                if (PanHdr > 'P')  //handle missing Q tab
                {
                    index = prefix1stLetter - 0x40 - 1;
                }
                else
                {
                    index = prefix1stLetter - 0x40;
                }
            }
            else
            {
                index = 0;
                PanHdr = '0';
            }

            //LOAD up Defualt TAB
            TabC1.ActiveTabIndex = index;
            TabC2.ActiveTabIndex = index;
            TabC3.ActiveTabIndex = index;
            UpdateTabDatalist(TabC1, CtestLoginfo1, DDLTC1, TBCall1, "Call1", CBCall1);
            UpdateTabDatalist(TabC2, CtestLoginfo2, DDLTC2, TBCall2, "Call2", CBCall2);
            UpdateTabDatalist(TabC3, CtestLoginfo3, DDLTC3, TBCall3, "Call3", CBCall3);

        }

        protected char GetLetterPrefix(int index)
        {
            char PanHdr= '0';;
            if (index == 0)
            {
                PanHdr = '0';               
            }
            else if (index < 0x11) //'Q'
            {
                PanHdr = (char)(index + 0x40);
            }
            else
            {
                PanHdr = (char)(index + 0x40 + 1);
            }
            return PanHdr;
        }


        protected void Cat_changed(object sender, EventArgs args)
        {
            bool bDBChanged = false;
            if (btnSelectedTabContainer.Value == "6")
            {
                if (CategoryCB.Checked == false)
                {
                    DDLOpr.Enabled = true;
                }
                else
                {
                    DDLOpr.Enabled = false;
                }

            }
            //int Catindex = int.Parse(btnSelectedTabContainer.Value);
            bDBChanged = UpdateTabDatalist(TabC1, CtestLoginfo1, DDLTC1, TBCall1, "Call1", CBCall1);
            if (bDBChanged == false)
            {
                SaveContestLogInfoSQL(SessionFields.ContestLogInfo1);    
            }
            //Call1UpdatePanel.Update();
            bDBChanged = UpdateTabDatalist(TabC2, CtestLoginfo2, DDLTC2, TBCall2, "Call2", CBCall2);
            if (bDBChanged == false)
            {
                SaveContestLogInfoSQL(SessionFields.ContestLogInfo2);
            }
            //Call2UpdatePanel.Update();
            bDBChanged = UpdateTabDatalist(TabC3, CtestLoginfo3, DDLTC3, TBCall3, "Call3", CBCall3);
            //Call3UpdatePanel.Update();
            if (bDBChanged == false)
            {
                SaveContestLogInfoSQL(SessionFields.ContestLogInfo3);
            }
            LoadQSORateChart();
        }


        protected void GetFilter(out string CatFilter)
        {
            CatFilter = string.Empty;
            switch (DDLOpr.SelectedItem.Text)
            {
                case "SINGLE-OP":
                    CatFilter = " [CatOprID] = " + DDLOpr.Text;
                    CatFilter = SetSingleOpFilter( CatFilter);
                    break;
                case "MULTI-OP":
                    CatFilter = " [CatOprID] = " + DDLOpr.Text;
                    if (DDLTx.SelectedItem.Text != "ALL")
                    {
                        CatFilter += " AND [CatTxID]= " + DDLTx.Text;
                    }
                    break;
                case "CHECKLOG":
                    CatFilter = " [CatOprID] = " + DDLOpr.Text;
                    break;
                case "ALL":
                    CatFilter = SetSingleOpFilter( CatFilter);
                    break;
                default:
                    break;
            }
        }


        protected string SetSingleOpFilter(string Filter)
        {
            string CatFilter = Filter;
            if (DDLOpr.SelectedItem.Text == "SINGLE-OP" )
            {
                if (CatFilter != string.Empty )
                {
                    CatFilter +=" AND ";
                }
                CatFilter +=" [CatBandID]= " + DDLBnd.Text ;
            }
            if (DDLPwr.SelectedItem.Text != "ALL")
            {
                if (CatFilter != string.Empty)
                {
                    CatFilter += " AND ";
                }
                CatFilter += "[CatPowerID]= " + DDLPwr.Text;
            }
            if (DDLAssist.SelectedItem.Text != "ALL")
            {
                if (CatFilter != string.Empty)
                {
                    CatFilter += " AND ";
                }
                CatFilter += "[CatAssisted]= " + DDLAssist.Text;
            }
            return CatFilter;
        }

        protected void Page_Loaded(object sender, EventArgs args)
        {
            //The CTY table ise used to get Country code and comput default Tab.
            char prefix1stLetter = GetDefaultTabIndexChar(GeoSqlDataSource);
            LoadTabControlDatalists(prefix1stLetter);
            LoadQSORateChart();
        }

        protected void Log_changed(object sender, EventArgs args)
        {
            ////int Catindex = int.Parse(btnSelectedTabContainer.Value);
            //UpdateTabDatalist(TabC1, CtestLoginfo1, DDLTC1, TBCall1, "Call1", CBCall1);
            ////Call1UpdatePanel.Update();
            //UpdateTabDatalist(TabC2, CtestLoginfo2, DDLTC2, TBCall2, "Call2", CBCall2);
            ////Call2UpdatePanel.Update();
            //UpdateTabDatalist(TabC3, CtestLoginfo3, DDLTC3, TBCall3, "Call3", CBCall3);
            ////Call3UpdatePanel.Update();
            SaveQSOFilterSQL();
            LoadQSORateChart();
        }

        protected void Chart_changed(object sender, EventArgs args)
        {
            if (btnSelectedTabContainer.Value == "1")
            {
                if (ChartFuncDDL.SelectedItem.Text.Contains("Sum"))
                {
                    ViewDDL.SelectedIndex = 3;  //hack for spline
                    UpdatePaneYVw.Update();
                }
                else
                {
                    ViewDDL.SelectedIndex = 0;  //hack for column
                    UpdatePaneYVw.Update();
                }
               
            }
            if (btnSelectedTabContainer.Value == "4")
            {   //DDLVStart changed
                int Size = Convert.ToInt32(DDLVHours.SelectedItem.Text);
                int startHour = Convert.ToInt32(DDLVStart.SelectedItem.Text.Substring(0, 2));
                int Day = 0;
                if (DDLVStart.SelectedItem.Text.Contains("Day2"))
                {
                    Day = 1;
                }
                if (startHour + Day * 24 + Size > 48)
                {
                    while (startHour + Day * 24 + Size > 48 || 
                            Size > Convert.ToInt32(DDLVHours.Items[DDLVHours.Items.Count - 1].Text) )
                    {
                        Size -= 2;
                    }
                    int i = DDLVHours.Items.Count - 1;
                    while (Convert.ToInt32(DDLVHours.Items[i].Text) > Size)
                    {
                        i -= 1;
                    }
                    DDLVHours.SelectedIndex = i;
                    UpdatePaneX.Update();
                }

            }
            if (btnSelectedTabContainer.Value == "5")
            {   //DDLVHours changed
                int Size = Convert.ToInt32(DDLVHours.SelectedItem.Text);
                int startHour = Convert.ToInt32(DDLVStart.SelectedItem.Text.Substring(0, 2));
                if (Size == 48)
                {
                    DDLVStart.SelectedIndex = 0;
                    UpdatePanelTst.Update();
                }
                else
                {
                    int Day = 0;
                    if (DDLVStart.SelectedItem.Text.Contains("Day2"))
                    {
                        Day = 1;
                    }
                    if (startHour + Day * 24 + Size > 48)
                    {
                        while (startHour + Day * 24 + Size > 48 || 
                            Size > Convert.ToInt32(DDLVHours.Items[DDLVHours.Items.Count - 1].Text) )
                        {
                            Size -= 4;
                        }
                        int i = DDLVHours.Items.Count - 1;
                        while (Convert.ToInt32(DDLVHours.Items[i].Text) > Size)
                        {
                            i -= 1;
                        }
                        DDLVHours.SelectedIndex = i;
                        UpdatePaneX.Update();
                    }
                }

            }
            SaveContestViewFilterSQL();
            LoadQSORateChart();
        }




        protected void Contest_changed(object sender, EventArgs args)
        {
            //int index = DDLTC1.SelectedIndex;
            int TCindex = int.Parse(btnSelectedTabContainer.Value);

            switch (TCindex)
            {
                case 1:
                    UpdateTabDatalist(TabC1, CtestLoginfo1, DDLTC1, TBCall1, "Call1", CBCall1);
                    //Call1UpdatePanel.Update();
                   break;
                case 2:
                   UpdateTabDatalist(TabC2, CtestLoginfo2, DDLTC2, TBCall2, "Call2", CBCall2);
                  //Call2UpdatePanel.Update();
                   break;
                case 3:
                   UpdateTabDatalist(TabC3, CtestLoginfo3, DDLTC3, TBCall3, "Call3", CBCall3);
                   //Call3UpdatePanel.Update();
                   break;
                default:
                    break;
            }
            LoadQSORateChart();
        }

        protected void Call_changed(object sender, EventArgs args)
        {
            int TCindex = int.Parse(btnSelectedTabContainer.Value);


            SessionFields SessionField = (SessionFields)TCindex;
            switch (SessionField)
            {
                case SessionFields.ContestLogInfo1:
                    SaveContestLogInfoSQL(SessionFields.ContestLogInfo1);
                    break;
                case SessionFields.ContestLogInfo2:
                     SaveContestLogInfoSQL(SessionFields.ContestLogInfo2);
                   break;
                case SessionFields.ContestLogInfo3:
                     SaveContestLogInfoSQL(SessionFields.ContestLogInfo3);
                   break;
                case SessionFields.QSOLogFilter:
                    break;
                case SessionFields.ContestViewFilter:
                    break;
                case SessionFields.All:
                    break;
                default:
                    break;
            }
            LoadQSORateChart();
            //if (TCindex == 0) // checkbox clicked
            //{
                bool CtyDBChanged = LoadQSOCouDdl(DDLLCou, "Name", "Prefix", "QCountries", 3, "LogChanged");
                if (CtyDBChanged)
                {
                     UpdatePanelQSO.Update();
                }
            //}
                if (CtestLoginfo1.CatLogInfo != null && CtestLoginfo1.CatLogInfo.LogDBName == null)
                {//call not in selected contest
                    TBCall1.Text = string.Empty;
                    Call1UpdatePanel.Update();
                }
                if (CtestLoginfo2.CatLogInfo != null && CtestLoginfo2.CatLogInfo.LogDBName == null)
                {
                    TBCall2.Text = string.Empty;
                    Call2UpdatePanel.Update();
                }
                if (CtestLoginfo3.CatLogInfo != null && CtestLoginfo3.CatLogInfo.LogDBName == null)
                {
                    TBCall3.Text = string.Empty;
                    Call3UpdatePanel.Update();
                }    

        }


        protected void Callcb_changed(object sender, EventArgs args)
        {
            int TCindex = int.Parse(btnSelectedTabContainer.Value);
            //update Session state, for return from Results page
            LoadQSORateChart();
            switch (TCindex)
            {
                case 1:
                    if (Session["Call1"] != null)
                    {
                        SaveContestLogInfoSQL(SessionFields.ContestLogInfo1);
                    }
                    break;
                case 2:
                    if (Session["Call2"] != null)
                    {
                        SaveContestLogInfoSQL(SessionFields.ContestLogInfo2);
                    }
                    break;
                case 3:
                    if (Session["Call3"] != null)
                    {
                        SaveContestLogInfoSQL(SessionFields.ContestLogInfo3);
                    }
                    break;
                default:
                    break;
            }
        }


        protected bool  UpdateTabDatalist(AjaxControlToolkit.TabContainer TabC, ContestLogInfo CtestLoginfo,
                DropDownList DDLTC, TextBox TBCall, string sSessionObj, CheckBox CBCall)
        {
            bool bCallChanged = false;
            DataList dl;
            char PanHdr;
            string CatFilter = string.Empty;
            if (CategoryCB.Checked == false)
            {
                GetFilter(out CatFilter);
            }
            PanHdr = GetLetterPrefix(TabC.ActiveTabIndex);
            dl = (DataList)TabC.Tabs[TabC.ActiveTabIndex].FindControl("DL" + PanHdr);
            bCallChanged = FillDataList(dl, CtestLoginfo, PanHdr, TBCall, CatFilter);
            if (bCallChanged)
            {
                UpdateCallSessionObj(out CtestLoginfo, DDLTC, TBCall.Text, sSessionObj, CBCall);
            }
            return bCallChanged;
        }



        //specific to each call
        protected void Tab_ClickCall1(object sender, EventArgs args)
        {
            //System.Threading.Thread.Sleep(1500);
            char c;
            int index = int.Parse(btnSelectedTab.Value);
            if (index != 0)
            {
                if (index < 17) //handle missing 'Q' tab
                {
                    c = Convert.ToChar(index + 0x40);
                }
                else
                {
                    c = Convert.ToChar(index + 0x40 + 1);
                }
            }
            else
            {
                c = '0';
            }
            //AjaxControlToolkit.TabContainer tc = (AjaxControlToolkit.TabContainer)Page.FindControl(btnSelectedTabContainer.Value);
            //split of name decoration
            char[] sSplit = new char[1] { '_' };

            string[] val = btnSelectedTabContainer.Value.Split(sSplit);
            switch (val[1])
            {
                case "TabC1":
                    UpdateTabDatalist(TabC1, CtestLoginfo1, DDLTC1, TBCall1, "Call1", CBCall1);
                    break;
                case "TabC2":
                   UpdateTabDatalist(TabC2, CtestLoginfo2, DDLTC2, TBCall2, "Call2", CBCall2);
                    break;
                case "TabC3":
                   UpdateTabDatalist(TabC3, CtestLoginfo3, DDLTC3, TBCall3, "Call3", CBCall3);
                    break;
                default:
                    break;
            }
            //LoadQSORateChart();
            //UpdatePanelQSORate.Update();
            //dl.DataSource = dv;
            //dl.Visible = true;
            //dl.DataBind();
        }


        protected char GetDefaultTabIndexChar(SqlDataSource Src)
        {
            char c ='W';
            string StrConn = ConfigurationManager.AppSettings["DATGeoLiteCountry"];
            //fileInput = new FileStream(MapPath(StrConn), FileMode.Open, FileAccess.Read, FileShare.Read);
            String CtyCountryCode;

            using (CountryLookup cl = new CountryLookup(MapPath(StrConn)))
            {
                try
                {
                    CtyCountryCode = cl.lookupCountryCode(Request.ServerVariables["REMOTE_ADDR"]);
                    //CtyCountryCode = cl.lookupCountryCode("81.192.229.1");
                    if (CtyCountryCode.Contains("--"))
                    {
                        CtyCountryCode = "US";//string.Empty;
                    }
                }
                catch
                {
                    CtyCountryCode = string.Empty;
                }
                if (!string.IsNullOrEmpty(CtyCountryCode))
                {
                    Src.SelectCommand = "SELECT [CoumtryCode], [Prefix] FROM [Cty] WHERE ([CoumtryCode] = ?)";
                    Src.SelectParameters["CoumtryCode"].DefaultValue = CtyCountryCode;
                    DataView dv = (DataView)Src.Select(DataSourceSelectArguments.Empty);
                    if (dv.Count > 1)
                    {//get country name and try again
                        String CtyName;

                        try
                        {
                            CtyName = cl.lookupCountryName(Request.ServerVariables["REMOTE_ADDR"]);
                            //CtyName = cl.lookupCountryName("81.192.229.1");
                            if (CtyName.Contains("N/A"))
                            {
                                CtyName = string.Empty;
                            }
                        }
                        catch
                        {
                            CtyName = string.Empty;
                        }
                        if (!string.IsNullOrEmpty(CtyName))
                        {
                            dv.Dispose();
                            Src.SelectCommand = "SELECT [CoumtryCode], [Prefix] FROM [Cty] WHERE ([CoumtryCode] = ?) " +
                                "AND [Country] Like \"" + CtyName + "%\"";
                            Src.SelectParameters["CoumtryCode"].DefaultValue = CtyCountryCode;
                            dv = (DataView)Src.Select(DataSourceSelectArguments.Empty);
                        }
                    }
                    foreach (DataRowView drv1 in dv)
                    {
                        string sPrefix = drv1["Prefix"].ToString();
                        c = sPrefix[0];
                    }
                }
            }
            return c;
        }


        protected bool FillDataList(DataList dl, ContestLogInfo CtestLoginfo, char PanHdr, TextBox Tb, string CatFilter)
        {
            bool tbChanged = false;
            DataView dvContest;
            string sConn = string.Format(ConfigurationManager.ConnectionStrings["LogEntryInfoConnectionString"].ConnectionString,
                CtestLoginfo.ContestInfo.DBName);

            ContestCallsSqlDataSource.ConnectionString = sConn;
            string sFilter;
            //Get all CallIDS from all contests in weblog.mdb
            if (PanHdr == '0')
	        {
                //sFilter = "[123456789]";  //SQL
                //sFilter = "[1-9]";  //does not work in filterexpression
                ContestCallsSqlDataSource.FilterExpression = CatFilter;
                ContestCallsSqlDataSource.SelectCommand = "SELECT [Call], [CatOprID], [CatTxID], [CatAssisted], [CatBandID], [CatPowerID] FROM [CqwwEntry] WHERE [Call]  LIKE '[1-9]%' ORDER BY [Call]";
                dvContest = (DataView)ContestCallsSqlDataSource.Select(DataSourceSelectArguments.Empty);
                //restore select
                ContestCallsSqlDataSource.SelectCommand = "SELECT [Call], [CatOprID], [CatTxID], [CatAssisted], [CatBandID], [CatPowerID] FROM [CqwwEntry] ORDER BY [Call]";
            }
            else
            {
                sFilter = string.Format("{0}", PanHdr);
                if (CatFilter != string.Empty)
                {
                    ContestCallsSqlDataSource.FilterExpression = "[Call]  LIKE '" + sFilter + "%'  AND " + CatFilter;
                    //ContestCallsSqlDataSource.FilterExpression = CatFilter;
                }
                else
                {
                    ContestCallsSqlDataSource.FilterExpression = "[Call]  LIKE '" + sFilter + "%'";
                }
                
                dvContest = (DataView)ContestCallsSqlDataSource.Select(DataSourceSelectArguments.Empty);
            }

            dl.DataSource = dvContest;
            dl.DataBind();
            //Check if TExtBox call is in this contest, If not clear TB
            if (Tb.Text != "")
            {
                LogEntryInfoSqlDataSource.ConnectionString = string.Format(ConfigurationManager.ConnectionStrings["LogEntryInfoConnectionString"].ConnectionString,
                    CtestLoginfo.ContestInfo.DBName);
                LogEntryInfoSqlDataSource.FilterExpression = CatFilter;
                LogEntryInfoSqlDataSource.SelectParameters[0].DefaultValue =  Tb.Text;
                dvContest = (DataView)LogEntryInfoSqlDataSource.Select(DataSourceSelectArguments.Empty);
                if (dvContest.Count != 1)
                {
                    Tb.Text = "";
                    CtestLoginfo.Call = "";
                    tbChanged = true;
                }
                //Now check f the 
                //dvContest.Sort = "Call";
                //if (dvContest.Find(Tb.Text) == -1)
                //{
                //    Tb.Text = "";
                //    tbChanged = true; 
                //}
                }
             return tbChanged;
        }


        protected DataView FillDataView()
        {
            DataTable dt = new DataTable();
            DataColumn column1 = new DataColumn();
            column1.DataType = System.Type.GetType("System.Int32");
            column1.ColumnName = "ID";
            column1.AutoIncrement = true;
            column1.AutoIncrementSeed = 1;
            column1.AutoIncrementStep = 1;
            column1.Caption = "ID";

            dt.Columns.Add(column1);
            dt.Columns.Add("Call", Type.GetType("System.String"));

            for (int k = 1; k < 100; k++)
            {
                DataRow dr  = dt.NewRow();
                dr[1] = "WB6ABC/KH" + (k % 10).ToString();
                dt.Rows.Add(dr);
            }
            return (new DataView(dt));

        }

        protected void SaveQSOFilterSQL()
        {
            if (Session["QSOLogFilter"] == null)
            {
              QSOLogFilter QSOLogFilter = new QSOLogFilter();
              Session.Add("QSOLogFilter",QSOLogFilter);
            }
            ((QSOLogFilter)Session["QSOLogFilter"]).QBndID = byte.Parse(DDLLBnd.SelectedValue);
            ((QSOLogFilter)Session["QSOLogFilter"]).QConID = byte.Parse(DDLLCon.SelectedValue);
            ((QSOLogFilter)Session["QSOLogFilter"]).QCouID = DDLLCou.SelectedValue;
            ((QSOLogFilter)Session["QSOLogFilter"]).QZoneID = byte.Parse(DDLLZone.SelectedValue);
            ((QSOLogFilter)Session["QSOLogFilter"]).QsoCB = QsoCB.Checked;
            SerializeToXmlandSave(SessionFields.QSOLogFilter);

        }


        protected QSOLogFilter getQSOFilter()
        {
            QSOLogFilter Qfilter = new QSOLogFilter();
            Qfilter.Filter = string.Empty;
            Qfilter.QBndID =  byte.Parse(DDLLBnd.SelectedValue);
            Qfilter.QConID = byte.Parse(DDLLCon.SelectedValue);
            Qfilter.QCouID = DDLLCou.SelectedValue;
            Qfilter.QZoneID = byte.Parse(DDLLZone.SelectedValue);
            Qfilter.QsoCB = QsoCB.Checked;
            if (!Qfilter.QsoCB)
            {
                if (DDLLBnd.SelectedItem.Text != "ALL")
                {
                    Qfilter.Filter = "QBand = " + DDLLBnd.SelectedValue + " ";
                }
                if (DDLLCon.SelectedItem.Text != "ALL")
                {
                    if (!string.IsNullOrEmpty(Qfilter.Filter))
                    {
                        Qfilter.Filter += " AND ";
                    }
                    Qfilter.Filter += " ContinentID = " + DDLLCon.SelectedValue + " ";
                }
                if (DDLLZone.SelectedItem.Text != "ALL")
                {
                    if (!string.IsNullOrEmpty(Qfilter.Filter))
                    {
                        Qfilter.Filter += " AND ";
                    }
                    Qfilter.Filter += " QRxZone = " + DDLLZone.SelectedValue + " ";
                }
                if (DDLLCou.Items.Count != 0 && DDLLCou.SelectedItem.Text != "ALL Countries")
                {
                    if (!string.IsNullOrEmpty(Qfilter.Filter))
                    {
                        Qfilter.Filter += " AND ";
                    }
                    Qfilter.Filter += " Prefix = '" + DDLLCou.SelectedValue + "' ";
                }
            }
            return Qfilter;
        }


        protected void SetMixedYears()
        {
            MixedYears = true;
            if ((CBCall1.Checked && CBCall2.Checked) || (CBCall1.Checked && CBCall3.Checked) ||
                (CBCall2.Checked && CBCall3.Checked))
            {
                MixedYears = false;
            }
            else if (CBCall1.Checked)
            {
                if (CtestLoginfo2.ContestInfo.ContestID == CtestLoginfo3.ContestInfo.ContestID)
                {
                    MixedYears = false;
                }
            }
            else if (CBCall2.Checked)
            {
                if (CtestLoginfo1.ContestInfo.ContestID == CtestLoginfo3.ContestInfo.ContestID)
                {
                    MixedYears = false;
                }
            }
            else if (CBCall3.Checked)
            {
                if (CtestLoginfo1.ContestInfo.ContestID == CtestLoginfo2.ContestInfo.ContestID)
                {
                    MixedYears = false;
                }
            }
            else if (CtestLoginfo1.ContestInfo.ContestID == CtestLoginfo2.ContestInfo.ContestID && CtestLoginfo1.ContestInfo.ContestID == CtestLoginfo3.ContestInfo.ContestID)
            {
                MixedYears = false;
            }
        }


        
        protected void RefreshCat_Click(object sender, EventArgs e)
        {
            LoadQSORateChart();
        }

        protected void Refresh_Click(object sender, EventArgs e)
        {
            LoadQSORateChart();
        }

        protected void DefaultAll_Click(object sender, EventArgs e)
        {
            TBCall1.Text = "CN2R";
            //CtestLoginfo1.Call = TBCall1.Text;
            TBCall2.Text = "CN2AA";
            //CtestLoginfo2.Call = TBCall2.Text;
            TBCall3.Text = "CN3A";
            //CtestLoginfo3.Call = TBCall3.Text;
            CBCall1.Checked = false;
            CBCall2.Checked = false;
            CBCall3.Checked = false;
            DDLTC1.SelectedValue = DDLTC2.SelectedValue = DDLTC3.SelectedValue = "CQWWSSB2015";
            //needed before LoadQSORateChart()
            UpdateTabDatalist(TabC1, CtestLoginfo1, DDLTC1, TBCall1, "Call1", CBCall1);
            UpdateTabDatalist(TabC2, CtestLoginfo2, DDLTC2, TBCall2, "Call2", CBCall2);
            UpdateTabDatalist(TabC3, CtestLoginfo3, DDLTC3, TBCall3, "Call3", CBCall3);
            UpdateCallSessionObj(out CtestLoginfo1, DDLTC1, TBCall1.Text, "Call1", CBCall1);
            UpdateCallSessionObj(out CtestLoginfo2, DDLTC2, TBCall2.Text, "Call2", CBCall2);
            UpdateCallSessionObj(out CtestLoginfo3, DDLTC3, TBCall3.Text, "Call3", CBCall3);
            SetMixedYears();
            QSODef_Click(null, e);
            ContestViewFilterDef_Click(null, e);
            CatDef_Click(sender, e);
            UpdatePaneX.Update();
            UpdatePaneY.Update();
            UpdatePanelQSO.Update();
            //Call1UpdatePanel.Update();
            UpdatePanel1.Update();
            //Call1UpdatePanel.Update();
            //Call2UpdatePanel.Update();
            //Call3UpdatePanel.Update();
        }

        protected void QSODef_Click(object sender, EventArgs e)
        {
            DDLLBnd.SelectedIndex = 0;
            if (DDLLCou != null && DDLLCou.Items.Count != 0)
            {
                DDLLCou.SelectedIndex = 0;
            }
            DDLLCon.SelectedIndex = 0;
            DDLLZone.SelectedIndex = 0;
            QsoCB.Checked = false;
            SaveQSOFilterSQL();
            if (sender != null)
            {
                LoadQSORateChart();
            }
        }

        protected void CatDef_Click(object sender, EventArgs e)
        {
            DDLOpr.SelectedIndex = 0; //ALL
            DDLOpr.Enabled = true;
            DDLPwr.SelectedIndex = 0; //ALL
            DDLPwr.Enabled = false;//needs to be single-op
            DDLBnd.SelectedIndex = 0; //ALL
            DDLBnd.Enabled = false; //needs to be single-op
            DDLAssist.SelectedIndex = 0; //ALL
            DDLAssist.Enabled = false; //needs to be single-op
            DDLTx.SelectedIndex = 0; //ALL
            DDLTx.Enabled = false; //needs to be multi-op
            CategoryCB.Checked = false;


            if (sender != null)
            {
                LoadQSORateChart();
            }
            //We have a small poblem
            //The  UpdateCallSessionObj() is called on non postback PageLoad
            //This function may have just updated the DB
            //We need to update it again because the CategoryLogInfo is stored in each ContestLogInfo
            SaveContestLogInfoSQL(SessionFields.ContestLogInfo1);
            SaveContestLogInfoSQL(SessionFields.ContestLogInfo2);
            SaveContestLogInfoSQL(SessionFields.ContestLogInfo3);
        }

        protected void ContestViewFilterDef_Click(object sender, EventArgs e)
        {
            ChartFuncDDL.SelectedIndex = 0;
            IntervalDDL.SelectedIndex = 0;
            ViewDDL.SelectedIndex = 0;
            DDLVStart.SelectedIndex = 0;
            DDLVHours.SelectedIndex = 0;
            SaveContestViewFilterSQL();
            if (sender != null)
            {
                LoadQSORateChart();
            }
        }

        protected void SaveContestLogInfoSQL(SessionFields SessionField)
        {
            string SessionVar = string.Empty;
            TextBox CallTextbox = null;
            CheckBox CallCheckBox = null;

            switch (SessionField)
	        {
		        case SessionFields.ContestLogInfo1:
                    SessionVar = "Call1";
                    if (Session[SessionVar] == null)
                    {
                        Session.Add(SessionVar, CtestLoginfo1);
                    }
                    CallTextbox = TBCall1;
                    CallCheckBox = CBCall1;
                    break;
                case SessionFields.ContestLogInfo2:
                    SessionVar = "Call2";
                    if (Session[SessionVar] == null)
                    {
                        Session.Add(SessionVar, CtestLoginfo2);
                    }
                    CallTextbox = TBCall2;
                    CallCheckBox = CBCall2;
                   break;
                case SessionFields.ContestLogInfo3:
                    SessionVar = "Call3";
                    if (Session[SessionVar] == null)
                    {
                        Session.Add(SessionVar, CtestLoginfo3);
                    }
                    CallTextbox = TBCall3;
                    CallCheckBox = CBCall3;
                   break;
                case SessionFields.QSOLogFilter:
                    break;
                case SessionFields.ContestViewFilter:
                    break;
                case SessionFields.All:
                    break;
                default:
                    break;
	        }
            if (SessionVar != null && ((ContestLogInfo)Session[SessionVar]).CatLogInfo != null)
            {
                ((ContestLogInfo)Session[SessionVar]).CatLogInfo.LogCallID = (byte)DDLOpr.SelectedIndex;
                ((ContestLogInfo)Session[SessionVar]).CatPwrID = (byte)DDLPwr.SelectedIndex;
                ((ContestLogInfo)Session[SessionVar]).CatBndID =(byte)DDLBnd.SelectedIndex;
                ((ContestLogInfo)Session[SessionVar]).CatAstID = (byte)DDLAssist.SelectedIndex;
                ((ContestLogInfo)Session[SessionVar]).CatTxID = (byte)DDLTx.SelectedIndex;
                ((ContestLogInfo)Session[SessionVar]).CategoryCBID = CategoryCB.Checked;
                ((ContestLogInfo)Session[SessionVar]).Call = CallTextbox.Text;
                ((ContestLogInfo)Session[SessionVar]).CBCall = CallCheckBox.Checked;
                SerializeToXmlandSave(SessionField);
            }
        }



        protected void GetQuery(string ChartID, ContestLogInfo CtestLogInfo, ChartAreaInfo ChartAreaInfo, string sChartFunction, out ContestViewParms ContestViewParms )
        {
            string sIntvTime = "IntvTime";
            string sQCnt = "N";
            string sQCnt2;
            string sQCnt3;
            string SerTablename = string.Empty; 
            QSOLogFilter QSOFilter;
            QSOFilter = getQSOFilter();
            ContestViewParms = new ContestViewParms(); //dummy

            string whereClause = string.Empty;
            SerTablename = CtestLogInfo.Call + ChartID + CtestLogInfo.ContestInfo.ContestID + "_S" + CtestLogInfo.ContestInfo.basedstartTime.ToOADate() + "_E" +
                CtestLogInfo.ContestInfo.basedendTime.ToOADate() + "_" + sIntvTime + string.Format("_I{0}", ChartAreaInfo.ChartPointtInterval) +
                string.Format("_M{0}", ChartAreaInfo.MixedYears + "_T" + ChartAreaInfo.charttype + "_T" + sChartFunction);

            if (QSOFilter.QsoCB != true && QSOFilter.Filter != string.Empty)
            {
                SerTablename += string.Format("_Qb{0}_QC{1}_Qc{2}_QZ{3}_QE{4}", QSOFilter.QBndID,
                    QSOFilter.QConID, QSOFilter.QCouID, QSOFilter.QZoneID, QSOFilter.QsoCB);
                whereClause = " WHERE " + QSOFilter.Filter;
            }


            string colTime = string.Format("{0}.QDateTime", CtestLogInfo.ContestInfo.ContestTblName);
            string QSOQuery = string.Empty;
            switch (sChartFunction)
            {
                case "QSO  Rate":
                    //string colTime = string.Format("{0}.Time", CtestLogInfo.ContestInfo.ContestTblName);
                    //string colContestID = string.Format("{0}.ContestID", CtestLogInfo.ContestInfo.ContestTblName);
                    //string QSOQuery = @"SELECT [Time1] AS " + IntvTime + ", Sum(Qry5minintervals.N) AS " + sQCnt +
                    //         " FROM (SELECT   Format([" + colTime + "],'Short Date') & ' ' " +
                    //         "& Format(DatePart('h',[" + colTime + "]),'00') & ':' " +
                    //         "& Format(Int(DatePart('n',[" + colTime + "])/" + Interval + ")*" + Interval + ",'00')AS [Time1] , Count(*) AS N" +
                    //          " FROM QSOs" +
                    //          " WHERE (((" + colContestID + ")='" + CtestLogInfo.ContestInfo.ContestID + "'))" +
                    //          " GROUP BY  [" + colTime + "] ) AS Qry5minintervals" +
                    //          " GROUP BY [Time1] ";
                    QSOQuery = @"SELECT [Time1] AS " + sIntvTime + ", Sum(Qry5minintervals.N) AS " + sQCnt +
                             " FROM (SELECT   Format([" + colTime + "],'Short Date') & ' ' " +
                             "& Format(DatePart('h',[" + colTime + "]),'00') & ':' " +
                             "& Format(Int(DatePart('n',[" + colTime + "])/" + ChartAreaInfo.ChartPointtInterval + ")*" +
                             ChartAreaInfo.ChartPointtInterval + ",'00')AS [Time1] , Count(*) AS N" +
                              " FROM " + CtestLogInfo.ContestInfo.ContestTblName +
                               " INNER JOIN QCountries ON " + CtestLogInfo.ContestInfo.ContestTblName + ".ID = QCountries.ID " +
                              whereClause +
                        //" WHERE (((" + colContestID + ")='" + CtestLogInfo.ContestInfo.ContestID + "'))" +
                              " GROUP BY  [" + colTime + "] ) AS Qry5minintervals" +
                              " GROUP BY [Time1] ";
                        ContestViewParms = new ContestViewParms(sChartFunction, SerTablename, sIntvTime, sQCnt, "QSO Rate",
                        "QSOs Per " + ChartAreaInfo.ChartPointtInterval.ToString() + " Minures", QSOQuery, GetDataOLETable, false);
                    break;
                case "QSO  Sum":
                    QSOQuery = @"SELECT [Time1] AS " + sIntvTime + ", Sum(Qry5minintervals.N) AS " + sQCnt +
                             " FROM (SELECT   Format([" + colTime + "],'Short Date') & ' ' " +
                             "& Format(DatePart('h',[" + colTime + "]),'00') & ':' " +
                             "& Format(Int(DatePart('n',[" + colTime + "])/" + ChartAreaInfo.ChartPointtInterval + ")*" +
                             ChartAreaInfo.ChartPointtInterval + ",'00')AS [Time1] , Count(*) AS N" +
                              " FROM " + CtestLogInfo.ContestInfo.ContestTblName +
                               " INNER JOIN QCountries ON " + CtestLogInfo.ContestInfo.ContestTblName + ".ID = QCountries.ID " +
                              whereClause +
                              " GROUP BY  [" + colTime + "] ) AS Qry5minintervals" +
                              " GROUP BY [Time1] ";
                    ContestViewParms = new ContestViewParms(sChartFunction, SerTablename, sIntvTime, sQCnt, "QSO Sum",
                    "QSOs Per " + ChartAreaInfo.ChartPointtInterval.ToString() + " Minutes", QSOQuery, GetDataOLETable3, true);
                    break;
                case "Zone  Rate":
                    //if (whereClause == string.Empty) 
                    //{
                    //    whereClause = " WHERE " + CtestLogInfo.ContestInfo.ContestTblName + ".QZoneMult= 1";
                    //}else
                    //{
                    //    whereClause += " AND " + CtestLogInfo.ContestInfo.ContestTblName + ".QZoneMult= 1";

                    //}
                    QSOQuery = GenerateQuery(CtestLogInfo, ChartAreaInfo, sIntvTime, sQCnt, colTime, whereClause, "QZoneMult");

                    //        SELECT [Time1], Sum(Qryminintervals.N) AS Zones
                    //FROM (SELECT Format([QSOs.Time],"Short Date") & " " & Format(DatePart("h",[QSOs.Time]),"00") & ":" & Format(Int(DatePart("n",[QSOs.Time])/15)*15,"00") AS Time1, Count(*) AS N
                    //FROM QSOs
                    //WHERE (((QSOs.ContestID)="CQWWSSB2009") And ((QSOs.Mlt1)<>""))
                    //GROUP BY [QSOs.Time], [QSOs.Mlt2] ) AS Qryminintervals
                    //GROUP BY [Time1];
                    ContestViewParms = new ContestViewParms(sChartFunction, SerTablename, sIntvTime, sQCnt, "Zone Rate",
                        "Zones Per " + ChartAreaInfo.ChartPointtInterval.ToString() + " Minutes", QSOQuery, GetDataOLETable, false);
                    break;
                case "Zone  Sum":
                    QSOQuery = GenerateQuery(CtestLogInfo, ChartAreaInfo, sIntvTime, sQCnt, colTime, whereClause, "QZoneMult");
                    ContestViewParms = new ContestViewParms(sChartFunction, SerTablename, sIntvTime, sQCnt, "Zone Sum",
                        "Zones Per " + ChartAreaInfo.ChartPointtInterval.ToString() + " Minutes", QSOQuery, GetDataOLETable3, true);
                   break;
                case "Country  Rate":
                    // if (whereClause == string.Empty) 
                    //{
                    //    whereClause = " WHERE " + CtestLogInfo.ContestInfo.ContestTblName + ".QCountryMult= 1";
                    //}else
                    //{
                    //    whereClause += " AND " + CtestLogInfo.ContestInfo.ContestTblName + ".QCountryMult= 1";

                    //}
                     QSOQuery = GenerateQuery(CtestLogInfo, ChartAreaInfo, sIntvTime, sQCnt, colTime, whereClause, "QCountryMult");
                    //QSOQuery = @"SELECT [Time1] AS " + sIntvTime + ", Sum(Qry5minintervals.N) AS " + sQCnt +
                    //        " FROM (SELECT   Format([" + colTime + "],'Short Date') & ' ' " +
                    //        "& Format(DatePart('h',[" + colTime + "]),'00') & ':' " +
                    //        "& Format(Int(DatePart('n',[" + colTime + "])/" + ChartAreaInfo.ChartPointtInterval + ")*" +
                    //        ChartAreaInfo.ChartPointtInterval + ",'00')AS [Time1] , Count(*) AS N" +
                    //         " FROM " + CtestLogInfo.ContestInfo.ContestTblName +
                    //          " INNER JOIN QCountries ON " + CtestLogInfo.ContestInfo.ContestTblName + ".ID = QCountries.ID " +
                    //         whereClause +
                    //    //" WHERE (((" + colContestID + ")='" + CtestLogInfo.ContestInfo.ContestID + "'))" +
                    //         " GROUP BY  [" + colTime + "], [" + CtestLogInfo.ContestInfo.ContestTblName + ".QCountryMult] ) AS Qry5minintervals" +
                    //         " GROUP BY [Time1] ";
                     ContestViewParms = new ContestViewParms(sChartFunction, SerTablename, sIntvTime, "N", "Country Rate",
                        "Countries Per " + ChartAreaInfo.ChartPointtInterval.ToString() + " Mins", QSOQuery, GetDataOLETable, false);
                  break;
                case "Country  Sum":
                  QSOQuery = GenerateQuery(CtestLogInfo, ChartAreaInfo, sIntvTime, sQCnt, colTime, whereClause, "QCountryMult");
                  ContestViewParms = new ContestViewParms(sChartFunction, SerTablename, sIntvTime, "N", "Country Sum",
                     "Countries Per " + ChartAreaInfo.ChartPointtInterval.ToString() + " Mins", QSOQuery, GetDataOLETable3, true);
                  break;
                case "Point  Rate":
                  QSOQuery = GenerateQuery(CtestLogInfo, ChartAreaInfo, sIntvTime, sQCnt, colTime, whereClause, "QPoints");
                     //QSOQuery = @"SELECT [Time1] AS " + sIntvTime + ", Sum(Qry5minintervals.N) AS " + sQCnt +
                     //        " FROM (SELECT   Format([" + colTime + "],'Short Date') & ' ' " +
                     //        "& Format(DatePart('h',[" + colTime + "]),'00') & ':' " +
                     //        "& Format(Int(DatePart('n',[" + colTime + "])/" + ChartAreaInfo.ChartPointtInterval + ")*" +
                     //        ChartAreaInfo.ChartPointtInterval + ",'00')AS [Time1] , Sum([" + CtestLogInfo.ContestInfo.ContestTblName + ".QPoints]) AS N" +
                     //         " FROM " + CtestLogInfo.ContestInfo.ContestTblName +
                     //          " INNER JOIN QCountries ON " + CtestLogInfo.ContestInfo.ContestTblName + ".ID = QCountries.ID " +
                     //         whereClause +
                     //   //" WHERE (((" + colContestID + ")='" + CtestLogInfo.ContestInfo.ContestID + "'))" +
                     //         " GROUP BY  [" + colTime + "] ) AS Qry5minintervals" +
                     //         " GROUP BY [Time1] ";
                     ContestViewParms = new ContestViewParms(sChartFunction, SerTablename, sIntvTime, sQCnt, "Point Rate",
                        "Points Per " + ChartAreaInfo.ChartPointtInterval.ToString() + " Minutes", QSOQuery, GetDataOLETable, false);
                    break;
                case "Point  Sum":
                    QSOQuery = GenerateQuery(CtestLogInfo, ChartAreaInfo, sIntvTime, sQCnt, colTime, whereClause, "QPoints");
                    ContestViewParms = new ContestViewParms(sChartFunction, SerTablename, sIntvTime, sQCnt, "Point Sum",
                       "Points Per " + ChartAreaInfo.ChartPointtInterval.ToString() + " Minutes", QSOQuery, GetDataOLETable3, true);
                    break;
                case "Mult  Rate":
                    QSOQuery = @"SELECT [Time1] AS " + sIntvTime + ", Sum(Qry5minintervals.N) AS " + sQCnt +
                            " FROM (SELECT   Format([" + colTime + "],'Short Date') & ' ' " +
                            "& Format(DatePart('h',[" + colTime + "]),'00') & ':' " +
                            "& Format(Int(DatePart('n',[" + colTime + "])/" + ChartAreaInfo.ChartPointtInterval + ")*" +
                            ChartAreaInfo.ChartPointtInterval + ",'00')AS [Time1] ," +
                             " SUM([" + CtestLogInfo.ContestInfo.ContestTblName + ".QZoneMult]  + [" + CtestLogInfo.ContestInfo.ContestTblName + ".QCountryMult] ) AS N" +
                             " FROM " + CtestLogInfo.ContestInfo.ContestTblName +
                              " INNER JOIN QCountries ON " + CtestLogInfo.ContestInfo.ContestTblName + ".ID = QCountries.ID " +
                             whereClause +
                        //" WHERE (((" + colContestID + ")='" + CtestLogInfo.ContestInfo.ContestID + "'))" +
                             " GROUP BY  [" + colTime + "] ) AS Qry5minintervals" +
                             " GROUP BY [Time1] ";
                    ContestViewParms = new ContestViewParms(sChartFunction, SerTablename, sIntvTime, sQCnt, "Mult Rate",
                       "Mults Per " + ChartAreaInfo.ChartPointtInterval.ToString() + " Minutes", QSOQuery, GetDataOLETable, false);
                    break;
                case "Mult  Sum":
                    QSOQuery = @"SELECT [Time1] AS " + sIntvTime + ", Sum(Qry5minintervals.N) AS " + sQCnt +
                            " FROM (SELECT   Format([" + colTime + "],'Short Date') & ' ' " +
                            "& Format(DatePart('h',[" + colTime + "]),'00') & ':' " +
                            "& Format(Int(DatePart('n',[" + colTime + "])/" + ChartAreaInfo.ChartPointtInterval + ")*" +
                            ChartAreaInfo.ChartPointtInterval + ",'00')AS [Time1] ," +
                             " SUM([" + CtestLogInfo.ContestInfo.ContestTblName + ".QZoneMult]  + [" + CtestLogInfo.ContestInfo.ContestTblName + ".QCountryMult] ) AS N" +
                             " FROM " + CtestLogInfo.ContestInfo.ContestTblName +
                              " INNER JOIN QCountries ON " + CtestLogInfo.ContestInfo.ContestTblName + ".ID = QCountries.ID " +
                             whereClause +
                        //" WHERE (((" + colContestID + ")='" + CtestLogInfo.ContestInfo.ContestID + "'))" +
                             " GROUP BY  [" + colTime + "] ) AS Qry5minintervals" +
                             " GROUP BY [Time1] ";
                    ContestViewParms = new ContestViewParms(sChartFunction, SerTablename, sIntvTime, sQCnt, "Mult Sum",
                       "Mults Per " + ChartAreaInfo.ChartPointtInterval.ToString() + " Minutes", QSOQuery, GetDataOLETable3, true);
                    break;
                case "Score  Rate":
                    QSOQuery = @"SELECT [Time1] AS " + sIntvTime + ", Sum(Qry5minintervals.N) * Sum(Qry5minintervals.Pts) AS " + sQCnt +
                            " FROM (SELECT   Format([" + colTime + "],'Short Date') & ' ' " +
                            "& Format(DatePart('h',[" + colTime + "]),'00') & ':' " +
                            "& Format(Int(DatePart('n',[" + colTime + "])/" + ChartAreaInfo.ChartPointtInterval + ")*" +
                            ChartAreaInfo.ChartPointtInterval + ",'00')AS [Time1] ," +
                             " SUM([" + CtestLogInfo.ContestInfo.ContestTblName + ".QZoneMult]  + [" + CtestLogInfo.ContestInfo.ContestTblName + ".QCountryMult] ) AS N," +
                             " SUM([" + CtestLogInfo.ContestInfo.ContestTblName + ".QPoints]) AS Pts " +
                             " FROM " + CtestLogInfo.ContestInfo.ContestTblName +
                              " INNER JOIN QCountries ON " + CtestLogInfo.ContestInfo.ContestTblName + ".ID = QCountries.ID " +
                             whereClause +
                        //" WHERE (((" + colContestID + ")='" + CtestLogInfo.ContestInfo.ContestID + "'))" +
                             " GROUP BY  [" + colTime + "] ) AS Qry5minintervals" +
                             " GROUP BY [Time1] ";
                    ContestViewParms = new ContestViewParms(sChartFunction, SerTablename, sIntvTime, sQCnt, "Score Rate",
                       "Score Per " + ChartAreaInfo.ChartPointtInterval.ToString() + " Mins", QSOQuery, GetDataOLETable, false);
                    break;
                case "Score  Sum":
                        sQCnt2 = "Mults";
                        sQCnt3 = "Points";
                        QSOQuery = @"SELECT [Time1] AS " + sIntvTime + ", Sum(Qry5minintervals.N) AS " + sQCnt2 + ", Sum(Qry5minintervals.Pts) AS " + sQCnt3 +
                            " FROM (SELECT   Format([" + colTime + "],'Short Date') & ' ' " +
                            "& Format(DatePart('h',[" + colTime + "]),'00') & ':' " +
                            "& Format(Int(DatePart('n',[" + colTime + "])/" + ChartAreaInfo.ChartPointtInterval + ")*" +
                            ChartAreaInfo.ChartPointtInterval + ",'00')AS [Time1] ," +
                             " SUM([" + CtestLogInfo.ContestInfo.ContestTblName + ".QZoneMult]  + [" + CtestLogInfo.ContestInfo.ContestTblName + ".QCountryMult] ) AS N," +
                             " SUM([" + CtestLogInfo.ContestInfo.ContestTblName + ".QPoints]) AS Pts " +
                             " FROM " + CtestLogInfo.ContestInfo.ContestTblName +
                              " INNER JOIN QCountries ON " + CtestLogInfo.ContestInfo.ContestTblName + ".ID = QCountries.ID " +
                             whereClause +
                        //" WHERE (((" + colContestID + ")='" + CtestLogInfo.ContestInfo.ContestID + "'))" +
                             " GROUP BY  [" + colTime + "] ) AS Qry5minintervals" +
                             " GROUP BY [Time1] ";
                        ContestViewParms = new ContestViewParms(sChartFunction, SerTablename, sIntvTime, sQCnt, "Score Sum",
                            "Score Per " + ChartAreaInfo.ChartPointtInterval.ToString() + " Mins", QSOQuery, GetDataOLETable2, true);
                        ContestViewParms.sQCnt2 = sQCnt2;
                        ContestViewParms.sQCnt3 = sQCnt3;
                      break;
                default:
                    break;
            }
        }

        public string GenerateQuery(ContestLogInfo CtestLogInfo, ChartAreaInfo ChartAreaInfo, string sIntvTime,
            string sQCnt, string colTime, string whereClause, string sumField)
        {
            string QSOQuery = string.Empty;
            QSOQuery = @"SELECT [Time1] AS " + sIntvTime + ", Sum(Qry5minintervals.N) AS " + sQCnt +
                    " FROM (SELECT   Format([" + colTime + "],'Short Date') & ' ' " +
                    "& Format(DatePart('h',[" + colTime + "]),'00') & ':' " +
                    "& Format(Int(DatePart('n',[" + colTime + "])/" + ChartAreaInfo.ChartPointtInterval + ")*" +
                    ChartAreaInfo.ChartPointtInterval + ",'00')AS [Time1] , Sum([" + CtestLogInfo.ContestInfo.ContestTblName + "." + sumField + "]) AS N" +
                     " FROM " + CtestLogInfo.ContestInfo.ContestTblName +
                      " INNER JOIN QCountries ON " + CtestLogInfo.ContestInfo.ContestTblName + ".ID = QCountries.ID " +
                     whereClause +
                //" WHERE (((" + colContestID + ")='" + CtestLogInfo.ContestInfo.ContestID + "'))" +
                     " GROUP BY  [" + colTime + "] ) AS Qry5minintervals" +
                     " GROUP BY [Time1] ";
            return QSOQuery;
        }
        
        public DataTable GetDataOLETable(ContestViewParms ContestViewParms, string sConnectionString)
        {
            OleDbConnection oConn = new OleDbConnection();
            DataTable oRS = new DataTable();
            oRS.Columns.Add(ContestViewParms.sIntvTime, typeof(DateTime));
            oRS.Columns.Add(ContestViewParms.sQCnt, typeof(int));
            using (oConn)
            {
                try
                {
                    oConn.ConnectionString = sConnectionString;
                    oConn.Open();
                    OleDbDataAdapter oDA = new OleDbDataAdapter(ContestViewParms.sQSOQuery, oConn);
                    oDA.Fill(oRS);
                    //oConn.Close();
                }
                catch (Exception e) { }
                finally { if (oConn.State == ConnectionState.Open) { oConn.Close(); } }
            }
            return oRS;
        }

        public DataTable GetDataOLETable2(ContestViewParms ContestViewParms, string sConnectionString)
        {

            OleDbConnection oConn = new OleDbConnection();
            DataTable oRS = new DataTable();
            oRS.Columns.Add(ContestViewParms.sIntvTime, typeof(DateTime));
            oRS.Columns.Add(ContestViewParms.sQCnt, typeof(int));
            oRS.Columns.Add(ContestViewParms.sQCnt2, typeof(int));
            oRS.Columns.Add(ContestViewParms.sQCnt3, typeof(int));
            oRS.Columns.Add("Score", typeof(int));
            using (oConn)
            {
                try
                {
                    oConn.ConnectionString = sConnectionString;
                    oConn.Open();
                    OleDbDataAdapter oDA = new OleDbDataAdapter(ContestViewParms.sQSOQuery, oConn);
                    oDA.Fill(oRS);
                    //oConn.Close();
                }
                catch (Exception e) { }
                finally { if (oConn.State == ConnectionState.Open) { oConn.Close(); } }
            }
            int sumMults = 0;
            int sumPoints = 0;
            foreach (DataRow dr in oRS.Rows)
            {
                sumMults += Convert.ToInt32(dr[ContestViewParms.sQCnt2]);
                sumPoints += Convert.ToInt32(dr[ContestViewParms.sQCnt3]);
                dr[ContestViewParms.sQCnt] = sumMults * sumPoints;
            }
            return oRS;
        }

        public DataTable GetDataOLETable3(ContestViewParms ContestViewParms, string sConnectionString)
        {
            OleDbConnection oConn = new OleDbConnection();
            DataTable oRS = new DataTable();
            oRS.Columns.Add(ContestViewParms.sIntvTime, typeof(DateTime));
            oRS.Columns.Add(ContestViewParms.sQCnt, typeof(int));
            oRS.Columns.Add("Score", typeof(int));
            using (oConn)
            {
                try
                {
                    oConn.ConnectionString = sConnectionString;
                    oConn.Open();
                    OleDbDataAdapter oDA = new OleDbDataAdapter(ContestViewParms.sQSOQuery, oConn);
                    oDA.Fill(oRS);
                    //oConn.Close();
                }
                catch (Exception e) { }
                finally { if (oConn.State == ConnectionState.Open) { oConn.Close(); } }
            }
            int sum = 0;
            foreach (DataRow dr in oRS.Rows)
            {
                sum += Convert.ToInt32(dr[ContestViewParms.sQCnt]);
                dr[ContestViewParms.sQCnt] = sum;
            }
            return oRS;
        }

        protected void TimeDef_Click(object sender, EventArgs e)
        {
            DDLVStart.SelectedIndex = 0;
            DDLVHours.SelectedIndex = 0;
            SaveContestViewFilterSQL();
            LoadQSORateChart();
        }

        protected void SaveContestViewFilterSQL()
        {
            if (Session["ContestViewFilter"] == null)
            {
                ContestViewFilter ContestViewFilter = new ContestViewFilter();
                Session.Add("ContestViewFilter", ContestViewFilter);
            }
            ((ContestViewFilter)Session["ContestViewFilter"]).ChartFuncDDLID = byte.Parse(ChartFuncDDL.SelectedValue);
            ((ContestViewFilter)Session["ContestViewFilter"]).IntervalDDLID = byte.Parse(IntervalDDL.SelectedValue);
            ((ContestViewFilter)Session["ContestViewFilter"]).ViewDDLID = byte.Parse(ViewDDL.SelectedValue);
            ((ContestViewFilter)Session["ContestViewFilter"]).DDLVStartID = byte.Parse(DDLVStart.SelectedValue);
            ((ContestViewFilter)Session["ContestViewFilter"]).DDLVHoursID = byte.Parse(DDLVHours.SelectedValue);
            SerializeToXmlandSave(SessionFields.ContestViewFilter);

        }

    }
}