<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>transfer</title>
    <link href="/css/bootstrap.min.css" rel="stylesheet">

</head>

<body>
    <jsp:include page="menubar.jsp"></jsp:include>
    <div class="container-fluid">
        <div class="form-row">
            <div class="col-md-8 offset-1">
                <div class="row border-bottom mb-3">
                    <h1 class="mt-3">Transfer Inventory</h1>
                </div>
                <div class="update-product mb-3">
                    <form action="/inventory/transfer" method="post" onsubmit="return locationValidate()">
                        <div class="form">
                            <div class="form-row">
                                <div class="form-group col-md-sm">
                                    <label for="from">From inventory</label>
                                    <select class="form-control" name="from" id="from" required>
                                        <option value="" disabled selected>Select Inventory</option>
                                        <option value="TKO">TKO</option>
                                        <option value="CWB">CWB</option>
                                    </select>
                                </div>
                                <div class="form-group col-md-sm">
                                    <label for="to">To inventory</label>
                                    <select class="form-control" name="to" id="to" required>
                                        <option value="" disabled selected>Select Inventory</option>
                                        <option value="TKO">TKO</option>
                                        <option value="CWB">CWB</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-sm">
                                    <label for="productCode">Product code</label>
                                    <input class="form-control" type="text" name="productCode" id="productCode" required>
                                </div>
                                <div class="form-group col-md-sm">
                                    <label for="quantity">Quantity</label>
                                    <input class="form-control" type="number" name="quantity" id="quantity" min="0" required>
                                </div>
                            </div>
                            <input class="btn btn-outline-primary mt-2 mb-3" type="submit" value="Transfer">
                            <c:if test="${not empty transferFailed}">
                                <div class="alert alert-danger" role="alert">
                                        ${transferFailed}
                                </div>
                            </c:if>
                            <c:if test="${not empty transferSuccess}">
                                <div class="alert alert-success" role="alert">
                                        ${transferSuccess}
                                </div>
                            </c:if>
                        </div>
                    </form>
                </div>

                <c:if test="${inventoryList.isEmpty() == true}">
                    Product not found in any inventory!
                </c:if>

            </div>
        </div>
    </div>
</body>
<script>
    function locationValidate(){
        let from = $("#from").val();
        let to = $("#to").val();
        if(from != to){
            $("#errorBox").text("");
        }else{
            $("#errorBox").text("Inventory location cannot be same!");
        }
        return from != to;
    }
</script>
</html>
