<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>agriConnect</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">
</head>
<body>

<!-- Navigation Bar -->
<nav class="navbar navbar-expand-lg" aria-label="Site menu">
    <div class="container d-flex align-items-center">
        <a class="navbar-brand" href="/">🌿 agriConnect</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse d-flex justify-content-between" id="navbarNav">
            <!-- Search Form -->
            <form action="/" class="d-flex ms-auto align-items-center">
                <input class="form-control me-2 search-box" type="search" placeholder="Search" aria-label="Search">
                <button class="btn btn-light" type="submit">Search</button>
            </form>

            <!-- Login/Signup (or Username/Logout if logged in) -->
            <ul class="navbar-nav ms-3 d-flex align-items-center">
                <c:choose>
                    <c:when test="${not empty sessionScope.loggedInUser}">
                        <li class="nav-item">
                            <a class="nav-link" href="#">👤 ${sessionScope.loggedInUser}</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link btn btn-danger btn-sm text-white ms-2" href="/logout">Log Out</a>
                        </li>
                    </c:when>
                    <c:otherwise>
                        <li class="nav-item">
                            <a class="nav-link btn btn-outline-primary btn-sm me-2" href="/login">Login</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link btn btn-warning btn-sm text-white" href="/register">Register</a>
                        </li>
                    </c:otherwise>
                </c:choose>
            </ul>
        </div>
    </div>
</nav>

<!-- Main Content -->
<div class="container mt-4">
    <h2 class="text-center text-success mb-4">🌱 Explore Fresh Agricultural Products</h2>
    <div class="row">
        <!-- Loop through products and display them in Bootstrap cards -->
        <c:forEach var="product" items="${products.content}">
            <div class="col-md-4">
                <div class="card shadow-sm mb-4">
                    <c:if test="${not empty product.imageUrl}">
                        <img src="${product.imageUrl}" class="card-img-top" alt="${product.title}" style="height: 200px; object-fit: cover;">
                    </c:if>
                    <div class="card-body">
                        <h5 class="card-title">${product.title}</h5>
                        <p class="card-text text-muted">${product.description}</p>
                        <div class="d-flex justify-content-between align-items-center">
                            <span class="text-success fw-bold">$${product.price}</span>
                            <a href="#" class="btn btn-outline-success btn-sm">View Details</a>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>

    <!-- Pagination -->
    <nav aria-label="Page navigation">
        <ul class="pagination justify-content-center mt-3">
            <c:if test="${products.hasPrevious()}">
                <li class="page-item">
                    <a class="page-link" href="?page=${products.number - 1}">« Previous</a>
                </li>
            </c:if>
            <c:forEach var="i" begin="0" end="${products.totalPages - 1}">
                <li class="page-item ${i == products.number ? 'active' : ''}">
                    <a class="page-link" href="?page=${i}">${i + 1}</a>
                </li>
            </c:forEach>
            <c:if test="${products.hasNext()}">
                <li class="page-item">
                    <a class="page-link" href="?page=${products.number + 1}">Next »</a>
                </li>
            </c:if>
        </ul>
    </nav>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
