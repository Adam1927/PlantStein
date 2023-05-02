package com.plantstein.server.repository;

import com.plantstein.server.model.Plant;
import com.plantstein.server.model.Room;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface PlantRepository extends JpaRepository<Plant, Long> {
    List<Plant> findByNickname(String nickname);

    @Query("select p from Plant p where p.room.roomId.clientId = ?1")
    List<Plant> findByClientId(String clientId);

    @Query("select p from Plant p where p.room.roomId.clientId = ?2 and p.nickname = ?1")
    List<Plant> findByClientIdAndNickname(String nickname, String clientId);

}
