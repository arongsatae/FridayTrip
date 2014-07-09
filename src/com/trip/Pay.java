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

		// 세션 얻기
		HttpSession session = req.getSession();

		// 회원정보 건네주기
		MemberDAO mdao = new MemberDAO();

		MemberDTO mdto = mdao.list(session.getAttribute("id").toString());
		
		req.setAttribute("mdto", mdto);

		// 상품 정보 건네주기
		String seq = req.getParameter("seq");
		String table = req.getParameter("table");
		String app = req.getParameter("app");
		TripDAO dao = new TripDAO();
		TripDTO dto = dao.view(seq, table);

		int count = dto.getCount(); //신청인원
		int total2 = dto.getTotal(); //총인원
		int bcoin = mdto.getCoin(); //현재 보유 코인
		
		// 신청인원 마감 검사
		if (count == total2) {
			resp.sendRedirect("/FridayTrip/Trip/Full.do");
		} else {
			//중복 신청 검사
			AppDAO adao = new AppDAO();
			
			if(adao.check(session.getAttribute("id").toString(), seq, app)){
				resp.sendRedirect("/FridayTrip/Trip/Already.do");
			} else{
			req.setAttribute("dto", dto);
			req.setAttribute("seq", seq);
			req.setAttribute("table", table);
			req.setAttribute("app", app);

			// 회원의 현재 코인값 얻어오기
			int mcoin = mdto.getCoin();

			// 가격 할인율 계산
			String lv = mdto.getLv(); //회원등급
			String gender = mdto.getGender(); //회원성별
			
			double dcRate = 1; //할인율

			// 남여 할인율
			if (gender.equals("여")) {
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

			int coin = dto.getCoin(); //상품 원가

			double total1 = coin * dcRate; //할인 후 상품가격

			double dcPrice1 = coin * (1 - dcRate); //할인가

			int total = (int) total1; //할인 후 상품가격 int변환

			int dcPrice = (int) dcPrice1; //할인가 int변환

			String result = Integer.toString(total); //할인 후 상품가격 String 변환
			String sale = Integer.toString(dcPrice); //할인가 String 변환

			// F5 중복 결제 방지
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
