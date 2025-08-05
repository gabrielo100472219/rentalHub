package com.rental_hub.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.rental_hub.entities.Equipment;
import com.rental_hub.services.EquipmentService;

@RestController
public class EquipmentController {
    @Autowired
    private EquipmentService equipmentService;

    @PostMapping("/equipments")
    public void postEquipment(@RequestBody Equipment equipment) {
        equipmentService.addEquipment(equipment); 
    }

    @PutMapping("/equipments/{id}")
    public void putEquipment(@PathVariable int id, @RequestBody Equipment equipment) {
        equipmentService.updateEquipment(id, equipment);
    }

    @PostMapping("/equipments/{equipmentId}/tags")
    public void addTagToEquipment(@PathVariable int equipmentId, @RequestBody String tag) {
        System.out.println("tag: " + tag);
        equipmentService.addTagToEquipment(tag, equipmentId);
    }
}
