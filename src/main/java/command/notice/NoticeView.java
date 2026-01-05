package command.notice;

import javax.servlet.http.HttpServletRequest;

import common.CommonExecute;
import dao.NoticeDao;
import dto.NoticeDto;

public class NoticeView implements CommonExecute {

	@Override
	public void execute(HttpServletRequest request) {
		NoticeDao dao = new NoticeDao();
		String no = request.getParameter("t_no");
		String gubun = request.getParameter("t_gubun");
		
		if(gubun.equals("view")) {
			int result = dao.setHitCount(no);
			if(result == 0) System.out.println("공지사항 조회수 증가 오류!");
			
			//다음글
			NoticeDto nextDto = dao.getNextNotice(no);
			request.setAttribute("nextDto", nextDto);
			
			//이전글
			NoticeDto preDto = dao.getPreNotice(no);
			request.setAttribute("preDto", preDto);
		}
		NoticeDto dto = dao.getNoticeView(no);
		request.setAttribute("dto", dto);
	}

}
