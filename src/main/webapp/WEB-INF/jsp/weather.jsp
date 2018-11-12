<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <title>Weather</title>
</head>
<body>
<div class="container">
    <h1>${weatherDtoList[0].city}</h1>
    <table class="table">
        <tr>
            <th>Дата</th>
            <th>Облачность</th>
            <th>Вероятность осадков</th>
            <th>Давление</th>
            <th>Относительная влажность</th>
            <th>Температура</th>
            <th>Описание</th>
            <th>Направление ветра</th>
            <th>Скорость ветра</th>
        </tr>
        <c:forEach items="${weatherDtoList}" var="weatherDto">
            <tr>
                <td>${weatherDto.date}</td>
                <td>${weatherDto.clouds}</td>
                <td>${weatherDto.pop}</td>
                <td>${weatherDto.pressure}</td>
                <td>${weatherDto.relativeHumidity}</td>
                <td>${weatherDto.temperature}</td>
                <td>${weatherDto.weatherDescription}</td>
                <td>${weatherDto.windDirection}</td>
                <td>${weatherDto.windSpeed}</td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>
