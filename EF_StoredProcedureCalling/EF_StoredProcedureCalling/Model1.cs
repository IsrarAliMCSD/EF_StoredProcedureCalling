namespace EF_StoredProcedureCalling
{
    using System;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity;
    using System.Linq;

    public class Model1 : DbContext
    {
        public Model1()
            : base("name=EFActivitiesMgmt")
        {
        }
        public virtual DbSet<Student> Students { get; set; }
    }

    [Table("Student")]
    public partial class Student
    {
        [Key]
        public int StudentId { get; set; }
        public string StudentNAme { get; set; }
        public DateTime Dob { get; set; }
        public bool? IsActive { get; set; }
    }
}