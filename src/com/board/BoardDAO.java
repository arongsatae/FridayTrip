package com.board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;



public class BoardDAO {


	private Connection con = null;
	private Statement stat = null;

	// 초기화 작업 - 생성자
	public BoardDAO() {
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
	

	
	
	// 글 목록 보기
	public ArrayList<BoardDTO> list(int start, int end) {

		ArrayList<BoardDTO> list = new ArrayList<BoardDTO>();
		try {
			String sql=String.format("select * from (select b.*, rownum as rnum from "
					+ "(select * from tRecruit b inner join tMember m on b.MemSeq"
					+ " = m.Seq order by b.Seq desc) b) c where rnum >= %d and  "
					+ "rnum <= %d order by thread desc", start, end);

			ResultSet rs = stat.executeQuery(sql);
			
			while (rs.next()) {
				BoardDTO dto = new BoardDTO();
				dto.setSeq(rs.getString("seq"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setRegDate(rs.getDate("regDate"));
				dto.setCount(rs.getInt("count"));
				dto.setName(rs.getString("name"));
				dto.setCommentcount(rs.getInt("commentcount"));
				dto.setDepth(rs.getString("depth"));
				dto.setTotal(rs.getString("total"));
				dto.setMan(rs.getString("man"));
				dto.setDays(rs.getString("days"));
				dto.setWoman(rs.getString("woman"));
				dto.setStarts(rs.getString("starts"));
				dto.setThread(rs.getString("thread"));
				list.add(dto);
			}
		} catch (Exception e) {
			System.out.println(e.toString()+"글목록");
		}

		return list;
	}
	
	// 게시글 한개 View 
	public BoardDTO view(String seq) {
		BoardDTO dto = new BoardDTO();
		
		try {
			String sql = "select * from tRecruit b inner join tmember m on b.MEMSeq = m.SEQ where b.seq="+seq;
		
			ResultSet rs = stat.executeQuery(sql);
		
			if (rs.next()) {
				dto.setSeq(rs.getString("seq"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setRegDate(rs.getDate("regDate"));
				dto.setCount(rs.getInt("count"));
				dto.setName(rs.getString("name"));
				dto.setCommentcount(rs.getInt("commentcount"));
				dto.setDepth(rs.getString("depth"));
				dto.setTotal(rs.getString("total"));
				dto.setMan(rs.getString("man"));
				dto.setDays(rs.getString("days"));
				dto.setWoman(rs.getString("woman"));
				dto.setStarts(rs.getString("starts"));
				dto.setThread(rs.getString("thread"));
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
			String sql = String.format("select count(*) as num from tRecruit "
					+ "where seq = %s and pw= '%s'",seq,pw);
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
	public void edit(BoardDTO dto) {
		try {
			String sql = String.format("update tRecruit set title='%s', content='%s',total=%s, days=%s,starts=TO_DATE('%s','MM-DD-YYYY') where seq = %s"
					, dto.getTitle(), dto.getContent(),dto.getTotal(),dto.getDays(),dto.getStarts(), dto.getSeq());
			
			System.out.println(sql);
			stat.executeQuery(sql);
			
		} catch (Exception e) {
			System.out.println(e.toString()+"글 수정");
		}
		
	}
	
	// 글 삭제 
	public void del(String seq) {
		try {
			String sql = "delete from tRecruit where seq =" + seq;
			
			stat.executeUpdate(sql);
			
		} catch (Exception e) {
			System.out.println(e.toString()+"글 삭제");
		}
		
	}

	// id 로 이름 멤버번호 찾기
	public BoardDTO me(String id) {
		BoardDTO dto = new BoardDTO();
		
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
	public void add(BoardDTO dto) {
		try {			String sql = String.format("insert into tRecruit (seq, title, content, regDate, pw,total, man,woman,days,starts,memseq, thread, depth) values(tRecruitSeq.nextval, '%s', '%s', default , %s, %s,default,default, %s, TO_DATE('%s','MM-DD-YYYY'),%s,%s,%s)",
					dto.getTitle(), dto.getContent(), dto.getPw(),dto.getTotal(),dto.getDays(),dto.getStarts(),dto.getMemseq(), dto.getThread(), dto.getDepth());

			System.out.println(sql);
			stat.executeUpdate(sql);
		
		} catch (Exception e) {
			System.out.println(e.toString()+"글쓰기");
		}
		
	}

	// 조회수 증가 
	public void addCount(String seq) {
		try {
			String sql = "update tRecruit set Count = Count + 1 where seq =" + seq;
			
			stat.executeUpdate(sql);
			
		} catch (Exception e) {
			System.out.println(e.toString()+"글 카운트");
		}		
	}
	
	// 검색 하기
	public ArrayList<BoardDTO> search(String col, String word, int start, int end) {
		
		ArrayList<BoardDTO> list = new ArrayList<BoardDTO>();
		try {

			String where = "";
				
			if (col.equals("all")) {
				where = String.format("where title like '%%%s%%' or content like '%%%s%%'",word,word);
			} else {
				where = String.format("where %s like '%%%s%%'",col, word);
			}
				
				String sql = String.format("select * from (select b.*, rownum as rnum from "
						+ "(select * from tRecruit bb inner join tmember mm on "
						+ "bb.MEMSeq = mm.SEQ %s order by mm.seq desc)b)c "
						+ "where rnum >= %d and  rnum <= %d", where, start, end);
					ResultSet rs = stat.executeQuery(sql);
				
				while (rs.next()) {
					BoardDTO dto = new BoardDTO();
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
					dto.setMan(rs.getString("man"));
					dto.setWoman(rs.getString("woman"));
					dto.setTotal(rs.getString("total"));
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
	
			String sql = String.format("update tRecruit set commentcount = commentcount"
					+ " %s where seq = %s", n, boardSeq);

			stat.executeUpdate(sql);
			
			System.out.println(sql);
			
		} catch (Exception e) {
			System.out.println(e.toString()+"댓글 카운트 정보");
		}
		
		
	}
	
	// 페이징 관련 정보 반환하기
	public HashMap<String, Integer> getPage(int pageSize) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		try {
			String sql = String.format("select count(*) as total, ceil(count(*) / %d) as "
					+ "pages from tRecruit", pageSize);
			
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
			String sql = "select (nvl(max(thread),0) + 1000) as maxThread from tRecruit";
			
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
			String sql = String.format("update tRecruit set thread = thread - 1 where thread < %d and"
					+ "thread > %d", parentThread, prevThread);
			
			System.out.println(sql+"답변처리");
			stat.executeQuery(sql);
			
		} catch (Exception e) {
			System.out.println(e.toString());
			
		}
		
	}

	
	
} // DAO
