package com.Admin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class TripBicycleAdd extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
                     
		RequestDispatcher dispatcher=req.getRequestDispatcher("/Trip/TripBicycleAdd.jsp");
		
		dispatcher.forward(req,resp);
	}
}