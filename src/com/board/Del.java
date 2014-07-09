package com.board;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Del extends HttpServlet{
   @Override
protected void doGet(HttpServletRequest req, HttpServletResponse resp)
		throws ServletException, IOException {
	String seq = req.getParameter("seq");
		
		//3.
		req.setAttribute("seq", seq);//삭제할 게시물
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/Trip/Del.jsp");
		dispatcher.forward(req, resp);
		
   }
}
