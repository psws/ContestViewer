using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using SrvVars;
using System.Drawing;
using System.Configuration;
using System.Data.OleDb;

namespace ContestViewer
{
    public partial class Results : System.Web.UI.Page
    {
        public SrvVars.ServerVars.UAgent BrowserType;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string selTests = string.Empty;
                if (Session["ContestFilter"] != null)
                {
                    selTests = Session["ContestFilter"].ToString();
                }
                ContestSqlDataSource.DataBind();

                LoadContestCheckBoxListCol(testCheckBoxListCol1, "SSB", selTests);
                LoadContestCheckBoxListCol(testCheckBoxListCol2, "CW", selTests);
                //LoadContestCheckBoxListCol(testCheckBoxListCol2, "CQWPX", selTests);
                if (string.IsNullOrEmpty(selTests))
                {
                    testCheckBoxListCol1.Items[0].Selected = true;
                }
                UpdateContestLabels(true);

                string sel = string.Empty;
                if (Session["resCatFilter"] != null)
                {
                    sel = Session["resCatFilter"].ToString();
                }
                CQWWSqlDataSource.SelectCommand =
                    "SELECT DISTINCT [EntryClass] FROM [cqww] ";
                CQWWSqlDataSource.DataBind();
                LoadContestCheckBoxListCat(true, CheckBoxListCatA, sel);
                LoadContestCheckBoxListCat(false, CheckBoxListCatS, sel);

                if (string.IsNullOrEmpty(sel))
                {
                    CheckBoxListCatA.Items[0].Selected = true;
                }
                UpdateContestCats(true);

                CheckBoxListAst.Items[0].Selected = true;
                CBPwr.Attributes["onclick"] = "CBPwrChanged(this,btnChk)";

                UpdatePwrLabels(true);
                UpdateAstLabels(true);
                //this next line does bot work on FF
                //CheckBoxLisPwr.Attributes.Add("onclick", "checkedChanged(this);");
                LoadDDL("Country", "Continent", DDLCty, "DDLChanged", "All Countries");
                UpdateCty(true);
                LoadDDL("Continent", "", DDLCon, "DDLChanged", "All");
                UpdateCon(true);
                LoadDDL("District", "", DDLDis, "DDLChanged", "All");
                UpdateDis(true);

                // capture blur
                //Panel2Div.Attributes["onblur"] = "cT(1,'PcB','Can','btnCon');return false;";
                foreach (ListItem li in CheckBoxLisPwr.Items)
                {
                    li.Attributes["onclick"] = "checkedChanged('CheckBoxLisPwr',btnChk);";
                }
                foreach (ListItem li in CheckBoxListAst.Items)
                {
                    li.Attributes["onclick"] = "checkedChanged('CheckBoxListAst',btnChk);";
                }
               
                switch (BrowserType)
                {
                    case ServerVars.UAgent.UA_Oper:
                        RCECon.Enabled = false;
                        RCECat.Enabled = false;
                        SelContestsButton.Font.Size = FontUnit.Point(9);
                        SelectCat.Font.Size = FontUnit.Point(9);
                        DDLCty.Font.Size = FontUnit.Point(9);
                        DDLConID.Style.Add("height", "28px");
                        Calltxtbox.Attributes.Add("onKeyPress", "callChanged(this ,event);return false;");
                        break;
                    case ServerVars.UAgent.UA_FFox:
                        BtnAddCall1.Font.Size = new FontUnit(".87em");
                        BtnAddCall2.Font.Size = new FontUnit(".87em");
                        BtnAddCall3.Font.Size = new FontUnit(".87em");
                        BtnView.Font.Size = new FontUnit(".87em");
                        BtnCancel.Font.Size = new FontUnit(".87em");
                        CheckBoxLisPwr.Font.Size = FontUnit.Point(7);
                        testCheckBoxListCol1.Font.Size = FontUnit.Point(7);
                        testCheckBoxListCol2.Font.Size = FontUnit.Point(7);
                        DDLCty.Font.Size = FontUnit.Point(7);
                        DDLConID.Style.Add("height", "28px");
                        Calltxtbox.Attributes.Add("onKeyDown", "callChanged(this ,event);return false;");
                        break;
                    case ServerVars.UAgent.UA_Msie:
                        Calltxtbox.Attributes.Add("onKeyDown", "callChanged(this ,event);return false;");
                        break;
                    case ServerVars.UAgent.UA_Chr:
                        BtnAddCall1.Font.Size = new FontUnit(".87em");
                        BtnAddCall2.Font.Size = new FontUnit(".87em");
                        BtnAddCall3.Font.Size = new FontUnit(".87em");
                        BtnView.Font.Size = new FontUnit(".87em");
                        BtnCancel.Font.Size = new FontUnit(".87em");
                        BtnAddCall1.Font.Size = new FontUnit(".87em");
                        Calltxtbox.Attributes.Add("onKeyDown", "callChanged(this ,event);return false;");
                        break;
                    case ServerVars.UAgent.UA_Saf:
                        BtnAddCall1.Font.Size = new FontUnit(".87em");
                        BtnAddCall2.Font.Size = new FontUnit(".87em");
                        BtnAddCall3.Font.Size = new FontUnit(".87em");
                        BtnView.Font.Size = new FontUnit(".87em");
                        BtnCancel.Font.Size = new FontUnit(".87em");
                        Calltxtbox.Attributes.Add("onKeyDown", "callChanged(this ,event);return false;");
                        break;
                    default:
                        break;
                }
                UpdateGVQuery();
                //Calltxtbox.Focus();
                //Set results changed to false. Only change if non-existent.
                if (Session["ResCallChange"] == null)
                {
                    Session.Add("ResCallChange", "0");
                }
                else
                {
                    if (Convert.ToInt32(Session["ResCallChange"]) != 0)
                    {
                        Session["ResCallChange"] = "0";
                    }
                }

