<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Weather</title>
</head>
<body>
<form method="post" action="weather">
    <input placeholder="City" type="text" name="city"/>
    <select name="units">
        <option value="M">Цельсий</option>
        <option value="I">Фаренгейт</option>
        <option value="S">Кельвин</option>
    </select>
    <input type="submit" value="Submit"/>
</form>
</body>
</html>
