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
			
		 //update �ĺ��� ���̵�

		 String id = session.getAttribute("id").toString();
		 String coin = session.getAttribute("coin").toString();
		 //���� ���� ����
			
			 
		 String refund = req.getParameter("refund");
		 //���� ȯ������������ �Է¹��� �ݾ�
		
		 
		 
		 //ȯ�ұݾ��� ���ϰ� ���� �ݾ�
		  
		 int updatecoin= 0;
		 
			 
		 updatecoin = Integer.parseInt(coin) - Integer.parseInt(refund);
		 		 
		 
		 if( updatecoin > 0){
		 //���� �ܾ׿��� ȯ���� �ݾ��� ������ 0���� ū ��츸 ȯ�Ұ���
			 
		 //ȯ��ó��.. �� ������Ʈ�� �ϱ� ����...
		 RefundDTO dto = new RefundDTO(); 		 
		 dto.setId(id);
		 dto.setUpdatecoin(updatecoin);
		 		 
		 TMemberDAO dao = new TMemberDAO();			
	     dao.updatecoin(dto);
			             
	     RequestDispatcher dispatcher = req.getRequestDispatcher("/Trip/complete.jsp");
	 	                                              //���⼭�� ���� ������Ʈ����� ���ʿ� ����.		
		 dispatcher.forward(req, resp);
		
		 }else{
			 
			 
			 RequestDispatcher dispatcher = req.getRequestDispatcher("/Trip/realert.jsp");
              //���⼭�� ���� ������Ʈ����� ���ʿ� ����.		
             dispatcher.forward(req, resp);
			 		 
		 }
		 
		 
	}

		
}
