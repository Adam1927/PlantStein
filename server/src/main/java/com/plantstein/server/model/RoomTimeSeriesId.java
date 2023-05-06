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
public class RoomTimeSeriesId implements Serializable {
    @ManyToOne
    @NotEmpty
    private Room room;

    @NotEmpty
    private Timestamp timestamp;

}
