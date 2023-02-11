<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 10.12.2022
  Time: 2:35
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Заказ №${order.id}</title>
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/style.css"/>">
</head>
<body>
    <div class="row">
        <a href="<c:url value="/orders"/>">Назад</a>
    </div>
    <c:if test="${!empty order}">
        <h2>Заказ №${order.id}</h2>
        <table>
            <thead>
            <tr>
                <th>ID</th>
                <th>UserId</th>
                <th>ProductId</th>
                <th>Count</th>
                <th>Date</th>
            </tr>
            </thead>
            <tbody>
                <tr>
                    <td><c:out value="${order.id}" /></td>
                    <td><c:out value="${order.user.id}" /></td>
                    <td><c:out value="${order.product.id}" /></td>
                    <td><c:out value="${order.count}" /></td>
                    <td><c:out value="${order.date}" /></td>
                </tr>
            </tbody>
        </table>
    </c:if>
</body>
</html>
