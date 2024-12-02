<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<html>--%>
<%--<head>--%>
<%--  <title>Title</title>--%>
<%--</head>--%>
<%--<body>--%>
<%--<form action="signup" method="POST">--%>
<%--  <input type="text" placeholder="username" id="username" name="username">--%>
<%--  <input type="text" placeholder="password" id="password" name="password">--%>
<%--  <input type="text" placeholder="nome" id="nome" name="nome">--%>
<%--  <input type="text" placeholder="cognome" id="co" name="co">--%>
<%--  <input type="email" placeholder="email" id="email" name="email">--%>
<%--  <input type="text" placeholder="indirizzo" id="indirizzo" name="indirizzo">--%>
<%--  <input type="date" placeholder="data di nascita" id="dataNascita" name="dataNascita">--%>

<%--  <input type="submit" value="Submit">--%>
<%--</form>--%>
<%--</body>--%>
<%--</html>--%>


<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Sign Up</title>
  <!-- Bootstrap CSS -->
  <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
  <style>
    body {
      background-color: #f8f9fa;
    }
    .signup-form {
      max-width: 400px;
      margin: 50px auto;
      padding: 40px;
      background-color: white;
      border-radius: 10px;
      box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
    }
    .signup-form input {
      border-radius: 25px;
      margin-bottom: 20px;
      padding: 12px 20px;
    }
    .signup-form button {
      border-radius: 25px;
      padding: 12px 20px;
      width: 100%;
    }
    .signup-form h2 {
      text-align: center;
      color: #333;
    }
    .signup-form label {
      font-weight: bold;
    }
  </style>
</head>
<body>
<div class="container">
  <div class="signup-form">
    <h2>Sign Up</h2>
    <form action="signup" method="POST">
      <div class="form-group">
        <label for="username">Username</label>
        <input type="text" class="form-control" id="username" name="username" placeholder="Enter your username" required>
      </div>
      <div class="form-group">
        <label for="password">Password</label>
        <input type="password" class="form-control" id="password" name="password" placeholder="Enter your password" required>
      </div>
      <div class="form-group">
        <label for="nome">First Name</label>
        <input type="text" class="form-control" id="nome" name="nome" placeholder="Enter your first name" required>
      </div>
      <div class="form-group">
        <label for="co">Last Name</label>
        <input type="text" class="form-control" id="co" name="co" placeholder="Enter your last name" required>
      </div>
      <div class="form-group">
        <label for="email">Email</label>
        <input type="email" class="form-control" id="email" name="email" placeholder="Enter your email" required>
      </div>
      <div class="form-group">
        <label for="indirizzo">Address</label>
        <input type="text" class="form-control" id="indirizzo" name="indirizzo" placeholder="Enter your address" required>
      </div>
      <div class="form-group">
        <label for="dataNascita">Date of Birth</label>
        <input type="date" class="form-control" id="dataNascita" name="dataNascita" required>
      </div>
      <button type="submit" class="btn btn-primary">Sign Up</button>
    </form>
  </div>
</div>

<!-- Optional Bootstrap JS and dependencies -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.4.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>