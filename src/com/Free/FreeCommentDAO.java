package com.Free;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class FreeCommentDAO {
	private Connection con = null;
	private Statement stat = null;

	// 초기화 작업
	public FreeCommentDAO() {

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
	public ArrayList<FreeCommentDTO> list(String seq) {
		 ArrayList<FreeCommentDTO> list = new  ArrayList<FreeCommentDTO>();
		 try {
			 String sql = "select * from tcomment c inner join tboard b on b.Seq  = c.boardSeq" 
					 	+ " inner join tmember m on m.seq = c.memseq where c.boardSeq "
					 	+ "= " + seq +" order by c.seq desc";
			 
				ResultSet rs = stat.executeQuery(sql);
					while (rs.next()) {
					// 레코드 1개  -> DTO 1개
					FreeCommentDTO dto = new FreeCommentDTO();
					dto.setSeq(rs.getString("seq"));
					dto.setName(rs.getString("name"));
					dto.setContent(rs.getString("content"));
					dto.setRegDate(rs.getDate("regDate"));
					dto.setPw(rs.getString("pw"));
					dto.setBoardSeq(rs.getString("boardseq"));
					dto.setMemSeq(rs.getString("memseq"));
		
					list.add(dto);

				}
		} catch (Exception e) {
			System.out.println(e.toString()+"댓글보기");
		}
		 
		return list;
	}
	
	// 댓글쓰기
	public void add(FreeCommentDTO dto) {
		try {
			String sql = String.format("insert into tComment(seq, content, regDate, count, boardSeq, memSeq, pw)"
					+ " values (tCommentSeq.nextVal, '%s', default, null, %s, %s, '%s')",dto.getContent()
					, dto.getBoardSeq() , dto.getMemSeq(), dto.getPw());
			
			stat.executeUpdate(sql);
			
		} catch (Exception e) {
			System.out.println(e.toString() + "댓글쓰기");
		}
	}
	
	// 댓글 암호 확인
	public boolean check(String boardseq, String pw) {
		boolean result = false;
		
		try {
			String sql = String.format("select count(*) as cnt from tComment "
					+ "where seq = %s and pw = '%s'", boardseq, pw);
			// 암호 맞으면 1 틀리면 0
	
			ResultSet rs = stat.executeQuery(sql);
			
			System.out.println(sql);
			
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
			String sql = "delete from tComment where seq = " + seq; 
			System.out.println(sql);
			stat.executeUpdate(sql);
			
			System.out.println(sql);
			
		} catch (Exception e) {
			System.out.println(e.toString()+"댓글삭제");
		}
	}
	
	// 게시글 삭제시 전체 댓글 삭제
	public void delAll(String boardseq) {
		try {
			String sql = "delete from tComment where boardSeq =" + boardseq; // 부모글 번호를 조건설정
			
			stat.executeUpdate(sql);
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
	}
} // 끝
