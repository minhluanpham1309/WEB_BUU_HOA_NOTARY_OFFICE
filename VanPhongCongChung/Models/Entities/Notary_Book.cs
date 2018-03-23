namespace Models.Entities
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Notary_Book
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Notary_Book()
        {
            Notary_Contract = new HashSet<Notary_Contract>();
        }

        [Key]
        public int ID_Notary_Book { get; set; }

        public int Number_Of_Book { get; set; }

        public int Year_Book { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Notary_Contract> Notary_Contract { get; set; }
    }
}
