package command.qna;

import javax.servlet.http.HttpServletRequest;

import common.CommonExecute;
import common.CommonUtil;
import dao.QnaDao;
import dto.QnaDto;

public class QnaUpdate implements CommonExecute {

	@Override
	public void execute(HttpServletRequest request) {

		QnaDao dao = new QnaDao();

		String no = request.getParameter("t_no");
		String title = request.getParameter("t_title");
		String content = request.getParameter("t_content");

		if(title != null && !title.equals("")) {
			title = CommonUtil.escapeHtml(title);
		}

		if(content != null && !content.equals("")) {
			content = CommonUtil.escapeHtml(content);
		}

		QnaDto dto = new QnaDto(no, title, content);

		int result = dao.qnaUpdate(dto);

		String msg = result == 1 ? "수정되었습니다." : "수정 실패";

		request.setAttribute("t_msg", msg);
		request.setAttribute("t_url", "Qna");
	}
}
