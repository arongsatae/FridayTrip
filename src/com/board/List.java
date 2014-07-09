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
    	 
   
 			
    		
 		// ����¡ ó��
 		int totalCount = 0; // �� �Խù��� 
 		int totalPage = 0; // ����������
 		int pageSize = 10; // �������� ��� �Խù���
 		int temp2 = 0, loop = 0;
 		int nowPage = 0;  // ���������� 
 		
 		if (req.getParameter("page") == null)
 			nowPage = 1;
 		else 
 			nowPage = Integer.parseInt(req.getParameter("page"));
 			
 		req.setAttribute("nowPage", nowPage);
 		
 		// nowPage�� pageSize �� ������ ����¡ ���� ��� (rnum�� �������� ����� ����)
 		int start = ((nowPage - 1) * pageSize) +1;
 		int end = start + pageSize -1;
 		
 		HttpSession session = req.getSession();
 		String id = session.getAttribute("id").toString();

 		BoardDAO dao = new BoardDAO();
 		// id �˻��� �̸�&�����ȣ ������
 		BoardDTO me = dao.me(id);
 		
 		boolean search = false; // �Ѿ�°��� �ּҰ� 1���ΰ� 2���ΰ� Ȯ��
 		String col = req.getParameter("col");
 		String word = req.getParameter("word");		
 		
 		if (col != null && word != null) {
 			search = true;	
 		}	
 			
 		String searchResult = "";

 		ArrayList<BoardDTO> list = dao.list(start, end); // ����Ʈ ���		
 		
 		if (search) {
 			list = dao.search(col, word, start, end); // �˻�
 			
 			searchResult = String.format("�˻��� : '%s' ���� �� %d ���� �˻�", word, list.size());
 			
 			req.setAttribute("searchResult", searchResult);
 		} else {
 			
 		}
 		for (int i=0; i<list.size(); i++) {
 			BoardDTO dto = list.get(i);//�Խù�1��
 			
 			// a. ������ ���.. �ڸ���
 			if (dto.getTitle().length() > 30) {
 				String temp = dto.getTitle().substring(0, 23) + "...";
 				
 				//�߶� ������ �����				
 				dto.setTitle(temp);			
 			}
 			
 			//b. �ֽű� ǥ���ϱ�(18�ð�)
 			Date regDate = dto.getRegDate();
 			Calendar now = Calendar.getInstance();
 			long span = now.getTime().getTime() - regDate.getTime();//�۾��� ���� �귯�� �ð�..
 			
 			if ((span / 1000 / 60 / 60) < 18) {
 				// �ֽű�... �� �̹���
 				dto.setNewImg("<img src='/FridayTrip/Trip/images/010.PNG' align='center'/>");
 			}	
 			
 			// �˻��� �˻��� ������ �˻� �ܾ ������ �ִ´�
 			if (search&&col.equals("title")){
 				dto.setTitle(dto.getTitle().replace
 						(word, "<span style='color:red;" + "background-color:yellow;'>" + word + "</span>"));
 			} else if (search&&col.equals("all")){
 				dto.setTitle(dto.getTitle().replace
 						(word, "<span style='color:red;" + "background-color:yellow;'>" + word + "</span>"));
 			}
 			
 			// ���� ? �亯�� ?
 			int depth = Integer.parseInt(dto.getDepth());
 			
 			if (depth > 0) {
 				// �亯 ���̶��..
 				dto.setDepthSpan("<span style='display:inline-block; width:" + (15*depth) + "px;'></span>��");
 				
 			}
 		}
 		
 		// F5�� ���� ��ȸ�� ���� ����
 		req.getSession().setAttribute("read", "n");
 				
 		// �˻����̸� ����� �˻��Ǿ��� �˷��ش�.
 		if (search) {
 			req.setAttribute("col", col);
 			req.setAttribute("word", word);
 			req.setAttribute("search", search);			
 		}		
 		// list() or search() �� ����� ���� ���.. ���ٶ� �˷��ش�.
 		if (list.size() == 0) {
 			req.setAttribute("size", 0);
 		}
 		
 		
 		
 		// ����¡ -> ������ �ٿ� ���õ� �۾�
 		
 		// 1. �� �Խù� ��
 		// 2. �� ������ ��
 	
 		HashMap<String, Integer> map = dao.getPage(pageSize);
 				
 		req.setAttribute("total", map.get("total"));
 		req.setAttribute("pages", map.get("pages"));
 				
 		// �������ٿ� �� �±׵��� �̰��� �۾�
 		String pageBar = "";
 				
 		int blockSize = 10; // ���������� ������ ���Ѱ���
 		System.out.println(map.get("total"));
 		totalCount = map.get("total");
 		totalPage = map.get("pages");
 				
 		
 		loop = 1;
 		temp2 = ((nowPage - 1) / blockSize) * blockSize + 1; // ��� ������ ��ȣ
 				
 		// ���� 10 ������
 		if (temp2 == 1) { 
 			// ���� �������� ù��° ���̳� ?
 			pageBar += String.format("<img src='Trip/images/left.JPG' alt='����'"
 			+ " style='cursor: pointer; width: 10px; height:10px; padding-right: 10px;'/>", blockSize);
 		} else {
 			// �ݴ�
 			pageBar += String.format("<a href='/FridayTrip/FreeList.do?"
 			+ "page=%d'><img src='Trip/images/left.JPG' alt='����'"
 			+ " style='cursor: pointer; width: 10px; height:10px; padding-right: 10px;'/></a>", (temp2-1), blockSize);			
 		}
 				
 		while (!(loop > blockSize || temp2 > totalPage)) {
 			if (temp2 == nowPage) { // ���� ������
 				pageBar += String.format("<b>&nbsp;&nbsp; %d &nbsp; &nbsp;</b>", temp2);
 			} else { // �ٸ� ������
 				pageBar += String.format("<a href='/FridayTrip/FreeList.do?page=%d'>%d</a>", temp2, temp2);
 			}
 			loop++;
 			temp2++;
 		}
 				
 		// ���� 10 ������
 		if (temp2 > totalPage) {
 			// ������ ���� ���� ������(��������)
 			pageBar += String.format("<img src='Trip/images/right.JPG' alt='����'"
 			+ " style='cursor: pointer; width: 10px; height:10px; padding-left: 10px;'/>", blockSize);
 		} else {
 			// ������ ���� ������ ���� ������
 			pageBar += String.format("<a href='/FridayTrip/FreeList.do?"
 					+ "page=%d'><img src='Trip/images/right.JPG' alt='����'"
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
