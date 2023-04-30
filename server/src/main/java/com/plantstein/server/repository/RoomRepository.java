package com.plantstein.server.repository;

import com.plantstein.server.model.Room;
import com.plantstein.server.model.RoomId;
import com.plantstein.server.model.RoomTimeSeries;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public interface RoomRepository extends JpaRepository<Room, RoomId> {
    @Query("select r from Room r where r.roomTimeSeries is not empty")
    List<RoomTimeSeries> getTimeSeriesData(Room room);
}