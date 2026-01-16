package command;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.CommonUtil;
import dao.YoyakuDao;

/**
 * Servlet implementation class Paymant
 */
@WebServlet("/Paymant")
public class Paymant extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Paymant() {
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
		if(gubun == null) {
			gubun = "";
		}
		if(gubun.equals("")) {
			gubun = "main";
		}
		
		//여기서부터 페이지로 보내는 용도
		//잘못 넘어온 거면 커버 페이지로 보냄
		if(gubun.equals("main")) {

			view = "cover.jsp";
		}
		else if(gubun.equals("payAgain")) {
			//예약하러 보내기
			String orderNo       = request.getParameter("orderNo"); 
			String orderName         = request.getParameter("orderName"); 
			String customerName      = request.getParameter("customerName"); 
			String price      = request.getParameter("price"); 
			
			
			request.setAttribute("orderNo", orderNo);
			request.setAttribute("price", price);
			request.setAttribute("orderName", orderName);				
			request.setAttribute("customerName", customerName);
			request.setAttribute("successUrl", CommonUtil.getBaseUrl(request)+"/PaymantSuccessServlet");
			request.setAttribute("failUrl", CommonUtil.getBaseUrl(request)+"/PaymantFailServlet");

			view = "paymant/paymant.jsp";
		}
		else if(gubun.equals("cancle")) {
			String orderNo       = request.getParameter("orderNo"); 
			YoyakuDao dao = new YoyakuDao();
			int result = dao.setYoyakuCancle(orderNo);
			
			String msg = result==1?"예약 정보가 삭제되었습니다.":"삭제에 실패했습니다.";
			request.setAttribute("t_msg", msg);
			request.setAttribute("t_url", "Member");
			request.setAttribute("t_gubun", "myyoyaku");
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
