<%@ page import="com.example.progettoecommerce.model.Product" %>
<%@ page import="com.example.progettoecommerce.model.User" %>
<%@ page import="com.example.progettoecommerce.model.Ruolo" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Edit Product</title>
  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEJX3X2e2fBB6YxDliXioIWiULocJmWFTgmoCe1Rjsl67qXtSKs9EG9y1vowh" crossorigin="anonymous">
  <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
  <!-- Bootstrap Icons -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.8.1/font/bootstrap-icons.min.css">
  <style>
    .btn {
      border-radius: 20px;
      height: 45px;
      font-size: 16px;
      display: flex;
      justify-content: center;
      align-items: center;
      padding: 10px 20px;
    }
    .navbar-nav .btn-pink,
    .navbar-nav .btn-info {
      min-width: 100px;
    }
    .navbar-nav .btn-primary {
      min-width: 180px;
    }
    .navbar-nav .btn-danger {
      min-width: 150px;
    }
    .btn-container {
      display: flex;
      justify-content: flex-end;
      gap: 10px;
    }
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
    .navbar-light {
      background-color: #f8f9fa;
    }
    @media (max-width: 991px) {
      .navbar-nav {
        text-align: center;
      }
      .navbar-nav .nav-item {
        margin: 10px 0;
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
  <% Product p = (Product) request.getSession().getAttribute("product"); %>
  <form action="EditProduct?id=<%= p.getId() %>" method="POST">
    <div class="card">
      <div class="card-body">
        <div class="form-group">
          <label for="nome">Product Name</label>
          <input type="text" id="nome" name="nome" class="form-control" placeholder="Name" value="<%= p.getNome() %>">
        </div>

        <div class="form-group">
          <label for="marca">Brand</label>
          <input type="text" id="marca" name="marca" class="form-control" placeholder="Brand" value="<%= p.getMarca() %>">
        </div>

        <div class="form-group">
          <label for="prezzo">Price (&euro;)</label>
          <input type="number" id="prezzo" name="prezzo" class="form-control" placeholder="Price" value="<%= p.getPrezzo() %>" step="0.01">
        </div>

        <div class="form-group">
          <label for="immagine">Image URL</label>
          <input type="text" id="immagine" name="immagine" class="form-control" placeholder="Image URL" value="<%= p.getImmagine() %>">
        </div>

        <div class="form-group">
          <label for="peso">Weight (kg)</label>
          <input type="number" id="peso" name="peso" class="form-control" placeholder="Weight" value="<%= p.getPeso() %>" step="0.01">
        </div>

        <div class="form-group">
          <label for="ingredienti">Ingredients</label>
          <textarea id="ingredienti" name="ingredienti" class="form-control" placeholder="Ingredients"><%= p.getIngredienti() %></textarea>
        </div>

        <div class="form-group">
          <label for="quantita">Quantity</label>
          <input type="number" id="quantita" name="quantita" class="form-control" placeholder="Quantity" value="<%= p.getQuantita().toString() %>" min="0">
        </div>

        <div class="btn-container">
          <a href="ProductList" class="btn btn-secondary">Cancel</a>
          <button type="submit" class="btn btn-primary">Save Changes</button>
        </div>
      </div>
    </div>
  </form>
</div>

<!-- Bootstrap JS and Popper.js (required for Bootstrap) -->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js" integrity="sha384-eMN8ozpKb06hKH9ZGzKj4dK9UqsNl0vSrxhfK5yZ72S4zKgZs29nqdzc7cOBmLlS" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js" integrity="sha384-GLhlTQ8iRABQx3xD7L+J7zpcirFcFpaBRC5r3lZtWvR6Ik0d8fM3kRStHgNSpt1R" crossorigin="anonymous"></script>
</body>
</html>