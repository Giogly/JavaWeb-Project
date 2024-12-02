// AddToCartServlet.java
package com.example.progettoecommerce.servlet;

import com.example.progettoecommerce.model.Product;
import com.example.progettoecommerce.model.Cart;
import com.example.progettoecommerce.model.User;
import dao.DaoFactory;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(value="/addtoCart")
public class AddToCartServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = (User) req.getSession().getAttribute("user");
        if (user == null) {
            resp.sendRedirect("login");
            return;
        }

        Cart cart = DaoFactory.getDaoFactory().getCartDao().findByUserId(user.getId());
        if (cart == null) {
            cart = new Cart();
            cart.setUser(user); // Ensure the user is set
            cart.setProducts(new ArrayList<>());
        } else if (cart.getProducts() == null) {
            cart.setProducts(new ArrayList<>());
        }

        int productId = Integer.parseInt(req.getParameter("id"));
        Product product = DaoFactory.getDaoFactory().getProdottoDao().find(productId);

        cart.getProducts().add(product);
        DaoFactory.getDaoFactory().getCartDao().saveOrUpdate(cart);

        resp.sendRedirect("cart");
    }
}