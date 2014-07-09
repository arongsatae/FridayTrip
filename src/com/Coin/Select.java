package com.Coin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Select extends HttpServlet {
	
	//코인 결제수단 선택하기
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		//세션얻어오기
		HttpSession session = req.getSession();
		
		String id = session.getAttribute("id").toString(); //아이디	
		String rbs = session.getAttribute("rbs").toString(); //충전할 코인
		
		
		//회원 이름가져오기
		MemberDAO dao = new MemberDAO();
		MemberDTO dto = dao.view(id);
		
		req.setAttribute("id", id);
		req.setAttribute("dto", dto);
		req.setAttribute("rbs", rbs);
		RequestDispatcher dispatcher = req.getRequestDispatcher("/Trip/Select.jsp");
		dispatcher.forward(req, resp);
	}
}
