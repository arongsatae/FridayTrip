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
		
		String pw = req.getParameter("pw2"); // 암호
		String boardseq = req.getParameter("boardseq"); // 댓글 번호 
		String seq = req.getParameter("seq"); // 게시판 번호

		String page = req.getParameter("page");
		
		req.setAttribute("page", page);
		
		EndCommentDAO dao = new EndCommentDAO();
		
		int check = 0;
		
		if (dao.check(boardseq, pw)) {  // 댓글 번호, 암호
			 
			dao.del(boardseq); // 댓글 삭제
			
			check = 1;
			
			EndListDAO bdao = new EndListDAO();
			bdao.updateCount(seq, "-1"); // 게시판 번호
		}
		
		req.setAttribute("check", check);
		req.setAttribute("seq", seq);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/Trip/EndComDelOk.jsp");
		dispatcher.forward(req, resp);
		}
}
