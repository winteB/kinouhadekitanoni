package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;

import common.CommonUtil;
import common.DBConnection;
import dto.NoticeDto;

public class NoticeDao {
	Connection 			con = null;
	PreparedStatement 	ps 	= null;
	ResultSet 			rs 	= null;	
	
	//페이지 전체 건수
	public int getTotalCount(String select, String search) {
		int count = 0;
		String sql = "select count(*) as count\r\n" + "from notice\r\n" + "where " + select + " like '%"
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
	// 조회(검색)
	public List<NoticeDto> getNoticeList(String select, String search, int start, int end) {
		List<NoticeDto> list = new ArrayList<>();
		String sql = "select * from(\r\n" + "    select rownum as rnum, tbl.*\r\n" + "    from(\r\n"
				+ "        select n.no, n.title, m.name, n.attach,\r\n"
				+ "                    to_char(n.reg_date,'yy-MM--dd') as reg_date, n.hit\r\n"
				+ "        from notice n, member m\r\n" + "        where n.reg_id = m.id\r\n"
				+ "        and n." + select + " like '%" + search + "%'\r\n" + "        order by n.important desc, n.no desc\r\n"
				+ "    ) tbl\r\n" + ") where rnum >= " + start + " and rnum <=" + end + "";

		try {
			con = DBConnection.getConnection();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();

			while (rs.next()) {
				String no = rs.getString("no");
				String title = rs.getString("title");
				String attach = rs.getString("attach");
				String reg_name = rs.getString("name");
				String reg_date = rs.getString("reg_date");
				int hit = rs.getInt("hit");
				NoticeDto dto = new NoticeDto(no, title, attach, reg_name, reg_date, hit);
				list.add(dto);
			}

		} catch (Exception e) {
			System.out.println("getNoticeList() 오류 : " + sql);
			e.printStackTrace();
		} finally {
			DBConnection.closeDB(con, ps, rs);
		}

		return list;
	}
	
	//게시글 번호 생성
	public String getNoticeNo() {
		String no = "";
		String sql = "select nvl(max(no),'N000') as no\r\n"
				+ "from NOTICE\r\n";
		
		try {
			con = DBConnection.getConnection();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			
			if(rs.next()) {
				no = rs.getString("no");
				no = no.substring(1);
				int newNo = Integer.parseInt(no) + 1;
				
				DecimalFormat df = new DecimalFormat("N000");
				no = df.format(newNo);
			}
			
		}catch(Exception e) {
			System.out.println("getNoticeNo() 오류 : " + sql);
			e.printStackTrace();
		}finally {
			DBConnection.closeDB(con, ps, rs);
		}
		
		return no;
	}
	//등록
	public int noticeSave(NoticeDto dto) {
		int result = 0;
		String sql = "insert into notice\r\n"
				+ "(no, title, content, important,attach, reg_id, reg_date)\r\n"
				+ "values\r\n"
				+ "('"+dto.getNo()+"','"+dto.getTitle()+"','"+dto.getContent()+"','"+dto.getImportant()+"','"+dto.getAttach()+"',\r\n"
				+ "'"+dto.getReg_id()+"',to_date('"+dto.getReg_date()+"','yyyy-MM-dd hh24:mi:ss'))";
		
		try {
			con = DBConnection.getConnection();
			ps = con.prepareStatement(sql);
			result = ps.executeUpdate();
		}catch(Exception e) {
			System.out.println("noticeSave() 오류 : " + sql);
			e.printStackTrace();
		}finally {
			DBConnection.closeDB(con, ps, rs);
		}
		
		return result;
	}
	//조회수
	public int setHitCount(String no) {
		int result = 0;
		String sql = "update notice\r\n"
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
	//다음글
	public NoticeDto getNextNotice(String no) {
		NoticeDto dto = null;
		String sql = "select n1.no, n2.title\r\n"
				+ "from\r\n"
				+ "    (select min(no) as no\r\n"
				+ "    from notice\r\n"
				+ "    where no > '"+no+"') n1, notice n2\r\n"
				+ "where n1.no = n2.no";
		
		try {
			con = DBConnection.getConnection();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			
			if(rs.next()) {
				String nextNo = rs.getString("no");
				String title = rs.getString("title");
				dto = new NoticeDto(nextNo, title);
			}
			
		}catch(Exception e) {
			System.out.println("getNextNotice() 오류 : " + sql);
			e.printStackTrace();
		}
		
		return dto;
	}
	//이전글
	public NoticeDto getPreNotice(String no) {
		NoticeDto dto = null;
		String sql = "select n1.no, n2.title\r\n"
				+ "from\r\n"
				+ "    (select max(no) as no\r\n"
				+ "    from notice\r\n"
				+ "    where no < '"+no+"') n1, notice n2\r\n"
				+ "where n1.no = n2.no";
		
		try {
			con = DBConnection.getConnection();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			
			if(rs.next()) {
				String preNo = rs.getString("no");
				String title = rs.getString("title");
				dto = new NoticeDto(preNo, title);
			}
			
		}catch(Exception e) {
			System.out.println("getPreNotice() 오류 : " + sql);
			e.printStackTrace();
		}
		
		return dto;
	}
	//상세조회
	public NoticeDto getNoticeView(String no) {
		NoticeDto dto = null;
		String sql = "select n.no, n.title, n.content, n.important,\r\n"
				+ "       n.attach, n.hit, n.reg_id, m.name as reg_name,\r\n"
				+ "       to_char(n.reg_date,'yyyy-MM-dd') as reg_date\r\n"
				+ "from  notice n, member m\r\n"
				+ "where n.reg_id = m.id\r\n"
				+ "and n.no='"+no+"'";
		try {
			con = DBConnection.getConnection();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			
			if(rs.next()) {
				String title = rs.getString("title");
				title = CommonUtil.escapeHtml(title);
				
				String content = rs.getString("content");
				content = CommonUtil.escapeHtml(content);
				
				String important = rs.getString("important");
				String attach = rs.getString("attach");
				int hit = rs.getInt("hit");
				String reg_id = rs.getString("reg_id");
				String reg_name = rs.getString("reg_name");
				String reg_date = rs.getString("reg_date");
				dto = new NoticeDto(no, title, content, important, attach, reg_id, reg_name, reg_date, hit);
				
			}
		}catch(Exception e) {
			System.out.println("getNoticeView() 오류 : " + sql);
			e.printStackTrace();
		}finally {
			DBConnection.closeDB(con, ps, rs);
		}
		
		return dto;
	}
	//공지사항 업데이트
	public int noticeUpdate(NoticeDto dto) {
		int result = 0;
		String sql = "update notice\r\n"
				+ "set title = '"+dto.getTitle()+"',\r\n"
				+ "    content = '"+dto.getContent()+"',\r\n"
				+ "    important = '"+dto.getImportant()+"',\r\n"
				+ "    attach = '"+dto.getAttach()+"'\r\n"
				+ "where no = '"+dto.getNo()+"'";
		
		try {
			con = DBConnection.getConnection();
			ps = con.prepareStatement(sql);
			result = ps.executeUpdate();
		}catch(Exception e) {
			System.out.println("noticeUpdate() : " + sql);
			e.printStackTrace();
		}finally {
			DBConnection.closeDB(con, ps, rs);
		}
		return result;
	}
	//삭제
	public int noticeDelete(String no) {
		int result = 0;
		String sql = "delete from notice\r\n"
				+ "where no = '"+no+"'";
		
		try {
			con = DBConnection.getConnection();
			ps = con.prepareStatement(sql);
			result = ps.executeUpdate();
		}catch(Exception e) {
			System.out.println("noticeDelete() 오류 : " + sql);
			e.printStackTrace();
		}finally {
			DBConnection.closeDB(con, ps, rs);
		}
		return result;
	}

}
