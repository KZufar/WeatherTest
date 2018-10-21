package ru.ivmiit.web.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import ru.ivmiit.dto.WeatherDto;
import ru.ivmiit.service.WeatherService;

@Controller
public class WeatherController {

    @Autowired
    WeatherService weatherService;

    @RequestMapping(value = "/weather", method = RequestMethod.POST)
    public ResponseEntity<WeatherDto> getWeather(@RequestParam(value = "city") String city,
                                                 @RequestParam(value = "units") String units,
                                                 @RequestParam(value = "day") int day) {
        WeatherDto weatherDto = weatherService.getWeather(city, units, day);
        return ResponseEntity.ok(weatherDto);
    }
}
