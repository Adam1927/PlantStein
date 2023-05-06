package com.plantstein.server.rest;

import com.plantstein.server.exception.AlreadyExistsException;
import com.plantstein.server.exception.NotFoundException;
import com.plantstein.server.model.Plant;
import com.plantstein.server.model.Room;
import com.plantstein.server.model.RoomTimeSeries;
import com.plantstein.server.repository.RoomRepository;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.validation.ConstraintViolationException;
import lombok.RequiredArgsConstructor;
import org.hibernate.cfg.NotYetImplementedException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * The rest controller for all room related requests.
 */
@RestController
@RequestMapping("/room")
@Tag(name = "Room")
@RequiredArgsConstructor
public class RoomRestController {
    private final RoomRepository roomRepository;

    @Operation(summary = "Get all rooms of user")
    @ApiResponse(responseCode = "200", description = "List of rooms")
    @GetMapping("/all")
    public List<Room> getAll(@RequestHeader String clientId) {
        return roomRepository.findByClientId(clientId);
    }

    @Operation(summary = "Get plants in room")
    @ApiResponse(responseCode = "200", description = "List of plants in room")
    @ApiResponse(responseCode = "404", description = "Room does not exist", content = @Content)
    @GetMapping("/{roomId}/plants")
    public List<Plant> getPlantsInRoom(@PathVariable Long roomId) {
        roomRepository.findById(roomId)
                .orElseThrow(() -> new NotFoundException("Room does not exist"));

        return roomRepository.getPlantsInRoom(roomId);
    }

    @Operation(summary = "Add a room")
    @ApiResponse(responseCode = "201", description = "Room added")
    @ApiResponse(responseCode = "400", description = "Room already exists", content = @Content)
    @PostMapping("/add")
    public ResponseEntity<Room> add(@RequestBody String roomName, @RequestHeader String clientId) {
        Room newRoom = Room.builder()
                .name(roomName)
                .build();

        try {
            return new ResponseEntity<>(
                    roomRepository.save(newRoom),
                    HttpStatus.CREATED);
        } catch (ConstraintViolationException e) {
            throw new AlreadyExistsException("Room " + roomName + " already exists for this client");
        }
    }


    @Operation(summary = "Rename room")
    @ApiResponse(responseCode = "200", description = "Room renamed")
    @ApiResponse(responseCode = "404", description = "Room does not exist", content = @Content)
    @PutMapping("/rename/{roomId}/{newName}")
    public Room rename(@PathVariable Long roomId, @PathVariable String newName) {
        if (!roomRepository.existsById(roomId)) {
            throw new NotFoundException("Room " + roomId + " does not exist");
        }

        roomRepository.updateRoomName(roomId, newName);

        return roomRepository.findById(roomId).orElseThrow();
    }

    @Operation(summary = "Get current room condition")
    @ApiResponse(responseCode = "200", description = "Room condition object")
    @GetMapping("/condition/{id}")
    public RoomTimeSeries getCondition(@PathVariable Long id) {
        throw new NotYetImplementedException();
    }

    @Operation(summary = "Get room condition over time")
    @ApiResponse(responseCode = "200", description = "List of room condition objects")
    @GetMapping("/condition/{id}/{days}")
    public List<RoomTimeSeries> getCondition(@PathVariable Long id, @PathVariable Integer days) {
        throw new NotYetImplementedException();
    }

    @Operation(summary = "Delete a room")
    @ApiResponse(responseCode = "200", description = "Room deleted")
    @ApiResponse(responseCode = "404", description = "Room does not exist", content = @Content)
    @DeleteMapping("/delete/{roomName}")
    public Room delete(@PathVariable Long roomId) {
        Room room = roomRepository.findById(roomId)
                .orElseThrow(() -> new NotFoundException("Room with ID " + roomId + " does not exist"));

        roomRepository.deleteById(roomId);

        return room;
    }

}
