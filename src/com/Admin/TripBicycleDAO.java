package com.Admin;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

public class TripBicycleDAO {
	// 직원 관리 DB 작업
	private Connection con = null;
	private Statement stat = null;

	// 초기화 작업 - 생성자
	public  TripBicycleDAO() {
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
}
