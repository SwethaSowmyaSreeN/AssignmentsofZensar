using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace StudentCodeFirstProject.Models
{
    [Table("TblStudent")]

    public class StudentDetails
    {
       
            [Key]
            public int StudentId { get; set; }
            public int id { get; set; }
            public string Name { get; set; }
            public string Branch { get; set; }
            public string City { get; set; }
            public int Percentage { get; set; }



    }
}
