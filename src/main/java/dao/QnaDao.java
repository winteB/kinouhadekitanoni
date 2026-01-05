package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.DecimalFormat;

import common.DBConnection;
import dto.QnaDto;

public class QnaDao {
	Connection 			con = null;
	PreparedStatement 	ps 	= null;
	ResultSet 			rs 	= null;
	
	//번호 +1 조회
	public String getQnaNo() {
		String no = "";
		String sql = "SELECT NVL(MAX(no), 'Q000') AS no FROM qna";

		try {
			con = DBConnection.getConnection();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();

			if (rs.next()) {
				no = rs.getString("no");
				no = no.substring(1);
				int newNo = Integer.parseInt(no) + 1;
				DecimalFormat df = new DecimalFormat("Q000");
				no = df.format(newNo);
			}

		} catch (Exception e) {
			System.out.println("getQnaNo() 오류 : " + sql);
			e.printStackTrace();
		} finally {
			DBConnection.closeDB(con, ps, rs);
		}
		return no;
	}
	//저장
	public int qnaSave(QnaDto dto) {
		int result = 0;
		String sql = "insert into qna\r\n" + "(no,title,content,reg_id,reg_date)\r\n" + "values\r\n" + "('"
				+ dto.getNo() + "','" + dto.getTitle() + "','" + dto.getContent() + "',\r\n" + "'" + dto.getReg_id()
				+ "',to_date('" + dto.getReg_date() + "','yyyy-MM-dd hh24:mi:ss'))";

		try {
			con = DBConnection.getConnection();
			ps = con.prepareStatement(sql);
			result = ps.executeUpdate();

		} catch (Exception e) {
			System.out.println("qnaSave() 오류 : " + sql);
			e.printStackTrace();
		} finally {
			DBConnection.closeDB(con, ps, rs);
		}
		return result;
	}
	//조회수
	public int setHitCount(String no) {
		int result = 0;
		String sql = "update qna\r\n"
				+ "set hit = hit + 1\r\n"
				+ "where no = '"+no+"'";
		try {
			con = DBConnection.getConnection();
			ps = con.prepareStatement(sql);
			result = ps.executeUpdate();
		}catch(Exception e) {
			System.out.println("setHitCount() 오류 : " + sql);
			e.printStackTrace();
		}finally {
			DBConnection.closeDB(con, ps, rs);
		}
		
		return result;
	}
	//상세조회
	public QnaDto getQnaView(String no) {
		QnaDto dto = null;

		String hitSql = "update qna\r\n" + "set hit = hit + 1\r\n" + "where no = '" + no + "'";

		String sql = "select qno, q.title, q.content, q.reg_id, m.name,\r\n"
				+ "        to_char(q.reg_date,'yyyy-MM-dd hh24:mi:ss') as reg_date, q. hit, q.answer\r\n"
				+ "from qna q, member m\r\n" + "where q.reg_id = m.id\r\n" + "and q.no = '" + no + "'";
		System.out.println(sql);
		try {
			con = DBConnection.getConnection();

			ps = con.prepareStatement(hitSql);
			int result = ps.executeUpdate();
			if (result != 1)
				System.out.println("getQnaView() 조회수 증가 오류 : " + hitSql);

			ps = con.prepareStatement(sql);
			if (rs.next()) {
			    String title = rs.getString("title");
			    String content = rs.getString("content");
			    String reg_id = rs.getString("reg_id");
			    String reg_date = rs.getString("reg_date");
			    String hit = rs.getString("hit");

			    String answer = rs.getString("answer");
			    if (answer == null) answer = "";

			    String answer_id = rs.getString("answer_id");
			    if (answer_id == null) answer_id = "";

			    String answer_date = rs.getString("answer_date");
			    if (answer_date == null) answer_date = "";

			    dto = new QnaDto(
			        no,
			        title,
			        content,
			        hit,
			        reg_id,
			        reg_date,
			        answer,
			        answer_id,
			        answer_date
			    );
			}

			rs = ps.executeQuery();	
		} catch (Exception e) {
			System.out.println("getQnaView() 오류 : " + sql);
			e.printStackTrace();
		} finally {
			DBConnection.closeDB(con, ps, rs);
		}

		return dto;
	}
	
}
