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
				+ "    y.PAY_DATE,\r\n"
				+ "    NVL(f.FISH_NAME, c.CAM_NAME) AS PLACE_NAME,\r\n"
				+ "    y.START_DATE,\r\n"
				+ "    y.END_DATE,\r\n"
				+ "    y.user_id,\r\n"
				+ "    y.paymant\r\n"
				+ "\r\n"
				+ "FROM YOYAKU y\r\n"
				+ "LEFT JOIN FISHING f ON y.SPOT = f.FISH_NO\r\n"
				+ "LEFT JOIN CAMPING c ON y.SPOT = c.CAM_NO\r\n"
				+ "\r\n"
				+ "where y.paymant = 'Y'\r\n"
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
				dto.setPaymant(rs.getString("paymant"));
				dto.setUserid(rs.getString("USER_ID"));
				
				
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





	public List<ControlSalesDTO> getCampGraph(String Switch) {
		DBConnection db=new DBConnection();
		ControlSalesDTO dto=null;
		List<ControlSalesDTO> list=new ArrayList<ControlSalesDTO>();
		
		String sql="SELECT\r\n"
				+ "    price,pay_date FROM yoyaku WHERE kind=? and paymant = 'Y'";
		
		try {
			conn=db.getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,Switch);
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				dto=new ControlSalesDTO();
				
				dto.setPaydate(rs.getString("pay_date"));
				dto.setPrice(rs.getInt("price"));
				
				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("DAO : getCampGraph()");
		}finally {
			db.closeDB(conn, pstmt, rs);
		}
		
		return list;
	}
	
	
	
	public List<ControlSalesDTO> getFishGraph(String Switch) {
		DBConnection db=new DBConnection();
		ControlSalesDTO dto=null;
		List<ControlSalesDTO> list=new ArrayList<ControlSalesDTO>();
		
		String sql="SELECT\r\n"
				+ "    price,pay_date FROM yoyaku WHERE kind=? and paymant = 'Y'";
		
		try {
			conn=db.getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,Switch);
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				dto=new ControlSalesDTO();
				
				dto.setPaydate(rs.getString("paydate"));
				dto.setPrice(rs.getInt("price"));
				
				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("DAO : getCampGraph()");
		}finally {
			db.closeDB(conn, pstmt, rs);
		}
		return list;
	}
	
	
	
	
	
	
	
}
