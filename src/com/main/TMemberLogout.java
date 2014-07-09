package com.main;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class TMemberLogout extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
	
		HttpSession session = req.getSession();
		
	
		session.invalidate();
		
		
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/Trip/Index.jsp");
		dispatcher.forward(req, resp);
	}	
}