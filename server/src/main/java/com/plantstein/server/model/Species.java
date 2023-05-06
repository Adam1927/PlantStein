package com.plantstein.server.model;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
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
public class Species {

    @Id
    private String name;

    @NotEmpty
    private double perfectTemperature;

    @NotEmpty
    private double perfectLight;

    @NotEmpty
    private double perfectHumidity;

}
