package com.plantstein.server.rest;

import com.plantstein.server.model.Pot;
import com.plantstein.server.repository.PotRepository;
import io.swagger.v3.oas.annotations.Operation;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequiredArgsConstructor
public class ApplicationRestController {
    private final PotRepository potRepository;

    @Operation(summary = "Get all pots", tags = { "pot" })
    @GetMapping("/pots")
    public List<Pot> getPots() {
        return potRepository.findAll();
    }

    @Operation(summary = "Get pots by nickname", tags = { "pot" })
    @GetMapping("/pots/nickname/{nickname}")
    public List<Pot> getPotsByNickname(@PathVariable String nickname) {
        return potRepository.findByNickname(nickname);
    }
}
