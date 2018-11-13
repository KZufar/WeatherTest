package ru.ivmiit.web.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import ru.ivmiit.dto.WeatherDto;
import ru.ivmiit.service.WeatherService;
import ru.ivmiit.web.utils.exception.IncorrectDataException;

import java.util.List;

@Controller
public class WeatherController {

    @Autowired
    WeatherService weatherService;

    @RequestMapping(value = "/show", method = RequestMethod.POST)
    public ModelAndView getWeather(@RequestParam(value = "city") String city,
                                   @RequestParam(value = "units") String units,
                                   @RequestParam(value = "date") String dates,
                                   RedirectAttributes redirect) {
        try {
            List<WeatherDto> weatherDtoList = weatherService.getWeather(city, units, dates);
            redirect.addFlashAttribute("weatherDtoList", weatherDtoList);
        } catch (IncorrectDataException e) {
            return new ModelAndView("weather");
        }

        return new ModelAndView("redirect:/show");
    }


    @RequestMapping(value = "/weather", method = RequestMethod.GET)
    public ModelAndView getWeather(RedirectAttributes redirect) {
        try {
            List<WeatherDto> weatherDtoList = weatherService.getWeather("Казань", "M", "0");
            redirect.addFlashAttribute("weatherDtoList", weatherDtoList);
        } catch (IncorrectDataException e) {
            return new ModelAndView("weather");
        }
        return new ModelAndView("redirect:/show");
    }

    @RequestMapping(value = "show", method = RequestMethod.GET)
    public ModelAndView showWeather(Model model) {
        return new ModelAndView("weather");
    }
}
