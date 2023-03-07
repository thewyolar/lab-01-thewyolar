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
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/bootstrap.min.css"/>">
</head>
<body>
<%--    <div class="row">--%>
<%--        <a href="<c:url value="/"/>">Главная</a>--%>
<%--    </div>--%>
<%--    <h1>Продукты</h1>--%>
<%--    <c:url var="createRoleAction" value="/products/create"/>--%>
<%--    <form:form action="${createRoleAction}" modelAttribute="product">--%>
<%--        <fieldset>--%>
<%--            <c:choose>--%>
<%--                <c:when test="${!empty product.name}">--%>
<%--                    <legend>Редактировать родукт</legend>--%>
<%--                    <div class="row">--%>
<%--                        <form:label path="id"><spring:message text="ID:" /></form:label><br>--%>
<%--                        <form:input path="id" readonly="true" disabled="true" />--%>
<%--                        <form:hidden path="id" />--%>
<%--                    </div>--%>
<%--                </c:when>--%>
<%--                <c:otherwise>--%>
<%--                    <legend>Новый продукт</legend>--%>
<%--                </c:otherwise>--%>
<%--            </c:choose>--%>
<%--            <div class="row">--%>
<%--                <form:label path="name"><spring:message text="Название продукта:" /></form:label><br>--%>
<%--                <form:input path="name" /><br>--%>
<%--                <form:errors path="name" cssClass="error" />--%>
<%--            </div>--%>
<%--            <div class="row">--%>
<%--                <form:label path="price"><spring:message text="Цена:" /></form:label><br>--%>
<%--                <form:input path="price" /><br>--%>
<%--                <form:errors path="price" cssClass="error" />--%>
<%--            </div>--%>
<%--        </fieldset>--%>
<%--        <c:if test="${!empty product.name}">--%>
<%--            <button type="submit"><spring:message text="Редактировать"/></button>--%>
<%--            <button type="submit"><a href="<c:url value="/products"/>">Отменить</a></button>--%>
<%--        </c:if>--%>
<%--        <c:if test="${empty product.name}">--%>
<%--            <button type="submit"><spring:message text="Добавить"/></button>--%>
<%--        </c:if>--%>
<%--    </form:form>--%>

