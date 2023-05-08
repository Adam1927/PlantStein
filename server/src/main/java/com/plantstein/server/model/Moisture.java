package com.plantstein.server.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public enum Moisture {
    TOO_DRY, OKAY, TOO_WET;

    public static Moisture getAverageMoisture(List<Moisture> list) {
        Map<Moisture, Integer> countMap = new HashMap<>();
        for (Moisture moisture : list) {
            countMap.put(moisture, countMap.getOrDefault(moisture, 0) + 1);
        }

        Moisture mostFrequentMoisture = OKAY;
        int highestCount = 0;
        for (Map.Entry<Moisture, Integer> entry : countMap.entrySet()) {
            if (entry.getValue() > highestCount) {
                mostFrequentMoisture = entry.getKey();
                highestCount = entry.getValue();
            }
        }

        return mostFrequentMoisture;
    }

}
