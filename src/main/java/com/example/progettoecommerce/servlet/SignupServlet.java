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

@WebServlet(value = "/signup", name = "signup")
public class SignupServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username=req.getParameter("username");
        String password=req.getParameter("password");
        String nome=req.getParameter("nome");
        String cognome=req.getParameter("co");
        String email=req.getParameter("email");
        LocalDate dataNascita= LocalDate.parse(req.getParameter("dataNascita"));
        String indirizzo=req.getParameter("indirizzo");

        User utente=new User(nome,cognome,username,password,email,dataNascita,indirizzo,Ruolo.USER);
        JpaDaoFactory.getDaoFactory().getUtenteDao().registra(nome,cognome,username,password,email,dataNascita,indirizzo);
        req.getRequestDispatcher("Login.jsp").forward(req, resp);
    }
}