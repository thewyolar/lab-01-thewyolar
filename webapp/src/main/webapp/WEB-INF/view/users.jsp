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
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/bootstrap.min.css"/>">
</head>
<body>
    <p class="ms-3"><a href="<c:url value="/"/>">Главная</a></p>
    <h3 class="mt-4 text-center">Пользователи</h3>
    <div class="container">
        <div class="row">
            <div class="col-8 offset-2">
                <button class="btn btn-success mt-2" data-bs-toggle="modal" data-bs-target="#addUserModal">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-plus-lg" viewBox="0 0 16 16">
                        <path fill-rule="evenodd" d="M8 2a.5.5 0 0 1 .5.5v5h5a.5.5 0 0 1 0 1h-5v5a.5.5 0 0 1-1 0v-5h-5a.5.5 0 0 1 0-1h5v-5A.5.5 0 0 1 8 2Z"/>
                    </svg>
                </button>
                <table class="table table-striped table-hover mt-2">
                    <thead class="table-dark">
                    <tr>
                        <th>ID</th>
                        <th>Username</th>
                        <th>Password</th>
                        <th>Role_id</th>
                        <th>Action</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${users}" var="user">
                        <tr>
                            <th scope="row"><c:out value="${user.id}" /></th>
                            <td><c:out value="${user.username}" /></td>
                            <td><c:out value="${user.password}" /></td>
                            <td><c:out value="${user.role.id}" /></td>
                            <td>
                                <a href="" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#editUserModal${user.id}">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
                                        <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
                                        <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
                                    </svg>
                                </a>
                                <a href="" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#deleteUserModal${user.id}">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash3-fill" viewBox="0 0 16 16">
                                        <path d="M11 1.5v1h3.5a.5.5 0 0 1 0 1h-.538l-.853 10.66A2 2 0 0 1 11.115 16h-6.23a2 2 0 0 1-1.994-1.84L2.038 3.5H1.5a.5.5 0 0 1 0-1H5v-1A1.5 1.5 0 0 1 6.5 0h3A1.5 1.5 0 0 1 11 1.5Zm-5 0v1h4v-1a.5.5 0 0 0-.5-.5h-3a.5.5 0 0 0-.5.5ZM4.5 5.029l.5 8.5a.5.5 0 1 0 .998-.06l-.5-8.5a.5.5 0 1 0-.998.06Zm6.53-.528a.5.5 0 0 0-.528.47l-.5 8.5a.5.5 0 0 0 .998.058l.5-8.5a.5.5 0 0 0-.47-.528ZM8 4.5a.5.5 0 0 0-.5.5v8.5a.5.5 0 0 0 1 0V5a.5.5 0 0 0-.5-.5Z"/>
                                    </svg>
                                </a>
                            </td>
                        </tr>

                        <!-- Edit User Modal -->
                        <div class="modal fade" id="editUserModal${user.id}" tabindex="-1" aria-labelledby="editUserModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h1 class="modal-title fs-5" id="editUserModalLabel">Изменить пользователя</h1>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <c:url value="/users/update?id=${user.id}" var="updateAction"/>
                                    <form:form method="post" action="${updateAction}" modelAttribute="user">
                                        <div class="modal-body">
                                            <div class="form-group">
                                                <form:label path="id"><spring:message text="ID:"/></form:label>
                                                <form:input path="id" value="${user.id}" cssClass="form-control" disabled="true" />
                                                <form:hidden path="id" />
                                            </div>
                                            <div class="form-group">
                                                <form:label path="username"><spring:message text="Имя пользователя:" /></form:label>
                                                <form:input path="username" value="${user.username}" cssClass="form-control" />
                                                <form:errors path="username" cssClass="error" />
                                            </div>
                                            <div class="form-group">
                                                <form:label path="password"><spring:message text="Пароль:" /></form:label>
                                                <form:input path="password" value="${user.password}" cssClass="form-control" />
                                                <form:errors path="password" cssClass="error" />
                                            </div>
                                            <div class="form-group">
                                                <form:label path="role.name"><spring:message text="Роль:" /></form:label>
                                                <form:input path="role.name" value="${user.role.name}" cssClass="form-control" />
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Закрыть</button>
                                            <button type="submit" class="btn btn-success">Обновить</button>
                                        </div>
                                    </form:form>
                                </div>
                            </div>
                        </div>

                        <!-- Delete User Modal -->
                        <div class="modal fade" id="deleteUserModal${user.id}" tabindex="-1" aria-labelledby="deleteUserModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h1 class="modal-title fs-5" id="deleteUserModalLabel">Удалить пользователя №${user.id}</h1>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Закрыть</button>
                                        <button type="submit" class="btn btn-danger">
                                            <a href="<c:url value="/users/delete/${user.username}"/>" style="text-decoration: none; color: white;">Удалить</a>
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>

                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <!-- Add User Modal -->
    <div class="modal fade" id="addUserModal" tabindex="-1" aria-labelledby="addUserModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="addUserModalLabel">Добавить пользователя</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <c:url value="/users/create" var="createAction"/>
                <form:form method="post" action="${createAction}" modelAttribute="user">
                    <div class="modal-body">
                        <div class="form-group">
                            <form:label path="username"><spring:message text="Имя пользователя:" /></form:label>
                            <form:input path="username" cssClass="form-control" />
                            <form:errors path="username" cssClass="error" />
                        </div>
                        <div class="form-group">
                            <form:label path="password"><spring:message text="Пароль:" /></form:label>
                            <form:input path="password" type="password" cssClass="form-control" />
                            <form:errors path="password" cssClass="error" />
                        </div>
                        <div class="form-group">
                            <form:label path="role.name"><spring:message text="Роль:" /></form:label>
                            <form:input path="role.name" cssClass="form-control" />
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Закрыть</button>
                        <button type="submit" class="btn btn-success">Добавить</button>
                    </div>
                </form:form>
            </div>
        </div>
    </div>

    <script type="text/javascript" src="<c:url value="/resources/js/bootstrap.bundle.min.js"/>"></script>
</body>
</html>
