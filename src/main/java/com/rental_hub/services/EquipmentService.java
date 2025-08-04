package com.rental_hub.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rental_hub.repositories.EquipmentRepository;
import com.rental_hub.entities.Equipment;

@Service
public class EquipmentService {
    
    @Autowired
    private EquipmentRepository repo;

    public void addEquipment(Equipment equipment) {
        repo.save(equipment);
    }
}
