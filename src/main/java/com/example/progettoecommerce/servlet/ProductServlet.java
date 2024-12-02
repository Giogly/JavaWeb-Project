package com.example.progettoecommerce.servlet;
import com.example.progettoecommerce.model.Product;
import dao.jpa.JpaDaoFactory;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.math.BigInteger;

import java.io.IOException;

@WebServlet("/prodotto")
public class ProductServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String nome = req.getParameter("nome");
        String marca = req.getParameter("marca");
        String prezzoStr = req.getParameter("prezzo");
        String immagine = req.getParameter("immagine");
        String pesoStr = req.getParameter("peso");
        String ingredienti = req.getParameter("ingredienti");
        BigInteger quantita = new BigInteger(req.getParameter("quantita"));


        double prezzo = 0.0;
        double peso = 0.0;

        try {
            if (prezzoStr != null && !prezzoStr.trim().isEmpty()) {
                prezzo = Double.parseDouble(prezzoStr);
            } else {
                resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Price cannot be empty");
                return;
            }

            if (pesoStr != null && !pesoStr.trim().isEmpty()) {
                peso = Double.parseDouble(pesoStr);
            } else {
                resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Weight cannot be empty");
                return;
            }
        } catch (NumberFormatException e) {
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid number format");
            return;
        }

        JpaDaoFactory.getDaoFactory().getProdottoDao().save(new Product(nome, marca, prezzo, immagine, peso, ingredienti, quantita));

        resp.sendRedirect("Home");
    }
}