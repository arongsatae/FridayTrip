package com.Admin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



public class PlaceAdd extends HttpServlet {
     @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
    		throws ServletException, IOException {

 		RequestDispatcher dispatcher = req
 				.getRequestDispatcher("/Trip/PlaceAdd.jsp");
 		dispatcher.forward(req, resp);
    			
    }
}
