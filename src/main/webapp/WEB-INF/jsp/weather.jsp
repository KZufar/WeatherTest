<%@ page import="javax.xml.crypto.Data" %>
<%@ page import="java.time.LocalDateTime" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="org.apache.poi.hssf.usermodel.HSSFWorkbook" %>
<%@ page import="org.apache.poi.ss.usermodel.*" %>
<%@ page import="java.io.FileOutputStream" %>
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
        a{
            margin-left: 60px;
            color:black;


            text-decoration: none; /* Убираем подчёркивание */
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
        input[type="text"]{

            border-radius:2px;
            width:100px;
            height:20px;
            color:#2075CD;
            background-color:#efefef



        }
        .table1{
            margin-left:20px;

        }
        .table1 table{
            border-spacing: 30px 11px;
        }
        .new-select-style-wpandyou select {
            border-radius: 2px;
            background: #efefef;
            height: 25px;
            padding: 5px;
            border: 0;
            font-size: 16px;
            line-height: 1;
            -webkit-appearance: none;
            width: 95px;
            color:#2075CD;

        }
        .new-select-style-wpandyou select:hover{
            background-color: #efefef;
            cursor: pointer;
        }
        .rkmd-btn.btn-lightBlue {
            color: #2075CD;
            font-weight: bold;

            background-color: #efefef;
            margin-left : 10px;
        }
        .ripple-effect {
            display: inline-block;
            position: relative;
            overflow: hidden;
            cursor: pointer;
            vertical-align: middle;
            -webkit-user-select: none;
            -moz-user-select: none;
            -ms-user-select: none;
            user-select: none;
            z-index: 1;
        }
        .rkmd-btn {
            display: inline-block;
            position: relative;
            cursor: pointer;
            height: 35px;
            line-height: 35px;
            padding: 0 1.5rem;
            color: #424242;
            font-size: 15px;
            font-weight: bold;
            font-family: 'Roboto', sans-serif;
            letter-spacing: .8px;
            text-align: center;
            text-decoration: none;
            text-transform: uppercase;
            vertical-align: middle;
            white-space: nowrap;
            outline: none;
            border: none;
            border-top-color: initial;
            border-top-style: none;
            border-top-width: initial;
            border-right-color: initial;
            border-right-style: none;
            border-right-width: initial;
            border-bottom-color: initial;
            border-bottom-style: none;
            border-bottom-width: initial;
            border-left-color: initial;
            border-left-style: none;
            border-left-width: initial;
            border-image-source: initial;
            border-image-slice: initial;
            border-image-width: initial;
            border-image-outset: initial;
            border-image-repeat: initial;
            -webkit-user-select: none;
            -moz-user-select: none;
            -ms-user-select: none;
            user-select: none;
            border-radius: 2px;
            transition: all .3s ease-out;
            box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.225);
            font: 400 13.3333px Arial;
        }

        .row {
            text-align: center;
            margin-bottom: 5px;
            color: #efefef;


        }
        .weather-widget {
            padding: 20px 0;
            box-shadow: none;
            display: flex;
            flex-flow: column wrap;
            justify-content: center;
            justify-items: center;
            background-color: #2075CD;
            color: #efefef;
            width: 25%;
        }

        .weather-icon {
            font-size: 5rem;

        ;
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
        .Excel{
            margin-top: 50px;
            color:red;
        }



    </style>
</head>
<body>
<div class="weather-widget">
    <form method="post" action="show">
        <div id="styled-select" background = blue >
            <div class="table1">

                <table>

                    <tr>
                        <td>
                            <input placeholder="City" type="text" name="city" value="${weatherDtoList[0].city}"/>
                        </td>
                        <td>
                            <div class="new-select-style-wpandyou">
                                <select name="units" selected>
                                    <option value="M">Цельсий</option>
                                    <option value="I">Фаренгейт</option>
                                    <option value="S">Кельвин</option>
                                </select>
                            </div>
                        </td>

                    </tr>

                </table>
            </div>
            <button class="rkmd-btn btn-lightBlue ripple-effect">
                <i class="material-icons"></i>Получить информацию о погоде</button>

        </div>
    </form>

    <div class="weather-icon row">
        <i class="wi wi-day-sunny"></i>
    </div>

    <h1 class="temp-c row">${weatherDtoList[7].date}</h1>
    <h1 class="temp-c row">${weatherDtoList[7].temperature} ${weatherUnit}</h1>
    <h5 class="condition row">${weatherDtoList[7].weatherDescription}</h5>
    <h3 class="location-name row">${weatherDtoList[7].city}</h3>
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
            <h5 class="condition row">${weatherDtoList[7].clouds} ${weatherUnits[0]}</h5>
            <h5 class="condition row">${weatherDtoList[7].pop} ${weatherUnits[1]}</h5>
            <h5 class="condition row">${weatherDtoList[7].pressure} ${weatherUnits[2]}</h5>
            <h5 class="condition row">${weatherDtoList[7].relativeHumidity} ${weatherUnits[3]}</h5>
            <h5 class="condition row">${weatherDtoList[7].windDirection}</h5>
            <h5 class="condition row">${weatherDtoList[7].windSpeed} ${weatherUnits[4]}</h5>
        </td>
    </table>
    <div class="Excel">
        <h3><a href="/downloadExcel">Загрузить данные о погоде</a></h3>
    </div>
</div>
<div class="weather-forecast">

    <%SimpleDateFormat formattedOtherDate = new SimpleDateFormat("EEEEEEEEEE, d MMM yyyy");
        Calendar calendar = Calendar.getInstance();%>

    <c:forEach var="i" begin="0" end="6">
        <a href="/date?date=${i}">
            <div class="forecast-item" >
                <div class="day">
                    <h4><%
                        out.println(formattedOtherDate.format(calendar.getTime()));
                        calendar.add(Calendar.DATE, 1);%></h4>
                </div>
                <div class="forecast">
                    <i class="wi wi-night-sleet"></i> ${weatherDtoList[i].temperature}
                    <i class="wi wi-night-sleet"></i> ${weatherUnit}
                    <h6>${weatherDtoList[i].weatherDescription}</h6>
                </div>
            </div>
        </a>
    </c:forEach>
    </form>
</div>
</body>
</html>
<html>


