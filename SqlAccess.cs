using System;
using System.IO;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Xml.Serialization;
using System.Globalization;
 


namespace ContestViewer
{


    public partial class ContestCharts : System.Web.UI.Page
    {
        logqsoEntities _context;

        public logqsoEntities context
        {
            get
            {
                //if (_context == null || _context.Database.Connection.State == ConnectionState.Closed)

                if (_context == null)
                {
                    //multi target databases
                    string ConnectionString = "logqsoEntities"; //default
#if DebugProd || ReleaseProd 
                    ConnectionString = "logqsoEntitiesHostfest";
#endif

                    _context = new logqsoEntities(ConnectionString);
                    //_context = new NABSEntities();
                    //_context.Database.Connection.ConnectionString=NABSEntities
                    //Next line needed to NoNullAllowedException include(""...")

                    //http://stackoverflow.com/questions/5943394/why-is-inserting-entities-in-ef-4-1-so-slow-compared-to-objectcontext
                    //http://stackoverflow.com/questions/5917478/what-causes-attach-to-be-slow-in-ef4/5921259#5921259

                    _context.Configuration.ProxyCreationEnabled = false;
                    try
                    {
                        _context.Database.Connection.Open();
                    }
                    catch (Exception ex)
                    {
                        throw new Exception("Error in context getter." + ex.Message, ex);
                    }
                }
                return _context;
            }
        }

        public  string SerializeToXml(object value) 
        { 
            StringWriter writer = new StringWriter(CultureInfo.InvariantCulture);
            XmlSerializer serializer = new XmlSerializer(value.GetType());
            serializer.Serialize(writer, value); return writer.ToString();
        }

        public void DeSerializefromXmlLoadSession(SessionFields SessionField)
        {
            ContestViewer.Session SessionUser = null;
            XmlSerializer serializer = null;
            StringReader reader = null;
        
            string user = System.Web.HttpContext.Current.User.Identity.Name;
            if (!string.IsNullOrEmpty(user) )
            {
                SessionUser = context.Sessions.Find(user);
                if (SessionUser != null)
                {
                    switch (SessionField)
                    {
                        case SessionFields.ContestLogInfo1:
                            if (SessionUser.ContestLogInfo1 != null && SessionUser.ContestLogInfo1.Length != 0)
                            {
                                reader = new StringReader(SessionUser.ContestLogInfo1);
                                serializer = new XmlSerializer(typeof(ContestLogInfo));
                                Session["Call1"] = serializer.Deserialize(reader);
                            }
                            break;
                        case SessionFields.ContestLogInfo2:
                            if (SessionUser.ContestLogInfo2 != null && SessionUser.ContestLogInfo2.Length != 0)
                            {
                                reader = new StringReader(SessionUser.ContestLogInfo2);
                                serializer = new XmlSerializer(typeof(ContestLogInfo));
                                Session["Call2"] = serializer.Deserialize(reader);
                            }
                            break;
                        case SessionFields.ContestLogInfo3:
                            if (SessionUser.ContestLogInfo3 != null && SessionUser.ContestLogInfo3.Length != 0)
                            {
                                reader = new StringReader(SessionUser.ContestLogInfo3);
                                serializer = new XmlSerializer(typeof(ContestLogInfo));
                                Session["Call3"] = serializer.Deserialize(reader);
                            }
                            break;
                        case SessionFields.QSOLogFilter:
                            if (SessionUser.QSOLogFilter != null && SessionUser.QSOLogFilter.Length != 0)
                            {
                                reader = new StringReader(SessionUser.QSOLogFilter);
                                serializer = new XmlSerializer(typeof(QSOLogFilter));
                                Session["QSOLogFilter"] = serializer.Deserialize(reader);
                            }
                            break;
                        case SessionFields.ContestViewFilter:
                            if (SessionUser.ContestViewFilter != null && SessionUser.ContestViewFilter.Length != 0)
                            {
                                reader = new StringReader(SessionUser.ContestViewFilter);
                                serializer = new XmlSerializer(typeof(ContestViewFilter));
                                Session["ContestViewFilter"] = serializer.Deserialize(reader);
                            }
                            break;
                        case SessionFields.All:
                            if (SessionUser.ContestLogInfo1 != null && SessionUser.ContestLogInfo1.Length != 0)
                            {
                                reader = new StringReader(SessionUser.ContestLogInfo1);
                                serializer = new XmlSerializer(typeof(ContestLogInfo));
                                Session["Call1"] = serializer.Deserialize(reader);
                            }
                            if (SessionUser.ContestLogInfo2 != null && SessionUser.ContestLogInfo2.Length != 0)
                            {
                                reader = new StringReader(SessionUser.ContestLogInfo2);
                                serializer = new XmlSerializer(typeof(ContestLogInfo));
                                Session["Call2"] = serializer.Deserialize(reader);
                            }
                            if (SessionUser.ContestLogInfo3 != null && SessionUser.ContestLogInfo3.Length != 0)
                            {
                                reader = new StringReader(SessionUser.ContestLogInfo3);
                                serializer = new XmlSerializer(typeof(ContestLogInfo));
                                Session["Call3"] = serializer.Deserialize(reader);
                            }
                            if (SessionUser.QSOLogFilter != null && SessionUser.QSOLogFilter.Length != 0)
                            {
                                reader = new StringReader(SessionUser.QSOLogFilter);
                                serializer = new XmlSerializer(typeof(QSOLogFilter));
                                Session["QSOLogFilter"] = serializer.Deserialize(reader);
                            }
                            if (SessionUser.ContestViewFilter != null && SessionUser.ContestViewFilter.Length != 0)
                            {
                                reader = new StringReader(SessionUser.ContestViewFilter);
                                serializer = new XmlSerializer(typeof(ContestViewFilter));
                                Session["ContestViewFilter"] = serializer.Deserialize(reader);
                            }
                            break;
                        default:
                            break;
                    }
                }
            }
               
        }

