package com.example.progettoecommerce.servlet;

import com.example.progettoecommerce.model.Cart;
import com.example.progettoecommerce.model.Purchase;
import com.example.progettoecommerce.model.User;
import dao.DaoFactory;
import dao.jpa.JpaDaoFactory;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.time.LocalDate;
import java.util.ArrayList;

@WebServlet(value="/placeOrder")
public class PlaceOrderServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = (User) req.getSession().getAttribute("user");
        if (user == null) {
            resp.sendRedirect("login");
            return;
        }
        req.getRequestDispatcher("Cart.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = (User) req.getSession().getAttribute("user");
        if (user == null) {
            resp.sendRedirect("login");
            return;
        }

        var daoFactory = DaoFactory.getDaoFactory();
        var cartDao = daoFactory.getCartDao();
        var purchaseDao = daoFactory.getPurchaseDao();
        var entityManager = JpaDaoFactory.getManager();

        try {
            Cart cart = cartDao.findByUserId(user.getId());
            if (cart != null && !cart.getProducts().isEmpty()) {
                Purchase purchase = new Purchase();
                purchase.setUser(user);
                purchase.setProducts(new ArrayList<>(cart.getProducts())); // Copy products from cart to purchase
                purchase.setDate(LocalDate.now());

                purchaseDao.save(purchase);

                cart.getProducts().clear();
                cartDao.saveOrUpdate(cart);
            }
        } catch (Exception e) {
            throw new ServletException(e);
        } finally {
            entityManager.close();
        }

        resp.sendRedirect("orderConfirmationServlet");
    }
}