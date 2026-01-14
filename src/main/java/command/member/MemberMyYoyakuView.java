package command.member;

import javax.servlet.http.HttpServletRequest;

import common.CommonExecute;
import dao.YoyakuDao;
import dto.YoyakuDto;

public class MemberMyYoyakuView implements CommonExecute {

	@Override
	public void execute(HttpServletRequest request) {
		String no = request.getParameter("t_no");
		
		YoyakuDao dao = new YoyakuDao();
		YoyakuDto dto = dao.getYoyakuDetail(no);
		
		request.setAttribute("dto", dto);
	}
}