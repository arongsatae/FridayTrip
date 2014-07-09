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

		
		// ���� & �亯 �� ó��
		// -> thread �� depth ���� �Է��ϱ�
		int thread = -1;
		int depth = -1;
		
		// �θ� ������ ����? �亯��?
		if (req.getParameter("thread").isEmpty() && req.getParameter("depth").isEmpty()) {
			// ������ thread �� +1000 �ϱ�
			thread = dao.getThread(); // ������ thread
			
			// ������ depth �� 0�� ����
			depth = 0;
		} else {
			// �亯
			
			// 1��° ���� : ���� ��� thread �۰� �θ� thread �� ���� 
			// �θ���� thread? depth?
			int parentThread = Integer.parseInt(req.getParameter("thread"));
			int parentDepth = Integer.parseInt(req.getParameter("depth"));
			
			// ���� ������ thread (2000 - 1000 = 1000 �̷� �� ��� ����)
			int prevThread = (int)Math.floor((parentThread -1) / 1000) * 1000;
			
			// ����
			dao.updateThread(parentThread, prevThread);
			
			// 2��° ���� : ���� �亯���� thread ���� �θ� thread - 1
			thread = parentThread - 1;
			
			// 3��° ���� : ���� �亯���� depth ���� �θ𰪺��� +1 
			depth = parentDepth +1;
		}
		
		dto.setThread(String.valueOf(thread));
		dto.setDepth(String.valueOf(depth));
		
		// 3.
		dao.add(dto); // �۾��� ����
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/Trip/FreeWriteOk.jsp");
		dispatcher.forward(req, resp);
	}
}
