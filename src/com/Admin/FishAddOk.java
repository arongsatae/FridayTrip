package com.Admin;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class FishAddOk extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");

		String uploadPath = req.getRealPath("Trip/files");

		int size = 1024 * 1024 * 10;

		MultipartRequest multi = new MultipartRequest(req, uploadPath, size,
				"UTF-8", new DefaultFileRenamePolicy());

		String seq = "";
		String name = "";
		String fishing="";
		String content = "";
		String subcontent = "";
		String days = "";
		String starts = "";
		String ends = "";
		String coin = "";
		String appstart = "";
		String appends = "";
		String img = "";
		String count="";
		String total="";

		try {
			seq = multi.getParameter("seq");
			name = multi.getParameter("name");
			fishing=multi.getParameter("fishing");
			content = multi.getParameter("content");
			subcontent = multi.getParameter("subcontent");
			days = multi.getParameter("days");
			starts = multi.getParameter("starts");
			ends = multi.getParameter("ends");
			coin = multi.getParameter("coin");
			appstart = multi.getParameter("appstart");
			appends = multi.getParameter("appends");
			   total=multi.getParameter("total");
			Enumeration files = multi.getFileNames();
			String file = (String) files.nextElement();
			img = multi.getFilesystemName(file);

		} catch (Exception e) {
			// TODO: handle exception
		}

		String temp = "";// 2014-05-01 -> 05-01-2014
		temp = starts.substring(5);
		temp += "-" + starts.substring(0, 4);

		System.out.println(temp);

		String temp2 = "";// 2014-05-01 -> 05-01-2014
		temp2 = ends.substring(5);
		temp2 += "-" + ends.substring(0, 4);
		System.out.println(temp2);

		String temp3 = "";// 2014-05-01 -> 05-01-2014
		temp3 = appstart.substring(5);
		temp3 += "-" + appstart.substring(0, 4);

		String temp4 = "";// 2014-05-01 -> 05-01-2014
		temp4 = appends.substring(5);
		temp4 += "-" + appends.substring(0, 4);

		PlaceAddDAO dao = new PlaceAddDAO();
		String pseq = dao.getSeq();

      FishDTO dto = new FishDTO();
		dto.setSeq(seq);
		dto.setPseq(pseq);
		dto.setName(name);
		dto.setFishing(fishing);
		dto.setSubcontent(subcontent);
		dto.setDays(days);
		dto.setStarts(temp);
		dto.setEnds(temp2);
		dto.setCoin(coin);
		dto.setAppstart(temp3);
		dto.setAppends(temp4);
		dto.setImg(img);
	       dto.setTotal(total);
	       dto.setCount(count);

		dao.in4(dto);

		RequestDispatcher dispatcher = req.getRequestDispatcher("/Trip/FishAddOk.jsp");

		dispatcher.forward(req, resp);

	}
}
