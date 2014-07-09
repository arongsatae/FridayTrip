package com.Free;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class FreeCheckOk extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		String seq = req.getParameter("seq");
		String pw = req.getParameter("pw");
		
		FreeListDAO dao = new FreeListDAO();
		
		String sum = "";
		
		if (dao.check(seq, pw)) {
			sum = "1";
		} else {
			sum = "0";
		}

		String page = req.getParameter("page");
		
		req.setAttribute("page", page);
		req.setAttribute("seq", seq);
		req.setAttribute("sum", sum);
		RequestDispatcher dispatcher = req.getRequestDispatcher("/Trip/FreeCheckOk.jsp");
		dispatcher.forward(req, resp);
	}
}
