package com.Coin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Select extends HttpServlet {
	
	//���� �������� �����ϱ�
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		//���Ǿ�����
		HttpSession session = req.getSession();
		
		String id = session.getAttribute("id").toString(); //���̵�	
		String rbs = session.getAttribute("rbs").toString(); //������ ����
		
		
		//ȸ�� �̸���������
		MemberDAO dao = new MemberDAO();
		MemberDTO dto = dao.view(id);
		
		req.setAttribute("id", id);
		req.setAttribute("dto", dto);
		req.setAttribute("rbs", rbs);
		RequestDispatcher dispatcher = req.getRequestDispatcher("/Trip/Select.jsp");
		dispatcher.forward(req, resp);
	}
}
