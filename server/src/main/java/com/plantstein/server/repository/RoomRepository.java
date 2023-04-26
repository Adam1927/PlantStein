package com.plantstein.server.repository;

import com.plantstein.server.model.Room;
import com.plantstein.server.model.RoomId;
import jakarta.persistence.*;
import jakarta.validation.constraints.NotEmpty;
import lombok.Getter;
import lombok.Setter;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;


@Repository
public interface RoomRepository extends JpaRepository<Room, RoomId> {
}