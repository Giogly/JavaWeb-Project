package com.example.progettoecommerce.servlet;

import com.example.progettoecommerce.model.User;
import dao.jpa.JpaDaoFactory;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns ={"/DashboardUser"})
public class ElencoUtenti extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        List<User> users = JpaDaoFactory.getDaoFactory().getUtenteDao().getAll();
        request.setAttribute("utenti", users);
        request.getRequestDispatcher("DashboardUser.jsp").forward(request, response);
    }
}
