using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Web;

/// <summary>
/// Summary description for ContestInfo
/// </summary>
[Serializable()]
public class ContestInfo
{

    public DateTime startTime { get; set; }
    public DateTime endTime { get; set; }
    public DateTime basedstartTime { get; set; }
    public DateTime basedendTime { get; set; }
    public string ContestType { get; set; }
    public string ContestName { get; set; }
    public string ContestID { get; set; }
    public string ContestTblName { get; set; }
    public string EntryTblName { get; set; }
    public string DBName { get; set; }

    public ContestInfo()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public ContestInfo(ContestInfo copy)
    {
        startTime = copy.startTime;
        endTime = copy.endTime;
        basedstartTime = copy.basedstartTime;
        basedendTime = copy.basedendTime;
        ContestType = copy.ContestType;
        ContestName = copy.ContestName;
        ContestID = copy.ContestID;
        ContestTblName = copy.ContestTblName;
        EntryTblName = copy.EntryTblName;
        DBName = copy.DBName;

    }
}

[Serializable()] 
public class CategoryLogInfo
{
    public byte LogCatOprID { get; set; }
    public byte LogCatPwrID { get; set; }
    public byte LogCatAstID { get; set; }
    public byte LogCatBndID { get; set; }
    public byte LogCatTxID { get; set; }
    public string LogDBName { get; set; }
    public Int32 LogCallID { get; set; }
    public Int16 LogCtyID { get; set; }
    public Int16 LogCalcZones { get; set; }
    public Int16 LogCalcCountries { get; set; }
    public Int32 LogCalcScore { get; set; }
    public string LogEntryClass { get; set; }
   

    public CategoryLogInfo()
    {
    }



    public CategoryLogInfo(byte CatOprID, byte CatPwrID, byte CatAstID, byte CatBndID, byte CatTxID, string LogDBName, Int32 LogCallID,
        Byte LogCtyID, Int16 LogCalcZones, Int16 LogCalcCountries, Int32 LogCalcScore, string LogEntryClass)
    {
        this.LogCatOprID = CatOprID;
        this.LogCatPwrID = CatPwrID;
        this.LogCatAstID = CatAstID;
        this.LogCatBndID = CatBndID;
        this.LogCatTxID = CatTxID;
        this.LogDBName = LogDBName;
        this.LogCallID = LogCallID;
        this.LogEntryClass = LogEntryClass;
        this.LogCtyID = LogCtyID;
        this.LogCalcZones = LogCalcZones;
        this.LogCalcCountries = LogCalcCountries;
        this.LogCalcScore = LogCalcScore;
   }

    public CategoryLogInfo(CategoryLogInfo Copy)
    {
        if (Copy != null)
        {
            this.LogCatOprID = Copy.LogCatOprID;
            this.LogCatPwrID = Copy.LogCatPwrID;
            this.LogCatAstID = Copy.LogCatAstID;
            this.LogCatBndID = Copy.LogCatBndID;
            this.LogCatTxID = Copy.LogCatTxID;
            this.LogDBName = Copy.LogDBName;
            this.LogCallID = Copy.LogCallID;
            this.LogCtyID = Copy.LogCtyID;
            this.LogCalcZones = Copy.LogCalcZones;
            this.LogCalcCountries = Copy.LogCalcCountries;
            this.LogCalcScore = Copy.LogCalcScore;
            this.LogEntryClass = Copy.LogEntryClass;
        }
    }

}

[Serializable()] 
public class ContestLogInfo
{
    public string Call { get; set; }
    public ContestInfo ContestInfo { get; set; }
    public CategoryLogInfo CatLogInfo { get; set; }
    public byte CatOprID { get; set; }
    public byte CatPwrID { get; set; }
    public byte CatAstID { get; set; }
    public byte CatBndID { get; set; }
    public byte CatTxID { get; set; }
    public bool CategoryCBID { get; set; }
    public bool CBCall { get; set; }

    public ContestLogInfo(ContestInfo ContestInfo, string Call, CategoryLogInfo CatLogInfo,
        byte CatOprID, byte CatPwrID, byte CatAstID, byte CatBndID, byte CatTxID, bool cCategoryCB, bool cCBCall)
    {
        this.Call = Call;
        this.ContestInfo = new ContestInfo(ContestInfo);
        if (CatLogInfo != null)
        {
            this.CatLogInfo = new CategoryLogInfo(CatLogInfo);
        }
        this.CatOprID = CatOprID;
        this.CatPwrID = CatPwrID;
        this.CatAstID = CatAstID;
        this.CatBndID = CatBndID;
        this.CatTxID = CatTxID;
        this.CBCall = CBCall;
        this.CategoryCBID = cCategoryCB;

    }

    public ContestLogInfo()
    {
        this.CatOprID = 0;
        this.CatPwrID = 0;
        this.CatAstID = 0;
        this.CatBndID = 0;
        this.CatTxID = 0;
        this.CategoryCBID = true;
        this.CBCall = true;

    }
}

[Serializable()]
public class QSOLogFilter
{
    public byte QBndID { get; set; }
    public byte QConID { get; set; }
    public string QCouID { get; set; }
    public byte QZoneID { get; set; }
    public bool QsoCB { get; set; }
    public string Filter { get; set; }
    public QSOLogFilter()
    {
        QBndID = 0;
        QConID = 0;
        QCouID = string.Empty;
        QZoneID = 0;
        QsoCB = false;
    }
}

[Serializable()]
public class ContestViewFilter
{
    public byte ChartFuncDDLID { get; set; }
    public byte IntervalDDLID { get; set; }
    public byte ViewDDLID { get; set; }
    public byte DDLVStartID { get; set; }
    public byte DDLVHoursID { get; set; }

    public ContestViewFilter()
    {
        ChartFuncDDLID = 0;
        IntervalDDLID = 0;
        ViewDDLID = 0;
        DDLVStartID = 0;
        DDLVHoursID = 0;
    }
}

public delegate DataTable LoadOLEDataTabledelegate(ContestViewParms ContestViewParms, string s);

[Serializable()]
public class ContestViewParms
{
        public string sChartFunction { get; set; }
        public string SerTablename { get; set; }
        public string sIntvTime{ get; set; }
        public string sQCnt { get; set; }
        public string sQCnt2 { get; set; }
        public string sQCnt3 { get; set; }
        public string sTitle { get; set; }
        public string sYAxis { get; set; }
        public string sQSOQuery { get; set; }
        public bool bSum { get; set; }
        public LoadOLEDataTabledelegate DTFunc { get; set; }
        public ContestViewParms(string sChartFunction, string SerTablename, string sIntvTime,
            string sQCnt, string sTitle, string sYAxis, string sQSOQuery, LoadOLEDataTabledelegate DTFunc, bool bSum)
        {
            this.sChartFunction = sChartFunction;
            this.SerTablename = SerTablename;
            this.sIntvTime = sIntvTime;
            this.sQCnt = sQCnt;
            this.sTitle = sTitle;
            this.sYAxis = sYAxis;
            this.sQSOQuery = sQSOQuery;
            this.DTFunc = DTFunc;
            this.bSum = bSum;
        }

        public ContestViewParms()
        {
        }
}



