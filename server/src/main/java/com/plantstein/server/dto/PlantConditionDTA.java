package com.plantstein.server.dto;

import lombok.Data;

import java.sql.Timestamp;

@Data
public class PlantConditionDTA {
    private Timestamp timestamp;
    private double moisture;
}
