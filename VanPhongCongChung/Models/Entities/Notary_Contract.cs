namespace Models.Entities
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Notary_Contract
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Notary_Contract()
        {
            Accounts = new HashSet<Account>();
        }

        [Key]
        public int ID_NotaryContract { get; set; }

        [Required]
        [StringLength(20)]
        public string Notary_Number { get; set; }

        [Column(TypeName = "ntext")]
        public string Description { get; set; }

        public int ID_Contract_Type { get; set; }

        public int ID_Notary_Person { get; set; }

        [Column(TypeName = "date")]
        public DateTime Notary_Date { get; set; }

        [Column(TypeName = "date")]
        public DateTime Sign_Date { get; set; }

        [StringLength(500)]
        public string Note { get; set; }

        public double Notary_Price { get; set; }

        public int ID_Notary_Book { get; set; }

        [StringLength(100)]
        public string Contract_Image_Scan { get; set; }

        public int Signed_Person { get; set; }

        public virtual Notary Notary { get; set; }

        public virtual Notary_Book Notary_Book { get; set; }

        public virtual TB_Notary_Person TB_Notary_Person { get; set; }

        public virtual Type_Contract Type_Contract { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Account> Accounts { get; set; }
    }
}
