package com.plantstein.server.dto;

import lombok.Data;

import java.sql.Timestamp;

@Data
public class RoomConditionDTA {
    private Timestamp timestamp;
    private double temperature;
    private double humidity;
    private double light;
}
