package com.trip;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class MemberDAO {
	private Connection con = null;
	private Statement stat = null;
	
	public MemberDAO(){
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
	
	public MemberDTO list(String id){
		MemberDTO mdto = new MemberDTO();
		try {
			String sql = String.format("select * from tMember where id = '%s'", id);
			ResultSet rs = stat.executeQuery(sql);
			
			if(rs.next()){
				mdto.setSeq(rs.getString("seq"));
				mdto.setName(rs.getString("name"));
				mdto.setId(rs.getString("id"));
				mdto.setPw(rs.getString("pw"));
				mdto.setBirth(rs.getString("birth"));
				mdto.setAddress(rs.getString("address"));
				mdto.setTel(rs.getString("tel"));
				mdto.setGender(rs.getString("gender"));
				mdto.setImg(rs.getString("img"));
				mdto.setLv(rs.getString("lv"));
				mdto.setCoin(rs.getInt("coin"));
			}
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return mdto;
	}
	
	public void updatecoin(String id, int coin){
		try {
			String sql = String.format("update tMember set coin = %d where id = '%s'", coin, id);
			stat.executeUpdate(sql);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
	}
}
