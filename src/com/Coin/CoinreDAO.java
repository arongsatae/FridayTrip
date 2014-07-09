package com.Coin;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class CoinreDAO {

	private Connection con = null;
	private Statement stat = null;

	public CoinreDAO() {
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

	public ArrayList<CoinreDTO> list() {
		ArrayList<CoinreDTO> list = new ArrayList<CoinreDTO>();

		try {
			String sql = String.format("select*from tUsedcoin");

			ResultSet rs = stat.executeQuery(sql);

			while (rs.next()) {
				CoinreDTO dto = new CoinreDTO();
				dto.setSeq(rs.getString("seq"));
				dto.setRegDate(rs.getString("regdate"));
				dto.setCoin(rs.getString("coin"));
				dto.setMemSeq(rs.getString("memseq"));
				dto.setAppNum(rs.getString("appnum"));
				dto.setTravName(rs.getString("travname"));

				list.add(dto);
			}
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}
}
