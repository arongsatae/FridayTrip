package com.Admin;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

public class EpilogueDAO {
       
	private Connection con = null;
	private Statement stat = null;

		public EpilogueDAO() {
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
}
