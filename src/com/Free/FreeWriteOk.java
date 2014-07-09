package com.Free;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class FreeWriteOk extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		
		String name = req.getParameter("name");
		String pw = req.getParameter("pw");
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		String seq = req.getParameter("seq");

		
		String page = req.getParameter("page");
		
		req.setAttribute("page", page);
		
		FreeListDTO dto = new FreeListDTO();
		dto.setName(name);
		dto.setPw(pw);
		dto.setTitle(title);
		dto.setContent(content);
		dto.setMemseq(seq);
		
		FreeListDAO dao = new FreeListDAO();
		//dao.add(dto);
		
		System.out.println(req.getParameter("thread"));
		System.out.println(req.getParameter("depth"));

		
		// 새글 & 답변 글 처리
		// -> thread 와 depth 값을 입력하기
		int thread = -1;
		int depth = -1;
		
		// 부른 이유가 새글? 답변글?
		if (req.getParameter("thread").isEmpty() && req.getParameter("depth").isEmpty()) {
			// 새글의 thread 에 +1000 하기
			thread = dao.getThread(); // 새글의 thread
			
			// 새글의 depth 에 0을 대입
			depth = 0;
		} else {
			// 답변
			
			// 1번째 공식 : 현재 모든 thread 작고 부모 thread 를 뺀다 
			// 부모글의 thread? depth?
			int parentThread = Integer.parseInt(req.getParameter("thread"));
			int parentDepth = Integer.parseInt(req.getParameter("depth"));
			
			// 이전 새글의 thread (2000 - 1000 = 1000 이런 식 계산 공식)
			int prevThread = (int)Math.floor((parentThread -1) / 1000) * 1000;
			
			// 위임
			dao.updateThread(parentThread, prevThread);
			
			// 2번째 공식 : 현재 답변글의 thread 값은 부모 thread - 1
			thread = parentThread - 1;
			
			// 3번째 공식 : 현재 답변글의 depth 값은 부모값보다 +1 
			depth = parentDepth +1;
		}
		
		dto.setThread(String.valueOf(thread));
		dto.setDepth(String.valueOf(depth));
		
		// 3.
		dao.add(dto); // 글쓰기 위임
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/Trip/FreeWriteOk.jsp");
		dispatcher.forward(req, resp);
	}
}
