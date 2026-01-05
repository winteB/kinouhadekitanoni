package common;

import java.sql.Connection;

import dao.PaymantDao;

public class DBtest {

	public static void main(String[] args) {
		// 커넥션 테스트.
		
		Connection con = DBConnection.getConnection();
		
		PaymantDao dao = new PaymantDao();
//		dao.getOrderNo();
		dao.updatePreYoyaky("2026-01-04_00002");
		
		
		
		DBConnection.closeDB(con, null, null);
		
	}

}
