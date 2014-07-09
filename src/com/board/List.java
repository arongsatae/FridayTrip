package com.board;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Admin.MemberDTO;

public class List extends HttpServlet{
     @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
    		throws ServletException, IOException {
    	 
   
 			
    		
 		// 페이징 처리
 		int totalCount = 0; // 총 게시물수 
 		int totalPage = 0; // 총페이지수
 		int pageSize = 10; // 한페이지 출력 게시물수
 		int temp2 = 0, loop = 0;
 		int nowPage = 0;  // 현재페이지 
 		
 		if (req.getParameter("page") == null)
 			nowPage = 1;
 		else 
 			nowPage = Integer.parseInt(req.getParameter("page"));
 			
 		req.setAttribute("nowPage", nowPage);
 		
 		// nowPage와 pageSize 를 가지고 페이징 범위 계산 (rnum의 조건으로 사용할 범위)
 		int start = ((nowPage - 1) * pageSize) +1;
 		int end = start + pageSize -1;
 		
 		HttpSession session = req.getSession();
 		String id = session.getAttribute("id").toString();

 		BoardDAO dao = new BoardDAO();
 		// id 검색후 이름&멤버번호 얻어오기
 		BoardDTO me = dao.me(id);
 		
 		boolean search = false; // 넘어온것이 주소가 1번인가 2번인가 확인
 		String col = req.getParameter("col");
 		String word = req.getParameter("word");		
 		
 		if (col != null && word != null) {
 			search = true;	
 		}	
 			
 		String searchResult = "";

 		ArrayList<BoardDTO> list = dao.list(start, end); // 리스트 목록		
 		
 		if (search) {
 			list = dao.search(col, word, start, end); // 검색
 			
 			searchResult = String.format("검색어 : '%s' 으로 총 %d 건이 검색", word, list.size());
 			
 			req.setAttribute("searchResult", searchResult);
 		} else {
 			
 		}
 		for (int i=0; i<list.size(); i++) {
 			BoardDTO dto = list.get(i);//게시물1개
 			
 			// a. 제목이 길면.. 자르기
 			if (dto.getTitle().length() > 30) {
 				String temp = dto.getTitle().substring(0, 23) + "...";
 				
 				//잘라낸 제목을 덮어쓰기				
 				dto.setTitle(temp);			
 			}
 			
 			//b. 최신글 표시하기(18시간)
 			Date regDate = dto.getRegDate();
 			Calendar now = Calendar.getInstance();
 			long span = now.getTime().getTime() - regDate.getTime();//글쓰고 난뒤 흘러간 시간..
 			
 			if ((span / 1000 / 60 / 60) < 18) {
 				// 최신글... 뉴 이미지
 				dto.setNewImg("<img src='/FridayTrip/Trip/images/010.PNG' align='center'/>");
 			}	
 			
 			// 검색후 검색이 맞으면 검색 단어에 색깔을 넣는다
 			if (search&&col.equals("title")){
 				dto.setTitle(dto.getTitle().replace
 						(word, "<span style='color:red;" + "background-color:yellow;'>" + word + "</span>"));
 			} else if (search&&col.equals("all")){
 				dto.setTitle(dto.getTitle().replace
 						(word, "<span style='color:red;" + "background-color:yellow;'>" + word + "</span>"));
 			}
 			
 			// 새글 ? 답변글 ?
 			int depth = Integer.parseInt(dto.getDepth());
 			
 			if (depth > 0) {
 				// 답변 글이라면..
 				dto.setDepthSpan("<span style='display:inline-block; width:" + (15*depth) + "px;'></span>▶");
 				
 			}
 		}
 		
 		// F5에 의한 조회수 증가 방지
 		req.getSession().setAttribute("read", "n");
 				
 		// 검색중이면 몇건이 검색되었다 알려준다.
 		if (search) {
 			req.setAttribute("col", col);
 			req.setAttribute("word", word);
 			req.setAttribute("search", search);			
 		}		
 		// list() or search() 의 결과가 없을 경우.. 없다라 알려준다.
 		if (list.size() == 0) {
 			req.setAttribute("size", 0);
 		}
 		
 		
 		
 		// 페이징 -> 페이지 바에 관련된 작업
 		
 		// 1. 총 게시물 수
 		// 2. 총 페이지 수
 	
 		HashMap<String, Integer> map = dao.getPage(pageSize);
 				
 		req.setAttribute("total", map.get("total"));
 		req.setAttribute("pages", map.get("pages"));
 				
 		// 페이지바에 들어갈 태그들을 이곳에 작업
 		String pageBar = "";
 				
 		int blockSize = 10; // 페이지바의 페이지 제한갯수
 		System.out.println(map.get("total"));
 		totalCount = map.get("total");
 		totalPage = map.get("pages");
 				
 		
 		loop = 1;
 		temp2 = ((nowPage - 1) / blockSize) * blockSize + 1; // 출력 페이지 번호
 				
 		// 이전 10 페이지
 		if (temp2 == 1) { 
 			// 현재 페이지가 첫번째 블럭이냐 ?
 			pageBar += String.format("<img src='Trip/images/left.JPG' alt='이전'"
 			+ " style='cursor: pointer; width: 10px; height:10px; padding-right: 10px;'/>", blockSize);
 		} else {
 			// 반대
 			pageBar += String.format("<a href='/FridayTrip/FreeList.do?"
 			+ "page=%d'><img src='Trip/images/left.JPG' alt='이전'"
 			+ " style='cursor: pointer; width: 10px; height:10px; padding-right: 10px;'/></a>", (temp2-1), blockSize);			
 		}
 				
 		while (!(loop > blockSize || temp2 > totalPage)) {
 			if (temp2 == nowPage) { // 현재 페이지
 				pageBar += String.format("<b>&nbsp;&nbsp; %d &nbsp; &nbsp;</b>", temp2);
 			} else { // 다른 페이지
 				pageBar += String.format("<a href='/FridayTrip/FreeList.do?page=%d'>%d</a>", temp2, temp2);
 			}
 			loop++;
 			temp2++;
 		}
 				
 		// 다음 10 페이지
 		if (temp2 > totalPage) {
 			// 마지막 블럭에 속한 페이지(끝페이지)
 			pageBar += String.format("<img src='Trip/images/right.JPG' alt='다음'"
 			+ " style='cursor: pointer; width: 10px; height:10px; padding-left: 10px;'/>", blockSize);
 		} else {
 			// 마지막 블럭에 속하지 않은 페이지
 			pageBar += String.format("<a href='/FridayTrip/FreeList.do?"
 					+ "page=%d'><img src='Trip/images/right.JPG' alt='다음'"
 			+ " style='cursor: pointer; width: 10px; height:10px; padding-left: 10px;'/></a>", temp2, blockSize);
 		}
 		
 		req.setAttribute("nowPage", nowPage);
 		req.setAttribute("pageBar", pageBar);
 		req.setAttribute("me", me);
 		req.setAttribute("list", list);
 		
 		RequestDispatcher dispatcher = req.getRequestDispatcher("/Trip/List.jsp");
 		dispatcher.forward(req, resp);
    }
}
