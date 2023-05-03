package com.plantstein.server.model;

import jakarta.persistence.Embeddable;
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
public class RoomTimeSeriesId implements Serializable {
    @NotEmpty
    private String name;

    @NotEmpty
    private String clientId;

    @NotEmpty
    private Timestamp timestamp;

}
