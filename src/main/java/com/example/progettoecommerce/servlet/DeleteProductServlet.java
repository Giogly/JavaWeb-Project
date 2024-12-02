package com.example.progettoecommerce.servlet;

import dao.DaoFactory;
import dao.jpa.JpaDaoFactory;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/DeleteProduct")
public class DeleteProductServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        var entityManager = JpaDaoFactory.getManager();
        var transaction = entityManager.getTransaction();

        try {
            transaction.begin();
            var prodottoDao = DaoFactory.getDaoFactory().getProdottoDao();
            prodottoDao.delete(id);
            transaction.commit();
        } catch (Exception e) {
            if (transaction.isActive()) {
                transaction.rollback();
            }
            throw new ServletException(e);
        } finally {
            entityManager.close();
        }

        resp.sendRedirect("Home");
    }
}