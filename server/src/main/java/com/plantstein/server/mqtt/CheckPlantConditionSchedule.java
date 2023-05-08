package com.plantstein.server.mqtt;

import com.plantstein.server.dto.CheckPlantConditionsDTO;
import com.plantstein.server.dto.RoomConditionDTO;
import com.plantstein.server.model.Moisture;
import com.plantstein.server.model.Plant;
import com.plantstein.server.model.PlantTimeSeries;
import com.plantstein.server.model.Species;
import com.plantstein.server.repository.PlantRepository;
import com.plantstein.server.repository.PlantTimeSeriesRepository;
import com.plantstein.server.repository.RoomRepository;
import com.plantstein.server.rest.PlantRestController;
import com.plantstein.server.util.Utils;
import lombok.RequiredArgsConstructor;
import org.springframework.integration.mqtt.support.MqttHeaders;
import org.springframework.messaging.support.MessageBuilder;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component
@RequiredArgsConstructor
public class CheckPlantConditionSchedule {
    private static final double BRIGHTNESS_SLACK = 0.5;
    private static final double TEMPERATURE_SLACK = 2.0;
    private static final double HUMIDITY_SLACK = 5.0;

    private final MQTTBeans mqtt;
    private final PlantRepository plantRepository;
    private final RoomRepository roomRepository;
    private final PlantRestController roomRestController;
    private final PlantTimeSeriesRepository plantTimeSeriesRepository;

    @Scheduled(fixedDelay = 1000)
    public void checkPlantConditions() {
        for (String clientId : roomRepository.getAllClientIds()) {
            mqtt.mqttOutBound().handleMessage(
                    MessageBuilder
                            .withPayload(getCheckPlantConditions(clientId))
                            .setHeader(MqttHeaders.TOPIC, "plant-conditions")
                            .build()
            );
        }
    }

    public List<CheckPlantConditionsDTO> getCheckPlantConditions(String clientId) {
        List<CheckPlantConditionsDTO> response = new ArrayList<>();
        for (Plant userPlant : plantRepository.findByClientId(clientId)) {
            RoomConditionDTO condition = roomRestController.getCondition(userPlant.getId());
            List<PlantTimeSeries> plantRTSEntries = plantTimeSeriesRepository.findFirst10ByIdOrderByTimestampDesc(userPlant.getId());
            Moisture averageMoisture = Moisture.getAverageMoisture(
                    plantRTSEntries.stream()
                            .map(PlantTimeSeries::getMoisture)
                            .toList()
            );

            Species species = userPlant.getSpecies();

            int brightnessCheck = Utils.checkWithinTargetValue(condition.getBrightness(), species.getPerfectLight(), BRIGHTNESS_SLACK);
            if (brightnessCheck != 0)
                response.add(
                        CheckPlantConditionsDTO.builder()
                                .plantId(userPlant.getId())
                                .plantName(userPlant.getNickname())
                                .message(
                                        brightnessCheck > 0 ?
                                                "It's too bright for " + userPlant.getNickname() + "!"
                                                : "It's not bright enough for " + userPlant.getNickname() + "!"
                                ).build()
                );

            int temperatureCheck = Utils.checkWithinTargetValue(condition.getTemperature(), species.getPerfectTemperature(), TEMPERATURE_SLACK);
            if (temperatureCheck != 0)
                response.add(
                        CheckPlantConditionsDTO.builder()
                                .plantId(userPlant.getId())
                                .plantName(userPlant.getNickname())
                                .message(
                                        temperatureCheck > 0 ?
                                                "It's too hot for " + userPlant.getNickname() + "!"
                                                : "It's too cold enough for " + userPlant.getNickname() + "!").build()
                );

            int humidityCheck = Utils.checkWithinTargetValue(condition.getBrightness(), species.getPerfectLight(), HUMIDITY_SLACK);
            if (humidityCheck != 0)
                response.add(
                        CheckPlantConditionsDTO.builder()
                                .plantId(userPlant.getId())
                                .plantName(userPlant.getNickname())
                                .message(
                                        humidityCheck > 0 ?
                                                "The humidity is too high for " + userPlant.getNickname() + "!"
                                                : "The humidity isn't high enough for " + userPlant.getNickname() + "!"
                                ).build()
                );

            if (averageMoisture != Moisture.OKAY)
                response.add(
                        CheckPlantConditionsDTO.builder()
                                .plantId(userPlant.getId())
                                .plantName(userPlant.getNickname())
                                .message(
                                        Moisture.TOO_DRY.equals(averageMoisture) ?
                                                userPlant.getNickname() + "'s soil is too dry!"
                                                : userPlant.getNickname() + "'s soil is too wet!"
                                ).build()
                );
        }
        return response;
    }
}
