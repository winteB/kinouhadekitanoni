package command;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.qna.QnaAnswerDelete;
import command.qna.QnaAnswerSave;
import command.qna.QnaAnswerUpdate;
import command.qna.QnaDelete;
import command.qna.QnaList;
import command.qna.QnaSave;
import command.qna.QnaUpdate;
import command.qna.QnaView;
import common.CommonExecute;
import common.CommonUtil;

/**
 * Servlet implementation class Qna
 */
@WebServlet("/Qna")
public class Qna extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Qna() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");

		String view = "";
		String gubun = request.getParameter("t_gubun");
		
		//gubun 값 null/공백 처리
		if(gubun == null) {
			gubun = "";
		}
		if(gubun.equals("")) {
			gubun = "list";
		}
		
		//여기서부터 페이지로 보내는 용도
		if(gubun.equals("list")) {
			CommonExecute qna = new QnaList();
			qna.execute(request);
			view = "qna/qna_list.jsp";
			
		//qna 글쓰기
		}else if(gubun.equals("write")) {
			request.setAttribute("toDay", CommonUtil.getToday());
			
			view = "qna/qna_write.jsp";
		
		//qna 글쓰기 저장
		}else if(gubun.equals("save")) {
			CommonExecute qna = new QnaSave();
			qna.execute(request);
			
			view = "common_alert.jsp";
		
		//qna 상세보기
		}else if(gubun.equals("view")) {
			CommonExecute qna = new QnaView();
			qna.execute(request);
			
			view = "qna/qna_view.jsp";
		//qna 수정 화면
		}else if(gubun.equals("update_form")) {
			CommonExecute qna = new QnaView();
			qna.execute(request);
			view = "qna/qna_update.jsp";
		//qna 수정 저장
		}else if(gubun.equals("update_save")) {
			CommonExecute qna = new QnaUpdate();
			qna.execute(request);
			view = "common_alert.jsp";

		//qna 삭제
		}else if(gubun.equals("delete")) {
			CommonExecute qna = new QnaDelete();
			qna.execute(request);
			view = "common_alert.jsp";

		//qna 답변 등록
		}else if(gubun.equals("answer_save")) {
			CommonExecute qna = new QnaAnswerSave();
			qna.execute(request);
			view = "common_alert.jsp";

		//qna 답변 수정
		}else if(gubun.equals("answer_update")) {
			CommonExecute qna = new QnaAnswerUpdate();
			qna.execute(request);
			view = "common_alert.jsp";
		
		//qna 답변 삭제
		}else if(gubun.equals("answer_delete")) {
			CommonExecute qna = new QnaAnswerDelete();
			qna.execute(request);
			view = "common_alert.jsp";
		}
		
		RequestDispatcher rd = request.getRequestDispatcher(view);
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
