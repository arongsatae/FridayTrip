package com.trip;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LocalTrip extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		TripDAO dao = new TripDAO();
		int num = 1;
		ArrayList<TripDTO> list = dao.LocalTriplist(num);
		
		req.setAttribute("list", list);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/Trip/LocalTrip.jsp");
		dispatcher.forward(req, resp);
	}
}
