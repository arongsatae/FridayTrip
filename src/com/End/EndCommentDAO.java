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

	// �ʱ�ȭ �۾�
	public EndCommentDAO() {

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
	public ArrayList<EndCommentDTO> list(String seq) {
		 ArrayList<EndCommentDTO> list = new  ArrayList<EndCommentDTO>();
		 try {
			 String sql = "select * from tEComment c inner join tTravelEpil b on b.Seq  = c.txtSeq "
			 		+ "inner join tmember m on m.seq = c.memseq where c.txtSeq="
			 		+ "" + seq + " order by c.seq desc";
			 
				ResultSet rs = stat.executeQuery(sql);
					while (rs.next()) {
					// ���ڵ� 1��  -> DTO 1��
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
			System.out.println(e.toString()+"��ۺ���");
		}
		 
		return list;
	}
	
	// ��۾���
	public void add(EndCommentDTO dto) {
		try {
			String sql = String.format("insert into tEComment(seq, content, regDate, count, pw, txtSeq, memSeq) "
					+ "values (tECommentSeq.nextVal, '%s', default, null, %s, %s, '%s')",dto.getContent()
					, dto.getPw(), dto.getTxtSeq() , dto.getMemSeq());

			stat.executeUpdate(sql);
			
		} catch (Exception e) {
			System.out.println(e.toString() + "��۾���");
		}
	}
	
	// ��� ��ȣ Ȯ��
	public boolean check(String txtseq, String pw) {
		boolean result = false;
		
		try {
			String sql = String.format("select count(*) as cnt from tEComment "
					+ "where seq = %s and pw = '%s'", txtseq, pw);
			// ��ȣ ������ 1 Ʋ���� 0
	
			ResultSet rs = stat.executeQuery(sql);

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
			String sql = "delete from tEComment where seq = " + seq; 

			stat.executeUpdate(sql);
		
		} catch (Exception e) {
			System.out.println(e.toString()+"��ۻ���");
		}
	}
	
	// �Խñ� ������ ��ü ��� ����
	public void delAll(String txtseq) {
		try {
			String sql = "delete from tEComment where txtSeq =" + txtseq; // �θ�� ��ȣ�� ���Ǽ���
			
			stat.executeUpdate(sql);
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
	}
}
