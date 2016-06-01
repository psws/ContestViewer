using System;
using System.Collections.Generic;
using System.Linq;
using System.IO;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Drawing.Imaging;

namespace ContestViewer
{
    public partial class Counter1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            String counterid = Request["id"];

            //Get current counter value
            int value = Convert.ToInt32(Application["Counter_" + counterid]);

            if (Session["CounterTemp_" + counterid] == null)
            {
                //If the text file exists load the saved value 
                // Always loading it from the file rather than just using the application variable allows for manual modification of counter values while the application is running (by editing the text file). To stop it from being able to be modified just uncomment the following 'if..then' and the 'end if'.  This will give a slight performance boost to the counter incrementing as it will stop a file operation.  Yes, I'm an optimization freak! :)
                //if value = 0 then
		        if (File.Exists(Server.MapPath(counterid + ".txt"))  )
                {
			        StreamReader sr = File.OpenText(Server.MapPath(counterid + ".txt"));
			        value = Convert.ToInt32(sr.ReadLine().ToString());
			        sr.Close();
		        }
	
                //Increment counter
	            value += 1;
    	            //Save counter to an application var (the locks are there to make sure noone else changes it at the same time)
	            Application.Lock();
                Application["Counter_" + counterid] = value.ToString();
	            Application.UnLock();
	
	            //Save counter to a text file
	            FileStream fs = new FileStream(Server.MapPath(counterid + ".txt"), FileMode.Create, FileAccess.Write);
	            StreamWriter sw = new StreamWriter(fs);
	            sw.WriteLine(Convert.ToString(value));
	            sw.Close();
	            fs.Close();
	
	            //Set a session variable so this counter doesn't fire again in the current session
	            Session.Add(("CounterTemp_"+ counterid), "True");
            }

            // ***** CREATE OUTPUT GRAPHIC FOR THE COUNTER *****
            string svalue = value.ToString();

            // Load digits graphic (must be in 0 through 9 format in graphic w/ all digits of set width)
            System.Drawing.Image i  = System.Drawing.Image.FromFile(Server.MapPath(Request["src"]));

            // Get digit dynamics from the graphic
            int dgwidth  = i.Width/10;
            int dgheight = i.Height;

            // Get number of digits to display in the output graphic
            //int digits= Convert.ToInt32(Request["digits"]);

            // Create output object
            Bitmap imgOutput = new Bitmap(dgwidth * svalue.Length, dgheight, PixelFormat.Format24bppRgb);
            //Bitmap imgOutput = new Bitmap(dgwidth * digits, dgheight, PixelFormat.Format24bppRgb);
            Graphics g  = Graphics.FromImage(imgOutput);

            int j = 0;
            int dg ;

            //Extract digit from value
            char[] chrs  = svalue.ToArray();
            foreach ( char c in chrs)
            {
                dg = c - 0x30;
                //dg = (int)(Math.Floor(Convert.ToDouble(value) / (10 ^ (digits - j - 1))) - Math.Floor(Convert.ToDouble(value) / (10 ^ (digits - j))) ) * 10;
	            // Add digit to the output graphic
	            g.DrawImage(i, new Rectangle(j*dgwidth, 0, dgwidth, dgheight), new Rectangle(dg*dgwidth, 0, dgwidth, dgheight), GraphicsUnit.Pixel);
                j++;
             }

            // Set the content type and return output image
            Response.ContentType="image/jpeg";
            imgOutput.Save(Response.OutputStream, ImageFormat.Jpeg);

            // Clean up
            g.Dispose();
            imgOutput.Dispose();
	

        }
    }
}