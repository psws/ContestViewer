using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for ContestInfo
/// </summary>
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
    public string ClassTblName { get; set; }
    public string Call { get; set; }

    public ContestInfo()
	{
		//
		// TODO: Add constructor logic here
		//
	}
}