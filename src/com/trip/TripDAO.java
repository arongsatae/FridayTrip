package com.trip;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class TripDAO {
	
	private Connection con = null;
	private Statement stat = null;
	
	public TripDAO(){
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
	
	//추천상품 가져오기
	public ArrayList<TripDTO> Bestlist(){
		ArrayList<TripDTO> list = new ArrayList<TripDTO>();
		
		try {
			String sql = "select * from tBike where seq=1";
			ResultSet rs = stat.executeQuery(sql);
			
			while(rs.next()){
				TripDTO dto  = new TripDTO();
				dto.setSeq(rs.getString("seq"));
				dto.setName(rs.getString("name"));
				dto.setContent(rs.getString("content"));
				dto.setSubcontent(rs.getString("subcontent"));
				dto.setDays(rs.getString("days"));
				dto.setStarts(rs.getDate("starts"));
				dto.setEnds(rs.getDate("ends"));
				dto.setCoin(rs.getInt("coin"));
				dto.setAppstart(rs.getDate("appstart"));
				dto.setAppends(rs.getDate("appends"));
				dto.setImg(rs.getString("img"));
				dto.setCount(rs.getInt("count"));
				dto.setTotal(rs.getInt("total"));
				list.add(dto);
			}		
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}
	
	//자전거 상품 가져오기
	public ArrayList<TripDTO> Bikelist(int num){
		ArrayList<TripDTO> list = new ArrayList<TripDTO>();
		
		try {
			if(num == 0){
				String sql = "select * from (select * from tBike order by rownum desc) where rownum = 1";
				ResultSet rs = stat.executeQuery(sql);
				while(rs.next()){
					TripDTO dto  = new TripDTO();
					dto.setSeq(rs.getString("seq"));
					dto.setName(rs.getString("name"));
					dto.setContent(rs.getString("content"));
					dto.setSubcontent(rs.getString("subcontent"));
					dto.setDays(rs.getString("days"));
					dto.setStarts(rs.getDate("starts"));
					dto.setEnds(rs.getDate("ends"));
					dto.setCoin(rs.getInt("coin"));
					dto.setAppstart(rs.getDate("appstart"));
					dto.setAppends(rs.getDate("appends"));
					dto.setImg(rs.getString("img"));
					dto.setCount(rs.getInt("count"));
					dto.setTotal(rs.getInt("total"));
					list.add(dto);
				}
			} else{
				String sql = "select * from tBike order by seq desc";
				ResultSet rs = stat.executeQuery(sql);
				while(rs.next()){
					TripDTO dto  = new TripDTO();
					dto.setSeq(rs.getString("seq"));
					dto.setName(rs.getString("name"));
					dto.setContent(rs.getString("content"));
					dto.setSubcontent(rs.getString("subcontent"));
					dto.setDays(rs.getString("days"));
					dto.setStarts(rs.getDate("starts"));
					dto.setEnds(rs.getDate("ends"));
					dto.setCoin(rs.getInt("coin"));
					dto.setAppstart(rs.getDate("appstart"));
					dto.setAppends(rs.getDate("appends"));
					dto.setImg(rs.getString("img"));
					dto.setCount(rs.getInt("count"));
					dto.setTotal(rs.getInt("total"));
					list.add(dto);
				}
			}
			
			
					
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}
	
	//맛집 상품가져 오기
	public ArrayList<TripDTO> Foodlist(int num){
		ArrayList<TripDTO> list = new ArrayList<TripDTO>();
		
		try {
			if(num == 0){
				String sql = "select * from (select * from tFood order by rownum desc) where rownum = 1";
				ResultSet rs = stat.executeQuery(sql);
				
				while(rs.next()){
					TripDTO dto  = new TripDTO();
					dto.setSeq(rs.getString("seq"));
					dto.setName(rs.getString("name"));
					dto.setContent(rs.getString("content"));
					dto.setSubcontent(rs.getString("subcontent"));
					dto.setDays(rs.getString("days"));
					dto.setStarts(rs.getDate("starts"));
					dto.setEnds(rs.getDate("ends"));
					dto.setCoin(rs.getInt("coin"));
					dto.setAppstart(rs.getDate("appstart"));
					dto.setAppends(rs.getDate("appends"));
					dto.setImg(rs.getString("img"));
					dto.setCount(rs.getInt("count"));
					dto.setTotal(rs.getInt("total"));
					list.add(dto);
				}
			}else{
				String sql = "select * from tFood order by seq desc";
				ResultSet rs = stat.executeQuery(sql);
				
				while(rs.next()){
					TripDTO dto  = new TripDTO();
					dto.setSeq(rs.getString("seq"));
					dto.setName(rs.getString("name"));
					dto.setContent(rs.getString("content"));
					dto.setSubcontent(rs.getString("subcontent"));
					dto.setDays(rs.getString("days"));
					dto.setStarts(rs.getDate("starts"));
					dto.setEnds(rs.getDate("ends"));
					dto.setCoin(rs.getInt("coin"));
					dto.setAppstart(rs.getDate("appstart"));
					dto.setAppends(rs.getDate("appends"));
					dto.setImg(rs.getString("img"));
					dto.setCount(rs.getInt("count"));
					dto.setTotal(rs.getInt("total"));
					list.add(dto);
			}
			
			}		
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}
	
	//낚시 상품 가져오기
	public ArrayList<TripDTO> Fishlist(int num){
		ArrayList<TripDTO> list = new ArrayList<TripDTO>();
		
		try {
			if(num == 0){
				String sql = "select * from (select * from tFish order by rownum desc) where rownum = 1";
				ResultSet rs = stat.executeQuery(sql);
				
				while(rs.next()){
					TripDTO dto  = new TripDTO();
					dto.setSeq(rs.getString("seq"));
					dto.setName(rs.getString("name"));
					dto.setContent(rs.getString("content"));
					dto.setSubcontent(rs.getString("subcontent"));
					dto.setDays(rs.getString("days"));
					dto.setStarts(rs.getDate("starts"));
					dto.setEnds(rs.getDate("ends"));
					dto.setCoin(rs.getInt("coin"));
					dto.setAppstart(rs.getDate("appstart"));
					dto.setAppends(rs.getDate("appends"));
					dto.setImg(rs.getString("img"));
					dto.setCount(rs.getInt("count"));
					dto.setTotal(rs.getInt("total"));
					list.add(dto);
				}		
			} else{
				
				String sql = "select * from tFish order by seq desc";
				ResultSet rs = stat.executeQuery(sql);
				
				while(rs.next()){
					TripDTO dto  = new TripDTO();
					dto.setSeq(rs.getString("seq"));
					dto.setName(rs.getString("name"));
					dto.setContent(rs.getString("content"));
					dto.setSubcontent(rs.getString("subcontent"));
					dto.setDays(rs.getString("days"));
					dto.setStarts(rs.getDate("starts"));
					dto.setEnds(rs.getDate("ends"));
					dto.setCoin(rs.getInt("coin"));
					dto.setAppstart(rs.getDate("appstart"));
					dto.setAppends(rs.getDate("appends"));
					dto.setImg(rs.getString("img"));
					dto.setCount(rs.getInt("count"));
					dto.setTotal(rs.getInt("total"));
					list.add(dto);
				}		
			}
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}
	
	//지역탐방 상품 가져오기
	public ArrayList<TripDTO> LocalTriplist(int num){
		ArrayList<TripDTO> list = new ArrayList<TripDTO>();
		
		try {
			if(num == 0){
				String sql = "select * from (select * from tLocal order by rownum desc) where rownum = 1";
				ResultSet rs = stat.executeQuery(sql);
				
				while(rs.next()){
					TripDTO dto  = new TripDTO();
					dto.setSeq(rs.getString("seq"));
					dto.setName(rs.getString("name"));
					dto.setContent(rs.getString("content"));
					dto.setSubcontent(rs.getString("subcontent"));
					dto.setDays(rs.getString("days"));
					dto.setStarts(rs.getDate("starts"));
					dto.setEnds(rs.getDate("ends"));
					dto.setCoin(rs.getInt("coin"));
					dto.setAppstart(rs.getDate("appstart"));
					dto.setAppends(rs.getDate("appends"));
					dto.setImg(rs.getString("img"));
					dto.setCount(rs.getInt("count"));
					dto.setTotal(rs.getInt("total"));
					list.add(dto);
				}		
			} else{
				String sql = "select * from tLocal order by seq desc";
				ResultSet rs = stat.executeQuery(sql);
				
				while(rs.next()){
					TripDTO dto  = new TripDTO();
					dto.setSeq(rs.getString("seq"));
					dto.setName(rs.getString("name"));
					dto.setContent(rs.getString("content"));
					dto.setSubcontent(rs.getString("subcontent"));
					dto.setDays(rs.getString("days"));
					dto.setStarts(rs.getDate("starts"));
					dto.setEnds(rs.getDate("ends"));
					dto.setCoin(rs.getInt("coin"));
					dto.setAppstart(rs.getDate("appstart"));
					dto.setAppends(rs.getDate("appends"));
					dto.setImg(rs.getString("img"));
					dto.setCount(rs.getInt("count"));
					dto.setTotal(rs.getInt("total"));
					list.add(dto);
				}	
			}
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}
	
	//등산 상품 가져오기
	public ArrayList<TripDTO> Mtlist(int num){
		ArrayList<TripDTO> list = new ArrayList<TripDTO>();
		
		try {
			if(num == 0){
				String sql = "select * from (select * from tMt order by rownum desc) where rownum = 1";
				ResultSet rs = stat.executeQuery(sql);
				
				while(rs.next()){
					TripDTO dto  = new TripDTO();
					dto.setSeq(rs.getString("seq"));
					dto.setName(rs.getString("name"));
					dto.setLv(rs.getString("lv"));
					dto.setContent(rs.getString("content"));
					dto.setSubcontent(rs.getString("subcontent"));
					dto.setDays(rs.getString("days"));
					dto.setStarts(rs.getDate("starts"));
					dto.setEnds(rs.getDate("ends"));
					dto.setCoin(rs.getInt("coin"));
					dto.setAppstart(rs.getDate("appstart"));
					dto.setAppends(rs.getDate("appends"));
					dto.setImg(rs.getString("img"));
					dto.setCount(rs.getInt("count"));
					dto.setTotal(rs.getInt("total"));
					list.add(dto);
				}		
			} else{
				String sql = "select * from tMt order by seq desc";
				ResultSet rs = stat.executeQuery(sql);
				
				while(rs.next()){
					TripDTO dto  = new TripDTO();
					dto.setSeq(rs.getString("seq"));
					dto.setName(rs.getString("name"));
					dto.setLv(rs.getString("lv"));
					dto.setContent(rs.getString("content"));
					dto.setSubcontent(rs.getString("subcontent"));
					dto.setDays(rs.getString("days"));
					dto.setStarts(rs.getDate("starts"));
					dto.setEnds(rs.getDate("ends"));
					dto.setCoin(rs.getInt("coin"));
					dto.setAppstart(rs.getDate("appstart"));
					dto.setAppends(rs.getDate("appends"));
					dto.setImg(rs.getString("img"));
					dto.setCount(rs.getInt("count"));
					dto.setTotal(rs.getInt("total"));
					list.add(dto);
				}		
			}
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}
	
	public TripDTO view(String seq, String table){
		TripDTO dto = new TripDTO();
		
		try {
			
			String tbl = "";
			
			if(table.equals("tBike")){
				tbl = "tBike";
			} else if (table.equals("tLocal")){
				tbl = "tLocal";
			} else if (table.equals("tFood")){
				tbl = "tFood";
			} else if (table.equals("tFish")){
				tbl = "tFish";
			} else {
				tbl = "tMt";
			}

			
			String sql = String.format("select * from %s where seq = %s",tbl, seq);
			ResultSet rs = stat.executeQuery(sql);
			
			if(tbl.equals("tMt")){
				if(rs.next()){
					dto.setSeq(rs.getString("seq"));
					dto.setName(rs.getString("name"));
					dto.setLv(rs.getString("lv"));
					dto.setContent(rs.getString("content"));
					dto.setSubcontent(rs.getString("subcontent"));
					dto.setDays(rs.getString("days"));
					dto.setStarts(rs.getDate("starts"));
					dto.setEnds(rs.getDate("ends"));
					dto.setCoin(rs.getInt("coin"));
					dto.setAppstart(rs.getDate("appstart"));
					dto.setAppends(rs.getDate("appends"));
					dto.setImg(rs.getString("img"));
					dto.setCount(rs.getInt("count"));
					dto.setTotal(rs.getInt("total"));
				}
			} else{
				if(rs.next()){
					dto.setSeq(rs.getString("seq"));
					dto.setName(rs.getString("name"));
					dto.setContent(rs.getString("content"));
					dto.setSubcontent(rs.getString("subcontent"));
					dto.setDays(rs.getString("days"));
					dto.setStarts(rs.getDate("starts"));
					dto.setEnds(rs.getDate("ends"));
					dto.setCoin(rs.getInt("coin"));
					dto.setAppstart(rs.getDate("appstart"));
					dto.setAppends(rs.getDate("appends"));
					dto.setImg(rs.getString("img"));
					dto.setCount(rs.getInt("count"));
					dto.setTotal(rs.getInt("total"));
				}
			}
			
				
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dto;
	}
	
	//참여인원 수 증가하기
	public void addCount(String seq, String table){
		try {
			String sql = String.format("update %s set count = count + 1 where seq = %s", table, seq);
			stat.executeUpdate(sql);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
	}
	
	//남자인원 수 가져오기
	public TripDTO man(String seq, String table, String app){
		TripDTO dto = new TripDTO();
		try {
			String sql = String.format("select count(*) as mcnt from(select * from tMember m inner join %s p on m.seq = p.memSeq inner join %s b on p.travelSeq = b.seq where m.gender = '남' and b.seq = %s)", app, table, seq);
			ResultSet rs = stat.executeQuery(sql);
			if(rs.next()){
				dto.setMcnt(rs.getString("mcnt"));
			}
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dto;
	}
	//여자인원 수 가져오기
		public TripDTO woman(String seq, String table, String app){
			TripDTO dto = new TripDTO();
			try {
				String sql = String.format("select count(*) as wcnt from(select * from tMember m inner join %s p on m.seq = p.memSeq inner join %s b on p.travelSeq = b.seq where m.gender = '여' and b.seq = %s)", app, table, seq);
				ResultSet rs = stat.executeQuery(sql);
				if(rs.next()){
					dto.setWcnt(rs.getString("wcnt"));
				}
			} catch (Exception e) {
				System.out.println(e.toString());
			}
			return dto;
		}
	
	
}
