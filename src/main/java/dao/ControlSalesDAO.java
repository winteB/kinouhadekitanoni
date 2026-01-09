package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.w3c.dom.stylesheets.LinkStyle;

import common.DBConnection;
import dto.ControlSalesDTO;

public class ControlSalesDAO {
	Connection conn=null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	
	
	


	public List<ControlSalesDTO> getTotalSales() {
		DBConnection db=new DBConnection();
		
		List<ControlSalesDTO> list=new ArrayList<ControlSalesDTO>();
		
		String sql="SELECT\r\n"
				+ "    y.KIND, \r\n"
				+ "    y.PRICE, \r\n"
				+ "    to_char(y.PAY_DATE,'yyyy-MM-dd hh24:mi:ss'),\r\n"
				+ "    NVL(f.FISH_NAME, c.CAM_NAME) AS PLACE_NAME,\r\n"
				+ "    to_char(y.START_DATE,'yyyy-MM-dd hh24:mi:ss'),\r\n"
				+ "    to_char(y.END_DATE,'yyyy-MM-dd hh24:mi:ss')\r\n"
				+ "FROM YOYAKU y\r\n"
				+ "LEFT JOIN FISHING f ON y.SPOT = f.FISH_NO\r\n"
				+ "LEFT JOIN CAMPING c ON y.SPOT = c.CAM_NO\r\n"
				+ "\r\n"
				+ "ORDER BY y.PAY_DATE DESC";
		
		
		
		try {
			conn=db.getConnection();
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			
			while(rs.next()) {
				ControlSalesDTO dto=new ControlSalesDTO();
				
				dto.setKind(rs.getString("KIND"));
				dto.setPrice(rs.getInt("PRICE"));
				dto.setPaydate(rs.getString("PAY_DATE"));
				dto.setPlacename(rs.getString("PLACE_NAME"));
				dto.setStartdate(rs.getString("START_DATE"));
				dto.setEnddate(rs.getString("END_DATE"));
				
				list.add(dto);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("ControlSalesDAO/getTotalSales: 오류");
		}finally {
			db.closeDB(conn, pstmt, rs);
		}
		return list;
	}
	
	
	
	
	
}
