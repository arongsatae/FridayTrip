package com.main;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class TMemberDAO {

	
	private Connection con = null;
	private Statement stat = null;

	// db연동을 위한 생성자 작성
	
	public TMemberDAO() {
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
	
	
	
	//회원가입시 데이터베이스에 새로운 회원정보 추가하는 메서드
	public void TMemberAdd(TMemberDTO dto) {
		
		
		try {
			
			String sql = String.format("insert into tMember (seq, name, id, pw, birth, address, tel, gender, img, lv,  coin, before, after) values (tMemberSeq.nextVal, '%s', '%s', '%s', '%s', '%s', '%s', '%s','%s','%s', '%s', '%s', '%s')", dto.getName(), dto.getId(), dto.getPw(), dto.getBirth(), dto.getAddress(), dto.getTel(), dto.getGender(),dto.getImg(), dto.getLv(), dto.getCoin(), dto.getBefore(), dto.getAfter() );
			
			
			System.out.println(sql);//디버깅
			
			
			stat.executeUpdate(sql);
			
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
	}
	
	
	
	
	
	
	public String gettMemberseq(){
		
          String seq="";		

          
		try {
			
			String sql = "select max(seq) as seq from tmember order by seq desc";
			
			
			System.out.println(sql);//디버깅
			
			
			stat.executeUpdate(sql);
			
			ResultSet rs =stat.executeQuery(sql);
			
			while(rs.next() ){
				
				
				TMemberDTO dto = new TMemberDTO();
				
				dto.setSeq(rs.getString("seq"));
				
		        seq=dto.getSeq();		
				
				
			}
			
			
			
			
		} catch (Exception e) {
			System.out.println(e.toString());
			
		}
			
		return seq;	
	}
	
	
	
	
	
	
	
public void personTestAdd(personTestDTO dto) {
		
		
		try {
			
			String sql = String.format("insert into tCharacter (seq, memseq, passion, dic, friend, predict, saint, social) values (tCharacterSeq.nextVal, '%s', '%d', '%d', '%d', '%d', '%d', '%d'  )", dto.getMemSeq(), dto.getPassion(), dto.getDic(), dto.getFriend(), dto.getPredict(), dto.getSaint(), dto.getSocial()  );
			
			
			System.out.println(sql);//디버깅
			
			
			stat.executeUpdate(sql);
			
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
	}
	
	
	



//코인 환불메서드
public void updatecoin(RefundDTO dto) {
		
	try {
		
		String sql = String.format("update TMEMBER set coin = '%d' where id='%s' ",  dto.getUpdatecoin(), dto.getId());  
			
		System.out.println(sql);//디버깅
				
		stat.executeUpdate(sql);
				
	} catch (Exception e) {
		System.out.println(e.toString());
	}
}	
	
	
	



//충전기록을 담아주는 리스트
public ArrayList<tAddcoinDTO> list(String seq )	{
	
	ArrayList<tAddcoinDTO> list = new ArrayList<tAddcoinDTO>();
	
	try {
			
		String sql = String.format("select * from tAddcoin where memseq= '%s' order by regdate desc", seq);
		
		System.out.println(sql);//디버깅
		
	     ResultSet rs = stat.executeQuery(sql);
		
		 while(rs.next()){
				
			   tAddcoinDTO dto3  = new tAddcoinDTO();
		    	
		    	dto3.setSeq(rs.getString("seq"));
		    	
		    	dto3.setCoin(rs.getString("coin"));
			 
		    	dto3.setRegdate(rs.getString("regdate"));
				    	
		    	dto3.setMemseq(rs.getString("memseq"));
						    	
		    list.add(dto3);
		    	
			}
		    	
	} catch (Exception e) {
		// TODO: handle exception
	}
	return list;
}





//사용기록을 담아주는 리스트
public ArrayList<tUsedcoinDTO> list1(String seq) {
	
	ArrayList<tUsedcoinDTO> list1 = new ArrayList<tUsedcoinDTO>();
	try {
		
        String sql = String.format("select * from tUsedcoin where memseq= '%s' order by regdate desc", seq);
		
		System.out.println(sql);//디버깅
		
	     ResultSet rs = stat.executeQuery(sql);
		
		while(rs.next()){
			
			tUsedcoinDTO dto2 = new tUsedcoinDTO();
					
			dto2.setSeq(rs.getString("seq"));
			dto2.setRegdate(rs.getString("regdate"));  // 사용 날짜			
			dto2.setCoin(rs.getString("coin"));  //사용한 코인			
			dto2.setMemseq(rs.getString("memseq"));			
			dto2.setAppnum(rs.getString("appnum"));			
			dto2.setTravname(rs.getString("Travname"));  // 여행종류
			
			
		 list1.add(dto2);	
			
		}
			
	} catch (Exception e) {
		// TODO: handle exception
	}
	
	return list1;
	
}







//원하는 테마여행에 원하는 스타일의 사람 출력 리스트



public ArrayList<joinDTO> list2(String g1, String person){
	
	
	ArrayList<joinDTO> list2 = new ArrayList<joinDTO>();
	
	
	try {
		
		if( g1.equals("1") ){
			//낚시
			
			String sql = "select distinct t.seq, t.name , t.id, t.gender, t.before , c.passion, c.dic, c.friend, c.predict, c.saint, c.social, e.name as place from tmember t join tcharacter c on t.seq = c.seq join tappfish i on t.seq = i.memseq join tfish f1 on i.travelseq = f1.seq join tplace e on f1.placeseq = e.seq where " + person + ">=10 ";

			System.out.println(sql);//디버깅
			
			ResultSet rs = stat.executeQuery(sql);
			 
			 		
			 while(rs.next()){
				 
				 joinDTO dto = new joinDTO();
					
				 
				 dto.setSeq(rs.getString("seq"));
				 dto.setName(rs.getString("name"));
				 dto.setId(rs.getString("id"));
				 dto.setGender(rs.getString("gender"));
				 dto.setBefore(rs.getString("before"));
				 dto.setPassion(rs.getString("passion"));
				 dto.setDic(rs.getString("dic"));
				 dto.setFriend(rs.getString("friend"));
				 dto.setPredict(rs.getString("predict"));
				 dto.setSaint(rs.getString("saint"));
				 dto.setSocial(rs.getString("social"));
				 dto.setPlace(rs.getString("place"));
				 
				 
				 list2.add(dto);
				 
			 }
			 
		}else if (g1.equals("2") ) {
			
			//지역
			
			
			String sql = "select distinct t.seq, t.name , t.id, t.gender, t.before , c.passion, c.dic, c.friend, c.predict, c.saint, c.social, e.name as place from tmember t join tcharacter c on t.seq = c.seq join tapplocal l on t.seq = l.memseq join tlocal l1 on l.travelseq = l1.seq join tplace e on l1.placeseq=e.seq  where " + person + ">=10";

			System.out.println(sql);//디버깅
			
			ResultSet rs = stat.executeQuery(sql);
			 
			 
			 		
			 while(rs.next()){
				 
				 joinDTO dto = new joinDTO();
					
				 
				 dto.setSeq(rs.getString("seq"));
				 dto.setName(rs.getString("name"));
				 dto.setId(rs.getString("id"));
				 dto.setGender(rs.getString("gender"));
				 dto.setBefore(rs.getString("before"));
				 dto.setPassion(rs.getString("passion"));
				 dto.setDic(rs.getString("dic"));
				 dto.setFriend(rs.getString("friend"));
				 dto.setPredict(rs.getString("predict"));
				 dto.setSaint(rs.getString("saint"));
				 dto.setSocial(rs.getString("social"));
				 dto.setPlace(rs.getString("place"));
				 
				 
				 list2.add(dto);
				 
			 }
			
			
			
					
			
		}else if(  g1.equals("3")) {
			
			//맛집
				
			String sql = "select distinct t.seq, t.name , t.id, t.gender, t.before , c.passion, c.dic, c.friend, c.predict, c.saint, c.social, e.name as place from tmember t join tcharacter c on t.seq = c.seq join tappfood f on t.seq = f.memseq join tfood f1 on f.travelseq = f1.seq join tplace e on f1.placeseq = e.seq where " + person + ">=10";

			System.out.println(sql);//디버깅
			
			ResultSet rs = stat.executeQuery(sql);
			 
			 		
			 while(rs.next()){
				 
				 joinDTO dto = new joinDTO();
					
				 
				 dto.setSeq(rs.getString("seq"));
				 dto.setName(rs.getString("name"));
				 dto.setId(rs.getString("id"));
				 dto.setGender(rs.getString("gender"));
				 dto.setBefore(rs.getString("before"));
				 dto.setPassion(rs.getString("passion"));
				 dto.setDic(rs.getString("dic"));
				 dto.setFriend(rs.getString("friend"));
				 dto.setPredict(rs.getString("predict"));
				 dto.setSaint(rs.getString("saint"));
				 dto.setSocial(rs.getString("social"));
				 dto.setPlace(rs.getString("place"));
				 
				 
				 list2.add(dto);
				 
			 }
			
			
			
		}else if( g1.equals("4")) {
			
			
			//등산
			
			String sql = "select distinct t.seq, t.name , t.id, t.gender, t.before , c.passion, c.dic, c.friend, c.predict, c.saint, c.social, e.name as place from tmember t join tcharacter c on t.seq = c.seq join tappmt m on t.seq = m.memseq join tmt m1 on m.travelseq = m1.seq join tplace e on m1.placeseq = e.seq where " + person + ">=10";

			System.out.println(sql);//디버깅
			
			ResultSet rs = stat.executeQuery(sql);
			 
			 		
			 while(rs.next()){
				 
				 joinDTO dto = new joinDTO();
					
				 
				 dto.setSeq(rs.getString("seq"));
				 dto.setName(rs.getString("name"));
				 dto.setId(rs.getString("id"));
				 dto.setGender(rs.getString("gender"));
				 dto.setBefore(rs.getString("before"));
				 dto.setPassion(rs.getString("passion"));
				 dto.setDic(rs.getString("dic"));
				 dto.setFriend(rs.getString("friend"));
				 dto.setPredict(rs.getString("predict"));
				 dto.setSaint(rs.getString("saint"));
				 dto.setSocial(rs.getString("social"));
				 dto.setPlace(rs.getString("place"));
				 
				 
				 list2.add(dto);
				 
			 }
			
			
				
			
		}else if (g1.equals("5")){
			
			
			//자전거
			
			String sql = "select distinct t.seq, t.name , t.id, t.gender, t.before , c.passion, c.dic, c.friend, c.predict, c.saint, c.social, e.name as place from tmember t join tcharacter c on t.seq = c.seq join tappbike b on t.seq = b.memseq join tbike k on b.travelseq = k.seq join tplace e on k.placeseq = e.seq where " + person + ">=10";

			System.out.println(sql);//디버깅
			
			ResultSet rs = stat.executeQuery(sql);
			 
			 while(rs.next()){
				 
				 joinDTO dto = new joinDTO();
					
				 
				 dto.setSeq(rs.getString("seq"));
				 dto.setName(rs.getString("name"));
				 dto.setId(rs.getString("id"));
				 dto.setGender(rs.getString("gender"));
				 dto.setBefore(rs.getString("before"));
				 dto.setPassion(rs.getString("passion"));
				 dto.setDic(rs.getString("dic"));
				 dto.setFriend(rs.getString("friend"));
				 dto.setPredict(rs.getString("predict"));
				 dto.setSaint(rs.getString("saint"));
				 dto.setSocial(rs.getString("social"));
				 dto.setPlace(rs.getString("place"));	
				 
				 
				 list2.add(dto);
				 
			 }
						
		}
					
		
	} catch (Exception e) {
		// TODO: handle exception
	}
	
	
	return list2;
	
}


	
}
