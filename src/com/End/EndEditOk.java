package com.End;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class EndEditOk extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		
		String seq = req.getParameter("seq");
		String name = req.getParameter("name");
		String pw = req.getParameter("pw");
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		String page = req.getParameter("page");
		String travel = req.getParameter("travel");
		
		EndListDTO dto = new EndListDTO();
		dto.setSeq(seq);
		dto.setName(name);
		dto.setPw(pw);
		dto.setTitle(title);
		dto.setContent(content);
		dto.setTravel(travel);
		
		EndListDAO dao = new EndListDAO();
		
		String sum = "";
		if (dao.check(seq,pw)) { // 비번 확인
			dao.edit(dto); // 글 수정
			sum = "1";
		} else {
			sum = "0";
		}
		
		req.setAttribute("sum", sum);
		req.setAttribute("seq", seq);
		req.setAttribute("page", page);
		RequestDispatcher dispatcher = req.getRequestDispatcher("/Trip/EndEditOk.jsp");
		dispatcher.forward(req, resp);
		
	}
}
