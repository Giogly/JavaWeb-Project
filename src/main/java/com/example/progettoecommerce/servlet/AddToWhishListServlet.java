package com.example.progettoecommerce.servlet;

import com.example.progettoecommerce.model.Product;
import dao.jpa.JpaDaoFactory;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet(value = "/addToWishList")
public class AddToWhishListServlet extends HttpServlet {
   @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Product> wish = (List<Product>) req.getSession().getAttribute("wish");
       int id=Integer.parseInt(req.getParameter("id"));
        Product p= JpaDaoFactory.getDaoFactory().getProdottoDao().find(id);
        wish.add(p);
        req.getSession().setAttribute("wish", wish);
        System.out.println(wish);
        resp.sendRedirect("home");
    }
}
