package common;

import java.sql.Connection;

public class DBtest {

	public static void main(String[] args) {
		// 커넥션 테스트.
		
		Connection con = DBConnection.getConnection();
		
		System.out.println(con);
		
		DBConnection.closeDB(con, null, null);
	}

}
