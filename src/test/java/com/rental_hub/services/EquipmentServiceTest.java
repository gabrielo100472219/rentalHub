package com.rental_hub.services;

import com.rental_hub.entities.Equipment;
import com.rental_hub.repositories.EquipmentRepository;
import com.rental_hub.repositories.TagRepository;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.Mockito;

import java.util.Collections;
import java.util.List;

import static org.assertj.core.api.Assertions.assertThat;
import static org.mockito.Mockito.when;

class EquipmentServiceTest {
    private final EquipmentRepository equipmentRepo = Mockito.mock(EquipmentRepository.class);
    private final TagRepository tagRepo = Mockito.mock(TagRepository.class);
    EquipmentService equipmentService = new EquipmentService(equipmentRepo, tagRepo);
    private final Equipment[] equipments = new Equipment[10];

    @BeforeEach
    void setUp() {
        for (int i = 0; i < 10; i++) {
            equipments[i] = createEquipmentAvailablePrice(i, i % 2 == 0);
        }
    }

    @Test
    void checkMinSmallerOrEqualMax() {
        when(equipmentRepo.findAll()).thenReturn(List.of(createEquipmentAvailablePrice(10, true)));

        List<Equipment> result = equipmentService.getEquipmentsInPriceRangeInCents(14, 7);

       assertThat(result).isEmpty(); 
    }

    @Test
    void getZeroPriceMatchingEquipments() {
        // arrange - given
        when(equipmentRepo.findAll()).thenReturn(List.of(equipments));

        // act - when
        List<Equipment> result = equipmentService.getEquipmentsInPriceRangeInCents(10, 15);

        // assert - then
        assertThat(result).isEmpty();
    }

    @Test
    void getZeroAvailableMatchingEquipments() {
        // arrange - given
        List<Equipment> unavailableEquipments = List.of(createEquipmentAvailablePrice(7, false));
        when(equipmentRepo.findAll()).thenReturn(unavailableEquipments);

        // act - when
        List<Equipment> result = equipmentService.getEquipmentsInPriceRangeInCents(7, 7);

        // assert - then
        assertThat(result).isEmpty();
    }

    private static Equipment createEquipmentAvailablePrice(int pricePerDay, boolean available) {
        Equipment equipment = new Equipment();
        equipment.setPricePerDayCents(pricePerDay);
        equipment.setAvailable(available);
        return equipment;
    }

    @Test
    void getZeroEquipmentsFromDB() {
        when(equipmentRepo.findAll()).thenReturn(Collections.emptyList());

        List<Equipment> result = equipmentService.getEquipmentsInPriceRangeInCents(1, 2);

        assertThat(result).isEmpty();
    }

    @Test
    void getOneEquipmentInPriceRangeInCents() {
        when(equipmentRepo.findAll()).thenReturn(List.of(equipments));
        List<Equipment> result = equipmentService.getEquipmentsInPriceRangeInCents(0, 1);

        assertThat(result).size().isEqualTo(1);
    }

    @Test
    void getManyEquipmentsInPriceRangeInCents() {
        when(equipmentRepo.findAll()).thenReturn(List.of(equipments));
        List<Equipment> result = equipmentService.getEquipmentsInPriceRangeInCents(1, 8);

        assertThat(result).size().isEqualTo(4);
    }
}
