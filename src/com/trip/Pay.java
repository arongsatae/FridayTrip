package com.trip;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Pay extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		// ���� ���
		HttpSession session = req.getSession();

		// ȸ������ �ǳ��ֱ�
		MemberDAO mdao = new MemberDAO();

		MemberDTO mdto = mdao.list(session.getAttribute("id").toString());
		
		req.setAttribute("mdto", mdto);

		// ��ǰ ���� �ǳ��ֱ�
		String seq = req.getParameter("seq");
		String table = req.getParameter("table");
		String app = req.getParameter("app");
		TripDAO dao = new TripDAO();
		TripDTO dto = dao.view(seq, table);

		int count = dto.getCount(); //��û�ο�
		int total2 = dto.getTotal(); //���ο�
		int bcoin = mdto.getCoin(); //���� ���� ����
		
		// ��û�ο� ���� �˻�
		if (count == total2) {
			resp.sendRedirect("/FridayTrip/Trip/Full.do");
		} else {
			//�ߺ� ��û �˻�
			AppDAO adao = new AppDAO();
			
			if(adao.check(session.getAttribute("id").toString(), seq, app)){
				resp.sendRedirect("/FridayTrip/Trip/Already.do");
			} else{
			req.setAttribute("dto", dto);
			req.setAttribute("seq", seq);
			req.setAttribute("table", table);
			req.setAttribute("app", app);

			// ȸ���� ���� ���ΰ� ������
			int mcoin = mdto.getCoin();

			// ���� ������ ���
			String lv = mdto.getLv(); //ȸ�����
			String gender = mdto.getGender(); //ȸ������
			
			double dcRate = 1; //������

			// ���� ������
			if (gender.equals("��")) {
				if (lv.equals("VIP")) {
					dcRate = 0.5;
				} else {
					dcRate = 0.7;
				}
			} else {
				if (lv.equals("VIP")) {
					dcRate = 0.7;
				}
			}

			int coin = dto.getCoin(); //��ǰ ����

			double total1 = coin * dcRate; //���� �� ��ǰ����

			double dcPrice1 = coin * (1 - dcRate); //���ΰ�

			int total = (int) total1; //���� �� ��ǰ���� int��ȯ

			int dcPrice = (int) dcPrice1; //���ΰ� int��ȯ

			String result = Integer.toString(total); //���� �� ��ǰ���� String ��ȯ
			String sale = Integer.toString(dcPrice); //���ΰ� String ��ȯ

			// F5 �ߺ� ���� ����
			req.getSession().setAttribute("pay", "n");
			req.getSession().setAttribute("bcoin", bcoin);
			req.setAttribute("result", result);
			req.setAttribute("sale", sale);
			RequestDispatcher dispatcher = req.getRequestDispatcher("/Trip/Pay.jsp");
			dispatcher.forward(req, resp);
			}
		}
	}
}
