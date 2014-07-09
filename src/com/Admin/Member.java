package com.Admin;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Member  extends  HttpServlet{
   @Override
protected void doGet(HttpServletRequest req, HttpServletResponse resp)
		throws ServletException, IOException {
	  
		
		HttpSession session=req.getSession();
		
		MemberDAO dao=new MemberDAO();
		ArrayList<MemberDTO> list=dao.list();
		System.out.println(list.size()); 
		req.setAttribute("list",list); 
		
         
		
		RequestDispatcher dispatcher=req.getRequestDispatcher("/Trip/Member.jsp");
		dispatcher.forward(req,resp);
    }
}
