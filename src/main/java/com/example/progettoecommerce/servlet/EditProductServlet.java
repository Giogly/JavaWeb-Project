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

@WebServlet(value="/EditProduct")
public class EditProductServlet extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id=Integer.parseInt(req.getParameter("id"));
        Product p=JpaDaoFactory.getDaoFactory().getProdottoDao().find(id);
        req.getSession().setAttribute("product", p);
        req.getRequestDispatcher("EditProduct.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String nome= req.getParameter("nome");
        String marca= req.getParameter("marca");
        double prezzo= Double.parseDouble(req.getParameter("prezzo"));
        String immagine= req.getParameter("immagine");
        double peso= Double.parseDouble(req.getParameter("peso"));
        String ingredienti= req.getParameter("ingredienti");
        BigInteger quantita= new BigInteger(req.getParameter("quantita"));
        Product p= new Product();
        p.setNome(nome);
        p.setMarca(marca);
        p.setPrezzo(prezzo);
        p.setImmagine(immagine);
        p.setPeso(peso);
        p.setIngredienti(ingredienti);
        p.setQuantita(quantita);
        p.setId(Long.parseLong(req.getParameter("id")));
        JpaDaoFactory.getDaoFactory().getProdottoDao().edit(p);

        resp.sendRedirect("Home");
    }
}

