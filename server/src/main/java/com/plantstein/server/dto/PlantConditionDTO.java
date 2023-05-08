package com.plantstein.server.dto;

import com.plantstein.server.model.Moisture;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class PlantConditionDTO extends RoomConditionDTO {
    private Long plantId;
    private String plantNickname;
    private Moisture moisture;

    @Builder(builderMethodName = "plantConditionDtoBuilder")
    public PlantConditionDTO(Double brightness, Double temperature, Double humidity, Long plantId, String plantNickname, Moisture moisture) {
        super(brightness, temperature, humidity);
        this.plantId = plantId;
        this.plantNickname = plantNickname;
        this.moisture = moisture;
    }
}
