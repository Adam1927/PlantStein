package com.plantstein.server.rest;

import com.plantstein.server.model.Plant;
import com.plantstein.server.repository.PlantRepository;
import io.swagger.v3.oas.annotations.Operation;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequiredArgsConstructor
public class ApplicationRestController {
    private final PlantRepository plantRepository;

    @Operation(summary = "Get all plants", tags = { "plant" })
    @GetMapping("/plants")
    public List<Plant> getPlants() {
        return plantRepository.findAll();
    }

    @Operation(summary = "Get plants by nickname", tags = { "plant" })
    @GetMapping("/plants/nickname/{nickname}")
    public List<Plant> getPlantsByNickname(@PathVariable String nickname) {
        return plantRepository.findByNickname(nickname);
    }
}
