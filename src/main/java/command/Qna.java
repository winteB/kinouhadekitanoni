package command;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
			gubun = "faq_list";
		}
		
		//여기서부터 페이지로 보내는 용도
		if(gubun.equals("faq_list")) {

			view = "qna/faq_list.jsp";
		}
		else if(gubun.equals("faq_view")) {

			view = "qna/faq_view.jsp";
		}else if(gubun.equals("faq_write")) {

			view = "qna/faq_write.jsp";
		}else if(gubun.equals("faq_update")) {

			view = "qna/faq_update.jsp";
		}
		
		else if(gubun.equals("qna_list")) {

			view = "qna/qna_list.jsp";
		}else if(gubun.equals("qna_view")) {

			view = "qna/qna_view.jsp";
		}else if(gubun.equals("qna_write")) {

			view = "qna/qna_write.jsp";
		}else if(gubun.equals("qna_update")) {

			view = "qna/qna_update.jsp";
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
