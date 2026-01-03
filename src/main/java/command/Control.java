package command;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.CommonExecute;

/**
 * Servlet implementation class Control
 */
@WebServlet("/Control")
public class Control extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Control() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");

		String view = "";
		String gubun = request.getParameter("gubun");
		
//		ControlDAO dao=new ControlDAO();
		
		//gubun 값 null/공백 처리
		if(gubun == null) {
			gubun = "";
		}
		if(gubun.equals("")){
			gubun="desh";
		}
		
		//여기서부터 페이지로 보내는 용도

		if(gubun.equals("desh")) {
			
			view="/control/Administration_main.jsp";
		}
		//여기서부터 페이지로 보내는 용도
		if(gubun.equals("user")) {

			view="/control/Administration_Membership.jsp";
		}
		else if(gubun.equals("sell")) {

			view="/control/Administration_sales.jsp";
		}
		else if(gubun.equals("reservation")) {

			view="/control/Administration_reservations.jsp";
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
