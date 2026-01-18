package command;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.notice.NoticeDelete;
import command.notice.NoticeList;
import command.notice.NoticeSave;
import command.notice.NoticeUpdate;
import command.notice.NoticeView;
import common.CommonExecute;
import common.CommonUtil;

/**
 * Servlet implementation class Notice
 */
@WebServlet("/Notice")
public class Notice extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Notice() {
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
			CommonExecute noti = new NoticeList();
			noti.execute(request);
			
			view = "notice/notice_list.jsp";
		//공지사항 글쓰기
		}else if(gubun.equals("write")) {
			request.setAttribute("toDay", CommonUtil.getToday());
			
			view = "notice/notice_write.jsp";
		
		//공지사항 글쓰기 저장
		}else if(gubun.equals("save")) {
			CommonExecute noti = new NoticeSave();
			noti.execute(request);
			
			view = "common_alert.jsp";
		
		//공지사항 상세보기
		}else if(gubun.equals("view")) {
			CommonExecute noti = new NoticeView();
			noti.execute(request);
			
			view = "notice/notice_view.jsp";
			
		//수정 폼
		}else if(gubun.equals("updateForm")) {
			CommonExecute noti = new NoticeView();
			noti.execute(request);
			
			view = "notice/notice_update.jsp";
			
		//수정 저장
		}else if(gubun.equals("update")) {
			CommonExecute noti = new NoticeUpdate();
			noti.execute(request);
			
			view = "common_alert_view.jsp";
		//삭제
		}else if(gubun.equals("delete")) {
			CommonExecute noti = new NoticeDelete();
			noti.execute(request);
			
			view = "common_alert_view.jsp";
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
