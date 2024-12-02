<%--<%@ page language="java" contentType="text/html; charset=UTF-8"--%>
<%--    pageEncoding="UTF-8"%>--%>
<%--<!DOCTYPE html>--%>
<%--<html>--%>
<%--<head>--%>
<%--<meta charset="UTF-8">--%>
<%--<title>Login</title>--%>
<%--</head>--%>
<%--<body>--%>
<%--	<%String message = (String) request.getAttribute("msg");--%>
<%--	if(message != null) {--%>
<%--	%>--%>
<%--	--%>
<%--	<h1><%=message %></h1>--%>
<%--	--%>
<%--	<%} %>--%>
<%--	--%>
<%--	<h1>SIGN IN</h1>--%>
<%--	<form action="Login" method="POST">--%>
<%--		<input type="text" name="username" placeholder="Username">--%>
<%--		<br>--%>
<%--		<input type="password" name="password" placeholder="Password">--%>
<%--		<br>--%>
<%--		<button type="submit">Login</button>--%>
<%--	</form>--%>
<%--	<h2>No account? </h2>--%>
<%--	<a href="Signup.jsp"> Sign up! </a>--%>
<%--</body>--%>
<%--</html>--%>


<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Login</title>
	<!-- Bootstrap CSS -->
	<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
	<style>
		body {
			background-color: #f7f7f7;
			font-family: Arial, sans-serif;
		}
		.login-container {
			width: 100%;
			max-width: 400px;
			padding: 40px;
			margin: 50px auto;
			background-color: white;
			border-radius: 10px;
			box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
		}
		.login-header {
			text-align: center;
			margin-bottom: 30px;
		}
		.login-header h1 {
			font-size: 32px;
			font-weight: 600;
			color: #333;
		}
		.login-header h2 {
			font-size: 18px;
			color: #666;
			margin-top: 10px;
		}
		.form-control {
			border-radius: 25px;
			border: 1px solid #ccc;
			padding: 15px;
		}
		.btn-primary {
			background-color: #007bff;
			border-radius: 25px;
			padding: 12px 20px;
			width: 100%;
		}
		.btn-secondary {
			background-color: transparent;
			border: 1px solid #007bff;
			color: #007bff;
			border-radius: 25px;
			padding: 12px 20px;
			width: 100%;
		}
		.text-center {
			margin-top: 20px;
		}
		.alert {
			margin-bottom: 20px;
		}
	</style>
</head>
<body>

<div class="container">
	<div class="login-container">
		<% String message = (String) request.getAttribute("msg");
			if (message != null) { %>
		<div class="alert alert-danger text-center">
			<%= message %>
		</div>
		<% } %>

		<!-- Login Form Header -->
		<div class="login-header">
			<h1>Sign In</h1>
			<h2>Enter your details to login</h2>
		</div>

		<!-- Login Form -->
		<form action="Login" method="POST">
			<div class="form-group">
				<input type="text" name="username" class="form-control" placeholder="Username" required>
			</div>
			<div class="form-group">
				<input type="password" name="password" class="form-control" placeholder="Password" required>
			</div>
			<button type="submit" class="btn btn-primary">Login</button>
		</form>

		<!-- Sign-up Prompt -->
		<div class="text-center mt-3">
			<h5>Don't have an account?</h5>
			<a href="Signup.jsp" class="btn btn-secondary">Sign Up!</a>
		</div>
	</div>
</div>

<!-- Optional Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.4.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>


