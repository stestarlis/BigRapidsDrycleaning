using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace BRDObjects;

public partial class BrdryCleaningContext : DbContext
{
    public BrdryCleaningContext()
    {
    }

    public BrdryCleaningContext(DbContextOptions<BrdryCleaningContext> options)
        : base(options)
    {
    }

    public virtual DbSet<Account> Accounts { get; set; }

    public virtual DbSet<Address> Addresses { get; set; }

    public virtual DbSet<Customer> Customers { get; set; }

    public virtual DbSet<Discount> Discounts { get; set; }

    public virtual DbSet<DiscountType> DiscountTypes { get; set; }

    public virtual DbSet<HoursOfOperation> HoursOfOperations { get; set; }

    public virtual DbSet<MeetingPurpose> MeetingPurposes { get; set; }

    public virtual DbSet<MeetingType> MeetingTypes { get; set; }

    public virtual DbSet<MonetaryTransaction> MonetaryTransactions { get; set; }

    public virtual DbSet<NotificationPreference> NotificationPreferences { get; set; }

    public virtual DbSet<Order> Orders { get; set; }

    public virtual DbSet<OrderDiscount> OrderDiscounts { get; set; }

    public virtual DbSet<OrderItem> OrderItems { get; set; }

    public virtual DbSet<OrderItemDiscount> OrderItemDiscounts { get; set; }

    public virtual DbSet<OrderServicePromotional> OrderServicePromotionals { get; set; }

    public virtual DbSet<PaymentType> PaymentTypes { get; set; }

    public virtual DbSet<Promotional> Promotionals { get; set; }

    public virtual DbSet<RecordStatus> RecordStatuses { get; set; }

    public virtual DbSet<ScheduleEntry> ScheduleEntries { get; set; }

    public virtual DbSet<SecurityPermission> SecurityPermissions { get; set; }

    public virtual DbSet<SecurityRole> SecurityRoles { get; set; }

    public virtual DbSet<SecurityRolePermission> SecurityRolePermissions { get; set; }

    public virtual DbSet<Service> Services { get; set; }

    public virtual DbSet<ServiceItemType> ServiceItemTypes { get; set; }

    public virtual DbSet<ServicePromotional> ServicePromotionals { get; set; }

    public virtual DbSet<Store> Stores { get; set; }

    public virtual DbSet<StoreInformation> StoreInformations { get; set; }

    public virtual DbSet<Testimonial> Testimonials { get; set; }
    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Account>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__Account__3214EC27467FA229");

