// CartServlet.java
package com.example.progettoecommerce.servlet;

import com.example.progettoecommerce.model.Cart;
import com.example.progettoecommerce.model.Product;
import com.example.progettoecommerce.model.User;
import dao.DaoFactory;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet(value="/cart")
public class CartServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = (User) req.getSession().getAttribute("user");
        if (user == null) {
            resp.sendRedirect("login");
            return;
        }

        Cart cart = DaoFactory.getDaoFactory().getCartDao().findByUserId(user.getId());
        if (cart != null) {
            List<Product> products = cart.getProducts();
            req.setAttribute("products", products);
        }

        req.getRequestDispatcher("/Cart.jsp").forward(req, resp);
    }
}