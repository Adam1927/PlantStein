package com.plantstein.server.rest;

import com.plantstein.server.dto.RoomConditionDTA;
import com.plantstein.server.model.Room;
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

    @Operation(summary = "Get all rooms of user", tags = { "room" })
    @GetMapping("/all")
    public List<Room> getAll() {
        throw new NotYetImplementedException();
    }

    @Operation(summary = "Add a room", tags = { "room" })
    @PostMapping("/add")
    public Room add(@ModelAttribute Room room) {
        throw new NotYetImplementedException();
    }

    @Operation(summary = "Rename room", tags = { "room" })
    @PutMapping("/rename/{id}/{newName}")
    public Room rename(@PathVariable Long id, @PathVariable String newName) {
        throw new NotYetImplementedException();
    }

    @Operation(summary = "Get current room condition", tags = {"room"})
    @GetMapping("/condition/{id}")
    public RoomConditionDTA getCondition(@PathVariable Long id) {
        throw new NotYetImplementedException();
    }

    @Operation(summary = "Get room condition over time", tags = {"room"})
    @GetMapping("/condition/{id}/{days}")
    public List<RoomConditionDTA> getCondition(@PathVariable Long id, @PathVariable Integer days) {
        throw new NotYetImplementedException();
    }

    @Operation(summary = "Delete a room", tags = { "room" })
    @DeleteMapping("/delete/{id}")
    public Room delete(@PathVariable Long id) {
        throw new NotYetImplementedException();
    }


}
