package com.plantstein.server.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.EmbeddedId;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.OneToMany;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;


@Entity
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Room {

    @EmbeddedId
    private RoomId roomId;

    @OneToMany(fetch = FetchType.LAZY)
    @JsonIgnore
    private List<Plant> plants;

    @OneToMany(fetch = FetchType.LAZY)
    @JsonIgnore
    private List<RoomTimeSeries> roomTimeSeries;


}