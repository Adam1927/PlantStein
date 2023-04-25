package com.plantstein.server.model;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotEmpty;
import lombok.Getter;
import lombok.Setter;

import java.util.List;


@Entity
@Getter
@Setter
public class Room {
    @Id
    private String name;

    @ManyToOne(optional = false)
    private Person person;

    @OneToMany
    private List<Plant> plants;

    @NotEmpty
    private double Temperature;

    @NotEmpty
    private double Light;

    @NotEmpty
    private double Humidity;
}