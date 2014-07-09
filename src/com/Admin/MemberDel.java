package com.Admin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



public class MemberDel extends HttpServlet{
      @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
    		throws ServletException, IOException {
          
  		String seq=req.getParameter("seq");
		
	    MemberDAO dao=new MemberDAO();
		 
		 dao.del(seq);
		 
		 RequestDispatcher dispatcher=req.getRequestDispatcher("/Trip/MemberDel.jsp");
		 
		dispatcher.forward(req,resp);
		
    }
}