<%--    <c:if test="${!empty products}">--%>
<%--        <h2>Список продуктов</h2>--%>
<%--        <table>--%>
<%--            <thead>--%>
<%--                <tr>--%>
<%--                    <th>ID</th>--%>
<%--                    <th>Name</th>--%>
<%--                    <th>Price</th>--%>
<%--                    <th>Action</th>--%>
<%--                </tr>--%>
<%--            </thead>--%>
<%--            <tbody>--%>
<%--                <c:set var="totalPrice" value="0" />--%>
<%--                <c:forEach items="${products}" var="product">--%>
<%--                    <tr>--%>
<%--                        <td><c:out value="${product.id}" /></td>--%>
<%--                        <td><a href="<c:url value="/products/${product.name}"/>"><c:out value="${product.name}" /></a></td>--%>
<%--                        <td><c:out value="${product.price}" /></td>--%>
<%--                        <td>--%>
<%--                            <a href="<c:url value="/products/update/${product.name}"/>">Update</a>--%>
<%--                            <a href="<c:url value="/products/delete/${product.name}"/>" onclick="return confirm('Удалить ${product.name}?')">Delete</a>--%>
<%--                        </td>--%>
<%--                    </tr>--%>
<%--                    <c:set var="totalPrice" value="${totalPrice + product.price}" />--%>
<%--                </c:forEach>--%>
<%--            </tbody>--%>
<%--        </table>--%>
<%--    </c:if>--%>
<%--    <fmt:formatNumber value="${totalPrice}" type="number" maxFractionDigits="2" var="formatedTotalPrice"/>--%>
<%--    <h3>Общая сумма = <c:out value="${formatedTotalPrice}" /></h3>--%>
    <p class="ms-3"><a href="<c:url value="/"/>">Главная</a></p>
    <h3 class="mt-4 text-center">Продукты</h3>
    <div class="container">
        <div class="row">
            <div class="col-6 offset-3">
                <button class="btn btn-success mt-2" data-bs-toggle="modal" data-bs-target="#addProductModal">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-plus-lg" viewBox="0 0 16 16">
                        <path fill-rule="evenodd" d="M8 2a.5.5 0 0 1 .5.5v5h5a.5.5 0 0 1 0 1h-5v5a.5.5 0 0 1-1 0v-5h-5a.5.5 0 0 1 0-1h5v-5A.5.5 0 0 1 8 2Z"/>
                    </svg>
                </button>
                <table class="table table-striped table-hover mt-2">
                    <thead class="table-dark">
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
                            <th scope="row"><c:out value="${product.id}" /></th>
                            <td><c:out value="${product.name}" /></td>
                            <td><c:out value="${product.price}" /></td>
                            <td>
                                <a href="" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#editProductModal${product.id}">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
                                        <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
                                        <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
                                    </svg>
                                </a>
                                <a href="" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#deleteProductModal${product.id}">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash3-fill" viewBox="0 0 16 16">
                                        <path d="M11 1.5v1h3.5a.5.5 0 0 1 0 1h-.538l-.853 10.66A2 2 0 0 1 11.115 16h-6.23a2 2 0 0 1-1.994-1.84L2.038 3.5H1.5a.5.5 0 0 1 0-1H5v-1A1.5 1.5 0 0 1 6.5 0h3A1.5 1.5 0 0 1 11 1.5Zm-5 0v1h4v-1a.5.5 0 0 0-.5-.5h-3a.5.5 0 0 0-.5.5ZM4.5 5.029l.5 8.5a.5.5 0 1 0 .998-.06l-.5-8.5a.5.5 0 1 0-.998.06Zm6.53-.528a.5.5 0 0 0-.528.47l-.5 8.5a.5.5 0 0 0 .998.058l.5-8.5a.5.5 0 0 0-.47-.528ZM8 4.5a.5.5 0 0 0-.5.5v8.5a.5.5 0 0 0 1 0V5a.5.5 0 0 0-.5-.5Z"/>
                                    </svg>
                                </a>
                            </td>
                        </tr>
                        <c:set var="totalPrice" value="${totalPrice + product.price}" />

                        <!-- Edit Product Modal -->
                        <div class="modal fade" id="editProductModal${product.id}" tabindex="-1" aria-labelledby="editProductModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h1 class="modal-title fs-5" id="editProductModalLabel">Изменить продукт</h1>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <c:url value="/products/update?id=${product.id}" var="updateAction"/>
                                    <form:form method="post" action="${updateAction}" modelAttribute="product">
                                        <div class="modal-body">
                                            <div class="form-group">
                                                <form:label path="id"><spring:message text="ID:"/></form:label>
                                                <form:input path="id" value="${product.id}" cssClass="form-control" disabled="true" />
                                                <form:hidden path="id" />
                                            </div>
                                            <div class="form-group">
                                                <form:label path="name"><spring:message text="Название продукта:" /></form:label>
                                                <form:input path="name" value="${product.name}" cssClass="form-control" />
                                                <form:errors path="name" cssClass="error" />
                                            </div>
                                            <div class="form-group">
                                                <form:label path="price"><spring:message text="Цена:" /></form:label>
                                                <form:input path="price" value="${product.price}" cssClass="form-control" />
                                                <form:errors path="price" cssClass="error" />
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

                        <!-- Delete Product Modal -->
                        <div class="modal fade" id="deleteProductModal${product.id}" tabindex="-1" aria-labelledby="deleteProductModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h1 class="modal-title fs-5" id="deleteProductModalLabel">Удалить продукт №${product.id}</h1>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Закрыть</button>
                                        <button type="submit" class="btn btn-danger">
                                            <a href="<c:url value="/products/delete/${product.name}"/>" style="text-decoration: none; color: white;">Удалить</a>
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>

                    </tbody>
                </table>

                <fmt:formatNumber value="${totalPrice}" type="number" maxFractionDigits="2" var="formatedTotalPrice"/>
                <p>Общая сумма = <c:out value="${formatedTotalPrice}" /></p>
            </div>
        </div>
    </div>

    <!-- Add Product Modal -->
    <div class="modal fade" id="addProductModal" tabindex="-1" aria-labelledby="addProductModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="addProductModalLabel">Добавить продукт</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <c:url value="/products/create" var="createAction"/>
                <form:form method="post" action="${createAction}" modelAttribute="product">
                    <div class="modal-body">
                        <div class="form-group">
                            <form:label path="name"><spring:message text="Название продукта:" /></form:label>
                            <form:input path="name" cssClass="form-control" />
                            <form:errors path="name" cssClass="error" />
                        </div>
                        <div class="form-group">
                            <form:label path="price"><spring:message text="Цена:" /></form:label>
                            <form:input path="price" cssClass="form-control" />
                            <form:errors path="price" cssClass="error" />
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
