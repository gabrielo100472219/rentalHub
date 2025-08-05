package com.rental_hub.entities;

import java.util.Set;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToMany;

@Entity
public class Tag {

    @Id
    private String tag;

    @ManyToMany(mappedBy = "tags")
    private Set<Equipment> equipments;

    public String getTag() {
        return tag;
    }

    public void setTag(String tag) {
        this.tag = tag;
    }

    public Set<Equipment> getEquipments() {
        return equipments;
    }
}
