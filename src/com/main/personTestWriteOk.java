package com.main;

import javax.servlet.http.HttpServlet;



import javax.servlet.http.HttpSession;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class personTestWriteOk extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		
		 req.setCharacterEncoding("UTF-8");
		
		
		 HttpSession session = req.getSession();
		

		 String memSeq = session.getAttribute("seq").toString();
	
		
		
		
		
	    
		//총 합을 구할 점수들
	    
	    
		int passion=0;
		int social=0;
		int saint=0;
		int predict=0;
		int friend =0;
		int dic=0;
		
		
		
		String r01="";
		String r02="";
		String r03="";
		String r04="";
		String r05="";
		
		
		
		String r06="";
		String r07="";
		String r08="";
		String r09="";
		String r10="";
		
		
		
		String r11="";
		String r12="";
		String r13="";
		String r14="";
		String r15="";
		
		
		
		String r16="";
		String r17="";
		String r18="";
		String r19="";
		String r20="";
		
		
		String r21="";
		String r22="";
		String r23="";
		String r24="";
		String r25="";
		
		
		
		String r26="";
		String r27="";
		String r28="";
		String r29="";
		String r30="";
		
				
		
		try {
			
			r01=req.getParameter("r01");
			r02=req.getParameter("r02");
			r03=req.getParameter("r03");
			r04=req.getParameter("r04");
			r05=req.getParameter("r05");
			
			
			passion=Integer.parseInt(r01) +Integer.parseInt(r02) + Integer.parseInt(r03) + Integer.parseInt(r04) + Integer.parseInt(r05);
			
			
			
			
			r06=req.getParameter("r06");
			r07=req.getParameter("r07");
			r08=req.getParameter("r08");
			r09=req.getParameter("r09");
			r10=req.getParameter("r10");
			
			
			
			social=Integer.parseInt(r06) +Integer.parseInt(r07) + Integer.parseInt(r08) + Integer.parseInt(r09) + Integer.parseInt(r10);
			
			
			
			r11=req.getParameter("r11");
			r12=req.getParameter("r12");
			r13=req.getParameter("r13");
			r14=req.getParameter("r14");
			r15=req.getParameter("r15");
			
			
			saint =Integer.parseInt(r11) +Integer.parseInt(r12) + Integer.parseInt(r13) + Integer.parseInt(r14) + Integer.parseInt(r15);

			
			
			r16=req.getParameter("r16");
			r17=req.getParameter("r17");
			r18=req.getParameter("r18");
			r19=req.getParameter("r19");
			r20=req.getParameter("r20");
			
			
			predict= Integer.parseInt(r16) +Integer.parseInt(r17) + Integer.parseInt(r18) + Integer.parseInt(r19) + Integer.parseInt(r20);

			
			r21=req.getParameter("r21");
			r22=req.getParameter("r22");
			r23=req.getParameter("r23");
			r24=req.getParameter("r24");
			r25=req.getParameter("r25");
			
			
			
			friend =Integer.parseInt(r21) +Integer.parseInt(r22) + Integer.parseInt(r23) + Integer.parseInt(r24) + Integer.parseInt(r25);

			
			
			
			r26=req.getParameter("r26");
			r27=req.getParameter("r27");
			r28=req.getParameter("r28");
			r29=req.getParameter("r29");
			r30=req.getParameter("r30");
			
			
			dic = Integer.parseInt(r26) +Integer.parseInt(r27) + Integer.parseInt(r28) + Integer.parseInt(r29) + Integer.parseInt(r30);
	
			
		} catch (Exception e) {
					
			
		}
			
		personTestDTO dto = new personTestDTO();
		
		
		dto.setMemSeq(memSeq);   //회원번호
		dto.setPassion(passion);
		dto.setSocial(social);
		dto.setSaint(saint);
		dto.setPredict(predict);
		dto.setFriend(friend);
		dto.setDic(dic);
		
		
		
		
		TMemberDAO dao = new TMemberDAO();
		
		
		
		dao.personTestAdd(dto);
		
		
		session.setAttribute("passion", dto.getPassion());
		session.setAttribute("social", dto.getSocial());
		session.setAttribute("saint", dto.getSaint());
		session.setAttribute("predict", dto.getPredict());
		session.setAttribute("friend", dto.getFriend());
		session.setAttribute("dic", dto.getDic());
		
		
		
		
		int[] score = new int[6];
		int[] rank = new int[6];
		String[] name = new String[6];
		String[] result =new String[6];
		
		
		score[0] = passion;
		score[1] = dic;
		score[2] = friend;
		score[3] = predict;
		score[4] = saint;
		score[5] = social;
		
		
	     name[0] = "지도자형";
		 name[1] = "백과사전형";
		 name[2] = "친선도모형";
		 name[3] = "예언자형";		
		 name[4] = "성인군자형";
		 name[5] = "사교형";
		 
		 
		
		 for(int i = 0 ; i < 6 ; i++){
			 
			   rank[i] = 1;
			   
		  }
			  			
		 for(int i = 0 ; i < 6 ; i++){
			 
			   for(int j = 0 ; j < 6 ; j++){
				   
			    if(score[i] < score[j])
			    	
			     rank[i] = rank[i] + 1;
			    
			   }
			   
	     }
			
	
	    for( int i = 0 ; i < 6 ; i++  ){
			    	
		    if(rank[i] == 1 ){
			  		 
		       result[i] = name[i]; 
			   
		       session.setAttribute("result", result[i]);
		       
		     }
				
	    }

		 

		
		
		
		
		
		
		
		
        RequestDispatcher dispatcher = req.getRequestDispatcher("/Trip/personWriteOk.jsp");
        //여기서는 굳이 프로젝트명까지 쓸필요 없다. 
        
		
		dispatcher.forward(req, resp);
		
		
		
		
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
}
