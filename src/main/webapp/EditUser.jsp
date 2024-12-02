<%@ page import="com.example.progettoecommerce.model.User" %>
<%@ page import="com.example.progettoecommerce.model.Ruolo" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit User</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEJX3X2e2fBB6YxDliXioIWiULocJmWFTgmoCe1Rjsl67qXtSKs9EG9y1vowh" crossorigin="anonymous">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.8.1/font/bootstrap-icons.min.css">
    <style>
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

            /* Distanza tra gli item della navbar */
            .nav-item {
                margin: 0 10px; /* Spaziatura tra i bottoni */
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
                    <a href="DashboardUser" class="btn btn-primary">Dashboard</a>
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
    <% User u = (User) request.getSession().getAttribute("utente"); %>
    <form action="EditUser?id=<%= u.getId() %>" method="POST">
        <div class="card">
            <div class="card-body">
                <div class="form-group">
                    <label for="nome">First Name</label>
                    <input type="text" id="nome" name="nome" class="form-control" placeholder="Name" value="<%= u.getNome() %>">
                </div>
                <div class="form-group">
                    <label for="cognome">Last Name</label>
                    <input type="text" id="cognome" name="cognome" class="form-control" placeholder="Last Name" value="<%= u.getCognome() %>">
                </div>
                <div class="form-group">
                    <label for="email">Email</label>
                    <input type="email" id="email" name="email" class="form-control" placeholder="Email" value="<%= u.getEmail() %>">
                </div>
                <div class="form-group">
                    <label for="username">Username</label>
                    <input type="text" id="username" name="username" class="form-control" placeholder="Username" value="<%= u.getUsername() %>">
                </div>
                <div class="form-group">
                    <label for="password">Password</label>
                    <input type="text" id="password" name="password" class="form-control" placeholder="Password" value="<%= u.getPassword() %>">
                </div>
                <div class="form-group">
                    <label for="indirizzo">Address</label>
                    <input type="text" id="indirizzo" name="indirizzo" class="form-control" placeholder="Address" value="<%= u.getIndirizzo() %>">
                </div>
                <div class="form-group">
                    <label for="isAdmin">Admin</label>
                    <input type="checkbox" id="isAdmin" name="isAdmin" class="form-control"
                           value="true" <%= u.getisAdmin() ? "checked" : "" %> >
                </div>

                <div class="form-group">
                    <label for="dataNascita">Birthday</label>
                    <input type="date" id="dataNascita" name="dataNascita" class="form-control" placeholder="Birthday" value="<%= u.getDataNascita() %>">
                </div>

                <div class="form-group">
                    <label for="ruolo">Role</label>
                    <select id="ruolo" name="ruolo" class="form-control">
                        <option value="ADMIN" <%= u.getRuolo() == Ruolo.ADMIN ? "selected" : "" %>>Admin</option>
                        <option value="EMPLOYEE" <%= u.getRuolo() == Ruolo.EMPLOYEE ? "selected" : "" %>>Employee</option>
                        <option value="USER" <%= u.getRuolo() == Ruolo.USER ? "selected" : "" %>>User</option>
                    </select>
                </div>

                <div class="btn-container d-flex justify-content-start">
                    <a href="DashboardUser" class="btn btn-secondary mr-2">Cancel</a>
                    <button type="submit" class="btn btn-primary">Save Changes</button>
                </div>
            </div>
        </div>
    </form>
</div>

</body>
</html>
