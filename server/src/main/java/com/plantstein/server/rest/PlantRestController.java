package com.plantstein.server.rest;

import com.plantstein.server.dto.PlantConditionDTA;
import com.plantstein.server.model.Plant;
import com.plantstein.server.repository.PlantRepository;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.validation.constraints.Positive;
import lombok.RequiredArgsConstructor;
import org.hibernate.cfg.NotYetImplementedException;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * The rest controller for all plant related requests.
 */
@RestController
@RequestMapping("/plant")
@Tag(name = "Plant")
@RequiredArgsConstructor
public class PlantRestController {
    private final PlantRepository plantRepository;

    @Operation(summary = "Get all plants of user")
    @ApiResponse(responseCode = "200", description = "List of plants")
    @GetMapping("/all")
    public List<Plant> getAll(@RequestHeader String clientId) {
        throw new NotYetImplementedException();
    }

    @Operation(summary = "Get plants of user by nickname")
    @ApiResponse(responseCode = "200", description = "List of plants with that nickname (can be empty)")
    @GetMapping("/nickname/{nickname}")
    public List<Plant> getByNickname(@PathVariable String nickname, @RequestHeader String clientId) {
        throw new NotYetImplementedException();
    }

    @Operation(summary = "Get details of plant")
    @ApiResponse(responseCode = "200", description = "Plant details")
    @ApiResponse(responseCode = "404", description = "Plant with that ID not found", content = @Content)
    @GetMapping("/get/{id}")
    public Plant getPlant(@PathVariable Long id, @RequestHeader String clientId) {
        throw new NotYetImplementedException();
    }

    @Operation(summary = "Add plant")
    @ApiResponse(responseCode = "201", description = "Added plant")
    @ApiResponse(responseCode = "400", description = "Invalid plant data", content = @Content)
    @PostMapping("/add")
    public ResponseEntity<Plant> addPlant(@RequestBody Plant plant, @RequestHeader String clientId) {
        throw new NotYetImplementedException();
    }

    @Operation(summary = "Rename plant")
    @ApiResponse(responseCode = "200", description = "Plant renamed")
    @ApiResponse(responseCode = "404", description = "Plant with that ID not found", content = @Content)
    @PutMapping("/rename/{id}/{newName}")
    public Plant renamePlant(@PathVariable Long id, String newName, @RequestHeader String clientId) {
        throw new NotYetImplementedException();
    }

    @Operation(summary = "Delete plant")
    @ApiResponse(responseCode = "200", description = "Plant deleted")
    @ApiResponse(responseCode = "404", description = "Plant with that ID not found", content = @Content)
    @DeleteMapping("/delete/{id}")
    public Plant deletePlant(@PathVariable Long id, @RequestHeader String clientId) {
        throw new NotYetImplementedException();
    }

    @Operation(summary = "Get condition")
    @ApiResponse(responseCode = "200", description = "Plant condition object")
    @ApiResponse(responseCode = "404", description = "Plant with that ID not found", content = @Content)
    @GetMapping("/condition/{id}")
    public PlantConditionDTA getCondition(@PathVariable Long id, @RequestHeader String clientId) {
        throw new NotYetImplementedException();
    }

    @Operation(summary = "Get condition over time")
    @ApiResponse(responseCode = "200", description = "List of plant condition objects")
    @ApiResponse(responseCode = "400", description = "Invalid number of days", content = @Content)
    @ApiResponse(responseCode = "404", description = "Plant with that ID not found", content = @Content)
    @GetMapping("/condition/{id}/{days}")
    public List<PlantConditionDTA> getConditionOverTime(@PathVariable Long id, @Positive Integer days, @RequestHeader String clientId) {
        throw new NotYetImplementedException();
    }

}
