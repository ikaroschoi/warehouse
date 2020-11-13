<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Search</title>
    <link href="/css/bootstrap.min.css" rel="stylesheet">
</head>

<body>
    <jsp:include page="menubar.jsp"></jsp:include>
    <div class="container-fluid">
        <div class="form-row">
            <div class="col-md-8 offset-1">
                <div class="row border-bottom m-3">
                    <h1 class="mt-3">Search product</h1>
                </div>
                <form action="/search/findProduct" method="post">
                    <div class="form-group">
                        <label class="ml-3" for="productCode">Product code</label>
                        <div class="col-md-6">
                            <input class="form-control" type="text" name="productCode" id="productCode" placeholder="Eneter product code" required>
                        </div>
                        <input class="btn btn-outline-primary m-2 ml-3" type="submit" value="Search">
                    </div>
                </form>

                <div class="row border-bottom m-3">
                    <h3>Search Result</h3>
                </div>

                <div class="col-sm">
                    <table class="table table-striped">
                        <thead>
                        <tr>
                            <th scope="col">Inventory id</th>
                            <th scope="col">Product code</th>
                            <th scope="col">Inventory quantity</th>
                            <th scope="col">Inventory location</th>
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
                </div>
            </div>
        </div>
    </div>

</div>
<script src="/js/jquery.min.js"></script>
<script src="/js/bootstrap.bundle.min.js"></script>
</body>
</html>