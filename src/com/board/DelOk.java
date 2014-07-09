package com.board;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DelOk extends HttpServlet{
  @Override
protected void doPost(HttpServletRequest req, HttpServletResponse resp)
		throws ServletException, IOException {
    
		String seq = req.getParameter("seq");
		String pw = req.getParameter("pw");
		
		String sum="";
		
		//2.
		BoardDAO dao = new BoardDAO();

		
		if (dao.check(seq, pw)) {
						
			CommentDAO cdao = new CommentDAO();
			cdao.delAll(seq);
			
			dao.del(seq);
			sum = "1";
		} else {
			sum = "0";
		}
		
		req.setAttribute("sum", sum);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/Trip/DelOk.jsp");
		dispatcher.forward(req, resp);
		
}
}
