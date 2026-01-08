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

//	비밀번호 확인
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

//	로그인
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

}
