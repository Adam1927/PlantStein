package com.plantstein.server.rest;

import com.plantstein.server.dto.RoomConditionDTA;
import com.plantstein.server.exception.AlreadyExistsException;
import com.plantstein.server.model.Room;
import com.plantstein.server.model.RoomId;
import com.plantstein.server.repository.RoomRepository;
import io.swagger.v3.oas.annotations.Operation;
import lombok.RequiredArgsConstructor;
import org.hibernate.cfg.NotYetImplementedException;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/room")
@RequiredArgsConstructor
public class RoomRestController {
    private final RoomRepository roomRepository;

    @Operation(summary = "Get all rooms of user", tags = {"room"})
    @GetMapping("/all")
    public List<Room> getAll(@RequestHeader String clientId) {
        throw new NotYetImplementedException();
    }

    @Operation(summary = "Add a room", tags = {"room"})
    @PostMapping("/add")
    public Room add(@RequestBody String roomName, @RequestHeader String clientId) {
        if(roomRepository.existsById(new RoomId(roomName, clientId))) {
            throw new AlreadyExistsException("Room already exists");
        }

        return roomRepository.save(Room.builder()
                .name(roomName)
                .clientId(clientId)
                .build()
        );
    }

    @Operation(summary = "Rename room", tags = {"room"})
    @PutMapping("/rename/{id}/{newName}")
    public Room rename(@PathVariable Long id, @PathVariable String newName, @RequestHeader String clientId) {
        throw new NotYetImplementedException();
    }

    @Operation(summary = "Get current room condition", tags = {"room"})
    @GetMapping("/condition/{id}")
    public RoomConditionDTA getCondition(@PathVariable Long id, @RequestHeader String clientId) {
        throw new NotYetImplementedException();
    }

    @Operation(summary = "Get room condition over time", tags = {"room"})
    @GetMapping("/condition/{id}/{days}")
    public List<RoomConditionDTA> getCondition(@PathVariable Long id, @PathVariable Integer days, @RequestHeader String clientId) {
        throw new NotYetImplementedException();
    }

    @Operation(summary = "Delete a room", tags = {"room"})
    @DeleteMapping("/delete/{id}")
    public Room delete(@PathVariable Long id, @RequestHeader String clientId) {
        throw new NotYetImplementedException();
    }


}
