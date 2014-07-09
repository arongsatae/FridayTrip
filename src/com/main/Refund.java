package com.main;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Refund extends HttpServlet {

	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		 req.setCharacterEncoding("UTF-8");
		 
		 
		 HttpSession session = req.getSession();
			
		 //update 식별할 아이디

		 String id = session.getAttribute("id").toString();
		 String coin = session.getAttribute("coin").toString();
		 //현재 남은 코인
			
			 
		 String refund = req.getParameter("refund");
		 //이전 환불페이지에서 입력받은 금액
		
		 
		 
		 //환불금액을 제하고 남을 금액
		  
		 int updatecoin= 0;
		 
			 
		 updatecoin = Integer.parseInt(coin) - Integer.parseInt(refund);
		 		 
		 
		 if( updatecoin > 0){
		 //현재 잔액에서 환불할 금액을 뺏을때 0보다 큰 경우만 환불가능
			 
		 //환불처리.. 즉 업데이트를 하기 위한...
		 RefundDTO dto = new RefundDTO(); 		 
		 dto.setId(id);
		 dto.setUpdatecoin(updatecoin);
		 		 
		 TMemberDAO dao = new TMemberDAO();			
	     dao.updatecoin(dto);
			             
	     RequestDispatcher dispatcher = req.getRequestDispatcher("/Trip/complete.jsp");
	 	                                              //여기서는 굳이 프로젝트명까지 쓸필요 없다.		
		 dispatcher.forward(req, resp);
		
		 }else{
			 
			 
			 RequestDispatcher dispatcher = req.getRequestDispatcher("/Trip/realert.jsp");
              //여기서는 굳이 프로젝트명까지 쓸필요 없다.		
             dispatcher.forward(req, resp);
			 		 
		 }
		 
		 
	}

		
}