            entity.ToTable("Account");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.CustomerId).HasColumnName("CustomerID");
            entity.Property(e => e.SecurityRoleId).HasColumnName("SecurityRoleID");
            entity.Property(e => e.StatusId).HasColumnName("StatusID");

            entity.HasOne(d => d.Customer).WithMany(p => p.Accounts)
                .HasForeignKey(d => d.CustomerId)
                .HasConstraintName("FK__Account__Custome__5535A963");

            entity.HasOne(d => d.SecurityRole).WithMany(p => p.Accounts)
                .HasForeignKey(d => d.SecurityRoleId)
                .HasConstraintName("FK__Account__Securit__571DF1D5");

            entity.HasOne(d => d.Status).WithMany(p => p.Accounts)
                .HasForeignKey(d => d.StatusId)
                .HasConstraintName("FK__Account__StatusI__5629CD9C");
        });

        modelBuilder.Entity<Address>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__Address__3214EC27B3BEC607");

            entity.ToTable("Address");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.AddressLine1)
                .HasMaxLength(200)
                .IsUnicode(false);
            entity.Property(e => e.AddressLine2)
                .HasMaxLength(200)
                .IsUnicode(false);
            entity.Property(e => e.AddressLine3)
                .HasMaxLength(200)
                .IsUnicode(false);
            entity.Property(e => e.City)
                .HasMaxLength(100)
                .IsUnicode(false);
            entity.Property(e => e.Country)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.PostalCode)
                .HasMaxLength(10)
                .IsUnicode(false);
            entity.Property(e => e.State)
                .HasMaxLength(5)
                .IsUnicode(false);
        });

        modelBuilder.Entity<Customer>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__Customer__3214EC274579190C");

            entity.ToTable("Customer");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.AddressId).HasColumnName("AddressID");
            entity.Property(e => e.EmailAddress)
                .HasMaxLength(100)
                .IsUnicode(false);
            entity.Property(e => e.FirstName)
                .HasMaxLength(225)
                .IsUnicode(false);
            entity.Property(e => e.LastName)
                .HasMaxLength(225)
                .IsUnicode(false);
            entity.Property(e => e.NotificationPreferenceId).HasColumnName("NotificationPreferenceID");
            entity.Property(e => e.PasswordHash)
                .HasMaxLength(225)
                .IsUnicode(false);
            entity.Property(e => e.PhoneNumber)
                .HasMaxLength(15)
                .IsUnicode(false);

            entity.HasOne(d => d.Address).WithMany(p => p.Customers)
                .HasForeignKey(d => d.AddressId)
                .HasConstraintName("FK__Customer__Addres__5165187F");

            entity.HasOne(d => d.NotificationPreference).WithMany(p => p.Customers)
                .HasForeignKey(d => d.NotificationPreferenceId)
                .HasConstraintName("FK__Customer__Notifi__52593CB8");
        });

        modelBuilder.Entity<Discount>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__Discount__3214EC273EB34EA4");

            entity.ToTable("Discount");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.Amount).HasColumnType("decimal(18, 0)");
            entity.Property(e => e.DiscountTypeId).HasColumnName("DiscountTypeID");
            entity.Property(e => e.Title)
                .HasMaxLength(50)
                .IsUnicode(false);

            entity.HasOne(d => d.DiscountType).WithMany(p => p.Discounts)
                .HasForeignKey(d => d.DiscountTypeId)
                .HasConstraintName("FK__Discount__Discou__59FA5E80");
        });

        modelBuilder.Entity<DiscountType>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__Discount__3214EC2712FD809B");

            entity.ToTable("DiscountType");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.Title)
                .HasMaxLength(50)
                .IsUnicode(false);
        });

        modelBuilder.Entity<HoursOfOperation>(entity =>
        {
            entity
                .ToTable("HoursOfOperation");

            entity.Property(e => e.DayOfWeek)
                .HasMaxLength(25)
                .IsUnicode(false);
            entity.Property(e => e.Id)
                .ValueGeneratedOnAdd()
                .HasColumnName("ID");
            entity.Property(e => e.StoreId).HasColumnName("StoreID");

            entity.HasOne(d => d.Store).WithMany()
                .HasForeignKey(d => d.StoreId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_HoursOfOperation_Store");
        });

        modelBuilder.Entity<MeetingPurpose>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__MeetingP__3214EC2769F65440");

            entity.ToTable("MeetingPurpose");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.Title)
                .HasMaxLength(100)
                .IsUnicode(false);
        });

        modelBuilder.Entity<MeetingType>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__MeetingT__3214EC2724758791");

            entity.ToTable("MeetingType");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.Title)
                .HasMaxLength(100)
                .IsUnicode(false);
        });

        modelBuilder.Entity<MonetaryTransaction>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__Monetary__3214EC278C70240F");

            entity.ToTable("MonetaryTransaction");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.AmountPaid).HasColumnType("decimal(18, 0)");
            entity.Property(e => e.OrderId).HasColumnName("OrderID");
            entity.Property(e => e.PaymentTypeId).HasColumnName("PaymentTypeID");

            entity.HasOne(d => d.Order).WithMany(p => p.MonetaryTransactions)
                .HasForeignKey(d => d.OrderId)
                .HasConstraintName("FK__MonetaryT__Order__60A75C0F");

            entity.HasOne(d => d.PaymentType).WithMany(p => p.MonetaryTransactions)
                .HasForeignKey(d => d.PaymentTypeId)
                .HasConstraintName("FK__MonetaryT__Payme__619B8048");
        });

        modelBuilder.Entity<NotificationPreference>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__Notifica__3214EC2763581B19");

            entity.ToTable("NotificationPreference");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.Title)
                .HasMaxLength(100)
                .IsUnicode(false);
        });

        modelBuilder.Entity<Order>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__Order__3214EC279EC411DB");

            entity.ToTable("Order");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.AccountId).HasColumnName("AccountID");
            entity.Property(e => e.CreatedDate).HasColumnType("datetime");
            entity.Property(e => e.DropOffDate).HasColumnType("datetime");
            entity.Property(e => e.EstimatedCompleteDate).HasColumnType("datetime");
            entity.Property(e => e.Notes).HasColumnType("text");
            entity.Property(e => e.StatusId).HasColumnName("StatusID");
            entity.Property(e => e.StoreId).HasColumnName("StoreID");

            entity.HasOne(d => d.Account).WithMany(p => p.Orders)
                .HasForeignKey(d => d.AccountId)
                .HasConstraintName("FK__Order__AccountID__5CD6CB2B");

            entity.HasOne(d => d.Status).WithMany(p => p.Orders)
                .HasForeignKey(d => d.StatusId)
                .HasConstraintName("FK__Order__StatusID__5DCAEF64");

            entity.HasOne(d => d.Store).WithMany(p => p.Orders)
                .HasForeignKey(d => d.StoreId)
                .HasConstraintName("FK__Order__StoreID__123EB7A3");
        });

        modelBuilder.Entity<OrderDiscount>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__OrderDis__3214EC270F206CD1");

            entity.ToTable("OrderDiscount");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.DiscountId).HasColumnName("DiscountID");
            entity.Property(e => e.OrderId).HasColumnName("OrderID");

            entity.HasOne(d => d.Discount).WithMany(p => p.OrderDiscounts)
                .HasForeignKey(d => d.DiscountId)
                .HasConstraintName("FK__OrderDisc__Disco__656C112C");

            entity.HasOne(d => d.Order).WithMany(p => p.OrderDiscounts)
                .HasForeignKey(d => d.OrderId)
                .HasConstraintName("FK__OrderDisc__Order__6477ECF3");
        });

        modelBuilder.Entity<OrderItem>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__OrderIte__3214EC27F1236D2D");

            entity.ToTable("OrderItem");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.Notes).HasColumnType("text");
            entity.Property(e => e.OrderId).HasColumnName("OrderID");
            entity.Property(e => e.Price).HasColumnType("decimal(18, 0)");
            entity.Property(e => e.ServiceItemTypeId).HasColumnName("ServiceItemTypeID");

            entity.HasOne(d => d.Order).WithMany(p => p.OrderItems)
                .HasForeignKey(d => d.OrderId)
                .HasConstraintName("FK__OrderItem__Order__68487DD7");

            entity.HasOne(d => d.ServiceItemType).WithMany(p => p.OrderItems)
                .HasForeignKey(d => d.ServiceItemTypeId)
                .HasConstraintName("FK__OrderItem__Servi__693CA210");
        });

        modelBuilder.Entity<OrderItemDiscount>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__OrderIte__3214EC27B4CD7A7C");

            entity.ToTable("OrderItemDiscount");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.DiscountId).HasColumnName("DiscountID");
            entity.Property(e => e.OrderItemId).HasColumnName("OrderItemID");

            entity.HasOne(d => d.Discount).WithMany(p => p.OrderItemDiscounts)
                .HasForeignKey(d => d.DiscountId)
                .HasConstraintName("FK__OrderItem__Disco__6D0D32F4");

            entity.HasOne(d => d.OrderItem).WithMany(p => p.OrderItemDiscounts)
                .HasForeignKey(d => d.OrderItemId)
                .HasConstraintName("FK__OrderItem__Order__6C190EBB");
        });

        modelBuilder.Entity<OrderServicePromotional>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__OrderSer__3214EC27A36C74F1");

            entity.ToTable("OrderServicePromotional");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.OrderItemId).HasColumnName("OrderItemID");
            entity.Property(e => e.PromotionalId).HasColumnName("PromotionalID");

            entity.HasOne(d => d.OrderItem).WithMany(p => p.OrderServicePromotionals)
                .HasForeignKey(d => d.OrderItemId)
                .HasConstraintName("FK__OrderServ__Order__72C60C4A");

            entity.HasOne(d => d.Promotional).WithMany(p => p.OrderServicePromotionals)
                .HasForeignKey(d => d.PromotionalId)
                .HasConstraintName("FK__OrderServ__Promo__73BA3083");
        });

        modelBuilder.Entity<PaymentType>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__PaymentT__3214EC275913440F");

            entity.ToTable("PaymentType");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.Title)
                .HasMaxLength(50)
                .IsUnicode(false);
        });

        modelBuilder.Entity<Promotional>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__Promotio__3214EC27D89958A1");

            entity.ToTable("Promotional");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.DiscountTypeId).HasColumnName("DiscountTypeID");
            entity.Property(e => e.Price).HasColumnType("decimal(18, 0)");
            entity.Property(e => e.Title)
                .HasMaxLength(50)
                .IsUnicode(false);

            entity.HasOne(d => d.DiscountType).WithMany(p => p.Promotionals)
                .HasForeignKey(d => d.DiscountTypeId)
                .HasConstraintName("FK__Promotion__Disco__6FE99F9F");
        });

        modelBuilder.Entity<RecordStatus>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__RecordSt__3214EC27BB8CA0F5");

            entity.ToTable("RecordStatus");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.Title)
                .HasMaxLength(50)
                .IsUnicode(false);
        });

        modelBuilder.Entity<ScheduleEntry>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__Schedule__3214EC27C0E465D8");

            entity.ToTable("ScheduleEntry");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.AccountId).HasColumnName("AccountID");
            entity.Property(e => e.MeetingEnd).HasColumnType("datetime");
            entity.Property(e => e.MeetingPurposeId).HasColumnName("MeetingPurposeID");
            entity.Property(e => e.MeetingStart).HasColumnType("datetime");
            entity.Property(e => e.MeetingTypeId).HasColumnName("MeetingTypeID");
            entity.Property(e => e.Notes).HasColumnType("text");

            entity.HasOne(d => d.Account).WithMany(p => p.ScheduleEntries)
                .HasForeignKey(d => d.AccountId)
                .HasConstraintName("FK__ScheduleE__Accou__76969D2E");

            entity.HasOne(d => d.MeetingPurpose).WithMany(p => p.ScheduleEntries)
                .HasForeignKey(d => d.MeetingPurposeId)
                .HasConstraintName("FK__ScheduleE__Meeti__787EE5A0");

            entity.HasOne(d => d.MeetingType).WithMany(p => p.ScheduleEntries)
                .HasForeignKey(d => d.MeetingTypeId)
                .HasConstraintName("FK__ScheduleE__Meeti__778AC167");
        });

        modelBuilder.Entity<SecurityPermission>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__Security__3214EC27FF799B96");

            entity.ToTable("SecurityPermission");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.Title)
                .HasMaxLength(50)
                .IsUnicode(false);
        });

        modelBuilder.Entity<SecurityRole>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__Security__3214EC27F4BEA0F7");

            entity.ToTable("SecurityRole");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.Title)
                .HasMaxLength(100)
                .IsUnicode(false);
        });

        modelBuilder.Entity<SecurityRolePermission>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__Security__3214EC273BE4A672");

            entity.ToTable("SecurityRolePermission");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.SecurityPermissionId).HasColumnName("SecurityPermissionID");
            entity.Property(e => e.SecurityRoleId).HasColumnName("SecurityRoleID");

            entity.HasOne(d => d.SecurityPermission).WithMany(p => p.SecurityRolePermissions)
                .HasForeignKey(d => d.SecurityPermissionId)
                .HasConstraintName("FK__SecurityR__Secur__4D94879B");

            entity.HasOne(d => d.SecurityRole).WithMany(p => p.SecurityRolePermissions)
                .HasForeignKey(d => d.SecurityRoleId)
                .HasConstraintName("FK__SecurityR__Secur__4E88ABD4");
        });

        modelBuilder.Entity<Service>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__Service__3214EC27562682EA");

            entity.ToTable("Service");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.Price).HasColumnType("decimal(18, 0)");
            entity.Property(e => e.StoreId).HasColumnName("StoreID");
            entity.Property(e => e.TaxRate).HasColumnType("decimal(18, 0)");
            entity.Property(e => e.Title)
                .HasMaxLength(100)
                .IsUnicode(false);

            entity.HasOne(d => d.Store).WithMany(p => p.Services)
                .HasForeignKey(d => d.StoreId)
                .HasConstraintName("FK__Service__StoreID__114A936A");
        });

        modelBuilder.Entity<ServiceItemType>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__ServiceI__3214EC2747B1BB16");

            entity.ToTable("ServiceItemType");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.Price).HasColumnType("decimal(18, 0)");
            entity.Property(e => e.ServiceId).HasColumnName("ServiceID");
            entity.Property(e => e.Title)
                .HasMaxLength(50)
                .IsUnicode(false);

            entity.HasOne(d => d.Service).WithMany(p => p.ServiceItemTypes)
                .HasForeignKey(d => d.ServiceId)
                .HasConstraintName("FK__ServiceIt__Servi__4AB81AF0");
        });

        modelBuilder.Entity<ServicePromotional>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__ServiceP__3214EC27DF7EA627");

            entity.ToTable("ServicePromotional");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.PromotionalId).HasColumnName("PromotionalID");
            entity.Property(e => e.ServiceId).HasColumnName("ServiceID");
            entity.Property(e => e.Title)
                .HasMaxLength(100)
                .IsUnicode(false);

            entity.HasOne(d => d.Service).WithMany(p => p.ServicePromotionals)
                .HasForeignKey(d => d.ServiceId)
                .HasConstraintName("FK__ServicePr__Servi__7B5B524B");
        });

        modelBuilder.Entity<Store>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__Store__3214EC27097C4E05");

            entity.ToTable("Store");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.AddressId).HasColumnName("AddressID");
            entity.Property(e => e.Title)
                .HasMaxLength(255)
                .IsUnicode(false);

            entity.HasOne(d => d.Address).WithMany(p => p.Stores)
                .HasForeignKey(d => d.AddressId)
                .HasConstraintName("FK__Store__AddressID__0D7A0286");
        });

        modelBuilder.Entity<StoreInformation>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__StoreInf__3214EC27FA38C8AA");

            entity.ToTable("StoreInformation");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.InformationKey)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.InformationValue).HasColumnType("text");
            entity.Property(e => e.StoreId).HasColumnName("StoreID");

            entity.HasOne(d => d.Store).WithMany(p => p.StoreInformations)
                .HasForeignKey(d => d.StoreId)
                .HasConstraintName("FK__StoreInfo__Store__10566F31");
        });

        modelBuilder.Entity<Testimonial>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__Testimon__3214EC270C5D05C8");

            entity.ToTable("Testimonial");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.Body).HasColumnType("text");
            entity.Property(e => e.CustomerId).HasColumnName("CustomerID");
            entity.Property(e => e.StoreId).HasColumnName("StoreID");
            entity.Property(e => e.Subject).HasColumnType("text");

            entity.HasOne(d => d.Customer).WithMany(p => p.Testimonials)
                .HasForeignKey(d => d.CustomerId)
                .HasConstraintName("FK__Testimoni__Custo__2DE6D218");

            entity.HasOne(d => d.Store).WithMany(p => p.Testimonials)
                .HasForeignKey(d => d.StoreId)
                .HasConstraintName("FK__Testimoni__Store__2EDAF651");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
