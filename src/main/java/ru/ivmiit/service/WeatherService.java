package ru.ivmiit.service;

import com.google.gson.Gson;
import io.swagger.models.auth.In;
import lombok.Builder;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.usermodel.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import ru.ivmiit.dto.WeatherDto;
import ru.ivmiit.dto.json.DataJsonDto;
import ru.ivmiit.dto.json.WeatherJsonDto;
import ru.ivmiit.web.utils.exception.IncorrectDataException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Service
public class WeatherService {

    @Value("${api.url}")
    private String apiUrl;

    @Value("${api.key}")
    private String apiKey;

    @Autowired
    RestTemplate restTemplate;


    @Autowired
    Gson gson;
    public List<WeatherDto> getWeather(String city, String units, String dataNum) {
        StringBuilder resource = new StringBuilder()
                .append(apiUrl).append("daily")
                .append("?city=").append(city)
                .append("&country=ru")
                .append("&days=7")
                .append("&units=").append(units)
                .append("&lang=ru")
                .append("&key=").append(apiKey);

        ResponseEntity<String> response = restTemplate.getForEntity(resource.toString(), String.class);

        int code = response.getStatusCodeValue();
        if (code == 204) {
            throw new IncorrectDataException("city", "Данного города не существует или город не находится в России");
        }

        String json = response.getBody();

        WeatherJsonDto weatherJsonDto = gson.fromJson(json, WeatherJsonDto.class);

        List<WeatherDto> weatherDtoList = new ArrayList<>();

        for (DataJsonDto data : weatherJsonDto.getData()) {
            WeatherDto weatherDto = WeatherDto.builder()
                    .city(weatherJsonDto.getCity_name())
                    .date(data.getValid_date())
                    .relativeHumidity(data.getRh())
                    .pressure(data.getPres())
                    .windSpeed(data.getWind_spd())
                    .windDirection(data.getWind_cdir_full())
                    .clouds(data.getClouds())
                    .pop(data.getPop())
                    .temperature(data.getTemp())
                    .weatherDescription(data.getWeather().getDescription())
                    .build();
            weatherDtoList.add(weatherDto);
        }
        weatherDtoList.add(0, weatherDtoList.get(Integer.parseInt(dataNum)));
        weatherDtoList.remove(1);

        return weatherDtoList;
    }
}
