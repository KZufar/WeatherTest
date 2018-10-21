package ru.ivmiit.dto.json;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class WeatherJsonDto {
    private String city_name;
    private List<DataJsonDto> data;
}
