package com.rental_hub.services;

import java.util.List;

import org.assertj.core.api.Assertions;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.rental_hub.repositories.EquipmentRepository;
import com.rental_hub.repositories.TagRepository;
import com.rental_hub.entities.Equipment;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class EquipmentServiceIT {

    @Autowired EquipmentRepository equipmentRepo; 
    @Autowired TagRepository taddgRepo;
    @Autowired EquipmentService equipmentService;

    @BeforeEach
    void setup() {
        equipmentRepo.deleteAll();

        equipmentRepo.saveAll(List.of(
            createEquipment("Excavator 3000", "Heavy Machinery", "Caterpillar", 12000, true),
            createEquipment("Chainsaw Pro", "Tool", "Stihl", 1500, true),
            createEquipment("Concrete Mixer", "Heavy Machinery", "Bosch", 5500, false),
            createEquipment("Lawn Mower X", "Garden", "Honda", 2000, true)
        ));
    }

    private static Equipment createEquipment(String name, String type, String brand, int pricePerDayCents, boolean available) {
        Equipment e = new Equipment(); 
        e.setName(name);
        e.setType(type);
        e.setBrand(brand);
        e.setPricePerDayCents(pricePerDayCents);
        e.setAvailable(available);
        return e;
      }

    @Test
    public void getEquipmentsInPriceRangeInCentsIntegrationTest(){
        List<Equipment> result = equipmentService.getEquipmentsInPriceRangeInCents(1700, 15000);

        Assertions.assertThat(result).size().isEqualTo(2);
    } 


    
}
