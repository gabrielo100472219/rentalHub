package com.rental_hub.services;

import com.rental_hub.entities.Equipment;
import com.rental_hub.repositories.EquipmentRepository;
import com.rental_hub.repositories.TagRepository;
import org.assertj.core.api.Assertions;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.Mockito;

import java.util.List;

class EquipmentServiceTest {
    private final EquipmentRepository equipmentRepo = Mockito.mock(EquipmentRepository.class);
    private final TagRepository tagRepo = Mockito.mock(TagRepository.class);
    EquipmentService equipmentService = new EquipmentService(equipmentRepo, tagRepo);
    private final Equipment[] equipments = new Equipment[10];

    @BeforeEach
    void setUp() {
        for (int i = 0; i < 10; i++) {
            equipments[i] = new Equipment();
            equipments[i].setPricePerDayCents(i);
            equipments[i].setAvailable(i % 2 == 0);
        }
    }

    @Test
    void getZeroPriceMatchingEquipments() {
        // arrange - given
        Mockito.when(equipmentRepo.findAll()).thenReturn(List.of(equipments));

        // act - when
        List<Equipment> result = equipmentService.getEquipmentsInPriceRangeInCents(10, 15);

        // assert - then
        Assertions.assertThat(result).isEmpty();
    }

    @Test
    void getZeroAvailableMatchingEquipments() {
        // arrange - given
        Mockito.when(equipmentRepo.findAll()).thenReturn(List.of(equipments));

        // act - when
        List<Equipment> result = equipmentService.getEquipmentsInPriceRangeInCents(7, 7);

        // assert - then
        Assertions.assertThat(result).isEmpty();
    }

    @Test
    void getZeroEquipmentsFromDB() {
        Mockito.when(equipmentRepo.findAll()).thenReturn(List.of(new Equipment[0]));

        List<Equipment> result = equipmentService.getEquipmentsInPriceRangeInCents(1, 2);

        Assertions.assertThat(result).isEmpty();
    }

    @Test
    void getOneEquipmentInPriceRangeInCents() {
        Mockito.when(equipmentRepo.findAll()).thenReturn(List.of(equipments));
        List<Equipment> result = equipmentService.getEquipmentsInPriceRangeInCents(0, 1);

        Assertions.assertThat(result).size().isEqualTo(1);
    }

    @Test
    void getManyEquipmentsInPriceRangeInCents() {
        Mockito.when(equipmentRepo.findAll()).thenReturn(List.of(equipments));
        List<Equipment> result = equipmentService.getEquipmentsInPriceRangeInCents(1, 8);

        Assertions.assertThat(result).size().isEqualTo(4);
    }

    // preguntar demasiados equipments??
}
