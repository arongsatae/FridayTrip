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
		
				//세션 얻기
				HttpSession session = req.getSession();
				
				//회원정보 건네주기
				MemberDAO mdao = new MemberDAO();
				
				MemberDTO mdto = mdao.list(session.getAttribute("id").toString());
				
				req.setAttribute("mdto", mdto);
					
				//상품 정보 건네주기
				String seq = req.getParameter("seq");
				String table = req.getParameter("table");
				String app = req.getParameter("app");
				TripDAO dao = new TripDAO();
				TripDTO dto = dao.view(seq, table);
				
				req.setAttribute("dto", dto);
				
				//여행주제를 번호화 (1. 낚시, 2.지역탐방, 3. 맛집, 4.등산, 5. 자전거)
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
				
				//회원의 현재 코인값 얻어오기
				int mcoin = mdto.getCoin();
				
				//가격 할인율 계산
				String lv = mdto.getLv();
				String gender = mdto.getGender();
				double dcRate = 1;
				
				//남여 할인율
				if(gender.equals("여")){
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
				
				String bcoin = session.getAttribute("bcoin").toString(); //현재 코인
				int bcoin1 = Integer.parseInt(bcoin);
				
						
				int coin = dto.getCoin();
				
				double total1 = coin * dcRate;
				
				double dcPrice1 = coin * (1-dcRate);
				
				int total = (int)total1; //총 결제 금액

				int dcPrice = (int)dcPrice1; //할인 금액
				
				int after = bcoin1 - total; //결제 후 금액
				
				if(after < 0){
					resp.sendRedirect("/FridayTrip/Trip/Caution.do");
				} else{
				
				String result = Integer.toString(total); //총 결제 금액
				String sale = Integer.toString(dcPrice); //할인 금액
				String afterpay = Integer.toString(after); //결제 후 금액
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
					//DB 위임하여 결제 후 코인 업데이트하기
					mdao.updatecoin(session.getAttribute("id").toString(), after);
					
					//DB 위임하여 여행 신청 등록하기		
					adao.add(mdto.getSeq(), dto.getSeq(), total, app);
					
					//DB 위임하여 참여인원 수 증가시키기
					dao.addCount(seq, table);
					session.setAttribute("pay", "y");
					
					//DB 위임하여 코인사용기록 남기기
					UsedCoinDAO udao = new UsedCoinDAO();
					udao.used(mdto.getSeq(), result, dto.getSeq(), clsNum);
					
				}
				
				
				
				
				
		RequestDispatcher dispatcher = req.getRequestDispatcher("/Trip/PayOk.jsp");
		dispatcher.forward(req, resp);
				}
	}
}
