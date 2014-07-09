package com.DB;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBUtil {
	public static Connection connect() {
		Connection con = null;

		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String id = "system";
		String pw = "java1234";

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection(url, id, pw);

		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return con;
	}
}
