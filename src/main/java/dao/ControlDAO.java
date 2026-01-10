package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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
				+ "    SELECT mem.*, ROWNUM rnum\r\n"
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
				String id		= rs.getString("id");
				String name       = rs.getString("name");
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

//관리자의 유저 한명 삭제
	public int deleteUser(String id) {
		int result = 0;
		String sql = "DELETE FROM member WHERE id = '"+id+"'";
		
		System.out.println(sql);
		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			result = pstmt.executeUpdate();
			
		}catch(Exception e) {
			System.out.println("deleteUser 에러 : " + sql);
		}finally {
			DBConnection.closeDB(conn, pstmt, rs);
		}	
		return result;
	}


//	관리자의 유저 여러명 삭제
	public int deleteUserAll(String[] id) {
		int result = 0;
		try {
			conn = DBConnection.getConnection();
			
			for(int i=0;i<id.length;i++) {
				String sql = "DELETE FROM member WHERE id = '"+id[i]+"'";
				
				System.out.println("setOrderStatusUpdate sql : "+sql);
				pstmt = conn.prepareStatement(sql);
				int cnt = pstmt.executeUpdate();
				if (cnt == 1) {
	                result++;
	            } else {
	                // 만약 삭제된 행이 없다면 예외를 발생시켜 롤백으로 유도할 수도 있습니다.
	                throw new Exception("ID : " + id[i] + " 삭제 실패");
	            }
			}
		}catch (Exception e) {
			try {
	            if (conn != null) {
	                // 3. 오류 발생 시 롤백
	                conn.rollback();
	                System.out.println("작업 중 오류 발생, 롤백 실행");
	            }
	        } catch (SQLException se) {
				System.out.println("deleteUserAll rollback 에러");
	            se.printStackTrace();
	        }
			e.printStackTrace();
			System.out.println("deleteUserAll 에러");
		}finally {
			try {
	            // 다시 자동 커밋을 true로 돌려주는 것이 관례입니다.
	            if (conn != null) conn.setAutoCommit(true);
	        } catch (Exception e) {}
			DBConnection.closeDB(conn, pstmt, rs);
		}
	
		
		
		return result;
	}
	
	
	
    
    
    
    
    
    
    
    
    
    
    
    
    
    

	
	
}
