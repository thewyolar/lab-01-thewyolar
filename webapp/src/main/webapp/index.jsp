<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 10.12.2022
  Time: 0:50
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Продуктовый магазин</title>
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/style.css"/>">
</head>
<body>
    <h1>Продуктовый магазин</h1>
    <ol>
        <li><a href="<c:url value="/roles"/>">Роли</a></li>
        <li><a href="<c:url value="/users"/>">Пользователи</a></li>
        <li><a href="<c:url value="/products"/>">Продукты</a></li>
        <li><a href="<c:url value="/orders"/>">Заказы</a></li>
    </ol>
</body>
</html>
