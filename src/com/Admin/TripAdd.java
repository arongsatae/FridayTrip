package com.Admin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class TripAdd extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
 	HttpSession session=req.getSession();
      
		
		RequestDispatcher dispatcher=req.getRequestDispatcher("/Trip/TripAdd.jsp");
		
		dispatcher.forward(req, resp);
	}
  
}
