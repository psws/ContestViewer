using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Caching;
using System.Data;
using System.Data.SqlClient;
using System.Data.OleDb;
using System.Web.UI.DataVisualization;
using System.Web.UI.DataVisualization.Charting;
using System.Configuration;
using System.Data.Common;
using System.Drawing;
using System.Web.SessionState;

/// <summary>
/// Summary description for SeriesParamObj
/// </summary>
public class SeriesObj : System.Web.UI.DataVisualization.Charting.Series
{
    
    public string Call { get; set; }

    public ContestLogInfo CtestLogInfo;
    private HttpSessionState Session;
    public DataTable TmpDT;
    public string SeriesNum { get; set; }


    public DataTable RateDataTable  
    {
        get
        {
            if (HttpRuntime.Cache[this.Name] != null)
            {
                return (DataTable)HttpRuntime.Cache[this.Name];
            }
            else
            {
                return null;
            }
        }

    }
   

    // QSO rate constructor
    public SeriesObj(ContestLogInfo Cinfo, Color ptColor, HttpSessionState Session, string SeriesNum)
    {
        CtestLogInfo = Cinfo;
        Call = Cinfo.Call;
        this.LegendText = Call;
        this.Name = SeriesNum + "_" + Call + "_" + CtestLogInfo.ContestInfo.ContestID;
        this.Color = ptColor;
        this.Session = Session;
        this.SeriesNum = SeriesNum;

    }

    public bool Create(string sConn, ChartAreaInfo ChartAreaInfo, string ChartID, 
        ContestViewParms ContestViewParms)
	{
        bool bOK = true;
        this.ChartType = ChartAreaInfo.charttype;
        string ConnectionString;

        //string DBLogFile = GetLogDBTable(Call, string.Format(ConfigurationManager.ConnectionStrings["LogEntryInfoConnectionString"].ConnectionString, CtestLogInfo.ContestInfo.DBName)  );
        if (!string.IsNullOrEmpty(CtestLogInfo.CatLogInfo.LogDBName))
        {
            ConnectionString = string.Format(ConfigurationManager.ConnectionStrings[sConn].ConnectionString, CtestLogInfo.ContestInfo.ContestID, CtestLogInfo.CatLogInfo.LogDBName);


            // Check if table is cached
            if (HttpRuntime.Cache[ContestViewParms.SerTablename] == null)
            {
                //remove previous chart
                string OldTableName = Session[SeriesNum + ChartID] as String;
                if (!string.IsNullOrEmpty(OldTableName))
                {
                    Session.Remove(SeriesNum + ChartID);
                    HttpRuntime.Cache.Remove(OldTableName);
                }


                double FudgeInterval; //Shifts column bars to the right for axis alignment
                if (this.ChartType == SeriesChartType.Column)
                {
                    FudgeInterval = ChartAreaInfo.ChartPointtInterval * -.25;
                }
                else
                {
                    FudgeInterval = 0;
                }

                //SqlDataReader QSOReader  = QSOCommand.ExecuteReader();
                //fill Calll Qsos, Table has  holes wgere no qsos were made
                //DataTable QSOsdt = GetDataOLETable(ContestViewParms.sQSOQuery, ConnectionString, ContestViewParms.sIntvTime, ContestViewParms.sQCnt);
                DataTable QSOsdt = ContestViewParms.DTFunc( ContestViewParms, ConnectionString);

                //this.SetCustomProperty("DrawingStyle" , "Cylinder");
                //TmpDT = new RateDataTable(QSOsdt, Ctestinfo.startTime, Ctestinfo.endTime,
                //                            IntvTime, Interval, MixedYears);

                //HttpRuntime.Cache[TableName] = new RateDataTable(QSOsdt, Ctestinfo.startTime, Ctestinfo.endTime, IntvTime, Interval, MixedYears);
                //System.Web.HttpContext.Current.Cache[TableName] = new RateDataTable(QSOsdt, Ctestinfo.startTime, Ctestinfo.endTime, IntvTime, Interval, MixedYears);
                System.Web.HttpContext.Current.Cache.Insert(
                    ContestViewParms.SerTablename,
                    new RateDataTable(QSOsdt, CtestLogInfo.ContestInfo.startTime, CtestLogInfo.ContestInfo.endTime, ContestViewParms.sIntvTime, ChartAreaInfo.ChartPointtInterval,
                        ChartAreaInfo.MixedYears, FudgeInterval, ContestViewParms.bSum),
                    null,
                    Cache.NoAbsoluteExpiration,
                    new TimeSpan(0, 5, 0));
                //Add session state
                Session.Add(SeriesNum + ChartID, ContestViewParms.SerTablename);
                QSOsdt.Dispose();
            }

            //not retained on draw. Needs to be set each time
            if (this.ChartType == SeriesChartType.Line)
            {
                this.MarkerStyle = System.Web.UI.DataVisualization.Charting.MarkerStyle.Circle;
            }
            if (this.ChartType == SeriesChartType.Spline)
            {
                this.BorderWidth = 2; // linrwdth
            }


             //OleDbDataReader rdr = TmpDT.CreateDataReader();

             //DataView dv = new DataView(TmpDT);
             //this.Points.DataBindXY(
             //    dv, IntvTime,
             //    dv, sQCnt);    
             //DataTableReader dr = ((DataTable)HttpRuntime.Cache[TableName]).CreateDataReader();
            DataTableReader dr = ((DataTable)System.Web.HttpContext.Current.Cache[ContestViewParms.SerTablename]).CreateDataReader();
             this.Points.DataBindXY(
                dr, ContestViewParms.sIntvTime,
                dr, ContestViewParms.sQCnt);
        }
        else
        {
            bOK = false;
        }
        return bOK;
    }





