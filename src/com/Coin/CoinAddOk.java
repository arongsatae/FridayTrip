package com.Coin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class CoinAddOk extends HttpServlet{
@Override
protected void doGet(HttpServletRequest req, HttpServletResponse resp)
		throws ServletException, IOException {
	   req.setCharacterEncoding("UTF-8");//�ѱ�ó���ڵ�
	   
	   	HttpSession session = req.getSession();
		
		String seq = session.getAttribute("seq").toString(); //���̵�	
		String rbs = session.getAttribute("rbs").toString(); //������ ����
	   
	  MemberDAO dao=new MemberDAO();
	  dao.edit(seq, rbs);
	  
	  CoinDAO dao2 = new CoinDAO();
	  dao2.add(seq, rbs);
	  
	  RequestDispatcher dispatcher = req.getRequestDispatcher("/Trip/CoinAddOk.jsp");
	dispatcher.forward(req, resp);
}
}
