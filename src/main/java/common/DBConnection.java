package common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DBConnection {

	public static Connection getConnection() {
		Connection con = null;
		boolean nomal = true;

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");

		} catch (ClassNotFoundException e) {
			System.out.println("oracle 드라이버 없음!");
			nomal = false;
			e.printStackTrace();
		}

		String url = "jdbc:oracle:thin:@1.245.91.227:1521:xe";
		String user = "track24_pjt_two";
		String pw = "1234";
		if (nomal) {
			try {
				con = DriverManager.getConnection(url, user, pw);
			} catch (SQLException e) {
				System.out.println("oracle 계정 설정 오류!");
				e.printStackTrace();
			}
		}
		return con;
	}
	
	public static void closeDB(Connection con, PreparedStatement pres, ResultSet rs) {
		if(rs!=null) {
			try {
				rs.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				System.out.println("ResultSet 닫기 실패.");
				e.printStackTrace();
			}
		}
		if(pres!=null) {
			try {
				pres.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				System.out.println("PreparedStatement 닫기 실패.");
				e.printStackTrace();
			}
		}
		if(con!=null) {
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				System.out.println("Connection 닫기 실패.");
				e.printStackTrace();
			}
		}
	}
}
