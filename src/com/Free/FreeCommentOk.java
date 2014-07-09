package com.Free;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class FreeCommentOk extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");	
		
		String content = req.getParameter("content");
		String pw = req.getParameter("pw");
		String memSeq = req.getParameter("memSeq");
		String boardSeq = req.getParameter("boardSeq");
		String page = req.getParameter("page");
		
		FreeCommentDAO dao = new FreeCommentDAO();
		FreeCommentDTO dto = new FreeCommentDTO();
		
		dto.setContent(content);
		dto.setPw(pw);
		dto.setMemSeq(memSeq);
		dto.setBoardSeq(boardSeq);
		
		dao.add(dto);
		
		FreeListDAO bdao = new FreeListDAO();
		bdao.updateCount(boardSeq, "+1"); 
		
		resp.sendRedirect("/FridayTrip/Trip/FreeView.do?seq=" + boardSeq + "&page=" + page);
	}
}
