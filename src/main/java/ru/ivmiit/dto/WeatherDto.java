package ru.ivmiit.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class WeatherDto {
    private String city;
    private String date;
    private double relativeHumidity;
    private double pressure;
    private double windSpeed;
    private String windDirection;
    private double clouds;
    private double pop;
    private double temperature;
    private String weatherDescription;
}