                if (Session["Call1"] != null)
                {
                    if (!string.IsNullOrEmpty(((ContestLogInfo)Session["Call1"]).Call))
                    {
                        CurLblCall1.Text = ((ContestLogInfo)Session["Call1"]).Call;
                        CurLblTest1.Text = ((ContestLogInfo)Session["Call1"]).ContestInfo.ContestID;
                        CurLblClass1.Text = ((ContestLogInfo)Session["Call1"]).CatLogInfo.LogEntryClass;
                    }
                }
                if (Session["Call2"] != null)
                {
                    if (!string.IsNullOrEmpty(((ContestLogInfo)Session["Call2"]).Call))
                    {
                        CurLblCall2.Text = ((ContestLogInfo)Session["Call2"]).Call;
                        CurLblTest2.Text = ((ContestLogInfo)Session["Call2"]).ContestInfo.ContestID;
                        CurLblClass2.Text = ((ContestLogInfo)Session["Call2"]).CatLogInfo.LogEntryClass;
                    }
                }
                if (Session["Call3"] != null)
                {
                    if (!string.IsNullOrEmpty(((ContestLogInfo)Session["Call3"]).Call))
                    {
                        CurLblCall3.Text = ((ContestLogInfo)Session["Call3"]).Call;
                        CurLblTest3.Text = ((ContestLogInfo)Session["Call3"]).ContestInfo.ContestID;
                        CurLblClass3.Text = ((ContestLogInfo)Session["Call3"]).CatLogInfo.LogEntryClass;
                    }
                }
            }
            else
            { //Session timeout
                if (Session["ContestFilter"] == null)
                {
                    Response.Redirect("~/Results.aspx");
                }
            }


        }

        protected void Page_Init(object sender, EventArgs e)
        {
            //Always need to regenerte even on postback

            SrvVars.ServerVars.SetUserInfo(Page.Request, out BrowserType);
        }




        protected void LoadContestCheckBoxListCol(CheckBoxList cbl, string filter, string selTests)
        {
            DataView dv = (DataView)ContestSqlDataSource.Select(DataSourceSelectArguments.Empty);
            //DataView dv = (DataView)ContestSqlDataSourceMode.Select(DataSourceSelectArguments.Empty);
            //ContestSqlDataSourceMode.SelectParameters["Mode"].DefaultValue = filter;
            //string s = ((DataRow)dv.Table.Rows[0])["ContestID"].ToString();
            //int i = (int)((DataRow)dv.Table.Rows[0])["CID"] ;
            //DataSet ds = (DataSet)ContestSqlDataSource.Select(DataSourceSelectArguments.Empty);
            //string s = ds.Tables["Contests"].Rows[0]["ContestID"].ToString();


            string [] tests = selTests.Split(new char [] {','});

            foreach (DataRow row in dv.Table.Rows)
            {
                if (row["ContestID"].ToString().Contains(filter))
                {
                    ListItem li = new ListItem();
                    li.Value = row["CID"].ToString();
                    li.Text = row["ContestName"].ToString();

                    if (!string.IsNullOrEmpty(selTests))
                    {
                        foreach (string s in tests)
                        {
                            if (li.Value.ToString() == s   )
                            {
                                li.Selected = true;
                            }
                        }
                    }
                    cbl.Items.Add(li);
                }
            }
        }

        protected void LoadContestCheckBoxListCat(bool Allband, CheckBoxList cbl, string selCats)
        {
            DataView dv = (DataView)CQWWSqlDataSource.Select(DataSourceSelectArguments.Empty);
            //handle 80 m duped in DB 3.5,3.7
            string[] cats = selCats.Split(new char[] { ',' });

            if (!Allband)
            {
                SortedList<int, string> SList = new SortedList<int, string>();
                foreach (DataRow row in dv.Table.Rows)
                {
                    if (row["EntryClass"].ToString().Contains("SOSB"))
                    {
                        int iBand = 0;
                        switch (row["EntryClass"].ToString().Split(new char[] { ' ' })[1])
                        {
                            case "":
                                iBand = 0;
                                break;
                            case "1.8":
                                iBand = 160;
                                break;
                            case "3.5":
                                iBand = 80;
                                break;
                            case "3.7":
                                iBand = 80;
                                break;
                            case "7":
                                iBand = 40;
                                break;
                            case "14":
                                iBand = 20;
                                break;
                            case "21":
                                iBand = 15;
                                break;
                            case "28":
                                iBand = 10;
                                break;
                            default:
                                break;
                        }
                        try
                        {
                            SList.Add(iBand, row["EntryClass"].ToString());
                        }
                        catch (ArgumentException)
                        {
                        }
                    }
                }

                foreach (KeyValuePair<int, string> kvp in SList)
                {
                    ListItem li = new ListItem();
                    li.Value = kvp.Value;
                    li.Text = "SOSB " + kvp.Key.ToString();
                    if (!string.IsNullOrEmpty(selCats))
                    {
                        foreach (string s in cats)
                        {
                            if (s.Contains(li.Value) )
                            {
                                li.Selected = true;
                            }
                        }
                    }
                    cbl.Items.Add(li);
                }
            }
            else
            {
                SortedSet<string> SSet = new SortedSet<string>();
                foreach (DataRow row in dv.Table.Rows)
                {
                    if (!row["EntryClass"].ToString().Contains("SOSB"))
                    {
                        try
                        {
                            SSet.Add(row["EntryClass"].ToString());
                        }
                        catch (ArgumentException)
                        {
                        }
                    }
                }
                IEnumerable<string> items = SSet.Reverse();
                foreach (string val in items)
                {
                    ListItem li = new ListItem();
                    li.Value = val;
                    li.Text = val;
                    if (!string.IsNullOrEmpty(selCats))
                    {
                        foreach (string s in cats)
                        {
                            if (s.Contains(li.Value))
                            {
                                li.Selected = true;
                            }
                        }
                    }
                    cbl.Items.Add(li);
                }
            }

        }


        protected void Contest_changed(object sender, EventArgs args)
        {
            UpdateContestLabels(false);
            UpdateGVQuery();
        }
        protected void Cat_changed(object sender, EventArgs args)
        {
            UpdateContestCats(false);
            UpdateAstLabels(false);
        }

        protected void Grid_changed(object sender, EventArgs args)
        {
            int count;
            DataView dv;
            switch (btnSwitch.Value)
            {
                case "DDLCty":
                    if (DDLCty.SelectedItem.Value != "All Countries")
                    {
                        DDLCon.Text = DDLCty.SelectedItem.Value.Split(new char[] { '|' })[1];
                    }
                    else
                    {
                        DDLCon.Text = "All";
                    }
                    UpdateCon(false);
                    UpdateCty(false);
                    UpdateGVQuery();
                    break;
                case "DDLCon":
                    UpdateCon(false);
                    UpdateGVQuery();
                    break;
                case "DDLDis":
                    UpdateDis(false);
                    UpdateGVQuery();
                    break;
                case "btnNext":
                    UpdateGVQuery();
                    dv = (DataView)ResultsSqlDataSource.Select(DataSourceSelectArguments.Empty);
                    count = dv.Count / GridView1.PageSize + dv.Count % GridView1.PageSize;
                    if (GridView1.PageIndex < count)
                    {
                        GridView1.PageIndex += 1;
                        GridView1.DataBind();
                    }
                    break;
                case "btnLast":
                    UpdateGVQuery();
                    dv = (DataView)ResultsSqlDataSource.Select(DataSourceSelectArguments.Empty);
                    count = dv.Count / GridView1.PageSize + dv.Count % GridView1.PageSize;
                    if (GridView1.PageIndex < count)
                    {
                        GridView1.PageIndex = count - 1;
                        GridView1.DataBind();
                    }
                    break;
                case "btnFirst":
                    UpdateGVQuery();
                    if (GridView1.PageIndex > 0)
                    {
                        GridView1.PageIndex = 0;
                        GridView1.DataBind();
                    }
                    break;
                case "btnPrevious":
                    UpdateGVQuery();
                    if (GridView1.PageIndex > 0)
                    {
                        GridView1.PageIndex -= 1;
                        GridView1.DataBind();
                    }
                    break;
                case "ddlPageSelector":
                    UpdateGVQuery();
                    //DropDownList ddlPageSelector = GridView1.BottomPagerRow.FindControl("ddlPageSelector") as DropDownList;
                    //if (ddlPageSelector != null)
                    //{
                    GridView1.PageIndex = int.Parse(btnVar.Value);
                    //ddlPageSelector.SelectedIndex = GridView1.PageIndex;
                    GridView1.DataBind();
                    //     SetPagerButtonStates(GridView1, GridView1.BottomPagerRow, this);
                    //}
                    break;
                default:
                    UpdateGVQuery();
                    break;
            }
           
        }

        protected void Check_changed(object sender, EventArgs args)
        {
            switch (btnSwitch.Value)
            {
                case "CheckBoxLisPwr":
                    UpdatePwrLabels(false);
                    break;
                case "CheckBoxListAst":
                    UpdateAstLabels(false);
                    break;
                case "CBPwr":
                    UpdatePwrLabels(false);
                    break;                
                default:
                    break;
            }
            UpdateGVQuery();
        }

        protected void Call_changed(object sender, EventArgs args)
        {
            if (!string.IsNullOrEmpty(Calltxtbox.Text))
            {
                cqwwSsbLbl.Text = string.Empty;
                cqwwCwLbl.Text = string.Empty;
                cqwpxSsbLbl.Text = string.Empty;
                cqwpxCwLbl.Text = string.Empty;
                SelContestsButton.Enabled = false;
                UpdatePanelContests.Update();
                CatAllLbl.Text = string.Empty;
                CatSingleLbl.Text = string.Empty;
                SelectCat.Enabled = false;
                UpdatePanelCat.Update();
                CheckBoxLisPwr.Enabled = false;
                PwrUpdatePanel.Update();
                CheckBoxListAst.Enabled = false;
                //done in javascript to keep from postin cty list
                //if (DDLCty.Enabled)
                //{
                //    DDLCty.Enabled = false;
                //    DDLCty.Text = "All Countries";
                //    ctyUpdatePanel.Update();
                //}
                DDLCon.Text = "All";
                DDLCon.Enabled = false;
                UpdateCon(true);
                DDLDis.Text = "All";
                DDLDis.Enabled = false;
                UpdateDis(true);
                ConDisUpdatePanel.Update();
            }
            else
            {
                SelContestsButton.Enabled = true;
                UpdateContestLabels(true);
                UpdatePanelContests.Update();
                SelectCat.Enabled = true;
                UpdateContestCats(true);
                UpdatePanelCat.Update();
                UpdatePwrLabels(true);
                CheckBoxLisPwr.Enabled = true;
                PwrUpdatePanel.Update();
                CheckBoxListAst.Enabled = true;
                UpdateAstLabels(true);
                //done in javascript to keep from postin cty list
                //DDLCty.Enabled = true;
                //UpdateCty(true);
                //ctyUpdatePanel.Update();
                DDLCon.Enabled = true;
                UpdateCon(true);
                DDLDis.Enabled = true;
                UpdateDis(true);
                ConDisUpdatePanel.Update();

            }
            UpdateGVQuery();
        }


        protected void SessionCall_changed(object sender, EventArgs args)
        {
            int rb = int.Parse(btnVar.Value);
            CategoryLogInfo Cloginfo;
            ContestLogInfo CtestLoginfo1;
            ContestInfo Ctestinfo;

            if (rb != -1)
            {
                //mark call changed
                if (Session["ResCallChange"] == null)
                {
                    Session.Add("ResCallChange", "1");
                }
                else
                {
                    if (Convert.ToInt32(Session["ResCallChange"]) != 1)
                    {
                        Session["ResCallChange"] = "1";
                    }
                }
                byte OPrID =0;
                if (Session["resCatFilter"].ToString().Contains('M') )
                {
                    OPrID = 2;
                }else if (Session["resCatFilter"].ToString().Contains('S') )
                {
                    OPrID = 1;
                }
                switch (rb)
	            {
                    case 1:
                        Cloginfo = ContestCharts.GetCategoryLogInfo(string.Format(ConfigurationManager.ConnectionStrings["LogEntryInfoConnectionString"].ConnectionString,
                            btnGVTest.Value + "Contest.mdb"), btnGVCall.Value, btnGVTest.Value);
                        //It turns out that Bob reports k3est/4 in results but log says K3est
                        //Need to check and strip.
                        if (Cloginfo.LogCallID == 0x0)
                        {   //call not in DB
                            if (btnGVCall.Value.Contains('/')  )
                            {//strip portable
                                string [] split = btnGVCall.Value.Split( new char[]  {'/' });
                                btnGVCall.Value = split[0];
                                Cloginfo = ContestCharts.GetCategoryLogInfo(string.Format(ConfigurationManager.ConnectionStrings["LogEntryInfoConnectionString"].ConnectionString,
                                btnGVTest.Value + "Contest.mdb"), btnGVCall.Value, btnGVTest.Value);
                            }
                        }
                        Ctestinfo = ContestCharts.GetContestInfoOLE(ConfigurationManager.AppSettings["DBContestsSelect"].ToString(), btnGVTest.Value);
                        CtestLoginfo1 = new ContestLogInfo(Ctestinfo, btnGVCall.Value, Cloginfo, OPrID,
                               0, 0, 0, 0,false, false);
                        if (Session["Call1"] != null)
                        {
                             Session.Remove("Call1");
                        }
                        Session.Add("Call1", CtestLoginfo1);
                        CurLblCall1.Text = btnGVCall.Value;
                        CurLblTest1.Text = btnGVTest.Value;
                        CurLblClass1.Text = btnGVClass.Value;
                       break;
                    case 2:
                        Cloginfo = ContestCharts.GetCategoryLogInfo(string.Format(ConfigurationManager.ConnectionStrings["LogEntryInfoConnectionString"].ConnectionString,
                            btnGVTest.Value + "Contest.mdb"), btnGVCall.Value, btnGVTest.Value);
                         if (Cloginfo.LogCallID == 0x0)
                        {   //call not in DB
                            if (btnGVCall.Value.Contains('/')  )
                            {//strip portable
                                string [] split = btnGVCall.Value.Split( new char[]  {'/' });
                                btnGVCall.Value = split[0];
                                Cloginfo = ContestCharts.GetCategoryLogInfo(string.Format(ConfigurationManager.ConnectionStrings["LogEntryInfoConnectionString"].ConnectionString,
                                btnGVTest.Value + "Contest.mdb"), btnGVCall.Value, btnGVTest.Value);
                            }
                        }
                        Ctestinfo = ContestCharts.GetContestInfoOLE(ConfigurationManager.AppSettings["DBContestsSelect"].ToString(), btnGVTest.Value);
                        CtestLoginfo1 = new ContestLogInfo(Ctestinfo, btnGVCall.Value, Cloginfo, OPrID,
                            0, 0, 0, 0, false, false);
                        if (Session["Call2"] != null)
                        {
                             Session.Remove("Call2");
                        }
                        Session.Add("Call2", CtestLoginfo1);
                        CurLblCall2.Text = btnGVCall.Value;
                        CurLblTest2.Text = btnGVTest.Value;
                        CurLblClass2.Text = btnGVClass.Value;
                       break;
                    case 3:
                        Cloginfo = ContestCharts.GetCategoryLogInfo(string.Format(ConfigurationManager.ConnectionStrings["LogEntryInfoConnectionString"].ConnectionString,
                            btnGVTest.Value + "Contest.mdb"), btnGVCall.Value, btnGVTest.Value);
                        if (Cloginfo.LogCallID == 0x0)
                        {   //call not in DB
                            if (btnGVCall.Value.Contains('/')  )
                            {//strip portable
                                string [] split = btnGVCall.Value.Split( new char[]  {'/' });
                                btnGVCall.Value = split[0];
                                Cloginfo = ContestCharts.GetCategoryLogInfo(string.Format(ConfigurationManager.ConnectionStrings["LogEntryInfoConnectionString"].ConnectionString,
                                btnGVTest.Value + "Contest.mdb"), btnGVCall.Value, btnGVTest.Value);
                            }
                        }
                        Ctestinfo = ContestCharts.GetContestInfoOLE(ConfigurationManager.AppSettings["DBContestsSelect"].ToString(), btnGVTest.Value);
                        CtestLoginfo1 = new ContestLogInfo(Ctestinfo, btnGVCall.Value, Cloginfo, OPrID,
                           0, 0, 0, 0, false, false);
                        if (Session["Call3"] != null)
                        {
                            Session.Remove("Call3");
                        }
                        Session.Add("Call3", CtestLoginfo1);
                        CurLblCall3.Text = btnGVCall.Value;
                        CurLblTest3.Text = btnGVTest.Value;
                        CurLblClass3.Text = btnGVClass.Value;
                       break;
                    default:
                        break;
                }
                
            }
            if (btnSwitch.Value == "1" )
            {
                Response.Redirect("~/default.aspx");
            }

        }



        protected void UpdateContestLabels(bool bForce)
        {
            string ContestFilter;
            ContestFilter = string.Empty;
            bool first = true;

            List<string> years = new List<string>();
            foreach (ListItem item in testCheckBoxListCol1.Items)
            {
                if (item.Selected)
                {
                    years.Add(item.Text);
                    if (first)
                    {
                        ContestFilter += item.Value;
                        first = false;
                    }
                    else
                    {
                        ContestFilter += "," + item.Value;
                    }
                }
            }
            foreach (ListItem item in testCheckBoxListCol2.Items)
            {
                if (item.Selected)
                {
                    years.Add(item.Text);
                    if (first)
                    {
                        ContestFilter += item.Value;
                        first = false;
                    }
                    else
                    {
                        ContestFilter += "," + item.Value;
                    }
                }
            }

            if (bForce || Session["ContestFilter"] == null || Session["ContestFilter"] as string != ContestFilter)
            {
                if (Session["ContestFilter"] == null)
                {
                    Session.Add("ContestFilter", ContestFilter);
                }
                else
                {
                    Session["ContestFilter"] = ContestFilter;
                }


                cqwwSsbLbl.Text = "";
                cqwwCwLbl.Text = "";
                cqwpxSsbLbl.Text = "";
                cqwpxCwLbl.Text = "";

                int wwSsbcnt = 1;
                int wwCwcnt = 1;
                int wpxSsbcnt = 1;
                int wpxCwcnt = 1;
                foreach (string contest in years)
                {
                    if (contest.Contains("CQWW SSB"))
                    {
                        if (wwSsbcnt < 5 )
                        {
                            if (wwSsbcnt != 1 && wwSsbcnt <= 4)
                            {
                                cqwwSsbLbl.Text += ',';
                            }
                            cqwwSsbLbl.Text += contest.Substring(contest.Length - 4);
                        }
                        else if (wwSsbcnt == 5)
                        {
                            cqwwSsbLbl.Text += "...";
                        }
                        wwSsbcnt++;
                    }
                    else if (contest.Contains("CQWW CW"))
                    {
                        if (wwCwcnt < 5 )
                        {
                            if (wwCwcnt != 1 && wwCwcnt <= 4)
                            {
                                cqwwCwLbl.Text += ',';
                            }
                            cqwwCwLbl.Text += contest.Substring(contest.Length - 4);
                        }
                        else if (wwCwcnt == 5)
                        {
                            cqwwCwLbl.Text += "...";
                        }
                        wwCwcnt++;
                    }
                    else if (contest.Contains("CQWPX SSB"))
                    {
                        if (wpxSsbcnt < 5 )
                        {
                            if (wpxSsbcnt != 1 && wpxSsbcnt <= 4)
                            {
                                cqwpxSsbLbl.Text += ',';
                            }
                            cqwpxSsbLbl.Text += contest.Substring(contest.Length - 4);
                        }
                        else if (wpxSsbcnt == 5)
                        {
                            cqwpxSsbLbl.Text += "...";
                        }
                        wpxSsbcnt++;
                    }
                    else if (contest.Contains("CQWPX CW"))
                    {
                        if (wpxCwcnt < 5 )
                        {
                            if (wpxCwcnt != 1 && wpxCwcnt <= 4)
                            {
                                cqwpxCwLbl.Text += ',';
                            }
                            cqwpxCwLbl.Text += contest.Substring(contest.Length - 4);
                        }
                        if (wpxCwcnt == 5)
                        {
                            cqwpxCwLbl.Text += "...";
                        }
                        wpxCwcnt++;
                    }
                }

            }
        }

        protected void UpdateContestCats(bool bForce)
        {
            string CatFilter;
            CatFilter = string.Empty;
            bool first = true;

            List<string> Categorys = new List<string>();
            foreach (ListItem item in CheckBoxListCatA.Items)
            {
                if (item.Selected)
                {
                    Categorys.Add(item.Text);
                    if (first)
                    {
                        CatFilter += "'" + item.Value + "'";
                        first = false;
                    }
                    else
                    {
                        CatFilter += ",'" + item.Value + "'";
                    }
                }
            }
            foreach (ListItem item in CheckBoxListCatS.Items)
            {
                if (item.Selected)
                {
                    Categorys.Add(item.Text);
                    if (first)
                    {
                        CatFilter += "'" + item.Value + "'";
                        //handle 3.7 3.5 issue
                        if (item.Value.Contains("3.5"))
                        {
                            CatFilter += ",'" + item.Value.Replace("3.5", "3.7") + "'";
                        }
                        first = false;
                    }
                    else
                    {
                        CatFilter += ",'" + item.Value + "'";
                        if (item.Value.Contains("3.5"))
                        {
                            CatFilter += ",'" + item.Value.Replace("3.5", "3.7") + "'";
                        }
                    }
                }
            }

            if (bForce || Session["resCatFilter"] == null || Session["resCatFilter"] as string != CatFilter)
            {
                if (Session["resCatFilter"] == null)
                {
                    Session.Add("resCatFilter", CatFilter);
                }
                else
                {
                    Session["resCatFilter"] = CatFilter;
                }


                CatAllLbl.Text = "";
                CatSingleLbl.Text = "";
                foreach (string category in Categorys)
                {
                    if (!category.Contains("SOSB"))
                    {
                        if (!string.IsNullOrEmpty(CatAllLbl.Text))
                        {
                            CatAllLbl.Text += ',';
                        }
                        CatAllLbl.Text += category;
                    }
                    else
                    {
                        if (!string.IsNullOrEmpty(CatSingleLbl.Text))
                        {
                            CatSingleLbl.Text += ',';
                        }
                        CatSingleLbl.Text += category.Split(new char[] { ' ' })[1];
                    }
                }
            }
            UpdateGVQuery();
        }



        protected void UpdateGVQuery()
        {
            //if (IsPostBack)
            //{
                string filter = string.Empty;
                string str =
                "SELECT  cqww.CID, [EntryClass],  [EntrtyPower], [Assisted], [Call], " +
                "[OpCall], [Score], [Continent], [Countries], [Zones], [QSOs], [Country], " +
                "[Certificte], [Contests].ContestName AS Contestname, [Contests].ContestID " +
                "FROM [cqww] INNER JOIN [Contests] ON cqww.CID = Contests.CID";

                if (string.IsNullOrEmpty(Calltxtbox.Text))
                {
                    if (string.IsNullOrEmpty(Session["ContestFilter"] as string))
                    {
                        //session tmeout
                        str += " WHERE ([cqww].CID] = 1 )";
                    }
                    else
                    {
                        str += " WHERE [cqww].CID IN (" + Session["ContestFilter"] as string + ") ";
                    }

                    if (!string.IsNullOrEmpty(Session["resCatFilter"] as string))
                    {
                        if (string.IsNullOrEmpty(str))
                        {
                            str += " WHERE [EntryClass] IN (" + Session["resCatFilter"] as string + ") ";
                        }
                        else
                        {
                            str += " AND [EntryClass] IN (" + Session["resCatFilter"] as string + ") ";
                        }
                    }

                    if (!CBPwr.Checked && !string.IsNullOrEmpty(Session["resPwrFilter"] as string))
                    {
                        if (string.IsNullOrEmpty(str))
                        {
                            str += " WHERE [EntrtyPower] IN (" + Session["resPwrFilter"] as string + ") ";
                        }
                        else
                        {
                            str += " AND  [EntrtyPower] IN (" + Session["resPwrFilter"] as string + ") ";
                        }
                    }

                    if (!string.IsNullOrEmpty(Session["resAstFilter"] as string))
                    {
                        if (string.IsNullOrEmpty(str))
                        {
                            str += " WHERE [Assisted] IN (" + Session["resAstFilter"] as string + ") ";
                        }
                        else
                        {
                            str += " AND  [Assisted] IN (" + Session["resAstFilter"] as string + ") ";
                        }
                    }

                    if (!string.IsNullOrEmpty(Session["resCtyFilter"] as string))
                    {
                        if (Session["resCtyFilter"] as string != "All Countries")
                        {

                            if (string.IsNullOrEmpty(str))
                            {
                                str += " WHERE [Country]  ='" + Session["resCtyFilter"] as string + "'";
                            }
                            else
                            {
                                str += " AND  [Country] ='" + Session["resCtyFilter"] as string + "'";
                            }
                        }
                    }

                    if (!string.IsNullOrEmpty(Session["resConFilter"] as string))
                    {
                        if (Session["resConFilter"] as string != "All")
                        {

                            if (string.IsNullOrEmpty(str))
                            {
                                str += " WHERE [Continent]  ='" + Session["resConFilter"] as string + "'";
                            }
                            else
                            {
                                str += " AND  [Continent] ='" + Session["resConFilter"] as string + "'";
                            }
                        }
                    }

                    if (!string.IsNullOrEmpty(Session["resDisFilter"] as string))
                    {
                        if (Session["resDisFilter"] as string != "All")
                        {

                            if (string.IsNullOrEmpty(str))
                            {
                                str += " WHERE [District]  ='" + Session["resDisFilter"] as string + "'";
                            }
                            else
                            {
                                str += " AND  [District] =" + Session["resDisFilter"] as string;
                            }
                        }
                    }
                    str += " ORDER BY [SCORE] DESC,[Call] ASC";
                }
                else
                {
                    str += " WHERE [Call]  LIKE '" + Calltxtbox.Text + "%'";
                    str += " ORDER BY [Call] ASC, [Contestname] DESC";
                }

                ResultsSqlDataSource.SelectCommand = str;
            //}

        }

        protected void UpdatePwrLabels(bool bForce)
        {
            string cbstr = string.Empty;
            string str = string.Empty;
            if (bForce)
            {
                ListItemCollection ctls = CheckBoxLisPwr.Items;
                string sel = string.Empty;
                if (Session["resPwrFilter"] != null)
                {
                    sel = Session["resPwrFilter"].ToString();
                }
                if (Session["CbPwrFilter"] != null)
                {//disable all checks
                    cbstr = Session["CbPwrFilter"].ToString();
                    if (cbstr == "True")
                    {
                        CBPwr.Checked = true;
                        foreach (ListItem li in CheckBoxLisPwr.Items)
                        {
                            li.Enabled = false;
                        }
                    }
                }


                foreach (ListItem c in ctls)
                {
                    if (!string.IsNullOrEmpty(sel))
                    {
                        if (sel.Contains(c.Value))
                        {
                            c.Selected = true;
                        }
                    }
                }
                if (string.IsNullOrEmpty(sel))
                {// no state
                    CheckBoxLisPwr.Items[0].Selected = true;
                    str = "'" + CheckBoxLisPwr.Items[0].Value + "'";
                }
            }
            else if (!CBPwr.Checked)
            {
                for (int i = 0; i < CheckBoxLisPwr.Items.Count; i++)
                {
                    if (CheckBoxLisPwr.Items[i].Selected == true)
                    {
                        if (string.IsNullOrEmpty(str))
                        {
                            str = "'" + CheckBoxLisPwr.Items[i].Value + "'"; ;
                        }
                        else
                        {
                            str += ",'" + CheckBoxLisPwr.Items[i].Value + "'";
                        }
                    }
                }
            }
            if (Session["resPwrFilter"] == null || Session["resPwrFilter"] as string != str)
            {
                if (Session["resPwrFilter"] == null)
                {
                    Session.Add("resPwrFilter", str);
                }
                else
                {
                    Session["resPwrFilter"] = str;
                }
            }
            if (Session["CbPwrFilter"] == null || Session["CbPwrFilter"] as string != cbstr)
            {
                if (Session["CbPwrFilter"] == null)
                {
                    Session.Add("CbPwrFilter", CBPwr.Checked.ToString());
                }
                else
                {
                    Session["CbPwrFilter"] = CBPwr.Checked.ToString();
                }
            }
        }

        public void LoadDDL(string column, string column2, DropDownList DDL, string  function, string sAll)
        {

            if (string.IsNullOrEmpty(column2))
            {
                CQWWSqlDataSource.SelectCommand =
                "SELECT DISTINCT [" + column + "] FROM [cqww]" +
                 " ORDER BY " + column;
            }
            else
            {
                CQWWSqlDataSource.SelectCommand =
                "SELECT DISTINCT [" + column + "], [" + column2 + "] FROM [cqww]" +
                 " ORDER BY " + column;
            }
            CQWWSqlDataSource.DataBind();
            DataView dv = (DataView)CQWWSqlDataSource.Select(DataSourceSelectArguments.Empty);
            ListItem li = new ListItem();
            li.Text = sAll;
            li.Value = sAll;
            DDL.Items.Add(li);
            int n = 0;
            foreach (DataRow row in dv.Table.Rows)
            {
                if (!string.IsNullOrEmpty(row[column].ToString()))
                {
                    if (string.IsNullOrEmpty(column2))
                    {
                        DDL.Items.Add(row[column].ToString());
                    }
                    else
                    {
                        ListItem li1 = new ListItem();
                        li1.Text = row[column].ToString();
                        li1.Value = n.ToString() + "|" + row[column2].ToString();
                        DDL.Items.Add(li1);
                        n++;

                    }
                }
            }
            DDL.SelectedIndex = 0;
            DDL.Attributes.Add("onChange", string.Format("{0}('{1}');return false;", function, DDL.ID.ToString()));
        }

        protected void CheckBoxLisPwr_PreRender(object sender, EventArgs e)
        {
            //foreach (ListItem li in  CheckBoxLisPwr.Items)
            //{
            //    li.Attributes["onclick"] = "checkedChanged('CheckBoxLisPwr',btnChk);return false;";
            //}
        }

        protected void UpdateAstLabels(bool bForce)
        {
            if (bForce)
            {
                ListItemCollection ctls = CheckBoxListAst.Items;
                string sel = string.Empty;
                if (Session["resAstFilter"] != null)
                {
                    sel = Session["resAstFilter"].ToString();
                }


                foreach (ListItem c in ctls)
                {
                    if (!string.IsNullOrEmpty(sel))
                    {
                        if (sel.Contains(c.Value))
                        {
                            c.Selected = true;
                        }
                    }
                }
                if (string.IsNullOrEmpty(sel))
                {
                    CheckBoxListAst.Items[0].Selected = true;
                }
            }
            string str = string.Empty;
            for (int i = 0; i < CheckBoxListAst.Items.Count; i++)
            {
                if (CheckBoxListAst.Items[i].Selected == true)
                {
                    if (string.IsNullOrEmpty(str))
                    {
                        str =  CheckBoxListAst.Items[i].Value;
                    }
                    else
                    {
                        str += "," + CheckBoxListAst.Items[i].Value;
                    }
                }
            }
            if (Session["resAstFilter"] == null || Session["resAstFilter"] as string != str)
            {
                if (Session["resAstFilter"] == null)
                {
                    Session.Add("resAstFilter", str);
                }
                else
                {
                    Session["resAstFilter"] = str;
                }
            }
        }

        protected void UpdateCty(bool bForce)
        {
            if (bForce)
            {
                string sel = string.Empty;
                if (Session["resCtyFilter"] != null)
                {
                    sel = Session["resCtyFilter"].ToString();
                    DDLCty.Text = sel;
                }
            }
            if (Session["resCtyFilter"] == null)
            {
                Session.Add("resCtyFilter", DDLCty.SelectedItem.Text);
            }
            else
            {
                Session["resCtyFilter"] = DDLCty.SelectedItem.Text;
            }
        }

        protected void UpdateCon(bool bForce)
        {
            if (bForce)
            {
                string sel = string.Empty;
                if (Session["resConFilter"] != null)
                {
                    sel = Session["resConFilter"].ToString();
                    DDLCon.Text = sel;
                }

            }
            if (Session["resConFilter"] == null)
            {
                Session.Add("resConFilter", DDLCon.Text);
            }
            else
            {
                Session["resConFilter"] = DDLCon.Text;
            }
        }

        protected void UpdateDis(bool bForce)
        {
            if (bForce)
            {
                string sel = string.Empty;
                if (Session["resDisFilter"] != null)
                {
                    sel = Session["resDisFilter"].ToString();
                    DDLDis.Text = sel;
                }
            }
            if (Session["resDisFilter"] == null)
            {
                Session.Add("resDisFilter", DDLDis.Text);
            }
            else
            {
                Session["resDisFilter"] = DDLDis.Text;
            }
        }

        
        protected void CheckBoxListAst_PreRender(object sender, EventArgs e)
        {
            //foreach (ListItem li in CheckBoxListAst.Items)
            //{
            //    li.Attributes["onclick"] = "checkedChanged('CheckBoxListAst',btnChk);";
            //}
        }

        protected void GridView1_Sorted(object sender, EventArgs e)
        {
            UpdateGVQuery();
        }
        
        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            switch (BrowserType)
            {
                case ServerVars.UAgent.UA_Oper:
                      e.Row.Font.Size = new FontUnit(".81em" );
                   break;
                case ServerVars.UAgent.UA_FFox:
                   break;
                case ServerVars.UAgent.UA_Msie:
                     e.Row.Font.Size = new FontUnit(".81em" );
                    break;
                default:
                    break;
            }
            
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                GridView gv = (GridView)sender;
                int index = -1;
                string sCall = string.Empty;
                string sContestID =  string.Empty;
                int Scoreindex = -1;

                //string str = string.Format("{0}", e.Row.RowIndex);
                //HyperLink Hy = e.Row.FindControl("idCall") as HyperLink;
                //AjaxControlToolkit.PopupControlExtender PuCtlExtnd = new AjaxControlToolkit.PopupControlExtender();
                //PuCtlExtnd.ID = "pE" + str;
                //PuCtlExtnd.PopupControlID = PanelAddall.ID;
                //PuCtlExtnd.TargetControlID = Hy.ID;
                //PuCtlExtnd.OffsetX = 10;
                //if (e.Row.RowIndex > 8)
                //{
                //    PuCtlExtnd.OffsetX = 100;
                //    PuCtlExtnd.OffsetY = -250;
                //}
                //else
                //{
                //    PuCtlExtnd.OffsetX = 100;
                //    PuCtlExtnd.OffsetY = 20;
                //}
                //PuCtlExtnd.BehaviorID = "pB" + str;

                //string  [] s = Hy.NavigateUrl.Split(new char[] {'('});
                //Hy.NavigateUrl = s[0] + "('" + PuCtlExtnd.BehaviorID + "'," + s[1];
                //PlaceHolder pH = e.Row.FindControl("PH1") as PlaceHolder;
                //pH.Controls.Add(PuCtlExtnd);

                HyperLink hy = null;
                int CallColumn = 0;
                foreach (DataControlField column in gv.Columns)
                {
                    if (column.HeaderText == "Assisted")
                    {
                        index = gv.Columns.IndexOf(column);
                        if (e.Row.Cells[index].Text == "0")
                        {
                            e.Row.Cells[index].Text = "";
                        }
                    else
                    {
                        e.Row.Cells[index].Text = "*";
                    }
                    }
                    if (column.HeaderText == "Call")
                    {
                        CallColumn = gv.Columns.IndexOf(column);
                        hy = e.Row.Cells[gv.Columns.IndexOf(column)].FindControl("idCall") as HyperLink;
                        sCall = hy.Text;
                    }
                     if (column.HeaderText == "Contests")
                    {
                        sContestID = e.Row.Cells[gv.Columns.IndexOf(column)].Text;
                        if (hy != null  )
                        {
                            int year = int.Parse(sContestID.Substring(sContestID.Length - 4, 4) );
                            if (year < 2007)
	                        {
                                hy.Enabled = false;
                                e.Row.Cells[CallColumn].BackColor = Color.FromArgb(0, 0xF8, 0xF8, 0xF8);
	                        }
                            
                        }
                     }
                   if (column.HeaderText == "Score")
                    {
                        Scoreindex = gv.Columns.IndexOf(column);
                    }
               }
                if (!string.IsNullOrEmpty(sCall) && !string.IsNullOrEmpty(sContestID))
                {
                    DataView dv = (DataView)ResultsSqlDataSource.Select(DataSourceSelectArguments.Empty);
                    foreach (DataRowView drv in dv)
                    {
                        if (drv["Call"].ToString() == sCall && drv["ContestName"].ToString() == sContestID)
                        {
                            if (drv["Certificte"].ToString() == "1")
                            {
                                e.Row.Cells[Scoreindex].ForeColor = System.Drawing.Color.FromName("green");
                                e.Row.Cells[Scoreindex].Font.Bold = true;
                            }
                            break;
                        }
                    }
                }
                //LinkButton lb = e.Row.FindControl("idCall") as LinkButton;
                //ScriptManager.GetCurrent(this).RegisterAsyncPostBackControl(lb);   

            }
        }

        protected void GridView1_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Pager)
            {
                SetPagerButtonStates(GridView1, e.Row, this);

            }
        }

        public void SetPagerButtonStates(GridView gridView, GridViewRow gvPagerRow, Page page)
        {
            int pageIndex = gridView.PageIndex;
            int pageCount = gridView.PageCount;
            Button btnFirst = (Button)gvPagerRow.FindControl("btnFirst");
            Button btnPrevious = (Button)gvPagerRow.FindControl("btnPrevious");
            Button btnNext = (Button)gvPagerRow.FindControl("btnNext");
            Button btnLast = (Button)gvPagerRow.FindControl("btnLast");

            btnFirst.Enabled = btnPrevious.Enabled = (pageIndex != 0);
            btnNext.Enabled = btnLast.Enabled = (pageIndex < (pageCount - 1));
            if (this.BrowserType != ServerVars.UAgent.UA_Msie)
            {
                if (!btnFirst.Enabled)
                {
                    btnFirst.CssClass = "disabled_button";
                }
                if (!btnPrevious.Enabled)
                {
                    btnPrevious.CssClass = "disabled_button";
                }
                if (!btnNext.Enabled)
                {
                    btnNext.CssClass = "disabled_button";
                }
                if (!btnLast.Enabled)
                {
                    btnLast.CssClass = "disabled_button";
                }
            }

            DropDownList ddlPageSelector = (DropDownList)gvPagerRow.FindControl("ddlPageSelector");

            ddlPageSelector.Items.Clear();

            for (int i = 1; i <= gridView.PageCount; i++)
            {
                ddlPageSelector.Items.Add(i.ToString());
            }

            //Have to recreate the next 2 because List is recreated each time
            ddlPageSelector.SelectedIndex = pageIndex;
            ddlPageSelector.Attributes["onchange"] = "javascript:PagerKey('ddlPageSelector');return false;";



        }


    
    }



}