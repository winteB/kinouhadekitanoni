package command;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.yoyaku.CampingPay;
import command.yoyaku.CampingtoDetail;
import common.CommonExecute;
import common.CommonUtil;

/**
 * Servlet implementation class YoyakuCamping
 */
@WebServlet("/YoyakuCamping")
public class YoyakuCamping extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public YoyakuCamping() {
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
			gubun = "main";
		}
		
		//여기서부터 페이지로 보내는 용도
		if(gubun.equals("main")) {

			view = "yoyaku_camping/yoyaku_camping_main.jsp";
		}
		else if(gubun.equals("detail")) {
			CommonExecute yoya = new CampingtoDetail();
			yoya.execute(request);
			view = "yoyaku_camping/yoyaku_camping_detail.jsp";
		}
		//결제하기 버튼
		else if(gubun.equals("pay")) {
			CommonExecute yoya = new CampingPay();
			yoya.execute(request);
			view = "paymant/paymant.jsp";
		}
		
		System.out.println("view = " + view);
		request.setAttribute("sidemenu", "camping");
		if(CommonUtil.getSessionInfo(request)==null) {
			view = "Member";
		}else if(CommonUtil.getSessionInfo(request).equals("")){
			view = "Member";
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
