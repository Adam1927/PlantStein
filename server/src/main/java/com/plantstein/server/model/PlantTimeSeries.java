package com.plantstein.server.model;

import jakarta.persistence.EmbeddedId;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
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
    @Enumerated(EnumType.ORDINAL)
    private Moisture moisture;
}
