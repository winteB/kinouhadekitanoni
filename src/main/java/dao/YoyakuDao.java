package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import common.DBConnection;
import dto.CampingDto;
import dto.FishingDto;
import dto.MemberDto;
import dto.YoyakuDto;

public class YoyakuDao {
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;

	// 예약가능 캠핑 사이트 리스트업
	public List<CampingDto> getCampingSiteList(String selected_area, String selected_date, String checkout_date) {
		List<CampingDto> list = new ArrayList<CampingDto>();
		String sql =  "SELECT c.CAM_NO, c.CAM_TYPE, c.CAM_NAME \r\n"
				+ "FROM Camping c \r\n"
				+ "WHERE c.CAM_TYPE = '"+selected_area+"' \r\n"
				+ "AND NOT EXISTS \r\n"
				+ "    (SELECT 1 FROM yoyaku y\r\n"
				+ "    WHERE y.SPOT = c.CAM_NO\r\n"
				+ "    AND y.KIND = 'ca'\r\n"
				+ "    AND y.START_DATE < TO_DATE('"+checkout_date+"', 'YYYY-MM-DD')\r\n"
				+ "    AND y.END_DATE   > TO_DATE('"+selected_date+"', 'YYYY-MM-DD') ) \r\n"
				+ "ORDER BY c.CAM_NAME";

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
//	예약가능 좌대 리스트업
	public List<FishingDto> getFishingSiteList(String selected_date, String checkout_date) {
		List<FishingDto> list = new ArrayList<FishingDto>();
		String sql = "SELECT Fish_NO, Fish_SIZE, Fish_NAME\r\n"
				+ "FROM (\r\n"
				+ "    SELECT f.Fish_NO,\r\n"
				+ "           f.Fish_SIZE,\r\n"
				+ "           f.Fish_NAME,\r\n"
				+ "           ROW_NUMBER() OVER (PARTITION BY f.Fish_SIZE ORDER BY f.Fish_NO) AS rn\r\n"
				+ "    FROM Fishing f\r\n"
				+ "    WHERE NOT EXISTS "
				+ "    (SELECT 1 FROM yoyaku y\r\n"
				+ "    WHERE y.SPOT = f.Fish_NO\r\n"
				+ "    AND y.KIND = 'fi'\r\n"
				+ "    AND y.START_DATE < TO_DATE('"+checkout_date+"', 'YYYY-MM-DD')\r\n"
				+ "    AND y.END_DATE   > TO_DATE('"+selected_date+"', 'YYYY-MM-DD') ) \r\n"
				+ ")\r\n"
				+ "WHERE rn = 1\r\n"
				+ "ORDER BY Fish_NO";
		System.out.println(sql);
		try {
			conn = DBConnection.getConnection();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				String no = rs.getString("Fish_NO");
				String size = rs.getString("Fish_SIZE");
				String name = rs.getString("Fish_NAME");
				FishingDto dto = new FishingDto(no, name, size);
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
			e.printStackTrace();
		} finally {
			DBConnection.closeDB(conn, ps, rs);
		}
		
		
		return price;
	}
	public String getFishSize(String selected_area) {
		String size = "";
		String sql = "select fish_size from fishing where fish_no='"+selected_area+"'";
		
		try {
			conn = DBConnection.getConnection();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			if(rs.next()) {
				size = rs.getString("fish_size");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.closeDB(conn, ps, rs);
		}
		
		
		return size;
	}
	

//	관리자 페이지 리스트
	public List<YoyakuDto> getManagerYoyakuList(String select, String search, String kind, String pay, int start,
			int end) {
		List<YoyakuDto> list = new ArrayList<YoyakuDto>();
		String sql = "SELECT *\r\n"
				+ "FROM (\r\n"
				+ "    SELECT ROWNUM rnum, mem.*\r\n"
				+ "    FROM (\r\n"
				+ "        SELECT  y.no,\r\n"
				+ "                y.user_id,\r\n"
				+ "                y.kind,\r\n"
				+ "                y.spot,\r\n"
				+ "                y.river,\r\n"
				+ "                to_char(y.start_date,'yyyy-MM-dd') start_date,\r\n"
				+ "                to_char(y.end_date,'yyyy-MM-dd') end_date,\r\n"
				+ "                y.paymant,\r\n"
				+ "                m.name,\r\n"
				+ "                c.cam_no,\r\n"
				+ "                c.cam_type,\r\n"
				+ "                c.cam_name,\r\n"
				+ "                f.fish_no,\r\n"
				+ "                f.fish_size,\r\n"
				+ "                f.fish_name\r\n"
				+ "        FROM yoyaku y\r\n"
				+ "        left join member m on y.user_id=m.id\r\n"
				+ "        left join camping c on y.spot=c.cam_no \r\n"
				+ "        left join fishing f on y.spot=f.fish_no\r\n";
		
				
				if(!kind.equals("all")||!pay.equals("all")) {
					String where="where ";
					if(!kind.equals("all")&&!pay.equals("all")) {
						where+="y.kind = '"+kind+"' and y.paymant='"+pay+"' ";
					}
					else if(!kind.equals("all")) {
						where+="y.kind = '"+kind+"' ";
					}
					else if(!pay.equals("all")) {
						where+=" y.paymant='"+pay+"'";
					}
					sql=sql+where;
				}
				
		sql = sql + "        ORDER BY no\r\n"
				+ "    ) mem\r\n"
				+ "    WHERE ROWNUM <= 6\r\n"
				+ ")\r\n"
				+ "WHERE rnum >= 1";
		
		System.out.println(sql);
		try {
			conn=DBConnection.getConnection();
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
			
			while(rs.next()) {
				String no           =  rs.getString("no");         
				String user_id      =  rs.getString("user_id");    
				kind         =  rs.getString("kind");       
				String spot         =  rs.getString("spot");       
				String river        =  rs.getString("river");      
				String start_date   =  rs.getString("start_date"); 
				String end_date     =  rs.getString("end_date");   
				String paymant      =  rs.getString("paymant");    
				String name         =  rs.getString("name");       
				String cam_no       =  rs.getString("cam_no");     
				String cam_type     =  rs.getString("cam_type");   
				String cam_name     =  rs.getString("cam_name");   
				String fish_no      =  rs.getString("fish_no");    
				String fish_size    =  rs.getString("fish_size");  
				String fish_name    =  rs.getString("fish_name");  
				
				YoyakuDto dto = new YoyakuDto(no, user_id, kind, spot, river, "pay_date", "price", start_date, end_date, "party", paymant, name, cam_name, cam_no, cam_type, cam_name, fish_no, fish_size, fish_name);
				list.add(dto);
				
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("getManagerYoyakuList 에러");
		}finally {
			DBConnection.closeDB(conn, ps, rs);
		}
		return list;
	}
	public int getManagerListTotalCount(String select, String search, String kind, String pay) {
		int count=0;
		String sql = "SELECT count(*) count \r\n"
				+ "        FROM yoyaku y\r\n"
				+ "        left join member m on y.user_id=m.id\r\n"
				+ "        left join camping c on y.spot=c.cam_no \r\n"
				+ "        left join fishing f on y.spot=f.fish_no\r\n";
		
				
				if(!kind.equals("all")||!pay.equals("all")) {
					String where="where ";
					if(!kind.equals("all")) {
						where+="y.kind = '"+kind+"' ";
					}
					if(!pay.equals("all")) {
						where+=" y.paymant='"+pay+"'";
					}
					sql=sql+where;
				}
				
		sql = sql + "        ORDER BY no\r\n";
		
		System.out.println(sql);
		
		try {
			conn = DBConnection.getConnection();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			if(rs.next()) {
				count = rs.getInt("count");
			}
		}catch(Exception e) {
			System.out.println("getManagerListTotalCount 에러 : " + sql);
		}finally {
			DBConnection.closeDB(conn, ps, rs);
		}
		return count;
	}
	

}
