package com.plantstein.server.model;

import jakarta.persistence.EmbeddedId;
import jakarta.persistence.Entity;
import jakarta.validation.constraints.NotEmpty;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class RoomTimeSeries {
    @EmbeddedId
    private RoomTimeSeriesId roomTimeSeriesId;

    @NotEmpty
    private double temperature;

    @NotEmpty
    private double brightness;

    @NotEmpty
    private double humidity;

}
