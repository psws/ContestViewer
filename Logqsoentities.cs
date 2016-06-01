using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;

namespace ContestViewer
{
    public partial class logqsoEntities : DbContext
    {
        public logqsoEntities(string DB)
            : base(string.Format("name={0}", DB))
        {

        }
    }
}