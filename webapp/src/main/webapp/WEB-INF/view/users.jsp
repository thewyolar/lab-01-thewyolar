<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 30.11.2022
  Time: 21:29
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Пользователи</title>
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/style.css"/>">
</head>
<body>
    <div class="row">
        <a href="<c:url value="/"/>">Главная</a>
    </div>
    <h1>Пользователи</h1>
    <c:url var="createAction" value="/users/create"/>
    <form:form action="${createAction}" modelAttribute="user">
        <fieldset>
            <c:choose>
                <c:when test="${!empty user.username}">
                    <legend>Редактировать пользователя</legend>
                    <div class="row">
                        <form:label path="id"><spring:message text="ID:" /></form:label><br>
                        <form:input path="id" readonly="true" disabled="true" />
                        <form:hidden path="id" />
                    </div>
                </c:when>
                <c:otherwise>
                    <legend>Новый пользователь</legend>
                </c:otherwise>
            </c:choose>
            <div class="row">
                <form:label path="username"><spring:message text="Имя пользователя:" /></form:label><br>
                <form:input path="username" /><br>
                <form:errors path="username" cssClass="error" />
            </div>
            <div class="row">
                <form:label path="password"><spring:message text="Пароль:" /></form:label><br>
                <form:input path="password" /><br>
                <form:errors path="password" cssClass="error" />
            </div>
            <div class="row">
                <form:label path="role.name"><spring:message text="Роль:" /></form:label><br>
                <form:input path="role.name" />
            </div>
        </fieldset>
        <c:if test="${!empty user.username}">
            <button type="submit"><spring:message text="Редактировать"/></button>
            <button type="submit"><a href="<c:url value="/users"/>">Отменить</a></button>
        </c:if>
        <c:if test="${empty user.username}">
            <button type="submit" formmethod="post"><spring:message text="Добавить"/></button>
        </c:if>
    </form:form>

    <c:if test="${!empty users}">
        <table>
            <thead>
            <tr>
                <th>ID</th>
                <th>Username</th>
                <th>Password</th>
                <th>Role_id</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${users}" var="user">
                <tr>
                    <td><c:out value="${user.id}" /></td>
                    <td><a href="<c:url value="/users/${user.username}"/>"><c:out value="${user.username}" /></a></td>
                    <td><c:out value="${user.password}" /></td>
                    <td><c:out value="${user.role.id}" /></td>
                    <td>
                        <a href="<c:url value="/users/update/${user.username}"/>">Update</a>
                        <a href="<c:url value="/users/delete/${user.username}"/>" onclick="return confirm('Удалить ${user.username}?')">Delete</a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </c:if>
</body>
</html>
