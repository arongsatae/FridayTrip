package com.Admin;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;


public class PlaceAddDAO {
	private Connection con = null;
	private Statement stat = null;

		public PlaceAddDAO() {
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

		public void add(PlaceAddDTO dto) {
			
			try {
				String sql=String.format("insert into tPlace(seq,name) values(tplaceSeq.nextVal,'%s')",dto.getName());
				
				stat.executeQuery(sql);
			} catch (Exception e) {
			  // TODO: handle exception
				System.out.println(e.toString());
			}
		}
		

		public String getSeq() {
			 String seq = "";
			  
			  try {
				String sql=String.format("select * from tPlace order by seq desc");
				
				ResultSet rs=stat.executeQuery(sql);
				
				if (rs.next()) {
					seq = rs.getString("seq");
				}
			} catch (Exception e) {
				// TODO: handle exception
			}
			 return seq;
		}

		public void in(TripBicycleDTO dto) {
			try {
				String sql=String.format("insert into tBike(seq,name,content,subcontent,days,starts,ends,coin,appstart,appends,img,count,total,placeSeq) values(tbikeseq.nextVal,'%s','%s','%s',%s,TO_DATE('%s','MM-DD-YYYY'),TO_DATE('%s','MM-DD-YYYY'),%s,TO_DATE('%s','MM-DD-YYYY'),TO_DATE('%s','MM-DD-YYYY'),'%s',default,%s,%s)",dto.getName(),dto.getContent(),dto.getSubcontent(),dto.getDays(),dto.getStarts(),dto.getEnds(),dto.getCoin(),dto.getAppstart(),dto.getAppends(),dto.getImg(),dto.getTotal(),dto.getPseq());
				System.out.println(sql);
				stat.executeQuery(sql);
			} catch (Exception e) {
			  // TODO: handle exception
				System.out.println("자전거여행 추가 에러"+e.toString());
			}
			
		}

		public void in2(FoodDTO dto) {
			try {
				String sql=String.format("insert into tFood(seq,name,content,subcontent,days,starts,ends,coin,appstart,appends,img,count,total,placeSeq) values(tfoodseq.nextVal,'%s','%s','%s',%s,TO_DATE('%s','MM-DD-YYYY'),TO_DATE('%s','MM-DD-YYYY'),%s,TO_DATE('%s','MM-DD-YYYY'),TO_DATE('%s','MM-DD-YYYY'),'%s',default,%s,%s)",dto.getName(),dto.getContent(),dto.getSubcontent(),dto.getDays(),dto.getStarts(),dto.getEnds(),dto.getCoin(),dto.getAppstart(),dto.getAppends(),dto.getImg(),dto.getTotal(),dto.getPseq());
				System.out.println(sql);
				stat.executeQuery(sql);
			} catch (Exception e) {
			  // TODO: handle exception
				System.out.println("맛집여행추가에러"+e.toString());
			}
			
		}

		public void in3(LocalDTO dto) {
		  
			try {
				String sql=String.format("insert into tLocal(seq,name,content,subcontent,days,starts,ends,coin,appstart,appends,img,count,total,placeSeq) values(tlocalseq.nextVal,'%s','%s','%s',%s,TO_DATE('%s','MM-DD-YYYY'),TO_DATE('%s','MM-DD-YYYY'),%s,TO_DATE('%s','MM-DD-YYYY'),TO_DATE('%s','MM-DD-YYYY'),'%s',default,%s,%s)",dto.getName(),dto.getContent(),dto.getSubcontent(),dto.getDays(),dto.getStarts(),dto.getEnds(),dto.getCoin(),dto.getAppstart(),dto.getAppends(),dto.getImg(),dto.getTotal(),dto.getPseq());
				System.out.println(sql);
				stat.executeQuery(sql);
			} catch (Exception e) {
			  // TODO: handle exception
				System.out.println("지역여행추가에러"+e.toString());
			}
			
			
		}

		public void in4(FishDTO dto) {
		
			try {
				String sql=String.format("insert into tFish(seq,name,fishing,content,subcontent,days,starts,ends,coin,appstart,appends,img,count,total,placeSeq) values(tfishseq.nextVal,'%s','%s','%s','%s',%s,TO_DATE('%s','MM-DD-YYYY'),TO_DATE('%s','MM-DD-YYYY'),%s,TO_DATE('%s','MM-DD-YYYY'),TO_DATE('%s','MM-DD-YYYY'),'%s',default,%s,%s)",dto.getName(),dto.getFishing(),dto.getContent(),dto.getSubcontent(),dto.getDays(),dto.getStarts(),dto.getEnds(),dto.getCoin(),dto.getAppstart(),dto.getAppends(),dto.getImg(),dto.getTotal(),dto.getPseq());
				System.out.println(sql);
				stat.executeQuery(sql);
			} catch (Exception e) {
			  // TODO: handle exception
				System.out.println("낚시여행추가에러"+e.toString());
			}
		}

		public void in5(MtDTO dto) {
			try {
				String sql=String.format("insert into tMt(seq,name,lv,content,subcontent,days,starts,ends,coin,appstart,appends,img,count,total,placeSeq) values(tmtseq.nextVal,'%s','%s','%s','%s',%s,TO_DATE('%s','MM-DD-YYYY'),TO_DATE('%s','MM-DD-YYYY'),%s,TO_DATE('%s','MM-DD-YYYY'),TO_DATE('%s','MM-DD-YYYY'),'%s',default,%s,%s)",dto.getName(),dto.getLv(),dto.getContent(),dto.getSubcontent(),dto.getDays(),dto.getStarts(),dto.getEnds(),dto.getCoin(),dto.getAppstart(),dto.getAppends(),dto.getImg(),dto.getTotal(),dto.getPseq());
				System.out.println(sql);
				stat.executeQuery(sql);
			} catch (Exception e) {
			  // TODO: handle exception
				System.out.println("등산여행 추가에러"+e.toString());
			}
			
		}
			
	}

