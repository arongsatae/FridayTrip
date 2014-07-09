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
		
		// �˻� ���� ���� �ޱ�
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
		
		// id �˻��� �̸�&�����ȣ ������
		FreeListDTO me = dao.me(id);
		
		// �� ī��Ʈ
		String read = ""; 
		
		if (session.getAttribute("read") != null) {
			read = session.getAttribute("read").toString();			
		}
		if (read.equals("n") || read == "") {   // ���ã�� �� ����Ʈ ���ٰ� �ٽ� �»�� ī����+1
			dao.addCount(seq);
			session.setAttribute("read", "y");
		}
		FreeListDTO dto = dao.view(seq); // �� �����ֱ�
		// �� ī��Ʈ ��
		
		// �˻��� : �����߿� �˻����̶�� �� ����
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
		
		// ��� ��� ����
		FreeCommentDAO cdao = new FreeCommentDAO();
		ArrayList<FreeCommentDTO> clist = cdao.list(seq); // �θ�� ��ȣ�� �������� select
		
		req.setAttribute("page", page);
		req.setAttribute("clist", clist);
		req.setAttribute("dto", dto);
		req.setAttribute("me", me);
		req.setAttribute("seq", seq);
		RequestDispatcher dispatcher = req.getRequestDispatcher("/Trip/FreeView.jsp");
		dispatcher.forward(req, resp);
		
	}
}
