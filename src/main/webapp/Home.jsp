<%@ page import="com.example.progettoecommerce.model.Product" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.progettoecommerce.model.User" %>
<%@ page import="com.example.progettoecommerce.model.Ruolo" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title></title>
	<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
	<style>
		/* Product List */
		.container {
			padding-left: 10px;  /* Sposta la lista dei prodotti verso sinistra */
			padding-right: 30px; /* Aumenta lo spazio a destra per il form */
		}

		/* Aggiungi distanza tra la card e il margine sinistro */
		.card {
			border-radius: 10px;
			height: 100%;
			display: flex;
			flex-direction: column;
			justify-content: space-between;
			width: 95%;  /* Aumenta la larghezza della card */
			margin-left: 0;  /* Allinea al margine sinistro */
			margin-right: 20px;  /* Distanza tra le card e il bordo destro */
		}

		/* Form Add Product - Aumenta la distanza dal margine destro */
		.card.p-4 {
			margin-right: 50px;  /* Maggiore distanza dal margine destro */
			margin-left: 0;  /* Mantieni il margine sinistro ridotto */
		}

		/* Allinea correttamente il form Add Product */
		.form-row .form-group {
			margin-bottom: 15px;
		}

		/* Modifica del padding del form */
		.form-control {
			padding: 10px;
		}

		/* Product card styling */
		.card-body .btn-group {
			display: flex;
			justify-content: space-between;
			gap: 10px;
			width: 100%;
		}

		/* Responsive tweaks */
		@media (max-width: 768px) {
			.container {
				padding-right: 10px; /* Riduci il padding a destra sui dispositivi più piccoli */
			}
			.card {
				margin: 0 auto; /* Centra la card se la finestra è stretta */
			}
		}

		/* Aumenta la larghezza delle card */
		.card {
			border-radius: 10px;
			height: 100%;
			display: flex;
			flex-direction: column;
			justify-content: space-between;
			width: 95%;  /* Aumenta la larghezza della card */
			margin: 0 auto;  /* Centra la card nella colonna */
		}

		/* Aumenta leggermente la larghezza dell'immagine */
		.card-img-top {
			height: 150px;
			width: auto;
			object-fit: contain;
		}

		/* Contenuto della card */
		.card-body {
			display: flex;
			flex-direction: column;
			justify-content: space-between;
			height: 100%;
		}

		/* Posizionamento orizzontale dei bottoni Add to Cart e Add to Wishlist */
		.card-body .btn-group {
			display: flex;
			justify-content: space-between;
			width: 100%;  /* Occupano tutta la larghezza disponibile */
			gap: 10px;  /* Spazio tra i bottoni */
		}

		/* Modifica dei bottoni "Add to Cart" e "Add to Wishlist" */
		.card-body .btn-primary, .card-body .btn-warning {
			font-size: 14px;  /* Dimensione del testo più piccola */
			min-width: 100px;  /* Larghezza minima dei bottoni */
			height: 35px;  /* Altezza ridotta dei bottoni */
			display: flex;      /* Usa Flexbox per centrare il testo verticalmente */
			justify-content: center; /* Centra il testo orizzontalmente */
			align-items: center; /* Centra il testo verticalmente */
			border-radius: 25px; /* Bordi più arrotondati */
			padding: 0 15px; /* Padding ridotto per i bottoni */
		}

		/* Bottoni See More */
		.card-body .btn-info {
			margin-bottom: 10px;  /* Spazio tra il bottone "See More" e gli altri */
		}

		/* Stile per i bottoni Edit e Delete, sempre all'interno della card */
		.admin-btns {
			display: flex;
			justify-content: space-between;
			margin-top: 15px;
		}

		.admin-btns a {
			min-width: 80px;  /* Più piccoli */
			font-size: 14px;  /* Testo più piccolo */
			padding: 5px 10px; /* Ridotto il padding */
			margin-right: 5px; /* Spazio tra i bottoni */
		}

		.btn-pink {
			background-color: #ff69b4;
			color: white;
		}

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

		/* Bottoni più stretti per Wishlist e Cart */
		.navbar-nav .btn-pink,
		.navbar-nav .btn-info {
			min-width: 90px; /* Più stretti */
		}

		/* Bottoni per Dashboard e Logout con larghezza maggiore */
		.navbar-nav .btn-primary,
		.navbar-nav .btn-danger {
			min-width: 150px;  /* Più larghi */
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
		<a class="navbar-brand d-flex align-items-center" href="#">
			<!-- Aggiungi l'immagine accanto al testo -->
			<img src="https://cdn-icons-png.flaticon.com/512/332/332910.png" style="height: 40px; margin-right: 10px;">
			E-Commerce
		</a>
		<div class="collapse navbar-collapse" id="navbarNav">
			<ul class="navbar-nav ml-auto">
				<li class="nav-item mx-auto">
					<a class="nav-link" href="#">Homepage</a>
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
</body>

<div class="container">
	<!-- Product List -->
	<h2>Product List</h2>
	<div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 row-cols-lg-4">
		<%
			List<Product> prodotti = (List<Product>) request.getAttribute("prodotti");
			if (prodotti != null) {
				for (Product prodotto : prodotti) {
		%>
		<div class="col mb-4">
			<div class="card h-100 shadow-sm">
				<img src="<%= prodotto.getImmagine() %>" class="card-img-top" alt="<%= prodotto.getNome() %>">
				<div class="card-body">
					<h5 class="card-title"><%= prodotto.getNome() %></h5>
					<p class="card-text">
						Brand: <%= prodotto.getMarca() %><br>
						Price: <%= prodotto.getPrezzo() %> €<br>
						Weight: <%= prodotto.getPeso() %> kg<br>
						Quantity: <%= prodotto.getQuantita() %>
					</p>

					<!-- See Details button -->
					<a href="more?id=<%= prodotto.getId() %>" class="btn btn-info btn-block">See Details</a>

					<!-- Gruppo di bottoni Add to Cart e Add to Wishlist -->
					<div class="btn-group" style="display: flex; justify-content: space-between; gap: 10px; width: 100%;">
						<a href="addtoCart?id=<%= prodotto.getId() %>" class="btn btn-primary">Add <i class="bi bi-cart-plus-fill"></i></a>
						<a href="addToWishList?id=<%= prodotto.getId() %>" class="btn btn-warning">Add <i class="bi bi-heart"></i></a>
					</div>

					<!-- Admin Buttons -->
					<% if (user != null && user.getRuolo() == Ruolo.ADMIN) { %>
					<div class="admin-btns">
						<a href="EditProduct?id=<%= prodotto.getId() %>" class="btn btn-success">Edit</a>
						<a href="DeleteProduct?id=<%= prodotto.getId() %>" class="btn btn-danger">Delete</a>
					</div>
					<% } %>
				</div>
			</div>
		</div>
		<%
			}
		} else {
		%>
		<p class="text-center">No products available.</p>
		<%
			}
		%>
	</div>

	<!-- Product Add Form -->
	<% if (user != null && user.getRuolo()==Ruolo.ADMIN) { %>
	<div class="card p-4 mb-4">
		<h2>Complete the form to add a product </h2>
		<form action="prodotto" method="POST">
			<div class="form-row">
				<div class="form-group col-md-6">
					<input type="text" id="nome" name="nome" class="form-control" placeholder="Name">
				</div>
				<div class="form-group col-md-6">
					<input type="text" id="marca" name="marca" class="form-control" placeholder="Brand">
				</div>
			</div>
			<div class="form-row">
				<div class="form-group col-md-4">
					<input type="number" id="prezzo" name="prezzo" step="0.01" min="0" class="form-control" placeholder="Price">
				</div>
				<div class="form-group col-md-4">
					<input type="number" id="peso" name="peso" step="0.01" min="0" class="form-control" placeholder="Weight">
				</div>
				<div class="form-group col-md-4">
					<input type="text" id="immagine" name="immagine" class="form-control" placeholder="Image URL">
				</div>
				<div class="form-group col-md-12">
					<textarea id="ingredienti" name="ingredienti" class="form-control" placeholder="Ingredients"></textarea>
				</div>
				<div class="form-group">
					<input type="number" id="quantita" name="quantita" class="form-control" placeholder="Quantity" min="0" step="0">
				</div>
			</div>
			<button type="submit" class="btn btn-success btn-block">Add Product</button>
		</form>
	</div>
	<% } %>
</div>

</div>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.8.1/font/bootstrap-icons.min.css">
</body>
</html>