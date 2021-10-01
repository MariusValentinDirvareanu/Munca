using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleApp1
{
    public class StoreModel
    {
        public string id { get; set; }
        public int conference { get; set; }
        public string audio { get; set; }
        public string title { get; set; }
        public int repeats { get; set; }
        public int interval { get; set; }
    }
}
