<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Home</title>
    <link href="/css/bootstrap.min.css" rel="stylesheet">
</head>

<body>
    <jsp:include page="menubar.jsp"></jsp:include>

    <div class="container-fluid">
        <div class="form-row">
            <div class="col-md-8 offset-1">
                <div class="row border-bottom mb-3">
                    <h1 class="mt-3">Home</h1>
                </div>
                <h3>Products</h3>
                <c:choose>
                    <c:when test="${productList.isEmpty()}">
                        <div class="alert alert-warning" role="alert">
                            No Product Record, upload product!
                        </div>
                    </c:when>
                    <c:otherwise>
                <table class="table table-striped">
                    <thead>
                    <tr>
                        <th scope="col">Code</th>
                        <th scope="col">Name</th>
                        <th scope="col">weight</th>
                    </tr>
                    </thead>
                    <c:forEach items="${productList}" var="product">
                        <tr>
                            <td>${product.code}</td>
                            <td>${product.name}</td>
                            <td>${product.weight}</td>
                        </tr>
                    </c:forEach>
                </table>
                </c:otherwise>
            </c:choose>

                <h3>Inventory</h3>
                <c:choose>
                    <c:when test="${inventoryList.isEmpty()}">
                        <div class="alert alert-warning" role="alert">
                            No inventory Record, upload inventory!
                        </div>
                    </c:when>
                    <c:otherwise>
                <table class="table table-striped">
                    <thead>
                    <tr>
                        <th scope="col">Id</th>
                        <th scope="col">Product Code</th>
                        <th scope="col">quantity</th>
                        <th scope="col">location</th>
                    </tr>
                    </thead>
                    <c:forEach items="${inventoryList}" var="inventory">
                        <tr>
                            <td>${inventory.id}</td>
                            <td>${inventory.productCode}</td>
                            <td>${inventory.quantity}</td>
                            <td>${inventory.location}</td>
                        </tr>
                    </c:forEach>
                </table>
                </c:otherwise>
            </c:choose>
            </div>
        </div>
    </div>
<script src="/js/jquery.min.js"></script>
<script src="/js/bootstrap.bundle.min.js"></script>

</body>
</html>