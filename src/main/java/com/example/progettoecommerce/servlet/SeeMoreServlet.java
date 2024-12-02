package com.example.progettoecommerce.servlet;

import com.example.progettoecommerce.model.Product;
import dao.jpa.JpaDaoFactory;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(value="/more")
public class SeeMoreServlet extends HttpServlet {
    @Override
protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id=Integer.parseInt(req.getParameter("id"));
        Product p= JpaDaoFactory.getDaoFactory().getProdottoDao().find(id);
        req.getSession().setAttribute("product", p);
        req.getRequestDispatcher("SeeMore.jsp").forward(req, resp);
    }
}
