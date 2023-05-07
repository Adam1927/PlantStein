package com.plantstein.server.repository;

import com.plantstein.server.model.RoomTimeSeries;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.sql.Timestamp;
import java.util.List;


public interface RoomTimeSeriesRepository extends JpaRepository<RoomTimeSeries, Long> {
    public static final int FIND_FIRST_N = 10;

    List<RoomTimeSeries> findFirst10ByRoomIdOrderByTimestampDesc(Long roomId);

    @Query("""
                SELECT 
                    CAST(rts.timestamp AS DATE) as day, 
                    DAYNAME(rts.timestamp) as weekday,
                    AVG(rts.brightness) as avg_brightness, 
                    AVG(rts.temperature) as avg_temperature, 
                    AVG(rts.humidity) as avg_humidity 
                FROM 
                    RoomTimeSeries rts 
                WHERE 
                    rts.timestamp >= ?1 
                GROUP BY 
                    CAST(rts.timestamp AS DATE),
                    DAYNAME(rts.timestamp)
            """)
    List<Object[]> getAvgValuesForLastNDays(Timestamp nLastDays);


}
