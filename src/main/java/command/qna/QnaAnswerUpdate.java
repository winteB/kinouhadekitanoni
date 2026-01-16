package command.qna;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import common.CommonExecute;
import common.CommonUtil;
import dao.QnaDao;
import dto.QnaDto;

public class QnaAnswerUpdate implements CommonExecute {

	@Override
	public void execute(HttpServletRequest request) {
		QnaDao dao = new QnaDao();

		String no = request.getParameter("t_no");
		String answer = request.getParameter("t_answer");

		if(answer != null && !answer.equals("")) {
			answer = CommonUtil.escapeHtml(answer);
		}

		HttpSession session = request.getSession();
		String answer_id = (String)session.getAttribute("sessionName");
		String answer_date = CommonUtil.getTodayTime();

		QnaDto dto = new QnaDto(no, answer, answer_id, answer_date);

		int result = dao.getAnswerSave(dto);

		String msg = result == 1 ? "답변이 수정되었습니다." : "답변 수정 실패";

		request.setAttribute("t_msg", msg);
		request.setAttribute("t_url", "Qna");
	}
}
