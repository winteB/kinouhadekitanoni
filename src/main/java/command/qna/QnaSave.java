package command.qna;

import javax.servlet.http.HttpServletRequest;

import common.CommonExecute;
import common.CommonUtil;
import dao.QnaDao;
import dto.QnaDto;

public class QnaSave implements CommonExecute {

	@Override
	public void execute(HttpServletRequest request) {
		QnaDao dao = new QnaDao();
		
		String no = dao.getQnaNo();
		String title = request.getParameter("t_title");
		title = CommonUtil.escapeHtml(title);
		
		String content = request.getParameter("t_content");
		content = CommonUtil.escapeHtml(content);
		
		String reg_id = CommonUtil.getSessionInfo(request);
		
		String reg_date = CommonUtil.getTodayTime();
		
		QnaDto dto = new QnaDto(no, title, content, reg_id, reg_date);
		
		int result = dao.qnaSave(dto);
		String msg = result == 1 ? "등록되었습니다~":"등록 실패!";
		
		request.setAttribute("t_msg", msg);
		request.setAttribute("t_url", "Qna");
	}

}
