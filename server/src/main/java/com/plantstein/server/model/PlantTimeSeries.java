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
public class PlantTimeSeries {
    @EmbeddedId
    private PlantTimeSeriesId plantTimeSeriesId;

    @NotEmpty
    private double moisture;

}
