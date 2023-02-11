<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 23.11.2022
  Time: 23:39
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Заказы</title>
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/style.css"/>">
</head>
<body>
    <div class="row">
        <a href="<c:url value="/"/>">Главная</a>
    </div>
    <h1>Заказы</h1>
    <c:url var="createAction" value="/orders/create"/>
    <form:form action="${createAction}" modelAttribute="order">
        <fieldset>
            <c:choose>
                <c:when test="${!empty order.date}">
                    <legend>Редактировать заказ</legend>
                    <div class="row">
                        <form:label path="id"><spring:message text="ID:" /></form:label><br>
                        <form:input path="id" readonly="true" disabled="true" />
                        <form:hidden path="id" />
                    </div>
                </c:when>
                <c:otherwise>
                    <legend>Новый заказ</legend>
                </c:otherwise>
            </c:choose>
            <div class="row">
                <form:label path="user.id"><spring:message text="Id пользователя:" /></form:label><br>
                <form:input path="user.id" />
            </div>
            <div class="row">
                <form:label path="product.id"><spring:message text="Id продукта:" /></form:label><br>
                <form:input path="product.id" />
            </div>
            <div class="row">
                <form:label path="count"><spring:message text="Количество:" /></form:label><br>
                <form:input path="count" /><br>
                <form:errors path="count" cssClass="error" />
            </div>
            <c:if test="${!empty order.date}">
                <div class="row">
                    <form:label path="date"><spring:message text="Дата:" /></form:label><br>
                    <form:input path="date" /><br>
                    <form:errors path="date" cssClass="error" />
                </div>
            </c:if>
        </fieldset>
        <c:if test="${!empty order.date}">
            <button type="submit"><spring:message text="Редактировать"/></button>
            <button type="submit"><a href="<c:url value="/orders"/>">Отменить</a></button>
        </c:if>
        <c:if test="${empty order.date}">
            <button type="submit"><spring:message text="Добавить"/></button>
        </c:if>
    </form:form>

    <c:if test="${!empty orders}">
        <h2>Список заказов</h2>
        <table>
            <thead>
            <tr>
                <th>ID</th>
                <th>UserId</th>
                <th>ProductId</th>
                <th>Count</th>
                <th>Date</th>
                <th>Action</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${orders}" var="order">
                <tr>
                    <td><a href="<c:url value="/orders/${order.id}"/>"><c:out value="${order.id}" /></a></td>
                    <td><c:out value="${order.user.id}" /></td>
                    <td><c:out value="${order.product.id}" /></td>
                    <td><c:out value="${order.count}" /></td>
                    <td>
                        <fmt:formatDate value="${order.date}" var="formatedDate" type="date" />
                        <c:out value="${formatedDate}"/>
                    </td>
                    <td>
                        <a href="<c:url value="/orders/update/${order.id}"/>">Update</a>
                        <a href="<c:url value="/orders/delete/${order.id}"/>" onclick="return confirm('Удалить заказ №${order.id}?')">Delete</a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </c:if>
</body>
</html>
