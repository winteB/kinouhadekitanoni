package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import common.DBConnection;
import dto.CampingDto;

public class YoyakuDao {
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;

	// 예약가능 캠핑 사이트 리스트업
	public List<CampingDto> getCampingSiteList(String selected_area, String selected_date, String checkout_date) {
		List<CampingDto> list = new ArrayList<CampingDto>();
		String sql = "SELECT c.CAM_NO, c.CAM_TYPE, c.CAM_NAME\r\n"
				+ "FROM Camping c\r\n"
				+ "WHERE c.CAM_TYPE = '"+selected_area+"'\r\n"
				+ "  AND NOT EXISTS (\r\n"
				+ "        SELECT 1\r\n"
				+ "        FROM YOYAKU_STATE r\r\n"
				+ "        WHERE r.SPOT = c.CAM_NO\r\n"
				+ "          AND r.INDAY BETWEEN TO_DATE('"+selected_date+"', 'YYYY-MM-DD')\r\n"
				+ "                          AND TO_DATE('"+checkout_date+"', 'YYYY-MM-DD') - 1\r\n"
				+ "      )"
				+ " order by CAM_NAME";
		System.out.println(sql);
		try {
			conn = DBConnection.getConnection();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				String no = rs.getString("CAM_NO");
				String type = rs.getString("CAM_TYPE");
				String name = rs.getString("CAM_NAME");
				CampingDto dto = new CampingDto(no, type, name);
				list.add(dto);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			DBConnection.closeDB(conn, ps, rs);
		}
		return list;
	}
//	캠핑 가격 조회
	public int getCampingPrice(String selected_area) {
		int price = 0;
		String sql = "SELECT price FROM price where type='"+selected_area+"'";
		
		try {
			conn = DBConnection.getConnection();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			if(rs.next()) {
				price = rs.getInt("price");
			}
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			DBConnection.closeDB(conn, ps, rs);
		}
		
		
		return price;
	}

}
