package com.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class CommentOk extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");	
		
		String content = req.getParameter("content");
		String pw = req.getParameter("pw");
		String memSeq = req.getParameter("memSeq");
		String boardSeq = req.getParameter("boardSeq");
		
		CommentDAO dao = new  CommentDAO();
		CommentDTO dto = new CommentDTO();
		
		dto.setContent(content);
		dto.setPw(pw);
		dto.setMemSeq(memSeq);
		dto.setBoardSeq(boardSeq);
		
		dao.add(dto);
		
		BoardDAO bdao = new BoardDAO();
		bdao.updateCount(boardSeq, "+1"); 
		
		resp.sendRedirect("/FridayTrip/View.do?seq=" + boardSeq);
	}
}
