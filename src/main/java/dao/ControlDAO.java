package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.w3c.dom.stylesheets.LinkStyle;

import common.DBConnection;
import dto.MemberDto;

public class ControlDAO {
	Connection conn=null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	
	
	public List<MemberDto> getUserList(String select, String colum, String search, int start, int end) {
		
		List<MemberDto> list=new ArrayList<MemberDto>();
		
		String sql = "SELECT name,\r\n"
				+ "       id,\r\n"
				+ "       mobile_1,\r\n"
				+ "       mobile_2,\r\n"
				+ "       mobile_3,\r\n"
				+ "       email_1,\r\n"
				+ "       email_2,\r\n"
				+ "       gender,\r\n"
				+ "       exit_date\r\n"
				+ "FROM (\r\n"
				+ "    SELECT ROWNUM rnum, mem.*\r\n"
				+ "    FROM (\r\n"
				+ "        SELECT name,\r\n"
				+ "               id,\r\n"
				+ "               mobile_1,\r\n"
				+ "               mobile_2,\r\n"
				+ "               mobile_3,\r\n"
				+ "               email_1,\r\n"
				+ "               email_2,\r\n"
				+ "               gender,\r\n"
				+ "               exit_date\r\n"
				+ "        FROM member\r\n"
				+ "        WHERE "+colum+" LIKE '%"+search+"%'\r\n";
		
		if(select.equals("now")) { 
			sql += " AND exit_date IS NULL "; 
		} else if(select.equals("exit")) {
			sql += " AND exit_date IS NOT NULL "; 
		}	
				
		sql= sql+ "        ORDER BY id\r\n"
				+ "    ) mem\r\n"
				+ "    WHERE ROWNUM <= "+end+"\r\n"
				+ ")\r\n"
				+ "WHERE rnum >= "+start;
		System.out.println(sql+"");
		
		try {
			conn=DBConnection.getConnection();
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				String name		= rs.getString("id");
				String id       = rs.getString("name");
				String mobile_1 = rs.getString("mobile_1");
				String mobile_2 = rs.getString("mobile_2");
				String mobile_3 = rs.getString("mobile_3");
				String email_1  = rs.getString("email_1");
				String email_2  = rs.getString("email_2");
				String gender   = rs.getString("gender");
				String exit_date= rs.getString("exit_date");
				
				MemberDto dto = new MemberDto(id, name, mobile_1, mobile_2, mobile_3, email_1, email_2, gender, exit_date);
				list.add(dto);
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBConnection.closeDB(conn, pstmt, rs);
		}
		
		return list;
	}


	public int getTotalCount(String select,String colum, String search) {
		int count=0;
		String sql = "select count(*) count from member\r\n"
				+ "where "+colum+" like '%"+search+"%'";
		if(select.equals("all")) {
			
		}else if(select.equals("now")) {
			sql+=" and exit_date is null";
		}else if(select.equals("exit")) {
			sql+=" and exit_date is not null";
		}
		System.out.println(sql);
		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				count = rs.getInt("count");
			}
		}catch(Exception e) {
			System.out.println("getTotalCount 에러 : " + sql);
		}finally {
			DBConnection.closeDB(conn, pstmt, rs);
		}
		return count;
	}
	
	
	
	
	
}
