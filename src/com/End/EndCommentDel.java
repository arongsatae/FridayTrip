package com.End;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class EndCommentDel extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		String pw = req.getParameter("pw2"); // ��ȣ
		String boardseq = req.getParameter("boardseq"); // ��� ��ȣ 
		String seq = req.getParameter("seq"); // �Խ��� ��ȣ

		String page = req.getParameter("page");
		
		req.setAttribute("page", page);
		
		EndCommentDAO dao = new EndCommentDAO();
		
		int check = 0;
		
		if (dao.check(boardseq, pw)) {  // ��� ��ȣ, ��ȣ
			 
			dao.del(boardseq); // ��� ����
			
			check = 1;
			
			EndListDAO bdao = new EndListDAO();
			bdao.updateCount(seq, "-1"); // �Խ��� ��ȣ
		}
		
		req.setAttribute("check", check);
		req.setAttribute("seq", seq);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/Trip/EndComDelOk.jsp");
		dispatcher.forward(req, resp);
		}
}
