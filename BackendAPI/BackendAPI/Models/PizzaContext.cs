using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

namespace BackendAPI.Models
{
    public partial class PizzaContext : DbContext
    {
        public PizzaContext()
        {
        }

        public PizzaContext(DbContextOptions<PizzaContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Drink> Drinks { get; set; } = null!;
        public virtual DbSet<Order> Orders { get; set; } = null!;
        public virtual DbSet<OrderPizza> OrderPizzas { get; set; } = null!;
        public virtual DbSet<Pizza> Pizzas { get; set; } = null!;
        public virtual DbSet<Size> Sizes { get; set; } = null!;

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
                optionsBuilder.UseSqlServer("Name=Pizza");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Drink>(entity =>
            {
                entity.ToTable("drinks");

                entity.Property(e => e.Id).HasColumnName("id");

                entity.Property(e => e.Image).HasColumnName("image");

                entity.Property(e => e.Name)
                    .HasMaxLength(50)
                    .HasColumnName("name");

                entity.Property(e => e.Price)
                    .HasColumnType("money")
                    .HasColumnName("price");
            });

            modelBuilder.Entity<Order>(entity =>
            {
                entity.ToTable("orders");

                entity.Property(e => e.Id).HasColumnName("id");

                entity.Property(e => e.CustomerAddress)
                    .HasMaxLength(500)
                    .HasColumnName("customer_address");

                entity.Property(e => e.CustomerName)
                    .HasMaxLength(50)
                    .HasColumnName("customer_name");

                entity.Property(e => e.CustomerPhone)
                    .HasMaxLength(20)
                    .HasColumnName("customer_phone");

                entity.Property(e => e.TotalPrice)
                    .HasColumnType("money")
                    .HasColumnName("total_price");
            });

            modelBuilder.Entity<OrderPizza>(entity =>
            {
                entity.ToTable("order_pizzas");

                entity.Property(e => e.Id).HasColumnName("id");

                entity.Property(e => e.OrderId).HasColumnName("order_id");

                entity.Property(e => e.PizzaId).HasColumnName("pizza_id");

                entity.Property(e => e.Quantity).HasColumnName("quantity");

                entity.HasOne(d => d.Order)
                    .WithMany(p => p.OrderPizzas)
                    .HasForeignKey(d => d.OrderId)
                    .HasConstraintName("FK_order_pizzas_orders");

                entity.HasOne(d => d.Pizza)
                    .WithMany(p => p.OrderPizzas)
                    .HasForeignKey(d => d.PizzaId)
                    .HasConstraintName("FK_order_pizzas_pizzas");
            });

            modelBuilder.Entity<Pizza>(entity =>
            {
                entity.ToTable("pizzas");

                entity.Property(e => e.Id).HasColumnName("id");

                entity.Property(e => e.Description).HasColumnName("description");

                entity.Property(e => e.Image).HasColumnName("image");

                entity.Property(e => e.Name)
                    .HasMaxLength(50)
                    .HasColumnName("name");

                entity.Property(e => e.SizeId).HasColumnName("size_id");

                entity.HasOne(d => d.Size)
                    .WithMany(p => p.Pizzas)
                    .HasForeignKey(d => d.SizeId)
                    .HasConstraintName("FK_pizzas_sizes1");
            });

            modelBuilder.Entity<Size>(entity =>
            {
                entity.ToTable("sizes");

                entity.Property(e => e.Id).HasColumnName("id");

                entity.Property(e => e.Name)
                    .HasMaxLength(50)
                    .HasColumnName("name");

                entity.Property(e => e.Price)
                    .HasColumnType("money")
                    .HasColumnName("price");
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
