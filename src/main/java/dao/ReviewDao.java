package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;

import common.DBConnection;
import dto.ReviewCommentDto;
import dto.ReviewDto;

public class ReviewDao {
	
	Connection con = null;
	PreparedStatement ps = null;
	ResultSet rs = null;

	// ==========================================
	// 1. 리뷰 게시글 관련 메서드
	// ==========================================

	// 리뷰 번호 생성 (R001, R002...)
	public String getReviewNo() {
		String no = "";
		String sql = "SELECT NVL(MAX(no), 'R000') no FROM review";
		try {
			con = DBConnection.getConnection();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			if (rs.next()) {
				no = rs.getString("no");
				no = no.substring(1);
				int newNo = Integer.parseInt(no) + 1;
				DecimalFormat df = new DecimalFormat("R000");
				no = df.format(newNo);
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("getReviewNo() 에러 : " + sql);
		} finally {
			DBConnection.closeDB(con, ps, rs);
		}
		return no;
	}

	// 리뷰 저장
	public int insertReview(ReviewDto dto) {
		int result = 0;
		String newNo = getReviewNo();

		String sql = "INSERT INTO review (no, review_id, user_id, target_id, attach, rating, content, hit, reg_date, title) " +
					 "VALUES ('" + newNo + "', '" + newNo + "', '" + dto.getUser_id() + "', '" + dto.getTarget_id() + "', '" +
					 dto.getAttach() + "', " + dto.getRating() + ", '" + dto.getContent() + "', 0, sysdate, '" + dto.getTitle() + "')";

		try {
			con = DBConnection.getConnection();
			ps = con.prepareStatement(sql);
			result = ps.executeUpdate();  
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("insertReview() 에러 : " + sql);
		} finally {
			DBConnection.closeDB(con, ps, rs);
		}
		return result;
	}

	// 리뷰 리스트 조회
	public List<ReviewDto> getReviewList() {
		List<ReviewDto> list = new ArrayList<>();
		String sql = "SELECT no, title, user_id, target_id, attach, rating, TO_CHAR(reg_date, 'YYYY-MM-DD') as reg_date " +
					 "FROM review ORDER BY no DESC";

		try {
			con = DBConnection.getConnection();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();

			while (rs.next()) {
				String no = rs.getString("no");
				String title = rs.getString("title");
				String userId = rs.getString("user_id");
				String targetId = rs.getString("target_id");
				String attach = rs.getString("attach");
				int rating = rs.getInt("rating");
				String regDate = rs.getString("reg_date");

				ReviewDto dto = new ReviewDto(no, title, userId, targetId, attach, rating, regDate);
				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("getReviewList() 에러 : " + sql);
		} finally {
			DBConnection.closeDB(con, ps, rs);
		}
		return list;
	}

	// 조회수 증가
	public void updateHit(String no) {
		String sql = "UPDATE review SET hit = hit + 1 WHERE no = '" + no + "'";
		try {
			con = DBConnection.getConnection();
			ps = con.prepareStatement(sql);
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("updateHit() 에러 : " + sql);
		} finally {
			DBConnection.closeDB(con, ps, rs);
		}
	}

	// 상세 조회 (View 페이지용)
	public ReviewDto getReviewView(String no) {
		ReviewDto dto = null;
		String sql = "SELECT no, title, content, user_id, target_id, attach, rating, hit, TO_CHAR(reg_date, 'YYYY-MM-DD HH24:MI') as reg_date " +
					 "FROM review WHERE no = '" + no + "'";
		try {
			con = DBConnection.getConnection();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			if(rs.next()) {
				String title = rs.getString("title");
				String content = rs.getString("content");
				String userId = rs.getString("user_id");
				String targetId = rs.getString("target_id");
				String attach = rs.getString("attach");
				int rating = rs.getInt("rating");
				int hit = rs.getInt("hit");
				String regDate = rs.getString("reg_date");
				
				dto = new ReviewDto();
				dto.setNo(no);
				dto.setTitle(title);
				dto.setContent(content);
				dto.setUser_id(userId);
				dto.setTarget_id(targetId);
				dto.setAttach(attach);
				dto.setRating(rating);
				dto.setHit(hit);
				dto.setReg_date(regDate);
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("getReviewView() 에러 : " + sql);
		} finally {
			DBConnection.closeDB(con, ps, rs);
		}
		return dto;
	}

	// ==========================================
	// 2. 댓글(ReviewComment) 관련 메서드
	// ==========================================

	// 댓글 번호 생성 (C001, C002...)
	public String getCNo() {
		String no = "";
		String sql = "SELECT NVL(MAX(c_no), 'C000') as no FROM review_comment"; 
		
		try {
			con = DBConnection.getConnection();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			if (rs.next()) {
				no = rs.getString("no");
				no = no.substring(1);
				int newNo = Integer.parseInt(no) + 1;
				DecimalFormat df = new DecimalFormat("C000");
				no = df.format(newNo);
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("getCNo() 에러 : " + sql);
		} finally {
			DBConnection.closeDB(con, ps, rs);
		}
		return no;
	}

	// 댓글 저장
	public int insertComment(String reviewNo, String userId, String content) {
		int result = 0;
		String cNo = getCNo(); // 새 댓글 번호 생성
		
		String sql = "INSERT INTO review_comment (c_no, review_no, review_id, user_id, content, reg_date) " +
					 "VALUES ('" + cNo + "', '" + reviewNo + "', '" + reviewNo + "', '" + userId + "', '" + content + "', sysdate)";
		
		try {
			con = DBConnection.getConnection();
			ps = con.prepareStatement(sql);
			result = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("insertComment() 에러 : " + sql);
		} finally {
			DBConnection.closeDB(con, ps, rs);
		}
		return result;
	}

	// 댓글 목록 조회 (ReviewCommentDto 사용)
	public List<ReviewCommentDto> getCommentList(String reviewNo) {
		List<ReviewCommentDto> list = new ArrayList<>();
		String sql = "SELECT c_no, review_no, user_id, content, TO_CHAR(reg_date, 'YYYY-MM-DD HH24:MI') as reg_date " +
					 "FROM review_comment " +
					 "WHERE review_no = '" + reviewNo + "' " +
					 "ORDER BY c_no DESC";
		try {
			con = DBConnection.getConnection();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				String c_no = rs.getString("c_no");
				String r_no = rs.getString("review_no");
				String user_id = rs.getString("user_id");
				String content = rs.getString("content");
				String reg_date = rs.getString("reg_date");
				
				list.add(new ReviewCommentDto(c_no, r_no, user_id, content, reg_date));
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("getCommentList() 에러 : " + sql);
		} finally {
			DBConnection.closeDB(con, ps, rs);
		}
		return list;
	}

	// 댓글 삭제
	public int deleteComment(String cNo) {
		int result = 0;
		String sql = "DELETE FROM review_comment WHERE c_no = '" + cNo + "'";
		try {
			con = DBConnection.getConnection();
			ps = con.prepareStatement(sql);
			result = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("deleteComment() 에러 : " + sql);
		} finally {
			DBConnection.closeDB(con, ps, rs);
		}
		return result;
	}
}