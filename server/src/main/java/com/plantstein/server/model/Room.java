package com.plantstein.server.model;

import jakarta.persistence.EmbeddedId;
import jakarta.persistence.Entity;
import jakarta.persistence.OneToMany;
import lombok.*;

import java.util.List;


@Entity
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Room {

    @EmbeddedId
    private RoomId roomId;

    @OneToMany
    private List<Plant> plants;

    @OneToMany
    private List<RoomTimeSeries> roomTimeSeries;
}