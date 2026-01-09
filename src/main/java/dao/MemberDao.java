package dao;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import common.DBConnection;
import dto.MemberDto;

public class MemberDao {
	Connection conn = null;
	PreparedStatement pres = null;
	ResultSet res = null;
	
	// 아이디 중복 체크
	public int checkMemberId(String id) {
		int count = 0;
		String sql ="select count(*) as count from MEMBER where id = '"+id+"'";
		
		try {
			conn = DBConnection.getConnection();
			pres = conn.prepareStatement(sql);
			res = pres.executeQuery();
			if(res.next()) {
				count = res.getInt("count");
			}
		}catch(Exception e) {
			System.out.println("checkMemberId 오류");
			e.printStackTrace();
		}finally {
			DBConnection.closeDB(conn, pres, res);
		}
		
		return count;
	}

	// 비밀번호 암호화
	public String encryptSHA256(String value) throws NoSuchAlgorithmException {
		String encryptData = "";

		MessageDigest sha = MessageDigest.getInstance("SHA-256");
		sha.update(value.getBytes());

		byte[] digest = sha.digest();
		for (int i = 0; i < digest.length; i++) {
			encryptData += Integer.toHexString(digest[i] & 0xFF).toUpperCase();
		}

		return encryptData;
	}

	// 비밀번호 확인
	public int checkMemberPassword(String id, String password) {
		int count = 0;
		String sql = "select count(*) count from MEMBER "
				+ "where id='"+id+"' and password='"+password+"'";
		
		try {
			conn = DBConnection.getConnection();
			pres = conn.prepareStatement(sql);
			res = pres.executeQuery();
			if(res.next()) {
				count = res.getInt("count");
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("checkMemberPassword 에러");
		} finally {
			DBConnection.closeDB(conn, pres, res);
		}
		
		return count;
	}

	// 회원가입 저장
	public int memberSave(MemberDto dto) {
		int result = 0;
		String sql = "INSERT INTO member(id,name,password,\r\n"
				+ "password_length,age,address,\r\n"
				+ "mobile_1,mobile_2,mobile_3,\r\n"
				+ "email_1,email_2,gender,reg_date) VALUES(\r\n"
				+ "'"+dto.getId()+"','"+dto.getName()+"','"+dto.getPassword()+"',\r\n"
				+ "'"+dto.getPassword_length()+"','"+dto.getAge()+"','"+dto.getAddress()+"',\r\n"
				+ "'"+dto.getMobile_1()+"','"+dto.getMobile_2()+"','"+dto.getMobile_3()+"',\r\n"
				+ "'"+dto.getEmail_1()+"','"+dto.getEmail_2()+"','"+dto.getGender()+"',\r\n"
				+ "TO_DATE('"+dto.getReg_date()+"','yyyy-MM-DD hh24:mi:ss'))";
		System.out.println("memberSave sql : "+sql);
		try {
			conn = DBConnection.getConnection();
			pres = conn.prepareStatement(sql);
			result = pres.executeUpdate();
			
		}catch(Exception e) {
			System.out.println("memberSave 오류");
			e.printStackTrace();
		}finally {
			DBConnection.closeDB(conn, pres, res);
		}
		
		return result;
	}

	// 로그인
	public String memberLogin(String id, String password) {
		String name = "";
		String sql = "select name from MEMBER "
				+ "where id ='"+id+"' and password = '"+password+"' and exit_date is null";
		System.out.println(sql);
		
		try {
			conn = DBConnection.getConnection();
			pres = conn.prepareStatement(sql);
			res = pres.executeQuery();
			if(res.next()) {
				name = res.getString("name");
			}
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("memberLogin 에러");
		} finally {
			DBConnection.closeDB(conn, pres, res);
		}
		
		return name;
	}
	
	// 1. 회원 상세 조회
	public MemberDto getMemberView(String id) {
		MemberDto dto = null;
		Connection conn = null;
		PreparedStatement pres = null;
		ResultSet res = null;
		
		if(id == null) id = "";

		String query = " select id, name, password, age, address, " +
				   " mobile_1, mobile_2, mobile_3, " +
				   " email_1, email_2, gender, " +
				   " to_char(reg_date, 'yyyy-MM-dd') as reg_date, " +
				   " to_char(update_date, 'yyyy-MM-dd') as update_date " + 
				   " from MEMBER " + 
				   " where id = '" + id.trim() + "' ";
		
		System.out.println("getMemberView query : " + query);
		
		try {
			conn = DBConnection.getConnection();
			pres = conn.prepareStatement(query);
			res = pres.executeQuery();
			
			if(res.next()) {
				String m_id 	= res.getString("id");
				String name 	= res.getString("name");
				String password = res.getString("password");
				String age 		= res.getString("age");
				String address 	= res.getString("address");
				String mobile_1 = res.getString("mobile_1");
				String mobile_2 = res.getString("mobile_2");
				String mobile_3 = res.getString("mobile_3");
				String email_1 	= res.getString("email_1");
				String email_2 	= res.getString("email_2");
				String gender 	= res.getString("gender");
				
				// [수정 포인트] 날짜 컬럼 2개 가져오기
				String reg_date = res.getString("reg_date");
				String update_date = res.getString("update_date");
				
				// [수정 포인트] 날짜를 포함한 생성자로 변경 (파라미터 13개)
				dto = new MemberDto(m_id, name, password, age, address, 
									mobile_1, mobile_2, mobile_3, 
									email_1, email_2, gender,
									reg_date, update_date); // 날짜 추가됨
				
				System.out.println("★ getMemberView 조회 성공: " + m_id);
			} else {
				System.out.println("★ getMemberView 조회 실패: 해당 ID의 데이터가 없습니다. (" + id + ")");
			}
		} catch(Exception e) {
			System.out.println("getMemberView 오류");
			e.printStackTrace();
		} finally {
			DBConnection.closeDB(conn, pres, res);
		}
		return dto;
	}

	// 2. 회원 정보 수정
	public int updateMember(MemberDto dto) {
		int result = 0;
		Connection conn = null;
		PreparedStatement pres = null;
		
		String query = " update MEMBER set " +
					   " name='"+dto.getName()+"', password='"+dto.getPassword()+"', " +
					   " age='"+dto.getAge()+"', address='"+dto.getAddress()+"', " +
					   " mobile_1='"+dto.getMobile_1()+"', mobile_2='"+dto.getMobile_2()+"', mobile_3='"+dto.getMobile_3()+"', " +
					   " email_1='"+dto.getEmail_1()+"', email_2='"+dto.getEmail_2()+"', " +
					   " gender='"+dto.getGender()+"', " +
					   " update_date = sysdate " + 
					   " where id = '"+dto.getId().trim()+"' "; 
					   
		System.out.println("updateMember query : " + query);
		
		try {
			conn = DBConnection.getConnection();
			conn.setAutoCommit(false); 
			
			pres = conn.prepareStatement(query);
			result = pres.executeUpdate();
			
			System.out.println("★ update 결과(수정된 행 개수) : " + result);
			
			if(result > 0) {
				conn.commit(); 
				System.out.println("★ DB 커밋 완료");
			} else {
				conn.rollback();
			}
			
		} catch(Exception e) {
			System.out.println("updateMember 오류");
			e.printStackTrace();
			try { if(conn != null) conn.rollback(); } catch(Exception ex) {}
		} finally {
			try { if(conn != null) conn.setAutoCommit(true); } catch(Exception ex) {}
			DBConnection.closeDB(conn, pres, null);
		}
		return result;
	}
	
	// 3. 회원 탈퇴
	public int deleteMember(String id) {
		int result = 0;
		Connection conn = null;
		PreparedStatement pres = null;
		
		if(id == null) id = "";
		
		String query = " delete from MEMBER where id = '" + id.trim() + "' ";
		System.out.println("deleteMember query : " + query);
		
		try {
			conn = DBConnection.getConnection();
			conn.setAutoCommit(false); 
			
			pres = conn.prepareStatement(query);
			result = pres.executeUpdate();
			
			if(result > 0) {
				conn.commit();
			} else {
				conn.rollback();
			}
		} catch(Exception e) {
			System.out.println("deleteMember 오류");
			e.printStackTrace();
			try { if(conn != null) conn.rollback(); } catch(Exception ex) {}
		} finally {
			try { if(conn != null) conn.setAutoCommit(true); } catch(Exception ex) {}
			DBConnection.closeDB(conn, pres, null);
		}
		return result;
	}
}