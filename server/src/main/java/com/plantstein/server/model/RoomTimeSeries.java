package com.plantstein.server.model;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotEmpty;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;

@Entity
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class RoomTimeSeries {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    @ManyToOne
    @NotEmpty
    private Room room;

    @NotEmpty
    private Timestamp timestamp;

    @NotEmpty
    private double temperature;

    @NotEmpty
    private double brightness;

    @NotEmpty
    private double humidity;

}
