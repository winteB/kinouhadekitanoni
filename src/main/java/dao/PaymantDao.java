package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.DecimalFormat;

import common.CommonUtil;
import common.DBConnection;
import dto.YoyakuDto;


public class PaymantDao {

	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
//	주문번호 생성
	public String getOrderNo() {
		String no = "";
		String nowYear = CommonUtil.getToday();
		String sql = "select nvl(max(no),'"+nowYear+"_00000') no "
				+ "from yoyaku";
		System.out.println(sql);
		//2025_S0001
		try {
			conn = DBConnection.getConnection();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			if(rs.next()) {
				no = rs.getString("no");
				
				String maxYear = no.substring(0, 10); //yyyy-MM-dd
				System.out.println(no.substring(11));
				int newNo= 1;
				if(CommonUtil.getToday().equals(maxYear)) {
					newNo = Integer.parseInt(no.substring(11))+1;
				}

				DecimalFormat df = new DecimalFormat("00000");
				no = nowYear+"_"+df.format(newNo);
				System.out.println(df.format(newNo));
				System.out.println(no+"\n");
			}
		}catch(Exception e) {
			System.out.println("getOrderNo 에러");
			e.printStackTrace();
		}finally {
			DBConnection.closeDB(conn, ps, rs);
		}
		return no;
	}

	public int savePreYoyaku(YoyakuDto dto) {
		int res = 0;
		String sql = "INSERT INTO yoyaku\r\n"
				+ "    (no,user_id,kind,spot,river,\r\n"
				+ "    pay_date,price,\r\n"
				+ "    start_date,\r\n"
				+ "    end_date,\r\n"
				+ "    paymant,party) \r\n"
				+ "    VALUES('"+dto.getNo()+"','"+dto.getUser_id()+"','"+dto.getKind()+"','"+dto.getSpot()+"','"+dto.getRiver()+"',\r\n"
				+ "    TO_DATE('"+dto.getPay_date()+"', 'YYYY-MM-DD'),'"+dto.getPrice()+"',\r\n"
				+ "    TO_DATE('"+dto.getStart_date()+"', 'YYYY-MM-DD'),\r\n"
				+ "    TO_DATE('"+dto.getEnd_date()+"', 'YYYY-MM-DD'),\r\n"
				+ "    '"+dto.getPaymant()+"','"+dto.getParty()+"')";
		System.out.println(sql);
		try {
			conn = DBConnection.getConnection();
			ps = conn.prepareStatement(sql);
			res = ps.executeUpdate();
		}catch(Exception e) {
			System.out.println("savePreYoyaku 에러");
			e.printStackTrace();
		}finally {
			DBConnection.closeDB(conn, ps, rs);
		}
		
		return res;
	}

	public int updatePreYoyaky(String orderId) {
		int res = 0;
		String sql = "UPDATE yoyaku\r\n"
				+ "SET paymant = 'Y'\r\n"
				+ "WHERE no = '"+orderId+"'";
		System.out.println(sql);
		try {
			conn = DBConnection.getConnection();
			ps = conn.prepareStatement(sql);
			res = ps.executeUpdate();
		}catch(Exception e) {
			System.out.println("updatePreYoyaky 에러");
			e.printStackTrace();
		}finally {
			DBConnection.closeDB(conn, ps, rs);
		}
		
		return res;
	}
}
