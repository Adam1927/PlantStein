package com.plantstein.server.rest;


import com.plantstein.server.model.Species;
import com.plantstein.server.repository.SpeciesRepository;
import io.swagger.v3.oas.annotations.Operation;
import lombok.RequiredArgsConstructor;
import org.hibernate.cfg.NotYetImplementedException;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/species")
@RequiredArgsConstructor
public class SpeciesRestController {
    private final SpeciesRepository speciesRepository;

    @Operation(summary = "Get all species", tags = {"species"})
    @GetMapping("/getAll")
    public List<Species> getAll() {
        return speciesRepository.findAll();
    }

    @Operation(summary = "Get species by ID", tags = "species")
    @GetMapping("/get/{id}")
    public Species getSpecies() {
        throw new NotYetImplementedException();
    }

}
