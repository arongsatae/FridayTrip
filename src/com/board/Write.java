package com.board;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Write extends HttpServlet{
      @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
    		throws ServletException, IOException {
    	  
    		
  		req.setCharacterEncoding("UTF-8");
  		
  		HttpSession session = req.getSession();
  		String id = session.getAttribute("id").toString();
  		
  		// id 검색후 이름&멤버번호 얻어오기
  		BoardDAO dao = new 	BoardDAO();
  	   BoardDTO me = dao.me(id);
  				
  		req.setAttribute("me", me);
    	  
  		RequestDispatcher dispatcher = req.getRequestDispatcher("/Trip/Write.jsp");
  		dispatcher.forward(req, resp);
    }
}
