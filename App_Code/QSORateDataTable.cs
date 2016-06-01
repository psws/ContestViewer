using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Diagnostics;

/// <summary>
/// Summary description for QSOsDataset
/// </summary>
public partial class QSORateDataTable : DataTable 
{

    public DateTime startTime{ get; set; }
    public DateTime endTime{ get; set; }

    public DataTable QSOsTable;
    public string sTimeColumnName;
    public int interval;
    private bool MixedYears;

    public QSORateDataTable(DataTable QSOsTbl, DateTime start, DateTime end, string TimeColumnName, int intv, bool MixYears)
	{
        startTime = start;
        endTime = end;

        QSOsTable = QSOsTbl;
        sTimeColumnName = TimeColumnName;
        interval = intv;
        MixedYears = MixYears;
        Init();
    }

	private void Init()
    {

        DataColumn column;
        DataRow row;

        // Create new DataColumn, set DataType, 
        // ColumnName and add to DataTable.    
        column = new DataColumn();
        column.DataType = System.Type.GetType("System.DateTime");
        column.ColumnName = sTimeColumnName;
        column.Caption = sTimeColumnName;
        column.ReadOnly = true;
        column.Unique = true;
        // Add the Column to the DataColumnCollection.
        this.Columns.Add(column);

        // Create second column.
        column = new DataColumn();
        column.DataType = System.Type.GetType("System.Int32");
        column.ColumnName = "N";
        column.AutoIncrement = false;
        column.Caption = "N";
        column.ReadOnly = false;
        column.Unique = false;
        // Add the column to the table.
        this.Columns.Add(column);

        // Make the ID column the primary key column.
        DataColumn[] PrimaryKeyColumns = new DataColumn[1];
        PrimaryKeyColumns[0] = this.Columns[sTimeColumnName];
        this.PrimaryKey = PrimaryKeyColumns;

        //// Instantiate the DataSet variable.
        //dataSet = new DataSet();
        //// Add the new DataTable to the DataSet.
        //dataSet.Tables.Add(table);

        // Create three new DataRow objects and add 
        // them to the DataTable
        DateTime Time = startTime;
        int i = 0;
        int ContestDay = 1;
        DateTime CurrentDate = startTime;

        int j =1;
        foreach (DataRow dr in QSOsTable.Rows)
        {
            Debug.WriteLine(string.Format("i is {0}  {1}   {2}", j++, dr.ItemArray[0].ToString(), dr.ItemArray[1].ToString()));

        }

       int day1 = startTime.Day;

        while (Time < endTime)
        {
         
            row = this.NewRow();
            //row[sTimeColumnName] = String.Format("{0}-{1:HH:mm}",ContestDay, Time);
            if (MixedYears)
            {
                // need to enter begin of time date to allow mixed year plotting
                row[sTimeColumnName] = DateTime.Parse("1/" + string.Format("{0}",1 + Time.Day - day1)  +"/1990 " + Time.TimeOfDay);
            }else
            {
                row[sTimeColumnName] = Time;
            }
            
            if (i < QSOsTable.Rows.Count  && (DateTime)(QSOsTable.Rows[i].ItemArray[0]) == Time)
            {
                row["N"] = QSOsTable.Rows[i].ItemArray[1];
                i++;
            }
            else
            {
                row["N"] = 0;
            }
            this.Rows.Add(row);
            Debug.WriteLine(string.Format("i is {0}  {1}   {2}", i, row.ItemArray[0].ToString(), row.ItemArray[1].ToString()));
            if (i == 30)
            {

            }
            Time = Time.AddMinutes(interval);
            if (CurrentDate.Day != Time.Day)
            {
                CurrentDate.AddDays(1);
                ContestDay++;
            }


        }
    }
}














