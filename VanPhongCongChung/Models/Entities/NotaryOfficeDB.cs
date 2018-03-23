namespace Models.Entities
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;

    public partial class NotaryOfficeDB : DbContext
    {
        public NotaryOfficeDB()
            : base("name=NotaryOfficeDB")
        {
        }

        public virtual DbSet<Account> Accounts { get; set; }
        public virtual DbSet<Account_Type> Account_Type { get; set; }
        public virtual DbSet<Article> Articles { get; set; }
        public virtual DbSet<Article_To_Category> Article_To_Category { get; set; }
        public virtual DbSet<Category> Categories { get; set; }
        public virtual DbSet<Employee> Employees { get; set; }
        public virtual DbSet<Module> Modules { get; set; }
        public virtual DbSet<Notary> Notaries { get; set; }
        public virtual DbSet<Notary_Book> Notary_Book { get; set; }
        public virtual DbSet<Notary_Contract> Notary_Contract { get; set; }
        public virtual DbSet<Permisson> Permissons { get; set; }
        public virtual DbSet<TB_Notary_Person> TB_Notary_Person { get; set; }
        public virtual DbSet<Type> Types { get; set; }
        public virtual DbSet<Type_Contract> Type_Contract { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Account>()
                .Property(e => e.UserName)
                .IsUnicode(false);

            modelBuilder.Entity<Account>()
                .Property(e => e.Passwords)
                .IsUnicode(false);

            modelBuilder.Entity<Account>()
                .Property(e => e.Folder_Path)
                .IsUnicode(false);

            modelBuilder.Entity<Account>()
                .HasMany(e => e.Articles)
                .WithRequired(e => e.Account)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Account>()
                .HasMany(e => e.Employees)
                .WithRequired(e => e.Account)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Account>()
                .HasMany(e => e.Notary_Contract)
                .WithMany(e => e.Accounts)
                .Map(m => m.ToTable("Managed_Contract").MapLeftKey("ID_Account").MapRightKey("ID_Notary_Contract"));

            modelBuilder.Entity<Account_Type>()
                .HasMany(e => e.Accounts)
                .WithRequired(e => e.Account_Type)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Account_Type>()
                .HasMany(e => e.Permissons)
                .WithRequired(e => e.Account_Type)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Article>()
                .Property(e => e.Name_Article)
                .IsUnicode(false);

            modelBuilder.Entity<Article>()
                .Property(e => e.ImagePath)
                .IsUnicode(false);

            modelBuilder.Entity<Article>()
                .HasMany(e => e.Article_To_Category)
                .WithRequired(e => e.Article)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Category>()
                .HasMany(e => e.Article_To_Category)
                .WithRequired(e => e.Category)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Module>()
                .HasMany(e => e.Permissons)
                .WithRequired(e => e.Module)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Notary>()
                .HasMany(e => e.Notary_Contract)
                .WithRequired(e => e.Notary)
                .HasForeignKey(e => e.Signed_Person)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Notary_Book>()
                .HasMany(e => e.Notary_Contract)
                .WithRequired(e => e.Notary_Book)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Notary_Contract>()
                .Property(e => e.Notary_Number)
                .IsUnicode(false);

            modelBuilder.Entity<Notary_Contract>()
                .Property(e => e.Contract_Image_Scan)
                .IsUnicode(false);

            modelBuilder.Entity<TB_Notary_Person>()
                .Property(e => e.ID_Code)
                .IsUnicode(false);

            modelBuilder.Entity<TB_Notary_Person>()
                .Property(e => e.Phone_Number)
                .IsUnicode(false);

            modelBuilder.Entity<TB_Notary_Person>()
                .HasMany(e => e.Notary_Contract)
                .WithRequired(e => e.TB_Notary_Person)
                .HasForeignKey(e => e.ID_Notary_Person)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Type>()
                .Property(e => e.Name_Type)
                .IsUnicode(false);

            modelBuilder.Entity<Type>()
                .HasMany(e => e.Type_Contract)
                .WithOptional(e => e.Type)
                .HasForeignKey(e => e.ID_Type);

            modelBuilder.Entity<Type_Contract>()
                .HasMany(e => e.Notary_Contract)
                .WithRequired(e => e.Type_Contract)
                .HasForeignKey(e => e.ID_Contract_Type)
                .WillCascadeOnDelete(false);
        }
    }
}
