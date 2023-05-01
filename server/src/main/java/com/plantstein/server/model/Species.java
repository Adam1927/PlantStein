package com.plantstein.server.model;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotEmpty;
import lombok.Getter;
import lombok.Setter;

import java.util.List;


@Entity
@Getter
@Setter

public class Species {

@Id
private String name;

@NotEmpty
private int perfectTemperature;

@NotEmpty
private double perfectLight;

@NotEmpty
private double perfectHumidity;

@OneToMany
private List<Plant> plants;

}
