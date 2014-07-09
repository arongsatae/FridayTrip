package com.Admin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class MemberModify extends HttpServlet{
   @Override
protected void doGet(HttpServletRequest req, HttpServletResponse resp)
		throws ServletException, IOException {
               
	   String seq=req.getParameter("seq");
		
	    MemberDAO dao=new MemberDAO();
	    MemberDTO dto=dao.modify(seq);
		 
			req.setAttribute("dto",dto);
			
			
		 
		 RequestDispatcher dispatcher=req.getRequestDispatcher("/Trip/MemberModify.jsp");
		 
		dispatcher.forward(req,resp);
    }
}
