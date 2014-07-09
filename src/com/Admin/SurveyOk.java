package com.Admin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SurveyOk extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");

		String id = req.getParameter("id");

		MemberDAO dao = new MemberDAO();
		String seq = dao.getSeq(id);

		req.setAttribute("seq", seq);

		RequestDispatcher dispatcher = req
				.getRequestDispatcher("/Trip/Admin.jsp");

		dispatcher.forward(req, resp);
	}
}
