package com.End;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class EndEdit extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		String seq = req.getParameter("seq");
		
		String page = req.getParameter("page");
		req.setAttribute("page", page);
		
		EndListDAO dao = new EndListDAO();
		EndListDTO dto = dao.view(seq);
		
		req.setAttribute("dto", dto);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/Trip/EndEdit.jsp");
		dispatcher.forward(req, resp);
	}
}
