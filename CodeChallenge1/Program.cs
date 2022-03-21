using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CodeChallenge1
{
    class Program
    {
      
        public static SqlConnection con;
        public static SqlCommand cmd;
        public static SqlDataReader dr;
        static void Main(string[] args)
        {
            InsertData();
        }
        static SqlConnection getConnection()
        {
            con = new SqlConnection(@"data source=INFINITY;initial catalog=EmployeeManagement;integrated security=true");
            con.Open();
            return con;
        }
        static void InsertData()
        {
            try
            {
                con = getConnection();
                Console.WriteLine("Enter New Employee Details : ");
                string ename, etype;
                float esal;
                Console.WriteLine("Enter New Employee Name : ");
                ename = Console.ReadLine();
                Console.WriteLine("Enter New Employee Salary : ");
                esal = float.Parse(Console.ReadLine());
                Console.WriteLine("Enter New Employee Type 'C' Or 'P' :");
                etype = Console.ReadLine();
                cmd = new SqlCommand("execute dbo.AddNewEmployee @ename, @esal, @etype");
                cmd.Parameters.AddWithValue("@ename", ename);
                cmd.Parameters.AddWithValue("@esal", esal);
                cmd.Parameters.AddWithValue("@etype", etype);
                cmd.Connection = con;
                int no_of_rows = cmd.ExecuteNonQuery();
                if (no_of_rows > 0)
                {
                    Console.WriteLine("Number of Rows affected are : {0} ", no_of_rows);
                }
                else
                {
                    Console.WriteLine("No Rows Affected");
                }
            }
            catch (SqlException se)
            {
                Console.WriteLine(se.Message);
            }
        }




    }
}
