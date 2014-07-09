package com.trip;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Detail extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String seq = req.getParameter("seq");
		String table = req.getParameter("table");
		String app = req.getParameter("app");
		
		TripDAO dao = new TripDAO();
		TripDTO dto = dao.view(seq, table);
		
		//남자참여인원 가져오기
		TripDTO dto2 = dao.man(seq, table, app);
		
		//여자참여인원 가져오기
		TripDTO dto3 = dao.woman(seq, table, app);
		
		req.setAttribute("dto", dto);
		req.setAttribute("dto2", dto2);
		req.setAttribute("dto3", dto3);
		req.setAttribute("table", table);
		req.setAttribute("app", app);
		RequestDispatcher dispatcher = req.getRequestDispatcher("/Trip/Detail.jsp");
		dispatcher.forward(req, resp);
	
	}
	
}
