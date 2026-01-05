package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.w3c.dom.stylesheets.LinkStyle;

import common.DBConnection;
import dto.ControlDTO;

public class ControlDAO {
	Connection conn=null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	
	
	public List<ControlDTO> getUserList() {
		DBConnection db=new DBConnection();
		
		List<ControlDTO> list=new ArrayList<ControlDTO>();
		
		String sql="";
		
		try {
			conn=db.getConnection();
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				ControlDTO dto=new ControlDTO();
				
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			db.closeDB(conn, pstmt, rs);
		}
		
		return null;
	}
	
	
	
	
	
}
