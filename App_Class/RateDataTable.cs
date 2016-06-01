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
public partial class RateDataTable : DataTable 
{

    public DateTime startTime{ get; set; }
    public DateTime endTime{ get; set; }

    public DataTable QSOsTable;
    public string sTimeColumnName;
    public double  interval;
    private bool MixedYears;
    public double fudgeinterval;
    bool bSum;

    public RateDataTable(DataTable QSOsTbl, DateTime start, DateTime end, string TimeColumnName, double intv,
        bool MixYears, double fudgeinterval, bool bSum)
	{
        startTime = start;
        endTime = end;
        this.fudgeinterval = fudgeinterval;
        this.bSum = bSum;
        QSOsTable = QSOsTbl;
        sTimeColumnName = TimeColumnName;
        interval = intv;
        MixedYears = MixYears;
        
        CreateRateTable();
    }

    private void CreateRateTable()
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
        //int ContestDay = 1;
        DateTime CurrentDate = startTime;

        //int j =1;
        //foreach (DataRow dr in QSOsTable.Rows)
        //{
        //    Debug.WriteLine(string.Format("i is {0}  {1}   {2}", j++, dr.ItemArray[0].ToString(), dr.ItemArray[1].ToString()));

        //}

       int day1 = startTime.Day;
       // add start row with zero value to shift graph left.
       row = this.NewRow();
       if (MixedYears)
       {
           row[sTimeColumnName] = DateTime.Parse("1/1/1990 " + "00:00");
       }
       else
       {
           row[sTimeColumnName] = startTime;
       }
       row["N"] = 0;
       this.Rows.Add(row);
       int PrevSum = 0;

        while (Time < endTime)
        {
            row = this.NewRow();
            //row[sTimeColumnName] = String.Format("{0}-{1:HH:mm}",ContestDay, Time);
            if (MixedYears)
            {
                // need to enter begin of time date to allow mixed year plotting
                int days = Time.AddMinutes(interval + fudgeinterval).Subtract(startTime).Days;
                //row[sTimeColumnName] = DateTime.Parse("1/" + string.Format("{0}", 1 + Time.AddMinutes(interval).Day - day1) + "/1990 " +
                //    Time.AddMinutes(interval).TimeOfDay);
                row[sTimeColumnName] = DateTime.Parse("1/" + string.Format("{0}", 1 + days + "/1990 " +
                    Time.AddMinutes(interval).AddMinutes(fudgeinterval).TimeOfDay));
            }
            else
            {
                row[sTimeColumnName] =  Time.AddMinutes(interval).AddMinutes(fudgeinterval);
            }
            
            if (i < QSOsTable.Rows.Count  && (DateTime)(QSOsTable.Rows[i].ItemArray[0]) == Time)
            {
                row["N"] = QSOsTable.Rows[i].ItemArray[1];
                PrevSum = Convert.ToInt32(QSOsTable.Rows[i].ItemArray[1]);
                i++;
            }
            else
            {
                if (bSum)
                {
                    row["N"] = PrevSum;
                }
                else
                {
                    row["N"] = 0;
                }
            }
            this.Rows.Add(row);
            //Debug.WriteLine(string.Format("i is {0}  {1}   {2}", i, row.ItemArray[0].ToString(), row.ItemArray[1].ToString()));
            //if (i == 23)
            //{

            //}
            Time = Time.AddMinutes(interval);
            //if (CurrentDate.Day != Time.Day)
            //{
            //    CurrentDate.AddDays(1);
            //    ContestDay++;
            //}


        }
    }
}














