package ru.ivmiit.web.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import ru.ivmiit.dto.WeatherDto;
import ru.ivmiit.service.WeatherService;
import ru.ivmiit.dto.ExcelView;
import ru.ivmiit.web.utils.exception.IncorrectDataException;
import java.util.ArrayList;
import java.util.List;

@Controller
public class WeatherController {

    @Autowired
    WeatherService weatherService;
    List<WeatherDto> weatherDtoList = new ArrayList<>();
    static String cityGlobal ="Казань";
    static String unitsGlobal ="M";
    static String datesGlobal ="0";
    @RequestMapping(value = "/show", method = RequestMethod.POST)
    public ModelAndView getWeather(@RequestParam(value = "city") String city,
                                   @RequestParam(value = "units") String units,
                                   RedirectAttributes redirect) {
        cityGlobal = city;
        unitsGlobal=units;
        try {
            weatherDtoList = weatherService.getWeather(city, units, datesGlobal);
            String unit = weatherService.getWeatherUnit(units);
            List<String> weatherUnits = weatherService.getUnits();
            redirect.addFlashAttribute("weatherUnits", weatherUnits);
            redirect.addFlashAttribute("weatherDtoList", weatherDtoList);
            redirect.addFlashAttribute("weatherUnit", unit);
        } catch (IncorrectDataException e) {
            return new ModelAndView("weather");
        }

        return new ModelAndView("redirect:/show");
    }


    @RequestMapping(value = "/weather", method = RequestMethod.GET)
    public ModelAndView getWeather(RedirectAttributes redirect) {
        try {
            List<WeatherDto> weatherDtoList = weatherService.getWeather("Казань", "M", "0");
            List<String> weatherUnits = weatherService.getUnits();
            redirect.addFlashAttribute("weatherDtoList", weatherDtoList);
            redirect.addFlashAttribute("weatherUnits", weatherUnits);
        } catch (IncorrectDataException e) {
            return new ModelAndView("weather");
        }
        return new ModelAndView("redirect:/show");
    }

    @RequestMapping(value = "/downloadExcel", method = RequestMethod.GET)
    public ModelAndView getExcelFile(
                                     RedirectAttributes redirect) {
        weatherDtoList = weatherService.getWeather(cityGlobal, unitsGlobal, datesGlobal);
        redirect.addFlashAttribute("weatherDtoList", weatherDtoList);
        ModelAndView mav = new ModelAndView(new ExcelView());
        mav.addObject(weatherDtoList);
        return mav;
    }
    @RequestMapping(value = "/date", method = RequestMethod.GET)
    public ModelAndView getWeatherByDate(@RequestParam("date") String dates,
            RedirectAttributes redirect) {
        weatherDtoList = weatherService.getWeather(cityGlobal, unitsGlobal, dates);
        String unit = weatherService.getWeatherUnit(unitsGlobal);
        List<String> weatherUnits = weatherService.getUnits();
        redirect.addFlashAttribute("weatherUnit", unit);
        redirect.addFlashAttribute("weatherDtoList", weatherDtoList);
        redirect.addFlashAttribute("weatherUnits", weatherUnits);
        return new ModelAndView("redirect:/show");
    }

    @RequestMapping(value = "show", method = RequestMethod.GET)
    public ModelAndView showWeather(Model model) {
        return new ModelAndView("weather");
    }

}
