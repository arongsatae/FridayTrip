package com.Coin;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Coin extends HttpServlet{
@Override
protected void doGet(HttpServletRequest req, HttpServletResponse resp)
		throws ServletException, IOException {
	
	// 충전내역 
	HttpSession session = req.getSession();
	String id = session.getAttribute("id").toString();
	
	//회원 seq 얻기
	MemberDAO mdao = new MemberDAO();
	MemberDTO dto = mdao.view(id);
	
	req.setAttribute("dto", dto);
	CoinDAO dao=new CoinDAO();
	ArrayList<CoinDTO> list=dao.list();
	//System.out.println(list.size());
	req.setAttribute("list",list);
	
	
	RequestDispatcher dispatcher=req.getRequestDispatcher("/Trip/Coin.jsp");
	dispatcher.forward(req,resp);
        }
}
