package com.rental_hub.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import com.rental_hub.entities.Equipment;
import com.rental_hub.services.EquipmentService;

import java.util.List;

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
        equipmentService.addTagToEquipment(tag, equipmentId);
    }

    @GetMapping("/equipments")
    public List<Equipment> getEquipmentsInPriceRangeInCents(@RequestParam Integer min, @RequestParam Integer max) {
       return equipmentService.getEquipmentsInPriceRangeInCents(min, max);
    }
}
