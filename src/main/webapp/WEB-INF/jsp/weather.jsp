<%@ page import="javax.xml.crypto.Data" %>
<%@ page import="java.time.LocalDateTime" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Calendar" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta name="description" content="" />
    <meta name="keywords" content="" />
    <title>Weather</title>
    <style type="text/css">
        * {
            padding: 0;
            margin: 0;
        }
        body {
            height: 100vh;
            display: flex;
            justify-content: start;
            background-color: #efefef;
            font-family: "Montserrat", sans-serif;
        }
        #styled-select{
            margin-left:30px ;
            width: 820px;
            padding: 80px 0px 0px;
        }
        input  {
            margin-left : 60px;

        }
        .row {
            text-align: center;
            margin-bottom: 5px;
        }
        .weather-widget {
            padding: 20px 0;
            box-shadow: 0 2px 5px 0 rgba(0,0,0,.3);
            display: flex;
            flex-flow: column wrap;
            justify-content: center;
            justify-items: center;
            background-color: #2075CD;
            color: white;
            width: 25%;
        }

        .weather-icon {
            font-size: 5rem;
            animation: rotation 5s infinite linear;
        }

        .temp-c {
            margin-bottom: 20px;
        }

        .location-country {
            color: #c2c2c2;
            font-weight: 300;
        }
        .weather-forecast {
            width: 75%;
        }
        .forecast-item {
            display: flex;
            justify-content: space-between;
            border-bottom: 1px solid #e1e1e1;
            padding: 20px;
            transition: all 0.2s;
        }

        .forecast-item:hover {
            background-color: #fff;
            cursor: pointer;
        }
        .forecast-item h6 {
            color: #888;
            margin-top: 5px;
        }
        .forecast {
            text-align: right;
        }

        @media only screen and (max-width: 600px) {
            body {
                flex-flow: column;
            }
            .weather-widget {
                width: 100%;
            }
            .weather-forecast {
                width: 100%;
            }
            .temp-c {
                margin-bottom: 7px;
            }
        }

        @keyframes rotation {
            from {
                transform: rotate(0deg);
            }
            to {
                transform: rotate(359deg);
            }
        }
    </style>
</head>
<body>
<div class="weather-widget">
    <form method="post" action="show">
        <div id="styled-select" background = blue >
            <input placeholder="City" type="text" name="city"/>
            <table>
                <tr>
                    <td>
                        <select name="date" >
                            <option value="0"><%
                                SimpleDateFormat formattedDate = new SimpleDateFormat("EEE, d MMM yyyy");
                                Calendar c = Calendar.getInstance();
                                out.println(formattedDate.format(c.getTime()));%></option>
                            <option value="1"><%
                                c.add(Calendar.DATE, 1);
                                out.println((formattedDate.format(c.getTime())));%></option>
                            <option value="2"><%
                                c.add(Calendar.DATE, 1);
                                out.println((formattedDate.format(c.getTime())));%></option>
                            <option value="3"><%
                                c.add(Calendar.DATE, 1);
                                out.println((formattedDate.format(c.getTime())));%></option>
                            <option value="4"><%
                                c.add(Calendar.DATE, 1);
                                out.println((formattedDate.format(c.getTime())));%></option>
                            <option value="5"><%
                                c.add(Calendar.DATE, 1);
                                out.println((formattedDate.format(c.getTime())));%></option>
                            <option value="6"><%
                                c.add(Calendar.DATE, 1);
                                out.println((formattedDate.format(c.getTime())));%></option>
                        </select>
                    </td>
                    <td>

                    </td>
                    <td>
                        <select name="units">
                            <option value="M">Цельсий</option>
                            <option value="I">Фаренгейт</option>
                            <option value="S">Кельвин</option>
                        </select>

                    </td>
                    </select>
                </tr>

            </table>
            <input type="submit" value="Получить информацию о погоде" />
        </div>
    </form>
    <div class="weather-icon row">
        <i class="wi wi-day-sunny"></i>
    </div>
    <h1 class="temp-c row">${weatherDtoList[0].temperature}</h1>
    <h5 class="condition row">${weatherDtoList[0].weatherDescription}</h5>
    <h3 class="location-name row">${weatherDtoList[0].city}</h3>
    <h5 class="location-country row"></h5>

    <table>
        <td>
            <h5 class="condition row">Облачность</h5>
            <h5 class="condition row">Вероятность осадков</h5>
            <h5 class="condition row">Давление</h5>
            <h5 class="condition row">Относительная влажность</h5>
            <h5 class="condition row">Направление ветра</h5>
            <h5 class="condition row">Скорость ветра</h5>
        </td>
        <td>
            <h5 class="condition row">${weatherDtoList[0].clouds}</h5>
            <h5 class="condition row">${weatherDtoList[0].pop}</h5>
            <h5 class="condition row">${weatherDtoList[0].pressure}</h5>
            <h5 class="condition row">${weatherDtoList[0].relativeHumidity}</h5>
            <h5 class="condition row">${weatherDtoList[0].windDirection}</h5>
            <h5 class="condition row">${weatherDtoList[0].windSpeed}</h5>
        </td>
    </table>
</div>
<div class="weather-forecast">

    <%SimpleDateFormat formattedOtherDate = new SimpleDateFormat("EEEEEEEEEE, d MMM yyyy");
    Calendar calendar = Calendar.getInstance();%>

    <c:forEach var="i" begin="1" end="6">
        <div class="forecast-item">
            <div class="day">
                <h4><%calendar.add(Calendar.DATE, 1);
                out.println(formattedOtherDate.format(calendar.getTime()));%></h4>
            </div>
            <div class="forecast">
                <i class="wi wi-night-sleet"></i> ${weatherDtoList[i].temperature}
                <h6>${weatherDtoList[i].weatherDescription}</h6>
            </div>
        </div>
    </c:forEach>
</div>
</body>
</html>
<html>


