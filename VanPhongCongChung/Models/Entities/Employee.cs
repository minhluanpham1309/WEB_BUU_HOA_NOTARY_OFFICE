namespace Models.Entities
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Employee")]
    public partial class Employee
    {
        [Key]
        public int ID_Employee { get; set; }

        [StringLength(100)]
        public string Employee_Name { get; set; }

        [Column(TypeName = "date")]
        public DateTime? Birth_Day { get; set; }

        [Column(TypeName = "date")]
        public DateTime? Date_Start { get; set; }

        public int ID_Account { get; set; }

        public double? Salary { get; set; }

        public bool Is_Delete { get; set; }

        public virtual Account Account { get; set; }
    }
}
