package com.Admin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AdminOk extends HttpServlet{
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
    		throws ServletException, IOException {
    	      
    	req.setCharacterEncoding("UTF-8");
    	
    	String seq=req.getParameter("seq");
   /*     String ideal="";
        ideal=req.getParameter("ideal");*/
 
        String count=req.getParameter("count");
        String etc=req.getParameter("etc");
        String id=req.getParameter("id");

        MemberDAO dao=new MemberDAO();
        String memseq=dao.getSeq(id);
       	/*String ideal=dao.getideal(seq);*/
        String ideal = req.getParameter("ideal");
       	
        EpilogueDTO dto=new EpilogueDTO();
        dto.setSeq(seq);
        dto.setEtc(etc);
        dto.setIdeal(ideal);
        dto.setCount(count);
        dto.setMemseq(memseq);
        
        System.out.println(seq);
        System.out.println(etc);
        System.out.println(ideal);
        System.out.println(count);
        System.out.println(memseq);
        
        
        dao.in(dto);

        req.setAttribute("ideal",ideal);
        
    	RequestDispatcher dispatcher = req
				.getRequestDispatcher("/Trip/AdminOk.jsp");

		dispatcher.forward(req, resp);
        
    }
}
