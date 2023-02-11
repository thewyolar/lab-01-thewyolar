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
    <title>Роль №${role.id}</title>
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/style.css"/>">
</head>
<body>
    <div class="row">
        <a href="<c:url value="/roles"/>">Назад</a>
    </div>
    <c:if test="${!empty role}">
        <h2>Роль №${role.id}</h2>
        <table>
            <thead>
            <tr>
                <th>ID</th>
                <th>Role</th>
            </tr>
            </thead>
            <tbody>
                <tr>
                    <td><c:out value="${role.id}" /></td>
                    <td><c:out value="${role.name}" /></td>
                </tr>
            </tbody>
        </table>
    </c:if>
</body>
</html>
