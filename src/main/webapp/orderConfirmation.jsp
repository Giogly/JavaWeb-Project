<%@ page import="com.example.progettoecommerce.model.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Order Confirmation</title>
</head>
<body>
<h1>Order Confirmation</h1>
<p>Thank you for your order, <%= ((User) session.getAttribute("user")).getNome() %>!</p>
<p>Your order has been successfully placed.</p>
<a href="home">Return to Home Page</a>
</body>
</html>