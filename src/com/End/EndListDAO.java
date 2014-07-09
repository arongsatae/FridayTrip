package com.End;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

public class EndListDAO {

	private Connection con = null;
	private Statement stat = null;

	// 초기화 작업
	public EndListDAO() {

		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String id = "system";
		String pw = "java1234";

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");

			// DB 연결
			con = DriverManager.getConnection(url, id, pw);

			stat = con.createStatement();

		} catch (Exception e) {
			System.out.println(e.toString()+"디비접속");
		}
	}
	
	// 글 목록 보기
	public ArrayList<EndListDTO> list(int start, int end) {

		ArrayList<EndListDTO> list = new ArrayList<EndListDTO>();
		try {
			String sql=String.format("select * from (select b.*, rownum as rnum from "
					+ "(select * from tTravelEpil b inner join tmember cc on b.memseq = cc.seq "
					+ "order by b.Seq desc) b) c where rnum >= %d and "
					+ "rnum <= %d order by thread desc", start, end);

			ResultSet rs = stat.executeQuery(sql);
			
			while (rs.next()) {
				EndListDTO dto = new EndListDTO();
				dto.setSeq(rs.getString("seq"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setRegDate(rs.getDate("regDate"));
				dto.setCount(rs.getInt("count"));
				dto.setName(rs.getString("name"));
				dto.setCommentcount(rs.getInt("commentcount"));
				dto.setDepth(rs.getString("depth"));
				list.add(dto);
			}
		} catch (Exception e) {
			System.out.println(e.toString()+"글목록");
		}

		return list;
	}
	
	// 게시글 한개 View 
	public EndListDTO view(String seq) {
		EndListDTO dto = new EndListDTO();
		
		try {
			String sql = "select * from tTravelEpil t inner join tmember m on t.memSeq = m.Seq"
					+ " where t.seq="+seq;
		
			ResultSet rs = stat.executeQuery(sql);
		
			if (rs.next()) {
				dto.setSeq(rs.getString("seq"));
				dto.setRegDate(rs.getDate("regDate"));
				dto.setName(rs.getString("name"));
				dto.setCount(rs.getInt("count"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));			
				dto.setDepth(rs.getString("depth"));
				dto.setThread(rs.getString("thread"));
				dto.setTravel(rs.getString("travel"));
			}
			
		} catch (Exception e) {
			System.out.println(e.toString()+"글한개 보기");
		}
		return dto;
	}
	
	// 비번 확인
	public boolean check(String seq, String pw) {
		boolean sum = false;
		
		try {
			String sql = String.format("select count(*) as num from tTravelEpil where seq = %s"
					+ " and pw= '%s'",seq,pw);
			ResultSet rs = stat.executeQuery(sql);
			
			if (rs.next()) {
				if (rs.getString("num").equals("1"))
					sum = true;
			}
					
		} catch (Exception e) {
			System.out.println(e.toString()+"글 비번확인");
		}
		
		return sum;
	}
	
	// 글 수정
	public void edit(EndListDTO dto) {
		try {
			String sql = String.format("update tTravelEpil set title='%s', content='%s', travel = '%s' where seq = %s"
					, dto.getTitle(), dto.getContent(), dto.getTravel(), dto.getSeq());
			
			stat.executeQuery(sql);
			
		} catch (Exception e) {
			System.out.println(e.toString()+"글 수정");
		}
		
	}
	
	// 글 삭제 
	public void del(String seq) {
		try {
			String sql = "delete from tTravelEpil where seq =" + seq;
			
			stat.executeUpdate(sql);
			
		} catch (Exception e) {
			System.out.println(e.toString()+"글 삭제");
		}
		
	}

	// id 로 이름 멤버번호 찾기
	public EndListDTO me(String id) {
		EndListDTO dto = new EndListDTO();
		
		try {
			String sql = String.format("select * from tmember where id = '%s'",id);
		
			ResultSet rs = stat.executeQuery(sql);
		
			if (rs.next()) {
				dto.setSeq(rs.getString("seq"));
				dto.setName(rs.getString("name"));
			}
			
		} catch (Exception e) {
			System.out.println(e.toString()+"아디로 멤버번호");
		}
		return dto;
	}
	
	// 글 쓰기
	public void add(EndListDTO dto) {
		try {
			String sql = String.format("insert into tTravelEpil(seq, title, content, regDate, pw, memSeq,"
					+ " travel, thread, depth) values(tTravelEpilSeq.nextval, '%s', '%s', default,"
					+ " %s, %s, '%s', %s, %s)", dto.getTitle(), dto.getContent(), dto.getPw(), 
					dto.getMemseq(), dto.getTravel(), dto.getThread(), dto.getDepth());
		
			System.out.println(sql);
			
			stat.executeUpdate(sql);
			
		} catch (Exception e) {
			System.out.println(e.toString()+"글쓰기");
		}
		
	}

	// 조회수 증가 
	public void addCount(String seq) {
		try {
			String sql = "update tTravelEpil set Count = Count + 1 where seq =" + seq;
			
			stat.executeUpdate(sql);
			
		} catch (Exception e) {
			System.out.println(e.toString()+"글 카운트");
		}		
	}
	
	// 검색 하기
	public ArrayList<EndListDTO> search(String col, String word, int start, int end) {
		
		ArrayList<EndListDTO> list = new ArrayList<EndListDTO>();
		try {

			String where = "";
				
			if (col.equals("all")) {
				where = String.format("where title like '%%%s%%' or content like '%%%s%%'",word,word);
			} else {
				where = String.format("where %s like '%%%s%%'",col, word);
			}
				
				String sql = String.format("select * from (select b.*, rownum as rnum from "
						+ "(select * from tTravelEpil t inner join tmember c on t.memseq = c.seq "
						+ "%s order by c.seq desc)b)c where rnum >= %d and  rnum <= %d", where, start, end);
					ResultSet rs = stat.executeQuery(sql);
				
				while (rs.next()) {
					EndListDTO dto = new EndListDTO();
					// 레코드 1개 -> DTO 1개
					dto.setSeq(rs.getString("seq"));
					dto.setTitle(rs.getString("title"));
					dto.setCount(rs.getInt("count"));
					dto.setContent(rs.getString("content"));
					dto.setPw(rs.getString("pw"));
					dto.setName(rs.getString("name"));
					dto.setRegDate(rs.getDate("regDate"));
					dto.setDepth(rs.getString("depth"));
					dto.setThread(rs.getString("thread"));
					list.add(dto);
				}
						
		} catch (Exception e) {
			System.out.println(e.toString()+"검색");
		}			
		return list;
	}
	
	// 댓글 카운트 정보
	public void updateCount(String boardSeq, String n) {
		
		try {
	
			String sql = String.format("update tTravelEpil set commentcount = commentcount"
					+ " %s where seq = %s", n, boardSeq);

			stat.executeUpdate(sql);
			
		} catch (Exception e) {
			System.out.println(e.toString()+"댓글 카운트 정보");
		}
		
		
	}
	
	// 페이징 관련 정보 반환하기
	public HashMap<String, Integer> getPage(int pageSize) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		try {
			String sql = String.format("select count(*) as total, ceil(count(*) / %d) as "
					+ "pages from tTravelEpil", pageSize);
			
			ResultSet rs = stat.executeQuery(sql);
			
			if (rs.next()) {
				//반환값 -> HashMap
				map.put("total", rs.getInt("total"));
				map.put("pages", rs.getInt("pages"));
			}
			
		} catch (Exception e) {
			System.out.println(e.toString() + ": 페이징 정보");
		}
		
		return map;
	}
	
	// 게시판에서 가장 큰 thread 값 찾기
	public int getThread() {
		int thread = -1;
		
		try {
			// 오라클로 +1000 을 한다. 첫글은 null 이므로 nvl 치환한다.
			String sql = "select (nvl(max(thread),0) + 1000) as maxThread from tTravelEpil";
			
			ResultSet rs = stat.executeQuery(sql);
			
			if (rs.next()) {
				thread = rs.getInt("maxThread");
			}
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return thread;
	}

	// 답변 처리
	public void updateThread(int parentThread, int prevThread) {
		try {
			String sql = String.format("update tTravelEpil set thread = thread - 1 where thread < %d and"
					+ "thread > %d", parentThread, prevThread);
			stat.executeQuery(sql);
			
		} catch (Exception e) {
			System.out.println(e.toString());
			
		}
		
	}

	
	
} // DAO
