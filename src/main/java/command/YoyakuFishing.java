package command;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.yoyaku.FishingPay;
import command.yoyaku.FishingtoDetail;
import common.CommonExecute;
import common.CommonUtil;

/**
 * Servlet implementation class YoyakuFishing
 */
@WebServlet("/YoyakuFishing")
public class YoyakuFishing extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public YoyakuFishing() {
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
		
		// 1. 메인 예약 달력/지도 페이지
		//여기서부터 페이지로 보내는 용도
		if(gubun.equals("main")) {

			view = "yoyaku_fishing/yoyaku_fishing_main.jsp";
		}
		
		// 2. 예약 상세 페이지 로 (이동)
		else if(gubun.equals("detail")) {
			CommonExecute yoya = new FishingtoDetail();
			yoya.execute(request);
			view = "yoyaku_fishing/yoyaku_fishing_detail.jsp";
		}
		//3. 결제하기 버튼
		else if(gubun.equals("pay")) {
			CommonExecute yoya = new FishingPay();
			yoya.execute(request);
			view = "yoyaku_camping/yoyaku_camping_detail.jsp";
		}
		
		request.setAttribute("sidemenu", "fishing");
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
