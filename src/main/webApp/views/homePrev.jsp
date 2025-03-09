<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>agriConnect</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>

<!-- Navigation Bar -->
<nav class="navbar navbar-expand-lg navbar-light bg-light" aria-label="Site menu">
    <a class="navbar-brand" href="/">agriConnect</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
            aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
        <!-- Search Form -->
        <form action="/" class="form-inline my-2 my-lg-0 ml-auto">
            <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
            <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
        </form>

        <!-- Login/Signup (or Username/Logout if logged in) -->
        <ul class="navbar-nav ml-2">
            <c:choose>
                <c:when test="${not empty sessionScope.loggedInUser}">
                    <li class="nav-item">
                        <a class="nav-link" href="#">Welcome, ${sessionScope.loggedInUser}</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/logout">Sign Out</a>
                    </li>
                </c:when>
                <c:otherwise>
                    <li class="nav-item">
                        <a class="nav-link" href="/login">Login</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/register">Sign Up</a>
                    </li>
                </c:otherwise>
            </c:choose>
        </ul>
    </div>
</nav>

<!-- Main Content -->
<div class="container mt-4">
    <div class="row">
        <!-- Loop through products and display them in Bootstrap cards -->
        <c:forEach var="product" items="${products.content}">
            <div class="col-md-4">
                <div class="card mb-4 shadow-sm">
                    <c:if test="${not empty product.imageUrl}">
                        <img src="${product.imageUrl}" class="card-img-top" alt="${product.title}">
                    </c:if>
                    <div class="card-body">
                        <h5 class="card-title">${product.title}</h5>
                        <p class="card-text">${product.description}</p>
                        <div class="d-flex justify-content-between align-items-center">
                            <span class="text-muted">$${product.price}</span>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>

    <!-- Pagination -->
    <nav aria-label="Page navigation">
        <ul class="pagination justify-content-center">
            <c:if test="${products.hasPrevious()}">
                <li class="page-item">
                    <a class="page-link" href="?page=${products.number - 1}">Previous</a>
                </li>
            </c:if>
            <c:forEach var="i" begin="0" end="${products.totalPages - 1}">
                <li class="page-item ${i == products.number ? 'active' : ''}">
                    <a class="page-link" href="?page=${i}">${i + 1}</a>
                </li>
            </c:forEach>
            <c:if test="${products.hasNext()}">
                <li class="page-item">
                    <a class="page-link" href="?page=${products.number + 1}">Next</a>
                </li>
            </c:if>
        </ul>
    </nav>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
