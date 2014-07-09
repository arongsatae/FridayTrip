package com.End;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.Free.FreeCommentDTO;

public class EndCommentDAO {
	private Connection con = null;
	private Statement stat = null;

	// 초기화 작업
	public EndCommentDAO() {

		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String id = "system";
		String pw = "java1234";

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");

			// DB 연결
			con = DriverManager.getConnection(url, id, pw);

			stat = con.createStatement();

		} catch (Exception e) {
			System.out.println(e.toString());
		}
	}
	
	// 댓글 보기
	public ArrayList<EndCommentDTO> list(String seq) {
		 ArrayList<EndCommentDTO> list = new  ArrayList<EndCommentDTO>();
		 try {
			 String sql = "select * from tEComment c inner join tTravelEpil b on b.Seq  = c.txtSeq "
			 		+ "inner join tmember m on m.seq = c.memseq where c.txtSeq="
			 		+ "" + seq + " order by c.seq desc";
			 
				ResultSet rs = stat.executeQuery(sql);
					while (rs.next()) {
					// 레코드 1개  -> DTO 1개
						EndCommentDTO dto = new EndCommentDTO();
					dto.setSeq(rs.getString("seq"));
					dto.setName(rs.getString("name"));
					dto.setContent(rs.getString("content"));
					dto.setRegDate(rs.getDate("regDate"));
					dto.setPw(rs.getString("pw"));
					dto.setTxtSeq(rs.getString("txtseq"));
					dto.setMemSeq(rs.getString("memseq"));
					
					list.add(dto);

				}
		} catch (Exception e) {
			System.out.println(e.toString()+"댓글보기");
		}
		 
		return list;
	}
	
	// 댓글쓰기
	public void add(EndCommentDTO dto) {
		try {
			String sql = String.format("insert into tEComment(seq, content, regDate, count, pw, txtSeq, memSeq) "
					+ "values (tECommentSeq.nextVal, '%s', default, null, %s, %s, '%s')",dto.getContent()
					, dto.getPw(), dto.getTxtSeq() , dto.getMemSeq());

			stat.executeUpdate(sql);
			
		} catch (Exception e) {
			System.out.println(e.toString() + "댓글쓰기");
		}
	}
	
	// 댓글 암호 확인
	public boolean check(String txtseq, String pw) {
		boolean result = false;
		
		try {
			String sql = String.format("select count(*) as cnt from tEComment "
					+ "where seq = %s and pw = '%s'", txtseq, pw);
			// 암호 맞으면 1 틀리면 0
	
			ResultSet rs = stat.executeQuery(sql);

			if (rs.next()) {
				if (rs.getString("cnt").equals("1")) {
					result = true; // 암호일치
				}
			}
			
		} catch (Exception e) {
			System.out.println(e.toString()+"댓글암호확인");
		}
		
		return result;
	}
	
	// 댓글 삭제
	public void del(String seq) {
		try {
			String sql = "delete from tEComment where seq = " + seq; 

			stat.executeUpdate(sql);
		
		} catch (Exception e) {
			System.out.println(e.toString()+"댓글삭제");
		}
	}
	
	// 게시글 삭제시 전체 댓글 삭제
	public void delAll(String txtseq) {
		try {
			String sql = "delete from tEComment where txtSeq =" + txtseq; // 부모글 번호를 조건설정
			
			stat.executeUpdate(sql);
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
	}
}
