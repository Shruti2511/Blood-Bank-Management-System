using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApplication3.Models
{
    public class comment
    {
        public int cid { get; set; }
        public string commenttxt { get; set; }
        public int cidfkon { get; set; }

        public int cidfkfrom { get; set; }


    }
}