package com.example.progettoecommerce.servlet;

import com.example.progettoecommerce.model.Ruolo;
import com.example.progettoecommerce.model.User;
import dao.jpa.JpaDaoFactory;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.time.LocalDate;

@WebServlet(value="/EditUser")
public class EditUserServlet extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id=Integer.parseInt(req.getParameter("id"));
        User u= JpaDaoFactory.getDaoFactory().getUtenteDao().find(id);
        req.getSession().setAttribute("utente", u);
        req.getRequestDispatcher("EditUser.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String nome= req.getParameter("nome");
        String cognome= req.getParameter("cognome");
        String username= req.getParameter("username");
        String email= req.getParameter("email");
        String password= req.getParameter("password");
        String indirizzo= req.getParameter("indirizzo");
        LocalDate dataNascita= LocalDate.parse(req.getParameter("dataNascita"));
        boolean isAdmin= Boolean.parseBoolean(req.getParameter("isAdmin"));
        Ruolo ruolo= Ruolo.valueOf(req.getParameter("ruolo"));
        User u= new User();
        u.setNome(nome);
        u.setCognome(cognome);
        u.setUsername(username);
        u.setEmail(email);
        u.setPassword(password);
        u.setIndirizzo(indirizzo);
        u.setDataNascita(dataNascita);
        u.setAdmin(isAdmin);
        u.setRuolo(ruolo);
        u.setId(Long.parseLong(req.getParameter("id")));
        JpaDaoFactory.getDaoFactory().getUtenteDao().edit(u);
        resp.sendRedirect("DashboardUser");
    }
}

