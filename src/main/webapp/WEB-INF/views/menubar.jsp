<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<nav class="navbar navbar-expand-lg navbar-light" style="background-color: #e3f2fd;">
    <div class="collapse navbar-collapse">
        <ul class="navbar-nav mr-auto">
            <a class="navbar-brand" href="/">Inventory System</a>
            <li class="nav-item active">
                <a href="/" class="nav-link" >Home</a>
            </li>
            <li>
                <a href="/upload" class="nav-link">Upload Product/inventory</a>
            </li>
            <li>
                <a href="/search" class="nav-link">Search product</a>
            </li>
            <li>
                <a href="/inventory/transfer" class="nav-link">Transfer inventory</a>
            </li>
        </ul>
    </div>
</nav>