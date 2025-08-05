package com.rental_hub.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rental_hub.repositories.EquipmentRepository;
import com.rental_hub.repositories.TagRepository;

import jakarta.persistence.EntityNotFoundException;

import com.rental_hub.entities.Equipment;
import com.rental_hub.entities.Tag;

@Service
public class EquipmentService {
    
    @Autowired
    private EquipmentRepository equipmentRepo;

    @Autowired
    private TagRepository tagRepo;

    public void addEquipment(Equipment equipment) {
        equipmentRepo.save(equipment);
    }

    public void updateEquipment(int id, Equipment equipment) {
        Equipment equipmentToUpdate = equipmentRepo.findById(id)
            .orElseThrow(() -> new EntityNotFoundException("Entity not found"));
        equipmentToUpdate.setName(equipment.getName());
        equipmentToUpdate.setBrand(equipment.getBrand());
        equipmentToUpdate.setType(equipment.getType());
        equipmentToUpdate.setPricePerDay(equipment.getPricePerDay());
        equipmentToUpdate.setAvailable(equipment.isAvailable());
        equipmentRepo.save(equipmentToUpdate);
    }

    public void addTagToEquipment(String tagId, int equipmentId) {
        Equipment equipment = equipmentRepo.findById(equipmentId)
            .orElseThrow(() -> new EntityNotFoundException());
        Tag tag = tagRepo.findById(tagId)
            .orElseThrow(() -> new EntityNotFoundException());

        equipment.getTags().add(tag);
        tag.getEquipments().add(equipment);

        equipmentRepo.save(equipment);
        tagRepo.save(tag);
    }
}
