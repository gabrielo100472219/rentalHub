package com.rental_hub.entities;

import java.sql.Timestamp;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
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

    // Setters

    public void setId(int id) {
        this.id = id;
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
}
