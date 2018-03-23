namespace Models.Entities
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class TB_Notary_Person
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public TB_Notary_Person()
        {
            Notary_Contract = new HashSet<Notary_Contract>();
        }

        [Key]
        public int ID_NPerson { get; set; }

        [Required]
        [StringLength(100)]
        public string LastName { get; set; }

        [Required]
        [StringLength(100)]
        public string FirstName { get; set; }

        [Required]
        [StringLength(10)]
        public string ID_Code { get; set; }

        [Column(TypeName = "ntext")]
        public string NPerson_Address { get; set; }

        [StringLength(15)]
        public string Phone_Number { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Notary_Contract> Notary_Contract { get; set; }
    }
}
