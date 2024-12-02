<%@ page import="com.example.progettoecommerce.model.User" %>
<%@ page import="com.example.progettoecommerce.model.Product" %>
<%@ page import="com.example.progettoecommerce.model.Ruolo" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product Details</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEJX3X2e2fBB6YxDliXioIWiULocJmWFTgmoCe1Rjsl67qXtSKs9EG9y1vowh" crossorigin="anonymous">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.8.1/font/bootstrap-icons.min.css">
    <style>
        .card-img {
        flex: 1;
    }
    .card-details {
        flex: 2;
        padding-left: 20px;
    }
    .card-body {
        display: flex;
        align-items: center;
    }
    .card-img img {
        width: 100%;
        height: 300px;
        object-fit: contain;
    }
    .btn {
        border-radius: 20px;
    }

    /* Larghezza e altezza uniforme per tutti i bottoni */
    .btn {
        min-width: 120px;   /* Larghezza minima per uniformare i bottoni */
        height: 45px;       /* Altezza uniforme per tutti i bottoni */
        display: flex;      /* Usa Flexbox per centrare il testo verticalmente */
        justify-content: center; /* Centra il testo orizzontalmente */
        align-items: center; /* Centra il testo verticalmente */
        border-radius: 20px; /* Bordi arrotondati */
        font-size: 16px;    /* Dimensione del testo */
        padding: 10px 20px; /* Padding per i bottoni */
    }

    /* Bottoni più stretti per Wishlist e Carrello */
    .navbar-nav .btn-pink,
    .navbar-nav .btn-info {
        min-width: 100px;  /* Ridotto per Wishlist e Carrello */
    }

    /* Bottoni per Dashboard e Logout con larghezza maggiore */
    .navbar-nav .btn-primary,
    .navbar-nav .btn-danger {
        min-width: 150px;  /* Più larghi per Dashboard e Logout */
    }

    /* Aumentare la larghezza per Dashboard User */
    .navbar-nav .btn-primary {
        min-width: 180px;  /* Larghezza maggiore per Dashboard User */
    }

    /* Colori personalizzati per i bottoni */
    .navbar-nav .btn-pink {
        background-color: #ff69b4;
        color: white;
    }

    .navbar-nav .btn-info {
        background-color: #17a2b8;
        color: white;
    }

    .navbar-nav .btn-danger {
        background-color: #dc3545;
        color: white;
    }

    .navbar-nav .btn-primary {
        background-color: #007bff;
        color: white;
    }

    /* Colore di sfondo per la navbar */
    .navbar-light {
        background-color: #f8f9fa;
    }

    /* Margine per i bottoni nella navbar, per distanziare meglio gli elementi */
    .navbar-nav.ml-auto {
        margin-left: auto;
    }

    /* Responsive per la navbar quando si riduce la finestra */
    @media (max-width: 991px) {
        .navbar-nav {
            text-align: center;
        }
        .navbar-nav .nav-item {
            margin: 10px 0; /* Distanza verticale tra i bottoni */
        }
    }
    </style>
</head>
<body>
<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-light bg-light mb-4">
    <div class="container-fluid">
        <a class="navbar-brand" href="Home">
            <i class="bi bi-box-arrow-in-left"></i>Home
        </a>
        <a class="navbar-brand" href="#">E-Commerce</a>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item mx-auto">
                    <a class="nav-link" href="#">Edit User</a>
                </li>
                <%
                    User user = (User) request.getSession().getAttribute("user");
                    if (user == null) {
                %>
                <li class="nav-item">
                    <a class="nav-link btn btn-primary text-white px-4" href="Login">Login</a>
                </li>
                <%
                } else {
                %>
                <li class="nav-item">
                    <a class="nav-link" href="#">Welcome, <%= user.getNome() %></a>
                </li>
                <% if (user.getRuolo() == Ruolo.ADMIN) { %>
                <li class="nav-item mr-3">
                    <a href="DashboardUser" class="btn btn-primary">Dashboard User</a>
                </li>
                <li class="nav-item mr-3">
                    <a href="DashboardOrdini" class="btn btn-primary">Dashboard Ordini</a>
                </li>
                <% } %>
                <li class="nav-item mr-3">
                    <a class="nav-link btn btn-pink text-white px-4" href="wishList">
                        <i class="bi bi-heart"></i>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link btn btn-info text-white px-4" href="cart">
                        <i class="bi bi-cart"></i>
                    </a>
                </li>
                <li class="nav-item ml-3">
                    <a class="nav-link btn btn-danger text-white px-4" href="Logout">Logout</a>
                </li>
                <%
                    }
                %>
            </ul>
        </div>
    </div>
</nav>
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <%
                Product product = (Product) session.getAttribute("product");
                if (product != null) {
            %>
            <div class="card">
                <div class="card-body">
                    <div class="card-img">
                        <img src="<%= product.getImmagine() %>" class="img-fluid" alt="<%= product.getNome() %>">
                    </div>
                    <div class="card-details">
                        <h5 class="card-title"><%= product.getNome() %></h5>
                        <p class="card-text"><strong>Brand:</strong> <%= product.getMarca() %></p>
                        <p class="card-text"><strong>Price:</strong> <%= product.getPrezzo() %> &euro;</p>
                        <p class="card-text"><strong>Weight:</strong> <%= product.getPeso() %> kg</p>
                        <p class="card-text"><strong>Ingredients:</strong></p>
                        <textarea class="card-textarea form-control" readonly><%= product.getIngredienti() %></textarea>
                    </div>
                </div>
            </div>
            <%
            } else {
            %>
            <div class="alert alert-warning text-center" role="alert">
                Product not found.
            </div>
            <%
                }
            %>
        </div>
    </div>
</div>
<!-- Bootstrap JS and Popper.js (required for Bootstrap) -->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js" integrity="sha384-eMN8ozpKb06hKH9ZGzKj4dK9UqsNl0vSrxhfK5yZ72S4zKgZs29nqdzc7cOBmLlS" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js" integrity="sha384-GLhlTQ8iRABQx3xD7L+J7zpcirFcFpaBRC5r3lZtWvR6Ik0d8fM3kRStHgNSpt1R" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<!-- Popper.js (required for Bootstrap) -->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<!-- Bootstrap JS -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>