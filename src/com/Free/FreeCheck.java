package com.Free;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class FreeCheck extends HttpServlet {

		@Override
		protected void doGet(HttpServletRequest req, HttpServletResponse resp)
				throws ServletException, IOException {
			
			String seq = req.getParameter("seq");

			
			String page = req.getParameter("page");
			
			req.setAttribute("page", page);
			req.setAttribute("seq", seq);
			RequestDispatcher dispatcher = req.getRequestDispatcher("/Trip/FreeCheck.jsp");
			dispatcher.forward(req, resp);
		}
	}

