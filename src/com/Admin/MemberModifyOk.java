package com.Admin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MemberModifyOk extends HttpServlet{
      @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
    		throws ServletException, IOException {
    	  
    	  req.setCharacterEncoding("UTF-8");
  		
           String name=req.getParameter("name");
           String id=req.getParameter("id");
           String coin=req.getParameter("coin");
           String address=req.getParameter("address");
           String birth=req.getParameter("birth");
           String lv=req.getParameter("lv");
           String before=req.getParameter("before");
           String after=req.getParameter("after");
           
           String seq=req.getParameter("seq");
           
           MemberDTO dto=new MemberDTO();
           MemberDAO dao=new MemberDAO();
           /*String after=dao.getideal(seq);*/
           dto.setName(name);
           dto.setId(id);
           dto.setCoin(coin);
           dto.setAddress(address);
           dto.setBirth(birth);
           dto.setLv(lv);
           dto.setBefore(before);
           dto.setAfter(after);
           dto.setSeq(seq);
           
        
			dao.edit(dto);
           
       	RequestDispatcher dispatcher = req.getRequestDispatcher("/Trip/MemberModifyOk.jsp");
    	dispatcher.forward(req, resp);
		
    }
}
