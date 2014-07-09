package com.End;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class EndCommentOk extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");	
		
		String content = req.getParameter("content");
		String pw = req.getParameter("pw");
		String memSeq = req.getParameter("memSeq");
		String txtSeq = req.getParameter("txtSeq");
		String page = req.getParameter("page");
		
		System.out.println(txtSeq);
		System.out.println(req.getParameter("page"));
		
		req.setAttribute("page", page);
		EndCommentDAO dao = new EndCommentDAO();
		EndCommentDTO dto = new EndCommentDTO();
		
		dto.setContent(content);
		dto.setPw(pw);
		dto.setMemSeq(memSeq);
		dto.setTxtSeq(txtSeq);
		
		dao.add(dto);
		
		EndListDAO bdao = new EndListDAO();
		bdao.updateCount(txtSeq, "+1"); 
		
		resp.sendRedirect("/FridayTrip/Trip/EndView.do?seq=" + txtSeq +"&page=" + page);
	}
}
