package com.End;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class EndCheckOk extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
	
	String seq = req.getParameter("seq");
	String pw = req.getParameter("pw");
	
	String page = req.getParameter("page");
	req.setAttribute("page", page);
	
	System.out.println(page);
	
	EndListDAO dao = new EndListDAO();
	
	String sum = "";
	
	if (dao.check(seq, pw)) {
		sum = "1";
	} else {
		sum = "0";
	}
			
	req.setAttribute("seq", seq);
	req.setAttribute("sum", sum);
	RequestDispatcher dispatcher = req.getRequestDispatcher("/Trip/EndCheckOk.jsp");
	dispatcher.forward(req, resp);
}
	
}
