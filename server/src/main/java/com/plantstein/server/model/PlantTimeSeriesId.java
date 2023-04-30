package com.plantstein.server.model;

import jakarta.persistence.Embeddable;
import jakarta.persistence.ManyToOne;
import jakarta.validation.constraints.NotEmpty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.sql.Timestamp;

@Embeddable
@Data
@NoArgsConstructor
@AllArgsConstructor
public class PlantTimeSeriesId implements Serializable {
    @ManyToOne
    @NotEmpty
    private Plant plant;

    @NotEmpty
    private Timestamp timestamp;

}
