using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

namespace InsuranceService.Models
{
    public partial class InsuranceContext : DbContext
    {
        public InsuranceContext()
        {
        }

        public InsuranceContext(DbContextOptions<InsuranceContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Employee> Employee { get; set; }
        public virtual DbSet<Occupation> Occupation { get; set; }
        public virtual DbSet<OccupationRating> OccupationRating { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
                optionsBuilder.UseSqlServer(@"Server=localhost\SQLEXPRESS;Database=Insurance;Trusted_Connection=True;");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Employee>(entity =>
            {
                entity.HasKey(e => e.Eid);

                entity.Property(e => e.Eid)
                    .HasColumnName("EID")
                    .UseSqlServerIdentityColumn();

                entity.Property(e => e.Dob)
                    .IsRequired()
                    .HasColumnName("DOB")
                    .HasMaxLength(100);

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(200);

                entity.Property(e => e.Occupation)
                    .IsRequired()
                    .HasMaxLength(200);

                entity.HasOne(d => d.OccupationNavigation)
                    .WithMany(p => p.Employee)
                    .HasForeignKey(d => d.Occupation)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Employee_Occupation");
            });

            modelBuilder.Entity<Occupation>(entity =>
            {
                entity.HasKey(e => e.Occupation1);

                entity.Property(e => e.Occupation1)
                    .HasColumnName("Occupation")
                    .HasMaxLength(200);

                entity.Property(e => e.Rating)
                    .IsRequired()
                    .HasMaxLength(100);

                entity.HasOne(d => d.RatingNavigation)
                    .WithMany(p => p.Occupation)
                    .HasForeignKey(d => d.Rating)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Occupation_OccupationRating");
            });

            modelBuilder.Entity<OccupationRating>(entity =>
            {
                entity.HasKey(e => e.Rating);

                entity.Property(e => e.Rating).HasMaxLength(100);

                entity.Property(e => e.Factor).HasColumnType("decimal(4, 2)");
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
