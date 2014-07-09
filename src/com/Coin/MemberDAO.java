package com.Coin;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class MemberDAO {
	   private Connection con = null;
	   private Statement stat = null;
	   
	   public MemberDAO() {
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String id = "system";
			String pw = "java1234";
			   
	      try {
	         Class.forName("oracle.jdbc.driver.OracleDriver");
	         // DB ¿¬°á
	         con = DriverManager.getConnection(url, id, pw);
	         stat = con.createStatement();

	      } catch (Exception e) {
	         System.out.println(e.toString());
	      }
	   }

	public void edit(String seq, String rbs) {
		  try {
			   //System.out.println(seq);
			   //System.out.println(rbs);
			   String sql=String.format("update tMember set coin= coin+%s where seq=%s",rbs, seq);
			   stat.executeUpdate(sql);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
	}

	public MemberDTO view(String id) {
		MemberDTO dto = new MemberDTO();
		try {
			String sql = String.format("select * from tMember where id = '%s'", id);
			ResultSet rs = stat.executeQuery(sql);
			
			if(rs.next()){
				dto.setSeq(rs.getString("seq"));
				dto.setName(rs.getString("name"));
			}
		} catch (Exception e) {
			System.out.println();
		}
		return dto;
	}
	   
	   
	   
}
