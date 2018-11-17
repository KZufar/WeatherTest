package ru.ivmiit.dto;
import com.google.gson.Gson;
//import me.aboullaite.model.User;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.usermodel.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.view.document.AbstractXlsView;
import ru.ivmiit.dto.WeatherDto;
import ru.ivmiit.dto.json.WeatherJsonDto;
import ru.ivmiit.service.WeatherService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class ExcelView extends AbstractXlsView{
    @Autowired
    Gson gson;
    @Override
    protected void buildExcelDocument(Map<String, Object> model,
                                      Workbook workbook,
                                      HttpServletRequest request,
                                      HttpServletResponse response) throws Exception {


        response.setHeader("Content-Disposition", "attachment; filename=\"weather_data.xls\"");


        List<WeatherDto> weatherDtoList = (List<WeatherDto>) model.get("weatherDtoList");

        Sheet sheet = workbook.createSheet("Weather");
        sheet.setDefaultColumnWidth(20);

        CellStyle style = workbook.createCellStyle();
        Font font = workbook.createFont();
        font.setFontName("Arial");
        style.setFillForegroundColor(HSSFColor.BLUE.index);
        font.setBold(true);
        font.setColor(HSSFColor.BLUE.index);
        style.setFont(font);

        Row header = sheet.createRow(0);
        header.createCell(0).setCellValue("Город");
        header.getCell(0).setCellStyle(style);
        header.createCell(1).setCellValue("Дата");
        header.getCell(1).setCellStyle(style);
        header.createCell(2).setCellValue("Погода");
        header.getCell(2).setCellStyle(style);
        header.createCell(3).setCellValue("Температура");
        header.getCell(3).setCellStyle(style);
        header.createCell(4).setCellValue("Облачность");
        header.getCell(4).setCellStyle(style);
        header.createCell(5).setCellValue("Вероятность осадков");
        header.getCell(5).setCellStyle(style);
        header.createCell(6).setCellValue("Давление");
        header.getCell(6).setCellStyle(style);
        header.createCell(7).setCellValue("Относительная влажность");
        header.getCell(7).setCellStyle(style);
        header.createCell(8).setCellValue("Направление ветра");
        header.getCell(8).setCellStyle(style);
        header.createCell(9).setCellValue("Скорость ветра");
        header.getCell(9).setCellStyle(style);


        int rowCount = 1;
        Row weatherRow =  sheet.createRow(rowCount);

        for (WeatherDto weatherDto: weatherDtoList) {
            Row wRow =  sheet.createRow(rowCount++);
            weatherRow.createCell(0).setCellValue(weatherDto.getCity());
            wRow.createCell(1).setCellValue(weatherDto.getDate());
            wRow.createCell(2).setCellValue(weatherDto.getWeatherDescription());
            wRow.createCell(3).setCellValue(weatherDto.getTemperature());
            wRow.createCell(4).setCellValue(weatherDto.getClouds());
            wRow.createCell(5).setCellValue(weatherDto.getPop());
            wRow.createCell(6).setCellValue(weatherDto.getPressure());
            wRow.createCell(7).setCellValue(weatherDto.getRelativeHumidity());
            wRow.createCell(8).setCellValue(weatherDto.getWindDirection());
            wRow.createCell(9).setCellValue(weatherDto.getWindSpeed());
        }
    }
}
