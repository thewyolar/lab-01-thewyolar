<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 01.12.2022
  Time: 1:09
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Продукты</title>
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/style.css"/>">
</head>
<body>
    <div class="row">
        <a href="<c:url value="/"/>">Главная</a>
    </div>
    <h1>Продукты</h1>
    <c:url var="createRoleAction" value="/products/create"/>
    <form:form action="${createRoleAction}" modelAttribute="product">
        <fieldset>
            <c:choose>
                <c:when test="${!empty product.name}">
                    <legend>Редактировать родукт</legend>
                    <div class="row">
                        <form:label path="id"><spring:message text="ID:" /></form:label><br>
                        <form:input path="id" readonly="true" disabled="true" />
                        <form:hidden path="id" />
                    </div>
                </c:when>
                <c:otherwise>
                    <legend>Новый продукт</legend>
                </c:otherwise>
            </c:choose>
            <div class="row">
                <form:label path="name"><spring:message text="Название продукта:" /></form:label><br>
                <form:input path="name" /><br>
                <form:errors path="name" cssClass="error" />
            </div>
            <div class="row">
                <form:label path="price"><spring:message text="Цена:" /></form:label><br>
                <form:input path="price" /><br>
                <form:errors path="price" cssClass="error" />
            </div>
        </fieldset>
        <c:if test="${!empty product.name}">
            <button type="submit"><spring:message text="Редактировать"/></button>
            <button type="submit"><a href="<c:url value="/products"/>">Отменить</a></button>
        </c:if>
        <c:if test="${empty product.name}">
            <button type="submit"><spring:message text="Добавить"/></button>
        </c:if>
    </form:form>

    <c:if test="${!empty products}">
        <h2>Список продуктов</h2>
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Price</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <c:set var="totalPrice" value="0" />
                <c:forEach items="${products}" var="product">
                    <tr>
                        <td><c:out value="${product.id}" /></td>
                        <td><a href="<c:url value="/products/${product.name}"/>"><c:out value="${product.name}" /></a></td>
                        <td><c:out value="${product.price}" /></td>
                        <td>
                            <a href="<c:url value="/products/update/${product.name}"/>">Update</a>
                            <a href="<c:url value="/products/delete/${product.name}"/>" onclick="return confirm('Удалить ${product.name}?')">Delete</a>
                        </td>
                    </tr>
                    <c:set var="totalPrice" value="${totalPrice + product.price}" />
                </c:forEach>
            </tbody>
        </table>
    </c:if>
    <fmt:formatNumber value="${totalPrice}" type="number" maxFractionDigits="2" var="formatedTotalPrice"/>
    <h3>Общая сумма = <c:out value="${formatedTotalPrice}" /></h3>
</body>
</html>
