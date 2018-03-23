namespace Models.Entities
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Type_Contract
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Type_Contract()
        {
            Notary_Contract = new HashSet<Notary_Contract>();
        }

        [Key]
        public int ID_TContract { get; set; }

        [StringLength(100)]
        public string Type_Name_Contract { get; set; }

        public int Number_Side { get; set; }

        public int? ID_Type { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Notary_Contract> Notary_Contract { get; set; }

        public virtual Type Type { get; set; }
    }
}
