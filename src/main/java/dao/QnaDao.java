package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;

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

		String sql =
			"select q.no, q.title, q.content, q.reg_id, m.name, " +
			"       to_char(q.reg_date,'yyyy-MM-dd hh24:mi:ss') as reg_date, " +
			"       q.hit, q.answer, q.answer_id, " +
			"       to_char(q.answer_date,'yyyy-MM-dd hh24:mi:ss') as answer_date " +
			"from qna q inner join member m " +
			"on q.reg_id = m.id " +
			"where q.no = '" + no + "'";

		try {
			con = DBConnection.getConnection();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();

			if (rs.next()) {
				dto = new QnaDto(
					no,
					rs.getString("title"),
					rs.getString("content"),
					rs.getString("hit"),
					rs.getString("reg_id"),
					rs.getString("name"),
					rs.getString("reg_date"),
					rs.getString("answer"),
					rs.getString("answer_id"),
					rs.getString("answer_date")
				);
			}

		} catch (Exception e) {
			System.out.println("getQnaView() 오류 : " + sql);
			e.printStackTrace();
		} finally {
			DBConnection.closeDB(con, ps, rs);
		}
		return dto;
	}

	//페이지 전체 건수
	public int getTotalCount(String select, String search) {
		int count = 0;
		String sql = "select count(*) as count\r\n" + "from qna\r\n" + "where " + select + " like '%"
				+ search + "%'";

		try {
			con = DBConnection.getConnection();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();

			if (rs.next()) {
				count = rs.getInt("count");
			}
		} catch (Exception e) {
			System.out.println("getTotalCount() 오류 : " + sql);
			e.printStackTrace();
		} finally {
			DBConnection.closeDB(con, ps, rs);
		}
		return count;
	}
	//목록
	public List<QnaDto> getQnaList(String select, String search, int start, int end) {
		List<QnaDto> list = new ArrayList<QnaDto>();
		String sql = "select * from(\r\n" + "select  rownum as rnum ,tbl.* from (\r\n"
				+ "select q.no, q.title, q.answer , m.name,\r\n"
				+ "to_char(q.reg_date,'yy-MM-dd') as reg_date, q.hit\r\n"
				+ "from qna q inner join member m on q.reg_id= m.id\r\n" + "where q." + select
				+ " like '%" + search + "%' order by q.no desc\r\n" + ")tbl\r\n" + ")where rnum>=" + start
				+ " and rnum<=" + end + "";
		System.out.println(sql);
		try {
			con = DBConnection.getConnection();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();

			while (rs.next()) {

				String no = rs.getString("no");
				String title = rs.getString("title");
				String reg_name = rs.getString("name");
				String reg_date = rs.getString("reg_date");
				String hit = rs.getString("hit");
				String answer = rs.getString("answer");
				if (answer == null) {
					answer = "";
				}

				QnaDto dto = new QnaDto(no, title, "", hit, "", reg_name, reg_date, answer);
				list.add(dto);
			}

		} catch (Exception e) {
			System.out.println("getQnaList 안돼용~!" + sql);
			e.printStackTrace();
		} finally {
			DBConnection.closeDB(con, ps, rs);
		}
		return list;
	}
	// 다음글
	public QnaDto getNextQna(String no) {
		QnaDto dto = null;
		String sql = "select a.no, b.title\r\n" + "from\r\n" + "(\r\n" + "    select min(no) as no\r\n"
				+ "    from qna\r\n" + "    where no > '" + no + "'\r\n" + ") a, qna b\r\n"
				+ "where a.no = b.no";

		try {
			con = DBConnection.getConnection();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();

			if (rs.next()) {
				String nextNo = rs.getString("no");
				String title = rs.getString("title");
				dto = new QnaDto(nextNo, title);
			}
		} catch (Exception e) {
			System.out.println("getNextQna() 오류 : " + sql);
			e.printStackTrace();
		} finally {
			DBConnection.closeDB(con, ps, rs);
		}

		return dto;
	}

	// 이전글
	public QnaDto getPreQna(String no) {
		QnaDto dto = null;
		String sql = "select a.no, b.title\r\n" + "from\r\n" + "(\r\n" + "select max(no) as no\r\n"
				+ "from qna\r\n" + "where no < '" + no + "'\r\n" + ") a, qna b\r\n"
				+ "where a.no = b.no";

		try {
			con = DBConnection.getConnection();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();

			if (rs.next()) {
				String preNo = rs.getString("no");
				String title = rs.getString("title");
				dto = new QnaDto(preNo, title);
			}
		} catch (Exception e) {
			System.out.println("getPreQna() 오류 : " + sql);
			e.printStackTrace();
		} finally {
			DBConnection.closeDB(con, ps, rs);
		}

		return dto;
	}
	//답변
	public int getAnswerSave(QnaDto dto) {
		int result = 0;
		String sql = "update qna\r\n"
				+ "set answer='"+dto.getAnswer()+"',\r\n"
				+ "answer_id='"+dto.getAnswer_id()+"',\r\n"
				+ "answer_date = to_date('"+dto.getAnswer_date()+"','yyyy-MM-dd hh24:mi:ss')\r\n"
				+ "where no = '"+dto.getNo()+"'";
		System.out.println(sql);
		try {
			con = DBConnection.getConnection();
			ps = con.prepareStatement(sql);
			result = ps.executeUpdate();
		}catch(Exception e) {
			System.out.println("getAnswerSave() 오류 : " + sql);
			e.printStackTrace();
		}finally {
			DBConnection.closeDB(con, ps, rs);
		}
		
		return result;
	}
	//qna 수정
	public int qnaUpdate(QnaDto dto) {
		int result = 0;
		String sql = "update qna\r\n" + "set title = '" + dto.getTitle() + "',\r\n" + "    content = '"
				+ dto.getContent() + "'\r\n" + "where no = '"
				+ dto.getNo() + "'";
		System.out.println(sql);
		try {
			con = DBConnection.getConnection();
			ps = con.prepareStatement(sql);
			result = ps.executeUpdate();
		} catch (Exception e) {
			System.out.println("qnaUpdate() : " + sql);
			e.printStackTrace();
		} finally {
			DBConnection.closeDB(con, ps, rs);
		}

		return result;
	}
	//qna 삭제
	public int qnaDelete(String no) {
		int result = 0;
		String sql = "delete from qna\r\n" + "where no = '" + no + "'";
		
		try {
			con = DBConnection.getConnection();
			ps = con.prepareStatement(sql);
			result = ps.executeUpdate();
		}catch(Exception e) {
			System.out.println("qnaDelete() 오류 : " + sql);
			e.printStackTrace();
		}finally {
			DBConnection.closeDB(con, ps, rs);
		}
		
		return result;
	}	
	
	
}
