package com.Free;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class FreeWrite extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		
		HttpSession session = req.getSession();
		String id = session.getAttribute("id").toString();
		
		// id 검색후 이름&멤버번호 얻어오기
		FreeListDAO dao = new FreeListDAO();
		FreeListDTO me = dao.me(id);
				
		req.setAttribute("me", me);
		
		String thread = req.getParameter("thread");
		String depth = req.getParameter("depth");
		
		req.setAttribute("thread", thread);
		req.setAttribute("depth", depth);

		String seq = req.getParameter("seq");
		String page = req.getParameter("page");
		
		req.setAttribute("page", page);
		RequestDispatcher dispatcher = req.getRequestDispatcher("/Trip/FreeWrite.jsp");
		dispatcher.forward(req, resp);
	
	}	
}
