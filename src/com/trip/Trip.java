package com.trip;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Trip extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		TripDAO dao = new TripDAO();
		int num = 0;
		ArrayList<TripDTO> list = dao.Bestlist();		
		ArrayList<TripDTO> list2 = dao.Fishlist(num);
		ArrayList<TripDTO> list3 = dao.Foodlist(num);
		ArrayList<TripDTO> list4 = dao.LocalTriplist(num);	
		ArrayList<TripDTO> list5 = dao.Mtlist(num);
		ArrayList<TripDTO> list6 = dao.Bikelist(num);
		
		
		req.setAttribute("list", list);
		req.setAttribute("list2", list2);
		req.setAttribute("list3", list3);
		req.setAttribute("list4", list4);
		req.setAttribute("list5", list5);
		req.setAttribute("list6", list6);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/Trip/Trip.jsp");
		dispatcher.forward(req, resp);
	}
}
