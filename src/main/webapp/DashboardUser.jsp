<%@ page import="com.example.progettoecommerce.model.User" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.progettoecommerce.model.Ruolo" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Dashboard</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEJX3X2e2fBB6YxDliXioIWiULocJmWFTgmoCe1Rjsl67qXtSKs9EG9y1vowh" crossorigin="anonymous">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.8.1/font/bootstrap-icons.min.css">
    <style>
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

    /* Allinea i bottoni Edit e Delete uno accanto all'altro */
    .admin-btns {
        display: flex;          /* Usa Flexbox per disporre i bottoni orizzontalmente */
        gap: 10px;              /* Spazio tra i bottoni */
        justify-content: flex-start; /* Allinea i bottoni all'inizio */
    }

    /* Stile per i bottoni Edit e Delete */
    .admin-btns .btn {
        min-width: 100px;        /* Ridotto per adattarsi meglio alla card */
        height: 35px;            /* Ridimensionato per stare dentro la card */
        font-size: 14px;         /* Ridotto per una migliore visualizzazione */
        padding: 8px 16px;       /* Padding ridotto per adattarsi */
    }

    /* Modifica per le card per avere tutte la stessa altezza */
    .card {
        display: flex;
        flex-direction: column;
        justify-content: space-between;
    }

    /* Assicurarsi che il contenuto dentro la card non esca */
    .card-body {
        flex-grow: 1; /* Permette al contenuto di espandersi per riempire lo spazio disponibile */
    }

    /* Stile per il ruolo sotto il cognome */
    .card-text {
        font-size: 14px;
        color: #555;
    }

    /* Margine tra il titolo "User List" e le card */
    h2 {
        margin-bottom: 2px;
    }

    .row {
        margin-top: 0; /* Elimina o riduce eventuali spazi di margine tra la riga e le card */
    }

    /* Stile per il ruolo (aggiunto sotto il cognome dell'utente) */
    .card-text .role {
        font-weight: bold;
        margin-top: 10px;
        color: #007bff;  /* Colore personalizzato per il ruolo */
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
                <!-- Bottone Dashboard User -->
                <li class="nav-item mr-3">
                    <a href="DashboardUser" class="btn btn-primary">Dashboard User</a>
                </li>
                <!-- Bottone Dashboard Ordini -->
                <li class="nav-item mr-3">
                    <a href="DashboardOrdini" class="btn btn-primary">Dashboard Ordini</a>
                </li>
                <% } %>
                <!-- Bottone Wishlist -->
                <li class="nav-item mr-3">
                    <a class="nav-link btn btn-pink text-white px-4" href="wishList">
                        <i class="bi bi-heart"></i>
                    </a>
                </li>
                <!-- Bottone Carrello -->
                <li class="nav-item">
                    <a class="nav-link btn btn-info text-white px-4" href="cart">
                        <i class="bi bi-cart"></i>
                    </a>
                </li>
                <!-- Bottone Logout -->
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
    <div class="card">
        <h2>User List</h2>
        <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 row-cols-lg-4">
            <%
                List<User> users = (List<User>) request.getAttribute("utenti");
                if (users != null) {
                    for (User userr : users) {
            %>
            <div class="col mb-4">
                <div class="card shadow-sm">
                    <div class="card-body">
                        <h5 class="card-title"><%= userr.getNome() %>  <%= userr.getCognome() %></h5>
                        <p class="card-text">
                            First Name: <%= userr.getNome() %><br>
                            Last Name: <%= userr.getCognome() %><br>
                            <span class="role">Role: <%= userr.getRuolo() %></span><br>
                            Username: <%= userr.getUsername() %><br>
                            Email: <%= userr.getEmail() %><br>
                            Address: <%= userr.getIndirizzo() %><br>
                            Birthday: <%= userr.getDataNascita() %><br>
                        </p>
                        <!-- Admin Buttons -->
                        <% if (user != null && user.getRuolo()==Ruolo.ADMIN){ %>
                        <div class="admin-btns">
                            <a href="EditUser?id=<%= userr.getId() %>" class="btn btn-success">Edit</a>
                            <% if (userr.getRuolo()!=Ruolo.ADMIN) { %>
                            <a href="deleteUser?id=<%= userr.getId() %>" class="btn btn-danger">Delete</a>
                            <% } %>
                        </div>
                        <% } %>
                    </div>
                </div>
            </div>
            <%
                }
            } else {
            %>
            <p class="text-center">No user available</p>
            <%
                }
            %>
        </div>
    </div>
</div>

<!-- Bootstrap JS and Popper.js (required for Bootstrap) -->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js" integrity="sha384-eMN8ozpKb06hKH9ZGzKj4dK9UqsNl0vSrxhfK5yZ72S4zKgZs29nqdzc7cOBmLlS" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js" integrity="sha384-GLhlTQ8iRABQx3xD7L+J7zpcirFcFpaBRC5r3lZtWvR6Ik0d8fM3kRStHgNSpt1R" crossorigin="anonymous"></script>
</body>
</html>