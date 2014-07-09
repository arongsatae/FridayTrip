package com.Coin;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

//근태 관리 DB 작업 담당자
public class CoinDAO {
	// 직원 관리 DB 작업
	private Connection con = null;
	private Statement stat = null;

	// 초기화 작업 - 생성자
	public CoinDAO() {
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

	/*
	 * public void in(String seq) {
	 * 
	 * 
	 * try { String sql=String.format(
	 * "insert into tblAttendance(seq,empSeq,\"in\",\"out\") values(attendanceSeq.nextVal,%s,sysdate,null)"
	 * ,seq);
	 * 
	 * stat.executeQuery(sql); } catch (Exception e) { // TODO: handle exception
	 * System.out.println(e.toString()); }
	 * 
	 * }
	 * 
	 * public void out(String seq) {
	 * 
	 * try { String sql=String.format(
	 * "update  tblAttendance set \"out\"=sysdate where empSeq=%s and to_char(\"in\",'YYYY-MM-DD')=to_char(sysdate,'YYYY-MM-DD')"
	 * ,seq);
	 * 
	 * stat.executeUpdate(sql); } catch (Exception e) {
	 * System.out.println(e.toString()); } }
	 */

	// 근태 정보 리스트 반환
	public ArrayList<CoinDTO> list() {
		ArrayList<CoinDTO> list = new ArrayList<CoinDTO>();

		try {
			String sql = String.format("select*from tAddcoin");

			ResultSet rs = stat.executeQuery(sql);

			while (rs.next()) {
				CoinDTO dto = new CoinDTO();
				dto.setCoin(rs.getString("coin"));
				dto.setMemSeq(rs.getString("memseq"));
				dto.setRegDate(rs.getString("regdate"));
				dto.setSeq(rs.getString("seq"));

				list.add(dto);
			}
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}
	
	//코인충전기록 남기기
	public void add(String seq, String coin) {
		try {
			String sql = String.format("insert into tAddcoin (seq, coin, regDate, memSeq) values (taddcoinSeq.nextVal, %s, default, %s)", coin, seq);
			stat.executeUpdate(sql);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
	}

}