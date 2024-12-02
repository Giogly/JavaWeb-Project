//package com.example.progettoecommerce.servlet;
//
//import com.example.progettoecommerce.model.Purchase;
//import com.example.progettoecommerce.model.User;
//import dao.DaoFactory;
//import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//
//import java.io.IOException;
//import java.util.List;
//
//@WebServlet("/DashboardPurchase")
//public class DashboardPurchaseServlet extends HttpServlet {
//    @Override
//    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        User user = (User) req.getSession().getAttribute("user");
//        if (user == null) {
//            resp.sendRedirect("login");
//            return;
//        }
//
//        var daoFactory = DaoFactory.getDaoFactory();
//        var purchaseDao = daoFactory.getPurchaseDao();
//        var productPurchaseDao = daoFactory.getProductPurchaseDao();
//
//        List<Purchase> purchases = purchaseDao.findByUserId(user.getId());
//
//        for (Purchase purchase : purchases) {
//            purchase.setProducts(productPurchaseDao.findByPurchaseId(purchase.getId()));
//        }
//
//        req.setAttribute("purchases", purchases);
//        req.getRequestDispatcher("DashboardPurchase.jsp").forward(req, resp);
//    }
//}