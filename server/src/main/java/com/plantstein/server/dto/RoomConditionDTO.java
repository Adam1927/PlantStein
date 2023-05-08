package com.plantstein.server.dto;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class RoomConditionDTO {
    private double brightness;
    private double temperature;
    private double humidity;
}
