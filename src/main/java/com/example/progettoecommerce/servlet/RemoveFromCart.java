// RemoveFromCartServlet.java
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

@WebServlet(value="/removeFromCart")
public class RemoveFromCart extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = (User) req.getSession().getAttribute("user");
        if (user == null) {
            resp.sendRedirect("login");
            return;
        }

        int productId = Integer.parseInt(req.getParameter("id"));
        Cart cart = DaoFactory.getDaoFactory().getCartDao().findByUserId(user.getId());
        if (cart != null) {
            cart.getProducts().removeIf(product -> product.getId() == productId);
            DaoFactory.getDaoFactory().getCartDao().saveOrUpdate(cart);
        }

        resp.sendRedirect("cart");
    }
}