package com.board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class CommentDAO {
	
	private Connection con = null;
	private Statement stat = null;

	// �ʱ�ȭ �۾� - ������
	public CommentDAO() {
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String id = "system";
		String pw = "java1234";

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			// DB ����
			con = DriverManager.getConnection(url, id, pw);
			stat = con.createStatement();

		} catch (Exception e) {
			System.out.println(e.toString());
		}
	}
	
	// ��� ����
		public ArrayList<CommentDTO> list(String seq) {
			 ArrayList<CommentDTO> list = new  ArrayList<CommentDTO>();
			 try {
				 String sql = "select * from tReComment c inner join tRecruit b on b.Seq  = c.boardSeq" 
						 	+ " inner join tmember m on m.seq = c.memseq where c.boardSeq "
						 	+ "= " + seq +" order by c.seq desc";
				 
					ResultSet rs = stat.executeQuery(sql);
						while (rs.next()) {
						// ���ڵ� 1��  -> DTO 1��
					  CommentDTO dto = new CommentDTO();
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
				System.out.println(e.toString()+"��ۺ���");
			}
			 
			return list;
		}
		
		// ��۾���
		public void add(CommentDTO dto) {
			try {
				String sql = String.format("insert into tReComment(seq, content, regDate, count, boardSeq, memSeq, pw)"
						+ " values (treCommentSeq.nextVal, '%s', default,null,%s, %s, '%s')",dto.getContent()
						, dto.getBoardSeq() , dto.getMemSeq(), dto.getPw());
				System.out.println(sql);
				stat.executeUpdate(sql);
				
			} catch (Exception e) {
				System.out.println(e.toString() + "��۾���");
			}
		}
		
		// ��� ��ȣ Ȯ��
		public boolean check(String boardseq, String pw) {
			boolean result = false;
			
			try {
				String sql = String.format("select count(*) as cnt from tReComment "
						+ "where seq = %s and pw = '%s'", boardseq, pw);
				// ��ȣ ������ 1 Ʋ���� 0
		
				ResultSet rs = stat.executeQuery(sql);
				
				System.out.println(sql);
				
				if (rs.next()) {
					if (rs.getString("cnt").equals("1")) {
						result = true; // ��ȣ��ġ
					}
				}
				
			} catch (Exception e) {
				System.out.println(e.toString()+"��۾�ȣȮ��");
			}
			
			return result;
		}
		
		// ��� ����
		public void del(String seq) {
			try {
				String sql = "delete from tReComment where seq = " + seq; 
				stat.executeUpdate(sql);
				
				System.out.println(sql);
				
			} catch (Exception e) {
				System.out.println(e.toString()+"��ۻ���");
			}
		}
		
		// �Խñ� ������ ��ü ��� ����
		public void delAll(String boardseq) {
			try {
				String sql = "delete from tReComment where boardSeq =" + boardseq; // �θ�� ��ȣ�� ���Ǽ���
				
				stat.executeUpdate(sql);
				
			} catch (Exception e) {
				System.out.println(e.toString());
			}
			
		}
}
