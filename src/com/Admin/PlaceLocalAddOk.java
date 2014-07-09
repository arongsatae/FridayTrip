package com.Admin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class PlaceLocalAddOk extends HttpServlet {
      @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
    		throws ServletException, IOException {
	req.setCharacterEncoding("UTF-8");
    		
    		String seq=req.getParameter("seq");
    		String name=req.getParameter("name");

    		

    			PlaceAddDTO dto = new PlaceAddDTO();
    			  dto.setSeq(seq);
    	        dto.setName(name);
    		 
    		    
    		      
    			PlaceAddDAO dao = new PlaceAddDAO();
    			dao.add(dto);
 
    			RequestDispatcher dispatcher = req.getRequestDispatcher("/Trip/PlaceLocalAddOk.jsp");
    		
    		dispatcher.forward(req, resp);	
  
    }
}
