package com.qa;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class QA extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
    		throws ServletException, IOException {
      //��Ű�� �̸��� com.XXX�� �����ؿ� ^^ 

		RequestDispatcher dispatcher=req.getRequestDispatcher("/Trip/QandA1.jsp");
		dispatcher.forward(req,resp);
    }
}
