<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 10.12.2022
  Time: 0:50
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Продуктовый магазин</title>
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/bootstrap.min.css"/>">
</head>
<body>
    <h3 class="my-4 text-center">Продуктовый магазин</h3>
    <div class="container">
        <div class="row">
            <div class="col-6 offset-3">
                <ol class="list-group list-group-numbered">
                    <li class="list-group-item d-flex justify-content-between align-items-start">
                        <div class="ms-2 me-auto">
                            <div class="fw-bold">Роли</div>
                            <a href="<c:url value="/roles"/>">Таблица ролей</a>
                        </div>
                    </li>
                    <li class="list-group-item d-flex justify-content-between align-items-start">
                        <div class="ms-2 me-auto">
                            <div class="fw-bold">Пользователи</div>
                            <a href="<c:url value="/users"/>">Таблица пользователей</a>
                        </div>
                    </li>
                    <li class="list-group-item d-flex justify-content-between align-items-start">
                        <div class="ms-2 me-auto">
                            <div class="fw-bold">Продукты</div>
                            <a href="<c:url value="/products"/>">Таблица продуктов</a>
                        </div>
                    </li>
                    <li class="list-group-item d-flex justify-content-between align-items-start">
                        <div class="ms-2 me-auto">
                            <div class="fw-bold">Заказы</div>
                            <a href="<c:url value="/orders"/>">Таблица заказов</a>
                        </div>
                    </li>
                </ol>
            </div>
        </div>
    </div>

    <script type="text/javascript" src="<c:url value="/resources/js/bootstrap.bundle.min.js"/>"></script>
</body>
</html>
