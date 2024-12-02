<%@ page import="com.example.progettoecommerce.model.Purchase" %>
<%@ page import="com.example.progettoecommerce.model.Product" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Purchase Dashboard</title>
    <!-- Include Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container">
    <h1>Purchase Dashboard</h1>
    <%
        List<Purchase> purchases = (List<Purchase>) request.getAttribute("purchases");
        if (purchases != null && !purchases.isEmpty()) {
            for (Purchase purchase : purchases) {
    %>
    <div class="card mb-3">
        <div class="card-header">
            Order Date: <%= purchase.getDate() %>
        </div>
        <div class="card-body">
            <h5 class="card-title">Products:</h5>
            <ul class="list-group">
                <%
                    for (Product product : purchase.getProducts()) {
                %>
                <li class="list-group-item">
                    <%= product.getNome() %> - <%= product.getPrezzo() %> &euro;
                </li>
                <%
                    }
                %>
            </ul>
        </div>
    </div>
    <%
        }
    } else {
    %>
    <p>No purchases found.</p>
    <%
        }
    %>
</div>
<!-- Include Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>