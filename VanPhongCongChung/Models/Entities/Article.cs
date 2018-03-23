namespace Models.Entities
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Article")]
    public partial class Article
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Article()
        {
            Article_To_Category = new HashSet<Article_To_Category>();
        }

        [Key]
        public int ID_Article { get; set; }

        [StringLength(100)]
        public string Name_Article { get; set; }

        [StringLength(500)]
        public string Description { get; set; }

        [Column(TypeName = "ntext")]
        public string Content { get; set; }

        [StringLength(100)]
        public string ImagePath { get; set; }

        public int ID_Account { get; set; }

        public DateTime? Create_Date_Article { get; set; }

        public DateTime? Update_Date_Article { get; set; }

        public bool Is_Delete { get; set; }

        public int? Count_View { get; set; }

        public virtual Account Account { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Article_To_Category> Article_To_Category { get; set; }
    }
}
