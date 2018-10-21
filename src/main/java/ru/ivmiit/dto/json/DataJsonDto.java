package ru.ivmiit.dto.json;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class DataJsonDto {
    private String valid_date;
    private double rh;
    private double pres;
    private double wind_spd;
    private String wind_cdir_full;
    private double clouds;
    private double pop;
    private double temp;
    private WeatherInfoJsonDto weather;
}
