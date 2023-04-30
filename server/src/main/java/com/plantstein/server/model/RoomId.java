package com.plantstein.server.model;

import jakarta.persistence.Embeddable;
import jakarta.validation.constraints.NotEmpty;
import lombok.*;

import java.io.Serializable;

@Embeddable
@Data
@NoArgsConstructor
@AllArgsConstructor
public class RoomId implements Serializable {
    @NotEmpty
    private String name;

    @NotEmpty
    private String clientId;
}
