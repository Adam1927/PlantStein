package com.plantstein.server.repository;

import com.plantstein.server.model.Pot;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface PotRepository extends JpaRepository<Pot, Long> {
    List<Pot> findByNickname(String nickname);

}
