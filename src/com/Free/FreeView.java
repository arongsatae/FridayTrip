package com.Free;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class FreeView extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		
		// 검색 관련 값들 받기
		String col = req.getParameter("col");
		String word = req.getParameter("word");
		String page = req.getParameter("page");		
		
		if (col != null && word != null) {
			req.setAttribute("col", col);
			req.setAttribute("word", word);
		}
		
		String seq = req.getParameter("seq");
		
		FreeListDAO dao = new FreeListDAO();
		
		
		HttpSession session = req.getSession();
		String id = session.getAttribute("id").toString();
		
		// id 검색후 이름&멤버번호 얻어오기
		FreeListDTO me = dao.me(id);
		
		// 글 카운트
		String read = ""; 
		
		if (session.getAttribute("read") != null) {
			read = session.getAttribute("read").toString();			
		}
		if (read.equals("n") || read == "") {   // 즐겨찾기 및 리스트 갔다가 다시 온사람 카운터+1
			dao.addCount(seq);
			session.setAttribute("read", "y");
		}
		FreeListDTO dto = dao.view(seq); // 글 보여주기
		// 글 카운트 끝
		
		// 검색어 : 내용중에 검색중이라면 색 변경
		if (col != null && word != null) {
			if (col.equals("content")) {
						
			dto.setContent(dto.getContent().replace
					(word, "<span style='color:red; background-color:yellow;'>" + word + "</span>"));
			} else if (col.equals("all")) {
				dto.setContent(dto.getContent().replace
						(word, "<span style='color:red; background-color:yellow;'>" + word + "</span>"));
				dto.setTitle(dto.getTitle().replace
						(word, "<span style='color:red; background-color:yellow;'>" + word + "</span>"));
			}
		}
		
		// 댓글 목록 보기
		FreeCommentDAO cdao = new FreeCommentDAO();
		ArrayList<FreeCommentDTO> clist = cdao.list(seq); // 부모글 번호를 조건으로 select
		
		req.setAttribute("page", page);
		req.setAttribute("clist", clist);
		req.setAttribute("dto", dto);
		req.setAttribute("me", me);
		req.setAttribute("seq", seq);
		RequestDispatcher dispatcher = req.getRequestDispatcher("/Trip/FreeView.jsp");
		dispatcher.forward(req, resp);
		
	}
}
