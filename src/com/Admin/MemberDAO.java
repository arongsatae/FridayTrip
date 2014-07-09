package com.Admin;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;




public class MemberDAO {
    
	private Connection con = null;
	private Statement stat = null;

		public MemberDAO() {
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
		
		
		public ArrayList<MemberDTO> list() {
			ArrayList<MemberDTO> list = new ArrayList<MemberDTO>();
			
			try {
			
				String sql = String.format("select seq,name,id,pw,birth,address,tel,gender,img,lv,coin,before,after from tMember");
				System.out.println(sql);
				ResultSet rs = stat.executeQuery(sql);
			
				while (rs.next()) {
				
					MemberDTO dto = new MemberDTO();
                      dto.setSeq(rs.getString("seq"));
                      dto.setName(rs.getString("name"));
                      dto.setImg(rs.getString("img"));
                     dto.setId(rs.getString("id"));
                     dto.setPw(rs.getString("pw"));
                     dto.setLv(rs.getString("lv"));
                     dto.setTel(rs.getString("tel"));
                     dto.setBirth(rs.getString("birth"));
                     dto.setBefore(rs.getString("before"));
                     dto.setAddress(rs.getString("address"));
                     dto.setAfter(rs.getString("after"));
                     dto.setGender(rs.getString("gender"));
                     dto.setCoin(rs.getString("coin"));
					list.add(dto); 
					System.out.println(rs.getString("seq"));
				}
				
			} catch (Exception e) {
				// TODO: handle exception
				System.out.println(e.toString());
			}
			
			return list;
			
		}


		public void del(String seq) {  
			try {
				
				String sql = "delete from tMember where seq = " + seq;
				stat.executeUpdate(sql);
				System.out.println(sql);
				
			} catch (Exception e) {
				System.out.println(e.toString());
			}
		}


		public MemberDTO modify(String seq) {
			MemberDTO dto = new MemberDTO();
			
			try {
				String sql = "select * from tMember where seq = " + seq;
				System.out.println(sql);
				ResultSet rs = stat.executeQuery(sql);
				
				if (rs.next()) {
					//레코드 1개 -> DTO 1개
			         dto.setSeq(rs.getString("seq"));
                     dto.setName(rs.getString("name"));
                     dto.setImg(rs.getString("img"));
                    dto.setId(rs.getString("id"));
                    dto.setPw(rs.getString("pw"));
                    dto.setLv(rs.getString("lv"));
                    dto.setTel(rs.getString("tel"));
                    dto.setBirth(rs.getString("birth"));
                    dto.setBefore(rs.getString("before"));
                    dto.setAddress(rs.getString("address"));
                    dto.setAfter(rs.getString("after"));
                    dto.setGender(rs.getString("gender"));
                    dto.setCoin(rs.getString("coin"));
                    
                    /*dto.setAfter(getideal(seq));*/
				}
				
				
				
				
			} catch (Exception e) {
				System.out.println(e.toString());
			}
			
			return dto;
		}


		public void edit(MemberDTO dto) {
			try {
				
				String sql = String.format("update tMember set name = '%s',id = '%s',birth = '%s', address= '%s', lv='%s',coin=%s,before = '%s',after='%s' where seq = %s",
						dto.getName(),
						dto.getId(),
						dto.getBirth(),
						dto.getAddress(),
						dto.getLv(),
						dto.getCoin(),
						dto.getBefore(),
						dto.getAfter(),
						dto.getSeq());
				System.out.println("update : " + sql);
				stat.executeUpdate(sql);
				
			} catch (Exception e) {
				System.out.println(e.toString());
			}
		}


		public String getSeq(String id) {
			 String seq = "";
			  
			  try {
				String sql=String.format("select seq from tMember where id='%s'",id);
				
				ResultSet rs=stat.executeQuery(sql);
				
				if (rs.next()) {
					seq = rs.getString("seq");
				}
			} catch (Exception e) {
				// TODO: handle exception
			}
			 return seq;
		}


		public void in(EpilogueDTO dto) {
		         try {
					String sql=String.format("insert into tEpilogue(seq, memSeq, ideal, count, etc) values(tEpilogueSeq.nextval, %s, '%s', %s, '%s')",dto.getSeq(),dto.getIdeal(),dto.getCount(),dto.getEtc());
					System.out.println(sql);
					stat.executeQuery(sql);
					
					
				} catch (Exception e) {
					System.out.println(e.toString());
				}
			
		}


		public String getideal(String seq) {
			String ideal="";
			try {
				String sql=String.format(" select ideal from TEpilogue where memseq=%s",seq);
		
	      ResultSet rs=stat.executeQuery(sql);
				
				if (rs.next()) {
					ideal = rs.getString("ideal");
				}
			} catch (Exception e) {
				// TODO: handle exception
			}
			return ideal;
		}
		
		
}
