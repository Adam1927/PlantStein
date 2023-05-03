package com.plantstein.server.dto;

import com.plantstein.server.model.Moisture;
import lombok.Data;

@Data
public class ConditionsDTO {
    private String plantNickname;
    private double temperature;
    private double brightness;
    private double humidity;
    private Moisture moisture;

}
