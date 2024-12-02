//package dao.filter;
//
//import com.example.progettoecommerce.model.Utente;
//import jakarta.servlet.*;
//import jakarta.servlet.annotation.WebFilter;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//
//import java.io.IOException;
//@WebFilter(filterName = "HomeFilter", urlPatterns = {"/Home"})
//public class HomeFilter implements Filter {
//
//    @Override
//    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
//            HttpServletRequest req = (HttpServletRequest) request;
//            Utente utente = (Utente) req.getSession().getAttribute("utente");
//
//            if(utente != null){
//                chain.doFilter(request, response); // rappresenta l'elenco di chiamate eseguite per arrivare alla servlet Home e fa andare avanti ilprocedimento
//        } else{
//            req.getRequestDispatcher("/").forward(request, response);
//        }
//    }
//}