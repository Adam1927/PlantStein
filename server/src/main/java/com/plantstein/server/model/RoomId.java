package com.plantstein.server.model;

import jakarta.validation.constraints.NotEmpty;
import lombok.*;

import java.io.Serializable;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class RoomId implements Serializable {
    @NotEmpty
    private String name;

    @NotEmpty
    private String clientId;
}
