package com.board;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Edit extends HttpServlet {
   @Override
protected void doGet(HttpServletRequest req, HttpServletResponse resp)
		throws ServletException, IOException {
	   
	   String seq=req.getParameter("seq");
	   
		BoardDAO dao=new BoardDAO();
		BoardDTO dto=dao.view(seq);
		
		req.setAttribute("dto",dto);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/Trip/Edit.jsp");
		dispatcher.forward(req, resp);
  }
}
