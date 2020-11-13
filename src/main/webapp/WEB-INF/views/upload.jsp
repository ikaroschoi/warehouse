<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Upload product/Inventory</title>
    <link href="/css/bootstrap.min.css" rel="stylesheet">
</head>

<body>
    <jsp:include page="menubar.jsp"></jsp:include>
    <div class="container-fluid">
        <div class="form-row">
            <div class="col-md-8 offset-1">
                <div class="row border-bottom mb-3">
                    <h1 class="mt-3">Upload product / inventory</h1>
                </div>

                <h3>Upload product</h3>
                <div class="row border-bottom">
                    <form action="/upload/uploadProduct" method="post" enctype="multipart/form-data">
                        <div class="form-inline">
                            <label for="productCsv">Select csv of product</label>
                            <input class="form-control m-2" type="file" name="productCsv" id="productCsv" accept="text/csv" required>
                            <input class="btn btn-primary m-2" type="submit" value="Upload">
                            <c:choose>
                                <c:when test="${productUploadSuccess}">
                                    <div class="alert alert-success" role="alert">
                                        Upload product successfully
                                    </div>
                                </c:when>
                                <c:when test="${productUploadSuccess == false}">
                                    <div class="alert alert-danger" role="alert">
                                        Failed to upload product
                                    </div>
                                </c:when>
                            </c:choose>
                        </div>
                    </form>
                </div>

                <h3 class="mt-4">Upload inventory</h3>
                <div class="row border-bottom">
                    <form action="/upload/uploadInventory" method="post" enctype="multipart/form-data">
                        <div class="form-inline">
                            <label for="inventoryCsv">Select csv of inventory</label>
                            <input class="form-control m-2" type="file" name="inventoryCsv" id="inventoryCsv" accept="text/csv" required>
                            <input class="btn btn-primary m-2" type="submit" value="Upload">
                            <c:choose>
                                <c:when test="${inventoryUploadSuccess}">
                                    <div class="alert alert-success" role="alert">
                                        Upload inventory successfully
                                    </div>
                                </c:when>
                                <c:when test="${inventoryUploadSuccess == false}">
                                    <div class="alert alert-danger" role="alert">
                                        Failed to upload inventory
                                    </div>
                                </c:when>
                            </c:choose>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

</body>
<script src="/js/jquery.min.js"></script>
<script src="/js/bootstrap.bundle.min.js"></script>
</html>