package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import common.DBConnection;
import dto.CampingDto;
import dto.FishingDto;
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
			int end, String orderStart, String orderEnd) {
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
		
				if(!kind.equals("all")||!pay.equals("all")||!orderStart.equals("")||!orderEnd.equals("")) {
					String where="where ";
					if(!kind.equals("all")||!pay.equals("all")) {
						
						if(!kind.equals("all")&&!pay.equals("all")) {
							where+="y.kind = '"+kind+"' and y.paymant='"+pay+"' ";
						}
						else if(!kind.equals("all")) {
							where+="y.kind = '"+kind+"' ";
						}
						else if(!pay.equals("all")) {
							where+=" y.paymant='"+pay+"'";
						}
						if(!orderStart.equals("")||!orderEnd.equals("")) {
							where+=" and";
						}
					}
					if(!orderStart.equals("")||!orderEnd.equals("")) {
						
						if(!orderStart.equals("")&&!orderEnd.equals("")) {
							where+=" y.start_date >= '"+orderStart+"' and y.start_date <='"+orderEnd+"' ";
						}
						else if(!orderStart.equals("")) {
							where+=" y.start_date >= to_date('"+orderStart+"','yyyy-MM-dd') ";
						}
						else if(!orderEnd.equals("")) {
							where+=" y.start_date <=to_date('"+orderEnd+"','yyyy-MM-dd') ";
						}
					}

					sql=sql+where;
				}
				
				
		sql = sql + "        ORDER BY no desc\r\n"
				+ "    ) mem\r\n"
				+ "    WHERE ROWNUM <= "+end+"\r\n"
				+ ")\r\n"
				+ "WHERE rnum >= "+start;
		
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
//	관리자 페이지 리스트 토탈 카운트
	public int getManagerListTotalCount(String select, String search, String kind, String pay, String orderStart, String orderEnd) {
		int count=0;
		String sql = "SELECT count(*) count \r\n"
				+ "        FROM yoyaku y\r\n"
				+ "        left join member m on y.user_id=m.id\r\n"
				+ "        left join camping c on y.spot=c.cam_no \r\n"
				+ "        left join fishing f on y.spot=f.fish_no\r\n";
		
				
		if(!kind.equals("all")||!pay.equals("all")||!orderStart.equals("")||!orderEnd.equals("")) {
			String where="where ";
			if(!kind.equals("all")||!pay.equals("all")) {
				
				if(!kind.equals("all")&&!pay.equals("all")) {
					where+="y.kind = '"+kind+"' and y.paymant='"+pay+"' ";
				}
				else if(!kind.equals("all")) {
					where+="y.kind = '"+kind+"' ";
				}
				else if(!pay.equals("all")) {
					where+=" y.paymant='"+pay+"'";
				}
				if(!orderStart.equals("")||!orderEnd.equals("")) {
					where+=" and";
				}
			}
			if(!orderStart.equals("")||!orderEnd.equals("")) {
				
				if(!orderStart.equals("")&&!orderEnd.equals("")) {
					where+=" y.start_date >= '"+orderStart+"' and y.start_date <='"+orderEnd+"' ";
				}
				else if(!orderStart.equals("")) {
					where+=" y.start_date >= to_date('"+orderStart+"','yyyy-MM-dd') ";
				}
				else if(!orderEnd.equals("")) {
					where+=" y.start_date <=to_date('"+orderEnd+"','yyyy-MM-dd') ";
				}
			}

			sql=sql+where;
		}
				
		
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
			e.printStackTrace();
		}finally {
			DBConnection.closeDB(conn, ps, rs);
		}
		return count;
	}
	public int setNotPayedDelete(String todayTime) {
		int result = 0;
		String sql = "DELETE from yoyaku "
				+ "where PAY_DATE<to_date('"+todayTime+"','YYYY-MM-DD hh24:mi:ss')-1 "
				+ "and paymant='N'";
		System.out.println(sql);
		
		try {
			conn = DBConnection.getConnection();
			ps = conn.prepareStatement(sql);
			result = ps.executeUpdate();
			
		}catch(Exception e) {
			System.out.println("setNotPayedDelete 에러 : " + sql);
			e.printStackTrace();
		}finally {
			DBConnection.closeDB(conn, ps, rs);
		}
		return result;
	}
	//예약 1건에 대한 취소
	public int setYoyakuCancle(String orderNo) {
		int result = 0;
		String sql = "DELETE from yoyaku where no='"+orderNo+"'";
		System.out.println(sql);
		
		try {
			conn = DBConnection.getConnection();
			ps = conn.prepareStatement(sql);
			result = ps.executeUpdate();
			
		}catch(Exception e) {
			System.out.println("setYoyakuCancle 에러 : " + sql);
			e.printStackTrace();
		}finally {
			DBConnection.closeDB(conn, ps, rs);
		}
		return result;
	}
	//예약 1건에 대한 결제 확인
	public int setYoyakuComplt(String orderNo) {
		int result = 0;
		String sql = "UPDATE yoyaku SET paymant = 'Y'  where no='"+orderNo+"'";
		System.out.println(sql);
		
		try {
			conn = DBConnection.getConnection();
			ps = conn.prepareStatement(sql);
			result = ps.executeUpdate();
			
		}catch(Exception e) {
			System.out.println("setYoyakuComplt 에러 : " + sql);
			e.printStackTrace();
		}finally {
			DBConnection.closeDB(conn, ps, rs);
		}
		return result;
	}
	
	// [추가] 내 예약 목록 조회 (JOIN 포함)
		public List<YoyakuDto> getMemberYoyakuList(String userId) {
			List<YoyakuDto> list = new ArrayList<YoyakuDto>();
			// 캠핑, 낚시, 회원 테이블을 조인하여 상세 정보를 한 번에 가져옴
			String sql = "SELECT y.no, y.user_id, y.kind, y.spot, y.river, "
					+ "       to_char(y.pay_date, 'yyyy-MM-dd') as pay_date, "
					+ "       y.price, "
					+ "       to_char(y.start_date, 'yyyy-MM-dd') as start_date, "
					+ "       to_char(y.end_date, 'yyyy-MM-dd') as end_date, "
					+ "       y.paymant, y.party, "
					+ "       m.name as username, "
					+ "       c.cam_no, c.cam_type, c.cam_name, "
					+ "       f.fish_no, f.fish_size, f.fish_name "
					+ "FROM yoyaku y "
					+ "LEFT JOIN member m ON y.user_id = m.id "
					+ "LEFT JOIN camping c ON y.spot = c.cam_no "
					+ "LEFT JOIN fishing f ON y.spot = f.fish_no "
					+ "WHERE y.user_id = ? "
					+ "ORDER BY y.start_date DESC";

			try {
				conn = DBConnection.getConnection();
				ps = conn.prepareStatement(sql);
				ps.setString(1, userId);
				rs = ps.executeQuery();

				while (rs.next()) {
					String no = rs.getString("no");
					String uId = rs.getString("user_id");
					String kind = rs.getString("kind");
					String spot = rs.getString("spot");
					String river = rs.getString("river");
					String payDate = rs.getString("pay_date");
					String price = rs.getString("price");
					String startDate = rs.getString("start_date");
					String endDate = rs.getString("end_date");
					String paymant = rs.getString("paymant"); 
					String party = rs.getString("party");
					
					// 조인된 추가 정보
					String username = rs.getString("username");
					String camNo = rs.getString("cam_no");
					String camType = rs.getString("cam_type");
					String camName = rs.getString("cam_name");
					String fishNo = rs.getString("fish_no");
					String fishSize = rs.getString("fish_size");
					String fishName = rs.getString("fish_name");

					// site 변수에 종류별 이름을 담아서 활용 (캠핑이면 캠핑장이름, 낚시면 낚시터이름)
					String siteName = "";
					if("ca".equals(kind)) siteName = camName;
					else if("fi".equals(kind)) siteName = fishName;

					// 전체 생성자 사용 (순서 주의: DTO 필드 순서와 매칭)
					// (no, user_id, kind, spot, river, pay_date, price, start_date, end_date, party, paymant, 
					//  username, site, cam_no, cam_type, cam_name, fish_no, fish_size, fish_name)
					YoyakuDto dto = new YoyakuDto(
						no, uId, kind, spot, river, payDate, price, startDate, endDate, party, paymant,
						username, siteName, camNo, camType, camName, fishNo, fishSize, fishName
					);
					
					list.add(dto);
				}
			} catch (Exception e) {
				System.out.println("getMemberYoyakuList 에러");
				e.printStackTrace();
			} finally {
				DBConnection.closeDB(conn, ps, rs);
			}
			return list;
		}
		
		// [추가] 예약 상세 정보 조회 (1건)
		public YoyakuDto getYoyakuDetail(String no) {
			YoyakuDto dto = null;
			String sql = "SELECT y.no, y.user_id, y.kind, y.spot, y.river, "
					+ "       to_char(y.pay_date, 'yyyy-MM-dd') as pay_date, "
					+ "       y.price, "
					+ "       to_char(y.start_date, 'yyyy-MM-dd') as start_date, "
					+ "       to_char(y.end_date, 'yyyy-MM-dd') as end_date, "
					+ "       y.paymant, y.party, "
					+ "       m.name as username, "
					+ "       c.cam_no, c.cam_type, c.cam_name, "
					+ "       f.fish_no, f.fish_size, f.fish_name "
					+ "FROM yoyaku y "
					+ "LEFT JOIN member m ON y.user_id = m.id "
					+ "LEFT JOIN camping c ON y.spot = c.cam_no "
					+ "LEFT JOIN fishing f ON y.spot = f.fish_no "
					+ "WHERE y.no = ?";

			try {
				conn = DBConnection.getConnection();
				ps = conn.prepareStatement(sql);
				ps.setString(1, no);
				rs = ps.executeQuery();

				if (rs.next()) {
					String uId = rs.getString("user_id");
					String kind = rs.getString("kind");
					String spot = rs.getString("spot");
					String river = rs.getString("river");
					String payDate = rs.getString("pay_date");
					String price = rs.getString("price");
					String startDate = rs.getString("start_date");
					String endDate = rs.getString("end_date");
					String paymant = rs.getString("paymant"); 
					String party = rs.getString("party");
					
					String username = rs.getString("username");
					String camNo = rs.getString("cam_no");
					String camType = rs.getString("cam_type");
					String camName = rs.getString("cam_name");
					String fishNo = rs.getString("fish_no");
					String fishSize = rs.getString("fish_size");
					String fishName = rs.getString("fish_name");

					String siteName = "";
					if("ca".equals(kind)) siteName = camName;
					else if("fi".equals(kind)) siteName = fishName;

					dto = new YoyakuDto(
						no, uId, kind, spot, river, payDate, price, startDate, endDate, party, paymant,
						username, siteName, camNo, camType, camName, fishNo, fishSize, fishName
					);
				}
			} catch (Exception e) {
				System.out.println("getYoyakuDetail 에러");
				e.printStackTrace();
			} finally {
				DBConnection.closeDB(conn, ps, rs);
			}
			return dto;
		}
}
