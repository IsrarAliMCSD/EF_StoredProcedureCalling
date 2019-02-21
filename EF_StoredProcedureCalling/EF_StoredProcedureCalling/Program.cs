using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EF_StoredProcedureCalling
{
    class Program
    {
        static void Main(string[] args)
        {

            Model1 context = new EF_StoredProcedureCalling.Model1();
            var idParam = new SqlParameter
            {
                ParameterName = "StudentName",
                Value = 1
            };
            var idParam2 = new SqlParameter
            {
                ParameterName = "DoB",
                Value = DateTime.Now
            };
            var idParam3 = new SqlParameter
            {
                ParameterName = "StudentID",
                Value = 1
            };
            var courseList = context.Database.SqlQuery<Student>(
              "exec GEtStudentByID @studentID", idParam3).ToList<Student>();

            var oeee = context.Students.ToList();

        }
    }
}
