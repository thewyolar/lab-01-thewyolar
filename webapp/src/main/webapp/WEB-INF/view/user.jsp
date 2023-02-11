<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 10.12.2022
  Time: 15:37
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Пользователь №${user.id}</title>
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/style.css"/>">
</head>
<body>
    <div class="row">
        <a href="<c:url value="/users"/>">Назад</a>
    </div>
    <c:if test="${!empty user}">
        <h2>Пользователь №${user.id}</h2>
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
                <tr>
                    <td><c:out value="${user.id}" /></td>
                    <td><c:out value="${user.username}" /></td>
                    <td><c:out value="${user.password}" /></td>
                    <td><c:out value="${user.role.id}" /></td>
                </tr>
            </tbody>
        </table>
    </c:if>
</body>
</html>
