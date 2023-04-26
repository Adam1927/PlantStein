package com.plantstein.server.model;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotEmpty;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.List;


@Entity
@Getter
@Setter
@ToString
public class Room {
    @Id
    private String name;

    @OneToMany
    private List<Plant> plants;

    @NotEmpty
    private String clientId;
}