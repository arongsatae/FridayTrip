package com.qa;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class QA2 extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
    		throws ServletException, IOException {
      //패키지 이름은 com.XXX로 통일해용 ^^ 

		RequestDispatcher dispatcher=req.getRequestDispatcher("/Trip/QandA2.jsp");
		dispatcher.forward(req,resp);
    }
}
