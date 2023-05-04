package com.plantstein.server.repository;

import com.plantstein.server.model.Plant;
import com.plantstein.server.model.Room;
import com.plantstein.server.model.RoomId;
import com.plantstein.server.model.RoomTimeSeries;
import jakarta.transaction.Transactional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public interface RoomRepository extends JpaRepository<Room, RoomId> {

    @Query("select r from Room r where r.roomId.clientId = ?1")
    List<Room> findByClientId(String clientId);

    @Query("select r from Room r where r.roomId = ?1")
    List<RoomTimeSeries> getTimeSeriesData(RoomId roomId);


    @Query("select p from Plant p where p.room.roomId = ?1")
    List<Plant> getPlantsInRoom(RoomId roomId);

    @Transactional
    @Modifying
    @Query("UPDATE Room r SET r.roomId.name = ?3 WHERE r.roomId.name = ?1 and r.roomId.clientId = ?2")
    Integer updateRoomName(String currentName, String clientId, String newName);
}