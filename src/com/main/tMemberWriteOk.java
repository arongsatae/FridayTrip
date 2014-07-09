package com.main;



import javax.servlet.http.HttpServlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.main.TMemberDTO;

public class tMemberWriteOk extends HttpServlet{

	
	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
	
	
	
		req.setCharacterEncoding("UTF-8");
	
	    String seq="";
	
		String name = "";
		String id = "";
		String pw = "";
		String birth = "";
		
			
		String address = "";
			
		String addr1="";
		String addr2="";
		
		
		
		String tel="";
		
		//각각 쪼개진 전화번호 변수    tel0= 010 ... tel1=4112 ...
		String tel0 ="";
		String tel1="";
		String tel2="";
		
		
		String gender = "";
		String img = "";
		String lv = "";
		String coin ="";
		String before="";
		String after="";
		
		//총 12개
		
		

		try {
			//데이터 가져오기
			name = req.getParameter("name");
			id = req.getParameter("id");
			pw = req.getParameter("pw");
			birth = req.getParameter("birth");
			
			
			addr1 = req.getParameter("addr1");
			addr2 = req.getParameter("addr2");
			
			address = addr1 + " " + addr2;
					
			tel0 = req.getParameter("tel0");
			tel1 =req.getParameter("tel1");
			tel2 = req.getParameter("tel2");			
			
			tel = tel0 + "-" + tel1 + "-" + tel2;
			
			gender= req.getParameter("gender");
			img = req.getParameter("img");
			lv = req.getParameter("lv");
			coin = req.getParameter("coin");
			before= req.getParameter("before");
			after = req.getParameter("after");
			
			
		
			
			
		} catch (Exception e) {
			
			// TODO: handle exception
		}
		
		
		TMemberDTO dto = new TMemberDTO();
		
		dto.setName(name);
		dto.setId(id);
		dto.setPw(pw);
		dto.setBirth(birth);
		dto.setAddress(address);
		dto.setTel(tel);
		dto.setGender(gender);
		dto.setImg(img);
		dto.setLv(lv);
		dto.setCoin(coin);
		dto.setBefore(before);
		dto.setAfter(after);
		
		
		
		TMemberDAO dao = new TMemberDAO();
		
		
		dao.TMemberAdd(dto);
		
		//seq = dao.gettMemberseq();
		
		
		
		//System.out.println(seq);
		//seq값 제대로 얻어왔는지 확인하는 용도
		
		
		
		
		HttpSession session = req.getSession();
		
		
		session.setAttribute("seq", dao.gettMemberseq() );
		
		
		
		//seq 저장
		
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/Trip/tMemberWirteOk.jsp");
		                                         //여기서는 굳이 프로젝트명까지 쓸필요 없다. 
		
		dispatcher.forward(req, resp);
		
		
		
	
	
	
}
	
	
	
	
	
	
	
	
}