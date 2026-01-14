package command.qna;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import common.CommonExecute;
import common.CommonUtil;
import dao.QnaDao;
import dto.QnaDto;

public class QnaAnswerSave implements CommonExecute {

	@Override
	public void execute(HttpServletRequest request) {
		String no = request.getParameter("t_no");
        String answer = request.getParameter("t_answer");

        if (answer != null && !answer.equals("")) {
            answer = CommonUtil.escapeHtml(answer);
        }

        HttpSession session = request.getSession();
        String answer_id = (String)session.getAttribute("sessionName");

        String answer_date = "";
        if (answer != null && !answer.equals("")) {
            answer_date = CommonUtil.getTodayTime();
        } else {
            answer_id = "";
        }

        QnaDto dto = new QnaDto(no, answer, answer_id, answer_date);

        QnaDao dao = new QnaDao();
        int result = dao.getAnswerSave(dto);

        String msg = "";
        if (answer == null || answer.equals("")) {
            msg = result == 1 ? "답변 삭제를 성공하였습니다~" : "답변 삭제를 실패했습니다!";
        } else {
            msg = result == 1 ? "답변 등록 성공하였습니다~" : "답변 등록 실패했습니다!";
        }

        request.setAttribute("msg", msg);
        request.setAttribute("t_no", no);
	}

}
