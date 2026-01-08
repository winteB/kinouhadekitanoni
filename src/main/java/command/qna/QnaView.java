package command.qna;

import javax.servlet.http.HttpServletRequest;

import common.CommonExecute;
import dao.QnaDao;
import dto.QnaDto;

public class QnaView implements CommonExecute {

    @Override
    public void execute(HttpServletRequest request) {
    	QnaDao dao = new QnaDao();
        // 1. 글 번호 받기
        String no = request.getParameter("t_no");

        // 2. 조회수 증가
        dao.setHitCount(no);

        // 3. 상세 조회 (답변 포함)
        QnaDto dto = dao.getQnaView(no);

        // 4. request에 담기
        request.setAttribute("dto", dto);
    }
}
