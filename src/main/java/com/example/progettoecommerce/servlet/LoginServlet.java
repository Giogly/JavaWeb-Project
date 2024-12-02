package com.example.progettoecommerce.servlet;

import com.example.progettoecommerce.model.Product;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.example.progettoecommerce.model.User;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import dao.DaoFactory;


@WebServlet(value = "/Login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("Login.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//recupero i dati inseriti nel form
		String username = request.getParameter("username"); //"username" = valore che ho messo nel name dell'input nel form di login
		String password = request.getParameter("password");

		User u = DaoFactory.getDaoFactory().getUtenteDao().login(username, password);
		
		if(u != null) {
			request.getSession().setAttribute("user", u);
			List<Product> cart = new ArrayList<>();
			request.getSession().setAttribute("cart", cart);
			List<Product> wish = new ArrayList<>();
			request.getSession().setAttribute("wish", wish);
			response.sendRedirect("Home");
		}
		else {
			request.setAttribute("msg", "Login incorretto");
			request.getRequestDispatcher("Login.jsp").forward(request, response);
		}
		
		
	}

}