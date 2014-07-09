package com.board;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class EditOk extends HttpServlet{
   @Override
protected void doPost(HttpServletRequest req, HttpServletResponse resp)
		throws ServletException, IOException {
	   
	   req.setCharacterEncoding("UTF-8");
	   
	   String seq = req.getParameter("seq");
		String name = req.getParameter("name");
		String pw = req.getParameter("pw");
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		String total=req.getParameter("total");
		String days=req.getParameter("days");
		String starts=req.getParameter("starts");
		
		String starts2 = "";// 2014-05-01 -> 05-01-2014
		starts2 = starts.substring(5);
		starts2 += "-" + starts.substring(0, 4);
		
		BoardDTO dto = new BoardDTO();
		dto.setSeq(seq);
		dto.setName(name);
		dto.setPw(pw);
		dto.setTitle(title);
		dto.setContent(content);
		dto.setTotal(total);
		dto.setDays(days);
		dto.setStarts(starts2);
		
		
		BoardDAO dao=new BoardDAO();

		String sum = "";
		if (dao.check(seq,pw)) { // 비번 확인
			dao.edit(dto); // 글 수정
			sum = "1";
		} else {
			sum = "0";
		}
		
		req.setAttribute("sum", sum);
		req.setAttribute("seq", seq);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/Trip/EditOk.jsp");
		dispatcher.forward(req, resp);
	   
   }
}
