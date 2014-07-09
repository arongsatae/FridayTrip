package com.Free;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class FreeDelOk extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String seq = req.getParameter("seq");
		String pw = req.getParameter("pw");
		
	
		FreeListDAO dao = new FreeListDAO();
		
		String sum = "";
		
		if (dao.check(seq, pw)) {
						
			FreeCommentDAO cdao = new FreeCommentDAO();
			cdao.delAll(seq);
			
			dao.del(seq);
			sum = "1";
		} else {
			sum = "0";
		}
		
		req.setAttribute("sum", sum);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/Trip/FreeDelOk.jsp");
		dispatcher.forward(req, resp);
		
	}
}