        public enum SessionFields
        {
            ContestLogInfo1 = 1,
            ContestLogInfo2 = 2,
            ContestLogInfo3 = 3,
            QSOLogFilter = 4,
            ContestViewFilter = 5,
            All = 9,
        }


        public int SerializeToXmlandSave(SessionFields SessionField)
        {
            int rc = 0;
            ContestViewer.Session SessionUser = null;
            bool Newuser = false;
            XmlSerializer serializer = null;

            string user = System.Web.HttpContext.Current.User.Identity.Name;
            if (!string.IsNullOrEmpty(user))
            {
                SessionUser = context.Sessions.Find(user);
                if (SessionUser == null)
                {//create new record
                    Newuser = true;
                    SessionUser = new Session();
                    SessionUser.UserIdentity = user;
                }
                StringWriter writer = new StringWriter(CultureInfo.InvariantCulture);
                
                switch (SessionField)
                {
                    case SessionFields.ContestLogInfo1:
                        serializer = new XmlSerializer(typeof(ContestLogInfo));
                        serializer.Serialize(writer, (ContestLogInfo)Session["Call1"]);                      
                        SessionUser.ContestLogInfo1 = writer.ToString();
                        break;
                    case SessionFields.ContestLogInfo2:
                        serializer = new XmlSerializer(typeof(ContestLogInfo));
                        serializer.Serialize(writer, (ContestLogInfo)Session["Call2"]);                      
                        SessionUser.ContestLogInfo2 = writer.ToString();
                       break;
                    case SessionFields.ContestLogInfo3:
                        serializer = new XmlSerializer(typeof(ContestLogInfo));
                        serializer.Serialize(writer, (ContestLogInfo)Session["Call3"]);                      
                        SessionUser.ContestLogInfo3 = writer.ToString();
                       break;
                    case SessionFields.QSOLogFilter:
                       serializer = new XmlSerializer(typeof(QSOLogFilter));
                       serializer.Serialize(writer, (QSOLogFilter)Session["QSOLogFilter"]);                      
                       SessionUser.QSOLogFilter = writer.ToString();
                       break;
                    case SessionFields.ContestViewFilter:
                       serializer = new XmlSerializer(typeof(ContestViewFilter));
                       serializer.Serialize(writer, (ContestViewFilter)Session["ContestViewFilter"]);                      
                       SessionUser.ContestViewFilter = writer.ToString();
                       break;
                    default:
                        break;
                }
                if (Newuser == true)
                {
                    context.Sessions.Add(SessionUser);
                }
                else
                {
                    context.Entry(SessionUser).CurrentValues.SetValues(SessionUser); //update context
                }
                rc = context.SaveChanges();

            }
            return rc;
        }


    }
}
