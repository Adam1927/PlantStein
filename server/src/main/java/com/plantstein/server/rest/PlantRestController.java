package com.plantstein.server.rest;

import com.plantstein.server.dto.PlantConditionDTA;
import com.plantstein.server.model.Plant;
import com.plantstein.server.repository.PlantRepository;
import io.swagger.v3.oas.annotations.Operation;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import org.hibernate.cfg.NotYetImplementedException;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/plant")
@RequiredArgsConstructor
public class PlantRestController {
    private final PlantRepository plantRepository;

    @Operation(summary = "Get all plants of user", tags = { "plant" })
    @GetMapping("/all")
    public List<Plant> getAll(@RequestHeader String clientId) {
        throw new NotYetImplementedException();
    }

    @Operation(summary = "Get plants of user by nickname", tags = { "plant" })
    @GetMapping("/nickname/{nickname}")
    public List<Plant> getByNickname(@PathVariable String nickname, @RequestHeader String clientId) {
        throw new NotYetImplementedException();
    }

    @Operation(summary = "Get details of plant", tags = {"plant"})
    @GetMapping("/get/{id}")
    public Plant getPlant(@PathVariable Long id, @RequestHeader String clientId) {
        throw new NotYetImplementedException();
    }

    @Operation(summary = "Add plant", tags = {"plant"})
    @PostMapping("/add")
    public Plant addPlant(@RequestBody Plant plant, @RequestHeader String clientId) {
        throw new NotYetImplementedException();
    }

    @Operation(summary = "Rename plant", tags = {"plant"})
    @PutMapping("/rename/{id}/{newName}")
    public Plant renamePlant(@PathVariable Long id, String newName, @RequestHeader String clientId) {
        throw new NotYetImplementedException();
    }

    @Operation(summary = "Delete plant", tags = {"plant"})
    @DeleteMapping("/delete/{id}")
    public Plant deletePlant(@PathVariable Long id, @RequestHeader String clientId) {
        throw new NotYetImplementedException();
    }

    @Operation(summary = "Get condition", tags = {"plant"})
    @GetMapping("/condition/{id}")
    public PlantConditionDTA getCondition(@PathVariable Long id, @RequestHeader String clientId) {
        throw new NotYetImplementedException();
    }

    @Operation(summary = "Get condition over time", tags = {"plant"})
    @GetMapping("/condition/{id}/{days}")
    public List<PlantConditionDTA> getConditionOverTime(@PathVariable Long id, Integer days, @RequestHeader String clientId) {
        throw new NotYetImplementedException();
    }

}
