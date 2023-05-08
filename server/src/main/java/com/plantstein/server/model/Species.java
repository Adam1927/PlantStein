package com.plantstein.server.model;

import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.Id;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
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
    private Double perfectTemperature;

    @NotEmpty
    private Double perfectLight;

    @NotEmpty
    private Double perfectHumidity;

    @NotEmpty
    @Enumerated(EnumType.ORDINAL)
    private String homeland;

    @NotEmpty
    @Enumerated(EnumType.ORDINAL)
    private Difficulty transplanting;

    @NotEmpty
    @Enumerated(EnumType.ORDINAL)
    private Difficulty cultivation;

    @NotNull
    @Enumerated(EnumType.ORDINAL)
    private Double maxHeight;
}
