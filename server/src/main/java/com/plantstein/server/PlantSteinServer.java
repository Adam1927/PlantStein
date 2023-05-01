package com.plantstein.server;

import io.swagger.v3.oas.annotations.OpenAPIDefinition;
import io.swagger.v3.oas.annotations.info.Info;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

/**
 * This class is the entry point of the server.
 * {@link SpringBootApplication} enables the Spring Boot auto configuration.
 */
@OpenAPIDefinition(
		info = @Info(
				title = "PlantStein API",
				description = "API documentation for the PlantStein app. " +
						"This API is automatically generated from the server's code."
		)
)
@SpringBootApplication
public class PlantSteinServer {

	public static void main(String[] args) {
		SpringApplication.run(PlantSteinServer.class, args);
	}

}
