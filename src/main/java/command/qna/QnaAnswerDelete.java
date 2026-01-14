package command.qna;

import javax.servlet.http.HttpServletRequest;

import common.CommonExecute;
import dao.QnaDao;
import dto.QnaDto;

public class QnaAnswerDelete implements CommonExecute {

	@Override
	public void execute(HttpServletRequest request) {
		QnaDao dao = new QnaDao();

		String no = request.getParameter("t_no");

		QnaDto dto = new QnaDto(no, "", "", "");

		int result = dao.getAnswerSave(dto);

		String msg = result == 1 ? "답변이 삭제되었습니다." : "답변 삭제 실패";

		request.setAttribute("t_msg", msg);
		request.setAttribute("t_url", "Qna");
	}
}
