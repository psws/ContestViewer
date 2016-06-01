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

/// <summary>
/// Summary description for SeriesParamObj
/// </summary>
public class SeriesObj : System.Web.UI.DataVisualization.Charting.Series
{
    
    public string Call { get; set; }

    public ContestInfo Ctestinfo;
    public int Interval { get; set; }
    public string IntvTime { get; set; }
    public string sQCnt { get; set; }
    public DataTable TmpDT;


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
    public SeriesObj(ContestInfo Cinfo, Color ptColor, string Callsign)
    {
        Ctestinfo = Cinfo;
        Call = Callsign;
        this.LegendText = Callsign;
        this.Name = Callsign + "_" + Ctestinfo.ContestID;
        this.Color = ptColor; 

    }

    public void Create(string sConn, int Intv, SeriesChartType chrtType, bool MixedYears)
	{
        Interval = Intv;
        this.ChartType = chrtType;
        string ConnectionString = ConfigurationManager.ConnectionStrings[sConn].ConnectionString;
        string colTime = string.Format("{0}.Time", Ctestinfo.ContestTblName);
        string colContestID = string.Format("{0}.ContestID", Ctestinfo.ContestTblName);
        IntvTime = "IntvTime";
        sQCnt = "N";

        //In order to display three differebt contests on axis
        //the Date part of Datetime is biased to 1/1/1990 for first day , 1/2/1990
        //for day2 ....
        string TableName = "RateT" + Ctestinfo.ContestID + "_S" + Ctestinfo.basedstartTime.ToOADate() + "_E" +
                    Ctestinfo.basedendTime.ToOADate() + "_" + IntvTime + string.Format("_I{0}", Interval) +
                    string.Format("_M{0}", MixedYears);
        // Check if table is cached
        if (HttpRuntime.Cache[TableName] == null)
        {
            string QSOQuery = @"SELECT [Time1] AS " + IntvTime + ", Sum(Qry5minintervals.N) AS " + sQCnt +
                     " FROM (SELECT   Format([" + colTime + "],'Short Date') & ' ' " +
                     "& Format(DatePart('h',[" + colTime + "]),'00') & ':' " +
                     "& Format(Int(DatePart('n',[" + colTime + "])/" + Interval + ")*" + Interval + ",'00')AS [Time1] , Count(*) AS N" +
                      " FROM QSOs" +
                      " WHERE (((" + colContestID + ")='" + Ctestinfo.ContestID + "'))" +
                      " GROUP BY  [" + colTime + "] ) AS Qry5minintervals" +
                      " GROUP BY [Time1] ";

            //SqlDataReader QSOReader  = QSOCommand.ExecuteReader();
            //fill Calll Qsos, Table has  holes wgere no qsos were made
            DataTable QSOsdt = GetDataOLETable(QSOQuery, ConnectionString);


            //TmpDT = new RateDataTable(QSOsdt, Ctestinfo.startTime, Ctestinfo.endTime,
            //                            IntvTime, Interval, MixedYears);

            //HttpRuntime.Cache[TableName] = new RateDataTable(QSOsdt, Ctestinfo.startTime, Ctestinfo.endTime, IntvTime, Interval, MixedYears);
            System.Web.HttpContext.Current.Cache[TableName] = new RateDataTable(QSOsdt, Ctestinfo.startTime, Ctestinfo.endTime, IntvTime, Interval, MixedYears);
            QSOsdt.Dispose();
        }
 

//        SELECT [Time1], Sum(Qryminintervals.N) AS Zones
//FROM (SELECT Format([QSOs.Time],"Short Date") & " " & Format(DatePart("h",[QSOs.Time]),"00") & ":" & Format(Int(DatePart("n",[QSOs.Time])/15)*15,"00") AS Time1, Count(*) AS N
//FROM QSOs
//WHERE (((QSOs.ContestID)="CQWWSSB2009") And ((QSOs.Mlt1)<>""))
//GROUP BY [QSOs.Time], [QSOs.Mlt2] ) AS Qryminintervals
//GROUP BY [Time1];

         //OleDbDataReader rdr = TmpDT.CreateDataReader();

         if (this.ChartType != SeriesChartType.Column)
         {
             this.MarkerStyle = System.Web.UI.DataVisualization.Charting.MarkerStyle.Circle;
             //this.MarkerStep  //sets how often line marke3rs aqppear
         }
         //DataView dv = new DataView(TmpDT);
         //this.Points.DataBindXY(
         //    dv, IntvTime,
         //    dv, sQCnt);    
         //DataTableReader dr = ((DataTable)HttpRuntime.Cache[TableName]).CreateDataReader();
         DataTableReader dr = ((DataTable)System.Web.HttpContext.Current.Cache[TableName]).CreateDataReader();
         this.Points.DataBindXY(
            dr, IntvTime,
            dr, sQCnt);
	}



    public DataTable GetDataSQLTable(string sQuery, string sConnectionString)
    {

        SqlConnection oConn = new SqlConnection();
        DataTable oRS = new DataTable();

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

        return oRS;
    }

    public DataTable GetDataOLETable(string sQuery, string sConnectionString)
    {

        OleDbConnection oConn = new OleDbConnection();
        DataTable oRS = new DataTable();
        oRS.Columns.Add(IntvTime, typeof(DateTime));
        oRS.Columns.Add("N", typeof(int));

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

        return oRS;
    }



}