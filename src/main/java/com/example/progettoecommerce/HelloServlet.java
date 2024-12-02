package com.example.progettoecommerce;

import java.io.*;
import java.util.List;

import com.example.progettoecommerce.model.Product;
import dao.jpa.JpaDaoFactory;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(urlPatterns ={"/home", "/"})
public class HelloServlet extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        List<Product> prodotti = JpaDaoFactory.getDaoFactory().getProdottoDao().findAll();
        request.setAttribute("prodotti", prodotti);
        request.getRequestDispatcher("Home.jsp").forward(request, response);
    }

}