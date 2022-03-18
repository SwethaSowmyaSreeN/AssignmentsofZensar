using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Entity;

namespace StudentCodeFirstProject.Models
{
    public class StudentContext:DbContext
    {
        public StudentContext() : base("name=Students")
        {



        }
        public DbSet<StudentDetails> students { get; set; }
    }
}