package com.Coin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class CoinAdding extends HttpServlet {
	
	//���� ���� ���� ��� �����ϱ�
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
			
			HttpSession session = req.getSession();
			
			String seq = req.getParameter("seq");
			String rbs = req.getParameter("rbs");
			
			//ȸ����ȣ Ȯ��
			//System.out.println(seq); 
			
			//ȸ����ȣ�� ������ ���� ���ǿ� ���
			req.getSession().setAttribute("seq", seq);
			req.getSession().setAttribute("rbs", rbs);
			
			
			/*req.setAttribute("seq", seq);
			req.setAttribute("rbs", rbs);*/
			
		RequestDispatcher dispatcher = req.getRequestDispatcher("/Trip/CoinAdding.jsp");
		dispatcher.forward(req, resp);
	}
}
