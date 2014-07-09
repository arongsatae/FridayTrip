package com.trip;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class AppDAO {
	private Connection con = null;
	private Statement stat = null;
	
	public AppDAO(){
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
	public void add(String mSeq, String Tseq, int coin, String app){
		try {
			String sql = String.format("insert into %s (seq, memSeq, travelSeq, coin, state) values (tappfishSeq.nextVal, %s, %s, %d, '결제완료')", app, mSeq, Tseq, coin);
			
			stat.executeUpdate(sql);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
	}
	public boolean check(String id, String Tseq, String tblName){
		boolean check = false;
		try {
			String sql = String.format("select count(*) as cnt from (select m.seq, m.name, m.id, f.seq, f.travelseq as from tMember m inner join %s f on m.seq = f.memSeq where id='%s' and f.travelseq = %s)", tblName, id, Tseq);
			
			ResultSet rs = stat.executeQuery(sql);
			if(rs.next()){
				if(rs.getString("cnt").equals("1"))
					check = true;
			}
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return check;
	}
}
