package com.Coin;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Coinre extends HttpServlet{
@Override
protected void doGet(HttpServletRequest req, HttpServletResponse resp)
		throws ServletException, IOException {
	//결재내역
	HttpSession session = req.getSession();
	
	CoinreDAO dao=new CoinreDAO();
	ArrayList<CoinreDTO> list=dao.list();
	System.out.println(list.size());
	req.setAttribute("list",list);
	
	
	RequestDispatcher dispatcher=req.getRequestDispatcher("/Trip/Coinre.jsp");
	dispatcher.forward(req,resp);
        }
}
