package command.qna;

import javax.servlet.http.HttpServletRequest;

import common.CommonExecute;
import dao.QnaDao;
import dto.QnaDto;

public class QnaView implements CommonExecute {

    @Override
    public void execute(HttpServletRequest request) {
        QnaDao dao = new QnaDao();

        String no = request.getParameter("t_no");
        String gubun = request.getParameter("t_gubun");

        if ("view".equals(gubun)) {
            int result = dao.setHitCount(no);
            if (result == 0) System.out.println("Qna 조회수 증가 오류!");

            QnaDto nextDto = dao.getNextQna(no);
            request.setAttribute("nextDto", nextDto);

            QnaDto preDto = dao.getPreQna(no);
            request.setAttribute("preDto", preDto);
        }

        QnaDto dto = dao.getQnaView(no);
        request.setAttribute("dto", dto);
    }
}