    public DataTable GetDataSQLTable(string sQuery, string sConnectionString)
    {

        SqlConnection oConn = new SqlConnection();
        DataTable oRS = new DataTable();

        using (oConn)
        {
            try
            {
                oConn.ConnectionString = sConnectionString;
                oConn.Open();
                SqlDataAdapter oDA = new SqlDataAdapter("EXEC " + sQuery, oConn);
                oDA.Fill(oRS);
                //oConn.Close();
            }
            catch (Exception e) { }
            finally { if (oConn.State == ConnectionState.Open) { oConn.Close(); } }
        }

        return oRS;
    }

    public DataTable GetDataOLETable(string sQuery, string sConnectionString, string sIntvTime, string sQCnt)
    {

        OleDbConnection oConn = new OleDbConnection();
        DataTable oRS = new DataTable();
        oRS.Columns.Add(sIntvTime, typeof(DateTime));
        oRS.Columns.Add(sQCnt, typeof(int));
        using (oConn)
        {
            try
            {
                oConn.ConnectionString = sConnectionString;
                oConn.Open();
                OleDbDataAdapter oDA = new OleDbDataAdapter(sQuery, oConn);
                oDA.Fill(oRS);
                //oConn.Close();
            }
            catch (Exception e) { }
            finally { if (oConn.State == ConnectionState.Open) { oConn.Close(); } }
        }
        return oRS;
    }

    public String GetLogDBTable( string sCall, string sConnectionString)
    {
        string DBFile = string.Empty;
        OleDbConnection oConn = new OleDbConnection();
        DataTable oRS = new DataTable();
        oRS.Columns.Add("DBName", typeof(String));

        using (oConn)
        {
            try
            {
                oConn.ConnectionString = sConnectionString;
                oConn.Open();
                string sQuery = string.Format("Select [DBName] from CQWWENTRY WHERE [Call] = '{0}'",sCall );
                OleDbDataAdapter oDA = new OleDbDataAdapter(sQuery, oConn);
                oDA.Fill(oRS);
                //oConn.Close();
            }
            catch (Exception e) { }
            finally { if (oConn.State == ConnectionState.Open) { oConn.Close(); } }
        }
        if (oRS.Rows.Count != 0)
        {
            DBFile = oRS.Rows[0].ItemArray[0] as string;
        }
        return DBFile;
    }


}