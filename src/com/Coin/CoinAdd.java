package com.Coin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class CoinAdd extends HttpServlet {
  @Override
protected void doGet(HttpServletRequest req, HttpServletResponse resp)
		throws ServletException, IOException {
	  
	  	HttpSession session = req.getSession();
	  	
	  	String id = session.getAttribute("id").toString();
	  	
	  	//회원 seq 얻기
	  	MemberDAO mdao = new MemberDAO();
		MemberDTO dto = mdao.view(id);
		
		req.setAttribute("dto", dto);
	  	
	  	req.setAttribute("id", id);
	    RequestDispatcher dispatcher = req.getRequestDispatcher("/Trip/CoinAdd.jsp");
		dispatcher.forward(req, resp);
}
}
