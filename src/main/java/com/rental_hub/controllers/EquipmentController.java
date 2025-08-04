package com.rental_hub.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
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
    
}
