<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 29.11.2022
  Time: 23:53
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Роли</title>
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/style.css"/>"/>
</head>
<body>
    <div class="row">
        <a href="<c:url value="/"/>">Главная</a>
    </div>
    <h1>Роли</h1>
    <c:url value="/roles/create" var="createAction"/>
    <form:form action="${createAction}" modelAttribute="role">
        <fieldset>
            <c:choose>
                <c:when test="${!empty role.name}">
                    <legend>Редактировать роль</legend>
                    <div class="row">
                        <form:label path="id"><spring:message text="ID:" /></form:label><br>
                        <form:input path="id" readonly="true" disabled="true" />
                        <form:hidden path="id" />
                    </div>
                </c:when>
                <c:otherwise>
                    <legend>Новая роль</legend>
                </c:otherwise>
            </c:choose>
            <div class="row">
                <form:label path="name"><spring:message text="Название роли:" /></form:label><br>
                <form:input path="name" /><br>
                <form:errors path="name" cssClass="error" />
            </div>
        </fieldset>
        <c:if test="${!empty role.name}">
            <button type="submit"><spring:message text="Редактировать"/></button>
            <button type="submit"><a href="<c:url value="/roles"/>">Отменить</a></button>
        </c:if>
        <c:if test="${empty role.name}">
            <button type="submit"><spring:message text="Добавить"/></button>
        </c:if>
    </form:form>

    <c:if test="${!empty roles}">
        <table>
            <thead>
            <tr>
                <th>ID</th>
                <th>Role</th>
                <th>Action</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${roles}" var="role">
                <tr>
                    <td><c:out value="${role.id}" /></td>
                    <td><a href="<c:url value="/roles/${role.name}"/>"><c:out value="${role.name}"/></a></td>
                    <td>
                        <a href="<c:url value="/roles/update/${role.name}"/>">Update</a>
                        <a href="<c:url value="/roles/delete/${role.name}"/>" onclick="return confirm('Удалить ${role.name}?')">Delete</a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </c:if>
</body>
</html>
