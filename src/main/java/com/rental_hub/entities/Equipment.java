package com.rental_hub.entities;

import java.sql.Timestamp;
import java.util.Set;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.JoinTable;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.PrePersist;
import jakarta.persistence.PreUpdate;
import jakarta.persistence.Table;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;

@Entity
@Table(name="EQUPMENTS")
public class Equipment {
    @Id
    @GeneratedValue
    private int id;

    @Column(nullable=false)
    private String name;

    @Column(nullable=false)
    private String type;

    @Column(nullable=false)
    private String brand;

    @Column(nullable=false)
    private float pricePerDay;

    @Column(nullable=false)
    private boolean available;

    @Temporal(TemporalType.TIMESTAMP)
    private Timestamp createdAt;

    @Temporal(TemporalType.TIMESTAMP)
    private Timestamp updatedAt;

    @ManyToMany
    @JoinTable(
        name="EQUIPMENT_TAG",
        joinColumns=@JoinColumn(name="tag"),
        inverseJoinColumns = @JoinColumn(name="id")
    )
    private Set<Tag> tags;

    public Equipment() {}
    // Lifecycle callback methods
    
    @PrePersist
    public void onPrePersist() {
        Timestamp now = new Timestamp(System.currentTimeMillis());
        this.createdAt = now;
        this.updatedAt = now;
    }

    @PreUpdate
    public void onPreUpdate() {
        Timestamp now = new Timestamp(System.currentTimeMillis());
        this.updatedAt = now;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setType(String type) {
        this.type = type;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public void setPricePerDay(float pricePerDay) {
        this.pricePerDay = pricePerDay;
    }

    public void setAvailable(boolean available) {
        this.available = available;
    }

    public String getName() {
        return name;
    }

    public String getType() {
        return type;
    }

    public String getBrand() {
        return brand;
    }

    public float getPricePerDay() {
        return pricePerDay;
    }

    public boolean isAvailable() {
        return available;
    }

    public Timestamp getCreatedAt() {
        return createdAt;
    }

    public Timestamp getUpdatedAt() {
        return updatedAt;
    }

    public Set<Tag> getTags() {
        return tags;
    }

}
