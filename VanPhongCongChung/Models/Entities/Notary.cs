namespace Models.Entities
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Notary")]
    public partial class Notary
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Notary()
        {
            Notary_Contract = new HashSet<Notary_Contract>();
        }

        [Key]
        public int ID_NoTary { get; set; }

        [Required]
        [StringLength(100)]
        public string Name_Notary { get; set; }

        [StringLength(50)]
        public string Regency { get; set; }

        public bool IS_Delect { get; set; }

        public int? ID_Account { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Notary_Contract> Notary_Contract { get; set; }
    }
}
