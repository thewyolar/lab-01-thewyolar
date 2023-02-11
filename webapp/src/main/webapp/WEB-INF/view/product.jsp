<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 10.12.2022
  Time: 15:29
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Продукт №${product.id}</title>
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/style.css"/>">
</head>
<body>
    <div class="row">
        <a href="<c:url value="/products"/>">Назад</a>
    </div>
    <c:if test="${!empty product}">
        <h2>Продукт №${product.id}</h2>
        <table>
            <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Price</th>
            </tr>
            </thead>
            <tbody>
                <tr>
                    <td><c:out value="${product.id}" /></td>
                    <td><c:out value="${product.name}" /></td>
                    <td><c:out value="${product.price}" /></td>
                </tr>
            </tbody>
        </table>
    </c:if>
</body>
</html>
