package dao;

import java.net.Authenticator.RequestorType;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import common.DBConnection;
import dto.ReviewCommentDto;
import dto.ReviewDto;

public class ReviewDao {
	
	Connection con = null;
	PreparedStatement ps = null;
	ResultSet rs = null;

	// [페이징] 전체 게시물 수 구하기
		public int getTotalCount(String search) {
			int count = 0;
			String query = " select count(*) from review " +
						   " where title like '%"+search+"%' " +
						   " or target_id like '%"+search+"%' "; // 제목이나 카테고리(타겟ID) 검색
			try {
				con = DBConnection.getConnection();
				ps = con.prepareStatement(query);
				rs = ps.executeQuery();
				if(rs.next()) {
					count = rs.getInt(1);
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				DBConnection.closeDB(con, ps, rs);
			}
			return count;
		}

		// [페이징] 리스트 조회 (startRow ~ endRow)
		public List<ReviewDto> getReviewList(String search, int start, int end) {
			List<ReviewDto> list = new ArrayList<>();
			String query = " select * from ( " +
					   "    select rownum rnum, a.* from ( " +
					   "        select no, title, user_id, target_id, attach, rating, hit, to_char(reg_date, 'yyyy-MM-dd') as reg_date " +
					   "        from review " +
					   "        where title like ? or target_id like ? " +
					   "        order by reg_date desc, no desc " + // [수정] 날짜 내림차순, 같은 날짜면 번호 내림차순
					   "    ) a " +
					   " ) where rnum >= ? and rnum <= ? ";
			
			try {
				con = DBConnection.getConnection();
				ps = con.prepareStatement(query);
				ps.setString(1, "%"+search+"%");
				ps.setString(2, "%"+search+"%");
				ps.setInt(3, start);
				ps.setInt(4, end);
				rs = ps.executeQuery();
				
				while(rs.next()) {
					ReviewDto dto = new ReviewDto();
					dto.setNo(rs.getString("no"));
					dto.setTitle(rs.getString("title"));
					dto.setUser_id(rs.getString("user_id"));
					dto.setTarget_id(rs.getString("target_id"));
					dto.setAttach(rs.getString("attach"));
					dto.setRating(rs.getInt("rating"));
					dto.setHit(rs.getInt("hit"));
					dto.setReg_date(rs.getString("reg_date"));
					list.add(dto);
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				DBConnection.closeDB(con, ps, rs);
			}
			return list;
		}
	
	// [2] 글 작성
	public int insertReview(ReviewDto dto) {
		int result = 0;
		String query = "INSERT INTO review " + 
					   "(no, review_id, title, content, user_id, target_id, attach, rating, hit, reg_date) " + 
					   "VALUES " + 
					   "(review_seq.nextval, 'R'||review_seq.nextval, ?, ?, ?, ?, ?, ?, 0, sysdate)";
		
		try {
			con = DBConnection.getConnection();
			ps = con.prepareStatement(query);
			ps.setString(1, dto.getTitle());
			ps.setString(2, dto.getContent());
			ps.setString(3, dto.getUser_id());
			ps.setString(4, dto.getTarget_id());
			ps.setString(5, dto.getAttach());
			ps.setInt(6, dto.getRating());
			
			result = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.closeDB(con, ps, rs);
		}
		return result;
	}
	
	// [3] 상세 조회
	public ReviewDto getReviewView(String no) {
		ReviewDto dto = null;
		String query = "SELECT review_id, title, content, user_id, target_id, attach, hit, rating, " +
					   "to_char(reg_date, 'yyyy-MM-dd HH24:mi') as reg_date " + 
					   "FROM review WHERE no = ?";
		
		System.out.println(query+no);
		try {
			con = DBConnection.getConnection();
			ps = con.prepareStatement(query);
			ps.setString(1, no);
			rs = ps.executeQuery();
			
			if(rs.next()) {
				dto = new ReviewDto();
				dto.setNo(rs.getString("review_id"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setUser_id(rs.getString("user_id"));
				dto.setTarget_id(rs.getString("target_id"));
				dto.setAttach(rs.getString("attach"));
				dto.setHit(rs.getInt("hit"));
				dto.setReg_date(rs.getString("reg_date"));
				dto.setRating(rs.getInt("rating"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.closeDB(con, ps, rs);
		}
		return dto;
	}
	
	// [4] 조회수 증가
	public void updateHit(String no) {
		String query = "UPDATE review SET hit = hit + 1 WHERE review_id = ?";
		try {
			con = DBConnection.getConnection();
			ps = con.prepareStatement(query);
			ps.setString(1, no);
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.closeDB(con, ps, rs);
		}
	}
	
	// [5] 댓글 목록
	public List<ReviewCommentDto> getCommentList(String no) {
		List<ReviewCommentDto> list = new ArrayList<>();
		// [수정] review_id를 기준으로 댓글을 조회합니다.
		String query = "SELECT c_no, review_id, user_id, content, to_char(reg_date, 'yyyy-MM-dd HH24:mi') as reg_date " +
					   "FROM review_comment WHERE review_id = ? ORDER BY c_no DESC";
		try {
			con = DBConnection.getConnection();
			ps = con.prepareStatement(query);
			ps.setString(1, no);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				ReviewCommentDto dto = new ReviewCommentDto();
				dto.setC_no(rs.getString("c_no"));
				dto.setReview_no(rs.getString("review_id"));
				dto.setUser_id(rs.getString("user_id"));
				dto.setContent(rs.getString("content"));
				dto.setReg_date(rs.getString("reg_date"));
				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.closeDB(con, ps, rs);
		}
		return list;
	}
	
	// [6] 댓글 작성
	public int insertComment(String review_no, String user_id, String content) {
		int result = 0;
		// ★★★ [수정] review_no(숫자)와 review_id(문자) 둘 다 값을 넣어줍니다. ★★★
		// review_no는 서브쿼리로 부모 테이블(review)에서 찾아오고, review_id는 직접 넣습니다.
		String query = "INSERT INTO review_comment (c_no, review_no, review_id, user_id, content, reg_date) " +
					   "VALUES (review_comment_seq.nextval, " + 
					   "(SELECT no FROM review WHERE review_id = ?), " + // review_no 값 찾기
					   "?, ?, ?, sysdate)";
		try {
			con = DBConnection.getConnection();
			ps = con.prepareStatement(query);
			ps.setString(1, review_no); // 서브쿼리용 (예: R015)
			ps.setString(2, review_no); // INSERT용 (예: R015)
			ps.setString(3, user_id);
			ps.setString(4, content);
			result = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.closeDB(con, ps, rs);
		}
		return result;
	}
	
	// [7] 댓글 삭제
	public int deleteComment(String c_no) {
		int result = 0;
		String query = "DELETE FROM review_comment WHERE c_no = ?";
		try {
			con = DBConnection.getConnection();
			ps = con.prepareStatement(query);
			ps.setString(1, c_no);
			result = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.closeDB(con, ps, rs);
		}
		return result;
	}

	// [8] 글 수정
	public int updateReview(ReviewDto dto) {
		int result = 0;
		String query = "UPDATE review " + 
					   "SET title = ?, target_id = ?, content = ?, rating = ?, attach = ? " +
					   "WHERE review_id = ?";
		try {
			con = DBConnection.getConnection();
			ps = con.prepareStatement(query);
			ps.setString(1, dto.getTitle());
			ps.setString(2, dto.getTarget_id());
			ps.setString(3, dto.getContent());
			ps.setInt(4, dto.getRating());
			ps.setString(5, dto.getAttach());
			ps.setString(6, dto.getNo());
			
			result = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.closeDB(con, ps, rs);
		}
		return result;
	}

	// [9] 글 삭제
	public int deleteReview(String no) {
		int result = 0;
		// [수정] 댓글 삭제 시 review_id 사용 (문자열 ID 기준)
		String queryComment = "DELETE FROM review_comment WHERE review_id = ?";
		String queryReview = "DELETE FROM review WHERE review_id = ?";
		
		try {
			con = DBConnection.getConnection();
			
			// 댓글 삭제
			ps = con.prepareStatement(queryComment);
			ps.setString(1, no);
			ps.executeUpdate();
			ps.close();

			// 게시글 삭제
			ps = con.prepareStatement(queryReview);
			ps.setString(1, no);
			result = ps.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.closeDB(con, ps, rs);
		}
		return result;
	}

	public Map<String, ReviewDto> getIndexReviewList() {
		Map<String, ReviewDto> map = new HashMap<String, ReviewDto>();
		String sql = "SELECT NO, ATTACH, TITLE, TARGET_ID\r\n"
				+ "FROM (\r\n"
				+ "    SELECT NO,\r\n"
				+ "           ATTACH,\r\n"
				+ "           TITLE,\r\n"
				+ "           TARGET_ID,\r\n"
				+ "           ROW_NUMBER() OVER (PARTITION BY TARGET_ID ORDER BY REG_DATE DESC) AS rn\r\n"
				+ "    FROM review where review.attach is not null\r\n"
				+ ") t\r\n"
				+ "WHERE rn = 1";
		
		try {
			con = DBConnection.getConnection();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				String no		=rs.getString("NO");
				String attach	=rs.getString("ATTACH");
				String title	=rs.getString("TITLE");
				String target_id=rs.getString("TARGET_ID");
				ReviewDto dto = new ReviewDto(no, title, "id", target_id, attach, 0, "red_date");
				map.put(target_id, dto);
			}	
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.closeDB(con, ps, rs);
		}
		
		return map;
	}


}