package com.trip;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class PayOk extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
				//���� ���
				HttpSession session = req.getSession();
				
				//ȸ������ �ǳ��ֱ�
				MemberDAO mdao = new MemberDAO();
				
				MemberDTO mdto = mdao.list(session.getAttribute("id").toString());
				
				req.setAttribute("mdto", mdto);
					
				//��ǰ ���� �ǳ��ֱ�
				String seq = req.getParameter("seq");
				String table = req.getParameter("table");
				String app = req.getParameter("app");
				TripDAO dao = new TripDAO();
				TripDTO dto = dao.view(seq, table);
				
				req.setAttribute("dto", dto);
				
				//���������� ��ȣȭ (1. ����, 2.����Ž��, 3. ����, 4.���, 5. ������)
				int clsNum;
				if(table.equals("tFish")){
					clsNum = 1;
				} else if(table.equals("tLocal")){
					clsNum = 2;
				} else if(table.equals("tFood")){
					clsNum = 3;
				} else if(table.equals("tMt")){
					clsNum = 4;
				} else{
					clsNum = 5;
				}
				
				//ȸ���� ���� ���ΰ� ������
				int mcoin = mdto.getCoin();
				
				//���� ������ ���
				String lv = mdto.getLv();
				String gender = mdto.getGender();
				double dcRate = 1;
				
				//���� ������
				if(gender.equals("��")){
					if(lv.equals("VIP")){
						dcRate = 0.5;
					}
					else{
						dcRate = 0.7;
					}
				} else{
					if(lv.equals("VIP")){
						dcRate = 0.7;
					}
				}
				
				String bcoin = session.getAttribute("bcoin").toString(); //���� ����
				int bcoin1 = Integer.parseInt(bcoin);
				
						
				int coin = dto.getCoin();
				
				double total1 = coin * dcRate;
				
				double dcPrice1 = coin * (1-dcRate);
				
				int total = (int)total1; //�� ���� �ݾ�

				int dcPrice = (int)dcPrice1; //���� �ݾ�
				
				int after = bcoin1 - total; //���� �� �ݾ�
				
				if(after < 0){
					resp.sendRedirect("/FridayTrip/Trip/Caution.do");
				} else{
				
				String result = Integer.toString(total); //�� ���� �ݾ�
				String sale = Integer.toString(dcPrice); //���� �ݾ�
				String afterpay = Integer.toString(after); //���� �� �ݾ�
				String nowCoin = Integer.toString(mcoin);
				
				req.setAttribute("bcoin", bcoin);
				req.setAttribute("afterpay", afterpay);
				req.setAttribute("sale", sale);
				req.setAttribute("result", result);
				req.setAttribute("nowCoin", nowCoin);
				
				AppDAO adao = new AppDAO();
				
				String pay = "";
				
				if(session.getAttribute("pay") !=null){
					pay = session.getAttribute("pay").toString();
				}
				if(pay.equals("n") || pay == ""){
					//DB �����Ͽ� ���� �� ���� ������Ʈ�ϱ�
					mdao.updatecoin(session.getAttribute("id").toString(), after);
					
					//DB �����Ͽ� ���� ��û ����ϱ�		
					adao.add(mdto.getSeq(), dto.getSeq(), total, app);
					
					//DB �����Ͽ� �����ο� �� ������Ű��
					dao.addCount(seq, table);
					session.setAttribute("pay", "y");
					
					//DB �����Ͽ� ���λ���� �����
					UsedCoinDAO udao = new UsedCoinDAO();
					udao.used(mdto.getSeq(), result, dto.getSeq(), clsNum);
					
				}
				
				
				
				
				
		RequestDispatcher dispatcher = req.getRequestDispatcher("/Trip/PayOk.jsp");
		dispatcher.forward(req, resp);
				}
	}
}
