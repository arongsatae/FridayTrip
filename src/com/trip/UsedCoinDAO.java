package com.trip;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

public class UsedCoinDAO {
	private Connection con = null;
	private Statement stat = null;
	
	public UsedCoinDAO(){
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

	public void used(String mSeq, String useCoin, String tSeq, int clsNum) {
		try {
			String sql = String.format("insert into tUsedcoin (seq, regDate, coin, memSeq, appNum, travName) values(tusedcoinSeq.nextVal, default, %s, %s, %s, %d)",useCoin, mSeq, tSeq, clsNum);
			stat.executeUpdate(sql);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
	}
}
