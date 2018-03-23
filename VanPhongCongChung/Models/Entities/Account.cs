namespace Models.Entities
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Account")]
    public partial class Account
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Account()
        {
            Articles = new HashSet<Article>();
            Employees = new HashSet<Employee>();
            Notary_Contract = new HashSet<Notary_Contract>();
        }

        [Key]
        public int ID_Account { get; set; }

        [Required]
        [StringLength(100)]
        public string UserName { get; set; }

        [Required]
        [StringLength(500)]
        public string Passwords { get; set; }

        public int ID_Account_Type { get; set; }

        [StringLength(500)]
        public string Note { get; set; }

        public int? AccountID { get; set; }

        public DateTime Create_Account { get; set; }

        public DateTime Update_Account { get; set; }

        public bool Is_Delete { get; set; }

        public bool Is_Not_Delete { get; set; }

        [Column(TypeName = "text")]
        public string Folder_Path { get; set; }

        public virtual Account_Type Account_Type { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Article> Articles { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Employee> Employees { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Notary_Contract> Notary_Contract { get; set; }
    }
}
