package com.plantstein.server.dto;

import com.plantstein.server.model.Moisture;
import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class PlantConditionDTO {
    private String plantNickname;
    private double temperature;
    private double brightness;
    private double humidity;
    private Moisture moisture;

}
