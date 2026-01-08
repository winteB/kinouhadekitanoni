package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import common.DBConnection;
import dto.ReviewCommentDto;
import dto.ReviewDto;

public class ReviewDao {
	
	Connection con = null;
	PreparedStatement ps = null;
	ResultSet rs = null;

	// [1] 목록 조회
	public List<ReviewDto> getReviewList(String search) {
		List<ReviewDto> list = new ArrayList<>();
		
		String query = "SELECT review_id, title, user_id, target_id, attach, hit, " + 
					   "to_char(reg_date, 'yyyy-MM-dd HH24:mi') as reg_date, rating " + 
					   "FROM review ";
		
		if(search != null && !search.equals("")) {
			query += "WHERE target_id LIKE '%" + search + "%' ";
		}
		
		query += "ORDER BY review_id DESC";
		
		try {
			con = DBConnection.getConnection();
			ps = con.prepareStatement(query);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				String no 		 = rs.getString("review_id");
				String title 	 = rs.getString("title");
				String user_id 	 = rs.getString("user_id");
				String target_id = rs.getString("target_id");
				String attach 	 = rs.getString("attach");
				int hit 		 = rs.getInt("hit");
				String reg_date  = rs.getString("reg_date");
				int rating       = rs.getInt("rating");
				
				ReviewDto dto = new ReviewDto();
				dto.setNo(no);
				dto.setTitle(title);
				dto.setUser_id(user_id);
				dto.setTarget_id(target_id);
				dto.setAttach(attach);
				dto.setHit(hit);
				dto.setReg_date(reg_date);
				dto.setRating(rating);
				
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
					   "FROM review WHERE review_id = ?";
		
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

}