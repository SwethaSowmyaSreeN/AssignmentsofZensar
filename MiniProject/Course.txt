using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Zensar_Casstudy_Day1
{
    class Course
    {
            public int CID { get; set; }
            public string CName { get; set; }
            public string Duration { get; set; }
            public int Fees { get; set; }
            public Course()
            {

            }
            public Course(int CID, string CName, string Duration, int Fees)
            {
                this.CID = CID;
                this.CName = CName;
                this.Duration = Duration;
                this.Fees = Fees;
            }
            

    }
}
