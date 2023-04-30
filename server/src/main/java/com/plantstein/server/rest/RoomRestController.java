package com.plantstein.server.rest;

import com.plantstein.server.exception.AlreadyExistsException;
import com.plantstein.server.model.Room;
import com.plantstein.server.model.RoomId;
import com.plantstein.server.model.RoomTimeSeries;
import com.plantstein.server.repository.RoomRepository;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.hibernate.cfg.NotYetImplementedException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.webjars.NotFoundException;

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
        return roomRepository.findAll();
    }

    @Operation(summary = "Add a room")
    @ApiResponse(responseCode = "201", description = "Room added")
    @ApiResponse(responseCode = "400", description = "Room already exists", content = @Content)
    @PostMapping("/add")
    public ResponseEntity<Room> add(@RequestBody String roomName, @RequestHeader String clientId) {
        if (roomRepository.existsById(new RoomId(roomName, clientId))) {
            throw new AlreadyExistsException("Room already exists");
        }

        return new ResponseEntity<>(roomRepository.save(Room.builder()
                .roomId(new RoomId(roomName, clientId))
                .build()
        ), HttpStatus.CREATED);
    }

    @Operation(summary = "Rename room")
    @ApiResponse(responseCode = "200", description = "Room renamed")
    @ApiResponse(responseCode = "404", description = "Room does not exist", content = @Content)
    @PutMapping("/rename/{roomName}/{newName}")
    public Room rename(@PathVariable String roomName, @PathVariable String newName, @RequestHeader String clientId) {
        if (!roomRepository.existsById(new RoomId(roomName, clientId))) {
            throw new NotFoundException("Room " + roomName + " does not exist");
        }

        roomRepository.updateRoomName(roomName, clientId, newName);

        return roomRepository.findById(new RoomId(newName, clientId)).orElseThrow();
    }

    @Operation(summary = "Get current room condition")
    @ApiResponse(responseCode = "200", description = "Room condition object")
    @GetMapping("/condition/{id}")
    public RoomTimeSeries getCondition(@PathVariable Long id, @RequestHeader String clientId) {
        throw new NotYetImplementedException();
    }

    @Operation(summary = "Get room condition over time")
    @ApiResponse(responseCode = "200", description = "List of room condition objects")
    @GetMapping("/condition/{id}/{days}")
    public List<RoomTimeSeries> getCondition(@PathVariable Long id, @PathVariable Integer days, @RequestHeader String clientId) {
        throw new NotYetImplementedException();
    }

    @Operation(summary = "Delete a room")
    @ApiResponse(responseCode = "200", description = "Room deleted")
    @ApiResponse(responseCode = "404", description = "Room does not exist", content = @Content)
    @DeleteMapping("/delete/{roomName}")
    public Room delete(@PathVariable String roomName, @RequestHeader String clientId) {
        Room room = roomRepository.findById(new RoomId(roomName, clientId))
                .orElseThrow(() -> new NotFoundException("Room " + roomName + " does not exist"));

        roomRepository.deleteById(new RoomId(roomName, clientId));

        return room;
    }

}
