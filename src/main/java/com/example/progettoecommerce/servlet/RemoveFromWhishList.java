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

@WebServlet(value="/removeFromWhishList")
public class RemoveFromWhishList extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id=Integer.parseInt(req.getParameter("id"));
        List<Product> wish = (List < Product > ) req.getSession().getAttribute("wish");
        Product p = JpaDaoFactory.getDaoFactory().getProdottoDao().find(id);
        for(int i=0; i<wish.size(); i++){
            if(wish.get(i).getId()==p.getId()){
                wish.remove(i);
                break;
            }
        }
        resp.sendRedirect("WhishList");
    }

}